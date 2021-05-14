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
        default:
            return nil
        }
    }
}
