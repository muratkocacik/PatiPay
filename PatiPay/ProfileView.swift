import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct ProfileView: View {
    @State private var email: String = "Yükleniyor..."

    var body: some View {
        VStack {
            Text("Profil")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("E-posta: \(email)")
                .padding()

            Button(action: logOut) {
                Text("Çıkış Yap")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .onAppear {
            fetchUserData()
        }
        .padding()
    }

    func fetchUserData() {
        if let userId = Auth.auth().currentUser?.uid {
            Firestore.firestore().collection("users").document(userId).getDocument { snapshot, error in
                if let data = snapshot?.data(), let email = data["email"] as? String {
                    self.email = email
                }
            }
        }
    }

    func logOut() {
        try? Auth.auth().signOut()
    }
}
