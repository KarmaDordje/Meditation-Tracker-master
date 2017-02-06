//
//  PredictionDate.swift
//  Meditation Tracker
//
//  Created by MACBOOK on 23.01.17.
//  Copyright © 2017 MACBOOK. All rights reserved.
//

import Foundation

class PredictionDate {

    let dateFormatter = DateFormatter()
    var dateComponents = DateComponents()
    let currentDate = NSDate()
    var date = 0

    func calculateDate(targetAmount: Int, currentAmount: Int, dailyAmount: Int) -> Int {
        let date = (targetAmount - currentAmount) / dailyAmount
        return date
    }

    func predicateDate(count: Int) -> String {

        dateFormatter.locale = NSLocale.current
        dateComponents.day = count
        let daysReamain = Calendar.current.date(byAdding: Calendar.Component.day, value: count, to: currentDate as Date)
        dateFormatter.dateStyle = DateFormatter.Style.medium
        let convertToString = dateFormatter.string(from: daysReamain!)

        return convertToString
    }
}
