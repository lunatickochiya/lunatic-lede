
m = Map("sfe")
m.title	= translate("Qualcomm Shortcut FE")
m.description = translate("Opensource Qualcomm Shortcut FE driver (Fast Path)")

m:append(Template("lunatic-sfe/status"))

s = m:section(TypedSection, "sfe", "")
s.addremove = false
s.anonymous = true

enable = s:option(Flag, "enabled", translate("Enable"))
enable.default = 0
enable.rmempty = false
enable.description = translate("Enable Fast Path offloading for connections. (decrease cpu load / increase routing throughput)")

bridge = s:option(Flag, "bridge", translate("Bridge Acceleration"))
bridge.default = 0
bridge.rmempty = false
bridge.description = translate("Enable Bridge Acceleration (may be functional conflict with bridge-mode VPN Server)")
bridge:depends("enabled", 1)

return m
