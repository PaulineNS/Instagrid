//
//  MainViewModel.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 21/10/2020.
//  Copyright © 2020 PaulineNomballais. All rights reserved.
//

import Foundation

final class MainViewModel {
    
    private weak var delegate: GridScreenDelegate?
    
    // MARK: - Initializer
    
    init(delegate: GridScreenDelegate?) {
        self.delegate = delegate
    }
    
    func isGridCompleted(for grid: GridHandler, completion: @escaping (Bool) -> Void) {
        if grid.isGridCompleted() {
            completion(true)
        } else {
            DispatchQueue.main.async {
                self.delegate?.gridScreenShouldDisplayAlert(for: .gridNotCompleted)
            }
        }
    }
    
}
