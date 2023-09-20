//
//  NetworkManager.swift
//  CandySpace
//
//  Created by Uche Godfrey on 9/17/23.
//

import Foundation
struct CandySpaceURL {
    static let baseURL = URL(string: "https://pixabay.com/api/?key=13197033-03eec42c293d2323112b4cca6")
    static let imageType = URLQueryItem(name: "image_type", value: "photo")
    static let pretty =  URLQueryItem(name: "pretty", value: "true")
//    let defaultUrlString = "https://pixabay.com/api/?key=13197033-03eec42c293d2323112b4cca6&q=dog+flowers&image_type=photo&pretty=true"
    static func getGalleryurl(query: String) -> URL? {
        let query = URLQueryItem(name: "q", value: query )
        guard let url = baseURL?.appending(queryItems: [
            query,
            imageType,
            pretty
        ]) else { return nil}
//        print(url)
        return url
    }
}
class NetworkManager: NetworkManagerHelper {
    public func taskForGETRequest<ResponseType: Decodable>
    (url: URL, responseType: ResponseType.Type) async throws -> ResponseType {
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let (data, _) = try await session.data(for: request)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try jsonDecoder.decode(ResponseType.self, from: data)
        return result
    }
}

protocol NetworkManagerHelper {
    func taskForGETRequest<ResponseType: Decodable> (
        url: URL,
        responseType: ResponseType.Type
    ) async throws -> ResponseType
}

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
