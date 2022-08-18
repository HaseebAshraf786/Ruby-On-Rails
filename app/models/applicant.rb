class Applicant < ApplicationRecord
  belongs_to :post
 
  enum astatus: [:hired,:nothired]
end