# Chessclock

A simple Flutter chess clock that flips for user convenience.

## Overview

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Features
- Simple and intuitive interface
- Flip functionality to switch active player
- Adjustable timers

## Installation
1. Clone or download this repository
2. Open the project in your preferred IDE
3. Run "flutter pub get" to install dependencies

## Usage
Start the app and tap to toggle the clock between players.
Reset or adjust the timers in the UI as needed.

## Diagram

```
         +----------+        +----------+
         | Player 1 |        | Player 2 |
         +----+-----+        +-----+----+
              |                   |
              v                   v
         +-----------------------------+
         |        ChessClock UI       |
         +-----------------------------+
              ^                   ^
              |                   |
              +-------------------+
