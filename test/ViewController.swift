//
//  PersonalData.swift
//  test
//
//  Created by Дмитрий Балантаев on 27.02.2022.
//

import UIKit
import SnapKit

protocol ViewControllerDelegate: AnyObject {
    func add()
}

class ViewController: UIViewController {
    
    weak var delegate: ViewControllerDelegate?
    
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

        let nameTextField = UITextField()
        nameTextField.placeholder = "Имя"
        nameTextField.borderStyle = .roundedRect
        view.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(personalData.snp.bottom).offset(20)
            make.left.equalTo(20)
            make.height.equalTo(60)
            make.width.equalToSuperview().inset(20)
        }

        let ageTextField = UITextField()
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
        addChildren.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        let pd = TableViewController()
         self.addChild(pd)
         view.addSubview(pd.view)
         pd.willMove(toParent:self)
        pd.view.snp.makeConstraints { make in
            make.top.equalTo(addChildren.snp.bottom).offset(20)
            make.height.equalTo(500)
            make.width.equalToSuperview()
        }
        
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
    
    @objc func buttonPressed() {
        delegate?.add()
        print("buttonPressed")
        TableViewController().add()
        }
    
    @objc func cleanAll() {
        let alertController = UIAlertController(title: "Удалить все", message: "Очистить все данные?", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Отмена", style: .cancel) { action in
        }
        alertController.addAction(cancel)
        let yes = UIAlertAction(title: "Очистить", style: .default) { action in
            TableViewController().tagCell.removeAll()
        }
        alertController.addAction(yes)
        self.present(alertController, animated: true, completion: nil)
    }
}
