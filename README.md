# Lab 3 — Dog Memory Game (MVVM + Animations)

**Student:** Becca Berger
**Course:** CIS 137 — Swift Programming
**Date:** *Insert today’s date*
**Lab Group:** # (If working alone, write “Individual”)

---

## Overview

This project is a *Dog Memory Matching Game* built in *SwiftUI*
The goal was to *rebuild our previous memory game prototype* using the *MVVM architecture*, and then apply at least *one animation or transition* to enhance the gameplay experience.

The user taps cards to reveal images of different dog breeds — when two matching cards are selected, they remain face-up. Otherwise, they flip back over.

---

## MVVM Structure

| File | Responsibility |
|------|----------------|
| `MemoryGame.swift` | **Model** — Defines card structure and game logic (face-up, match state) |
| `DogMemoryGame.swift` | **ViewModel** — Manages game state and exposes card data to the view |
| `ContentView.swift` | **View** — Displays UI using SwiftUI and triggers ViewModel actions |

### Model (MemoryGame.swift)
- Stores game logic for matching cards
- Tracks which cards are face up or matched
- Ensures app rules stay separate from UI code

### ViewModel (DogMemoryGame.swift)
- Creates the game and publishes updates using `@Published`
- Calls model’s `choose()` when the user taps a card
- Acts as the “middle layer” between UI and game logic

### View (ContentView.swift)
- Displays dog breed cards in a grid using **LazyVGrid**
- Calls `viewModel.choose(card)` when tapping a card
- Contains **no game logic** — UI only

---

## Animation / Transition Applied

I applied a **3D flip animation** to the cards using:

```swift
.rotation3DEffect(.degrees(card.isFaceUp ? 180 : 0), axis: (0,1,0))
.animation(.easeInOut(duration: 0.4), value: card.isFaceUp)

Video: https://drive.google.com/file/d/1HtDaNWLJ-ygeIm2yRU7Zg35oMFHXLJxF/view?usp=drive_link
