import 'dart:io';
import 'package:test/test.dart';


class GameOfLife {
  late List<List<bool>> _grid;
  late int _rows;
  late int _cols;

  GameOfLife(List<List<bool>> grid) {
    _grid = List.generate(grid.length, (i) => List.from(grid[i]));
    _rows = grid.length;
    _cols = grid[0].length;
  }

  List<List<bool>> get grid => _grid;

  void tick() {
    final List<List<bool>> newGrid = List.generate(_rows, (i) => List<bool>.filled(_cols, false));
    for (int row = 0; row < _rows; row++) {
      for (int col = 0; col < _cols; col++) {
        final alive = _grid[row][col];
        final neighbors = _countNeighbors(row, col);
        if (alive && (neighbors == 2 || neighbors == 3)) {
          newGrid[row][col] = true;
        } else if (!alive && neighbors == 3) {
          newGrid[row][col] = true;
        }
      }
    }
    _grid = newGrid;
  }

  void displayGrid() {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        stdout.write(grid[i][j] ? '#' : '.');
      }
      stdout.write('\n');
    }
  }

  int _countNeighbors(int row, int col) {
    int count = 0;
    for (int r = row - 1; r <= row + 1; r++) {
      for (int c = col - 1; c <= col + 1; c++) {
        if (r >= 0 && r < _rows && c >= 0 && c < _cols && _grid[r][c]) {
          count++;
        }
      }
    }
    if (_grid[row][col]) {
      count--;
    }
    return count;
  }
}

void main() {
  group('Game of Life', () {
    test('empty grid should stay empty', () {
      final grid = [
        [false, false, false],
        [false, false, false],
        [false, false, false],
      ];
      final game = GameOfLife(grid);
      game.tick();
      expect(game.grid, equals(grid));
    });

    test('blinker should oscillate', () {
      final grid = [
        [false, true, false],
        [false, true, false],
        [false, true, false],
      ];
      final expected = [
        [false, false, false],
        [true, true, true],
        [false, false, false],
      ];
      final game = GameOfLife(grid);
      game.tick();
      expect(game.grid, equals(expected));
      game.tick();
      expect(game.grid, equals(grid));
    });

    test('glider should move diagonally', () {
      final grid = [
        [false, false, true],
        [true, false, true],
        [false, true, true],
      ];
      final expected1 = [
        [false, true, false],
        [false, false, true],
        [false, true, true],
      ];
      final expected2 = [
        [false, false, false],
        [false, false, true],
        [false, true, true],
      ];
      final game = GameOfLife(grid);
      game.tick();
      expect(game.grid, equals(expected1));
      game.tick();
      expect(game.grid, equals(expected2));
    });
  });

  test('should count 8 neighbors for middle cell', () {
    final grid = [
      [true, true, true],
      [true, false, true],
      [true, true, true],
    ];
    final game = GameOfLife(grid);
    final count = game._countNeighbors(1, 1);
    expect(count, equals(8));
  });

  test('should count 3 neighbors for corner cell', () {
    final grid = [
      [false, true, false],
      [true, true, false],
      [false, false, false],
    ];
    final game = GameOfLife(grid);
    final count = game._countNeighbors(0, 0);
    expect(count, equals(3));
  });

  test('should count 1 neighbors for edge cell', () {
    final grid = [
      [false, false, false],
      [false, true, false],
      [false, false, false],
    ];
    final game = GameOfLife(grid);
    final count = game._countNeighbors(0, 2);
    expect(count, equals(1));
  });
  test('should correctly handle empty grid', () {
    final grid = [
      [false, false, false, false, false, false, false, false],
      [false, false, false, false, false, false, false, false],
      [false, false, false, false, false, false, false, false],
      [false, false, false, false, false, false, false, false],
      [false, false, false, false, false, false, false, false],
    ];
    final expected = [
      [false, false, false, false, false, false, false, false],
      [false, false, false, false, false, false, false, false],
      [false, false, false, false, false, false, false, false],
      [false, false, false, false, false, false, false, false],
      [false, false, false, false, false, false, false, false],
    ];
    final game = GameOfLife(grid);
    game.tick();
    expect(game.grid, equals(expected));
  });
  test('should correctly update blinker pattern', () {
    final grid = [
      [false, false, false, false, false, false, false, false],
      [false, false, false, false, false, false, false, false],
      [false, false, true, false, false, false, false, false],
      [false, false, true, false, false, false, false, false],
      [false, false, true, false, false, false, false, false],
    ];
    final expected = [
      [false, false, false, false, false, false, false, false],
      [false, false, false, false, false, false, false, false],
      [false, false, false, false, false, false, false, false],
      [false, true, true, true, false, false, false, false],
      [false, false, false, false, false, false, false, false],
    ];
    final game = GameOfLife(grid);
    game.tick();
    expect(game.grid, equals(expected));
  });
  test('should correctly update glider pattern', () {
    final grid = [
      [false, false, false, false, false, false, false, false],
      [false, false, true, false, false, false, false, false],
      [false, false, false, true, false, false, false, false],
      [false, true, true, true, false, false, false, false],
      [false, false, false, false, false, false, false, false],
    ];
    final expected =  [
      [false, false, false, false, false, false, false, false],
      [false, false, false, false, false, false, false, false],
      [false, true, false, true, false, false, false, false],
      [false, false, true, true, false, false, false, false],
      [false, false, true, false, false, false, false, false]
    ];
    final game = GameOfLife(grid);
    game.tick();
    expect(game.grid, equals(expected));
  });
  // final grid = [
  //   [false, false, false, false, false, false, false, false],
  //   [false, false, true, true, true, false, false, false],
  //   [false, false, false, true, false, false, false, true],
  //   [false, true, true, true, false, false, true, false],
  //   [false, false, false, false, false, false, false, true],
  // ];
  // final game = GameOfLife(grid);
  // for(int i =0; i <= 10; i++){
  //   game.tick();
  //   print("$i -----------------");
  //   game.displayGrid();
  // }
}