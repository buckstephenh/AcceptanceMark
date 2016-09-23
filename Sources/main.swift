//
//  main.swift
//  amtool
//
//  Created by Andrea Bizzotto on 09/08/2016.
//  Copyright © 2016 musevisions. All rights reserved.
//

import Foundation

let version = "0.2.0"

let arguments = Arguments(arguments: ProcessInfo.processInfo.arguments)

if arguments.printVersion {
    print("amtool version \(version)")
    exit(0)
}

guard let inputFilePath = arguments.inputFilePath else {
    print("missing input file. Syntax:\namtool -i <input-file.md> [-l swift2|swift3]")
    exit(0)
}

if !FileManager.default.fileExists(atPath: inputFilePath) {
    print("Could not find file at path: \(inputFilePath)")
    exit(0)
}

guard let data = FileManager.default.contents(atPath: inputFilePath) else {
    print("Invalid file contents at path: \(inputFilePath)")
    exit(0)
}

guard let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as? String else {
    print("Could not decode file contents at path: \(inputFilePath)")
    exit(0)
}

let parser = MarkdownDocumentParser()
let result = parser.parse(fileContents: string, inputFilePath: inputFilePath)

//print(result.testSpecs)

let outputDir = (inputFilePath as NSString).deletingLastPathComponent
TestGenerator.generateTests(testSpecs: result.testSpecs, outputDir: outputDir, language: arguments.language)