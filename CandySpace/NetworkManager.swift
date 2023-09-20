//
//  NetworkManager.swift
//  CandySpace
//
//  Created by Uche Godfrey on 9/17/23.
//

import Foundation

struct CandySpaceURL {
    static func getGalleryurl(searchTerm: String) -> URL? {
        let baseURL = URL(string: "https://pixabay.com/api/?key=13197033-03eec42c293d2323112b4cca6")
        let imageType = URLQueryItem(name: "image_type", value: "photo")
        let pretty =  URLQueryItem(name: "pretty", value: "true")
        let searchQueryItem = URLQueryItem(name: "q", value: searchTerm)
        guard let url = baseURL?.appendImageSearchParams([
            searchQueryItem,
            imageType,
            pretty
        ]) else {
            return nil
        }
        print(url)
        return url
    }
}

class NetworkManager: NetworkManagerHelper {
    public func get<T: Decodable>(url: URL, responseType: T.Type) async throws -> Result<T, Error> {
        let session = URLSession.shared
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await session.data(for: request)
            let jsonDecoder = JSONDecoder()
            print(response)
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try jsonDecoder.decode(T.self, from: data)
            return .success(result)
        } catch {
            return.failure(error)
        }
    }
}

protocol NetworkManagerHelper {
    func get<T: Decodable>(url: URL, responseType: T.Type) async throws -> Result<T, Error>
}

extension URL {
    func appendImageSearchParams(_ queryItems: [URLQueryItem]) -> URL? {
        guard var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            return nil
        }
        urlComponents.queryItems = (urlComponents.queryItems ?? []) + queryItems
        return urlComponents.url
    }
}
