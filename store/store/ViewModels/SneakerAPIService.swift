//
//  SneakerAPIService.swift
//  store
//
//  Created by Greylin  on 5/4/25.
//
import Foundation



enum SneakerAPIServiceError: Error {
    case invalidURL
    case noData
    case parsingError(Error)
}

class SneakerAPIService: SneakerAPIServiceProtocol {

    func fetchSneakers(completion: @escaping (Result<SneakersResponse, Error>) -> Void) {

        guard
            let url = URL(
                string:
                    "https://raw.githubusercontent.com/Stupidism/goat-sneakers/refs/heads/master/api.json"
            )
        else {
            completion(.failure(SneakerAPIServiceError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(SneakerAPIServiceError.noData))
                return
            }

            if let stringResponse = self.parseJSON(data: data) {
                completion(.success(stringResponse))
            } else {
                completion(.failure(SneakerAPIServiceError.parsingError("Error parsing JSON" as! Error)))
            }

        }.resume()
    }

    func parseJSON(data: Data) -> SneakersResponse? {
        do {
            if String(data: data, encoding: .utf8) != nil {

                if let jsonObject = try JSONSerialization.jsonObject(
                    with: data,
                    options: []
                ) as? [String: Any] {

                    if let healthcheckDict = jsonObject["healthcheck"]
                        as? [String: Any],
                        let message = healthcheckDict["message"] as? String
                    {
                        let healthcheck = HealthCheck(message: message)
                        if let sneakersArray = jsonObject["sneakers"]
                            as? [[String: Any]]
                        {

                            var sneakers: [Sneaker] = []
                            let newCategories = [
                                "Running", "Sneakers", "Formal", "Casual",
                            ]

                            for sneakerDict in sneakersArray {

                                let id =
                                    sneakerDict["id"] as? Int
                                    ?? UUID().hashValue
                                let name =
                                    (sneakerDict["silhouette"] as? String
                                        ?? "Unknown")
                                    + (sneakerDict["nickname"] as? String
                                        ?? "Unknown")
                                let price =
                                    sneakerDict["retail_price_cents"] as? Int
                                    ?? 0
                                let imageName =
                                    sneakerDict["main_picture_url"] as? String
                                    ?? "placeholder_image"
                                let category =
                                    sneakerDict["category"] as? [String]
                                    ?? ["All"]

                                let sneaker = Sneaker(
                                    id: id,
                                    name: name,
                                    price: price,
                                    imageName: imageName,
                                    discount: "",
                                    category: category
                                )
                                sneakers.append(sneaker)

                                //                                var sneakerCopy = sneaker
                                //                                let randomCategory = newCategories.randomElement() ?? "Unknown"
                                //                                sneakerCopy.category = [randomCategory]
                                //                                sneakers.append(sneakerCopy)
                            }

                            return SneakersResponse(
                                healthcheck: healthcheck,
                                sneakers: sneakers
                            )

                        }

                    }

                }
            }
        } catch {
            print("Error parsing JSON: \(error)")
        }
        return nil
    }

}
