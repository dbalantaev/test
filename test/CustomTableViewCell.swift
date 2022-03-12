//
//  CustomTableViewCell.swift
//  test
//
//  Created by Дмитрий Балантаев on 19.02.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var ageTF: UITextField!
    
    @IBOutlet weak var deleteRowBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameTF.borderStyle = .roundedRect
        ageTF.borderStyle = .roundedRect
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}


