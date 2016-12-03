class CreateSurveyresponds < ActiveRecord::Migration
  def change
    create_table :surveyresponds do |t|
      t.string :info1
      t.string :info2
      t.float :arepros
      t.float :areyou
      t.float :transparent
      t.float :remote
      t.float :alignment
      t.float :faster
      t.float :cheaper
      t.float :discre

      t.timestamps null: false
    end
  end
end
