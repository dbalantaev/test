//
//  ViewController.swift
//  test
//
//  Created by Дмитрий Балантаев on 19.02.2022.
//

import SnapKit
import UIKit

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "text")
        
        let personalData = UILabel()
        personalData.text = "Персональные данные"
        personalData.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(personalData)
        personalData.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(180)
            make.left.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(30)
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
        addChild.setTitle("+ Добавить ребенка", for: .normal)
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
        
    }
    
    var numberOfRows = 0
    
    @objc private func AddChld(sender: UIButton) {
        numberOfRows += 1
        tableView.reloadData()
        print("add")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "text", for: indexPath) as! CustomTableViewCell
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

