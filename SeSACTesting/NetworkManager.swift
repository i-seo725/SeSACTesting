//
//  NetworkManager.swift
//  SeSACTesting
//
//  Created by 이은서 on 12/13/23.
//

import Foundation
import Alamofire

protocol NetworkProvider {
    func fetchLotto(completionHandler: @escaping (Lotto) -> Void)
}


class NetworkManager: NetworkProvider {
    
    static let shared = NetworkManager()
    private init() { }
    
    let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1000"
    
    func fetchLotto(completionHandler: @escaping (Lotto) -> Void) {
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}



struct Lotto: Codable {
    let drwNoDate: String
    let bnusNo: Int
    let drwtNo1: Int
}
