//
//  Cache.swift
//  ZARA
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit

final class Cache {
    static let instance = Cache()
    
    let nsCache: NSCache<NSString, UIImage>
    
    private init() {
        nsCache = NSCache<NSString, UIImage>()
    }
    
    func setObject(_ uiimage: UIImage?, for key: String) {
        guard let image = uiimage else {
            return
        }

        nsCache.setObject(image, forKey: key as NSString)
    }
    
    func getObject(for key: String) -> UIImage? {
        nsCache.object(forKey: key as NSString)
    }
}
