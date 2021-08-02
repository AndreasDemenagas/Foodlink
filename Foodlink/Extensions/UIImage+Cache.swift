//
//  UIImage+Cache.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 2/8/21.
//

import UIKit

let cache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func loadImage(from urlString: String) {
        self.image = nil
        
        if let cachedImage = cache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error downloading image: \(error)")
                return
            }
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    cache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                }
            }
            
        }.resume()
    }
    
}
