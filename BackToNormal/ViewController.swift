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
    weak var coordinator: MainCoordinator?

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
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
        coordinator?.showCreateEvent()
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
