import SwiftUI

@main
struct FakeTimesApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Group {
                    if KeyChain.read() == nil {
                        SignInView()
                    }
                    else {
                        MainView()
                    }
                }
            }
        }
    }
}
