class ApplicationDecorator < Draper::Decorator
  delegate_all
  def self.collection_decorator_class
    PaginationDecorator
  end
end
