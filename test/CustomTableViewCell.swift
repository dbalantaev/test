//
//  CustomTableViewCell.swift
//  test
//
//  Created by Дмитрий Балантаев on 19.02.2022.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {

    let NameTF: UITextField = {
        let nameTextField = UITextField()
        nameTextField.placeholder = "Имя"
        nameTextField.borderStyle = .roundedRect
        return nameTextField
    }()
    
    let AgeTF: UITextField = {
        let ageTextField = UITextField()
        ageTextField.placeholder = "Возраст"
        ageTextField.borderStyle = .roundedRect
        return ageTextField
    }()
    
     let delete: UIButton = {
        let dlt = UIButton(type: .system)
        dlt.setTitle("Удалить", for: .normal)
        dlt.setTitleColor(UIColor(red: 57/255, green: 171/255, blue: 251/255, alpha: 1), for: .normal)
        return dlt
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(NameTF)
        NameTF.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.height.equalTo(60)
            make.width.equalTo(200)
        }
        contentView.addSubview(AgeTF)
        AgeTF.snp.makeConstraints { make in
            make.top.equalTo(NameTF.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(20)
            make.height.equalTo(60)
            make.width.equalTo(200)
        }
        contentView.addSubview(delete)
        delete.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(50)
            make.width.equalTo(100)
            make.height.equalTo(60)
        }
        
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


