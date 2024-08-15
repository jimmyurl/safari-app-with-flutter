
class Hotel {
  final String id;
  final String title;
  final String description;
  final List<String> imageUrls;
  final double price;
  final double rating;
  final List<String> morePicturesUrls;
  final String location;
  final String zone;
  final String hotelClass;
  final List<String> amenities;
  final List<String> phoneNumbers;
  final double latitude;
  final double longitude;

  const Hotel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrls,
    required this.price,
    required this.rating,
    required this.morePicturesUrls,
    required this.location,
    required this.zone,
    required this.hotelClass,
    required this.amenities,
    required this.phoneNumbers,
    required this.latitude,
    required this.longitude,
  });

  static List<String> getClasses() {
    // Replace this with your implementation to retrieve the hotel classes
    return [
      '1 Star',
      '2 Star',
      '3 Star',
      '4 Star',
      '5 Star',
    ];
  }

  static List<String> getLocations() {
    return hotels.map((hotel) => hotel.location).toSet().toList();
  }

  static const List<Hotel> hotels = [
    Hotel(
      id: '1',
      title: 'Four Points by Sheraton Arusha, The Arusha Hotel',
      description:
          'Dating from 1894, this refined hotel in lush gardens is off the A104 road, a 6-minute walk from the National Natural History Museum and 49 km from Arusha National Park.',
      imageUrls: [
        'https://cache.marriott.com/content/dam/marriott-renditions/JROFP/jrofp-exterior-3399-hor-clsc.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1215px:*',
        'https://cache.marriott.com/content/dam/marriott-renditions/JROFP/jrofp-lobby-3401-hor-clsc.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1215px:*',
        'https://cache.marriott.com/content/dam/marriott-renditions/JROFP/jrofp-deluxe-guestroom-3405-hor-clsc.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1215px:*',
        'https://cache.marriott.com/content/dam/marriott-renditions/JROFP/jrofp-parachichi-3398-hor-clsc.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1215px:*',
        'https://cache.marriott.com/content/dam/marriott-renditions/JROFP/jrofp-hatari-bar-3397-hor-clsc.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1215px:*',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/789630/pexels-photo-789630.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/7280783/pexels-photo-7280783.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
      ],
      location: 'Arusha',
      zone: 'North',
      price: 650,
      rating: 5,
      hotelClass: '5 Stars',
      amenities: [
        'spa',
        'wifi in lobby',
        'WiFi in Rooms',
        'Pool',
        'Spa',
        'Parking'
      ],
      phoneNumbers: ['0712428211'],
      latitude: -3.372410844871815,
      longitude: 36.694510174886155,
    ),
    Hotel(
      id: '2',
      title: 'Arusha Serena Hotel',
      description:
          'Amid the wooded slopes of Mount Meru, near the shores of Lake Duluti and the A23 highway, this Colonial-style hotel was once a coffee farm plantation 11 km from Mount Meru Waterfall.',
      imageUrls: [
        'https://image-tc.galaxy.tf/wijpeg-2hzb3h8ou3r9suemg0cr37ptu/lakedulutiserena-310.jpg',
        'https://image-tc.galaxy.tf/wijpeg-3pmb77cfwrcdy927dm3h70r4y/lakedulutiserena-323.jpg',
        'https://image-tc.galaxy.tf/wijpeg-dz5xi2r1ev4bqp2b11u7dzvd5/lakedulutiserena-4.jpg',
        'https://image-tc.galaxy.tf/wijpeg-3qnun5drf3nozvjmbu9yxytbw/guest-shop.jpg',
        'https://image-tc.galaxy.tf/wijpeg-boqt20abzq7m2oc775849c2vl/lakedulutiserena-239.jpg',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/15821364/pexels-photo-15821364/free-photo-of-lion-on-savannah.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/12004890/pexels-photo-12004890.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
      ],
      location: 'Arusha',
      zone: 'North',
      price: 450,
      rating: 4,
      hotelClass: '4 Stars',
      amenities: [
        'spa',
        'wifi in lobby',
        'WiFi in Rooms',
        'Pool',
        'Spa',
        'Parking'
      ],
      phoneNumbers: ['0712428211'],
      latitude: -3.372410844871815,
      longitude: 36.694510174886155,
    ),
    Hotel(
      id: '3',
      title: 'Shamba Lodge Arusha',
      description: 'Shamba Lodge',
      imageUrls: [
        'https://shambalodgearusha.com/wp-content/uploads/2020/11/gall-a2-1.jpg',
        'https://shambalodgearusha.com/wp-content/uploads/2020/11/gall-a5.jpg',
        'https://shambalodgearusha.com/wp-content/uploads/2020/11/vabin-new.jpg',
        'https://shambalodgearusha.com/wp-content/uploads/2020/12/OGS0768-HDR-scaled.jpg',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/59840/elephant-baby-safari-elephants-africa-59840.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/10740862/pexels-photo-10740862.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
      ],
      location: 'Arusha',
      zone: 'North',
      price: 150,
      rating: 3,
      hotelClass: '1 Star',
      amenities: ['WiFi in Rooms', 'Pool', 'Parking'],
      phoneNumbers: ['0712428211'],
      latitude: -3.372410844871815,
      longitude: 36.694510174886155,
    ),
    Hotel(
      id: '4',
      title: 'Gran Melia-Arusha',
      description:
          'FeaIn a Cape Dutch-style house on a tree-lined street off the A104 road, this laid-back hotel is 11 minutes on foot from the Arusha National Natural History Museum, and a 13-minute walk from Maasai Market Curios and Crafts.',
      imageUrls: [
        'https://dam.melia.com/melia/accounts/f8/4000018/projects/127/assets/e1/13531/edcfb2364adb67781571614ab5409851-1595540183.jpg?im=RegionOfInterestCrop=(1600,1067),regionOfInterest=(1771.5,1181.0)',
        'https://dam.melia.com/melia/accounts/f8/4000018/projects/127/assets/34/13533/550bcd33aeb137ca739f4d0aec3f41e0-1595540183.jpg?im=RegionOfInterestCrop=(1600,979),regionOfInterest=(1476.5,903.0)',
        'https://dam.melia.com/melia/accounts/f8/4000018/projects/127/assets/10/13535/77150a76873e476f203c58388c5dde41-1595540183.jpg?im=RegionOfInterestCrop=(1600,1092),regionOfInterest=(1476.5,1007.5)',
        'https://dam.melia.com/melia/accounts/f8/4000018/projects/127/assets/f2/13542/b8f914299c57ef846201616fb371e080-1595540220.jpg?im=RegionOfInterestCrop=(1600,1068),regionOfInterest=(1476.5,984.5)',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/6056774/pexels-photo-6056774.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/6056772/pexels-photo-6056772.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ],
      location: 'Arusha',
      zone: 'North',
      price: 750,
      rating: 5,
      hotelClass: '5 Stars',
      amenities: ['wifi in lobby', 'WiFi in Rooms', 'Pool', 'Spa', 'Parking'],
      phoneNumbers: ['0712428211'],
      latitude: -3.372410844871815,
      longitude: 36.694510174886155,
    ),
    Hotel(
      id: '5',
      title: 'Villa Maua Arusha',
      description: 'House of Flowers',
      imageUrls: [
        'https://villamaua.co.tz/wp-content/uploads/2019/10/P8O9059-villa-maua-new.jpg',
        'https://villamaua.co.tz/wp-content/uploads/2019/11/P8O9061.jpg',
        'https://villamaua.co.tz/wp-content/uploads/2019/09/villa_maua_spaces_P8O9289-cut.jpg',
        'https://villamaua.co.tz/wp-content/uploads/2019/09/villa_maua_location_P8O8797.jpg',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/14721501/pexels-photo-14721501.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/6476604/pexels-photo-6476604.jpeg?auto=compress&cs=tinysrgb&w=600',
      ],
      location: 'Arusha',
      zone: 'North',
      price: 150,
      rating: 5,
      hotelClass: '2 Stars',
      amenities: ['WiFi in Rooms', 'Pool', 'Parking'],
      phoneNumbers: ['0712428211'],
      latitude: -3.372410844871815,
      longitude: 36.694510174886155,
    ),
    Hotel(
      id: '6',
      title: 'Africa Safari Lodge',
      description:
          'Africa Safari Arusha is an intimate lodge set in the village of Sakina, just outside Arusha’s city centre. The property accommodation consists of 8 Standard rooms and 8 Luxury rooms, surrounded by lush green gardens, a swimming pool with sun loungers, a half-open restaurant with a fireplace for the colder evenings, and a very unique tree bar.',
      imageUrls: [
        'https://images.trvl-media.com/lodging/47000000/46930000/46921500/46921410/5afb1397.jpg?impolicy=resizecrop&rw=1200&ra=fit',
        'https://images.trvl-media.com/lodging/47000000/46930000/46921500/46921410/9941b4c2.jpg?impolicy=resizecrop&rw=1200&ra=fit',
        'https://images.trvl-media.com/lodging/47000000/46930000/46921500/46921410/633859db.jpg?impolicy=resizecrop&rw=1200&ra=fit',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/14089446/pexels-photo-14089446.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/15882073/pexels-photo-15882073/free-photo-of-hot-air-ballon.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ],
      location: 'Arusha',
      zone: 'North',
      price: 50,
      rating: 5,
      hotelClass: '2 Stars',
      amenities: ['WiFi in Rooms', 'Pool', 'Spa', 'Parking'],
      phoneNumbers: ['0712428211'],
      latitude: -3.372410844871815,
      longitude: 36.694510174886155,
    ),
    Hotel(
      id: '7',
      title: 'Nyumbani Hostel Arusha',
      description:
          'Off the A104 highway, this down-to-earth hostel is 3 km from both the Arusha Cultural Heritage Centre and the Arusha Declaration Museum.',
      imageUrls: [
        'https://images.trvl-media.com/lodging/93000000/92260000/92252700/92252645/5b1b6ba9.jpg?impolicy=resizecrop&rw=1200&ra=fit',
        'https://images.trvl-media.com/lodging/93000000/92260000/92252700/92252645/63dce52b.jpg?impolicy=resizecrop&rw=1200&ra=fit',
        'https://images.trvl-media.com/lodging/93000000/92260000/92252700/92252645/26e52263.jpg?impolicy=resizecrop&rw=1200&ra=fit',
      ],
      morePicturesUrls: [
        'https://images.pexels.com/photos/16064257/pexels-photo-16064257/free-photo-of-bush-animal-grass-park.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'https://images.pexels.com/photos/15994048/pexels-photo-15994048/free-photo-of-wood-animal-park-tree.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ],
      location: 'Arusha',
      zone: 'North',
      price: 30,
      rating: 5,
      hotelClass: '1 Star',
      amenities: ['WiFi in Rooms', 'Spa', 'Parking'],
      phoneNumbers: ['0712428211'],
      latitude: -3.372410844871815,
      longitude: 36.694510174886155,
    ),
    Hotel(
      id: '8',
      title: 'Arusha Coffee Lodge by Elewana',
      description:
          'Nestled in the foothills of Mount Meru, this luxurious lodge on a coffee plantation is 6 km from Arusha Declaration Museum and 3 km from Arusha Airport.',
      imageUrls: [
        'https://www.elewanacollection.com/images/acl/ArushaCoffeeLodge---Restaurant-Exterior.jpg',
        'https://www.elewanacollection.com/images/acl/ArushaCoffeeLodge---Plantation-Room.jpg',
        'https://www.elewanacollection.com/images/acl/ArushaCoffeeLodge---Plantation-Suite-Interior.jpg',
      ],
      location: 'Arusha',
      zone: 'North',
      morePicturesUrls: [
        'https://images.pexels.com/photos/15821221/pexels-photo-15821221/free-photo-of-leopard-on-tree.jpeg?auto=compress&cs=tinysrgb&w=600',
        'https://images.pexels.com/photos/15994045/pexels-photo-15994045/free-photo-of-dawn-sunset-animal-grass.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ],
      price: 750,
      rating: 5,
      hotelClass: '5 Stars',
      amenities: ['WiFi in Rooms', 'Pool', 'Parking'],
      phoneNumbers: ['0712428211'],
      latitude: -3.372410844871815,
      longitude: 36.694510174886155,
    ),
    Hotel(
      id: '9',
      title: 'Four Seasons Safari Lodge Serengeti',
      description:
          'One of the world’s truly exclusive islands, Thanda Island features one private villa to enjoy in complete seclusion.',
      imageUrls: [
        'https://www.fourseasons.com/alt/img-opt/~80.930.0,0000-156,2500-3000,0000-1687,5000/publish/content/dam/fourseasons/images/web/SBT/SBT_069_original.jpg',
        'https://www.fourseasons.com/alt/img-opt/~80.930.0,0000-156,2500-3000,0000-1687,5000/publish/content/dam/fourseasons/images/web/SBT/SBT_407_original.jpg',
        'https://www.fourseasons.com/alt/img-opt/~80.930.0,0000-71,7500-3000,0000-1687,5000/publish/content/dam/fourseasons/images/web/SBT/SBT_057_original.jpg',
        'https://www.fourseasons.com/alt/img-opt/~80.930.0,0000-339,2500-3000,0000-1687,5000/publish/content/dam/fourseasons/images/web/SBT/SBT_131_original.jpg',
        'https://www.fourseasons.com/alt/img-opt/~80.930.0,0000-156,2500-2997,8305-1686,2797/publish/content/dam/fourseasons/images/web/SBT/SBT_061_original.jpg',
      ],
      location: 'Mara',
      zone: 'North',
      morePicturesUrls: [
        'https://images.pexels.com/photos/15821221/pexels-photo-15821221/free-photo-of-leopard-on-tree.jpeg?auto=compress&cs=tinysrgb&w=600',
        'https://images.pexels.com/photos/15994045/pexels-photo-15994045/free-photo-of-dawn-sunset-animal-grass.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ],
      price: 750,
      rating: 5,
      hotelClass: '5 Stars',
      amenities: ['WiFi in Rooms', 'Pool', 'Spa', 'Parking', 'WiFi in Lobby'],
      phoneNumbers: ['+255 768 981 981'],
      latitude: -2.2298769920043258,
      longitude: 34.9183665824858,
    ),
    Hotel(
      id: '10',
      title: 'Melia Hotel',
      description:
          'One of the world’s truly exclusive islands, Thanda Island features one private villa to enjoy in complete seclusion.',
      imageUrls: [
        'https://www.architectrussell.com/wp-content/uploads/2022/03/IMG_7020.jpg',
      ],
      location: 'Kiwengwa-Zanzibar',
      zone: 'South',
      morePicturesUrls: [
        'https://img.directbooking.ro/getimage.ashx?w=880&h=660&file=010a8d5c-2fe3-4cfb-8f7e-2744d9f9c734.jpg',
        'https://cf.bstatic.com/xdata/images/hotel/max1024x768/14750461.jpg?k=cb1abf0814660cd98baa7149ca892c3ab17c2707900e4a42fd5319d5ba3fe055&o=&hp=1',
        'https://dam.melia.com/melia/accounts/f8/4000018/projects/127/assets/b6/89452/1322372d57509629d052aa771be94ed9-1647432792.jpg?im=RegionOfInterestCrop=(360,240),regionOfInterest=(1476.5,984.5)',
        'https://www.architectrussell.com/wp-content/uploads/2022/03/IMG_7022.jpg',
        'https://dam.melia.com/melia/accounts/f8/4000018/projects/127/assets/12/45303/da62dc9f316b50213660d4cda15d0093-1604084318.jpg?fp=1476.5,985.5&width=2000&height=1335',
      ],
      price: 750,
      rating: 5,
      hotelClass: '5 Stars',
      amenities: ['WiFi in Rooms', 'Pool', 'Spa', 'Parking', 'WiFi in Lobby'],
      phoneNumbers: ['024 550 2000'],
      latitude: -5.953665916674522,
      longitude: 39.36714309555376,
    ),
    Hotel(
      id: '11',
      title: 'Thanda Island',
      description:
          'One of the world’s truly exclusive islands, Thanda Island features one private villa to enjoy in complete seclusion.',
      imageUrls: [
        'https://ak-d.tripcdn.com/images/200b1900000183u8x47FD_R_960_660_R5_D.jpg',
        'https://www.expertafrica.com/images/lodge/28356_l.jpg',
        'https://image.yachtcharterfleet.com/w480/h252/qh/cs0-401-5460-2865/ow-1/k4ed24619/cms/photo/797700/villa-accommodation-on-thanda-island.jpg',
        'https://cdn.boatinternational.com/files/2023/01/6e856eb0-9711-11ed-8897-31b899da686c-VO%20Thanda%20Island%20Feature%204.jpg',
        'https://image.yachtcharterfleet.com/w1400/h1245/qh/ca/k3b0c579f/cms/photo/799698/thanda-island-aerial-shot.jpg',
      ],
      location: 'Shungimbili Island,Mafia Island.',
      zone: 'South',
      morePicturesUrls: [
        'https://images.pexels.com/photos/15821221/pexels-photo-15821221/free-photo-of-leopard-on-tree.jpeg?auto=compress&cs=tinysrgb&w=600',
        'https://images.pexels.com/photos/15994045/pexels-photo-15994045/free-photo-of-dawn-sunset-animal-grass.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      ],
      price: 750,
      rating: 3,
      hotelClass: '5 Stars',
      amenities: ['WiFi in Rooms', 'Pool', 'Spa'],
      phoneNumbers: ['+27 32 586 0149'],
      latitude: -6.8059136,
      longitude: 39.2265728,
    ),
    Hotel(
      id: '12',
      title: 'Diamonds Mapenzi Beach Hotel',
      description:
          'One of the world’s truly exclusive islands, Thanda Island features one private villa to enjoy in complete seclusion.',
      imageUrls: [
        'https://content.tui.co.uk/adamtui/2019_3/21_16/5a354d31-9134-4ec5-9c24-aa17010a5504/ACC_012640_ZAN_31WebOriginalCompressed.jpg?i10c=img.resize(width:1080);img.resize(height:608);img.crop(width:1080%2Cheight:608)',
      ],
      location: 'Pwani-Zanzibar',
      zone: 'South',
      morePicturesUrls: [
        'https://imga.invia-travel.de/images/media5/19122/1877140_8_19122_800_600_171987_VAId345Seq15IMG61300f9402e223a3dae4962fc9897d64_xl.jpeg',
        'https://img.directbooking.ro/getimage.ashx?w=880&h=660&file=0a805aee-058f-4d69-bdbc-e411d898b77a.jpg',
        'https://cf.bstatic.com/xdata/images/hotel/max1024x768/74586128.jpg?k=351924624ad85a6bcc4e501d6b76626a89a66e1f900c795222fce377949855e6&o=&hp=1',
        'https://anpeiorzlo.cloudimg.io/v7/storage.googleapis.com/images_trvl-portfolio-prod/vaknl_legacy/10796/10537817.webp',
      ],
      price: 750,
      rating: 5,
      hotelClass: '5 Stars',
      amenities: ['WiFi in Rooms', 'Pool', 'Spa', 'Parking', 'WiFi in Lobby'],
      phoneNumbers: ['024 550 2000'],
      latitude: -2.2298769920043258,
      longitude: 34.9183665824858,
    ),
    Hotel(
      id: '13',
      title: 'Ocean Paradise Resort&Spa',
      description:
          'One of the world’s truly exclusive islands, Thanda Island features one private villa to enjoy in complete seclusion.',
      imageUrls: [
        'https://cf.bstatic.com/xdata/images/hotel/max1024x768/34387197.jpg?k=b8f96d69d3dc05c63e13b4d27c2a7d3d0c90b59b32fafb300f593c2da1b330b4&o=&hp=1',
      ],
      location: 'Kiwengwa Road-Zanzibar',
      zone: 'South',
      morePicturesUrls: [
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/d2/66/05/ocean-paradise-resort.jpg?w=700&h=-1&s=1',
        'https://cdn-prd.sonnenklar.tv/img/g/800/600/22776/i21_70670784.jpg',
        'https://media-cdn.tripadvisor.com/media/photo-s/10/d2/65/b8/ocean-paradise-resort.jpg',
        'https://cf.bstatic.com/xdata/images/hotel/max1024x768/32495786.jpg?k=d0c93128e2707abd37ce9e1492057276ab4b8c4e52d70b3713be7a1278187e56&o=&hp=1',
        'https://cf.bstatic.com/xdata/images/hotel/max1024x768/251521915.jpg?k=99465dfdf125cae71882df350263429ac5749ff787547635ecda15c07d4c7166&o=&hp=1',
      ],
      price: 750,
      rating: 5,
      hotelClass: '5 Stars',
      amenities: ['WiFi in Rooms', 'Pool', 'Spa', 'Parking', 'WiFi in Lobby'],
      phoneNumbers: ['024 550 4000'],
      latitude: -5.938570537397289,
      longitude: 39.3622061019653,
    ),
    Hotel(
      id: '14',
      title: 'Emerald Zanzibar Resort & Spa',
      description:
          'Come and experience the African elegance at Emerald Zanzibar Resort & Spa: located in Matemwe, on the north-east coast of Zanzibar.',
      imageUrls: [
        'https://content.tui.co.uk/adamtui/2023_2/3_16/0724c2ca-5089-4f69-b6a6-af9e011402c7/ACC_953389_ZAN_122WebOriginalCompressed.jpg?i10c=img.resize(width:658);img.crop(width:658%2Cheight:370)',
      ],
      location: 'Kiwengwa Road-Zanzibar',
      zone: 'South',
      morePicturesUrls: [
        'https://q-xx.bstatic.com/xdata/images/hotel/max500/415241873.jpg?k=f2a3a9aafb1ff177edadd91f6ed514f3614a1e2f01059a6aa26cc84d7665d468&o=&isSkia=true',
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/27/37/45/b8/emerald-zanzibar-resort.jpg?w=700&h=-1&s=1',
        'https://cf.bstatic.com/xdata/images/hotel/max1024x768/415239161.jpg?k=336fd5be29c2e7aff0e655f8d7cbf545425c8470dd4959840aeab5c4299db90d&o=&hp=1',
        'https://cf.bstatic.com/xdata/images/hotel/max1024x768/415238989.jpg?k=64e2309c362723422a8bb58268e67c27499f7b1dd39b0c0466a9ee0168845aba&o=&hp=1',
        'https://cdn.kiwicollection.com/media/property/PR241121/l/241121-28-Beach%20Bar%20and%20Living07-Emerald%20Zanzibar.jpg?cb=1671828285',
      ],
      price: 750,
      rating: 5,
      hotelClass: '5 Stars',
      amenities: ['WiFi in Rooms', 'Pool', 'Spa', 'Parking', 'WiFi in Lobby'],
      phoneNumbers: ['0659 070 500'],
      latitude: -5.8092265418286475,
      longitude: 39.35756949726262,
    ),
    Hotel(
      id: '15',
      title: 'The Aiyana',
      description:
          'Come and experience the African elegance at Emerald Zanzibar Resort & Spa: located in Matemwe, on the north-east coast of Zanzibar.',
      imageUrls: [
        'https://zanzibar-retreats.com/wp-content/uploads/2020/09/Aiyana-Pemba-aerial-view.jpg',
      ],
      location: 'Pemba Island',
      zone: 'South',
      morePicturesUrls: [
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/09/5c/c3/constance-aiyana-pemba.jpg?w=700&h=-1&s=1',
        'https://waybird.imgix.net/lodges/kodak_images/000/004/003/original/the-aiyana-resort-pemba-tanzania-timbuktu-travel.JPG?w=1420&h=946&crop=center%20center&fit=min&dpr=1&q=50&auto=format',
        'https://www.kayak.com/rimg/himg/14/47/16/expediav2-10039225-727f42f8_z-643340.jpg?width=1366&height=768&crop=true',
        'https://blackplatinumgold.com/wp-content/uploads/2020/11/23-10.jpg',
      ],
      price: 750,
      rating: 5,
      hotelClass: '5 Stars',
      amenities: ['WiFi in Rooms', 'Pool', 'Spa', 'Parking', 'WiFi in Lobby'],
      phoneNumbers: ['0776 912 800'],
      latitude: -4.887054354932887,
      longitude: 39.67933281260156,
    ),
  ];

  static List<Hotel> getHotelsByLocation(String location, List<Hotel> hotels) {
    final List<Hotel> matchingHotels = hotels
        .where(
            (hotel) => hotel.location.toLowerCase() == location.toLowerCase())
        .toList();
    return matchingHotels;
  }
}

class LocationOption {
  final String id;
  final String name;

  LocationOption(this.id, this.name);
}
