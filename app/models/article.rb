class Article < ApplicationRecord
  belongs_to :user # Muchos articulos pueden tener un solo usuario, FOREIGN KEY
  has_many :comments
  validates :title, presence: true, uniqueness: true # Valida que el elemencto no este vacio
  validates :body, presence: true, length: {minimum:20, maximum:250}
  before_save :set_visits_count

  has_attached_file :cover, styles: { medium: "1280x720", thumb: "800x600" } # Esto quiere decir que tiene un archivo adjunto
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/ # Con esta expresion regular indicamos que se pueden subir todo de imagenes

  def update_visits_count
    self.save if self.visits_count.nil?
    self.update(visits_count: self.visits_count + 1)
  end

  private
    def set_visits_count
      self.visits_count ||= 0
    end
end
