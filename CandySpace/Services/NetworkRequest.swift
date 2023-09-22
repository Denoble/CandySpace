//
//  NetworkRequest.swift
//  CandySpace
//
//  Created by Amali Krigger on 9/21/23.
//

import Foundation

struct NetworkRequest: Requestable {
    var baseUrl: String
    var apiKey: URLQueryItem
    var path: String
    var params: [URLQueryItem]
    var type: RequestType
    var headers: [String: String]
}
