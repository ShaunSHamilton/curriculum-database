use dotenv::dotenv;
use sqlx::mysql::MySqlPoolOptions;

#[async_std::main]
async fn main() -> Result<(), sqlx::Error> {
    dotenv().ok();
    // Create a connection pool
    let pool = MySqlPoolOptions::new()
        .max_connections(5)
        .connect("mysql://root:@127.0.0.1/curriculum-test")
        .await?;

    let row = match std::fs::read_to_string(format!(
        "./queries/{}.sql",
        std::env::args()
            .nth(1)
            .unwrap_or_else(|| "join-challenge".to_string())
    )) {
        Ok(file) => sqlx::raw_sql(&file).execute(&pool).await?,
        Err(e) => {
            panic!("{e}");
        }
    };

    println!("{:?}", row);

    Ok(())
}
