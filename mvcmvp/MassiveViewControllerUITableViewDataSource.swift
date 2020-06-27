//
//  MassiveViewControllerUITableViewDataSource.swift
//  mvcmvp
//
//  Created by Swati Rout on 27/06/20.
//  Copyright © 2020 Swati Rout. All rights reserved.
//

import Foundation
import  UIKit
extension MasterViewController{
    override func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }

       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return presenter.count
       }

       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
           if let text = presenter [indexPath.row]{
               cell.textLabel!.text = text
           }
           return cell
       }

       override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
           // Return false if you do not want the specified item to be editable.
           return true
       }

       override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               presenter.removeAt(at: indexPath.row)
               tableView.deleteRows(at: [indexPath], with: .fade)
           } else if editingStyle == .insert {
               // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
           }
       }
}
