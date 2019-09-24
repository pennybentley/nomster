class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :place
  after_create :send_comment_email

  RATINGS = {
    'Yuck': '1_star',
    'Acceptable': '2_stars',
    'Not Bad': '3_stars',
    'Good': '4_stars',
    'Excellent': '5_stars'
  }

  def humanized_rating
    RATINGS.invert[self.rating]
  end

  def send_comment_email
      NotificationMailer.comment_added(self).deliver_now
  end

end
