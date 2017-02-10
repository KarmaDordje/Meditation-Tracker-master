//
//  PredictionViewController.swift
//  Meditation Tracker
//
//  Created by MACBOOK on 22.01.17.
//  Copyright © 2017 MACBOOK. All rights reserved.
//

import UIKit

class PredictionViewController: UIViewController, UITextFieldDelegate {

    let date = PredictionDate()

    @IBOutlet weak var targetAmountLabel: UILabel!
    @IBOutlet weak var currentAmountLabel: UILabel!
    @IBOutlet weak var finistAtDateLabel: UILabel!
    @IBOutlet weak var daysRemainingLabel: UILabel!
    @IBOutlet weak var dailyAmountTextField: UITextField!
    @IBOutlet weak var nameOfMeditationLabel: UILabel!
    @IBOutlet weak var enebleCalculateButton: UIButton!

    override func viewDidLoad() {

        super.viewDidLoad()
        
        let imageView = UIImageView(frame: self.view.frame)
        let image = UIImage(named: "PredictionViewController")!
        imageView.image = image
        self.view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)

        dailyAmountTextField.delegate = self
        let currentMeditation = (self.tabBarController as? MeditationTabBarController)?.currentMeditation
        targetAmountLabel.text = String(describing: currentMeditation!.targetAmount)
        currentAmountLabel.text = String(describing: currentMeditation!.count)
        nameOfMeditationLabel.text = currentMeditation?.name
    }

    // MARK: UITextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }

    // MARK: Actions 

    @IBAction func calculateFinishDateButton(_ sender: UIButton) {
        if Int(dailyAmountTextField.text!) == nil {
            let alert = UIAlertController(title: "Error", message: "Enter dayli amount", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            dailyAmountTextField.text = ""

        } else {
            dailyAmountTextField.resignFirstResponder()

            let currentMeditation = (self.tabBarController as? MeditationTabBarController)?.currentMeditation
            let days = date.calculateDate(targetAmount: 111111, currentAmount: currentMeditation!.count, dailyAmount: Int(dailyAmountTextField.text!)!)
            daysRemainingLabel.text = "\(days) days"
            let finishDate = date.predicateDate(count: days)
            finistAtDateLabel.text = finishDate
        }

    }

}
