import Fluent
import Vapor
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
