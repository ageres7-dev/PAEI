//
//  WelcomePageView.swift
//  PAEI
//
//  Created by Сергей on 22.01.2021.
//

import SwiftUI

struct WelcomePageView: View {
    @EnvironmentObject var modalState: ScreenManager
    @State private var isShowingResultView = false
    
    var body: some View {
        
        TabView {
            
            
                ScrollView {
                    Text("567876")
                    
                
            }
            Text("567876")
            
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
            .environmentObject(ScreenManager())
    }
}
