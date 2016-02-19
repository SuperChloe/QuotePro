//
//  QuoteView.swift
//  QuotePro
//
//  Created by Chloe on 2016-02-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

import UIKit

class QuoteView: UIView {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    func setupWithQuote(quote: Quote) {
        if let imageData = quote.quotePhoto?.image {
            photoView.image = UIImage(data: imageData)
        }
        quoteLabel.text = quote.quoteText
        authorLabel.text = quote.quoteAuthor
    }
}
