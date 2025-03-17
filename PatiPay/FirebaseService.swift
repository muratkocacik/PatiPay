import FirebaseFirestore

class FirebaseService {
    static let shared = FiresbaseService()
    private let db = Firestore.firestore()

    func addDataToFirestore() {
        let userRef = db.collection("users").document("user123")
        
        userRef.setData([
            "name": "John Doe",
            "email": "johndoe@example.com",
            "age": 30
        ]) { error in
            if let error = error {
                print("Error adding document: \(error.localizedDescription)")
            } else {
                print("Document successfully added!")
            }
        }
    }
    
    func fetchDataFromFirestore() {
        let userRef = db.collection("users").document("user123")
        
        userRef.getDocument { document, error in
            if let error = error {
                print("Error getting document: \(error.localizedDescription)")
            } else if let document = document, document.exists {
                let data = document.data()
                print("Document data: \(data)")
            } else {
                print("Document does not exist")
            }
        }
    }
  func saveUserData(userId: String, email: String, completion: @escaping (Error?) -> Void) {
          let userData: [String: Any] = [
              "email": email,
              "createdAt": FieldValue.serverTimestamp()
          ]
          
          db.collection("users").document(userId).setData(userData, merge: true) { error in
              completion(error)
          }
      }
}
func observeFirestoreChanges() {
    let usersRef = db.collection("users")
    
    usersRef.addSnapshotListener { snapshot, error in
        if let error = error {
            print("Error listening to snapshot: \(error.localizedDescription)")
            return
        }
        
        guard let snapshot = snapshot else { return }
        for document in snapshot.documents {
            let data = document.data()
            print("Document data: \(data)")
        }
    }
}
