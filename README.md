# PresentationHub

When it comes to grading presentations made by students, one of the factors taken into account is peer reviews. This application intends on easing this part of the grading process by allowing for students to interactively review the presentations of their peers, with instructors having easy access to this data for grading.

## How to run

1. Ensure that your system has ruby and rails installed
2. CD into the root directory of the downloaded repo, then install the bundled gems:

```bash
$ bundle install
```

3. Apply the base DB migrations to start with a functional database and (optionally) seed the database with sample data:

```bash
$ rake db:migrate
$ rake db:seed # Optional, adds seed data into database
```

4. Run the rails server

```bash
$ rails server
```

5. Access the page through the url specified by rails; the URL is hosted on port 3000.
