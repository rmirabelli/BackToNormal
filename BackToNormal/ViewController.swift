//
//  ViewController.swift
//  BackToNormal
//
//  Created by Russell Mirabelli on 5/14/21.
//

import UIKit
import UtiliKit

class ViewController: UIViewController {

    var events: [Event] = []

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // if we need to kill this list, kill it here.
//        UserDefaults.standard.removeObject(forKey: "events")
        events = getValues()
        if events.isEmpty {
            createInitialValues()
            events = getValues()
        }
        tableView.dataSource = self
        navigationItem.rightBarButtonItem = editButtonItem
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.isEditing = editing
        if (editing) {
            // Add the + button
            let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
            navigationItem.leftBarButtonItem = addButton
        } else {
            navigationItem.leftBarButtonItem = nil
        }
    }

    @objc func addItem() {
        print("add")
    }

}

extension ViewController {

    // this is horrible, but whatever.
    func createInitialValues() {
        let sts91 = DateComponents(calendar: Calendar.current, year: 2021, month: 7, day: 23).date ?? Date()
        let sts92 = DateComponents(calendar: Calendar.current, year: 2021, month: 7, day: 24).date ?? Date()
        let phishAR = DateComponents(calendar: Calendar.current, year: 2021, month: 7, day: 28).date ?? Date()
        let umhob = DateComponents(calendar: Calendar.current, year: 2021, month: 9, day: 22).date ?? Date()
        let dnc = DateComponents(calendar: Calendar.current, year: 2021, month: 10, day: 14).date ?? Date()
        let phishH2 = DateComponents(calendar: Calendar.current, year: 2021, month: 10, day: 29).date ?? Date()
        let phishH3 = DateComponents(calendar: Calendar.current, year: 2021, month: 10, day: 30).date ?? Date()
        let phishH4 = DateComponents(calendar: Calendar.current, year: 2021, month: 10, day: 31).date ?? Date()
        let cw = DateComponents(calendar: Calendar.current, year: 2021, month: 11, day: 19).date ?? Date()
        let bf = DateComponents(calendar: Calendar.current, year: 2022, month: 6, day: 22).date ?? Date()

        let initialEvents = [
            Event(title: "STS9 Red Rocks Night 1", date: sts91, imageURL: nil, imageName: "STS9", location: "Red Rocks"),
            Event(title: "STS9 Red RocksNight 2", date: sts92, imageURL: nil, imageName: "STS9", location: "Red Rocks"),
            Event(title: "Phish Tour Opener", date: phishAR, imageURL: nil, imageName: "Phish", location: "Rogers, AK"),
            Event(title: "Phish Halloween Night 2", date: phishH2, imageURL: nil, imageName: "Phish", location: "Las Vegas"),
            Event(title: "Phish Halloween Night 3", date: phishH3, imageURL: nil, imageName: "Phish", location: "Las Vegas"),
            Event(title: "Phish Halloween Night 4", date: phishH4, imageURL: nil, imageName: "Phish", location: "Las Vegas"),
            Event(title: "Umphrey's McGee", date: umhob, imageURL: nil, imageName: "UmphreysMcGee", location: "Dallas House of Blues"),
            Event(title: "Dead and Company", date: dnc, imageURL: nil, imageName: "DeadAndCo", location: "Dos Equis Pavillion Dallas"),
            Event(title: "Cory Wong", date: cw, imageURL: nil, imageName: "CoryWong", location: "Somewhere in Dallas"),
            Event(title: "Brit Floyd", date: bf, imageURL: nil, imageName: "BritFloyd", location: "Grand Prairie")
        ].sorted { $0.date < $1.date }
        UserDefaults.standard.set(try? PropertyListEncoder().encode(initialEvents), forKey: "events")
    }

    func getValues() -> [Event] {
        if let data = UserDefaults.standard.value(forKey:"events") as? Data {
            return (try? PropertyListDecoder().decode(Array<Event>.self, from: data)) ?? []
        }
        return []
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        events.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EventCell = tableView.dequeueReusableCell(for: indexPath, configuredWith: events[indexPath.item])
        return cell
    }

}
