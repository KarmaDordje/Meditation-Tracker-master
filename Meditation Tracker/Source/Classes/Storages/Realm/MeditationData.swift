//
//  MeditationData.swift
//  Meditation Tracker
//
//  Created by MACBOOK on 07.01.17.
//  Copyright © 2017 MACBOOK. All rights reserved.
//
//  MeditationStorageService

import Foundation
import RealmSwift
import UIKit

class MeditationData: MeditationStorageService {

    var meditations = [Meditation]()

    //Creat standart meditations
    func creadStaticMeditations() {

            saveImage(#imageLiteral(resourceName: "refuge1"), path: fileInDocumentsDirectory("refuge1.jpg"))
            saveImage(#imageLiteral(resourceName: "diamondMind2"), path: fileInDocumentsDirectory("diamondMind2.jpg"))
            saveImage(#imageLiteral(resourceName: "mandala3"), path: fileInDocumentsDirectory("mandala3.jpg"))
            saveImage(#imageLiteral(resourceName: "guruJoga4"), path: fileInDocumentsDirectory("guruJoga4.jpg"))

            var meditations = [Meditation]()

            let med0 = Meditation()
            med0.name = "Small Refuge"
            med0.count = 0
            med0.targetAmount = 111111
            med0.malasStep = 108
            med0.imageName = "refuge1.jpg"
            med0.id = 0

            let med1 = Meditation()
            med1.name = "Refuge"
            med1.count = 0
            med1.targetAmount = 111111
            med1.malasStep = 108
            med1.imageName = "refuge1.jpg"
            med1.id = 1

                       let med2 = Meditation()
            med2.name = "Diamond Mind"
            med2.count = 0
            med2.targetAmount = 111111
            med2.malasStep = 108
            med2.id = 2
            med2.imageName = "diamondMind2.jpg"

            let med3 = Meditation()
            med3.name = "Mandala"
            med3.count = 0
            med3.targetAmount = 111111
            med3.malasStep = 108
            med3.id = 3
            med3.imageName = "mandala3.jpg"

            let med4 = Meditation()
            med4.name = "Guru Joga"
            med4.count = 0
            med4.targetAmount = 111111
            med4.malasStep = 108
            med4.id = 4
            med4.imageName = "guruJoga4.jpg"

            meditations = [med0, med1, med2, med3, med4]
        
        do {
            try realm.write {
                realm.add(meditations, update: true)
            }
        } catch {
            print(error)
        }
    }

    // Load image path 
    func getDocumentsURL() -> URL {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documentsURL
    }

    func fileInDocumentsDirectory(_ filename: String) -> String {

        let fileURL = getDocumentsURL().appendingPathComponent(filename)
        return fileURL.path

    }

    func loadImageFromPath(_ path: String) -> UIImage? {

        let image = UIImage(contentsOfFile: path)

        if image == nil {

            print("couldn't find image at path: \(path)")
        }

        return image

    }

    func loadMeditationImags(imageName: String) -> UIImage? {

        // Get the image back
        let imageName: String = imageName  // Or whatever name you saved
        let imagePath = fileInDocumentsDirectory(imageName)

        if let loadedImage = self.loadImageFromPath(imagePath) {
            return loadedImage
        } else {
            print("Couldn't Load: \(imageName)")
            return nil
        }

    }

    func saveImage(_ image: UIImage, path: String ) {

        //If you want PNG use this let pngImageData = UIImagePNGRepresentation(image)
        // But since you mentioned JPEG:

        if let jpgData = UIImageJPEGRepresentation(image, 1.0) {
            try? jpgData.write(to: URL(fileURLWithPath: path), options: [.atomic])
        }

    }

}

protocol MeditationStorageService {
    func saveImage(_ image: UIImage, path: String )
    func loadMeditationImags(imageName: String) -> UIImage?
    func loadImageFromPath(_ path: String) -> UIImage?
    func fileInDocumentsDirectory(_ filename: String) -> String
    func getDocumentsURL() -> URL
    func creadStaticMeditations()
}
