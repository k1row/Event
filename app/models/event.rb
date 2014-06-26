class Event < ActiveRecord::Base
  has_many :tickets, dependent: :destroy
  belongs_to :owner, class_name: 'User' # 関連名は「イベントを作成したユーザ」の関連である事をわかりやすくすためownerに


  validates :name, length: { maximum: 50}, presence: true
  validates :place, length: { maximum: 100}, presence: true
  validates :content, length: { maximum: 2000}, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  # イベントの作成者=編集者かどうか？
  def created_by?(user)
    return false unless user
    owner_id == user.id
  end

  # ransackでの検索で検索条件に含める事ができるカラムを返す
  def self.ransackable_attributes(auth_object = nil)
    %w(name start_time)
  end
  # 検索条件に含める事が出来る関連を返す
  def self.ransackable_associations(auth_object = nil)
    []
  end

  private
  def start_time_should_be_before_end_time
  	return unless start_time && end_time

  	if start_time >= end_time
  		errors.add(:start_time, "は終了時間よりも前に設定してください")
  	end
  end
end
