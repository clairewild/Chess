module SlidingPiece

  HORIZONTAL = (-7..7).map { |i| [0,i] }

  VERTICAL = (-7..7).map { |i| [i,0] }

  DIAGONAL = (-7..7).map { |i| [i,i] } +
             (-7..7).map { |i| [-i,i] }

end
