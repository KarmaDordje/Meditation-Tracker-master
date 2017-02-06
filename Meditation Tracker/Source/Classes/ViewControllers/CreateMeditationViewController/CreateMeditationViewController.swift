//
//  CreateMeditationViewController.swift
//  Meditation Tracker
//
//  Created by MACBOOK on 16.01.17.
//  Copyright © 2017 MACBOOK. All rights reserved.
//

import UIKit
import RealmSwift

class CreateMeditationViewController: UIViewController, UIImagePickerControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var targetAmountTextField: UITextField!
    @IBOutlet weak var stepTextField: UITextField!
    @IBOutlet weak var currentAmountTextField: UITextField!

    let unwindToMeditationsSegueIdentifier = "unwindToMeditations"

       override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveMeditationButton(_ sender: UIBarButtonItem) {
        let newMeditation = Meditation()
        if (nameTextField.text?.isEmpty)! {
            newMeditation.name = "New Meditation"
        } else {
            newMeditation.name = nameTextField.text!
        }

        newMeditation.targetAmount = Int(targetAmountTextField.text!)!
        newMeditation.malasStep = Int(stepTextField.text!)!
        newMeditation.count = Int(currentAmountTextField.text!)!
        newMeditation.id = realm.objects(Meditation.self).count + 1

        // use do-catch
        do {
            try realm.write {

                realm.add(newMeditation)
            }

        } catch let error {
            print(error)
        }

        self.performSegue(withIdentifier: unwindToMeditationsSegueIdentifier, sender: self)

    }

    @IBAction func cancelCreatingNewMeditationButton(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: unwindToMeditationsSegueIdentifier, sender: self)
    }

    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
    }

}
