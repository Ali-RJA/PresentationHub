def seed_users
  User.destroy_all
  User.create!(
    [
      { email: 'user@example.com', password: 'asdfff' },
      { email: 'user2@example.com', password: 'fdsaff' },
      { email: 'user3@example.com', password: 'fdsaff', is_instructor: true }
    ]
  )
end

def seed_presentations
  Presentation.destroy_all
  Presentation.create!(
    [
      {
        name: 'Presentation 1',
        date: '2021-12-12',
        topic: 'Topic 1',
        user_id: User.find_by(email: 'user@example.com').id
      }
    ]
  )
end

def seed_feedback
  Feedback.destroy_all
  Feedback.create!(
    [
      {
        comments: 'Feedback 1',
        rating: 1,
        presentation:
        Presentation.first,
        user_id: User.find_by(email: 'user2@example.com').id
      },
      {
        comments: 'Feedback 2',
        rating: 2,
        presentation: Presentation.first,
        user_id: User.find_by(email: 'user3@example.com').id
      }
    ]
  )
end

seed_users
seed_presentations
seed_feedback
