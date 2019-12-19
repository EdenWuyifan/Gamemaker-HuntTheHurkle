# Gamemaker-HuntTheHurkle
This is a simple game "Hunt the Hurkle" made by Game Maker Studio 2
The hurkle is a creature that hides in a randomly chosen location in a 100x100 grid. The user can guess where the hurkle is by entering a number in the form “x,y”. For example:
50,99↩
If the hurkle is found, the player wins. If the hurkle is not at that location, the game responds with “Go North/Northeast/East … etc” to guide the player in the right direction (0,0 is far northwest, 99,99 is the furthest location southeast). The user has 10 guesses. If all of them are used, the hurkle gets away, and a failure message is displayed. If the location of the hurkle is guessed, the player is congratulated. In both cases, the game restarts with a new random location.
