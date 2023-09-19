//
//  GalleryViewModel.swift
//  CandySpace
//
//  Created by Uche Godfrey on 9/17/23.
//

import Foundation
class GalleryViewModel {
    let networkManager: NetworkManagerHelper
    init(initNetworkManager: NetworkManagerHelper) {
        networkManager = initNetworkManager
    }
  lazy  var hitsArray = HitArrays()

    func getImageGallery(searchParameter: String) async {
        guard let url = CandySpaceURL.getGalleryurl(query: searchParameter) else {
            return }
        do {
            let gallery = try await networkManager.taskForGETRequest(url: url, responseType: Gallery.self)
            hitsArray = gallery.hits ?? HitArrays()
        } catch {
            print(String(describing: error))
        }
    }
}
