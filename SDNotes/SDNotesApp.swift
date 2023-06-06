import SwiftUI

@main
struct SDNotesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Note.self])
        }
    }
}
