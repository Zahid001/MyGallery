//
//  GalleryVM.swift
//  MyGallery
//
//  Created by Md Zahidul Islam Mazumder on 22/11/21.
//

import Foundation

class GalleryVM:ObservableObject {
    
    let apiEndPoint = ApiEndPoint()
    private var dataTask: URLSessionDataTask?
    
    
    @Published var imageInformations:[ImageInformation]?
    
    
    init(){
        getPhotos(completion: {_ in })
    }
    
    //  MARK:- Get Friends
    func getPhotos(completion: @escaping (Result<[ImageInformation], Error>) -> Void) {
        
        let strURL = "\(apiEndPoint.BASE_URL)\(apiEndPoint.GET_PHOTOS)"
        

        
        guard let url = URL(string: strURL) else {return}
        
        var request = URLRequest(url: url)
        
        // Set headers
        request.setValue(apiEndPoint.VALUE_JSON, forHTTPHeaderField: apiEndPoint.KEY_ACCEPT)
        request.httpMethod = "GET"
        
        // Create URL Session - work on the background
        dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
           
            
            // Handle Error
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                // Handle Empty Response
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
     //       print("Response status code: \(response.res)")
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            do {
                // Parse the data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([ImageInformation].self, from: data)
                print("\(jsonData)")
                // Back to the main thread
                DispatchQueue.main.async {
                    if(response.statusCode != 200){
                        let error = NSError(domain:"", code:response.statusCode, userInfo:[ NSLocalizedDescriptionKey: "error!"]) as Error
                        print("Response status code: \(error.localizedDescription)")
                        completion(.failure(error))
                        
                    }else{
                        
                       // DispatchQueue.main.async {
                            self.imageInformations = jsonData
                       // }
                        
                        
                        completion(.success(jsonData))
                    }
                }
            } catch let error {
                completion(.failure(error))
            }
            
        }
        dataTask?.resume()
    }
    
}
