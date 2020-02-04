# VaporGoogleCloudTTSProvider

A Vapor 4 wrapper around [SwiftGoogleCloudTTS](https://github.com/barisatamer/SwiftGoogleCloudTTS)

### Installation 📦

To include it in your package, add the following to your `Package.swift` file.

```swift
let package = Package(
    name: "Project",
    dependencies: [
        ...
        .package(url: "https://github.com/barisatamer/VaporGoogleCloudTTSProvider.git", from: "0.0.8"),
        ],
        targets: [
            .target(name: "App", dependencies: ["VaporGoogleCloudTts", ... ])
        ]
    )
```


### Setting the environment variable 

```bash
export GOOGLE_APPLICATION_CREDENTIALS="[PATH]"
```

### Usage 🚀

An example exists in vapor-example branch.

```swift

// routes.swift
func routes(_ app: Application) throws {
    let todoController = TodoController(googleCloudTtsClient: app.googleCloudTts.client)
    app.get("todos", use: todoController.index)
}

// TodoController.swift
import VaporGoogleCloudTts
import SwiftGoogleCloudTTS

struct TodoController {
    let googleCloudTtsClient: GoogleTTSClient
    
    init(googleCloudTtsClient: GoogleTTSClient) {
        self.googleCloudTtsClient = googleCloudTtsClient
    }
    
    func index(req: Request) throws -> EventLoopFuture<String> {
        let listVoicesRequest = Google_Cloud_Texttospeech_V1_ListVoicesRequest.with {
            $0.languageCode = "en-US"
        }
        return try googleCloudTtsClient.listVoices(request: listVoicesRequest).map { voicesResponse -> String in
            return voicesResponse.voices.map { $0.name }.joined(separator: "-")
        }
    }
}

```
