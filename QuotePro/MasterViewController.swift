//
//  MasterViewController.swift
//  QuotePro
//
//  Created by Chloe on 2016-02-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

import UIKit
import RealmSwift

class MasterViewController: UITableViewController {
    
    var results: Results<Quote>?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        
        results = try! Realm().objects(Quote)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results!.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> QuoteTableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? QuoteTableViewCell
        let quote = results![indexPath.row]
        cell!.previewView.contentMode = .ScaleAspectFill
        cell!.previewView.clipsToBounds = true
        cell!.previewView.image = UIImage(data: (quote.quotePhoto?.image)!)
        cell!.quoteLabel!.text = quote.quoteText
        cell!.authorLabel!.text = quote.quoteAuthor
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let quote = results![indexPath.row]
        let quoteView = NSBundle.mainBundle().loadNibNamed("QuoteView", owner: nil, options: nil).first! as? QuoteView
        quoteView!.setupWithQuote(quote)
        share(snapshot(quoteView!))
    }
    
    func snapshot(view: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
        view.drawViewHierarchyInRect(view.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func share(image: UIImage) {
        let objectsToShare = [image]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        self.presentViewController(activityVC, animated: true, completion: nil)
    }

}

