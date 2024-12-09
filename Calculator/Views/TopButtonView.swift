
import SwiftUI

struct TopButtonView: View {
    
    var lightMode: Bool
    
    var body: some View {
        Text("Hello World!")
    }
        
}

struct SunMoonView_Previews: PreviewProvider {
    static var previews: some View {
        TopButtonView(lightMode: true)
    }
}
