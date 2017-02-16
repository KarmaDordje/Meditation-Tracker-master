//
//  ChengingProgressImage.swift
//  Meditation Tracker
//
//  Created by MACBOOK on 14.02.17.
//  Copyright © 2017 MACBOOK. All rights reserved.
//

import Foundation
import UIKit

class ChengingProgressImage {
    
    class func setProgressImage(count: Int, imageView: UIImageView? ) {
      
        if count <= 0 {
            imageView?.image = #imageLiteral(resourceName: "progressStart")
        } else if count <= 10000 {
            imageView?.image = #imageLiteral(resourceName: "progressImag1")
        } else if count < 20000 {
            imageView?.image = #imageLiteral(resourceName: "progressImag2")
        } else if count < 30000 {
            imageView?.image = #imageLiteral(resourceName: "progressImg3")
        } else if count < 40000 {
            imageView?.image = #imageLiteral(resourceName: "progressImg4")
        } else if count < 50000 {
            imageView?.image = #imageLiteral(resourceName: "progressImg5")
        } else if count < 60000 {
            imageView?.image = #imageLiteral(resourceName: "progressImg6")
        } else if count < 70000 {
            imageView?.image = #imageLiteral(resourceName: "progressImg7")
        } else if count < 80000 {
            imageView?.image = #imageLiteral(resourceName: "progressImg8")
        } else if count < 90000 {
            imageView?.image = #imageLiteral(resourceName: "progressImg9")
        } else if count < 100000 {
            imageView?.image = #imageLiteral(resourceName: "progressImg10")
        } else if count <= 111111 {
            imageView?.image = #imageLiteral(resourceName: "progressImg11")
        }
    }
}
