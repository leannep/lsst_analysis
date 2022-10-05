-- Gaia observed CMD
-- Adapted from Use case: Gaia DR2, Gaia Collaboration, Andrae et al. 2018 A&A 616, A8; adapted Fig. 19
-- https://www.aanda.org/articles/aa/pdf/2018/08/aa32516-17.pdf

SELECT
  bp_rp_index / 10 as bp_rp,
  g_mag_abs_index / 10 as g_mag_abs,
  COUNT(*) as n
FROM (
     ## DC2 add in a cut on redshift  and some cuts on the quality of the data
  SELECT top 1000000 source_id,
    floor((phot_g_mean_mag+5*log10(parallax)-10) * 10) as g_mag_abs_index,
    floor(bp_rp * 10) as bp_rp_index
  FROM gaiadr2.gaia_source
  WHERE parallax_over_error >= 5 and
    phot_bp_mean_flux_over_error > 0 and
    phot_rp_mean_flux_over_error > 0 and
    sqrt(
      power(2.5/log(10) / phot_bp_mean_flux_over_error, 2)
      + power(2.5/log(10) / phot_rp_mean_flux_over_error, 2)
    ) <= 0.05
  ORDER BY random_index
)as subquery
GROUP BY bp_rp_index, g_mag_abs_index