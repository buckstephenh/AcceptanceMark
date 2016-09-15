//
//  FITTestRunner.swift
//  FitMark
//
//  Created by Andrea Bizzotto on 30/06/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import UIKit

class ImageTests_ImageLoadingTestRunner: ImageTests_ImageLoadingTestRunnable {

    func run(input: ImageTests_ImageLoadingInput) throws -> ImageTests_ImageLoadingOutput {
        return ImageTests_ImageLoadingOutput(loaded: true)
    }
}
