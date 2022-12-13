class Course < ApplicationRecord
	has_many :students, dependent: :destroy
end
