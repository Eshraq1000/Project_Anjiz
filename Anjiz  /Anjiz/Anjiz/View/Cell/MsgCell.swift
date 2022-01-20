//
//  MsgCell.swift
//  Anjiz
//
//  Created by esho on 17/06/1443 AH.
//

import UIKit

class MsgCell: UITableViewCell {

    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var msg: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
