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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let quoteView = NSBundle.mainBundle().loadNibNamed("QuoteView", owner: nil, options: nil).first! as! QuoteView
        quoteView.frame.size = previewView.frame.size
        previewView.addSubview(quoteView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
