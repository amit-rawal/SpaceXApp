//
//  Date+Ext.swift
//  SpaceXApp
//
//  Created by Amit Rawal on 14/01/24.
//

import Foundation

extension Date {
    
    static func dateFormatter(time: String, getFormate: String? = "yyyy-MM-dd'T'HH:mm:ss.SSSZ", printFormate: String? = "MMM dd,yyyy HH:mm") -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = getFormate
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = printFormate
        
        if let date = dateFormatterGet.date(from: time) {
            return dateFormatterPrint.string(from: date)
        } else {
            return ""
        }
    }
    
    static func convertStringToDate(time: String, formate: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate
        
        if let date = dateFormatter.date(from: time) {
            return date
        } else {
            return Date()
        }
    }
}
