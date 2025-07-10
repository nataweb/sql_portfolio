--************************************************************
--****** Aggregation functions on marketing analytics*********
--************************************************************
select 
campaign_id,Length(campaign_id) length_campaign,
adset_id,length(adset_id) length_adset,
url_parameters, length(url_parameters)
from facebook_ads_basic_daily fabd 

SELECT 
  campaign_id,
  LENGTH(campaign_id) AS length_campaign,
  adset_id,
  LENGTH(adset_id) AS length_adset,
  url_parameters,
  LENGTH(url_parameters) AS length_url_parameters
FROM 
  facebook_ads_basic_daily fabd
WHERE 
  url_parameters LIKE '%utm_source=face%';

select * from "facebook_ads_basic_daily" fabd
where fabd.impressions > 100000 and ad_date::VARCHAR like '2022-%';

select 
round(spend/clicks::numeric,1) as cps,
round(1000*spend/impressions::numeric,1) as cpm,
round(clicks/impressions::numeric,1) as ctr,
round(value/spend:: numeric,1) as romi,*
from facebook_ads_basic_daily
where clicks>0 and impressions>0 and spend>0;

select sum(spend) as total_spend,
avg(spend) as avg_spend,
min(spend) as min_spend,
max(spend) as max_spend
from facebook_ads_basic_daily
where ad_date between '2021-01-01' and '2021-12-31'
and spend > 0;

select count(*),count(spend),min(ad_date),max(ad_date)
from facebook_ads_basic_daily;

select count(distinct campaign_id)
from facebook_ads_basic_daily;



