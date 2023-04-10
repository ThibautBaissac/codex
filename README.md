brew install postgresql@15
brew services restart postgresql@15
brew services restart postgresql
./bin/dev

quotes#create in works#show (mouvement)


flatpickr

rails g model Work title opus:integer description:text
rails g migration addInstrumentationToWorks
<!-- add_column :works, :instrumentation, :string, array: true -->
rails g model Mouvement number:integer title dedication start_date:date end_date:date work:references
rails g model Quote title description:text history:text
rails g migration addInstrumentationToQuotes
<!-- add_column :quotes, :instrumentation, :string, array: true -->
rails g model mouvement_quotes location mouvement:references quote:references
