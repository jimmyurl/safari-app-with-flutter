class Flight {
  final String id;
  final String title;
  final String description;
  final List<String> imageUrls;
  final double price;
  final double rating;
  final List<String> morePicturesUrls;
  final String location;
  final List<String> phoneNumbers;
  final double latitude;
  final double longitude;

  const Flight({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrls,
    required this.price,
    required this.rating,
    required this.morePicturesUrls,
    required this.location,
    required this.phoneNumbers,
    required this.latitude,
    required this.longitude,
  });
  static const List<Flight> northernCircuitFlights = [
    Flight(
      id: '1',
      title: 'Auric Air Services Limited.',
      description:
          '"Auric Air Services Ltd" is Tanzanias preferred corporate and safari airline with a wide network of domestic scheduled services. From its bases at Mwanza Airport - Mwanza‚ Julius Nyerere International Airport - Dar-es-salaam and Arusha Airport‚ Auric Air provides scheduled flights to some of the most remote and otherwise inaccessible destinations within Tanzania. ',
      imageUrls: [
        'https://storage.aerocrs.com/8/system/Issa%20Homepage%202.jpg',
        'https://storage.aerocrs.com/8/system/Dash%20website%203.jpg',
        'https://storage.aerocrs.com/8/system/Home2.gif',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/15821364/pexels-photo-15821364/free-photo-of-lion-on-savannah.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/12004890/pexels-photo-12004890.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
      ],
      location: 'Arusha',
      phoneNumbers: ['0712428211'],
      latitude: -3.372410844871815,
      longitude: 36.694510174886155,
      price: 450,
      rating: 4,
    ),
    Flight(
      id: '2',
      title: 'Dolphin Tours & Safaris Limited',
      description:
          'Established over 25 years ago to be a competitive, quality operator in tourism logistics and experiences. To be big enough to pass on economies of scale to our customers, but not too big to lose the important personalised service key to travel advice, planning and execution. We understand the key role our employees and equipment plays in delivering business and leisure services.',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipO01PiTt_wi5e6XlliIFUNZnIGJLJF-6HRG1v9C=s3200-w3200-h1522-rw',
        'https://lh3.googleusercontent.com/p/AF1QipNXpTfwZFvbZb0FuYc6oAMYo9y7cq6wmOLhHwrh=s3200-w3200-h1522-rw',
        'https://lh3.googleusercontent.com/p/AF1QipPr8_zYR0-QALLTVh7KJI4AtMfRrormgupSI5sI=s3200-w3200-h1522-rw',
        'https://lh3.googleusercontent.com/p/AF1QipNoZqNnWnTYA-UBJ6koAyrVxGQlGjzzh_LQN71b=s3200-w3200-h1522-rw',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/789630/pexels-photo-789630.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/7280783/pexels-photo-7280783.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
      ],
      location: 'Arusha',
      phoneNumbers: ['0712428211'],
      latitude: -3.372410844871815,
      longitude: 36.694510174886155,
      price: 650,
      rating: 5,
    ),
    Flight(
      id: '3',
      title: 'Copasa Travel and Tours Company.',
      description:
          'Reliable Transportation to attractive destinations in Tanzania',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipPIU4Cu3A23Gnj-DDiexF-5DCOMlXRmUdsNVriJ=s3200-w3200-h1522-rw',
        'https://lh3.googleusercontent.com/p/AF1QipMHf_lUX2AdE4HUH0mvWYkplMzaPC5O2vWC1czJ=s3200-w3200-h1522-rw',
        'https://lh3.googleusercontent.com/p/AF1QipPAe4MkVOos0fXYqWf6AdY91gTmIlc-EwzahK8R=s3200-w3200-h1522-rw',
        'https://lh3.googleusercontent.com/p/AF1QipNNmsphZDwNAuzL366nvJ-7uZURa8DNFPOkl9Rk=s3200-w3200-h1522-rw',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/59840/elephant-baby-safari-elephants-africa-59840.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/10740862/pexels-photo-10740862.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
      ],
      location: 'Arusha',
      phoneNumbers: ['0712428211'],
      latitude: -3.372410844871815,
      longitude: 36.694510174886155,
      price: 550,
      rating: 4,
    ),
    Flight(
      id: '5',
      title: 'African Diurnal Safaris & Tours',
      description:
          'African Diurnal Safaris and Tours is a specialist safari operator with its headquarter office in Mwanza, Tanzania; we offer the best affordable custom safaris to all the top safari destinations throughout East African countries, including the Tanzania and Kenya wildlife safaris, Gorilla and Chimpanzee trekking in Rwanda and Uganda',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipOCD0HODU1eYdFhpPZqepoqUINMdgNuASLvGlIF=s3200-w3200-h1522-rw',
        'https://lh3.googleusercontent.com/p/AF1QipNuACMsjgKdQp16XvsgP5XHhNibk1RXcsiBxczK=s3200-w3200-h1522-rw',
        'https://lh3.googleusercontent.com/p/AF1QipNZBoLyktkrppv5xPrFdzFe8sX-mgVjj9NZ8Znq=s3200-w3200-h1522-rw',
        'https://lh3.googleusercontent.com/p/AF1QipPOyHNlkQc_P7CjZOETBXvxpnmOqhCxsgyTht4L=s3200-w3200-h1522-rw',
        'https://images.pexels.com/photos/14032575/pexels-photo-14032575.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
        'https://images.unsplash.com/photo-1673283961733-244a7879ac2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80',
        'https://images.unsplash.com/photo-1673283962128-348e2cc77f51?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1171&q=80',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/14721501/pexels-photo-14721501.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/6476604/pexels-photo-6476604.jpeg?auto=compress&cs=tinysrgb&w=600',
      ],
      location: 'Arusha',
      phoneNumbers: ['0712428211'],
      latitude: -3.372410844871815,
      longitude: 36.694510174886155,
      price: 750,
      rating: 5,
    ),
    Flight(
      id: '6',
      title: 'Sote Tours & Travel',
      description:
          'Welcome to Sote Tours and Travel, dedicated to providing the ultimate travel experience for adventurers and thrill-seekers alike. Our team of expert guides and travel planners will help you discover the best destinations and experience the highest level of customer service., whether you are looking for an epic wildlife safari in Tanzania, vibrant cities, ancient ruins, a thrilling Mount Kilimanjaro climb or a relaxing beach getaway in Zanzibar.',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipMalisBz5fqQNbAn9uDhici-RAmoQJ0MiSJvK33=s3200-w3200-h1522-rw',
        'https://lh3.googleusercontent.com/p/AF1QipOmyfMuqGQbGiwNw-WirTEHTAn5UArrwzsnkX9J=s3200-w3200-h1522-rw',
        'https://lh3.googleusercontent.com/p/AF1QipOO7hdQ-8U3WmEXS4sFY75qsm9Itnc5_Pm0Z2wr=s3200-w3200-h1522-rw',
        'https://lh3.googleusercontent.com/p/AF1QipNPx2kgi2CO6-wZ4bBSLOCdZoSA6Gxn287i6GVw=s3200-w3200-h1522-rw',
        'https://images.pexels.com/photos/10528703/pexels-photo-10528703.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/3566237/pexels-photo-3566237.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.unsplash.com/photo-1634662052101-78f72e8307be?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1171&q=80',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/14089446/pexels-photo-14089446.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/15882073/pexels-photo-15882073/free-photo-of-hot-air-ballon.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ],
      location: 'Arusha',
      phoneNumbers: ['0712428211'],
      latitude: -3.372410844871815,
      longitude: 36.694510174886155,
      price: 750,
      rating: 5,
    ),
  ];
  static const List<Flight> southernCircuitFlights = [
    Flight(
      id: '8',
      title: 'Zara Tours Kilimanjaro Tanzania',
      description:
          'Zara Tours is a local company, established in 1986 located in Moshi, Tanzania, providing high quality travel and tour services in the East Africa. Zara Tours has evolved into Tanzania’s largest Kilimanjaro outfitter and one of the largest safari operators in Tanzania',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipNLpZFwx5Z318H8hVJMz1qYSanT9SEzxUdCxOQW=s3200-w3200-h1522-rw',
      ],
      morePicturesUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipOUKWwmBq6NbIjMmHgClfzQcsjDgPqTdy3uILgG=s3200-w3200-h1522-rw',
        'https://lh3.googleusercontent.com/p/AF1QipOD7Dhhga_TYXCo1VUTfUk7tQOOZXzEUqqwKouo=s3200-w3200-h1522-rw',
        'https://lh3.googleusercontent.com/p/AF1QipM8PlcvHFRf-dsa1IEukexiuPcOz99rwd44PPqX=s3200-w3200-h1522-rw',
        'https://www.serengeti.com/assets/img/wildlife-central-seronera-central.jpg',
        'https://images.unsplash.com/photo-1612358405627-3721c6fc5fac?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1282&q=80',
        'https://images.unsplash.com/photo-1543910981-f310efe9b7f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
      ],
      location: 'Arusha',
      phoneNumbers: ['0712428211'],
      latitude: -3.372410844871815,
      longitude: 36.694510174886155,
      price: 750,
      rating: 5,
    ),
    Flight(
      id: '4',
      title: 'Trust Tours and Safaris Tanzania',
      description:
          'We are Tanzanian tour experts providing the largest range of all-inclusive tour packages and combinations which we can customise to meet your requirements.',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipMDEc1gEMjjzWHua86BRBEau6_s0Lc4hbMk6Sc_=s3200-w3200-h1522-rw',
      ],
      morePicturesUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipO3mz2fw0jaqcbpAk6X5yCHDE-gUWRtFiolImjx=s3200-w3200-h1522-rw',
        'https://lh3.googleusercontent.com/p/AF1QipNTOPJXYUnVLiQOcO_cfcws2s0A15fztLRW-02K=s3200-w3200-h1522-rw',
        'https://lh3.googleusercontent.com/p/AF1QipMcIOYUq5_tiSpl1wsyWzuNZjv2j0a9FJEj_sw=s3200-w3200-h1522-rw',
      ],
      location: 'Arusha',
      phoneNumbers: ['0712428211'],
      latitude: -3.372410844871815,
      longitude: 36.694510174886155,
      price: 750,
      rating: 5,
    ),
    Flight(
      id: '7',
      title: 'Ngaiza Adventures Limited.',
      description:
          'Ngaiza Adventures is the best tour safari agency, company, operator among the tour safari agencies, tour operators and tour companies in Arusha, Moshi Kilimanjaro, Dar es salaam and Zanzibar in Tanzania.',
      imageUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipMpJ3mT4dYDVIawOiQN-sa5gpZaH4eGE2QA4TGq=s3200-w3200-h1522-rw',
      ],
      morePicturesUrls: [
        'https://lh3.googleusercontent.com/p/AF1QipM8_kJHl6bOTn5_nwlby5LlTvpmTVlDkuNIU-IO=s3200-w3200-h1522-rw',
        'https://lh3.googleusercontent.com/p/AF1QipNX6lUy_n5ZIjqcyhHyr72Whu_Who0ugKi7pSiA=s3200-w3200-h1522-rw',
        'https://lh3.googleusercontent.com/p/AF1QipN3mDKr3hEy18N1EH8oXV_bs0PVt4PJ9JDjZKLB=s3200-w3200-h1522-rw',
        'https://images.pexels.com/photos/631317/pexels-photo-631317.jpeg?auto=compress&cs=tinysrgb&w=600',
        'https://images.unsplash.com/photo-1631222240703-e93e07351646?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=713&q=80',
        'https://images.unsplash.com/photo-1631182956979-d45cec60a847?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
      ],
      location: 'Arusha',
      phoneNumbers: ['0712428211'],
      latitude: -3.372410844871815,
      longitude: 36.694510174886155,
      price: 750,
      rating: 5,
    ),
  ];
}
