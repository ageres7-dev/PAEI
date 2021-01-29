//
//  SplashScreen.swift
//  PAEI
//
//  Created by Сергей on 28.01.2021.
//

import SwiftUI

struct SplashScreen: View {
    @State private var showLogo = true
    var body: some View {
    
            VStack(alignment: .center, spacing: 0) {
                Spacer()
                HStack(alignment: .center, spacing: 0) {
                    Spacer()
                    if showLogo {
                        CharacterElementLogo(text: "P", color: .red)
                            .transition(.upperLeft)
                    }
                    Spacer()
                    if showLogo {
                        CharacterElementLogo(text: "A", color: .blue)
                            .transition(.upperRight)
                    }
                    Spacer()
                }
                Spacer()
                HStack(alignment: .center, spacing: 0) {
                    Spacer()
                    if showLogo {
                        CharacterElementLogo(text: "E", color: .yellow)
                            .transition(.bottomLeft)
                        
                    }
                    Spacer()
                    if showLogo {
                        CharacterElementLogo(text: "I", color: .green)
                            .transition(.bottomRight)
                        
                    }
                    Spacer()
                }

                Spacer(minLength: 300)
            }
            .animation(.easeOut(duration: 1))
            .frame(width: 300, height: 300)
            .onAppear {
                withAnimation() {
                    showLogo = false
                }
                
        }
        
        
        
        
    }
}


extension AnyTransition {
    static var upperLeft = AnyTransition.move(edge: .leading)
        .combined(with: .move(edge: .top))
        .combined(with: .opacity)
    static var upperRight = AnyTransition.move(edge: .trailing)
        .combined(with: .move(edge: .top))
        .combined(with: .opacity)
    static var bottomLeft = AnyTransition.move(edge: .leading)
        .combined(with: .move(edge: .bottom))
        .combined(with: .opacity)
    static var bottomRight = AnyTransition.move(edge: .trailing)
        .combined(with: .move(edge: .bottom))
        .combined(with: .opacity)
}


struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

struct CharacterElementLogo: View {
    let text: String
    let color: Color
    var body: some View {
        Text(text)
            .bold()
            .multilineTextAlignment(.center)
            .font(.system(size: 100))
            .foregroundColor(color)
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
    }
}
