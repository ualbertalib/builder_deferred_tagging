require "builder_deferred_tagging/version"
require "builder/xmlmarkup"
require "request_store"

module BuilderDeferredTagging
  Builder::XmlMarkup.class_eval do
    def push_deferred_attribute (attr)
      local_deferred_attributes.merge!(attr)
    end

    def deferred_attributes
      attr = local_deferred_attributes
      clear_local_deferred_attributes
      attr
    end

    private
    def local_deferred_attributes
      RequestStore.store[:deferred_attributes] ||= {}
    end

    def clear_local_deferred_attributes
      RequestStore.store[:deferred_attributes] = {}
    end
  end
end
