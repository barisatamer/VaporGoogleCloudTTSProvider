//
//  VaporGoogleCloudTts.swift
//  VaporGoogleCloudTts
//
//  Created by Baris Atamer on 2/3/20.
//

import Vapor
import SwiftGoogleCloudTTS

extension Application {
    
    public var googleCloudTts: VaporGoogleCloudTts {
        .init(application: self)
    }
    
    public struct VaporGoogleCloudTts {
        public let application: Application
        
         public var client: GoogleTTSClient {
            initialize()
            return GoogleTTSClient(
                eventLoopGroup: application.eventLoopGroup.next()
            )
        }
        
        struct Lifecycle: LifecycleHandler {
            func shutdown(_ application: Application) {
                print("🚀 \(type(of: self)) : \(#function)")
                application.googleCloudTts.client.shutDown()
            }
        }
        
        func initialize() {
            self.application.lifecycle.use(Lifecycle())
        }
    }
}


