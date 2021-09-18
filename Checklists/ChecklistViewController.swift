//
//  ViewController.swift
//  Checklists
//
//  Created by Jimmy  on 9/16/21.
//

import UIKit

class ChecklistViewController: UITableViewController {
    /*
    var row0item = ChecklistItem()
    var row1item = ChecklistItem()
    var row2item = ChecklistItem()
    var row3item = ChecklistItem()
    var row4item = ChecklistItem()
    */
    var items = [ChecklistItem]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let item1 = ChecklistItem()
        item1.text = "walk the dog"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "brush my teech"
        item2.checked = true
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "soccer"
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "ios"
        item4.checked = true
        items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "eat ice"
        items.append(item5)
        
        let item6 = ChecklistItem()
        item6.text = "ewqwe"
        item6.checked = true
        items.append(item6)
        
    }

    // MARK: - Table View Data Source
    override func tableView(
        _ tableView: UITableView, //caller is UITableView //parameter 1
        numberOfRowsInSection section: Int // parameter 2 section number
    ) -> Int { //return value
        return items.count //tells table view that we have only 1 row of data if return 1
        
    }
    
    override func tableView( //this method name is cellForRowAt
        //this method is where you would put row data into the cell and return it
        //method signatures: tableView(_:cellForRowAt:)
        _ tableView: UITableView, //parameter 1
        cellForRowAt indexPath: IndexPath // parameter 2
    ) -> UITableViewCell { // return value
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let item = items[indexPath.row]
        
        
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
    }
    
    // MARK: - Table View Delegate
    //gets called whenever the user taps on a cell
    override func tableView(
        _ tableView: UITableView, //parameter 1
        didSelectRowAt indexPath: IndexPath //parameter 2
    ) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.checked.toggle()
            //calls this method to update the view
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //sets accessory, does not toggle, forexample, the checkmarks are originally set to false in the instance variables. this method helps display them at the very beginning accurately
    func configureCheckmark(
        for cell: UITableViewCell,
        with item: ChecklistItem
    ) {
        
        
        if item.checked {
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }
    }
    
    func configureText(
        for cell: UITableViewCell,
        with item: ChecklistItem
    
    ) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    
}

