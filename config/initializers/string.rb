class String
  def capitalize_words
    self.split.map(&:capitalize).join(' ')
  end
end
