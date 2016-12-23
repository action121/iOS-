//
//  PhotoAnnotation.swift
//  Photo Map
//
//  Created by Gunjan Deepak Raheja on 12/23/16.
//  Copyright © 2016 Gunjan D Raheja. All rights reserved.
//


import UIKit

class FullImageViewController: UIViewController {

  @IBOutlet weak var photoImageView: UIImageView!

  var selectedPhoto: UIImage?

  override func viewDidLoad() {
    super.viewDidLoad()

    if let selectedPhoto = selectedPhoto {
      photoImageView.image = selectedPhoto
    }
  }

}
