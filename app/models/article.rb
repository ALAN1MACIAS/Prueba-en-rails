class Article < ApplicationRecord
  include AASM

  belongs_to :user # Muchos articulos pueden tener un solo usuario, FOREIGN KEY
  has_many :comments
  has_many :has_categories
  has_many :categories, through: :has_categories

  validates :title, presence: true, uniqueness: true # Valida que el elemencto no este vacio
  validates :body, presence: true, length: {minimum:20, maximum:250}
  before_save :set_visits_count
  after_create :save_categories

  has_attached_file :cover, styles: { medium: "1280x720", thumb: "800x600" } # Esto quiere decir que tiene un archivo adjunto
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/ # Con esta expresion regular indicamos que se pueden subir todo de imagenes

  scope :publicados, -> { where(:state => "published") }
  scope :ultimos, -> { order("created_at DESC") }

  # Custom setter = Es un metodo que permite asignar valor al atrubuto de un objeto
  def categories=(value)
    @categories = value
  end

  def update_visits_count
    self.save if self.visits_count.nil?
    self.update(visits_count: self.visits_count + 1)
  end

  aasm column: "state" do
    state :in_draft, initial: true
    state :published

    event :publish do
      transitions from: :in_draft, to: :published
    end

    event :unpublish do
      transitions from: :published, to: :in_draft
    end
  end

  private

    def save_categories
      # raise categories.to_yaml
      @categories.each do |category_id|
        HasCategory.create(category_id: category_id,article_id: self.id) #self es una instancia de la clase article
      end
    end

    def set_visits_count
      self.visits_count ||= 0
    end
end
