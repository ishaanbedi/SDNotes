
# SDNotes
<img width="1440" alt="banner" src="https://github.com/ishaanbedi/SDNotes/assets/39641326/d2cb42cb-7233-4d21-a8b9-33b12030d2d1">

Apple just unveiled [**SwiftData**](https://developer.apple.com/xcode/swiftdata/), the all new framework for Apple Platforms, at WWDC 2023!

Here's an iOS note taking application built to demonstrate various operations and persistance of data in, SwiftData and SwiftUI!


## Working of the Application

I've tried to demonstrate CRUD operations using this app:

### Creating a new note and Reading it:

https://github.com/ishaanbedi/SDNotes/assets/39641326/de43f99b-2996-4a57-8a54-cb3d7c9624c9

### Updating an existing note:

https://github.com/ishaanbedi/SDNotes/assets/39641326/623e7b4d-0fed-4ceb-8bce-dbf831e4fc7c

### Deleting an existing note:
https://github.com/ishaanbedi/SDNotes/assets/39641326/267463d6-f992-404a-ac2f-47ad37244ede

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
