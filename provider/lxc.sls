#!mako|json
<%
import json

lxc = {
	"lxc":{
		"containers": dict([ (key, json.loads(value)) for key, value in salt['redis.hgetall']('lxc:{id}'.format(id=id).iteritems() ])
	}
}

%>
${json.dumps(lxc)}
