//
//  NoteTableViewCell.swift
//  KIM_Note_FP
//
//  Created by Kritima Kukreja on 2020-06-19.
//  Copyright © 2020 S@i. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var noteNameLabel: UILabel!
    @IBOutlet weak var noteLastEditDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
