class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.belongs_to :course
      t.timestamps
    end
  end
end
