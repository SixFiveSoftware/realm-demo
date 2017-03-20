//
//  TaskList.swift
//  RealmTasks
//
//  Created by BJ Miller on 3/19/17.
//  Copyright © 2017 BJ Miller. All rights reserved.
//

import Foundation
import RealmSwift

final class TaskList: Object {
  dynamic var text = ""
  dynamic var id = ""
  
  let items = List<Task>()
  
  override static func primaryKey() -> String? {
    return "id"
  }
}
