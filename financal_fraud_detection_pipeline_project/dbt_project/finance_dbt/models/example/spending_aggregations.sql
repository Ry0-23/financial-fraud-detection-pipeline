with base as (
    select
        account_id,
        date(timestamp) as txn_date,
        strftime('%Y-%m', timestamp) as month,
        strftime('%Y', timestamp) as year,
        amount
    from transactions
)

select
    account_id,
    year,
    month,
    sum(amount) as total_monthly_spending,
    avg(amount) as avg_transaction
from base
group by account_id, year, month

