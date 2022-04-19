--- answer to question3 ---
SELECT COUNT(*) from public.stg_df_contracts4 WHERE status = 'indelivery'

--- answer to question2 ---
SELECT (SELECT COUNT(*) FROM public.stg_df_contracts3 ) - (SELECT COUNT(*) FROM public.stg_df_contracts2) AS new_contracts_dec

--- formulating answer to question 1 ---
CREATE OR REPLACE VIEW working_consumption_jan AS
SELECT AVG(price) AS avgprice, pricecomponent, AVG(usagenet) as consumption, COUNT
(DISTINCT public.stg_df_contracts4.productid) AS numberof , public.stg_df_contracts4.productid, public.stg_df_products4.productname FROM public.stg_df_contracts4
INNER JOIN public.stg_df_products4 ON 
public.stg_df_contracts4.productid = public.stg_df_products4.id
INNER JOIN public.stg_df_prices4 ON
public.stg_df_contracts4.productid = public.stg_df_prices4.productid
GROUP BY public.stg_df_prices4.pricecomponent, public.stg_df_contracts4.productid, public.stg_df_products4.productname
HAVING public.stg_df_prices4.pricecomponent = 'workingprice'

CREATE OR REPLACE VIEW base_consumption_jan AS
SELECT AVG(price) AS avgprice, pricecomponent, AVG(usagenet) as consumption, COUNT
(DISTINCT public.stg_df_contracts4.productid) AS numberof , public.stg_df_contracts4.productid, public.stg_df_products4.productname FROM public.stg_df_contracts4
INNER JOIN public.stg_df_products4 ON 
public.stg_df_contracts4.productid = public.stg_df_products4.id
INNER JOIN public.stg_df_prices4 ON
public.stg_df_contracts4.productid = public.stg_df_prices4.productid
GROUP BY public.stg_df_prices4.pricecomponent, public.stg_df_contracts4.productid, public.stg_df_products4.productname
HAVING public.stg_df_prices4.pricecomponent = 'baseprice'

SELECT * FROM working_consumption_jan
union all
SELECT * FROM base_consumption_jan

--- playground ---
SELECT AVG(price) AS avgprice, pricecomponent, AVG(usagenet) as consumption, COUNT
(public.stg_df_contracts1.productid) AS numberof , public.stg_df_contracts1.productid,  FROM public.stg_df_contracts1
INNER JOIN public.stg_df_products1 ON 
public.stg_df_contracts1.productid = public.stg_df_products1.id
INNER JOIN public.stg_df_prices1 ON
public.stg_df_contracts1.productid = public.stg_df_prices1.productid
GROUP BY public.stg_df_prices1.pricecomponent, public.stg_df_contracts1.productid
HAVING public.stg_df_prices1.pricecomponent = 'workingprice'