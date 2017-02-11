//
//  ViewController.swift
//  Meditation Tracker
//
//  Created by MACBOOK on 20.12.16.
//  Copyright © 2016 MACBOOK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var saveData: Meditation!
    var data = MeditationData()
    
    var malasStep = 0

    @IBOutlet weak var imageForMeditationUIImage: UIImageView!
    @IBOutlet weak var nameOfmeditationLableUI: UILabel!
    @IBOutlet weak var countOfmeditationLabelUI: UILabel!
    @IBOutlet weak var malasStepButtonUI: UIButton!

    var totalCount = 0

    @IBOutlet weak var meditationViewController: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: self.view.frame)
        let backgroundImage = UIImage(named: "ViewController")!
        imageView.image = backgroundImage
        self.view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        
        let currentMeditation = (self.tabBarController as? MeditationTabBarController)?.currentMeditation
        let image = data.loadMeditationImags(imageName: (currentMeditation?.imageName)!)
        self.nameOfmeditationLableUI.text = currentMeditation?.name
        self.countOfmeditationLabelUI.text = String(describing: currentMeditation!.count)
        self.imageForMeditationUIImage.image = image
        self.malasStepButtonUI.setTitle(String(describing: currentMeditation!.malasStep), for: .normal)
        self.malasStep = (currentMeditation?.malasStep)!
        
        totalCount = currentMeditation!.count
        }

    // MARK: Actions
    @IBAction func add108(_ sender: UIButton) {

        totalCount += malasStep

        countOfmeditationLabelUI.text = String(totalCount)

        do {
            try realm.write {
                saveData.count = totalCount

                realm.add(saveData, update: true)
            }

        } catch {
            print(error)
        }
    }

    @IBAction func addMore(_ sender: UIButton) {

        let alert = UIAlertController(title: "Add more", message: "Enter a count", preferredStyle: .alert)
        alert.addTextField { (_) in
            }

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {[weak alert] (_) in
            let textField = alert?.textFields?[0]

            self.totalCount += Int((textField?.text)!)!
            self.countOfmeditationLabelUI.text = String(self.totalCount)
            do {
                try realm.write {
                    self.saveData.count = self.totalCount
                    realm.add(self.saveData)}
                } catch let error {
                    print(error)
                }

        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }

}
