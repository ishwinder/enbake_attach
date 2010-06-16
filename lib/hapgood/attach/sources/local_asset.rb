module Hapgood # :nodoc:
  module Attach # :nodoc:
    module Sources
      class LocalAsset < Hapgood::Attach::Sources::File
        # Does this source persist at the URI independent of this application?
        def persistent?
          true
        end

        # Can this source be modified by this application?
        def readonly?
          true
        end

        # =Metadata=
        def uri
          @data
        end

        # Return ::URI where this attachment is available via http
        def public_uri
          uri
        end

        # =State Transitions=
        def destroy
          # Do nothing -a local asset should outlive any referencing source and its associated attachment.
        end

        private
        # Returns the absolute path of the asset
        def fn
          ::File.join(ActionView::Helpers::AssetTagHelper::ASSETS_DIR, uri.path)
        end

        def file
          ::File.open(fn)
        end
      end
    end
  end
end