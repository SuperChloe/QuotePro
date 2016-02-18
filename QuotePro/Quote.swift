//
//  Quote.swift
//  QuotePro
//
//  Created by Chloe on 2016-02-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

import Foundation
import RealmSwift

class Quote: Object {
    
    dynamic var quoteText: String?
    dynamic var quoteAuthor: String?
    dynamic var quotePhoto: Photo?
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
