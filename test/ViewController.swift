//
//  ViewController.swift
//  test
//
//  Created by Дмитрий Балантаев on 19.02.2022.
//

import SnapKit
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        let personalData = UILabel()
        personalData.text = "Персональные данные"
        personalData.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(personalData)
        personalData.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(80)
        }
        
        let nameTextField = UITextField()
        nameTextField.placeholder = "Имя"
        nameTextField.borderStyle = .roundedRect
        view.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(personalData.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(60)
            
        }
        
        let ageTextField = UITextField()
        ageTextField.placeholder = "Возраст"
        ageTextField.borderStyle = .roundedRect
        view.addSubview(ageTextField)
        ageTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(60)
            
        }
        
        let children = UILabel()
        children.text = "Дети (макс.5)"
        children.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(children)
        children.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.top.equalTo(ageTextField.snp.bottom).offset(30)
        }
        
        let addChild = UIButton(type: .system)
        addChild.setTitle("+", for: .normal)
        addChild.setTitleColor(UIColor(red: 57/255, green: 171/255, blue: 251/255, alpha: 1), for: .normal)
        addChild.layer.cornerRadius = 25
        addChild.layer.borderWidth = 2
        addChild.layer.borderColor = CGColor(red: 57/255, green: 171/255, blue: 251/255, alpha: 1)
        view.addSubview(addChild)
        addChild.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(20)
            make.top.equalTo(ageTextField.snp.bottom).offset(20)
            make.width.equalTo(220)
            make.height.equalTo(50)
        }
        addChild.addTarget(self, action: #selector(AddChld), for: .touchUpInside)
        
        let tableChildren = UITableView()
        view.addSubview(tableChildren)
        tableChildren.snp.makeConstraints { make in
            make.top.equalTo(addChild.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(400)
        }
        tableChildren.dataSource = self
        tableChildren.delegate = self
//        tableChildren.reloadData()
        tableChildren.register(CustomTableViewCell.self, forCellReuseIdentifier: "text")
//        tableChildren.tableFooterView = UIView()
        
        let clean = UIButton(type: .system)
        clean.setTitle("Очистить", for: .normal)
        clean.setTitleColor(UIColor(red: 216/255, green: 63/255, blue: 42/255, alpha: 1), for: .normal)
        clean.layer.cornerRadius = 25
        clean.layer.borderWidth = 2
        clean.layer.borderColor = CGColor(red: 216/255, green: 63/255, blue: 42/255, alpha: 1)
        view.addSubview(clean)
        clean.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(tableChildren.snp.bottom).offset(20)
            make.width.equalTo(220)
            make.height.equalTo(50)
        }
//        clean.addTarget(self, action: #selector(cleanButton), for: .touchUpInside)
           
    }
    
//    var numberOfRows = 2
    
    
    var items = ["Item 1"]
    @objc private func AddChld() {
        items.append("Item \(items.count + 1)")
        
        _ = NSIndexPath(row: items.count - 1, section: 0)
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "text", for: indexPath) as! CustomTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
