# generic robot
class Robot
  def initialize(tool)
    @tool = tool
  end
end

# gun equipment
class Gun
  def use
    puts 'pew pew'
  end
end

# wrench equipment
class Wrench
  def use
    puts 'wrench sounds'
  end
end

# Now we can uses these to compose a couple useful robots

# battle robot
class BattleBot
  def initialize
    @tool = Gun.new
  end

  def fight
    @tool.use
  end
end

# repair robot
class RepairBot
  def initialize
    @tool = Wrench.new
  end

  def repair
    @tool.use
  end
end

battle_bot = BattleBot.new
battle_bot.fight

repair_bot = RepairBot.new
repair_bot.repair