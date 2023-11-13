//
//  SettingsView.swift
//  To Do App
//
//  Created by Adriancys Jesus Villegas Toro on 9/11/23.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var iconSettings: IconNames
    let themes: [Theme] = themeData
    @ObservedObject var theme = ThemeSettings.shared
    @State private var isThemeChanged: Bool = false
    
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            
            VStack(alignment: .center, spacing: 0) {
                //Form
                Form {
                    
                    //Section 1
                    Section {
                        Picker(selection: $iconSettings.currentIndex) {
                            ForEach(0..<iconSettings.iconNames.count, id:\.self) { index in
                                
                                HStack {
                                    Image(uiImage: UIImage(named: self.iconSettings.iconNames[index] ?? "Blue") ?? UIImage())
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 44, height: 44)
                                        .cornerRadius(8)
                                    
                                    Spacer().frame(width: 8)
                                    
                                    Text(self.iconSettings.iconNames[index] ?? "Blue")
                                        .frame(alignment: .leading)
                                    
                                }
                                .padding(3)
                            }
                        } label: {
                            
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 9, style: .continuous)
                                        .strokeBorder(Color.primary, lineWidth: 2)
                                    
                                    
                                    Image(systemName: "paintbrush")
                                        .font(.system(size: 28, weight: .regular, design: .default))
                                    .foregroundColor(Color.primary)
                                }
                                .frame(width: 44, height: 44)
                                
                                Text("App Icons".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.primary)
                            }
                        }
                        .pickerStyle(.navigationLink)
                        .onReceive([self.iconSettings.currentIndex].publisher.first()) { (value) in
                            let index = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
                            if index != value {
                                UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value]) { error in
                                    if let error = error {
                                        print(error.localizedDescription)
                                    }else {
                                        print("Success, you've changed te app icon")
                                    }
                                }
                            }
                        }
                    } header: {
                        Text("Choose the app icon")
                    }
                    .padding(.vertical, 3)
                    
                    //Section 2
                    Section {
                        List {
                            ForEach(themes, id: \.id) { item in
                                Button {
                                    self.theme.themeSettings = item.id
                                    UserDefaults.standard.set(self.theme.themeSettings, forKey: "Theme")
                                    self.isThemeChanged.toggle()
                                } label: {
                                    HStack {
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(item.themeColor)
                                        
                                        Text(item.themeName)
                                    }
                                }
                                .accentColor(Color.primary)

                                
                            }
                        }
                    } header: {
                        HStack {
                            
                            Text("Choose the app theme")
                            
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .foregroundColor(themes[self.theme.themeSettings].themeColor)
                        }
                    }
                    .padding(.vertical, 3)
                    .alert(isPresented: $isThemeChanged) {
                        Alert(title: Text("Succes"),
                              message: Text("App has been changed to the \(themes[self.theme.themeSettings].themeName). Now closeand restar it!"),
                              dismissButton: .default(Text("Ok")))
                        
                    }
                    
                    
                    //Section 3
                    Section {
                        FormRowLinkView(
                            icon: "globe",
                            color: Color.pink,
                            text: "Github",
                            link: "https://github.com/adriancysvillegast")
                        
                        FormRowLinkView(icon: "link", color: Color.black, text: "X", link: "https://twitter.com/Adriancys")
                        
                        FormRowLinkView(icon: "dot.radiowaves.up.forward", color: Color.blue, text: "LinkedIn", link: "https://www.linkedin.com/in/adriancys-jesus-villegas-toro-283641160/")
                    } header: {
                        Text("Follow me on social media")
                    }
                    .padding(.vertical, 3)
                    
                    
                    //Section 4
                    Section {
                        
                        FormRowStaticView(icon: "gear", firstText: "Application", secoundText: "To do")
                        
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secoundText: "iPhone, iPad")
                        
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secoundText: "Adriancys Villegas")
                        
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secoundText: "Adriancys Villegas")
                        
                        FormRowStaticView(icon: "flag", firstText: "Version", secoundText: "1.0.0")
                        
                    } header: {
                        Text("About The Application")
                    }
                    .padding(.vertical, 3)
                    
                    
                    
                    
                }
                .listStyle(.grouped)
                .environment(\.horizontalSizeClass, .regular)
                
                // MARK: - Footer
                Text("Copyright All Rights Reserved\nBetter ♡ apps less Code")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(Color.secondary)
                
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
//                        action
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }

                }
            })
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        }
        .accentColor(themes[self.theme.themeSettings].themeColor)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(IconNames())
    }
}
