//
//  PictureScreen.swift
//  SU02
//
//  Created by Anna Ershova on 30.12.2021.
//

import SwiftUI
import UIComponents

struct PictureScreen: View {
    @EnvironmentObject var detailViewModel: DetailViewModel
    @EnvironmentObject var routeModel: NavigationContainerViewModel
    
    var body: some View {
        VStack {
            let text = detailViewModel.data.author
            let url = detailViewModel.data.pictureURL
            Text(text ?? "unknown")
                .font(.largeTitle)
                .padding()
            Picture(url: url).image            
            Button {
                withAnimation {
                    routeModel.popToRoot()
                }
            } label: {
                Text("Back To News")
                    .padding()
                    .background(Color.purple.opacity(0.8))
                    .foregroundColor(.white)
            }
        }
    }
}
