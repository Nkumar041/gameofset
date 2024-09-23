# Game of Set

### Overview
The **Game of Set** is a multiplayer card game where players try to identify sets of 3 cards from a board of 12. A valid set consists of three cards where each attribute (number, color, shape, shading) is either **all the same** or **all different** across the cards.

### How to Play

1. When prompted, enter the number of players.
2. The game will display a board of 12 cards.
3. Players can identify sets by entering:  [Player Number] [Card Index 1] [Card Index 2] [Card Index 3]

Example:  1 3 5 7 - This means player 1 is identifying cards 3, 5, and 7 as a set

4. If the set is valid, the player's score increases, and the cards are replaced.
5. The game lasts 120 seconds. The player with the most valid sets wins.

### Running the Game

1. Make sure Ruby is installed.
2. Clone/download the repository.
3. In the terminal, navigate to the game directory and run:
```bash
ruby main.rb
```
4. Enter the number of players and follow the instructions.
