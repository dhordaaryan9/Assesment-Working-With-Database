import pandas as pd
from sqlalchemy import create_engine

def run_ingestion():
    db_url = "mysql+pymysql://root:password@localhost/food_tech_analytics"
    engine = create_engine(db_url)
    
    print("Loading cleaned dataset...")
    df = pd.read_csv('zomato_cleaned.csv') 

    print("1. Ingesting Unique Locations...")
    unique_locations = pd.DataFrame(df['location'].dropna().unique(), columns=['location_name'])
    unique_locations.to_sql('locations', con=engine, if_exists='append', index=False)
    
    print("2. Mapping Locations to Restaurants...")
    location_map = pd.read_sql('SELECT location_id, location_name FROM locations', con=engine)
    
    df = df.merge(location_map, left_on='location', right_on='location_name', how='left')
    
    print("3. Ingesting Restaurants...")
    df['online_order'] = df['online_order'].map({'Yes': True, 'No': False})
    df['book_table'] = df['book_table'].map({'Yes': True, 'No': False})
    
    restaurant_df = df[['name', 'location_id', 'approx_cost(for two)', 'online_order', 'book_table']].copy()
    restaurant_df.columns = ['name', 'location_id', 'avg_cost_for_two', 'has_online_order', 'has_book_table']
    restaurant_df.to_sql('restaurants', con=engine, if_exists='append', index=False)
    
    print("Pipeline Complete! Data is now relational.")

if __name__ == "__main__":
    run_ingestion()