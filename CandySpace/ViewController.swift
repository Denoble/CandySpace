//
//  ViewController.swift
//  CandySpace
//
//  Created by Uche Godfrey on 9/15/23.
//

import UIKit

class ViewController: UIViewController {

    let networkManager = NetworkManager()
    let constants = CandySpaceConstant(searchParameter: "Stone")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let stringUrl = constants.galleryurl else{return}
        let viewModel = GalleryViewModel(network: networkManager, candySpceConstant: constants)
        Task{
            await viewModel.getImageGallery()
        }
        print(viewModel.candySpaceConstants.galleryurl)
    }


}


