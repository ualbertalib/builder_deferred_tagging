require "builder_deferred_tagging/version"
require 'builder/xmlmarkup'

module BuilderDeferredTagging
  Builder::XmlMarkup.class_eval do
    @@deferred_attributes = {}
    def push_deferred_attribute (attr)
      @@deferred_attributes = @@deferred_attributes.merge(attr)
    end

    def deferred_attributes
      deferred_attributes_copy = @@deferred_attributes
      @@deferred_attributes = {}
      deferred_attributes_copy
    end
  end
end
