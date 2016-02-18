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
    
    func generatePhoto() {
        let request = ImageRequest(URL: NSURL(string: "https://unsplash.it/300/300/?random")!)
        Nuke.taskWith(request) { response in
            let image = response.image
        }.resume()
    }
}