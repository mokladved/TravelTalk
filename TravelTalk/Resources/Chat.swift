//
//  Chat.swift
//  SeSAC7Step1Remind
//
//  Created by Jack on 7/18/25.
//

import Foundation
//채팅 화면에서 사용할 데이터 구조체
struct Chat {
    let user: User
    let date: String
    let message: String
    
    var formattedDate: String {
        let originalFormatter = DateFormatter()
        originalFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        guard let date = originalFormatter.date(from: date) else {
            return ""
        }
        
        let convertingFormmater = DateFormatter()
        convertingFormmater.dateFormat = "yy.MM.dd"
        return convertingFormmater.string(from: date)

    }
}
