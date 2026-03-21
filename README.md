# JJ's Juice - Chili Pepper Rating App

A React web application for rating and reviewing different types of chili peppers. Track flavor profiles, heat levels, and tasting notes for various dried chilies used in Mexican cuisine.

## Features

- **Rate Chilies**: Evaluate chilies across multiple attributes (flavor depth, earthiness, fruitiness, smokiness, sweetness)
- **Heat Meter**: Interactive heat level rating (1-10 scale)
- **Color Rating**: Visual color classification system
- **Review History**: View all submitted reviews with timestamps
- **Aggregate Stats**: See average ratings across all reviews
- **Detailed Info**: Learn about each chili's characteristics, rehydration methods, and best uses

## Included Chilies

- Ancho (Dried Poblano)
- Mulato (Dried Brown Poblano)
- Pasilla (Chile Negro)
- Guajillo (Dried Mirasol)
- Cascabel
- Morita (Smoked Chipotle)

## Getting Started

### Prerequisites

- Node.js (v16 or higher)
- npm or yarn

### Installation

1. Clone the repository or navigate to the project directory:
```bash
cd jjjuice
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm run dev
```

4. Open your browser and navigate to the URL shown in the terminal (typically `http://localhost:5173`)

### Configure Database (Required for Persistence)

This app uses Supabase for persistent storage of reviews across all users.

1. Follow the complete setup guide in [SUPABASE_SETUP.md](./SUPABASE_SETUP.md)
2. Create a free Supabase account and project
3. Run the SQL schema to create the database table
4. Add your Supabase credentials to `.env` file

**Quick setup:**
```bash
# Copy environment template
cp .env.example .env

# Edit .env and add your Supabase credentials
# VITE_SUPABASE_URL=your-project-url
# VITE_SUPABASE_ANON_KEY=your-anon-key
```

### Build for Production

To create a production build:
```bash
npm run build
```

The built files will be in the `dist` directory.

To preview the production build:
```bash
npm run preview
```

### Deploy to Vercel

The easiest way to deploy:

```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
vercel

# Add environment variables in Vercel dashboard or CLI
vercel env add VITE_SUPABASE_URL
vercel env add VITE_SUPABASE_ANON_KEY

# Deploy to production
vercel --prod
```

See [SUPABASE_SETUP.md](./SUPABASE_SETUP.md) for detailed deployment instructions.

## Usage

1. **Select a Chili**: Click on any chili from the list on the left
2. **Rate Attributes**: Use the sliders to rate flavor characteristics (1-5 scale)
3. **Set Heat Level**: Click on the heat meter to set the spice level (1-10 scale)
4. **Choose Color**: Select the color that best matches the chili
5. **Add Notes**: Optionally add tasting notes
6. **Submit**: Click "Submit Rating" to save your review
7. **View History**: Switch to "Review History" to see all past reviews
8. **Check Totals**: View "Aggregate Totals" for average ratings across all reviews

## Technology Stack

- **React 18**: UI framework
- **Vite**: Build tool and dev server
- **Supabase**: PostgreSQL database for persistent storage
- **JavaScript/JSX**: Programming language
- **CSS-in-JS**: Inline styling for component-based design

## Project Structure

```
jjjuice/
├── src/
│   ├── App.jsx              # Main application component
│   ├── main.jsx             # Application entry point
│   ├── supabaseClient.js    # Supabase configuration
│   └── index.css            # Global styles
├── index.html               # HTML template
├── package.json             # Dependencies and scripts
├── vite.config.js           # Vite configuration
├── supabase-schema.sql      # Database schema
├── SUPABASE_SETUP.md        # Supabase setup guide
├── .env.example             # Environment variables template
└── README.md                # This file
```

## Data Storage

Reviews are stored in **Supabase** (PostgreSQL database), providing:
- ✅ Persistent storage across all devices and browsers
- ✅ Shared reviews between all users
- ✅ Real-time data synchronization
- ✅ Automatic backups
- ✅ Free tier (500MB storage, unlimited API requests)

See [SUPABASE_SETUP.md](./SUPABASE_SETUP.md) for complete setup instructions.

## License

This project is open source and available for personal and educational use.

## Contributing

Feel free to submit issues and enhancement requests!