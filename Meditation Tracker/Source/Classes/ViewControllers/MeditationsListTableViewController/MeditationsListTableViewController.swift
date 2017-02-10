//
//  MeditationsListTableViewController.swift
//  Meditation Tracker
//
//  Created by MACBOOK on 21.12.16.
//  Copyright © 2016 MACBOOK. All rights reserved.
//

import UIKit
import RealmSwift

class MeditationsListTableViewController: UITableViewController {

    var meditations: Results<Meditation>!

    let data = MeditationData()

    var currentCreateAction: UIAlertAction!
    @IBOutlet weak var meditationsListTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: self.view.frame)
        let image = UIImage(named: "TableView")!
        imageView.image = image
        self.view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
        
        readMeditationsAndUpdateUI()
        if meditations.count == 0 {
            data.creadStaticMeditations()
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        readMeditationsAndUpdateUI()
    }

    func readMeditationsAndUpdateUI() {
        meditations = realm.objects(Meditation.self)

        self.meditationsListTableView.setEditing(false, animated: true)
        self.meditationsListTableView.reloadData()
    }

    func listNameFieldDidChange(_ textField: UITextField) {
        self.currentCreateAction.isEnabled = (textField.text?.characters.count)! > 0
    }

    func displayAlertToEditMeditationsList (_ updatedMeditation: Meditation!) {
        let alertController = UIAlertController(title: title, message: "Edit your meditation data", preferredStyle: UIAlertControllerStyle.alert)
        let createAction = UIAlertAction(title: "Edit", style: UIAlertActionStyle.default) { (_) -> Void in

            let targetAmount = alertController.textFields?[0].text
            let currentAmount = alertController.textFields?[1].text
            let malasStep = alertController.textFields?[2].text

            if updatedMeditation != nil {
                // update mode

                do {
                    try realm.write {
                        updatedMeditation.targetAmount = Int(targetAmount!)!
                        updatedMeditation.count = Int(currentAmount!)!
                        updatedMeditation.malasStep = Int(malasStep!)!
                        self.readMeditationsAndUpdateUI() }
                } catch let error {
                    print(error)
                }
            }
        }

        alertController.addTextField { (textField: UITextField!) -> Void in
            textField.placeholder = "Enter your target amount"

        }
        alertController.addTextField { (textField: UITextField!) -> Void in
            textField.placeholder = "Enter your current target amount"

        }
        alertController.addTextField { (textField: UITextField!) -> Void in
            textField.placeholder = "Enter your mala's step"
            textField.addTarget(self, action: #selector(MeditationsListTableViewController.listNameFieldDidChange(_:)), for: UIControlEvents.editingChanged)
        }

        let cencel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) {(_) -> Void in
        self.readMeditationsAndUpdateUI()}

        //alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        alertController.addAction(cencel)
        alertController.addAction(createAction)
        createAction.isEnabled = false
        self.currentCreateAction = createAction

        self.present(alertController, animated: true, completion: nil)
    }

       // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let meditationsList = meditations {
            return meditationsList.count
        }

        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let reuseIdentifier = "MeditationCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? MeditationCellTableViewCell

        let meditation = meditations[indexPath.row]
        let image = data.loadMeditationImags(imageName: meditation.imageName)

        // Configure the cell...

        cell?.nameOfMeditation.text = meditation.name
        cell?.countOfMeditation.text = String(meditation.count)
        //cell.imageForMeditation.contentMode = .scaleAspectFit
        cell?.imageForMeditation.image = image

        return cell!
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (_, indexPath) -> Void in

            //Deletion will go here

            let meditationToBeDeleted = self.meditations[indexPath.row]
            do {
                try realm.write {
                    
                    realm.delete(meditationToBeDeleted)
                    self.readMeditationsAndUpdateUI()
                }
            } catch  let error {
                print(error)
            }
        }
        let editAction = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "Edit") { (_, indexPath) -> Void in

            // Editing will go here
            let meditationsToBeUpdated = self.meditations[indexPath.row]
            self.displayAlertToEditMeditationsList(meditationsToBeUpdated)

        }
        return [deleteAction, editAction]
    }

    // MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showMeditation" {
            let tabBar: MeditationTabBarController =  (segue.destination as?  MeditationTabBarController)!
            let nextScene: ViewController = (tabBar.viewControllers?.first as? ViewController)!

            let indexPath = tableView.indexPathForSelectedRow!.row
            let selectedMeditation = self.meditations[indexPath]
            tabBar.currentMeditation = selectedMeditation
            nextScene.saveData = selectedMeditation

        }

    }

    // Unwind to MainList
    @IBAction func unwindToMeditationsList(_ segue: UIStoryboardSegue) {}
}
