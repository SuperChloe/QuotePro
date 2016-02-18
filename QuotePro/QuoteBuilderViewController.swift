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
    var quoteView: QuoteView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quoteView = NSBundle.mainBundle().loadNibNamed("QuoteView", owner: nil, options: nil).first! as? QuoteView
        quoteView?.frame.size = previewView.frame.size
        previewView.addSubview(quoteView!)
        
        newQuote()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Buttons
    
    @IBAction func randomImage(sender: UIButton) {
        PhotoService.generatePhoto({ [weak self] (photo: UIImage) in
            print(photo)
            
            self?.quote.quotePhoto?.image = NSData(data: UIImageJPEGRepresentation(photo, 1.0)!)
            
            self?.reset()
        })
    }
    
    @IBAction func randomQuote(sender: UIButton) {
        QuoteService.generateQuote({ [weak self] (quoteText: String, quoteAuthor: String) in
            print("First quote")
            print(quoteText)
            print(quoteAuthor)
            
            self?.quote.quoteText = quoteText
            self?.quote.quoteAuthor = quoteAuthor
            
            self?.reset()
        })
    }
    
    @IBAction func save(sender: UIButton) {
        // Save to Realm
    }
    
    // MARK: Helper methods
    
    func newQuote() {
        PhotoService.generatePhoto({ [weak self] (photo: UIImage) in
            print(photo)
            
            self?.quote.quotePhoto = Photo()
            self?.quote.quotePhoto?.image = NSData(data: UIImageJPEGRepresentation(photo, 1.0)!)
            
            let e = self?.quote.quotePhoto
            let d = self?.quote.quotePhoto?.image
            
            self?.reset()
        })
        
        QuoteService.generateQuote({ [weak self] (quoteText: String, quoteAuthor: String) in
            print("First quote")
            print(quoteText)
            print(quoteAuthor)
            
            self?.quote.quoteText = quoteText
            self?.quote.quoteAuthor = quoteAuthor
            
            self?.reset()
        })
    }
    
    func reset() {
        dispatch_async(dispatch_get_main_queue(), {
            self.quoteView?.setupWithQuote(self.quote)
        })
    }
}
