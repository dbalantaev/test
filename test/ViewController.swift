//
//  ViewController.swift
//  test
//
//  Created by Дмитрий Балантаев on 27.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var tagCell : [String] = []
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var addRowBtn: UIButton!
    
    @IBOutlet weak var cleanAllBtn: UIButton!
    
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.borderStyle = .roundedRect
        ageTextField.borderStyle = .roundedRect
        
        addRowBtn.setTitleColor(UIColor(red: 57/255, green: 171/255, blue: 251/255, alpha: 1), for: .normal)
        addRowBtn.layer.cornerRadius = 25
        addRowBtn.layer.borderWidth = 2
        addRowBtn.layer.borderColor = CGColor(red: 57/255, green: 171/255, blue: 251/255, alpha: 1)
        
        cleanAllBtn.setTitleColor(UIColor(red: 216/255, green: 63/255, blue: 42/255, alpha: 1), for: .normal)
        cleanAllBtn.layer.cornerRadius = 25
        cleanAllBtn.layer.borderWidth = 2
        cleanAllBtn.layer.borderColor = CGColor(red: 216/255, green: 63/255, blue: 42/255, alpha: 1)
        
    }
    
    
    @IBAction func addRowClick(_ sender: Any) {
        let asd = String(tagCell.count + 1)
        tagCell.append(asd)
        print(tagCell)
        tableView.insertRows(at: [IndexPath(row: tagCell.count - 1, section: 0)], with: .automatic)
        print("add row")
       if tagCell.count == 5 {
           addRowBtn.isHidden = true
       } else {
           addRowBtn.isHidden = false
       }
        
    }
    
    
    @IBAction func cleanAllClick(_ sender: Any) {
        let alertController = UIAlertController(title: "Удалить все", message: "Очистить все данные?", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Отмена", style: .cancel) { action in
        }
        alertController.addAction(cancel)
        let yes = UIAlertAction(title: "Очистить", style: .default) { action in
            self.nameTextField.text = nil
            self.ageTextField.text = nil
            self.tagCell.removeAll()
            self.tableView.reloadData()
            print(self.tagCell)
            print("All clean")
        }
        alertController.addAction(yes)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func deleteRowClick(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexpath = tableView.indexPathForRow(at: point) else {return}
        tagCell.remove(at: indexpath.row)
        tableView.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .fade)
        print(tagCell)
        print("delete row")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tagCell.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
//        cell.deleteRowBtn.addTarget(self, action: #selector(deleteRowClick), for: .touchUpInside)
        return cell
    }
}
