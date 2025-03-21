import Foundation
import UIKit

public func exit() {
    UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        exit(0)
    }
}
