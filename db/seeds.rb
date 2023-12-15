Writing.destroy_all
Artist.destroy_all

og = Artist.create(firstname: "Olivier", lastname: "Messiaen", birthdate: Date.new(1950,05,13), bio: "Olivier ...")
# Writing.create!(artist: og, date: Date.new(1957,05,13), content: "Salle Berlioz. Cet après-midi, audition des élèves de Lucette Descaves. Je joue un “Menuet” et une “Fugue” de Telemann, ainsi qu’une “Petite sonatine” et “En jouant à la balle” de Kabalevsky.")
# Writing.create!(artist: og, date: Date.new(1959,10,15), content: "Audition des élèves de Lucette Descaves à la salle Berlioz. Je joue une “Bagatelle” (en fa) de Beethoven, le “Golliwog’s Cake-Walk” extrait du “Children’s Corner” de Debussy et “Nausicaa”, ma première œuvre, composée en 1957 d’après un épisode célèbre de l’Odyssée d’Homère, dont je possédais alors une édition illustrée pour les enfants. Mon écriture était encore si gauche et incorrecte à l’époque que mon père avait dû prendre lui-même ce morceau en dictée — tandis que je le lui jouais au piano – et en mettre la partition au propre.")
