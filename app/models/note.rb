class Note < ApplicationRecord
  belongs_to :notable, polymorphic: true

  # enum form_options: {general: 0, client: 1, project: 2}

end
