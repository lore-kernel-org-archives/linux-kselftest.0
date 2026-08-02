Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78F13B71C2
	for <linux-kselftest@vger.kernel.org>; Sun,  2 Aug 2026 15:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785685871; cv=none; b=f0c8HZzT/1YFCHK92t+0+b7hxhRwEHf6VKYi3kDOFPs5k5M88q/XAWMkrA07nrvZvd8PMiiMaCodD+fHXUdPVmpMinuhKU/Ynd+5YERN4fV1SLy/yxden+yDVI4y9CM9h69I1AsbXAE6XkjCRhMY4PXMgLI5/uClv1+JOzasSS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785685871; c=relaxed/simple;
	bh=iVoXS/MCfZMGKW6zjNFDH3PZcbm/bTlAERaqpSEasl0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=J+ZdD1/LyNF1AObRDEwrLQBS70r3kgNzh5vghjtalpO7c7RbneOAFSh86UkPZ2y8oeydiH23hAakRbU6wWitCz0iC+fRyqUQifLXEkuMsoxgX3ybwqxZmNzJcASDxng+P87u23pQkAF9AmLYckNVXeRdo3tfXxsqdkligRWOSso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g2smPlnS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g2smPlnS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785685867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vOfM0yeJzY4si1w7/5HxuvGeapeHoMF6WCh6/reuF7g=;
	b=g2smPlnS4/dXHmnKOk24wObe30LxMKtGeSAdlCVPUnO9olfGuI7WNCP300xTcINKIN1Ax0
	0IHdEib59efKnsEppDZWGXnoHNqb/fLmfzaAaDCiGdd8shZfYdBuul3pNVhB74lsJuSNHE
	MWGEkjr5esupE7peOQWZwBRcQGoFd8c=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-416-1eGIdxt_PMaigfKBNkCZGg-1; Sun,
 02 Aug 2026 11:51:04 -0400
X-MC-Unique: 1eGIdxt_PMaigfKBNkCZGg-1
X-Mimecast-MFC-AGG-ID: 1eGIdxt_PMaigfKBNkCZGg_1785685862
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 72F5C195608E;
	Sun,  2 Aug 2026 15:51:02 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.89.32])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7B5491956044;
	Sun,  2 Aug 2026 15:51:00 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org,  davem@davemloft.net,  edumazet@google.com,
  kuba@kernel.org,  pabeni@redhat.com,  echaudro@redhat.com,
  i.maximets@ovn.org,  dev@openvswitch.org,
  linux-kselftest@vger.kernel.org,  shuah@kernel.org,  horms@kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v8] selftests/net/openvswitch: add SCTP flow
 key support and test
In-Reply-To: <20260731062655.4088575-1-houminxi@gmail.com> (Minxi Hou's
	message of "Fri, 31 Jul 2026 02:26:55 -0400")
References: <20260731062655.4088575-1-houminxi@gmail.com>
Date: Sun, 02 Aug 2026 11:50:59 -0400
Message-ID: <f7tzez4v7vg.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi Minxi,

Minxi Hou <houminxi@gmail.com> writes:

> The ovskey flow-string parser has no OVS_KEY_ATTR_SCTP entry, so a
> flow string containing sctp(src=.../dst=...) parses without error but
> silently drops the L4 key. The resulting flow carries only
> ipv4(proto=132), and the kernel rejects it: match_validate() in
> flow_netlink.c requires OVS_KEY_ATTR_SCTP when the IP protocol is
> IPPROTO_SCTP and returns -EINVAL for the missing key.
>
> Register OVS_KEY_ATTR_SCTP in the parse table and add a matching
> selftest that verifies SCTP flow key matching (sctp src/dst port).
>
> Also enable CONFIG_IP_SCTP in the selftest kernel config.
>
> Signed-off-by: Minxi Hou <houminxi@gmail.com>
> ---
>
> Changes from v7:
>   - Drop all unit tests per Ilya's feedback (tests for test code
>     feels excessive); merge patches back into one.
>   - Enable CONFIG_IP_SCTP in the selftest kernel config.
>   - Rebase onto latest net-next; add base-commit header.
> v7: https://lore.kernel.org/netdev/20260729064549.3647518-1-houminxi@gmail.com/
> v6: https://lore.kernel.org/netdev/20260724150624.3457427-1-houminxi@gmail.com/
> v5: https://lore.kernel.org/netdev/20260723215630.2502169-1-houminxi@gmail.com/
> v4: https://lore.kernel.org/netdev/20260723162503.1790998-1-houminxi@gmail.com/
> v3: https://lore.kernel.org/netdev/20260722214915.4128292-1-houminxi@gmail.com/
> v2: https://lore.kernel.org/netdev/20260721190648.2713156-1-houminxi@gmail.com/
> v1: https://lore.kernel.org/netdev/20260718215437.3257200-1-houminxi@gmail.com/
>
>  .../testing/selftests/net/openvswitch/config  |   1 +
>  .../selftests/net/openvswitch/openvswitch.sh  | 121 ++++++++++++++++++
>  .../selftests/net/openvswitch/ovs-dpctl.py    |   5 +
>  3 files changed, 127 insertions(+)
>
> diff --git a/tools/testing/selftests/net/openvswitch/config b/tools/testing/selftests/net/openvswitch/config
> index c659749cd086..754297b1644e 100644
> --- a/tools/testing/selftests/net/openvswitch/config
> +++ b/tools/testing/selftests/net/openvswitch/config
> @@ -1,6 +1,7 @@
>  CONFIG_GENEVE=m
>  CONFIG_INET_DIAG=y
>  CONFIG_IPV6=y
> +CONFIG_IP_SCTP=y
>  CONFIG_NETFILTER=y
>  CONFIG_NET_IPGRE=m
>  CONFIG_NET_IPGRE_DEMUX=m
> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> index 853dbc1b00d7..b448324527d8 100755
> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> @@ -34,6 +34,7 @@ tests="
>  	action_set				set: SET action rewrites fields
>  	trunc					trunc: output truncation
>  	icmpv6					icmpv6: ICMPv6 echo type match
> +	sctp_connect_v4				sctp: SCTP flow key matching
>  	psample					psample: Sampling packets with psample"
>  
>  info() {
> @@ -611,6 +612,126 @@ test_icmpv6() {
>  	return 0
>  }
>  
> +# Check for an SCTP endpoint via /proc, which works without sctp_diag.
> +sctp_eps_has() {
> +	ip netns exec "$1" awk -v p="$2" '$6==p' /proc/net/sctp/eps | grep -q .
> +}
> +
> +# sctp_connect_v4 test
> +# - sctp(dst=4443) matches client-to-server INIT
> +# - sctp(src=4443) matches server-to-client INIT-ACK
> +# - remove flows and verify connection fails, reinstall and recover
> +test_sctp_connect_v4() {
> +	local t="test_sctp_connect_v4"
> +	local srv_ip=172.31.110.20
> +
> +	modprobe -q sctp 2>/dev/null || return "$ksft_skip"
> +	socat -V 2>&1 | grep -q "define WITH_SCTP" || return "$ksft_skip"

socat has the option to run the listener with ',fork' option, which I'll
talk about below.

> +	sbx_add "$t" || return $?
> +	ovs_add_dp "$t" sctp4 || return 1
> +
> +	info "create namespaces"
> +	for ns in client server; do
> +		ovs_add_netns_and_veths "$t" "sctp4" "$ns" \
> +		    "${ns:0:1}0" "${ns:0:1}1" || return 1
> +	done
> +
> +	ip netns exec client ip addr add 172.31.110.10/24 dev c1
> +	ip netns exec client ip link set c1 up
> +	ip netns exec server ip addr add "${srv_ip}/24" dev s1
> +	ip netns exec server ip link set s1 up
> +
> +	# Probe: check if kernel supports sctp flow key.
> +	ovs_add_flow "$t" sctp4 \
> +	    'in_port(1),eth(),eth_type(0x0800),ipv4(proto=132),sctp(dst=4443)' \
> +	    '2' &>/dev/null
> +	if [ $? -ne 0 ]; then
> +		info "no support for sctp key - skipping"
> +		ovs_exit_sig
> +		return $ksft_skip
> +	fi
> +	ovs_del_flows "$t" sctp4
> +
> +	# ARP forwarding
> +	ovs_add_flow "$t" sctp4 \
> +	    'in_port(1),eth(),eth_type(0x0806),arp()' \
> +	    '2' || return 1
> +	ovs_add_flow "$t" sctp4 \
> +	    'in_port(2),eth(),eth_type(0x0806),arp()' \
> +	    '1' || return 1
> +
> +	# SCTP port matching: dst for request, src for reply
> +	ovs_add_flow "$t" sctp4 \
> +	    'in_port(1),eth(),eth_type(0x0800),ipv4(proto=132),sctp(dst=4443)' \
> +	    '2' || return 1
> +	ovs_add_flow "$t" sctp4 \
> +	    'in_port(2),eth(),eth_type(0x0800),ipv4(proto=132),sctp(src=4443)' \
> +	    '1' || return 1
> +
> +	ovs_netns_spawn_daemon "$t" "server" \
> +	    socat -u SCTP4-LISTEN:4443 STDOUT
> +	local server_pid="$pid"
> +	ovs_wait sctp_eps_has server 4443 || return 1
> +
> +	info "verify SCTP association with port-keyed flows"
> +	ovs_sbx "$t" ip netns exec client \
> +	    timeout 3 socat -u STDIN "SCTP4-CONNECT:${srv_ip}:4443" </dev/null \
> +	    || return 1

We spawn a socat instance to listen, and then after we determine the
connection has succeeded, we kill everything, and create new flows.
BUT, as sashiko points out, we do this multiple times, and don't even
check whether the listen socket successfully comes up in the second /
third ones.

I think we could use a single SCTP listen instance with the fork option
as an optimization.  In that case, it would better test that the flows
are working versus just colliding on some possible listener race issue.
What I mean is the pattern:

 -- setup flows
 -- connect
 -- tear down flows

seems fine to me, but the respawning of the listen side feels excessive.

Sashiko seems to imply that we could also do the wait-test with longer
timeout, in the case that we respawn the listener.  There again I'd
argue that it's better just not restarting all of the listening side
each time.

> +	ovs_del_flows "$t" sctp4
> +
> +	info "verify connection fails without flows"
> +	ovs_add_flow "$t" sctp4 \
> +	    'in_port(1),eth(),eth_type(0x0806),arp()' \
> +	    '2' || return 1
> +	ovs_add_flow "$t" sctp4 \
> +	    'in_port(2),eth(),eth_type(0x0806),arp()' \
> +	    '1' || return 1
> +
> +	kill -TERM "$server_pid" 2>/dev/null
> +	local i=0
> +	while kill -0 "$server_pid" 2>/dev/null && [ "$i" -lt 5 ]; do
> +	    sleep 0.2
> +	    i=$((i + 1))
> +	done
> +	ovs_netns_spawn_daemon "$t" "server" \
> +	    socat -u SCTP4-LISTEN:4443 STDOUT
> +	server_pid="$pid"
> +	ovs_wait sctp_eps_has server 4443 || return 1
> +
> +	ovs_sbx "$t" ip netns exec client \
> +	    timeout 3 socat -u STDIN "SCTP4-CONNECT:${srv_ip}:4443" </dev/null \
> +	    >/dev/null 2>&1 \
> +	    && { info "connection should fail without flows"
> +	         return 1; }
> +
> +	info "reinstall flows and verify recovery"
> +	ovs_add_flow "$t" sctp4 \
> +	    'in_port(1),eth(),eth_type(0x0800),ipv4(proto=132),sctp(dst=4443)' \
> +	    '2' || return 1
> +	ovs_add_flow "$t" sctp4 \
> +	    'in_port(2),eth(),eth_type(0x0800),ipv4(proto=132),sctp(src=4443)' \
> +	    '1' || return 1
> +
> +	kill -TERM "$server_pid" 2>/dev/null
> +	i=0
> +	while kill -0 "$server_pid" 2>/dev/null && [ "$i" -lt 5 ]; do
> +	    sleep 0.2
> +	    i=$((i + 1))
> +	done
> +	ovs_netns_spawn_daemon "$t" "server" \
> +	    socat -u SCTP4-LISTEN:4443 STDOUT
> +	server_pid="$pid"
> +	ovs_wait sctp_eps_has server 4443 || return 1
> +
> +	ovs_sbx "$t" ip netns exec client \
> +	    timeout 3 socat -u STDIN "SCTP4-CONNECT:${srv_ip}:4443" </dev/null \
> +	    || return 1
> +
> +	return 0
> +}
> +
>  # psample test
>  # - use psample to observe packets
>  test_psample() {
> diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> index f3edd198223f..ce790d936832 100644
> --- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> +++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> @@ -1984,6 +1984,11 @@ class ovskey(nla):
>                  "udp",
>                  ovskey.ovs_key_udp,
>              ),
> +            (
> +                "OVS_KEY_ATTR_SCTP",
> +                "sctp",
> +                ovskey.ovs_key_sctp,
> +            ),
>              (
>                  "OVS_KEY_ATTR_ICMP",
>                  "icmp",
>
> base-commit: 2fbade66245059c78daeaccfce13ecf499fffb51

