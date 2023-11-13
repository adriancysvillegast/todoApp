//
//  FormRowLinkView.swift
//  To Do App
//
//  Created by Adriancys Jesus Villegas Toro on 9/11/23.
//

import SwiftUI

struct FormRowLinkView: View {
    // MARK: - Properties
    
    var icon: String
    var color: Color
    var text: String
    var link: String
    
    // MARK: - Body
    
    var body: some View {
        
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                
                Image(systemName: icon)
                    .imageScale(.large)
                    .foregroundColor(.white)
                    
            }
            .frame(width: 36,height: 36, alignment: .center)
            
            
            Text(text).foregroundColor(.gray)
            Spacer()
            
            Button {
                //openlink
                guard let url = URL(string: self.link), UIApplication.shared.canOpenURL(url) else {
                    return
                }
                UIApplication.shared.open(url as URL)
            } label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
            }
            .tint(Color(.systemGray2))

        }
    }
}

struct FormRowLinkView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowLinkView(icon: "globe", color: .pink, text: "Website", link: "www.github.com/adriancysvillegast")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
