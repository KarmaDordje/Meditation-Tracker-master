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
        ChengingProgressImage.setProgressImage(count: (currentMeditation?.count)!,
                                               imageView: progressImageViewUI)

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
