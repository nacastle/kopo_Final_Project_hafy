

SELECT 
    transaction_date,
    transaction_account_no,
    transaction_amount,
    transaction_name,
    bid_account_no,
    category,
    transaction_seq
FROM account_transaction_t;


SELECT 
    bid_account_no,
    create_date,
    account_name,
    account_holder
FROM auction_meeting_account_t;


SELECT 
    bid_mode,
    start_date,
    close_date,
    status,
    start_price,
    bid_unit,
    auction_seq
FROM auction_t;


SELECT 
    code_no,
    code_name,
    code_category,
    usage_status
FROM detail_code_t;


SELECT 
    category,
    feature,
    registration_date,
    name,
    auction_seq
FROM goods_t;


SELECT 
    code_category,
    code_name
FROM group_code_t;


SELECT 
    member_id,
    name,
    social_security_no,
    sex,
    cell_phone_no,
    email,
    address,
    account_no,
    account_bank
FROM member_t;


SELECT 
    member_id,
    auction_seq,
    member_type
FROM participant_t;


SELECT 
    win_price,
    win_date,
    member_id,
    auction_seq,
    member_type
FROM winner_t;


