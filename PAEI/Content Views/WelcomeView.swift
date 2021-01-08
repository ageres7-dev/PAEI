//
//  WelcomeView.swift
//  PAEI
//
//  Created by Сергей on 08.01.2021.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var modalState: ModalStateManager
//    @State private var isPresentPassingTest = false
    
    var body: some View {
        Button("Начать тест") {
            modalState.isModalPresentPassingTest.toggle()
        }
        .fullScreenCover(
            isPresented: $modalState.isModalPresentPassingTest,
            content: PassingTest.init
        )
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
