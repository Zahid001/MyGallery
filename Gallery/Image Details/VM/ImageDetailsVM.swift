//
//  ImageDetailsVM.swift
//  MyGallery
//
//  Created by Md Zahidul Islam Mazumder on 23/11/21.
//

import Foundation
import UIKit

class ImageDetailsVM:ObservableObject {
    
    @Published var isSaved = false
    
    let imageSaver = ImageSaver()
    
    func downloadImage(from url: String) {
        if let url = URL(string: url) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                
                if let img = UIImage(data: data){
                    
//                    let withoutExt = url.deletingPathExtension()
//                    let name = withoutExt.lastPathComponent
                    
                    self.imageSaver.successHandler = {
                        print("pppppp")
                        self.isSaved = true
                    }
                    self.imageSaver.errorHandler = {_ in
                        self.isSaved = false
                    }
                    
                    self.imageSaver.writeToPhotoAlbum(image: img)
                    
                   // self.writeToPhotoAlbum(image: img)
                  //  self.store(image: img, forKey: name, withStorageType: .fileSystem)
                }
                
                
                
            }
            
            task.resume()
        }
    }
    
}


class ImageSaver: NSObject {
    
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }

    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
        
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}



