# Neo4j::EvenEasierId

Neo4j reuses its automatically assigned IDs. To deal with this, Neo4j.rb has a feature that generates unique IDs for you, but these are done with SecureRandom::uuid. This is great, but there's no guarantee that these will be unique. To get around *that*, Neo4j.rb lets you define a custom ID property in your models, but this adds some extra work. What's the solution? Maybe it's Neo4j::EvenEasierId!

EvenEasierId generates IDs based on MongoDB's BSON ObjectID generator. The returned values are based on a combination of a calculated machine ID, process ID, and a timestamp. This also doesn't guarantee that you'll get a unique ID but if it fails, at least you're in good company. It also makes the whole process somewhat simpler: include the gem, add one option if you want to change the property name.

In reality, it's very simple. It calls the appropriate method on your models to configure them with UUIDs using `even_easier_id`. It's not a replacement for Neo4j.rb 3.0's UUID method, it builds upon it, so it requires Neo4j.rb 3.0.0.alpha.9 or higher. 

## Installation

Add this line to your application's Gemfile:

    gem 'neo4j-even_easier_id'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install neo4j-even_easier_id

## Usage

Once included in your gemfile, EvenEasierId adds an instance method, `:even_easier_id`, that gets configured as each model's ID generator. It adds a property, `_id`, to your models by default but you can change this by setting `config.neo4j.even_easier_id` equal to a symbol in `application.rb`:

```
config.neo4j.even_easier_id = :my_app_id
node = MyNode.create
node._my_app_id
 => "53f19a3c97b2129b7b000001" 
```

For more information on how this works, read the [id_property documentation](https://github.com/andreasronge/neo4j/wiki/Neo4j%3A%3AActiveNode#id_property-primary-key) for Neo4j.rb 3.0.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/neo4j-even_easier_id/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
