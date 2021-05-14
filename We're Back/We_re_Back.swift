//
//  We_re_Back.swift
//  We're Back
//
//  Created by Russell Mirabelli on 5/14/21.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), title: "placeholder")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), title: "snapshot")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let events = Event.getValues()
        var entries: [SimpleEntry] = []

        for event in events {
            let entry = SimpleEntry(date: event.date, title: event.title)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let title: String
}

struct We_re_BackEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        Text(entry.title)
        Text(entry.date, style: .date)
    }
}

@main
struct We_re_Back: Widget {
    let kind: String = "We_re_Back"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            We_re_BackEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct We_re_Back_Previews: PreviewProvider {
    static var previews: some View {
        let events = Event.getValues()
        We_re_BackEntryView(entry: SimpleEntry(date: Date(), title: "fixed title"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
