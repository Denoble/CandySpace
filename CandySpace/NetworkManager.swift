//
//  NetworkManager.swift
//  CandySpace
//
//  Created by Uche Godfrey on 9/17/23.
//

import Foundation
import UIKit

struct UrlStruct{
    let schoolUrl = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    let satUrl = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
}
class NetworkManager : NetworkManagerHelper {
    
       public func taskForGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type) async throws -> ResponseType {
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let (data, response) = try await session.data(for: request)
        let jsonDecoder = JSONDecoder()
        let result = try jsonDecoder.decode(ResponseType.self, from: data)
        return result
    }
    public  func handleLoadImageUrl(url:URL, imageView:UIImageView) async throws{
        
        let session = URLSession.shared
        let request = URLRequest(url:url)
        let (data,response) =     try await session.data(for:request)
        let downloadedImage = UIImage(data: data)
        DispatchQueue.main.async {
            imageView.image = downloadedImage
        }
        
    }
}

protocol NetworkManagerHelper{
    func taskForGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type) async throws -> ResponseType
}

