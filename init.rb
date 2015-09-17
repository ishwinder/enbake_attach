# Due to the sequence of dependency processing and plugin initialization, these statements cannot be used to auto-install
# missing gems -they are here solely for documentation.
require 'geometry'
require 'hapgood/attach'

Hapgood::Attach::StandardImageGeometry = { :thumbnail => ::Geometry.from_s("128x128>"),
                                  :vignette => ::Geometry.from_s('256x256>'),
                                  :proof => ::Geometry.from_s('512x512>'),
                                  :max => ::Geometry.from_s('2097152@')} # 2 Megapixels

ActiveRecord::Base.send(:extend, Hapgood::Attach::ActMethods)
FileUtils.mkdir_p Hapgood::Attach::Sources::Base.tempfile_path