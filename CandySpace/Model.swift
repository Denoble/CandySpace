//
//  Model.swift
//  CandySpace
//
//  Created by Uche Godfrey on 9/17/23.
//

import Foundation

struct Gallery: Decodable {

  var total: Int?
  var totalHits: Int?
  var hits: [Hits]?

  enum CodingKeys: String, CodingKey {

    case total
    case totalHits
    case hits
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    total     = try values.decodeIfPresent(Int.self, forKey: .total     )
    totalHits = try values.decodeIfPresent(Int.self, forKey: .totalHits )
    hits      = try values.decodeIfPresent([Hits].self, forKey: .hits )
  }

  init() {

  }

}

struct Hits: Decodable {

  var id: Int?
  var pageURL: String?
  var type: String?
  var tags: String?
  var previewURL: String?
  var previewWidth: Int?
  var previewHeight: Int?
  var webformatURL: String?
  var webformatWidth: Int?
  var webformatHeight: Int?
  var largeImageURL: String?
  var imageWidth: Int?
  var imageHeight: Int?
  var imageSize: Int?
  var views: Int?
  var downloads: Int?
  var collections: Int?
  var likes: Int?
  var comments: Int?
  var userId: Int?
  var user: String?
  var userImageURL: String?

  enum CodingKeys: String, CodingKey {

    case id              = "id"
    case pageURL         = "pageURL"
    case type            = "type"
    case tags            = "tags"
    case previewURL      = "previewURL"
    case previewWidth    = "previewWidth"
    case previewHeight   = "previewHeight"
    case webformatURL    = "webformatURL"
    case webformatWidth  = "webformatWidth"
    case webformatHeight = "webformatHeight"
    case largeImageURL   = "largeImageURL"
    case imageWidth      = "imageWidth"
    case imageHeight     = "imageHeight"
    case imageSize       = "imageSize"
    case views           = "views"
    case downloads       = "downloads"
    case collections     = "collections"
    case likes           = "likes"
    case comments        = "comments"
    case userId          = "user_id"
    case user            = "user"
    case userImageURL    = "userImageURL"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id    = try values.decodeIfPresent(Int.self, forKey: .id )
    pageURL         = try values.decodeIfPresent(String.self, forKey: .pageURL)
    type            = try values.decodeIfPresent(String.self, forKey: .type            )
    tags            = try values.decodeIfPresent(String.self, forKey: .tags            )
    previewURL      = try values.decodeIfPresent(String.self, forKey: .previewURL      )
    previewWidth    = try values.decodeIfPresent(Int.self, forKey: .previewWidth    )
    previewHeight   = try values.decodeIfPresent(Int.self, forKey: .previewHeight   )
    webformatURL    = try values.decodeIfPresent(String.self, forKey: .webformatURL    )
    webformatWidth  = try values.decodeIfPresent(Int.self, forKey: .webformatWidth  )
    webformatHeight = try values.decodeIfPresent(Int.self, forKey: .webformatHeight )
    largeImageURL   = try values.decodeIfPresent(String.self, forKey: .largeImageURL   )
    imageWidth      = try values.decodeIfPresent(Int.self, forKey: .imageWidth      )
    imageHeight     = try values.decodeIfPresent(Int.self, forKey: .imageHeight     )
    imageSize       = try values.decodeIfPresent(Int.self, forKey: .imageSize       )
    views           = try values.decodeIfPresent(Int.self, forKey: .views           )
    downloads       = try values.decodeIfPresent(Int.self, forKey: .downloads       )
    collections     = try values.decodeIfPresent(Int.self, forKey: .collections     )
    likes           = try values.decodeIfPresent(Int.self, forKey: .likes           )
    comments        = try values.decodeIfPresent(Int.self, forKey: .comments        )
    userId          = try values.decodeIfPresent(Int.self, forKey: .userId          )
    user            = try values.decodeIfPresent(String.self, forKey: .user            )
    userImageURL    = try values.decodeIfPresent(String.self, forKey: .userImageURL    )
  }

  init() {

  }

}
