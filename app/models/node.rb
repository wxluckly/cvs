class Node < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  belongs_to :banner

  # validations ...............................................................
  # callbacks .................................................................
  after_save :cb_set_descendants_banner, if: :banner_id_changed?

  # scopes ....................................................................
  PageType = [
    ["单页型", 'show'],
    ["单列列表", 'show_list_single'],
    ["单列列表（大图）", 'show_list_single_big_img'],
    ["两列列表", 'show_list_double'],
    ["三列列表", 'show_list_triple']
  ]
  has_ancestry

  # additional config .........................................................
  mount_uploader :cover, NodeCoverUploader

  # class methods .............................................................
  def self.sellect_list
    result = []
    roots.each do |node|
      result << [node.depth_title, node.id]
      result = node.serialize_siblings(result)
    end
    result
  end

  # public instance methods ...................................................
  def serialize_siblings(array=[self])
    children.order("ancestry").each do |obj|
      array << [obj.depth_title, obj.id]
      obj.serialize_siblings(array)
    end
    array
  end

  def depth_title
    "#{'--' * depth}#{title}"
  end

  # protected instance methods ................................................
  protected
  def cb_set_descendants_banner
    descendants.each do |d|
      d.update(banner_id: self.banner_id)
    end
  end
  
  # private instance methods ..................................................

end