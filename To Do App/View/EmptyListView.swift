//
//  EmptyListView.swift
//  To Do App
//
//  Created by Adriancys Jesus Villegas Toro on 7/11/23.
//

import SwiftUI

struct EmptyListView: View {
    // MARK: - Properties
    @State private var isAnimate: Bool = false
    
    let images: [String] = [
        "illustration-no1",
        "illustration-no2",
        "illustration-no3"
    ]
    
    let tips: [String] = [
        "Use your time wisely",
        "Slow and steady wins the race",
        "Keep it short and sweet",
        "Put hard tasks first",
        "Reward yourself after work",
        "Collect tasks ahead of time",
        "Each night schedule for tomorrow"
    ]
    
    @ObservedObject var theme = ThemeSettings.shared
    var themes: [Theme] = themeData
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                
                Image("\(images.randomElement() ?? self.images[0])")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 256, idealWidth: 280, maxWidth: 316, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
                    .layoutPriority(1)
                    
                    .foregroundColor(themes[self.theme.themeSettings].themeColor)
                
                
                Text("\(tips.randomElement() ?? self.tips[0])")
                    .layoutPriority(0.5)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(themes[self.theme.themeSettings].themeColor)
                
                
            }
            .padding(.horizontal)
            .opacity(isAnimate ? 1 : 0)
            .offset(y: isAnimate ? 0 : -15)
            .animation(.easeOut(duration: 1.5), value: isAnimate)
            .onAppear {
                self.isAnimate.toggle()
            }
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("ColorBase"))
        .edgesIgnoringSafeArea(.all)
        
    }
}


// MARK: - Preview
struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
