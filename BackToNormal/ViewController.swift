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
        events = Event.getValues()
        if events.isEmpty {
            Event.createInitialValues()
            events = Event.getValues()
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

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        events.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EventCell = tableView.dequeueReusableCell(for: indexPath, configuredWith: events[indexPath.item])
        return cell
    }

}
