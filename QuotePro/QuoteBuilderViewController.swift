//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Chloe on 2016-02-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

import UIKit

class QuoteBuilderViewController: UIViewController {

    @IBOutlet var builderView: UIView!
    @IBOutlet weak var previewView: UIView!
    var quote: Quote = Quote()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        QuoteService.generateQuote({ (quoteText: String, quoteAuthor: String) in
            print("First quote")
            print(quoteText)
            print(quoteAuthor)
        })
        PhotoService.generatePhoto({ (photo: UIImage) in
            print(photo)
        })
        
        let quoteView = NSBundle.mainBundle().loadNibNamed("QuoteView", owner: nil, options: nil).first! as! QuoteView
        quoteView.frame.size = previewView.frame.size
        previewView.addSubview(quoteView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Buttons
    
    @IBAction func randomImage(sender: UIButton) {
        PhotoService.generatePhoto({ (photo: UIImage) in
            print(photo)
        })
    }
    
    @IBAction func randomQuote(sender: UIButton) {
        QuoteService.generateQuote({ (quoteText: String, quoteAuthor: String) in
            print("I got the generated quote!")
            print(quoteText)
            print(quoteAuthor)
        })
    }
    
    @IBAction func save(sender: UIButton) {
        // Save to Realm
    }

}
