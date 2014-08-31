class Node < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  # validations ...............................................................
  # callbacks .................................................................
  # scopes ....................................................................
  has_ancestry

  # additional config .........................................................
  # class methods .............................................................
  def self.sellect_list
    result = []
    all.each do |node|
      if node.depth == 1
        result << [node.depth_title, node.id]
        result = node.serialize_siblings(result)
      end
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