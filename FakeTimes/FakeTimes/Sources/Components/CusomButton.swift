import SwiftUI

struct CustomButton: View {
    let title: String
    var destination: AnyView?
    var action = {}
    
    var body: some View {
        if let destination = destination {
            NavigationLink(destination: destination) {
                RoundedRectangle(cornerRadius: 100)
                    .frame(
                        minWidth: 335,
                        maxWidth: 335,
                        minHeight: 47,
                        maxHeight: 47
                    )
                    .foregroundStyle(Color.primaryNormal)
                    .overlay {
                        Text(title)
                            .font(.headline2Bold)
                            .foregroundStyle(Color.labelDisable)
                    }
            }
        } else {
            Button(action: action) {
                RoundedRectangle(cornerRadius: 100)
                    .frame(
                        minWidth: 335,
                        maxWidth: 335,
                        minHeight: 47,
                        maxHeight: 47
                    )
                    .foregroundStyle(Color.primaryNormal)
                    .overlay {
                        Text(title)
                            .font(.headline2Bold)
                            .foregroundStyle(Color.labelDisable)
                    }
            }
        }
    }
}

#Preview {
    NavigationView {
        CustomButton(title: "Text") {
            print("yes")
        }
    }
}
