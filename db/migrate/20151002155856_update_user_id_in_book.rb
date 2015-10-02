class UpdateUserIdInBook < ActiveRecord::Migration
	
	# Uses command: rails g migration <name>

	# This time, Rails can’t infer what we are trying to do, so we can’t rely on the
	# generated change() method. What we need to do instead is to replace this
	# method with separate up() and down() methods.
	
  def up
  	# Updates all user_id of Book
  	Book.all.each do |book|
  		book.user_id = 1
  		book.save!
  	end
  end

  def down
  	# Updates all user_id of Book
  	Book.all.each do |book|
  		book.user_id = nil
  	end
  end
end
