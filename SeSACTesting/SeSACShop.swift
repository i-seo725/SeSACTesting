//
//  SeSACShop.swift
//  SeSACTesting
//
//  Created by 이은서 on 12/18/23.
//

import Foundation
import StoreKit

class SeSACShop: ObservableObject {
    
    @Published var allProducts: [Product] = [] //인앱 상품 조회
    
    func fetchAllProducts() async {
        
        do {
            let product = try await Product.products(for: [
                "com.eunseo.SeSACTestingUITests.ruby100",
                "com.eunseo.SeSACTestingUITests.removeADs"
            ])
            allProducts = product
        } catch {
            print(error)
        }
        
    }
    
}
