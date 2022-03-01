//
//  ViewController.swift
//  test
//
//  Created by Дмитрий Балантаев on 27.02.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var tagCell : [String] = []
    
    let tableView = UITableView()
    let nameTextField = UITextField()
    let ageTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let personalData = UILabel()
        personalData.text = "Персональные данные"
        personalData.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(personalData)
        personalData.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(80)
        }

        nameTextField.placeholder = "Имя"
        nameTextField.borderStyle = .roundedRect
        view.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(personalData.snp.bottom).offset(20)
            make.left.equalTo(20)
            make.height.equalTo(60)
            make.width.equalToSuperview().inset(20)
        }

        ageTextField.placeholder = "Возраст"
        ageTextField.borderStyle = .roundedRect
        view.addSubview(ageTextField)
        ageTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.left.equalTo(20)
            make.height.equalTo(60)
            make.width.equalToSuperview().inset(20)

        }

        let children = UILabel()
        children.text = "Дети (макс.5)"
        children.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(children)
        children.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(ageTextField.snp.bottom).offset(30)
        }

        let addChildren = UIButton(type: .system)
        addChildren.setTitle("+ Добавить ребенка", for: .normal)
        addChildren.setTitleColor(UIColor(red: 57/255, green: 171/255, blue: 251/255, alpha: 1), for: .normal)
        addChildren.layer.cornerRadius = 25
        addChildren.layer.borderWidth = 2
        addChildren.layer.borderColor = CGColor(red: 57/255, green: 171/255, blue: 251/255, alpha: 1)
        view.addSubview(addChildren)
        addChildren.snp.makeConstraints { make in
            make.right.equalTo(-20)
            make.top.equalTo(ageTextField.snp.bottom).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        addChildren.addTarget(self, action: #selector(addRow), for: .touchUpInside)
        if tagCell.count == 5 {
            addChildren.isHidden = true
            print("Hidden")
        }
        
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(addChildren.snp.bottom).offset(20)
            make.height.equalTo(400)
            make.width.equalToSuperview()
        }
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "text")
        tableView.delegate = self
        tableView.dataSource = self
        
        let clean = UIButton(type: .system)
        clean.setTitle("Очистить", for: .normal)
        clean.setTitleColor(UIColor(red: 216/255, green: 63/255, blue: 42/255, alpha: 1), for: .normal)
        clean.layer.cornerRadius = 25
        clean.layer.borderWidth = 2
        clean.layer.borderColor = CGColor(red: 216/255, green: 63/255, blue: 42/255, alpha: 1)
        view.addSubview(clean)
        clean.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(220)
            make.height.equalTo(50)
            }
        clean.addTarget(self, action: #selector(cleanAll), for: .touchUpInside)
    }
    
     @objc func addRow(_ sender: UIButton) {
         let asd = String(tagCell.count + 1)
         tagCell.append(asd)
         print(tagCell)
         tableView.insertRows(at: [IndexPath(row: tagCell.count - 1, section: 0)], with: .automatic)
         print("add row")
    }
    
    @objc private func deleteRow(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexpath = tableView.indexPathForRow(at: point) else {return}
        tagCell.remove(at: indexpath.row)
        tableView.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .fade)
        print(tagCell)
        print("delete row")
    }
    
    @objc func cleanAll() {
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
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tagCell.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "text", for: indexPath) as! CustomTableViewCell
        cell.delete.addTarget(self, action: #selector(deleteRow), for: .touchUpInside)
        return cell
    }
}
