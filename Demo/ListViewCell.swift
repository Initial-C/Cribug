//
//  ListViewCell.swift
//  Example
//
//  Created by InitialC on 2018/7/30.
//  Copyright © 2018年 InitialC. All rights reserved.
//

import UIKit

class ListViewCell: UITableViewCell {

    @IBOutlet weak var URLStringLabel: UILabel!
    
    var downloadClosure: ((ListViewCell) -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func download(_ sender: Any) {
        downloadClosure?(self)
    }
}
