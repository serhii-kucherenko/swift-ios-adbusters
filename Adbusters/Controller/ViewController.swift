//
//  ViewController.swift
//  Adbusters
//
//  Created by MacBookAir on 10/15/18.
//  Copyright © 2018 MacBookAir. All rights reserved.
//

import UIKit

var currentAdsImages = [UIImage]()
var currentAdsImageUrls: [AdImage]?
var currentAdImage: UIImage?
var currentParty: String?
var currentType: String?
var currentDate: String?
var currentComment: String?
var currentLocation: String?
var currentUsername: String?
var currentUserGarlics: String?
var currentUserImage: UIImage?
var isLogged = true
var partiesList = [Party]()
var politiciansList = [Politician]()
var ads: [AdModel]?
let imageCache = NSCache<AnyObject, AnyObject>()

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

