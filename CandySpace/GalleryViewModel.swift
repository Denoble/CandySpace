//
//  GalleryViewModel.swift
//  CandySpace
//
//  Created by Uche Godfrey on 9/17/23.
//

import Foundation
class GalleryViewModel{
    let network:NetworkManagerHelper
    let  candySpaceConstants:CandySpaceConstant
  lazy  var hitsArray = HitArrays()
    init(network:NetworkManagerHelper,candySpceConstant:CandySpaceConstant){
        self.network = network
        self.candySpaceConstants = candySpceConstant
    }

    func getImageGallery() async {
        guard let url =  candySpaceConstants.galleryurl else{ return }
        print("URL IS \(url)")
        do{
            let gallery = try await self.network.taskForGETRequest(url: url, responseType: Gallery.self)
            hitsArray = gallery.hits ?? HitArrays()
            print(hitsArray)
        }catch{
            print(String(describing: error))
        }
        
    }
}
//swiftlint:enable all
