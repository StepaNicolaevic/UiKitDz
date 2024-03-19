// NetWorkservice.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

///// fesfe
// struct Recipe: Codable {
//    var label: String
// }
//
///// dqwqdad
// struct Hipess: Codable {
//    var hits: Recipe
// }
/// Protocol for network service in app
protocol NetworkServiceProtocol {
    /// Try to download requested recipes
    /// - Parameters:
    /// type: type of category
    /// completion: closure to handle results
    /// - Returns: Array of recipes if success, or error in case of failure
//    func getRecipes(type: CategoryType, completion: @escaping (Result<[Recipe], Error>) -> ())
//
//    /// Try to download requested recipe
    /// - Parameters:
    /// url: recipe url for detailed search
    /// completion: closure to handle results
    /// - Returns: Recipe if success, or error in case of failure
    func getRecipe(url: String, completion: @escaping (Result<RecipeDetail, Error>) -> ())
}

/// Download data from server
final class NetworkService {
    // MARK: - Private Properties

    private let decoder = JSONDecoder()
    private var requestCreator: RequestCreatorProtocol

    // MARK: - Initialization

    init(requestCreator: RequestCreatorProtocol) {
        self.requestCreator = requestCreator
    }

    // MARK: - Private Methods

    private func getData<T: Codable>(
        request: URLRequest?,
        parseProtocol: T.Type,
        completion: @escaping (Result<T, Error>) -> ()
    ) {
        guard let request else { return }
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let self else { return }
            // Try to download data
            guard let downloadedData = data else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            // Try to decode downloaded data
            do {
                let parsedData = try self.decoder.decode(parseProtocol, from: downloadedData)
                completion(.success(parsedData))
            } catch { completion(.failure(error)) }
        }
        task.resume()
    }
}

/// Protocol for URL request creation
protocol RequestCreatorProtocol {
    /// Provide URL request for getting recipes by category and search text
    /// - Parameters:
    /// type: type of desired category
    /// text: text from search bar entered by user
    /// - Returns: URL request with necessary parameters
//    func createCategoryURLRequest(type: CategoryType, text: String) -> URLRequest?
    /// Provide URL request for getting recipes by category and search text
    /// - Parameters:
    /// uri: Recipe ID
    /// - Returns: URL request with necessary parameters
    func createRecipeURLRequest(uri: String) -> URLRequest?
}

/// Creates URLRequests for NetworkServiceProtocol
final class RequestCreator {
    private func makeQueryItemRecipe() -> [URLQueryItem] {
        let typeQuery = URLQueryItem(name: "type", value: "public")
        let appKeyQuery = URLQueryItem(name: "app_key", value: "7e02a24790f9c127571b1a3bad7028d5")
        let appIdQuery = URLQueryItem(name: "app_id", value: "cb462440")
        let imageSizeQuery = URLQueryItem(name: "imageSize", value: "THUMBNAIL")
        let queries: [URLQueryItem] = [typeQuery, appIdQuery, appKeyQuery, imageSizeQuery]
        return queries
    }
}

// MARK: - RequestCreator - RequestCreatorProtocol

extension RequestCreator: RequestCreatorProtocol {
    func createRecipeURLRequest(uri: String) -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.edamam.com"
        components.path = "/api/recipes/v2/\(uri)"
        components.queryItems = makeQueryItemRecipe()
        guard let url = components.url else { return nil }
        return URLRequest(url: url)
    }
}

// MARK: - NetworkService - NetworkServiceProtocol

extension NetworkService: NetworkServiceProtocol {
    func getRecipe(url: String, completion: @escaping (Result<RecipeDetail, Error>) -> ()) {
        let request = requestCreator.createRecipeURLRequest(uri: url)
        print(request ?? "")
        getData(request: request, parseProtocol: Welcome.self) { result in
            switch result {
            case let .success(recipe):
                completion(.success(RecipeDetail(dto: recipe.recipe)))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

/// Welcome
struct Welcome: Codable {
    let recipe: RecipeDetailDTO
}

/// Детальная информация о рецепте
struct RecipeDetailDTO: Codable {
    /// Recipe name
    let label: String
    /// Recipe image
    let image: String
    /// Time to prepare the dish
    let totalTime: Double
    /// Detailed recipe
    let ingredientLines: [String]
    /// Weight of the dish
    let totalWeight: Double
    /// Total Nutrients
    let totalNutrients: NutrientsDTO
}

/// Информация о кбжу
struct NutrientsDTO: Codable {
    /// Number of calories
    let calories: Total
    /// Number of fat
    let fat: Total
    /// Number of calories
    let protein: Total
    /// Number of calories
    let chocdf: Total
    enum CodingKeys: String, CodingKey {
        case calories = "ENERC_KCAL"
        case fat = "FAT"
        case protein = "PROCNT"
        case chocdf = "CHOCDF"
    }
}

/// Количество грамм в блюде
struct Total: Codable {
    /// Value
    let quantity: Double
}

/// Детальная информация о рецепте
struct RecipeDetail {
    /// Recipe name
    let name: String
    /// Recipe image
    let recipeImage: String
    /// Time to prepare the dish
    let timeToCook: Double
    /// Number of calories
    let calories: Double
    /// Detailed recipe
    let description: [String]
    /// Weight of the dish
    let weight: Double
    /// Proteins
    let proteins: Double
    /// Fats
    let fats: Double
    /// Carbohydrates
    let carbohydrates: Double

    init(dto: RecipeDetailDTO) {
        name = dto.label
        timeToCook = dto.totalTime
        recipeImage = dto.image
        description = dto.ingredientLines
        weight = dto.totalWeight
        calories = dto.totalNutrients.calories.quantity
        proteins = dto.totalNutrients.protein.quantity
        fats = dto.totalNutrients.fat.quantity
        carbohydrates = dto.totalNutrients.chocdf.quantity
    }
}
