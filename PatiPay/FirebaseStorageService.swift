import FirebaseStorage

class FirebaseStorageService {
    private let storageRef = Storage.storage().reference()

    func uploadImage(imageData: Data) {
        let storagePath = storageRef.child("profile_images/user123.jpg")
        
        storagePath.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("Error uploading file: \(error.localizedDescription)")
            } else {
                print("File uploaded successfully")
            }
        }
    }

    func downloadImage() {
        let storagePath = storageRef.child("profile_images/user123.jpg")
        
        storagePath.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print("Error downloading file: \(error.localizedDescription)")
            } else if let data = data {
                let image = UIImage(data: data)
                print("Image downloaded successfully")
            }
        }
    }
}
