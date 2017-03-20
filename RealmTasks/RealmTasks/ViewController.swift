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

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    
    // using init(value:) can take a hash or array. has keys match property names.
    //  this is just creating a Task and inserting it into the items List<Task>, not persisting anything yet.
    items.append(Task(value: ["text": "My First Task"]))
  }
  
  func setupUI() {
    title = "My Tasks"
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
