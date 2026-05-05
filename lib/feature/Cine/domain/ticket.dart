class Ticket {
  final String seat;
  final String movieTitle;
  final double price;
  final DateTime purchasedAt;

  Ticket({
    required this.seat,
    required this.movieTitle,
    required this.price,
    required this.purchasedAt,
  });

  Map<String, dynamic> toJson() =>{
  
      'movieTitle': movieTitle,
      'seat': seat,
      'price': price,
      'purchasedAt': purchasedAt.toIso8601String(),
    };
  
    factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        movieTitle: json['movieTitle'] as String,
        seat: json['seat'] as String,
        price: (json['price'] as num).toDouble(),
        purchasedAt: DateTime.parse(json['purchasedAt'] as String),
      );
}