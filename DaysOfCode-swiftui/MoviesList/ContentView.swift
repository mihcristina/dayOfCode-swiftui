//
//  ContentView.swift
//  DaysOfCode-swiftui
//
//  Created by Michelli Cristina de Paulo Lima on 25/10/23.
//

import SwiftUI

struct ContentView: View {

    @StateObject var vm = MoviesListViewModel()
    let secondary = Color("secondary")

    var body: some View {
        VStack {
            Text("Filmes Populares")
                .font(.title)
                .foregroundColor(.white)
            List {
                ForEach(vm.movies?.results ?? []) { movie in
                    CustomCell(
                        title: movie.title,
                        releaseDate: movie.releaseDate,
                        image: movie.image)
                    .listRowBackground(Color.clear)
                    .onTapGesture {
                        
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(
                LinearGradient(gradient: Gradient(colors: [.accentColor, secondary]), startPoint: .top, endPoint: .bottom)
            )
        }
        .background(Color.accentColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomCell: View {
    @State var title: String
    @State var releaseDate: String
    @State var image: String?

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(image ?? "")"))
                .frame(width: 90, height: 120)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.body)
                    .foregroundColor(.white)
                Text("Lançamento: \(releaseDate)")
                    .foregroundColor(.white)
                    .font(.caption)
                    .opacity(0.5)
            }
            .padding()
        }
    }
}
