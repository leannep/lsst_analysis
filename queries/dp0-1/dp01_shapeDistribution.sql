-- Distribution of Objects in LSST DP0.1 with quality cuts
-- See <>

SELECT floor(fp.i_base_SdssShape_xy/0.5)*0.5 as edge, COUNT(*) as count
FROM dp01_dc2_catalogs.forced_photometry as fp
JOIN dp01_dc2_catalogs.object as obj
ON fp.objectId = obj.objectId
AND i_good = 1
AND i_base_SdssShape_xy != 'NaN'
GROUP BY edge
ORDER BY edge ASC;