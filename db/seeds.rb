require 'faker'
require "open-uri"

Hike.destroy_all
puts 'Destroyed all Hikes'

User.destroy_all
puts 'Destroyes all Users'

User.create(
  firstName: 'Test',
  lastName: 'Testing',
  email: 'test@gmail.com',
  password: 'password'
)
puts 'Creating 1 fake User'

User.create(
  firstName: 'Adel',
  lastName: 'Narod',
  email: 'test1@gmail.com',
  password: '123456'
)
puts 'Creating 1 fake User'

User.create(
  firstName: 'Billy',
  lastName: 'Perle',
  email: 'test2@gmail.com',
  password: '123456'
)
puts 'Creating 1 fake User'

User.create(
  firstName: 'Basile',
  lastName: 'Marquefave',
  email: 'test3@gmail.com',
  password: '123456'
)
puts 'Creating 1 fake User'

User.create(
  firstName: 'Jean-philippe',
  lastName: 'Auguste',
  email: 'test4@gmail.com',
  password: '123456'
)
puts 'Creating 1 fake User'

User.create(
  firstName: 'Emmanuel',
  lastName: 'Cangy',
  email: 'test5@gmail.com',
  password: '123456'
)
puts 'Creating 1 fake User'

User.create(
  firstName: 'Le',
  lastName: 'Wagon',
  email: 'test6@gmail.com',
  password: '123456'
)

puts 'Creating 1 fake User'
puts 'Creating 6 fake User'


hike1 = Hike.create(
  name: 'Le Morne',
  address: 'Morne, Mauritius',
  description: 'Le Morne Brabant is one of the most spectacular peaks on the island, a vertiginous peak 555 m high
  which dominates the peninsula located in the south-west of Mauritius. It is also renowned for its very beautiful
  beach and its luxurious hotels that can be admired from the top of this mountain. A metal gate closes access to
  the trail. It is strongly recommended to come very early to benefit from good sunshine without suffering too much
  from the heat: - Go to the south-west and drive to Morne Brabant - Stay on the B9 from the crossing towards the
  hotels of Le Morne for 2 km - In a bend to the left, park at the Embrasure near a ruined hut and the signs of Le
  Morne Brabant - Walk 2500 m on the track which runs along the sea and begin the ascent of Le Morne from the
  official gate - Once at the top, turn around by the same route.',
  latitude: -20.450000,
  longitude: 57.316667
)
file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654859901/Climbly/le_morne_forest_qrpjuq.jpg')
hike1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating hike1'

hike2 = Hike.create(
  name: 'Le Pouce',
  address: 'Moka, Mauritius',
  description: 'Le Pouce is one of many mountains in Mauritius, worn down by erosion over the past two million years:
  - Join Moka from Port Louis or Quatre Bornes by the M3 or M1 to the large Martindale interchanges -
  Take the Bois Chéri Road north of Möka which runs along the Möka River towards Roselyn Cottage -
  In a large bend from the road to Circonstance, locate the brown sign announcing Le Pouce on the left -
  Drive to the end of La Pouce Road for 700 m and park - Start with a track and continue to the summit by
  an increasingly steep path without missing the crossing on the right after the blue oratory - Make a U-turn
  by the same route.',
  latitude: -20.19744,
  longitude: 57.55572
)
file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654859901/Climbly/Le_Pouce_rxwrky.jpg')
hike2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating hike2'

hike3 = Hike.create(
  name: 'La Grande Boucle',
  address: 'Henrietta, Mauritius',
  description: 'This unmissable hike in Mauritius allows you to get as close as possible to the seven waterfalls
   of the Tamarins River in a few hours. From Quatre Bornes or Curepipe, take the B102 (Candos Vacoas Road in
  Quatre Bornes and Vacoas La Martie Road in Curepipe) towards Henrietta - Cross Henrietta by the main road
  - On leaving the town, drive south until at the end of the road, end of the bus line (if necessary, follow
  a bus which specifies going to the terminal on its screen) Continue for about 1500 m to the Henrietta
  cemetery on the left of the road Continue until at the nearby temple and park nearby Go on the track
  opposite and descend towards the river for the two upstream falls (optional, steep, but recommended)
  Join the start of the loop and descend towards the hydroelectric plant before going back up to the
  road near a temple (see § above for details) Walk towards the bus stop and rejoin the vehicle by following
  the sticks or the road if tired.',
  latitude: -20.344388,
  longitude: 57.466476
)
file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654861974/Climbly/7_cascades_erfd9v.jpg')
hike3.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating hike3'

hike4 = Hike.create(
  name: 'Le Piton',
  address: 'La Rivière Noire, Mauritius',
  description: 'With its 828 m altitude, it is the highest peak that can be seen from the viewpoint over the Black River
Gorges looking to the left.
Drive south towards Morne Brabant after passing Tamarin - At the crossroads on the left in the village of Grande Case
Noyale, head towards Chamarel then continue towards Grand Bassin - Park on the left at the viewpoint over the Gorges
de la Rivière Black and go down or not to the viewpoint Walk towards Chamarel then turn off on the path, 200 m
further on the right Follow the path to the top of the peak and turn around by the same route.',
  latitude: -20.39752,
  longitude: 57.46817
)
file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654859901/Climbly/Piton_bsbadr.png')
hike4.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating hike4'

hike5 = Hike.create(
  name: 'Lion Mountain',
  address: 'Mahébourg, Mauritius',
  description: 'The Lion Mountain served as a watchtower in 1810 during the Battle of Vieux-Grand-Port.
It probably takes its name from the shape of its peaks which make one think, with a lot of imagination,
of a resting lion. From Mahébourg, go up along the coast towards Vieux Grand Port bypassing two bays
Cross the village of Vieux Grand Port and park a little before the police station, at the exit of the village
Leave on the track to the left of the police station, fork to the right and join the cane climbing path
Climb Le Lion, descend by the western path to the cane fields – Join the police station and the vehicle at
the end of the loop.',
  latitude: -20.36219,
  longitude: 57.72633
)
file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654859901/Climbly/lion_mountain_zxcbb1.jpg')
hike5.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating hike5'

hike6 = Hike.create(
  name: 'White Mountain',
  address: 'Montagne Blanche, Mauritius',
  description: 'The White Mountain is like all the cliffs on the island which are bare, vertical and bleached by
erosion or lichens: - Getting to the village of the Montagne Blanche from Bel-Air, Center de Flacq or Quartier
Militaire A road leaves the town to the north in the direction of Bel Etang At the crossroads of the road
coming from Pellegrin, seek to park behind the mosque located at the corner Start the hike by the street
opposite, follow the canes to the edge of the wood of ravenales then start the climb At the top, go down
again by the same route.',
  latitude: -20.27202,
  longitude: 57.66307
)
file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654859900/Climbly/montagne_blanche_lt57jp.jpg')
hike6.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating hike6'

hike7 = Hike.create(
  name: 'The Three Peaks',
  address: 'Quatre Bornes, Mauritius',
  description: 'Driving in the south, we can clearly distinguish this massif with its atypical shape with these
Three Peaks: - Drive between Flic en Flac and Quatre Bornes on the B2 (Phoenix Beaux Songes Link Road), turn
at the roundabout towards Quinze Cantons and cross Rivière du Rempart  Continue to a fenced area for storage
of agricultural equipment of the company that works sugar cane, at the junction of Jawaharlall Nehru Avenue
Park the vehicle along the road and take the wide track on the left from the guarded agricultural area,
towards the Montagne des Remparts on the right and the Three Peaks on the left  Walk to the foot of the
Three Peaks, climb to the pass between the central breast and the one on the right Go left towards the
top of the middle breast and return to the starting point by the same route.',
  latitude: -20.30545,
  longitude: 57.44126
)
file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654859900/Climbly/Three_Peaks_vmqayz.jpg')
hike7.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating hike7'

hike8 = Hike.create(
  name: 'Pieter Both',
  address: 'Moka, Mauritius',
  description: 'When you visit Mauritius, the most impressive of all, the Pieter Both massif, does not go unnoticed
with, at its summit, a rock that tops one of the peaks: - Drive on the M3 between Port-Louis and Quatre Bornes,
exit at the roundabout near the Deux mamelles (two characteristic peaks) and take the B49 towards Beau Bois
Before crossing a tributary of the River Möka, turn right onto the Laura road by a fairly tight angle At the Laura,
turn right onto Pieter Both Road and drive almost to the end of the street - Park when you see the rock of Pieter
Both just in the axis of the road - Follow the track which continues the road near modest squares then skirt
orchards and fields Continue on a flat path then steeply uphill to the summit Make a U-turn by the same route.',
  latitude: -20.19209,
  longitude: 57.55523
)
file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654859900/Climbly/pieter-both-blog-1_n4axik.webp')
hike8.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating hike8'

hike9 = Hike.create(
  name: 'Le Corps de Garde',
  address: 'Plaines Wilhems, Mauritius',
  description: 'When driving between Quatre Bornes and Flic en Flac, this mountain seems impressive with its vertical
cliff which dominates the houses of the city: - Coming from Flic en Flac, Quatre Bornes or Tamarin, reach the
shopping center and the Mac Do de Cascavelle Continue to Bambous via the A3  Pass Bambous to Saint-Antoine
and turn right towards Rose-Hill After a right-angle turn to the right then another to the left, you reach
the large cemetery to the right of the road  Fork to the right on the small road to La Chaumière and drive
to the market gardens then to the temple on the left  Continue to the sports ground of La Chaumière  Park
before the small river and start the rise of the peak clearly visible on the right  Climb to the first level
then turn left to reach the two summits  Turn around by the same route.',
  latitude: -20.25541,
  longitude: 57.44607
)
file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654859900/Climbly/corps_de_garde_1_kyzrv4.jpg')
hike9.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating hike9'

hike10 = Hike.create(
  name: 'The Two Peaks',
  address: 'Beau Bois, Mauritius',
  description: 'If the Three Peaks look like all the peaks of Mauritius with its first slopes covered with vegetation
and the rocky and difficult to access summit, the Two Peaks, by their more subjective shape, have earned their name.
The Two Peaks are very close to the M3 expressway which connects Port Louis to Quatre Bornes from the East When
you see them, exit at the nearest roundabout and take the B49, the road which connects Beau Bois and Ripailles
Park at the start of the closed track of large rocks as soon as you are closest to the Two Peaks Follow the
tracks in the canes then the paths to reach the summits by two separate hikes before returning to the road.',
  latitude: -20.19211,
  longitude: 57.56182
)
file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654859901/Climbly/Two_pEAKS_2_w2szra.jpg')
hike10.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating hike10'

Review.create(
  content:
  "It's more impressive than insurmountable, taking your time for both the climb and the descent. The path is
  easy to follow, no difficulty from this point of view, beware of vertigo",
  difficulty: 3,
  rating: 4,
  user_id: User.first.id,
  hike_id: hike1.id
)
# file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654086737/image_1_iwdbta.jpg')
# reviews1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating review'

Review.create(
  content: 'Very quick hike when the weather is nice.
  However, be careful during heavy rain, the path turns into a stream that is very difficult to use. However, dozens of
  ephemeral waterfalls are created and amaze the eyes!',
  difficulty: 1,
  rating: 2,
  user_id: User.first.id,
  hike_id: hike1.id
)
# file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654086737/image_1_iwdbta.jpg')
# reviews2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating review'
Review.create(
  content: 'Awesome hike! More difficult in rainy weather. The lower part gives the impression that the trails are more
  and more abandoned but it\'s still ok. Thanks to those who posted this hike on the site.',
  difficulty: 3,
  rating: 4,
  user_id: User.first.id,
  hike_id: hike1.id
)
# file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654086737/image_1_iwdbta.jpg')
# reviews3.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating review'
Review.create(
  content: 'Not very hard, well indicated and relatively shaded, the view at the top is worth the detour.',
  difficulty: 1,
  rating: 3,
  user_id: User.first.id,
  hike_id: hike4.id
)
# file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654086737/image_1_iwdbta.jpg')
# reviews4.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating review'

Review.create(
  content: 'In summary, one of the best hikes in Mauritius, with breathtaking views and a physical challenge. No need to
  be a pro, but a minimum of experience or training to achieve it!',
  difficulty: 4,
  rating: 5,
  user_id: User.first.id,
  hike_id: hike5.id
)
# file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654086737/image_1_iwdbta.jpg')
# reviews5.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating review'

Review.create(
  content: 'A very beautiful mountain but difficult at the end, grandiose landscapes.',
  difficulty: 4,
  rating: 5,
  user_id: User.first.id,
  hike_id: hike6.id
)
# file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654086737/image_1_iwdbta.jpg')
# reviews6.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating review'

Review.create(
  content: 'Last hike of the stay, in the rain but under the sun the views must be magnificent. It was on the descent
  that I lost my glasses, they are in a black case, so if a hiker finds them, please contact me through the site.',
  difficulty: 2,
  rating: 4,
  user_id: User.first.id,
  hike_id: hike7.id
)
# file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654086737/image_1_iwdbta.jpg')
# reviews7.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating review'

Review.create(
  content:
  'For the moment the most dangerous hike in Mauritius, choose your day well before going up to see Pieter .... and have
  a good physical condition, the climb is tough.',
  difficulty: 5,
  rating: 5,
  user_id: User.first.id,
  hike_id: hike8.id
)
# file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654086737/image_1_iwdbta.jpg')
# reviews8.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating review'

Review.create(
  content:
  'Cool little hike, it climbs quite a bit. The trail is easy to follow. Once at the top, you have to continue
  on the side of the ridge until you reach the tip
  Once there, we have a 360 panorama.',
  difficulty: 1,
  rating: 3,
  user_id: User.first.id,
  hike_id: hike9.id
)
# file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654086737/image_1_iwdbta.jpg')
# reviews9.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating review'

Review.create(
  content: 'As always in Mauritius, the landscapes are sumptuous and the slopes steep.',
  difficulty: 4,
  rating: 3,
  user_id: User.first.id,
  hike_id: hike10.id
)
# file = URI.open('https://res.cloudinary.com/deqc25xt2/image/upload/v1654086737/image_1_iwdbta.jpg')
# reviews110.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts 'Creating review'
puts 'Created 10 fake Reviews'

2.times do
  score = Score.new(
    duration: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    user_id: User.all[0].id,
    hike_id: Hike.all[0].id
  )
  score.save!
  puts 'Created New Score'
end

2.times do
  score = Score.new(
    duration: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    user_id: User.all[0].id,
    hike_id: Hike.all[0].id
  )
  score.save!
  puts 'Created New Score'
end


2.times do
  score = Score.new(
    duration: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    user_id: User.all[3].id,
    hike_id: Hike.all[3].id
  )
  score.save!
  puts 'Created New Score'
end

2.times do
  score = Score.new(
    duration: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    user_id: User.all[4].id,
    hike_id: Hike.all[4].id
  )
  score.save!
  puts 'Created New Score'
end


2.times do
  score = Score.new(
    duration: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    user_id: User.all[5].id,
    hike_id: Hike.all[5].id
  )
  score.save!
  puts 'Created New Score'
end

puts 'Created 11 fake Scores'
