module Searchable
    
    def search(query)
        if !query.empty?
            self.where("name LIKE ?", "%#{query}%")
        else
            self.all
        end
    end

end