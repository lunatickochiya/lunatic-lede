m = Map("dawn", translate("Dawn Configuration"), translate(""))
s = m:section(TypedSection, "metric", "Metric", "Metric", translate("Metric")); s.anonymous = true;
s:option(Value, "ht_support", "High Throughput Support", translate("High Throughput Support"))
s:option(Value, "no_ht_support", "No High Throughput Support", translate("No High Throughput Support"))
s:option(Value, "vht_support", "Very High Throughput Support", translate("Very High Throughput Support"))
s:option(Value, "no_vht_support", "No Very High Throughput Support", translate("No Very High Throughput Support"))
s:option(Value, "rssi", "RSSI", translate("RSSI"))
s:option(Value, "low_rssi", "Low RSSI", translate("Low RSSI"))
s:option(Value, "freq", "5GHz")
s:option(Value, "chan_util", "Channel Utilization", translate("Channel Utilization"))
s:option(Value, "max_chan_util", "Above Maximum Channel Utilization", translate("Above Maximum Channel Utilization"))

s = m:section(TypedSection, "metric", "Threshold", "Thresholds"); s.anonymous = true;
s:option(Value, "bandwidth_threshold", "Bandwidth Threshold", translate("Bandwidth Threshold"))
s:option(Value, "rssi_val", "RSSI Threshold", translate("RSSI Threshold"))
s:option(Value, "low_rssi_val", "Low RSSI Threshold", translate("Low RSSI Threshold"))
s:option(Value, "chan_util_val", "Channel Utilization Threshold", translate("Channel Utilization Threshold"))
s:option(Value, "max_chan_util_val", "Maximaum Channel Utilization Threshold", translate("Maximaum Channel Utilization Threshold"))
s:option(Value, "min_probe_count", "Minimum Probe Count", translate("Minimum Probe Count"))
s:option(Value, "min_number_to_kick", "Minimum Number After Kicking Client", translate("Minimum Number After Kicking Client"))

s = m:section(TypedSection, "metric", "Evaluate", "What should be evaluated?"); s.anonymous = true;
s:option(Flag, "kicking", "Activate Kicking", translate("Activate Kicking"))
s:option(Flag, "eval_probe_req", "Evaluate Probe Requests", translate("Evaluate Probe Requests"))
s:option(Flag, "eval_auth_req", "Evaluate Authentication Requests", translate("Evaluate Authentication Requests"))
s:option(Flag, "eval_assoc_req", "Evaluate Association Requests", translate("Evaluate Association Requests"))
s:option(Flag, "use_station_count", "Use Station Count", translate("Use Station Count"))

s = m:section(TypedSection, "metric", "IEE802.11", "Reasons for denying", translate("Reasons for denying")); s.anonymous = true;
s:option(Value, "deny_auth_reason", "Denying Authentication", translate("Denying Authentication"))
s:option(Value, "deny_assoc_reason", "Denying Association", translate("Denying Association"))

s = m:section(TypedSection, "times", "Time Configuration", "Time Configs", translate("Denying Association")); s.anonymous = true;
s:option(Value, "update_client", "Update Client Information Interval", translate("Update Client Information Interval"))
s:option(Value, "denied_req_threshold", "Checking if client is connected", translate("Checking if client is connected"))
s:option(Value, "remove_client", "Remove Client Information", translate("Remove Client Information"))
s:option(Value, "remove_probe", "Remove Hearing Map Information", translate("Remove Hearing Map Information"))
s:option(Value, "update_hostapd", "Check for new Hostapd Sockets", translate("Check for new Hostapd Sockets"))
s:option(Value, "update_tcp_con", "Check for new Routers", translate("Check for new Routers"))
s:option(Value, "update_chan_util", "Update Channel Utilization Interval", translate("Update Channel Utilization Interval"))

return m