//
//  QuoteTableViewCell.swift
//  QuotePro
//
//  Created by Chloe on 2016-02-18.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var previewView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
