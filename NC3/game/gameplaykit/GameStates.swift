//
//  GameStates.swift
//  NC3
//
//  Created by Bruno Pastre on 18/02/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import GameplayKit

class IdleState: GKState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == PlayingState.self
    }
}

class PlayingState: GKState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == PausedState.self || stateClass == GameOverState.self
    }
}

class PausedState: GKState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == PlayingState.self || stateClass == IdleState.self
    }
}

class GameOverState: GKState {
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass == PlayingState.self || stateClass == IdleState.self
    }
}
