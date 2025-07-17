SELECT
    TOP 25
    p.TransactionDate
    ,p.Price
    ,p.PostCode
    ,p.PAON
    ,case when p.PropertyType='T' then 'Terraced'
          when p.PropertyType='F' then 'Flat'
          else 'Unknown'
    end as [PropertytypeName]
    ,case p.PropertyType
        when 'F' then 'Flat'
        when 'T' then 'Terrace'
        else 'Unknown'
    end as [PropertyTypeNameSimple]
    ,p.PropertyType
    ,case when p.propertytype in ('T','S','D') then 'Freehold
                        else 'Leasehold'
    end as [Type]
FROM
    PricePaidSW12 AS p
WHERE Street = 'Ormeley Road'  -- a very nice street in Balham
ORDER BY TransactionDate DESC