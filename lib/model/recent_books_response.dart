/// status : "ok"
/// total : 20
/// books : [{"id":"1642002283","title":"ASP.NET Core APIs Succinctly","subtitle":"","authors":"Dirk Strauss","image":"https://www.dbooks.org/img/books/1642002283s.jpg","url":"https://www.dbooks.org/aspnet-core-apis-succinctly-1642002283/"},{"id":"9463666656","title":"Numerical Methods for Ordinary Differential Equations","subtitle":"","authors":"Kees Vuik, Fred Vermolen, Martin van Gijzen","image":"https://www.dbooks.org/img/books/9463666656s.jpg","url":"https://www.dbooks.org/numerical-methods-for-ordinary-differential-equations-9463666656/"},{"id":"1492095176","title":"A Practical Guide to Cloud Migration","subtitle":"Essays on Organizational Transformation from Google Practitioners","authors":"Kieran Broadfoot","image":"https://www.dbooks.org/img/books/1492095176s.jpg","url":"https://www.dbooks.org/a-practical-guide-to-cloud-migration-1492095176/"},{"id":"1800648723","title":"The European Experience","subtitle":"A Multi-Perspective History of Modern Europe, 1500-2000","authors":"Jan Hansen, Jochen Hung, Jaroslav Ira, Judit Klement, Sylvain Lesage, Juan Luis Simal, Andrew Tompkins","image":"https://www.dbooks.org/img/books/1800648723s.jpg","url":"https://www.dbooks.org/the-european-experience-1800648723/"},{"id":"5676984863","title":"HackSpace Magazine: Issue 63","subtitle":"February 2023","authors":"HackSpace Team","image":"https://www.dbooks.org/img/books/5676984863s.jpg","url":"https://www.dbooks.org/hackspace-magazine-issue-63-5676984863/"},{"id":"1642002267","title":"Azure Maps Using Blazor Succinctly","subtitle":"","authors":"Michael Washington","image":"https://www.dbooks.org/img/books/1642002267s.jpg","url":"https://www.dbooks.org/azure-maps-using-blazor-succinctly-1642002267/"},{"id":"0984037853","title":"Rules and Laws for Civil Actions 2023","subtitle":"","authors":"Stella Burch Elias, Derek T. Muller, Jason Rantanen, Caroline Sheerin, Maya Steinitz","image":"https://www.dbooks.org/img/books/0984037853s.jpg","url":"https://www.dbooks.org/rules-and-laws-for-civil-actions-2023-0984037853/"},{"id":"1491931663","title":"C++ Today","subtitle":"The Beast is Back","authors":"Jon Kalb, Gašper Ažman","image":"https://www.dbooks.org/img/books/1491931663s.jpg","url":"https://www.dbooks.org/c-today-1491931663/"},{"id":"1940771838","title":"Public Policy","subtitle":"Origins, Practice, and Analysis","authors":"Kimberly Martin, Keith E. Lee Jr, John Powell Hall","image":"https://www.dbooks.org/img/books/1940771838s.jpg","url":"https://www.dbooks.org/public-policy-1940771838/"},{"id":"5672335136","title":"Clojure In Small Pieces","subtitle":"","authors":"Rich Hickey","image":"https://www.dbooks.org/img/books/5672335136s.jpg","url":"https://www.dbooks.org/clojure-in-small-pieces-5672335136/"},{"id":"1119824281","title":"Redis For Dummies","subtitle":"","authors":"Steve Suehring","image":"https://www.dbooks.org/img/books/1119824281s.jpg","url":"https://www.dbooks.org/redis-for-dummies-1119824281/"},{"id":"171147052X","title":"Principles of Finance","subtitle":"","authors":"Alan Adams, Curtis Bacon, Samantha Cooper, Michael Griffin, Kevin Higgins, Larry Musolino","image":"https://www.dbooks.org/img/books/171147052Xs.jpg","url":"https://www.dbooks.org/principles-of-finance-171147052x/"},{"id":"1492038253","title":"Designing Event-Driven Systems","subtitle":"Concepts and Patterns for Streaming Services with Apache Kafka","authors":"Ben Stopford","image":"https://www.dbooks.org/img/books/1492038253s.jpg","url":"https://www.dbooks.org/designing-event-driven-systems-1492038253/"},{"id":"5671713914","title":"Game Based and Adaptive Learning Strategies","subtitle":"","authors":"Carrie Lewis Miller, Odbayar Batsaikhan, Yilin (Leon) Chen, Elizabeth Pluskwik, Jeffrey R. Pribyl","image":"https://www.dbooks.org/img/books/5671713914s.jpg","url":"https://www.dbooks.org/game-based-and-adaptive-learning-strategies-5671713914/"},{"id":"1938616049","title":"Erlang Handbook","subtitle":"","authors":"Bjarne Däcker, Robert Virding","image":"https://www.dbooks.org/img/books/1938616049s.jpg","url":"https://www.dbooks.org/erlang-handbook-1938616049/"},{"id":"5671111456","title":"HackSpace Magazine: Issue 62","subtitle":"January 2023","authors":"HackSpace Team","image":"https://www.dbooks.org/img/books/5671111456s.jpg","url":"https://www.dbooks.org/hackspace-magazine-issue-62-5671111456/"},{"id":"1626101221","title":"Introduction to Neuroscience","subtitle":"","authors":"Valerie Hedges","image":"https://www.dbooks.org/img/books/1626101221s.jpg","url":"https://www.dbooks.org/introduction-to-neuroscience-1626101221/"},{"id":"1800648235","title":"Landscapes of Investigation","subtitle":"Contributions to Critical Mathematics Education","authors":"Miriam Godoy Penteado, Ole Skovsmose","image":"https://www.dbooks.org/img/books/1800648235s.jpg","url":"https://www.dbooks.org/landscapes-of-investigation-1800648235/"},{"id":"5671109817","title":"Learn Ruby on Rails: Book Two","subtitle":"","authors":"Daniel Kehoe","image":"https://www.dbooks.org/img/books/5671109817s.jpg","url":"https://www.dbooks.org/learn-ruby-on-rails-book-two-5671109817/"},{"id":"5671109701","title":"Learn Ruby on Rails: Book One","subtitle":"","authors":"Daniel Kehoe","image":"https://www.dbooks.org/img/books/5671109701s.jpg","url":"https://www.dbooks.org/learn-ruby-on-rails-book-one-5671109701/"}]

class RecentBooksResponse {
  RecentBooksResponse({
      this.status, 
      this.total, 
      this.books,});

  RecentBooksResponse.fromJson(dynamic json) {
    status = json['status'];
    total = json['total'];
    if (json['books'] != null) {
      books = [];
      json['books'].forEach((v) {
        books?.add(Books.fromJson(v));
      });
    }
  }
  String? status;
  int? total;
  List<Books>? books;
RecentBooksResponse copyWith({  String? status,
  int? total,
  List<Books>? books,
}) => RecentBooksResponse(  status: status ?? this.status,
  total: total ?? this.total,
  books: books ?? this.books,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['total'] = total;
    if (books != null) {
      map['books'] = books?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "1642002283"
/// title : "ASP.NET Core APIs Succinctly"
/// subtitle : ""
/// authors : "Dirk Strauss"
/// image : "https://www.dbooks.org/img/books/1642002283s.jpg"
/// url : "https://www.dbooks.org/aspnet-core-apis-succinctly-1642002283/"

class Books {
  Books({
      this.id, 
      this.title, 
      this.subtitle, 
      this.authors, 
      this.image, 
      this.url,});

  Books.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    authors = json['authors'];
    image = json['image'];
    url = json['url'];
  }
  String? id;
  String? title;
  String? subtitle;
  String? authors;
  String? image;
  String? url;
Books copyWith({  String? id,
  String? title,
  String? subtitle,
  String? authors,
  String? image,
  String? url,
}) => Books(  id: id ?? this.id,
  title: title ?? this.title,
  subtitle: subtitle ?? this.subtitle,
  authors: authors ?? this.authors,
  image: image ?? this.image,
  url: url ?? this.url,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['subtitle'] = subtitle;
    map['authors'] = authors;
    map['image'] = image;
    map['url'] = url;
    return map;
  }

}