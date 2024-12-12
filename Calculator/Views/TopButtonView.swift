
import SwiftUI

struct TopButtonView: View {
    
    var lightMode: Bool
    
    var body: some View {
        HStack(spacing : 20) {
            Image(systemName: "sun.max.fill")
                .imageScale(.large)
                .foregroundColor(lightMode ? sunOrMoonSelectedColor : sunOrMoonNotSelectedColor)
            Image(systemName: "moon.fill")
                .imageScale(.large)
                .foregroundColor(lightMode ? sunOrMoonNotSelectedColor : sunOrMoonSelectedColor)
        }
        .padding()
        .background(secondaryBackgroundColor)
        .cornerRadius(20)
    }
        
}

struct SunMoonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TopButtonView(lightMode: true)
            TopButtonView(lightMode: false)
        }
        
    }
}
