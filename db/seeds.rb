User.destroy_all
MouvementQuote.destroy_all
Quote.destroy_all
Mouvement.destroy_all
Work.destroy_all

User.create!(email: 'tbaissac@gmail.com', firstname: 'Thibaut', lastname: 'Baissac', password: 'a', token: SecureRandom.uuid, refresh_token: SecureRandom.uuid )
User.create!(email: 'ae.thouvenin@gmail.com', firstname: 'Anne-Elise', lastname: 'Thouvenin', password: 'a', token: SecureRandom.uuid, refresh_token: SecureRandom.uuid )
holderlin = Work.create(title: "Hölderlin Lieder", opus: 270, instrumentation: [Work::Voice, Work::Piano], description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerquote ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
Mouvement.create(title: "Die Entschlafenen", number: 1, dedication: "'Subala' (Patricia Aubertin)", start_date: Date.strptime("1990-12-21"), end_date: Date.strptime("1990-12-21"), work_id: holderlin.id)
mouvement = Mouvement.create(title: "Der Tod fürs Vaterland", number: 2, dedication: "Annette Greif", start_date: Date.strptime("1990-12-22"), end_date: Date.strptime("1990-12-22"), work_id: holderlin.id)
quote = Quote.create(title: "Ein Heller und ein Batzen", category: [Quote::Musical], instrumentation: [Work::Voice, Work::Piano], description: "", history: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerquote ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
MouvementQuote.create(quote_id: quote.id, mouvement_id: mouvement.id, location: "mes. 9-10, 21-22, 26-27, 45-47, 67-72, 89-90, 91-92, 97-100, 101-104")
