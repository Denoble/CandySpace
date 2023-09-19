//
//  NetworkManager.swift
//  CandySpace
//
//  Created by Uche Godfrey on 9/17/23.
//

import Foundation
import UIKit

import UIKit
//swiftlint:disable all
struct CandySpaceURL{
    let baseURL = URL(string: "https://pixabay.com/api/?key=13197033-03eec42c293d2323112b4cca6")
    let searchParameter:String
    //let apiKey = URLQueryItem(name: "key", value: "​13197033-03eec42c293d2323112b4cca6")
    var q = URLQueryItem(name:"q", value:"blue+flowers")
    let imageType = URLQueryItem(name: "image_type", value: "photo")
    let pretty =  URLQueryItem(name: "pretty", value:"true")
    let defaultUrlString = "https://pixabay.com/api/?key=13197033-03eec42c293d2323112b4cca6&q=dog+flowers&image_type=photo&pretty=true"
    init(searchParameter:String){
        self.searchParameter = searchParameter
         q = URLQueryItem(name: "q", value:self.searchParameter+"+flowers")
    }
   
    var galleryurl:URL? {
        guard let url = baseURL?.appending(queryItems: [
            q,
            imageType,
            pretty
        ]) else { return nil}

     return url
 
        
       
    }
}
class NetworkManager: NetworkManagerHelper {
    public func taskForGETRequest<ResponseType: Decodable>
    (url: URL, responseType: ResponseType.Type) async throws -> ResponseType {
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let (data, response) = try await session.data(for: request)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try jsonDecoder.decode(ResponseType.self, from: data)
        return result
    }
    public  func handleLoadImageUrl(url: URL, imageView:UIImageView) async throws{
        
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
//swiftlint:enable all

extension URL {
    /// Returns a new URL by adding the query items, or nil if the URL doesn't support it.
    /// URL must conform to RFC 3986.
    func appending(_ queryItems: [URLQueryItem]) -> URL? {
        guard var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            // URL is not conforming to RFC 3986 (maybe it is only conforming to RFC 1808, RFC 1738, and RFC 2732)
            return nil
        }
        // append the query items to the existing ones
        urlComponents.queryItems = (urlComponents.queryItems ?? []) + queryItems

        // return the url from new url components
        return urlComponents.url
    }
}
