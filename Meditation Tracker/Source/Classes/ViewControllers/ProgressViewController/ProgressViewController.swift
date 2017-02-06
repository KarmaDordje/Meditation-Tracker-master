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
        let imageView = progressImageViewUI
        if count <= 2999 {
            imageView?.image = #imageLiteral(resourceName: "start")
        } else if count > 3000 {
            imageView?.image = #imageLiteral(resourceName: "midle")
        }

    }

    override func viewDidLoad() {

        super.viewDidLoad()
    }

}
