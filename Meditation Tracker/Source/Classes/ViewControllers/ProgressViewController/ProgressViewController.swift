//
//  ProgressViewController.swift
//  Meditation Tracker
//
//  Created by MACBOOK on 15.01.17.
//  Copyright © 2017 MACBOOK. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {

    var currendMeditation: ViewController!

    @IBOutlet weak var selectedMeditationNameLabelUI: UILabel!
    @IBOutlet weak var progressImageViewUI: UIImageView!
    @IBOutlet weak var currenCountOfMeditationLabelUI: UILabel!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let currentMeditation = (self.tabBarController as? MeditationTabBarController)?.currentMeditation
        selectedMeditationNameLabelUI.text = currentMeditation?.name
        currenCountOfMeditationLabelUI.text = String(describing: currentMeditation!.count)
        setProgressImage(count: (currentMeditation?.count)!)

    }

    func setProgressImage(count: Int) {
        
        let progressImageView = progressImageViewUI
        if count <= 0 {
            progressImageView?.image = #imageLiteral(resourceName: "progressStart")
        } else if count <= 10000 {
            progressImageView?.image = #imageLiteral(resourceName: "progressImag1")
        } else if count < 20000 {
            progressImageView?.image = #imageLiteral(resourceName: "progressImag2")
        } else if count < 30000 {
            progressImageView?.image = #imageLiteral(resourceName: "progressImg3")
        } else if count < 40000 {
            progressImageView?.image = #imageLiteral(resourceName: "progressImg4")
        } else if count < 50000 {
            progressImageView?.image = #imageLiteral(resourceName: "progressImg5")
        } else if count < 60000 {
            progressImageView?.image = #imageLiteral(resourceName: "progressImg6")
        } else if count < 70000 {
            progressImageView?.image = #imageLiteral(resourceName: "progressImg7")
        } else if count < 80000 {
            progressImageView?.image = #imageLiteral(resourceName: "progressImg8")
        } else if count < 90000 {
            progressImageView?.image = #imageLiteral(resourceName: "progressImg9")
        } else if count < 100000 {
            progressImageView?.image = #imageLiteral(resourceName: "progressImg10")
        } else if count <= 111111 {
            progressImageView?.image = #imageLiteral(resourceName: "progressImg11")
        }




    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: self.view.frame)
        let backgroundImage = UIImage(named: "ViewController")!
        imageView.image = backgroundImage
        self.view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }

}
