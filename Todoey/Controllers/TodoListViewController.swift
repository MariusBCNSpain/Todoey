//
//  ViewController.swift
//  Todoey
//
//  Created by Marius Gabriel on 07.03.18.
//  Copyright © 2018 Marius Gabriel. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let newItem = item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
       
        let newItem2 = item()
        newItem2.title = "Buy eggs"
        itemArray.append(newItem2)
        
        let newItem3 = item()
        newItem3.title = "go biking"
        itemArray.append(newItem3)
        
        if let items = defaults.array(forKey: "TodoListArray") as? [item] {
            itemArray = items
    }
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Add new Items
    
    @IBAction func addButtonPressed(_ sender: Any) {
       
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen when the user presses Add Items
            
            let newItem = item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    

}

