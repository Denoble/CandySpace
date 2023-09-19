//
//  GalleryViewModel.swift
//  CandySpace
//
//  Created by Uche Godfrey on 9/17/23.
//

import Foundation
let networkManager =  NetworkManager()
class GalleryViewModel{
    let  candySpaceConstants:CandySpaceURL
  lazy  var hitsArray = HitArrays()
    init(candySpceConstant:CandySpaceURL){
        self.candySpaceConstants = candySpceConstant
    }

    func getImageGallery() async {
        guard let url =  candySpaceConstants.galleryurl else{ return }
        print("URL IS \(url)")
        do{
            let gallery = try await networkManager.taskForGETRequest(url: url, responseType: Gallery.self)
            hitsArray = gallery.hits ?? HitArrays()
            print(hitsArray)
        }catch{
            print(String(describing: error))
        }
        
    }
}
//swiftlint:enable all
