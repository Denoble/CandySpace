//
//  Model.swift
//  CandySpace
//
//  Created by Uche Godfrey on 9/17/23.
//

import Foundation


struct Gallery: Decodable {

    let total : Int?
    let totalHits : Int?
    let hits : [Hits]?
}

typealias HitArrays = [Hits]
struct Hits: Decodable {
        let id : Int?
        let pageURL : String?
        let type : String?
        let tags : String?
        let previewURL : String?
        let previewWidth : Int?
        let previewHeight : Int?
        let webformatURL : String?
        let webformatWidth : Int?
        let webformatHeight : Int?
        let largeImageURL : String?
        let imageWidth : Int?
        let imageHeight : Int?
        let imageSize : Int?
        let views : Int?
        let downloads : Int?
        let collections : Int?
        let likes : Int?
        let comments : Int?
        let userId : Int?
        let user : String?
        let userImageURL : String?
    }

