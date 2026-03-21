# Database Schema Reference

## Reviews Table

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `id` | BIGSERIAL | Auto-incrementing primary key | 1, 2, 3... |
| `chili` | TEXT | Name of the chili pepper | "Ancho", "Guajillo" |
| `chili_color` | TEXT | Hex color code of the chili | "#4a1a00" |
| `reviewer` | TEXT | Name of the reviewer | "John Doe", "Anonymous" |
| `ratings` | JSONB | JSON object with all ratings | See below |
| `profile_code` | TEXT | Generated flavor profile code | "F8-S2-A7" |
| `notes` | TEXT | Optional tasting notes | "Very smoky with hints of..." |
| `created_at` | TIMESTAMP | Auto-generated timestamp | "2026-03-21T12:00:00Z" |

## Ratings Object Structure (JSONB)

```json
{
  "flavorDepth": 5,    // 1-5 scale
  "earthiness": 4,     // 1-5 scale
  "fruitiness": 3,     // 1-5 scale
  "smokiness": 2,      // 1-5 scale
  "sweetness": 4,      // 1-5 scale
  "heatLevel": 3,      // 1-10 scale
  "colorRating": 3     // 1-6 scale
}
```

## Example Row

```json
{
  "id": 1,
  "chili": "Ancho",
  "chili_color": "#4a1a00",
  "reviewer": "Jane Smith",
  "ratings": {
    "flavorDepth": 5,
    "earthiness": 4,
    "fruitiness": 4,
    "smokiness": 2,
    "sweetness": 4,
    "heatLevel": 1,
    "colorRating": 3
  },
  "profile_code": "F8-S2-A7",
  "notes": "Rich chocolate notes with dried fruit sweetness",
  "created_at": "2026-03-21T12:00:00.000Z"
}
```

## Indexes

- `idx_reviews_chili` - Index on `chili` column for fast filtering
- `idx_reviews_created_at` - Index on `created_at` for fast sorting

## Security (Row Level Security)

- **SELECT**: Public read access (anyone can view reviews)
- **INSERT**: Public insert access (anyone can submit reviews)
- **UPDATE**: Disabled (reviews cannot be edited)
- **DELETE**: Disabled (reviews cannot be deleted by users)

## Queries

### Get all reviews for a specific chili:
```sql
SELECT * FROM reviews 
WHERE chili = 'Ancho' 
ORDER BY created_at DESC;
```

### Get average ratings for a chili:
```sql
SELECT 
  chili,
  AVG((ratings->>'flavorDepth')::int) as avg_flavor_depth,
  AVG((ratings->>'heatLevel')::int) as avg_heat_level,
  COUNT(*) as review_count
FROM reviews 
WHERE chili = 'Ancho'
GROUP BY chili;
```

### Get recent reviews:
```sql
SELECT * FROM reviews 
ORDER BY created_at DESC 
LIMIT 10;
```

### Count reviews by chili:
```sql
SELECT chili, COUNT(*) as count 
FROM reviews 
GROUP BY chili 
ORDER BY count DESC;