//
//  Cache.swift
//  CandySpace
//
//  Created by Amali Krigger on 9/19/23.
//

import Foundation
import UIKit

protocol ImageCacheHelper {
    func getImage(url: String) -> UIImage?
    func setImage(image: UIImage?, url: String)
}

protocol SearchResultCacheHelper {
    func getResults(searchTerm: String) -> [Hits]?
    func setResults(results: [Hits], searchTerm: String)
}

class ImageCache: ImageCacheHelper {
    private let cache = NSCache<NSString, UIImage>()

    func getImage(url: String) -> UIImage? {
        return cache.object(forKey: url as NSString)
    }

    func setImage(image: UIImage?, url: String) {
        if let image = image {
            cache.setObject(image, forKey: url as NSString)
        }
    }
}

class SearchResultCache: SearchResultCacheHelper {
    private var cache = [String: [Hits]]()

    func getResults(searchTerm: String) -> [Hits]? {
        return cache[searchTerm]
    }

    func setResults(results: [Hits], searchTerm: String) {
        cache[searchTerm] = results
    }
}

struct SearchResult {
    let imageUrl: String
}
