# Changelog

## v2.0

### Presentation Create

- Added the ability to choose the author of a presentation at creation time.

### Presentation Edit

- Added feature for editing presentations for instructors, with the ability to change title, author, and upload a document
  if it hasn't been done at creation.

### Presentation Deletion
- Added delete presentation feature for Presentation view
- Added delete presentation feature for Admin view

### Feedback Deletion
- Added delete feedback feature for Presentation view
- Added delete feedback feature for Admin view

### Document Upload

- Modified controller action to handle upload files (not required)
- Modified presentation model to include a on-to-one relationship with the documents database tables
- Two tables: one for blob and one for the linking
- Added active_storage solution by rails
- Added download feature for admin/non-admin users for each presentation (if a document is included)

### Account Segregation (Student, Instructor)

- Added a new column to the users table to identify the user type (`is_instructor`)
- Added redirect to the presentations controller if the user is not an instructor
- Added redirect to the admin controller if the user is an instructor
  - This controller has variations on the views in presentations, along with the ability to create, edit, and delete
    presentations

### User Management

- Added DB migration to add `Active` column to users table to denote whether the user is enrolled or not
- Overrode `destroy` behavior on Devise registrations controller to unset active flag in user row instead of deleting it
- Added variables to index and details pages to reference current user to reduce repeated find_by calls
- Added " (unenrolled)" to end of names on index and detail pages to denote deactivated users
- Changed `Delete Account` button to say `Unenroll` instead to reflect DB change to operation

### Other

- Changed if statements for admin controller redirects to use unless instead
- Added db migration steps to the README.md file
- Added CHANGELOG.md to track changes between versions

## v1.0

- Initial release