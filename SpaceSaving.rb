# HeavyHitter algorithm
#
# 

class SpaceSaving
  @max_entries=1000  
  attr_accessor :counts,:errors
  def initialize in_max_entries=1_000
    @in_max_entries=in_max_entries
    @counts={}
    @errors={}
  end
  # Add a value in the array
  def add_entry value,inc_count=1
     count=@counts[value]
     if count==nil   #newentry
      if @counts.size>=@in_max_entries
        min=counts.values.min
        old=counts.key min
        @counts.delete old
        @errors.delete old
        @errors[value]=min
        count=min
      else
        count=0
      end
     end
     @counts[value]=count+inc_count
  end
  
end

