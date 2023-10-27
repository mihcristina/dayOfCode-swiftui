//
//  DetailsView.swift
//  DaysOfCode-swiftui
//
//  Created by Michelli Cristina de Paulo Lima on 25/10/23.
//

import SwiftUI

struct DetailsView: View {

    @State var title: String
    @State var image: String?
    @State var voteAverage: Double
    @State var description: String

    let secondary = Color("secondary")

    var body: some View {

        NavigationStack {
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(image ?? "")"))
                    .frame(width: 176, height: 235)
                    .clipped()
                    .cornerRadius(18)
                Text("Classificação dos usuários: \(voteAverage.formatted())")
                    .foregroundColor(.white)
                    .font(.subheadline)
                Text(description)
                    .foregroundColor(.white)
                    .font(.callout)
                    .padding()
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
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
        DetailsView(title: "test", voteAverage: 0.0, description: "test")
    }
}
