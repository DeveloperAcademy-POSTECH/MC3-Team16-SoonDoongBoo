//
//  Hospital.swift
//  Dear
//
//  Created by 정지혁 on 2022/07/19.
//

import Foundation

struct Hospital {
    var hospitalName: String
    
    var dictionary: [String : Any] {
        return ["hospitalName": hospitalName]
    }
}

extension Hospital: DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let hospitalName = dictionary["HospitalName"] as? String else { return nil }
        
        self.init(hospitalName: hospitalName)
    }
}
