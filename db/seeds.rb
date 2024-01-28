Tag.destroy_all
Tagging.destroy_all
Annotation.destroy_all
Writing.destroy_all
Artist.destroy_all

Artist.create(firstname: "Olivier", lastname: "Greif", birthdate: Date.new(1950, 05, 13),
              bio: "Olivier Greif est né le 3 janvier 1950 à Paris. Son père a étudié le piano en Pologne avant d’émigrer en France et de devenir médecin. Enfant prodige, Olivier découvre le piano à trois ans dans un jardin d’enfants. Entré au CNSM à dix ans, il étudie le piano avec Lucette Descaves et la composition avec Tony Aubin. Il se perfectionne à New York auprès de Luciano Berio. Il compose une première série d’œuvres très personnelles, à l’écart des courants en vogue, de 1961 à 1981. Puis il cesse de composer pendant une dizaine d’années pour se consacrer à une “recherche spirituelle” auprès d’un maître indien établi à New York. À partir de 1991, il écrit une nouvelle série d’œuvres, intenses et sombres. Il évoque des sujets qui ont marqué son enfance: la guerre, le séjour de son père à Auschwitz, la disparition d’une grande partie de sa famille dans les camps. Il met en musique des poèmes de Paul Celan. Gravement malade à deux reprises, il meurt à son domicile le 13 mai 2000.")
User.create!(email: "tbaissac@proton.me", password: "y5+j2Z67QXGUA4_Y", role: "super_admin")
Artist.create(firstname: "Jean", lastname: "Cras", birthdate: Date.new(1950, 05, 13), bio: "JEAN CRAS BIOGRAPHIE")
