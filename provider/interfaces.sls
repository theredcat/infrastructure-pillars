#!mako|json
<%
import json

def get_config(id):
	interfaces = dict([ (key, json.loads(value)) for key, value in salt['redis.hgetall']('interfaces:{id}'.format(id=id)).iteritems() ])
	bridges = dict([ (key, json.loads(value)) for key, value in salt['redis.hgetall']('bridges:{id}'.format(id=id).iteritems() ])

	out = {}
	if len(interfaces) > 0:
		out["interfaces"] = interfaces

	if len(bridges) > 0:
		out["bridges"] = bridges

	return out

ifaces = get_config(grains['id'])

if "hypervisor" in grains['roles']:
	keys = [ key for key in salt['redis.keys']() if key[0:10] == "interfaces" ]
	for key in keys:
		ifaces["provider_cloud_ips"]["key"] = get_config(key)

%>
${json.dumps(ifaces)}
