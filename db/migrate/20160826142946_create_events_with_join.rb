class CreateEventsWithJoin < ActiveRecord::Migration
  def change
    create_view :events_with_join
  end
end
