class Node < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  # validations ...............................................................
  # callbacks .................................................................
  # scopes ....................................................................
  PageType = [["单页型", 'show'], ["三列列表", 'show_list_triple'], ["单列列表", 'show_list_single']]
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
  # private instance methods ..................................................

end