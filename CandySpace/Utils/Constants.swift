//
//  Constants.swift
//  CandySpace
//
//  Created by Amali Krigger on 9/21/23.
//

import Foundation

struct Constants {
    static let baseURL = "https://pixabay.com/api/"
    static let apiKey = URLQueryItem(name: "key", value: "13197033-03eec42c293d2323112b4cca6")
    static let imageType = URLQueryItem(name: "image_type", value: "photo")
    static let quality = URLQueryItem(name: "pretty", value: "true")
}
