//
//  FormRowStaticView.swift
//  To Do App
//
//  Created by Adriancys Jesus Villegas Toro on 9/11/23.
//

import SwiftUI

struct FormRowStaticView: View {
    // MARK: - Properties
    var icon: String
    var firstText: String
    var secoundText: String
    // MARK: - Body
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8,style: .continuous)
                    .fill(.gray)
                    
                Image(systemName: icon)
                    .foregroundColor(.white)
            }
            .frame(width: 36, height: 36, alignment: .center)
            
            Text(firstText).foregroundColor(.gray)
            Spacer()
            Text(secoundText)
                
        }
    }
}

struct FormRowStaticView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowStaticView(icon: "gear", firstText: "application", secoundText: "todo")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
