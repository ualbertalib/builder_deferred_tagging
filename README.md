# BuilderDeferredTagging

This gem extends [builder](https://github.com/jimweirich/builder) to add attributes to an xml tag.  

We use it to specify namespaces when implementing OAI-PMH protocol.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'builder_deferred_tagging'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install builder_deferred_tagging

## Usage

Instead of 
```
xml.target! << '<OAI-PMH ' + Nokogiri::HTML.parse(content_for(:oai_pmh_header)) + '>'
xml.responseDate Time.now.utc.xmlschema
xml << yield
xml.target! << '</OAI-PMH>'
```

You can do
```
xml.tag!('OAI-PMH', xml.deferred_attributes) do
  xml.responseDate Time.now.utc.xmlschema
  xml << yield
end
```

And instead of 
```
content_for :oai_pmh_header do
  'xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:oai-id="http://www.openarchives.org/OAI/2.0/oai-identifier"
  xmlns="http://www.openarchives.org/OAI/2.0/" xmlns:etd_ms="http://www.ndltd.org/standards/metadata/etdms/1.0/"
  xmlns:atom="http://www.w3.org/2005/Atom" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:dcterms="http://purl.org/dc/terms/"
  xmlns:oreatom="http://www.openarchives.org/ore/atom/" xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.openarchives.org/OAI/2.0/
  http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd http://www.openarchives.org/OAI/2.0/oai-identifier
  http://www.openarchives.org/OAI/2.0/oai-identifier.xsd http://www.openarchives.org/OAI/2.0/oai_dc/
  http://www.openarchives.org/OAI/2.0/oai_dc.xsd http://www.ndltd.org/standards/metadata/etdms/1.0/
  http://www.ndltd.org/standards/metadata/etdms/1-0/etdms.xsd http://www.w3.org/2005/Atom"'
end
```
You can do 
```
xml.push_deferred_attribute('xmlns:dc': 'http://purl.org/dc/elements/1.1/',
                            'xmlns:oai-id': 'http://www.openarchives.org/OAI/2.0/oai-identifier',
                            'xmlns': 'http://www.openarchives.org/OAI/2.0/',
                            'xmlns:etd_ms': 'http://www.ndltd.org/standards/metadata/etdms/1.0/',
                            'xmlns:atom': 'http://www.w3.org/2005/Atom',
                            'xmlns:rdfs': 'http://www.w3.org/2000/01/rdf-schema#',
                            'xmlns:rdf': 'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
                            'xmlns:dcterms': 'http://purl.org/dc/terms/',
                            'xmlns:oreatom': 'http://www.openarchives.org/ore/atom/',
                            'xmlns:oai_dc': 'http://www.openarchives.org/OAI/2.0/oai_dc/',
                            'xmlns:xsi': 'http://www.w3.org/2001/XMLSchema-instance',
                            'xsi:schemaLocation': 'http://www.openarchives.org/OAI/2.0/ '\
                            'http://www.openarchives.org/OAI/2.0/OAI-PMH.xsd '\
                            'http://www.openarchives.org/OAI/2.0/oai-identifier '\
                            'http://www.openarchives.org/OAI/2.0/oai-identifier.xsd '\
                            'http://www.openarchives.org/OAI/2.0/oai_dc/ '\
                            'http://www.openarchives.org/OAI/2.0/oai_dc.xsd '\
                            'http://www.ndltd.org/standards/metadata/etdms/1.0/ '\
                            'http://www.ndltd.org/standards/metadata/etdms/1-0/etdms.xsd '\
                            'http://www.w3.org/2005/Atom')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

This is a dependency of https://github.com/ualbertalib/oaisys which is used by https://github.com/ualbertalib/jupiter.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ualbertalib/builder_deferred_tagging.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
