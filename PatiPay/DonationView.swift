import SwiftUI

struct DonationView: View {
    @State private var amount: String = ""
    @State private var isProcessing = false
    @State private var successMessage: String?

    var body: some View {
        VStack {
            Text("Bağış Yap")
                .font(.largeTitle)
                .fontWeight(.bold)

            TextField("Bağış Miktarı (₺)", text: $amount)
                .keyboardType(.decimalPad)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)

            if let successMessage = successMessage {
                Text(successMessage)
                    .foregroundColor(.green)
                    .padding()
            }

            Button(action: processDonation) {
                Text(isProcessing ? "Bağış İşleniyor..." : "Bağış Yap")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isProcessing ? Color.gray : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(isProcessing)
            .padding(.top, 20)
        }
        .padding()
    }

    func processDonation() {
        guard let _ = Double(amount) else {
            successMessage = "Lütfen geçerli bir tutar girin."
            return
        }
        
        isProcessing = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Simülasyon
            successMessage = "Bağışınız için teşekkürler! ❤️"
            isProcessing = false
            amount = ""
        }
    }
}
