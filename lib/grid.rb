class Grid
    def grid_template
        <<~GRID
           1  2  3
          __ __ __
       A |  |  |  |
         |__|__|__|
       B |  |  |  |
         |__|__|__|
       C |  |  |  |
         |__|__|__|
        GRID
      end
    
    def grid_coordinates
        ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    end
end