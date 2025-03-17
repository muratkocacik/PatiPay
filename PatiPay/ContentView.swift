import SwiftUI

struct ContentView: View {
    @StateObject var appState = AppState()

    var body: some View {
        if appState.isUserLoggedIn {
            MainView()
        } else {
            NavigationView {
                VStack {
                    NavigationLink(destination: LoginView(appState: appState)) {
                        Text("Giriş Yap")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: SignUpView(appState: appState)) {
                        Text("Kayıt Ol")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
                .navigationTitle("PatiPay")
            }
        }
    }
}
