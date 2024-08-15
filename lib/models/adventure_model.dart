
class Adventure {
  final String id;
  final String title;
  final String description;
  final List<String> imageUrls;
  final double price;
  final double rating;
  final List<String> morePicturesUrls;
  final List<String> phoneNumbers;
  final String location;
  final double latitude;
  final double longitude;

  const Adventure({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrls,
    required this.price,
    required this.rating,
    required this.morePicturesUrls,
    required this.phoneNumbers,
    required this.location,
    required this.latitude,
    required this.longitude,
  });

  factory Adventure.fromMap(Map<String, dynamic> map) {
    return Adventure(
      id: map['id'] as String? ?? '',
      title: map['title'] as String? ?? '',
      description: map['description'] as String? ?? '',
      location: map['location'] as String? ?? '',
      imageUrls: (map['imageUrls'] as List<dynamic>?)?.cast<String>() ?? [],
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      rating: (map['rating'] as num?)?.toDouble() ?? 0.0,
      morePicturesUrls:
          (map['morePicturesUrls'] as List<dynamic>?)?.cast<String>() ?? [],
      phoneNumbers:
          (map['phoneNumbers'] as List<dynamic>?)?.cast<String>() ?? [],
      latitude: map['latitude'] as double? ?? 0.0,
      longitude: map['longitude'] as double? ?? 0.0,
    );
  }

  List<Adventure> getAdventures() {
    return [
      const Adventure(
        id: '1',
        title: 'Serengeti great Migration',
        description:
            'Dating from 1894, this refined hotel in lush gardens is off the A104 road, a 6-minute walk from the National Natural History Museum and 49 km from Arusha National Park.',
        imageUrls: [
          'https://serengetinationalparksafaris.com/wp-content/uploads/2021/07/Great-wildebeest-migration-safari-guide-1200x675-1.jpg',
        ],
        morePicturesUrls: [
          'https://images.pexels.com/photos/789630/pexels-photo-789630.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          'https://images.pexels.com/photos/7280783/pexels-photo-7280783.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          'https://www.african-jackal.com/wp-content/uploads/2017/03/ndutu.jpg',
          'https://lp-cms-production.imgix.net/2021-10/GettyRF_545860943.jpg',
          'https://www.zicasso.com/static/e534d7332be9fe3b04964bb41491aad6/28a23/e534d7332be9fe3b04964bb41491aad6.jpg',
          'https://www.responsiblevacation.com/imagesClient/S_248812.jpg',
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0764 597 219'],
        location: 'Mara/Arusha',
        latitude: -2.1807075481504965,
        longitude: 34.80519042253463,
      ),
      const Adventure(
        id: '2',
        title: 'Mafia Island',
        description:
            'Mafia Island is part of Tanzanias Mafia Archipelago, in the Indian Ocean. Large swaths of the islands southern coastline and surrounding waters are protected by the Mafia Island Marine Park. Within the park are many coral reefs, home to wildlife such as whale sharks and sea turtles. In the south, beaches include secluded Ras Kisimani, just across from Bwejuu Island. Popular Utende Beach edges onto Chole Bay.',
        imageUrls: [
          'https://safarini.com/wp-content/uploads/2019/09/thanda-island-view.jpg',
        ],
        morePicturesUrls: [
          'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcREkeabBCWHaKnHKsSOcy_dtxlmBvoQVZsrx7iCXzRr2y8lEE8Ucf6eKc8FpuoyHvvixylCJlxKW09tRoiC_1izeAgr3g',
          'https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcQDv0Zfj9CUQbI6mhUxDAHlI_tnz4JQJcgCUPhN_gtzNA69GNR-NJhOrSgAF7AeQ5SD051-1WGxB2hFU8Z6HxMfcl9RHA',
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/9e/ac/c9/auf-dem-weg-zur-blue.jpg?w=700&h=500&s=1',
          'https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcQ2oPrn7KsqKdlTJ9sZzC7AKXt5s0E8pn6awFYU_AUyNeSLWsqwLfLo-76Nlh17qrrToMUAh8DC-yeGGlvRWzNs9GsrUA',
          'https://www.kitukiblu.co.tz/media/cache/d0/23/d02384b8c586db6fcbca8def46d854b9.jpg',
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/a7/84/e4/meremeta-lodge.jpg?w=500&h=300&s=1',
          'https://www.expertafrica.com/images/itinerary/1899a15a087c421a869618f91d377a7a.jpg',
          'https://image-tc.galaxy.tf/wijpeg-boqt20abzq7m2oc775849c2vl/lakedulutiserena-239.jpg',
          'https://ak-d.tripcdn.com/images/200b1900000183u8x47FD_R_960_660_R5_D.jpg',
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0712428211'],
        location: 'Pwani',
        latitude: -3.372410844871815,
        longitude: 36.694510174886155,
      ),
      const Adventure(
        id: '3',
        title: 'Tarangire National Park.',
        description:
            'Ranking as the 6th largest National Park in Tanzania and covering an area of 2,600 square kilometers, The Tarangire National Park is most popular for its large elephant herds and mini-wildlife migration that takes place during the dry season which sees about 250,000 animals enter the park.',
        imageUrls: [
          'https://serengetinationalparksafaris.com/wp-content/uploads/2020/07/Elephants-in-Tarangire.jpg',
        ],
        morePicturesUrls: [
          'https://arushatrips.com/wp-content/uploads/2019/10/Tarangire-national-park-2.png',
          'https://www.safaris-uganda.com/wp-content/uploads/2019/11/Tarangire-National-Park.jpg',
          'https://static1.evcdn.net/images/reduction/1594446_w-684_h-242_q-70_m-crop.jpg',
          'https://yellowzebrasafaris.com/media/20226/shutterstock_313222967.jpg?center=0.91,0.535&mode=crop&width=2048&height=1024&format=jpg&rnd=132757391710000000',
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0712428211'],
        location: 'Manyara',
        latitude: -3.372410844871815,
        longitude: 36.694510174886155,
      ),
      const Adventure(
        id: '4',
        title: 'Lake Manyara National Park.',
        description:
            'Lake Manyara National Park is a protected area in Tanzanias Arusha and Manyara Regions, situated between Lake Manyara and the Great Rift Valley. It is administered by the Tanzania National Parks Authority, and covers an area of 325 km² including about 230 km² lake surface.',
        imageUrls: [
          'https://www.lakemanyaranationalparks.com/wp-content/uploads/2021/05/lake-mayara-national-park.jpg',
        ],
        morePicturesUrls: [
          'https://safarideal.com/wp-content/uploads/2021/01/Lake-Manyara-1.jpg',
          'https://upload.wikimedia.org/wikipedia/commons/4/48/Lake_Manyara_Wildlife.jpg',
          'https://www.ngorongorocratertanzania.org/wp-content/uploads/2019/09/Lake-Manyara-National-Park.jpg',
          'https://www.tarangirenationalparks.com/wp-content/uploads/2022/01/3-Days-Lake-Manyara-Wildlife-Safaris-1.jpg',
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0712428211'],
        location: 'Manyara',
        latitude: -3.372410844871815,
        longitude: 36.694510174886155,
      ),
      const Adventure(
        id: '5',
        title: 'Udzungwa Mountains National Park',
        description:
            'Udzugwa mountains national park is a wildlife sanctuary that is located in central Tanzania between Iringa and Morogoro regions within the eastern arc mountains',
        imageUrls: [
          'https://www.mikuminationalpark.net/wp-content/uploads/2020/02/undzungwa-mountains-national-park.jpg',
        ],
        morePicturesUrls: [
          'https://www.discoverimages.com/p/251/africa-tanzania-udzungwa-mountains-national-19937145.jpg.webp',
          'https://www.focuseastafricatours.com/wp-content/uploads/gallery1-udzungwa.jpg',
          'https://www.africanpangolinsafaris.com/images/udzungwa-national-park-banner.jpg',
          'https://www.mikuminationalpark.net/wp-content/uploads/2020/02/undzungwa-mountains-national-park.jpg',
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0712428211'],
        location: 'Iringa',
        latitude: -3.372410844871815,
        longitude: 36.694510174886155,
      ),
      const Adventure(
        id: '6',
        title: 'Katavi National Park.',
        description:
            'Home to the largest herds of buffalo on the planet, Katavi National Park is a relatively untouched wilderness paradise, situated in the western area of Tanzania.The park boasts a wonderful array of habitats, which range from flood plains of thick reeds and dense waterways that teem with hippo and crocodile to woodlands, open grasslands, forests and pristine seasonal lakes.',
        imageUrls: [
          'https://serengetinationalparksafaris.com/wp-content/uploads/2022/07/distance-is-the-key-for.jpg',
        ],
        morePicturesUrls: [
          'https://www.tanzania-experience.com/wp-content/galleries/katavi-np-single/featured-KatumaWildlife13.jpg',
          'https://www.serengetiparktanzania.com/wp-content/uploads/2021/12/Katavi-National-Park-750x390.jpg',
          'https://www.nondiadventures.co.tz/images/Nondi/Katavi_elefants-in-katavi-lake-Small.jpg',
          'https://media.istockphoto.com/id/1320018400/photo/herd-of-elephants-walking-in-the-plains-of-east-africa.jpg?s=612x612&w=0&k=20&c=GVs6SoAF2fTsy6sT5cJU4vKrcElzPyn7SgR3jmAKxfI=',
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0712428211'],
        location: 'Katavi',
        latitude: -3.372410844871815,
        longitude: 36.694510174886155,
      ),
      const Adventure(
        id: '7',
        title: 'Ngorongoro Crater Conservation Area.',
        description:
            'Nestled in the foothills of Mount Meru, this luxurious lodge on a coffee plantation is 6 km from Arusha Declaration Museum and 3 km from Arusha Airport.',
        imageUrls: [
          'https://brilliant-africa.imgix.net/the-highlands-ngorongoro-tanzania-28.jpg?auto=format,enhance,compress&fit=crop&crop=entropy,faces,focalpoint&w=580&h=480&q=40',
        ],
        morePicturesUrls: [
          'https://kiliwonders.com/uploads/blog_1529756756.jpg',
          'https://media.tacdn.com/media/attractions-splice-spp-674x446/0b/2d/0f/73.jpg',
          'https://www.tarangirenationalparks.com/wp-content/uploads/2021/05/Ngorongoro-conservation-582x333-1.jpg',
          'https://safarideal.com/wp-content/uploads/2020/10/Ngorongoro_Safari_Tanzania.jpg',
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0712428211'],
        location: 'Arusha',
        latitude: -3.372410844871815,
        longitude: 36.694510174886155,
      ),
    ];
  }

  List<Adventure> getCulturalExperiences() {
    return [
      const Adventure(
        id: '1',
        title: 'Hadzabe Tribe',
        description:
            'The Hadza are a modern hunter-gatherer people living in northern Tanzania. They are considered one of the last hunter-gatherer tribes in Africa with approximately 1,300 tribe members.',
        imageUrls: [
          'https://www.silverbackgorillatours.com/wp-content/uploads/2021/08/cultural-attractions-in-tanzania.jpg',
        ],
        morePicturesUrls: [
          'https://www.focuseastafricatours.com/wp-content/uploads/img-6602-original-ed_article_column@2x.jpg',
          'https://cms.forbesafrica.com/wp-content/uploads/2022/11/GettyImages-479526168.jpg',
          'https://i.natgeofe.com/n/c000e33e-525d-43eb-8254-2ed50c5ef6c2/06.jpg?w=1084.125&h=732.375',
          'https://images.nationalgeographic.org/image/upload/t_edhub_resource_key_image/v1638892097/EducationHub/photos/gathering-tubers.jpg',
          'https://images.nationalgeographic.org/image/upload/t_edhub_resource_key_image/v1638892099/EducationHub/photos/hunting-for-game.jpg',
          'https://worldcrunch.com/media-library/hadza-tribesmen-hunting-in-tanzania.jpg?id=27036177&width=2000&height=1500&quality=85&coordinates=4%2C0%2C4%2C0',
          'https://cdn.uanews.arizona.edu/s3fs-public/images/uanow/hunter-thumb.jpg',
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0712428211'],
        location: 'Singida',
        latitude: -3.372410844871815,
        longitude: 36.694510174886155,
      ),
      const Adventure(
        id: '2',
        title: 'The Maasai',
        description:
            'Located in Northern Center-Tanzania around the major National parks of Serengeti and Ngorongoro. The speak Maasai,Swahili and English.They are patriachal and monotheist and their traditional diet derives almost exclusively from cattle-meat,meat and blood. ',
        imageUrls: [
          'https://www.exploretanzaniatours.com/wp-content/uploads/2022/01/pawan-sharma-364696.jpg',
        ],
        morePicturesUrls: [
          'https://www.oretetisafari.com/photos/439892maasai1.jpg',
          'https://www.serengetiparktanzania.com/wp-content/uploads/2019/09/Maasai-Tribea.jpg',
          'https://venturesafrica.com/wp-content/uploads/2014/07/Kenya-Masai-Villagers-10-XL.jpg',
          'https://images.nationalgeographic.org/image/upload/t_edhub_resource_key_image/v1638892097/EducationHub/photos/gathering-tubers.jpg',
          'https://images.nationalgeographic.org/image/upload/t_edhub_resource_key_image/v1638892099/EducationHub/photos/hunting-for-game.jpg',
          'https://worldcrunch.com/media-library/hadza-tribesmen-hunting-in-tanzania.jpg?id=27036177&width=2000&height=1500&quality=85&coordinates=4%2C0%2C4%2C0',
          'https://www.responsiblevacation.com/imagesClient/S_248812.jpg',
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0712428211'],
        location: 'Arusha',
        latitude: -3.372410844871815,
        longitude: 36.694510174886155,
      ),
      const Adventure(
        id: '3',
        title: 'Makonde',
        description:
            'Traditionally, the Makonde were matrilineal societies with long-established carving traditions. Carving as art was passed from father to son, and young men learned the carving techniques during initiation ceremonies. Many carvers produced functional utensils, but the more artistically inclined were asked to create ritualistic helmet masks called Mapiko, and figurines for sacred events. Though matrilineal societies, carving was traditionally only for men, and their work was kept strictly secret from the women of the tribe.  ',
        imageUrls: [
          'https://unitedrepublicoftanzania.com/wp-content/uploads/2022/01/Quick-Snapshot-of-the-Makonde-Carvings-Sculpture-and-Art.jpg',
        ],
        morePicturesUrls: [
          'https://2.bp.blogspot.com/-X9ueTV5ZUVI/UU-b2oRFdKI/AAAAAAAAOHU/36OLxDp-bL8/s640/makondecarver2.jpg',
          'https://3.bp.blogspot.com/-4GIHaS48SDM/UU-dfmr2OLI/AAAAAAAAOHc/YcNGgIQsdBc/s640/makonde-carving-tanzania.JPG',
          'https://images.fineartamerica.com/images/artworkimages/mediumlarge/1/makonde-wood-carver-erik-falkensteen.jpg',
          'https://www.eine-welt.ch/pictures/a1/oauekxkraks272esq0qqlzhw6i1y8k/laif-8.02882630-h_kopie-876-2x.jpg',
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0712428211'],
        location: 'Mtwara',
        latitude: -3.372410844871815,
        longitude: 36.694510174886155,
      ),
      const Adventure(
        id: '4',
        title: 'Sukuma',
        description:
            'With its estimated population of 5.5 million people, the Sukuma tribe is the largest tribe in Tanzania. They reside mainly in the northern part of the country in the Mwanza region around Lake Victoria in an area called Usukuma. The landscape of Usukuma is most notable for its kopje or rocky outcrops.',
        imageUrls: [
          'https://whitehouseoftanzania.com/wp-content/uploads/2020/03/Sukuma_Tribe_Dance-2048x1365.jpg',
        ],
        morePicturesUrls: [
          'https://4.bp.blogspot.com/_doacCzzR-lE/TKx_FmMXOoI/AAAAAAAAELw/G-sRYhmAAkE/s1600/earthdance.JPG',
          'https://3.bp.blogspot.com/-4GIHaS48SDM/UU-dfmr2OLI/AAAAAAAAOHc/YcNGgIQsdBc/s640/makonde-carving-tanzania.JPG',
          'https://3.bp.blogspot.com/-IdSAESGDT34/UVECfTpER2I/AAAAAAAAOMU/sQrUW212E00/s1600/dscn0841.jpg',
          'https://africageographic.com/wp-content/uploads/2018/02/IMG_1174_SukumaMan.jpg',
          'https://africageographic.com/wp-content/uploads/2018/02/IMG_0902_Drummer.jpg',
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0712428211'],
        location: 'Mwanza',
        latitude: -3.372410844871815,
        longitude: 36.694510174886155,
      ),
      const Adventure(
        id: '4',
        title: 'Ngazija',
        description:
            'Zanzibar is an archipelago in the Indian Ocean, about 30km off the mainland coast. It’s composed by several islands, the main of them being Pemba and Unguja (the biggest one, the one we usually call “Zanzibar”).',
        imageUrls: [
          'https://static.nationalgeographic.co.uk/files/styles/image_3200/public/Photostory_Zanzibar_78.%20Taraab%20music_HR_WEB.jpg?w=1600&h=900',
        ],
        morePicturesUrls: [
          'https://media-cdn.tripadvisor.com/media/photo-s/1a/b1/62/4e/get-an-in-depth-overview.jpg',
          'https://www.dhowinn.com/images/Blog/Zanzibar_Culture/1-zanzibar-people-op2.jpg',
          'https://vimatsafaris.com/wp-content/uploads/2018/06/zanzibar_culture.jpg'
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0712428211'],
        location: 'Zanzibar',
        latitude: -3.372410844871815,
        longitude: 36.694510174886155,
      ),
    ];
  }

  List<Adventure> getSightseeing() {
    return [
      const Adventure(
        id: '1',
        title: 'Sea Tutle Tour-Nungwi Zanzibar',
        description:
            'Zanzibar is an archipelago in the Indian Ocean, about 30km off the mainland coast. It’s composed by several islands, the main of them being Pemba and Unguja (the biggest one, the one we usually call “Zanzibar”).',
        imageUrls: [
          'https://cdn.getyourguide.com/img/tour/640092dd972bb.jpeg/148.jpg',
        ],
        morePicturesUrls: [
          'https://www.businessdailyafrica.com/resource/blob/2244412/335822b09c4f77d522999530e8694437/turtle-data.jpg',
          'https://img.trvcdn.net/https://media.tacdn.com/media/attractions-splice-spp-720x480/0b/91/0d/9d.jpg?imgeng=m_box/w_1418/h_946',
          'https://res.cloudinary.com/tourhq/image/upload/g_auto,c_fill,q_auto:best,fl_progressive,h_507,w_900/aieqq0w70sevbnhqs1n2',
          'https://media.tacdn.com/media/attractions-splice-spp-674x446/07/82/29/9c.jpg',
          'https://lh3.googleusercontent.com/Bt1Mx2EwpRNq6uPzUfCYCXstWxgm-LjEUUQcC6epPsqqDhknVpx-RLJBUGRuDxttxSEZdhox698ZQCaSpcZOrfbpNjm6xfxIEhFCGT2maZaSLrGBNSqb9YIRpgZtclHjdqn2xsXyCxRt3CNWWg',
          'https://scx2.b-cdn.net/gfx/news/2016/agreenseatur.jpg',
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0712428211'],
        location: 'Zanzibar',
        latitude: -3.372410844871815,
        longitude: 36.694510174886155,
      ),
      const Adventure(
        id: '2',
        title: 'Nungwi Mnarani Aquarium',
        description:
            'Dating from 1894, this refined hotel in lush gardens is off the A104 road, a 6-minute walk from the National Natural History Museum and 49 km from Arusha National Park.',
        imageUrls: [
          'https://media.tacdn.com/media/attractions-splice-spp-674x446/0b/2d/13/fc.jpg',
        ],
        morePicturesUrls: [
          'https://zanziplanet.com/wp-content/uploads/2015/05/1.jpg',
          'https://t4.ftcdn.net/jpg/02/73/92/01/360_F_273920126_re41IflFg1t3GpXmIHPJSvQvaeq31xEj.jpg',
          'https://hf-s3.hotelfriend.com/800x418/pages/266/nungwi-beach-zanzibar-tanzania-93400.png',
          'https://uploads-ssl.webflow.com/564479b70e1de1484e3e6973/5e0f1782a58dff16637ddc4a_8%20Reasons%20Why%20Nungwi%20Beach%20Is%20A%20Top%20Tourist%20Destination.%20The%20Z%20Hotel.jpg',
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0712428211'],
        location: 'Zanzibar',
        latitude: -3.372410844871815,
        longitude: 36.694510174886155,
      ),
      const Adventure(
        id: '3',
        title: 'Hiking in Kilimanjaro',
        description:
            'Dating from 1894, this refined hotel in lush gardens is off the A104 road, a 6-minute walk from the National Natural History Museum and 49 km from Arusha National Park.',
        imageUrls: [
          'https://pictures.altai-travel.com/1600x0/hikers-during-the-kilimanjaro-ascent-958.jpg',
        ],
        morePicturesUrls: [
          'https://pictures.altai-travel.com/768x436/fog-at-kilimanjaro-barranco-camp-162.jpg',
          'https://pictures.altai-travel.com/768x436/trekkers-getting-closer-to-the-uhuru-peak-1228.jpg',
          'https://pictures.altai-travel.com/768x210/kilimanjaro-ascent-balme-tristan-2328.jpg',
          'https://pictures.altai-travel.com/1600x0/first-camp-on-lemosho-climb-holland-sam-2387.jpg',
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0712428211'],
        location: 'Kilimanjaro',
        latitude: -3.372410844871815,
        longitude: 36.694510174886155,
      ),
      const Adventure(
        id: '4',
        title: 'Barranco Camp Kilimanjaro',
        description:
            'The Barranco Wall elevation is 257 meters (843 feet) high and is located on the side of Mount Kilimanjaro. The Barranco Wall is what climbers would refer to as a scramble, meaning it does not require mountain climbing skills to traverse the area.',
        imageUrls: [
          'https://pictures.altai-travel.com/1600x0/fog-at-kilimanjaro-barranco-camp-162.jpg',
        ],
        morePicturesUrls: [
          'https://lh3.googleusercontent.com/p/AF1QipMRs899OJqi1223Gpi8QId6ILyPzFR5GOOyE5rf=s680-w680-h510',
          'https://lh3.googleusercontent.com/p/AF1QipMGivVNWuBclUmrE0uiswUEqhA_TxHYNMCitsoa=s680-w680-h510',
          'https://lh3.googleusercontent.com/p/AF1QipMR3TAePdY-7v9uUfBt7if4WeVkE_Rwh1VByeO-=s680-w680-h510',
          'https://lh3.googleusercontent.com/p/AF1QipNRgvwFrQ1lJJuPPZ1w7JZ-theZsmjR1irqVO9q=s680-w680-h510',
          'https://lh3.googleusercontent.com/p/AF1QipNt8fpW2AXfa7RSchvaswn28ZKIm8ShuO0kcw4Y=s680-w680-h510',
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0712428211'],
        location: 'Kilimanjaro',
        latitude: -3.372410844871815,
        longitude: 36.694510174886155,
      ),
      const Adventure(
        id: '5',
        title: 'Usambara Mountains Hiking',
        description:
            'The easiest, and most popular, is a two hour hike from Lushoto to Irente Point, almost 5,000’ (1,500 m) above sea level, providing a stunning panoramic view of the Maasai Steppe.',
        imageUrls: [
          'https://www.kilipeakadventure.com/wp-content/uploads/6-Days-Tanzania-Usambara-Mountains-Hiking-Tour.jpg',
        ],
        morePicturesUrls: [
          'https://safarisolestours.com/wp-content/uploads/2020/06/usambara-2.jpg',
          'https://ychef.files.bbci.co.uk/976x549/p00st88t.jpg',
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/5f/ee/21/usambara-adventures.jpg?w=1200&h=900&s=1',
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/19/5b/fb/explore-the-beauty-of.jpg?w=1200&h=900&s=1',
          'https://media-cdn.tripadvisor.com/media/photo-s/0e/40/87/b4/irente-viewpoint.jpg'
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0712428211'],
        location: 'Tanga',
        latitude: -3.372410844871815,
        longitude: 36.694510174886155,
      ),
      const Adventure(
        id: '6',
        title: 'Materuni Waterfalls Kilimanjaro',
        description:
            'A tour to Materuni Village and Waterfalls is a great way to spend a day away from the bustle of town life. The walk to Materuni Waterfall offers a glimpse into the nature of Tanzania allowing you either to prepare your body for the forthcoming climb to Kilimanjaro or ease your muscles after the climb.',
        imageUrls: [
          'https://cdn.tourradar.com/s3/tour/645x430/156824_5dfac68521a75.jpg',
        ],
        morePicturesUrls: [
          'https://image.jimcdn.com/app/cms/image/transf/dimension=2048x2048:format=jpg/path/s4f4dce6430c23411/image/i3c5d060e26761240/version/1499785221/image.jpg',
          'https://vivaafricatours.com/wp-content/uploads/2014/12/DSC00527-e1420119075464.jpg',
          'https://furtherafrica.com/content-files/uploads/2023/06/materuni_waterfall.jpg',
          'https://www.afrozonekingdomsafaris.com/wp-content/uploads/2023/03/MATERUNI-WATERFALLS_.jpg',
          'https://rivetinglens.files.wordpress.com/2019/05/img_6330-1.jpeg',
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0712428211'],
        location: 'Kilimanjaro',
        latitude: -3.372410844871815,
        longitude: 36.694510174886155,
      ),
      const Adventure(
        id: '7',
        title: 'Materuni Waterfalls Kilimanjaro',
        description:
            'A tour to Materuni Village and Waterfalls is a great way to spend a day away from the bustle of town life. The walk to Materuni Waterfall offers a glimpse into the nature of Tanzania allowing you either to prepare your body for the forthcoming climb to Kilimanjaro or ease your muscles after the climb.',
        imageUrls: [
          'https://cdn.tourradar.com/s3/tour/645x430/156824_5dfac68521a75.jpg',
        ],
        morePicturesUrls: [
          'https://image.jimcdn.com/app/cms/image/transf/dimension=2048x2048:format=jpg/path/s4f4dce6430c23411/image/i3c5d060e26761240/version/1499785221/image.jpg',
          'https://vivaafricatours.com/wp-content/uploads/2014/12/DSC00527-e1420119075464.jpg',
          'https://furtherafrica.com/content-files/uploads/2023/06/materuni_waterfall.jpg',
          'https://www.afrozonekingdomsafaris.com/wp-content/uploads/2023/03/MATERUNI-WATERFALLS_.jpg',
          'https://rivetinglens.files.wordpress.com/2019/05/img_6330-1.jpeg',
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0712428211'],
        location: 'Kilimanjaro',
        latitude: -3.372410844871815,
        longitude: 36.694510174886155,
      ),
      const Adventure(
        id: '8',
        title: 'Materuni Waterfalls Kilimanjaro',
        description:
            'A tour to Materuni Village and Waterfalls is a great way to spend a day away from the bustle of town life. The walk to Materuni Waterfall offers a glimpse into the nature of Tanzania allowing you either to prepare your body for the forthcoming climb to Kilimanjaro or ease your muscles after the climb.',
        imageUrls: [
          'https://cdn.tourradar.com/s3/tour/645x430/156824_5dfac68521a75.jpg',
        ],
        morePicturesUrls: [
          'https://image.jimcdn.com/app/cms/image/transf/dimension=2048x2048:format=jpg/path/s4f4dce6430c23411/image/i3c5d060e26761240/version/1499785221/image.jpg',
          'https://vivaafricatours.com/wp-content/uploads/2014/12/DSC00527-e1420119075464.jpg',
          'https://furtherafrica.com/content-files/uploads/2023/06/materuni_waterfall.jpg',
          'https://www.afrozonekingdomsafaris.com/wp-content/uploads/2023/03/MATERUNI-WATERFALLS_.jpg',
          'https://rivetinglens.files.wordpress.com/2019/05/img_6330-1.jpeg',
        ],
        price: 650,
        rating: 5,
        phoneNumbers: ['0712428211'],
        location: 'Kilimanjaro',
        latitude: -3.372410844871815,
        longitude: 36.694510174886155,
      ),
    ];
  }
}
