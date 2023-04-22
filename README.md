brew install postgresql@15
brew services restart postgresql@15
brew services restart postgresql
./bin/dev

<!-- TO DO -->
Remove element description, histoire...from mouvement
Single select to add existing citation to mouvement
Fix JS for showing/hiding with_influence


rails g model Work title opus:integer description:text
rails g migration addInstrumentationToWorks
<!-- add_column :works, :instrumentation, :string, array: true -->
rails g model Mouvement number:integer title dedication start_date:date end_date:date work:references
rails g model Element title description:text history:text
rails g migration addInstrumentationToElements
<!-- add_column :elements, :instrumentation, :string, array: true -->
rails g model mouvement_elements location mouvement:references element:references
