#!mako|json
<%
import json

def get_config(id):

	interfaces = {}
	for key, value in salt['redis.hgetall']('interface:{id}'.format(id=id)).iteritems():
		interfaces[key] = json.loads(value)

	bridges = {}
	for key, value in salt['redis.hgetall']('bridge:{id}'.format(id=id)).iteritems():
		bridges[key] = json.loads(value)

	out = {}
	if len(interfaces) > 0:
		out["interfaces"] = interfaces

	if len(bridges) > 0:
		out["bridges"] = bridges

	return out

ifaces = get_config(grains['id'])

if "hypervisor" in grains['roles']:
	keys = [ key for key in salt['redis.keys']() if key[0:10] == "interfaces" ]
	ifaces["provider_cloud_ips"] = {}
	for key in keys:
		ifaces["provider_cloud_ips"][key] = get_config(key)

%>
${json.dumps(ifaces)}
