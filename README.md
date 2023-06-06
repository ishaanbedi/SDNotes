
# SDNotes

<img width="1440" alt="Screenshot 2023-06-06 at 9 52 24 PM" src="https://github.com/ishaanbedi/SDNotes/assets/39641326/818e50e0-2294-400e-a101-492f473f681e">

Apple just unveiled [**SwiftData**](https://developer.apple.com/xcode/swiftdata/), the all new framework for Apple Platforms, at WWDC 2023!

Here's an iOS note taking application built to demonstrate various operations and persistance of data in SwiftData and SwiftUI!


## Working of the Application

I've tried to demonstrate CRUD operations using this app:

### Creating a new note and Reading it:




https://github.com/ishaanbedi/SDNotes/assets/39641326/b2c3f71a-d653-473e-914a-bc4e493d64a8


### Updating an existing note:



https://github.com/ishaanbedi/SDNotes/assets/39641326/9ba3f4a8-8365-419a-aa83-c3bdb65be775



### Deleting an existing note:



https://github.com/ishaanbedi/SDNotes/assets/39641326/1fad4aa7-c3c6-48e5-b998-41ef98fadd34


## Model of a Note:
```swift
@Model
class Note {
    var title: String
    var content: String

    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
}
```

#### Setting up this model as a model container in the `SDNotesApp.swift` file so as to extract context out of it in our views and controllers:

```swift #8
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

```
## SwiftData docs:
[developer.apple.com/documentation/SwiftData](https://developer.apple.com/documentation/SwiftData)

## License

[MIT](https://choosealicense.com/licenses/mit/)

### PS: The Icon
<img width="256" height="256" alt="icon" src="https://github.com/ishaanbedi/SDNotes/assets/39641326/72fd79f0-58d1-4aaf-82cc-400bc3511559">
<br/>
I generated this super cool icon for this app in less than 10 seconds, oh boy, DALL-E is so good!
