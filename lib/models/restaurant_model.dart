class Restaurant {
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

  const Restaurant({
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
  static List<Restaurant> get clothingRestaurants => [
        const Restaurant(
          id: '1',
          title: 'Traditional Attire',
          description: 'Tanzania fashion traditional clothes',
          imageUrls: [
            'https://i2.wp.com/www.momoafrica.com/wp-content/uploads/2021/08/17d8b291a202893db1af61ec0686d0e0.jpg?fit=235%2C306&ssl=1',
          ],
          morePicturesUrls: [
            'https://i2.wp.com/www.momoafrica.com/wp-content/uploads/2021/08/d0d7642edfa866f707945bfdec9b6721.jpg?resize=236%2C354&ssl=1',
            'https://i.pinimg.com/236x/2d/3c/48/2d3c4839a9bdbffc20cdfc7a26a2c37c.jpg',
            'https://image.made-in-china.com/202f0j00cBvGgqRHrmod/African-Traditional-Print-Dress-Women-Dress-Fashion-Party-Dress.jpg',
            'https://i.pinimg.com/originals/d8/34/a6/d834a62b165d6d28c1e2fd397782b5ea.jpg',
          ],
          location: 'Dar',
          phoneNumbers: ['0712428211'],
          latitude: -3.372410844871815,
          longitude: 36.694510174886155,
          price: 750,
          rating: 5,
        ),
        const Restaurant(
          id: '2',
          title: 'Khanga',
          description:
              'Serengeti National Park is a World Heritage Site teeming with wildlife.',
          imageUrls: [
            'https://media-cdn.tripadvisor.com/media/photo-s/12/31/8e/d4/cac-dancers-performing.jpg',
          ],
          morePicturesUrls: [
            'https://pensarafrica.com/wp-content/uploads/2019/01/tube_dresss_grande.jpg',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkiLkD16ouI41vRtRvcF_l0JLhlEkQX7f6z7mFmen5WNg-uDsBOqUNWlVnSsy3IWXts_g&usqp=CAU',
            'https://m.media-amazon.com/images/I/71mF5cNMfSL._AC_SL1000_.jpg',
            'https://furtherafrica.com/content-files/uploads/2022/06/tanzania_clothing.jpg',
          ],
          location: 'Arusha',
          phoneNumbers: ['0712428211'],
          latitude: -3.372410844871815,
          longitude: 36.694510174886155,
          price: 650,
          rating: 5,
        ),
        const Restaurant(
          id: '3',
          title: 'Batiki',
          description: 'Visit one of the best parks in the whole world',
          imageUrls: [
            'https://www.shoponline.co.tz/Secure/pub/media/catalog/product/cache/34a73b5776398fdf5302c96cd5b53abc/i/m/img_1206.jpg',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlYZxjo5YrYJDxmQTyzz9NMv-IgVd7TC2eY99YVSLD12_R_42dDI2tBlqQeEIz_kD3_ms&usqp=CAU',
          ],
          morePicturesUrls: [
            'https://images.pexels.com/photos/15821364/pexels-photo-15821364/free-photo-of-lion-on-savannah.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            'https://images.pexels.com/photos/12004890/pexels-photo-12004890.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
          ],
          location: 'Iringa',
          phoneNumbers: ['0712428211'],
          latitude: -3.372410844871815,
          longitude: 36.694510174886155,
          price: 450,
          rating: 4,
        ),
        const Restaurant(
          id: '4',
          title: 'Vijora',
          description: 'Visit one of the best parks in the whole world',
          imageUrls: [
            'https://dilizote.com/php/files/10102021124500batiki.jpg',
          ],
          morePicturesUrls: [
            'https://images.pexels.com/photos/59840/elephant-baby-safari-elephants-africa-59840.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            'https://images.pexels.com/photos/10740862/pexels-photo-10740862.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
          ],
          location: 'Manyara',
          phoneNumbers: ['0712428211'],
          latitude: -3.372410844871815,
          longitude: 36.694510174886155,
          price: 550,
          rating: 4,
        ),
        const Restaurant(
          id: '5',
          title: 'Magauni',
          description: 'Beautiful island of Africa',
          imageUrls: [
            'https://quicksearch.co.tz/media/pi/i-63a6154ba5009.jpg',
          ],
          morePicturesUrls: [
            'https://quicksearch.co.tz/media/pi/i-63a6150c6047c.jpg',
            'https://quicksearch.co.tz/media/pi/i-63a61501ca71c.jpg',
            'https://quicksearch.co.tz/media/pi/i-63a61550e5f00.jpg',
          ],
          location: 'Zanzibar',
          phoneNumbers: ['0719313055'],
          latitude: -3.372410844871815,
          longitude: 36.694510174886155,
          price: 750,
          rating: 5,
        ),
        const Restaurant(
          id: '6',
          title: 'Handmade Fabric',
          description: 'Beautiful island of Africa',
          imageUrls: [
            'https://cdn.shopify.com/s/files/1/0483/8418/0378/products/Batiki-23-03_530x@2x.jpg?v=1676601803',
          ],
          morePicturesUrls: [
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ481daLUWf38SCFMy5j9dxkZV62Jo1sHdLnOwdBjNcr6_iw00u_WZBoI936HSZDN--LY&usqp=CAU',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP0Jgr8P3gcYvAIsYcVOMPcn5BA92PgYM5GLjmoY_eT4tE0CBO6bfmZSfupKczHhb4QPo&usqp=CAU',
            'https://cdn.shopify.com/s/files/1/0483/8418/0378/products/Batiki-23-21_1200x1200.jpg?v=1677127957'
          ],
          location: 'Morogoro',
          phoneNumbers: ['0712428211'],
          latitude: -3.372410844871815,
          longitude: 36.694510174886155,
          price: 750,
          rating: 5,
        ),
        const Restaurant(
          id: '7',
          title: 'Kitenge Designs',
          description: 'Beautiful island of Africa',
          imageUrls: [
            'https://shweshwe1.com/wp-content/uploads/2023/03/FotoJet-12.jpg'
          ],
          morePicturesUrls: [
            'https://netstorage-tuko.akamaized.net/images/0fgjhs2qgbjtl7sms.jpg',
            'https://netstorage-tuko.akamaized.net/images/0fgjhs174enipo1pkg.jpg',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYm2QXCmTPN4oSHoBMltKwbN_7hX_YC0Wtqg&usqp=CAU',
            ''
          ],
          location: 'Dar',
          phoneNumbers: ['0712428211'],
          latitude: -3.372410844871815,
          longitude: 36.694510174886155,
          price: 750,
          rating: 5,
        ),
        const Restaurant(
          id: '8',
          title: 'Kitenge Store',
          description: 'Beautiful island of Africa',
          imageUrls: [
            'https://4.bp.blogspot.com/--Bpn3_Dl8hA/WrtMgA0azhI/AAAAAAAAVWw/SEtEHjNL59M1FXFFrbcsx7aofGdgyK2xgCLcBGAs/s1600/a87f2271a34ceb8289221189b4dd87dd.jpg',
          ],
          morePicturesUrls: [
            'https://play-lh.googleusercontent.com/d5jL70ZyMOBtQVeztsPsxqsfCtsA-nB8gOQB0cWezqIgfNfowlvBvTImsr7WOjFkiAc',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR08eJ8UlDcDEwcLj0UMlj-4TvSSHm0iG7zho9JFnMI_InSW6CfKcgpjV2yZbZtDY_3oX0&usqp=CAU',
            'https://d17a17kld06uk8.cloudfront.net/products/7N6DEUR/6P97DMS2-large.jpg',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSC3mXEj-CHXe9mZoz0WyYXu8m4l_U1-5t9_Q&usqp=CAU'
          ],
          location: 'Dar',
          phoneNumbers: ['0712428211'],
          latitude: -3.372410844871815,
          longitude: 36.694510174886155,
          price: 750,
          rating: 5,
        ),
      ];
  static List<Restaurant> get sculpturesRestaurants => [
        const Restaurant(
          id: '1',
          title: 'Makonde Curios',
          description:
              'Makonde art is an indigenous art form of the Makonde people, an ethnic tribe residing in southeast Tanzania.',
          imageUrls: [
            'https://d2g6byanrj0o4m.cloudfront.net/images/62080/makonde_curios_tanzania.jpg',
          ],
          morePicturesUrls: [
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTirM61bxiWBFv6oKtaB4FmxIoXfaruf632eQ&usqp=CAU',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzOlLP1jW86ZyYtnHBDonVYkgz6EX3lvSmoFbqXGVoTZPJf28zXthLU-2hlDCKiDSkgjE&usqp=CAU',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGt9CRb9yzcLdkASdpiEoYN3RZNgvSH2DDY5441mFnszS9DxyaRUOtTmnWIQ-FH0EXkzM&usqp=CAU',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcc4MdOWY0Pyn6-trkR1a6zhmIujIVsQqf0Q&usqp=CAU',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThPoVt46Em8lniiSyt3mlTatamseFmjgM3spmU_VnXtZ8VM7CRp1hfgCZ4cG_pZRdIGnU&usqp=CAU',
          ],
          location: 'Mtwara',
          phoneNumbers: ['0712428211'],
          latitude: -3.372410844871815,
          longitude: 36.694510174886155,
          price: 650,
          rating: 5,
        ),
        const Restaurant(
          id: '2',
          title: 'Mwenge Woodcarvers',
          description:
              'Here you can find a wide range of hand-made wooden crafts, which are sold by the artisans themselves, you will also discover various types of carvings and statues that are an ideal gift for your loved ones.',
          imageUrls: [
            'https://pbs.twimg.com/media/EjlhTCUXgAAuNQ7.jpg:large',
          ],
          morePicturesUrls: [
            'https://img.atlasobscura.com/_InArSvBASK-KqzP5HRXlJIwQGrS1UQWzFzN-JgyXJM/rt:fit/h:390/q:81/sm:1/scp:1/ar:1/aHR0cHM6Ly9hdGxh/cy1kZXYuczMuYW1h/em9uYXdzLmNvbS91/cGxvYWRzL3BsYWNl/X2ltYWdlcy80YTMw/NjA0Ni0wZmFhLTQ3/NGUtOTRhNy04MjFi/MTYxMGNkODMxM2Ey/NWMxZTBhNzYyNTky/NzdfUEMxNjAwMjIu/SlBH.jpg',
            'https://fastly.4sqi.net/img/general/600x600/KQJUVLHODY2W3NYCBL4WVRBKTQ152UZ4ZJOJKZAVZ0LSTGDI.jpg',
            'https://img.atlasobscura.com/PJyvVg2WkFJo8qYwRHAs9Twixqqz_cCJEWQiwQUTEjU/rt:fit/h:390/q:81/sm:1/scp:1/ar:1/aHR0cHM6Ly9hdGxh/cy1kZXYuczMuYW1h/em9uYXdzLmNvbS91/cGxvYWRzL3BsYWNl/X2ltYWdlcy9iNDkx/MDVkNi00ZDRjLTQw/YTYtYTM4Yi0yZWIz/ZTQ1NTBjY2YxM2Ey/NWMxZTBhNzYyNTky/NzdfUEMxNjAwMjku/SlBH.jpg',
            'https://img.atlasobscura.com/_InArSvBASK-KqzP5HRXlJIwQGrS1UQWzFzN-JgyXJM/rt:fit/h:390/q:81/sm:1/scp:1/ar:1/aHR0cHM6Ly9hdGxh/cy1kZXYuczMuYW1h/em9uYXdzLmNvbS91/cGxvYWRzL3BsYWNl/X2ltYWdlcy80YTMw/NjA0Ni0wZmFhLTQ3/NGUtOTRhNy04MjFi/MTYxMGNkODMxM2Ey/NWMxZTBhNzYyNTky/NzdfUEMxNjAwMjIu/SlBH.jpg',
            'https://d2g6byanrj0o4m.cloudfront.net/images/62080/max_cortesi_atlas_obscura_user__medium.jpg',
          ],
          location: 'Mwenge-Dar',
          phoneNumbers: ['0765 552 341'],
          latitude: -3.372410844871815,
          longitude: 36.694510174886155,
          price: 650,
          rating: 5,
        ),
        const Restaurant(
          id: '3',
          title: 'Slipway Cultural Market',
          description:
              'Here you can find a wide range of hand-made wooden crafts, which are sold by the artisans themselves, you will also discover various types of carvings and statues that are an ideal gift for your loved ones.',
          imageUrls: [
            'https://media.safarway.com/content/34c057d9-0a1d-4c96-8683-202ff23e235b_sm.jpg',
          ],
          morePicturesUrls: [
            'https://images.squarespace-cdn.com/content/v1/54e1e619e4b094c160466897/1434540184234-MJL9C1XHKCN0D2F2KEIW/_DSC9928.jpg?format=500w',
            'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/67/ed/76/woodcarvings-and-other.jpg?w=1200&h=1200&s=1',
          ],
          location: 'Mwenge-Dar',
          phoneNumbers: ['0765 552 341'],
          latitude: -3.372410844871815,
          longitude: 36.694510174886155,
          price: 650,
          rating: 5,
        ),
        const Restaurant(
          id: '4',
          title: 'Tingatinga Arts',
          description:
              'Here you can find a wide range of hand-made wooden crafts, which are sold by the artisans themselves, you will also discover various types of carvings and statues that are an ideal gift for your loved ones.',
          imageUrls: [
            'https://media.tacdn.com/media/attractions-splice-spp-674x446/06/d7/ba/88.jpg',
          ],
          morePicturesUrls: [
            'https://trueafricanart.com/cdn/shop/products/TT-76..jpg?v=1610881648',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTE2IOE9B8-XO3N5IRQCQeLLUzb51S-43S1wJd660ciBRqXycZ5ep3oP-PBSOXjuga89pE&usqp=CAU',
            'https://cdn.shopify.com/s/files/1/1554/1467/products/TINGA2_large.jpg?v=1566992554',
            'https://di2ponv0v5otw.cloudfront.net/posts/2020/02/21/5e5060441153ba73a54ea508/m_5e50606fbbf076cb27273073.jpg'
          ],
          location: 'Mwenge-Dar',
          phoneNumbers: ['0765 552 341'],
          latitude: -3.372410844871815,
          longitude: 36.694510174886155,
          price: 650,
          rating: 5,
        ),
      ];

  static List<Restaurant> get beadworkRestaurants => [
        const Restaurant(
          id: '1',
          title: 'Makonde Carvings',
          description:
              'Serengeti National Park is a World Heritage Site teeming with wildlife.',
          imageUrls: [
            'https://d2g6byanrj0o4m.cloudfront.net/images/62080/makonde_tanzania__medium.jpeg',
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
        const Restaurant(
          id: '2',
          title: 'Maasai Clothing&Jewelry',
          description:
              'The jewellery includes the works of a simple colourful necklace, bracelets and pendants.',
          imageUrls: [
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRk0LflVxTE_j0PFxEzWrzeYdM9f-ugSFJBrNokIHYbwew13c1lGPWyjNafvggK1eC0cBA&usqp=CAU',
          ],
          morePicturesUrls: [
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY_EvN24SfkjJDcktw_-KrzokgnaMdqD5OKj9Yb314btGGRHmgD4Gguzkvu2vUktb6WqI&usqp=CAU',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1Dd1T50l6Ri5wCPSVI6eIQlXc2yWj4b6gkWGFb2u35j4d4awwwbFQv8CGLfibE9e69xE&usqp=CAU',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSok_MlPdWvge5knI3u48kagMYXcFZzIb0_OLlkimBNDm8K8uohbWWvSUTsZ0fUHsDHZeU&usqp=CAU',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG3v7tBHb54OpGiMpU-SwG0aiLpAEQMZrbtnSwW6WlUe5aV9lDMEv-qw8abSWSX6vYbcw&usqp=CAU',
          ],
          location: 'Dar',
          phoneNumbers: ['0712428211'],
          latitude: -3.372410844871815,
          longitude: 36.694510174886155,
          price: 650,
          rating: 5,
        ),
        const Restaurant(
          id: '3',
          title: 'Maasai Beadwork',
          description:
              'The jewellery includes the works of a simple colourful necklace, bracelets and pendants.',
          imageUrls: [
            'https://www.nomadafricamag.com/wp-content/uploads/2018/11/5e04c1b8c715c7ec5484ea2e849d4403_web.jpg',
          ],
          morePicturesUrls: [
            'https://acm.edu/wp-content/uploads/2021/10/Tim_Lee_-_DSCF3026b.jpg',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiEm605V33EJ4U1R9mSl2NHZxN820Du-v7MQ&usqp=CAU',
            'https://images.myguide-cdn.com/tanzania/companies/mama-masai/large/mama-masai-235060.jpg',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz9BBG87oiOoJ7eTQQ8ysoVDccHl6AZ_2W5lDRzZyysYvG-gXzct0324Nv0HnCocnngiQ&usqp=CAU'
          ],
          location: 'Dar',
          phoneNumbers: ['0712428211'],
          latitude: -3.372410844871815,
          longitude: 36.694510174886155,
          price: 650,
          rating: 5,
        ),
        const Restaurant(
          id: '4',
          title: 'Arusha Town',
          description:
              'The jewellery includes the works of a simple colourful necklace, bracelets and pendants.',
          imageUrls: [
            'https://photos.smugmug.com/Tanzania/Arusha-town/i-2K6rvkc/0/42cf3f08/XL/Women%20making%20bead%20work%20at%20the%20Maasai%20Market%2C%20central%20Arusha%2C%20Tanzania-XL.jpg',
          ],
          morePicturesUrls: [
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmFiuAKFETkrzSBGCZa5gAPr-0kQhqbolN2A&usqp=CAU',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBuLoPZE0YOkTEV5qlliHxE19q9S1tICkcafGnDxxRFMlPmD35eGXG6LR4XBcDvXNzPcc&usqp=CAU',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRliWWVJCszKI0pXo8CBV2-0h7DHMRJXRqOeg&usqp=CAU',
            'https://live.staticflickr.com/5254/5387797993_50ee788730_b.jpg'
          ],
          location: 'Dar',
          phoneNumbers: ['0712428211'],
          latitude: -3.372410844871815,
          longitude: 36.694510174886155,
          price: 650,
          rating: 5,
        ),
      ];
}
