//
//  Event.swift
//  BackToNormal
//
//  Created by Russell Mirabelli on 5/14/21.
//

import UIKit

/// A single event in the long list of events which will be displayed
/// by the app.
struct Event: Codable {
    let title: String
    let date: Date
    let imageURL: URL?
    let imageName: String?
    let location: String

    var image: UIImage? {
        switch imageName {
        case "Phish":
            return UIImage(named: "Phish")
        case "DeadAndCo":
            return UIImage(named: "DeadAndCo")
        case "STS9":
            return UIImage(named: "STS9")
        case "UmphreysMcGee":
            return UIImage(named: "UmphreysMcGee")
        case "CoryWong":
            return UIImage(named: "CoryWong")
        case "BritFloyd":
            return UIImage(named: "BritFloyd")
        default:
            return nil
        }
    }
}
