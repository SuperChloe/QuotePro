//
//  QuoteService.swift
//  QuotePro
//
//  Created by Chloe on 2016-02-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

import Foundation

struct QuoteService {
    
    var quotesArray = [String]()
    
    func generateQuote() {
        let url = NSURL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")
        let session = NSURLSession.sharedSession()
        session.dataTaskWithURL(url!, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            do {
                let jsonData: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                let quoteText = jsonData["quoteText"] as! String
                let quoteAuthor = jsonData["quoteAuthor"] as! String
                
                print("text: \(quoteText)")
                print("author: \(quoteAuthor)")
                
            } catch {
                print(error)
            }
        }).resume()
    }
}