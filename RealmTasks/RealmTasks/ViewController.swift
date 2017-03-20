//
//  ViewController.swift
//  RealmTasks
//
//  Created by BJ Miller on 3/18/17.
//  Copyright © 2017 BJ Miller. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UITableViewController {

  var items = List<Task>()
  var realm: Realm?

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    
    realm = try? Realm()
    print("realm url: \(realm?.configuration.fileURL?.absoluteString)")
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
  }
  
  func setupUI() {
    title = "My Tasks"
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
  
  // MARK: Functions
  
  func add() {
    let alertController = UIAlertController(title: "New Task", message: "Enter Task Name", preferredStyle: .alert)
    var alertTextField: UITextField!
    alertController.addTextField { textField in
      alertTextField = textField
      textField.placeholder = "Task Name"
    }
    alertController.addAction(UIAlertAction(title: "Add", style: .default) { _ in
      guard let text = alertTextField.text, !text.isEmpty else { return }
      
//      self.items.append(Task(value: ["text": text]))
      let task = Task(value: ["text": text])
      try! self.realm?.write {
        self.realm?.add(task)
      }
      self.tableView.reloadData()
    })
    present(alertController, animated: true, completion: nil)
  }
  
  // MARK: UITableView
  
  override func tableView(_ tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let item = items[indexPath.row]
    cell.textLabel?.text = item.text
    cell.textLabel?.alpha = item.completed ? 0.5 : 1
    return cell
  }
}
