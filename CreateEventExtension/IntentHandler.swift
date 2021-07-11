//
//  IntentHandler.swift
//  CreateEventExtension
//
//  Created by Russell Mirabelli on 6/27/21.
//

import Intents

// As an example, this class is set up to handle Message intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Send a message using <myApp>"
// "<myApp> John saying hello"
// "Search for messages in <myApp>"

class IntentHandler: INExtension, CreateEventIntentHandling {
    func resolveWhat(for intent: CreateEventIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        if let what = intent.What {
            completion(.success(with: what))
        } else {
            completion(.needsValue())
        }
    }

    func handle(intent: CreateEventIntent, completion: @escaping (CreateEventIntentResponse) -> Void) {
        let event = Event(title: intent.What ?? "No value", date: Date(), imageURL: nil, imageName: "TieDye", location: "some location")
        event.saveToUserDefaults()
        completion(CreateEventIntentResponse())
    }

    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }

}


extension IntentHandler: NewEventIntentHandling {
    func resolveName(for intent: NewEventIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        if let name = intent.name {
            completion(.success(with: name))
        } else {
            completion(.needsValue())
        }
    }
    
    func resolveDate(for intent: NewEventIntent, with completion: @escaping (INDateComponentsResolutionResult) -> Void) {
        if let date = intent.date {
            completion(.success(with: date))
        } else {
            completion(.needsValue())
        }
    }
    
    func resolveLocation(for intent: NewEventIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        if let location = intent.location {
            completion(.success(with: location))
        } else {
            completion(.needsValue())
        }
    }
    
    func handle(intent: NewEventIntent, completion: @escaping (NewEventIntentResponse) -> Void) {
        let userActivity = NSUserActivity(activityType: "activity")
        let name = intent.name ?? "empty name"
        let date = intent.date?.date ?? Date()
        let location = intent.location ?? "empty location"
        userActivity.userInfo = ["name": name, "date": date, "location": location]
        
        let response = NewEventIntentResponse(code: .continueInApp, userActivity: userActivity)
        completion(response)
    }
        
}
