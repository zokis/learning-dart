import 'package:test/test.dart';

class Book {
  final String title;
  final String author;
  final String genre;
  bool isAvailable;

  Book(this.title, this.author, this.genre, {this.isAvailable = true});

  void borrow() {
    if (!isAvailable) {
      throw StateError('$title by $author is not available for borrowing.');
    }
    isAvailable = false;
  }

  void returnBook() {
    if (isAvailable) {
      throw StateError('$title by $author has not been borrowed.');
    }
    isAvailable = true;
  }
}

class Library {
  List<Book> books;

  Library(this.books);

  void addBook(Book book) {
    books.add(book);
  }

  void removeBook(Book book) {
    books.remove(book);
  }

  bool isBookAvailable(Book book) {
    return searchByTitle(book.title).where((book) => book.isAvailable).length > 0;
  }

  List<Book> getBooks() {
    return books;
  }

  List<Book> searchByTitle(String query) {
    return books.where((book) => book.title.toLowerCase().contains(query.toLowerCase())).toList();
  }

  List<Book> searchByAuthor(String query) {
    return books.where((book) => book.author.toLowerCase().contains(query.toLowerCase())).toList();
  }

  List<Book> searchByGenre(String query) {
    return books.where((book) => book.genre.toLowerCase().contains(query.toLowerCase())).toList();
  }

  Book borrowBook(String title, String author) {
    final book = books.firstWhere((book) => book.title == title && book.author == author && book.isAvailable);
    book.borrow();
    return book;
  }

  void returnBook(Book book) {
    book.returnBook();
  }
}

void main() {
  group('Book tests', () {
    test('Book values', () {
      final book = Book('A elite do atraso: Da escravidão a Bolsonaro', 'Jessé José Freire de Souza', 'Political Science');
      expect(book.title, equals('A elite do atraso: Da escravidão a Bolsonaro'));
      expect(book.author, equals('Jessé José Freire de Souza'));
      expect(book.genre, equals('Political Science'));
      expect(book.isAvailable, isTrue);
    });
    test('Book borrow', () {
      final book = Book('A elite do atraso: Da escravidão a Bolsonaro', 'Jessé José Freire de Souza', 'Political Science');
      expect(book.isAvailable, isTrue);
      book.borrow();
      expect(book.isAvailable, isFalse);
    });
    test('Book return', () {
      final book = Book('A elite do atraso: Da escravidão a Bolsonaro', 'Jessé José Freire de Souza', 'Political Science', isAvailable:false);
      expect(book.isAvailable, isFalse);
      book.returnBook();
      expect(book.isAvailable, isTrue);
    });
  });
  group('Library tests', () {
    test('Search books by title', () {
      final book1 = Book('A elite do atraso: Da escravidão a Bolsonaro', 'Jessé José Freire de Souza', 'Political Science');
      final library = Library([book1]);
      final book2 = Book('The Origin of the Family, Private Property and the State', 'Friedrich Engels', 'Political Science');
      final book3 = Book('Who Rules the World?', 'Noam Chomsky', 'Philosophy');
      final book4 = Book('Problems of knowledge and freedom (The Russell lectures)', 'Noam Chomsky', 'Philosophy');

      library.addBook(book2);
      library.addBook(book3);
      library.addBook(book4);

      final searchResult = library.searchByTitle('Who Rules the World?');

      expect(searchResult, equals([book3]));
    });

    test('Search books by author', () {
      final book1 = Book('A elite do atraso: Da escravidão a Bolsonaro', 'Jessé José Freire de Souza', 'Political Science');
      final book2 = Book('The Origin of the Family, Private Property and the State', 'Friedrich Engels', 'Political Science');
      final library = Library([book1, book2]);
      final book3 = Book('Who Rules the World?', 'Noam Chomsky', 'Philosophy');
      final book4 = Book('Problems of knowledge and freedom (The Russell lectures)', 'Noam Chomsky', 'Philosophy');

      library.addBook(book3);
      library.addBook(book4);

      final searchResult = library.searchByAuthor('Noam Chomsky');

      expect(searchResult, equals([book3, book4]));
    });

    test('Search books by genre', () {
      final library = Library([]);
      final book1 = Book('A elite do atraso: Da escravidão a Bolsonaro', 'Jessé José Freire de Souza', 'Political Science');
      final book2 = Book('The Origin of the Family, Private Property and the State', 'Friedrich Engels', 'Political Science');
      final book3 = Book('Who Rules the World?', 'Noam Chomsky', 'Philosophy');
      final book4 = Book('Problems of knowledge and freedom (The Russell lectures)', 'Noam Chomsky', 'Philosophy');

      library.addBook(book1);
      library.addBook(book2);
      library.addBook(book3);
      library.addBook(book4);

      final searchResult = library.searchByGenre('Political Science');

      expect(searchResult, equals([book1, book2]));
    });

    test('Borrow and return book', () {
      final library = Library([]);
      final book1 = Book('A elite do atraso: Da escravidão a Bolsonaro', 'Jessé José Freire de Souza', 'Political Science');

      library.addBook(book1);
      library.borrowBook(book1.title, book1.author);
      expect(library.isBookAvailable(book1), isFalse);

      library.returnBook(book1);
      expect(library.isBookAvailable(book1), isTrue);
    });

    test('Manage library collection', () {
      final library = Library([]);
      final book1 = Book('A elite do atraso: Da escravidão a Bolsonaro', 'Jessé José Freire de Souza', 'Political Science');
      final book2 = Book('The Origin of the Family, Private Property and the State', 'Friedrich Engels', 'Political Science');

      library.addBook(book1);
      expect(library.getBooks(), equals([book1]));

      library.addBook(book2);
      expect(library.getBooks(), equals([book1, book2]));

      library.removeBook(book1);
      expect(library.getBooks(), equals([book2]));

      library.removeBook(book2);
      expect(library.getBooks(), isEmpty);
    });
  });
}