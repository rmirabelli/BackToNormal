//
//  ViewController.swift
//  BackToNormal
//
//  Created by Russell Mirabelli on 5/14/21.
//

import UIKit
import UtiliKit
import WidgetKit

class ViewController: UIViewController {

    var events: [Event] = []

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // if we need to kill this list, kill it here.
//        Event.clearValues()
        events = Event.getValues()
        if events.isEmpty {
            Event.createInitialValues()
            events = Event.getValues()
        }
        tableView.dataSource = self
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        navigationItem.rightBarButtonItem = addButton
    }

    @objc func addItem() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CreateEventViewController") {
            navigationController?.pushViewController(vc, animated: true)
        }
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
