//
//  Helpers.swift
//  Adbusters
//
//  Created by MacBookAir on 11/4/18.
//  Copyright © 2018 MacBookAir. All rights reserved.
//

import Foundation
import UIKit

func getPartiesRequest(url: String, controller: UIViewController, completion: @escaping (_ json: Parties?, _ error: Error?)->()) {
    let urlObject = URL(string: url)
    let task = URLSession.shared.dataTask(with: urlObject!) {(data, response, error) in
        do {
            let result = try JSONDecoder().decode(Parties.self, from: data!)
            //Do other things
            completion(result, error)
            print("Loaded parties")
        } catch let error {
            completion(nil, error)
        }
    }
    
    task.resume()
}


// UI

/// Extending error to make it alertable
extension Error {
    
    /// displays alert from source controller
    func alert(with controller: UIViewController, title: String = "Помилка завантаження", message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            controller.present(alertController, animated: true, completion: nil)
        }
    }
}