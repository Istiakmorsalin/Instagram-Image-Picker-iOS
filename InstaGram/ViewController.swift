//
//  ViewController.swift
//  InstaGram
//
//  Created by Istiak on 6/26/18.
//  Copyright © 2018 Sekailab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var pickImage: UIButton!
    
    @IBAction func pickImage(_ sender: Any) {
        showPicker()
    }
    
    func showPicker() {
        
        var config = YPImagePickerConfiguration()
        config.library.mediaType = .photo
        config.library.onlySquare  = false
        config.onlySquareImagesFromCamera = true
        config.targetImageSize = .original
        config.usesFrontCamera = true
        config.showsFilters = false
//        config.filters = [YPFilterDescriptor(name: "Normal", filterName: ""),
//                          YPFilterDescriptor(name: "Mono", filterName: "CIPhotoEffectMono")]
        config.shouldSaveNewPicturesToAlbum = true
        config.albumName = "MyGreatAppName"
        config.screens = [.library]
        config.startOnScreen = .library
        config.showsCrop = .rectangle(ratio: (16/9))
        config.wordings.libraryTitle = ""
        
        config.hidesStatusBar = false
        config.library.maxNumberOfItems = 1000
        
        
        let picker = YPImagePicker(configuration: config)
        
        picker.didFinishPicking { [unowned picker] items, cancelled in
            for item in items {
                switch item {
                case .photo(let photo):
                    print(photo)
                case .video(let video):
                    print(video)
                }
            }
            picker.dismiss(animated: true, completion: nil)
        }
        
        present(picker, animated: true, completion: nil)
   
    }
}

