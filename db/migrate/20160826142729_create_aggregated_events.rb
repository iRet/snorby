class CreateAggregatedEvents < ActiveRecord::Migration
  def change
    create_view :aggregated_events
  end
end
