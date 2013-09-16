module CategoriesHelper
  def category_options
    options = [ [ "", nil ] ]
    Category.all.each do |c|
      options << [ c.name, c.id ]
    end
    options
  end
end
