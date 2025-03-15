import SwiftUI

enum InputFieldStyle {
    case `default`
    case secureField
    case numberPad
    
}

struct InputField: View {
    @Binding var text: String
    let placeholder: String
    let style: InputFieldStyle
    var label: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            if !label.isEmpty {
                Text(label)
                    .font(.headline2Medium)
                    .foregroundStyle(Color.labelNormal)
            }
            
            RoundedRectangle(cornerRadius: 100)
                .frame(
                    minWidth: 309,
                    maxWidth: 309,
                    minHeight: 51,
                    maxHeight: 51
                )
                .foregroundStyle(Color.backgroundNormal)
                .shadow(color: .static00.opacity(0.02), radius: 10, x: 0, y: 3)
                .overlay {
                    switch style {
                    case .default:
                        TextField(
                            "",
                            text: $text,
                            prompt: Text(placeholder)
                                .font(.bodyMedium)
                                .foregroundStyle(Color.labelAssistive)
                        )
                        .padding(.horizontal, 20)
                        .tint(.primaryNormal)
                        .textInputAutocapitalization(.never)
                    case .secureField:
                        SecureField(
                            "",
                            text: $text,
                            prompt: Text(placeholder)
                                .font(.bodyMedium)
                                .foregroundStyle(Color.labelAssistive)
                        )
                        .padding(.horizontal, 20)
                        .tint(.primaryNormal)
                        .textInputAutocapitalization(.never)
                    case .numberPad:
                        TextField(
                            "",
                            text: $text,
                            prompt: Text(placeholder)
                                .font(.bodyMedium)
                                .foregroundStyle(Color.labelAssistive)
                        )
                        .padding(.horizontal, 20)
                        .tint(.primaryNormal)
                        .keyboardType(.numberPad)
                        .textInputAutocapitalization(.never)
                    }
                }
        }
    }
}

#Preview {
    InputField(text: .constant(""), placeholder: "Input Text", style: .default, label: "Label")
}
