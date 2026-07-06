INSERT INTO hotel_bookings (
    org_id, hotel_id, city, checkin_date, checkout_date, amount, status, created_at
)
SELECT
    gen_random_uuid(),
    'HOTEL-' || (1000 + gs),
    CASE
        WHEN gs % 5 = 0 THEN 'delhi'
        WHEN gs % 5 = 1 THEN 'mumbai'
        WHEN gs % 5 = 2 THEN 'pune'
        WHEN gs % 5 = 3 THEN 'bangalore'
        ELSE 'hyderabad'
    END,
    CURRENT_DATE + (gs % 20),
    CURRENT_DATE + (gs % 20) + 2,
    (2000 + (gs * 37))::NUMERIC(12,2),
    CASE
        WHEN gs % 4 = 0 THEN 'confirmed'
        WHEN gs % 4 = 1 THEN 'cancelled'
        WHEN gs % 4 = 2 THEN 'pending'
        ELSE 'completed'
    END,
    NOW() - (gs % 45) * INTERVAL '1 day'
FROM generate_series(1, 120) AS gs;

INSERT INTO booking_events (
    booking_id, event_type, payload, created_at
)
SELECT
    id,
    'booking_created',
    jsonb_build_object('source', 'seed_script'),
    created_at
FROM hotel_bookings
WHERE id IN (
    SELECT id FROM hotel_bookings LIMIT 60
);