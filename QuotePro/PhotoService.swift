//
//  PhotoService.swift
//  QuotePro
//
//  Created by Chloe on 2016-02-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

import Foundation
import Nuke

struct PhotoService {
    
    static func generatePhoto(completionHandler: (UIImage) -> Void) {
        var request = ImageRequest(URL: NSURL(string: "https://unsplash.it/300/300/?random")!)
        request.memoryCacheStorageAllowed = false
        Nuke.taskWith(request) { response in
            let image = response.image
            print("GARBGE BOY")
            print(image)
            completionHandler(image!)
        }.resume()
    }
}