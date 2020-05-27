library(timeseriesdb)
con <- kofutils::kof_dbconnect()

tsl <- readTimeSeries(
    con,
    "ch.kof.bts_total.ng08.fx.q_ql_ass_bs.balance.d11",
    schema = "pblc_timeseries")

mi <- readMetaInformation(
    con,
    "ch.kof.bts_total.ng08.fx.q_ql_ass_bs.balance.d11"
)


dbDisconnect(con)
