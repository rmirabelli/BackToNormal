//
//  EventCell.swift
//  BackToNormal
//
//  Created by Russell Mirabelli on 5/14/21.
//

import UIKit
import UtiliKit

class EventCell: UITableViewCell {
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var vignetteView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var notesLabel: UILabel!

}

extension EventCell: Configurable {

    func configure(with element: Event) {
        titleLabel.text = element.title
        vignetteView.isHidden = true
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        dateLabel.text = formatter.string(from: element.date)
        if #available(iOS 15, *) {
            locationLabel.attributedText = NSAttributedString(AttributedString("**somewhere**"))
        } else {
            locationLabel.text = element.location
        }
        backgroundImage.image = element.image
        notesLabel.text = ""
    }

    typealias ConfiguringType = Event

}
