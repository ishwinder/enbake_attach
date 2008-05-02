module GroupSmarts # :nodoc:
  module Attach # :nodoc:
    module Sources
      # Methods for Tempfile-based primary sources.
      class Tempfile < GroupSmarts::Attach::Sources::File
        def initialize(tempfile, metadata)
          super
          @tempfile = @data
        end
        
        # =Metadata=
        # Returns the URI of the source.
        def uri
          path = URI.encode(@tempfile.respond_to?(:local_path) ? @tempfile.local_path : @tempfile.path)
          @uri ||= BASE_URI.merge(path)
        end
        
        # Returns a file name suitable for this source when saved in a persistent file.
        def filename
          @tempfile.respond_to?(:original_filename) && @tempfile.original_filename
        end
        
        # Returns the MIME::Type of source.
        def mime_type
          @mime_type ||= @tempfile.respond_to?(:content_type) ? @tempfile.content_type : Mime::Type.lookup_by_extension(filename.split('.')[-1])
        end
        
        # Augment metadata
        def metadata
          returning super do |h|
#            h[:uri] = uri
            h[:mime_type] = mime_type if mime_type
            h[:filename] = filename if filename
          end          
        end        
        
        # =Data=
        # Returns the source's data as a blob string.  WARNING: Performance problems can result if the source is large
        def blob
          tempfile.read
        end

        # Trivial short-circuit that returns the rewind tempfile itself.
        def tempfile
          @tempfile.rewind
          @tempfile
        end

        # Returns the rewound IO instance that we are proxying.
        def io
          tempfile
        end
      end
    end
  end
end