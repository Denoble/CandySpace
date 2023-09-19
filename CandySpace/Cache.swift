//
//  Cache.swift
//  CandySpace
//
//  Created by Amali Krigger on 9/19/23.
//

import Foundation
import UIKit

class ImageCache {
    private let cache = NSCache<NSString, UIImage>()

    func getImage(url: String) -> UIImage? {
        return cache.object(forKey: url as NSString)
    }

    func setImage(image: UIImage?, for url: String) {
        if let image = image {
            cache.setObject(image, forKey: url as NSString)
        }
    }
}

class SearchResultCache {
    private var cache = [String: [SearchResult]]()

    func getResults(searchTerm: String) -> [SearchResult]? {
        return cache[searchTerm]
    }

    func setResults(results: [SearchResult], searchTerm: String) {
        cache[searchTerm] = results
    }
}

struct SearchResult {
    let imageUrl: String
}

//func performSearch(for searchTerm: String) {
//    // Check if results are already cached
//    if let cachedResults = SearchResultCache.shared.getResults(for: searchTerm) {
//        // Use cached results
//        displayResults(cachedResults)
//    } else {
//        // Perform the search (e.g., fetch data from a server)
//        fetchData(for: searchTerm) { results in
//            // Cache the results
//            SearchResultCache.shared.setResults(results, for: searchTerm)
//
//            // Display the results
//            displayResults(results)
//        }
//    }
//}
//
//if let imageUrl = URL(string: "https://example.com/image.jpg") {
//    if let cachedImage = ImageCache.shared.getImage(for: imageUrl.absoluteString) {
//        // Use the cached image
//        imageView.image = cachedImage
//    } else {
//        // Download the image
//        URLSession.shared.dataTask(with: imageUrl) { data, _, _ in
//            if let data = data, let image = UIImage(data: data) {
//                // Cache the downloaded image
//                ImageCache.shared.setImage(image, for: imageUrl.absoluteString)
//
//                // Set the image in UIImageView (on the main queue)
//                DispatchQueue.main.async {
//                    imageView.image = image
//                }
//            }
//        }.resume()
//    }
//}

