import SwiftUI
import Firebase

@main
struct YourAppName: App {
    
    init() {
        // Firebase'i başlatıyoruz
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


