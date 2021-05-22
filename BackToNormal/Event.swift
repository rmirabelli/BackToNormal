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
        case "TieDye":
            return UIImage(named: "TieDye")
        case "Goose":
            return UIImage(named: "Goose")
        case "DriveByTruckers":
            return UIImage(named: "DriveByTruckers")
        case "BOA":
            return UIImage(named: "BOA")
        case "ARJ":
            return UIImage(named: "ARJ")
        case "WDW":
            return UIImage(named: "WDW")
        case "RENT":
            return UIImage(named: "RENT")
        default:
            return nil
        }
    }

    static var placeholder: Event {
        Event(title: "Placeholder", date: Date(), imageURL: nil, imageName: "TieDye", location: "placeholder")
    }
}



extension Event {

    // this is horrible, but whatever.
    static func createInitialValues() {
        let sts91 = DateComponents(calendar: Calendar.current, year: 2021, month: 7, day: 23).date ?? Date()
        let sts92 = DateComponents(calendar: Calendar.current, year: 2021, month: 7, day: 24).date ?? Date()
        let phishAR = DateComponents(calendar: Calendar.current, year: 2021, month: 7, day: 28).date ?? Date()
        let umhob = DateComponents(calendar: Calendar.current, year: 2021, month: 9, day: 22).date ?? Date()
        let dnc = DateComponents(calendar: Calendar.current, year: 2021, month: 10, day: 14).date ?? Date()
        let dnc2 = DateComponents(calendar: Calendar.current, year: 2021, month: 10, day: 15).date ?? Date()
        let cw = DateComponents(calendar: Calendar.current, year: 2021, month: 11, day: 19).date ?? Date()
        let bf = DateComponents(calendar: Calendar.current, year: 2022, month: 6, day: 22).date ?? Date()
        let dbt = DateComponents(calendar: Calendar.current, year: 2021, month: 11, day: 17).date ?? Date()
        let gb = DateComponents(calendar: Calendar.current, year: 2021, month: 11, day: 13).date ?? Date()
        let arj = DateComponents(calendar: Calendar.current, year: 2021, month: 11, day: 18).date ?? Date()
        let boasl = DateComponents(calendar: Calendar.current, year: 2021, month: 10, day: 23).date ?? Date()
        let wdw = DateComponents(calendar: Calendar.current, year: 2021, month: 7, day:16).date ?? Date()
        let rent = DateComponents(calendar: Calendar.current, year: 2022, month: 2, day:20).date ?? Date()

        let initialEvents = [
            Event(title: "STS9 Red Rocks Night 1", date: sts91, imageURL: nil, imageName: "STS9", location: "Red Rocks"),
            Event(title: "STS9 Red RocksNight 2", date: sts92, imageURL: nil, imageName: "STS9", location: "Red Rocks"),
            Event(title: "Phish Tour Opener", date: phishAR, imageURL: nil, imageName: "Phish", location: "Rogers, AK"),
            Event(title: "Umphrey's McGee", date: umhob, imageURL: nil, imageName: "UmphreysMcGee", location: "Dallas House of Blues"),
            Event(title: "Dead and Company", date: dnc, imageURL: nil, imageName: "DeadAndCo", location: "Dos Equis Pavillion Dallas"),
            Event(title: "Dead and Company", date: dnc2, imageURL: nil, imageName: "DeadAndCo", location: "Cynthia Woods Pavillion Houston"),
            Event(title: "Cory Wong", date: cw, imageURL: nil, imageName: "CoryWong", location: "HiFi Dallas"),
            Event(title: "Brit Floyd", date: bf, imageURL: nil, imageName: "BritFloyd", location: "Grand Prairie"),
            Event(title: "Drive By Truckers", date: dbt, imageURL: nil, imageName: "DriveByTruckers", location: "Grenada"),
            Event(title: "Goose", date: gb, imageURL: nil, imageName: "Goose", location: "HiFi Dallas"),
            Event(title: "BOA St Louis", date: boasl, imageURL: nil, imageName: "BOA", location: "St Louis"),
            Event(title: "All Region Jazz", date: arj, imageURL: nil, imageName: "ARJ", location: "Paschal HS"),
            Event(title: "Disneyworld", date: wdw, imageURL: nil, imageName: "WDW", location: "Orlando"),
            Event(title: "RENT", date: rent, imageURL: nil, imageName: "RENT", location: "Fair Park Music Hall")
        ].sorted { $0.date < $1.date }
        UserDefaults(suiteName: "group.rmirabelli.backtonormal")?.set(try? PropertyListEncoder().encode(initialEvents), forKey: "events")
    }

    static func getValues() -> [Event] {

        if let data = UserDefaults(suiteName: "group.rmirabelli.backtonormal")?.value(forKey:"events") as? Data {
            return (try? PropertyListDecoder().decode(Array<Event>.self, from: data)) ?? []
        }
        return []
    }

    static func clearValues() {
        UserDefaults(suiteName: "group.rmirabelli.backtonormal")?.removeObject(forKey: "events")
    }
}
