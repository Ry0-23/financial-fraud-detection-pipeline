with base as (
    select
        transaction_id,
        account_id,
        amount,
        timestamp,
        case when amount > 5000 then 1 else 0 end as high_value_flag
    from transactions
),

daily_activity as (
    select
        account_id,
        date(timestamp) as txn_date,
        count(*) as txn_count
    from transactions
    group by account_id, txn_date
)

select
    b.*,
    da.txn_count,
    case when da.txn_count > 3 then 1 else 0 end as rapid_transactions_flag
from base b
left join daily_activity da
on b.account_id = da.account_id and date(b.timestamp) = da.txn_date

