//
//  RouterPath.swift
//  FilipinoDriversManualReviewer
//
//  Created by Viennarz Curtiz on 8/3/23.
//

import Foundation

@MainActor
public class RouterPath: ObservableObject {
    @Published public var path: [RouterDestination] = []
    
    @Published public var presentedSheet: SheetDestination?
    
    public init() { }
    
    public func navigate(to destination: RouterDestination) {
        path.append(destination)
    }
}
