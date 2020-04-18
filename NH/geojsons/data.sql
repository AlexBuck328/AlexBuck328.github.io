/* Add your SQL below to extract analyze your state data from at least four layers */

/* *************************************************************** */

/* 1: Extract your state polygon */

create table
	nh
as
select
	geom,
	name
from
	us_states
where
	"state_abbr" = 'NH'






/* *************************************************************** */

/* 2: Extract your urban area polygons */

create table
	nh_urbanareas
as
select
	geom,
	name,
	gis_acres
from
	nhd_urbanareas
where
	"state_abbr" like '%NH%'






/* *************************************************************** */

/* 3: Extract your waterbodies polygons */

create table
	nh_waterbodies
as
select
	geom,
	feature,
	area_sq_mi
from
	nhd_waterbodies
where
	"state" = 'NH'







/* *************************************************************** */

/* 4: Extract your stream lines ordered by size of stream */

create table
	nh_streams
as
select
	geom,
	name,
	length_mi,
	strahler as stream_order
from
	nhd_streams
where
	"state" = 'NH'
and
	strahler > -999
order by
	strahler desc