//
//  String+IsValidURL.swift
//  Link It
//
//  Created by Charles Kenney on 10/5/17.
//  Copyright © 2017 Charles Kenney. All rights reserved.
//

import Foundation

extension String {
    
    // returns if the string is a valid URL
    var isValidURL: Bool {
        let pattern = "(\\b(https?|ftp|file)://)?[-a-z0-9+&@#/%?=~_|!:,.;]+[-a-z0-9+&@#/%=~_|]"
        return self.range(of: pattern, options: [.anchored, .regularExpression, .caseInsensitive]) != nil
    }
    
}
