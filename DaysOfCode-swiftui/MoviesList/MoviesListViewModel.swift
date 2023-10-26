//
//  MoviesListViewModel.swift
//  DaysOfCode-swiftui
//
//  Created by Michelli Cristina de Paulo Lima on 25/10/23.
//

import Combine
import Foundation

class MoviesListViewModel: ObservableObject {

    @Published var movies: MovieResults?
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    func getPosts() {

        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=752c11849747ed228980d57c056e8d7a&language=pt-BR&page=1") else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { data, response in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: MovieResults.self, decoder: JSONDecoder())
            .sink { completion in
                print("Completion: \(completion)")
            } receiveValue: { returnedMovies in
                self.movies = returnedMovies
            }
            .store(in: &cancellables)
    }
}
