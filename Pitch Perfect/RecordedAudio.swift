//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by AJ Webb on 4/20/15.
//  Copyright (c) 2015 AJ Webb. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    let filePathUrl: NSURL!
    let title: String!

    init(title: String, filePathUrl: NSURL) {
        // Initialiaze our model
        self.title = title
        self.filePathUrl = filePathUrl
    }
}