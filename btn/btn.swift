//
//  btn.swift
//  btn
//
//  Created by Russell Mirabelli on 5/17/21.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(event: Event.placeholder, date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(event: Event.placeholder, date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
//        var entries: [SimpleEntry] = []
//
//        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
//        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let entry = SimpleEntry(event: Event.placeholder, date: entryDate)
//            entries.append(entry)
//        }
//
//        let timeline = Timeline(entries: entries, policy: .atEnd)
//

        let event = SimpleEntry(event: Event.getValues().randomElement() ?? Event.placeholder, date: Date())
        let timeline = Timeline(entries: [event], policy: .after(Date().addingTimeInterval(5 * 60)))

        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let event: Event
    let date: Date
}

struct btnEntryView : View {
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
struct btn: Widget {
    let kind: String = "btn"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            btnEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct btn_Previews: PreviewProvider {
    static var previews: some View {
        btnEntryView(entry: SimpleEntry(event: Event.placeholder, date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
