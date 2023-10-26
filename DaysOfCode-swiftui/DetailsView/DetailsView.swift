//
//  DetailsView.swift
//  DaysOfCode-swiftui
//
//  Created by Michelli Cristina de Paulo Lima on 25/10/23.
//

import SwiftUI

struct DetailsView: View {

    let secondary = Color("secondary")

    var body: some View {
        ScrollView {
            VStack {
                Text("A Órfã 2: A origem")
                    .foregroundColor(.white)
                    .font(.title)
                Image("aorfa")
                    .resizable()
                    .frame(width: 176, height: 235)
                    .clipped()
                    .cornerRadius(10)
                Text("Classificação dos usuários: 6.8")
                    .foregroundColor(.white)
                    .font(.subheadline)
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                    .foregroundColor(.white)
                    .font(.callout)
            }
            .frame(height: UIScreen.main.bounds.height)
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [.accentColor, secondary]), startPoint: .top, endPoint: .bottom)
            )
        }
        .ignoresSafeArea()
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
