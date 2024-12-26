# Fitness Workout Tracker

A Rails application for tracking workouts and exercises.

## Development

### Setup

1. Clone the repository
2. Install dependencies:

```bash
bundle install
npm install
```

3. Setup the database:
```bash
bin/rails db:setup
```

### Running the Development Server

To run the development server, use:

```bash
./bin/dev
```

Instead of the traditional `rails server` command, we use `./bin/dev` because this application uses Tailwind CSS which requires a build process to run alongside the Rails server.

#### Why ./bin/dev?

The `./bin/dev` command uses [Foreman](https://github.com/ddollar/foreman) to run multiple processes defined in `Procfile.dev`:

- `web`: The Rails server
- `css`: The Tailwind CSS compiler in watch mode

This setup ensures that:
1. Tailwind CSS classes are compiled in real-time as you develop
2. Changes to your CSS are reflected immediately without manual rebuilding
3. Both the Rails server and CSS compiler run in a synchronized way

If you were to run just `rails server`, Tailwind CSS changes would not be compiled automatically, and you would miss out on the utility classes in your views.

### Architecture

- Ruby on Rails 8.0.1
- Tailwind CSS for styling
- SQLite for database
- Turbo and Stimulus for JavaScript enhancements
- Cocoon for nested forms

### Key Features

- User authentication
- Workout tracking
- Exercise management
- Nested exercise forms in workouts
- Comment system for workouts
