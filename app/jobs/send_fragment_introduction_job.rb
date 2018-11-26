class SendFragmentIntroductionJob < ActiveJob::Base
  queue_as :notificate

  def perform(user_id, fragment_id)
    user = User.find(user_id)
    fragment = Fragment.find(fragment_id)
    UserMailer.invite(user).deliver_now
  end
end
