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
    
        PaeiLogo(showLogo: showLogo)
            .offset(y: 6)
            .animation(.easeOut(duration:0.9))
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
        .combined(with: .scale(scale: 3))
    static var upperRight = AnyTransition.move(edge: .trailing)
        .combined(with: .move(edge: .top))
        .combined(with: .opacity)
        .combined(with: .scale(scale: 3))
    static var bottomLeft = AnyTransition.move(edge: .leading)
        .combined(with: .move(edge: .bottom))
        .combined(with: .opacity)
        .combined(with: .scale(scale: 3))
    static var bottomRight = AnyTransition.move(edge: .trailing)
        .combined(with: .move(edge: .bottom))
        .combined(with: .opacity)
        .combined(with: .scale(scale: 3))
}


struct CharacterElementLogo: View {
    let text: String
    let color: Color
    var body: some View {
        Text(text)
            .bold()
            .multilineTextAlignment(.center)
            .font(.custom("Futura", size: 100))
            .foregroundColor(color)
            .frame(width: 100, height: 100)
    }
}


struct PaeiLogo: View {
    let showLogo: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            HStack(spacing: 0) {
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
            HStack(spacing: 0) {
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
            Spacer()
        }
        
    }
}


struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}


struct PaeiLogo_Previews: PreviewProvider {
    static var previews: some View {
        PaeiLogo(showLogo: true)
    }
}


struct CharacterElementLogo_Previews: PreviewProvider {
    static var previews: some View {
        CharacterElementLogo(text: "P", color: .red)
    }
}
