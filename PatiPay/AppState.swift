import SwiftUI
import FirebaseAuth

class AppState: ObservableObject {
    @Published var isUserLoggedIn: Bool = false
    
    init() {
        // Uygulama açıldığında kullanıcı oturumu açık mı kontrol et
        self.isUserLoggedIn = Auth.auth().currentUser != nil
    }
    
    func checkUserStatus() {
        self.isUserLoggedIn = Auth.auth().currentUser != nil
    }
}
