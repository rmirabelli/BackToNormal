//
//  NormalExtension.swift
//  NormalExtension
//
//  Created by Russell Mirabelli on 5/16/21.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(event: Event.getValues().first!,
                    configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(event: Event.getValues().first!, configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let event = Event.getValues().randomElement()

        let entry = SimpleEntry(event: event!, configuration: configuration)

        let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(300.0)))
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    var date: Date {
        event.date
    }
    
    let event: Event
    let configuration: ConfigurationIntent
}

struct NormalExtensionEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Image(entry.event.imageName ?? "")
                .resizable()
            Text(entry.event.title)
                .foregroundColor(.white)
        }
    }
}

@main
struct NormalExtension: Widget {
    let kind: String = "NormalExtension"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            NormalExtensionEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

//struct NormalExtension_Previews: PreviewProvider {
//    static var previews: some View {
//        NormalExtensionEntryView(entry: SimpleEntry(date: Date(),
//                                                    value: "boo", configuration: ConfigurationIntent()))
//            .previewContext(WidgetPreviewContext(family: .systemSmall))
//    }
//}
