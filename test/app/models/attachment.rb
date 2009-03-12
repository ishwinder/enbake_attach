require 'uuidtools'
class Attachment < ActiveRecord::Base
  FILE_STORE = "#{RAILS_ROOT}/public/attachments"

  serialize :metadata, Hash

  attr_protected([:mime_type, :size, :filename, :digest])

  belongs_to :attachee, :polymorphic => true

  has_attachment({:store => Proc.new {|i, a, e| "file://localhost#{FILE_STORE}/#{[i,a].compact.join('_')}.#{e}"}, :_aspects => [:thumbnail], :size => 1.byte..15.megabytes})
  
  validates_as_attachment

  def initialize(attrs = {})
    attrs = attrs || {} # Why is this necessary?  Try Attachment.new and see.
    raise "Ambiguous attachment type." if (attrs[:url] && attrs[:file])
    super
  end

  def to_s
    returning "" do |s|
      s << (self[:description] || self[:filename] || self[:uri] || 'Attachment')
      s << " [#{self[:aspect]}]" if self[:aspect]
    end
  end
  
  # Return a unique id used to tag this attachment's data.
  def uuid!
    @uuid ||= ::UUID.timestamp_create.to_s 
  end
end