class Home {
  final String id;
  final String title;
  final String description;
  final List<String> imageUrls;
  final double price;
  final double rating;
  final List<String> morePicturesUrls;

  const Home({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrls,
    required this.price,
    required this.rating,
    required this.morePicturesUrls,
  });
  static const List<Home> home = [
    Home(
      id: '1',
      title: 'Serengeti National Park',
      description:
          'Serengeti National Park is a World Heritage Site teeming with wildlife.',
      imageUrls: [
        'https://images.pexels.com/photos/5574041/pexels-photo-5574041.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/59840/elephant-baby-safari-elephants-africa-59840.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/1320609/pexels-photo-1320609.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/789630/pexels-photo-789630.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/7280783/pexels-photo-7280783.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
      ],
      price: 650,
      rating: 5,
    ),
    Home(
      id: '2',
      title: 'Mikumi',
      description: 'Visit one of the best parks in the whole world',
      imageUrls: [
        'https://www.serengeti.com/assets/img/safari-game-drive-seronera-serengeti.jpg',
        'https://images.unsplash.com/photo-1673283962130-5e4bf3a0c3d4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
        'https://images.unsplash.com/photo-1528653758863-fd770c52989b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzN8fG5nb3Jvbmdvcm8lMjBjcmF0ZXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/15821364/pexels-photo-15821364/free-photo-of-lion-on-savannah.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/12004890/pexels-photo-12004890.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
      ],
      price: 450,
      rating: 4,
    ),
    Home(
      id: '3',
      title: 'Ngorongoro',
      description: 'Visit one of the best parks in the whole world',
      imageUrls: [
        'https://images.pexels.com/photos/5127548/pexels-photo-5127548.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://plus.unsplash.com/premium_photo-1664304474148-2a1c02c75b13?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bmdvcm9uZ29ybyUyMGNyYXRlcnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
        'https://images.unsplash.com/photo-1634662059016-901592c88dca?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/59840/elephant-baby-safari-elephants-africa-59840.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/10740862/pexels-photo-10740862.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
      ],
      price: 550,
      rating: 4,
    ),
    Home(
      id: '4',
      title: 'Zanzibar',
      description: 'Beautiful island of Africa',
      imageUrls: [
        'https://images.pexels.com/photos/14667393/pexels-photo-14667393.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.unsplash.com/photo-1575999502951-4ab25b5ca889?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80',
        'https://images.unsplash.com/photo-1621583628955-42fbc37bf424?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8emFuemliYXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
        'https://images.unsplash.com/photo-1619088238706-e603ac6df0de?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=736&q=80',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/6056774/pexels-photo-6056774.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/6056772/pexels-photo-6056772.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ],
      price: 750,
      rating: 5,
    ),
    Home(
      id: '5',
      title: 'Selous Game Reserve',
      description: 'Beautiful island of Africa',
      imageUrls: [
        'https://images.pexels.com/photos/14032575/pexels-photo-14032575.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
        'https://images.unsplash.com/photo-1673283961733-244a7879ac2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80',
        'https://images.unsplash.com/photo-1673283962128-348e2cc77f51?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1171&q=80',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/14721501/pexels-photo-14721501.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/6476604/pexels-photo-6476604.jpeg?auto=compress&cs=tinysrgb&w=600',
      ],
      price: 750,
      rating: 5,
    ),
    Home(
      id: '6',
      title: 'Ruaha National Park',
      description: 'Beautiful island of Africa',
      imageUrls: [
        'https://images.pexels.com/photos/10528703/pexels-photo-10528703.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/3566237/pexels-photo-3566237.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.unsplash.com/photo-1634662052101-78f72e8307be?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1171&q=80',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/14089446/pexels-photo-14089446.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/15882073/pexels-photo-15882073/free-photo-of-hot-air-ballon.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ],
      price: 750,
      rating: 5,
    ),
    Home(
      id: '7',
      title: 'Mahale Mountains',
      description: 'Beautiful island of Africa',
      imageUrls: [
        'https://images.pexels.com/photos/631317/pexels-photo-631317.jpeg?auto=compress&cs=tinysrgb&w=600',
        'https://images.unsplash.com/photo-1631222240703-e93e07351646?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=713&q=80',
        'https://images.unsplash.com/photo-1631182956979-d45cec60a847?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/16064257/pexels-photo-16064257/free-photo-of-bush-animal-grass-park.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/15994048/pexels-photo-15994048/free-photo-of-wood-animal-park-tree.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ],
      price: 750,
      rating: 5,
    ),
    Home(
      id: '8',
      title: 'Udzungwa Mountains',
      description: 'Beautiful island of Africa',
      imageUrls: [
        'https://www.serengeti.com/assets/img/wildlife-central-seronera-central.jpg',
        'https://images.unsplash.com/photo-1612358405627-3721c6fc5fac?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1282&q=80',
        'https://images.unsplash.com/photo-1543910981-f310efe9b7f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/15821221/pexels-photo-15821221/free-photo-of-leopard-on-tree.jpeg?auto=compress&cs=tinysrgb&w=600',
        'https://images.pexels.com/photos/15994045/pexels-photo-15994045/free-photo-of-dawn-sunset-animal-grass.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ],
      price: 750,
      rating: 5,
    ),
  ];
}
