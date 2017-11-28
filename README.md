# knights-travail

This is a solution for the [The Odin Project: Data Structures and Algorithms.](https://www.theodinproject.com/lessons/data-structures-and-algorithms)

This project finds the shortest path a knight can take between two squares on a chess board.

## Background 

A knight can move to any square on a chess board, given enough turns. It can even make the [Knight's Tour](https://www.wikiwand.com/en/Knight%27s_tour), visiting every square only once.

![Knight's Tour animation](https://upload.wikimedia.org/wikipedia/commons/d/da/Knight%27s_tour_anim_2.gif?1511894259764)

## Implementation

A tree is structure is used to map all possible paths the knight could take. The knight's starting position acts as the root of the tree. Each node represents a position on the board, which could be arrived at in a single move from the parent node.

For each node, possible moves are determined and inserted as children. The new nodes are then searched for a solution. New nodes are inserted until the node containing the final position is found. The path is then traced up through the final node's parents.

Since a search is conducted at every new level of the tree, the first path found must be the shortest.

## Usage

```bash
> knight_path([0,4],[5,7])
=> (0, 4) -> (2, 5) -> (4, 6) -> (6, 5) -> (5, 7)
```