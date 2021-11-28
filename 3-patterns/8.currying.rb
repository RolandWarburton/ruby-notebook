numbers = (1..10).to_a

#                       1, 2, 3 = false
#                   5   5, 6, 7 = true
#                   |   |
gt_than = ->(x,y) { x < y }.curry
puts numbers.select(&gt_than.call(5)) # 6, 7, 8, 9, 10
