//
//  ModelTableViewCell.swift
//  MVVMParsingJson
//
//  Created by velcharan sridhar on 09/01/22.
//

import UIKit

class ModelTableViewCell: UITableViewCell {

    @IBOutlet weak var TB_label_one: UILabel!
    @IBOutlet weak var TB_label_two: UILabel!
    
    var courseCell: MyCourse? {
        didSet {
           setData()
        }
    }
    
    var faqCell: Faq? {
        didSet {
            setData()
        }
    }
    
    func setData() {
        TB_label_one.text = faqCell?.question
        TB_label_two.text = faqCell?.added_date
    }
}
