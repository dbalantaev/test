//
//  ViewController.swift
//  test
//
//  Created by Дмитрий Балантаев on 19.02.2022.
//

import SnapKit
import UIKit

class TableViewController: UITableViewController, ViewControllerDelegate {
    @objc func add() {
        let asd = String(tagCell.count + 1)
        tagCell.append(asd)
        print(tagCell)
        tableView.insertRows(at: [IndexPath(row: tagCell.count - 1, section: 0)], with: .automatic)
        print("add row")
    }
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "text")
        
//        ViewController().delegate = self
//        tableView.register(ViewController.self, forCellReuseIdentifier: "text")
        ViewController().delegate = self
    }
    
    
    var tagCell : [String] = [""]
    
    
    @objc private func deleteRow(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexpath = tableView.indexPathForRow(at: point) else {return}
        tagCell.remove(at: indexpath.row)
        tableView.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .automatic)
        print(tagCell)
        print("delete row")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tagCell.count
    }
  
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "text", for: indexPath) as! CustomTableViewCell
        cell.delete.addTarget(self, action: #selector(deleteRow), for: .touchUpInside)
        cell.delete.tag = indexPath.row
        return cell
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
