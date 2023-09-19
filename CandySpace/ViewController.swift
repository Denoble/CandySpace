//
//  ViewController.swift
//  CandySpace
//
//  Created by Uche Godfrey on 9/15/23.
//

import UIKit

class ViewController: UIViewController {

    let searchParameter =  "cars"
    let networkManager = NetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let viewModel = GalleryViewModel(initNetworkManager: networkManager)
        Task{
            await viewModel.getImageGallery(url: self.searchParameter)
            for url in viewModel.hitsArray{
                print(url.largeImageURL!)
            }
        }
    }


}


