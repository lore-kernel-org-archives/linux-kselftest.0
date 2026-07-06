Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9851E42B311
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 21:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783372409; cv=none; b=d8YZOZFTezsZBqGZUCV0o48DvhS6kOmp3k9HqSrffMCqzuapAMthO54BQeD8s6BAakxfM27JlGTQvbcRgXipZH1PV/YydM9uiwiv2JmqMPRiqfwh902cfozEV3PZ5tHmWvppNKVznQed4VUHwl5hN4qj2uv28SqS4KjcIEtWli8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783372409; c=relaxed/simple;
	bh=S+PkDhZh3t6IN3EjUsWlEzchoPCNlIc+JZiP3q67Xjc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LgO161szN8IIMyyDLgYmYyxjmb/ikKZ/HqSxz2fWP46viGmXZ3gBfcFxgAVXujM05kg5ciptPDnQf8+de3vXiVl64epxg7Q6+nU/aUh+CS2O39UATo+02NTl3+fZ5FvmnWFw+eOXc7e/4YblQDiX2O3HFX9My1PC83KB6pE4Wcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q/4KGCGK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q/4KGCGK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783372404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K/IiNVEaBSIhPlU7hh3s8hLrT9rD+6NyA4ZJlm2HBq0=;
	b=Q/4KGCGK44ky/q415er8a9s3SM8sDctyJJOTEXp5oND/QcNrf2YX9lXjlGohN0h06qyPgh
	r/Kqj/neTS73gfcm7pD32eK3WazCWR5EmRpLCA3JoLdhvu4GgGLEZqU+8jpXSHqN7DICq2
	dsyPmbJBrheN7agflsjPxvl3f79O5eM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-467-d3cR-lOhO8aQZU2ET1gsFg-1; Mon,
 06 Jul 2026 17:13:19 -0400
X-MC-Unique: d3cR-lOhO8aQZU2ET1gsFg-1
X-Mimecast-MFC-AGG-ID: d3cR-lOhO8aQZU2ET1gsFg_1783372396
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 745901955DAF;
	Mon,  6 Jul 2026 21:13:16 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.81.35])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6A72D18005AA;
	Mon,  6 Jul 2026 21:13:14 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org,  echaudro@redhat.com,  i.maximets@ovn.org,
  davem@davemloft.net,  edumazet@google.com,  kuba@kernel.org,
  pabeni@redhat.com,  horms@kernel.org,  shuah@kernel.org,
  dev@openvswitch.org,  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests/net/openvswitch: add SCTP flow key test
In-Reply-To: <20260702090908.1253688-1-houminxi@gmail.com> (Minxi Hou's
	message of "Thu, 2 Jul 2026 05:09:08 -0400")
References: <20260702090908.1253688-1-houminxi@gmail.com>
Date: Mon, 06 Jul 2026 17:13:13 -0400
Message-ID: <f7to6gj255i.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Hi Minxi,

Minxi Hou <houminxi@gmail.com> writes:

> Register OVS_KEY_ATTR_SCTP in the flow key parser so that sctp()
> can be used in flow specifications. The ovs_key_sctp class already
> exists (with src/dst fields matching the TCP/UDP siblings) but was
> not wired into the parser, so the token was silently dropped and the
> kernel rejected the flow.
>
> Add test_sctp_connect_v4 exercising the SCTP flow key with
> port-specific matching: sctp(dst=4443) for client-to-server and
> sctp(src=4443) for server-to-client, mirroring the SCTP four-way
> handshake direction. The test verifies connectivity with flows
> installed, confirms failure after flow removal, then reinstalls
> and verifies recovery.
>
> Signed-off-by: Minxi Hou <houminxi@gmail.com>
> ---

One issue I think will happen with this patch is that the other two
in-flight patches will also collide.  I'm thinking it may require
rebasing.

A better strategy going forward would be to bundle the new test
additions in one series.  That's just for going forward, do not resubmit
the existing patches I've acked unless a maintainer asks for it.

>  .../selftests/net/openvswitch/openvswitch.sh  | 92 +++++++++++++++++++
>  .../selftests/net/openvswitch/ovs-dpctl.py    |  5 +
>  2 files changed, 97 insertions(+)
>
> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> index 2954245129a2..dd4d0b3bcc23 100755
> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> @@ -32,6 +32,7 @@ tests="
>  	dec_ttl					ttl: dec_ttl decrements IP TTL
>  	flow_set				flow-set: Flow modify
>  	action_set				set: SET action rewrites fields
> +	sctp_connect_v4				sctp: SCTP flow key matching
>  	psample					psample: Sampling packets with psample"
>  
>  info() {
> @@ -443,6 +444,97 @@ test_action_set() {
>  	return 0
>  }
>  
> +# sctp_connect_v4 test
> +# - sctp(dst=4443) matches client-to-server INIT
> +# - sctp(src=4443) matches server-to-client INIT-ACK
> +# - remove flows and verify connection fails, reinstall and recover
> +test_sctp_connect_v4() {
> +	local t="test_sctp_connect_v4"
> +	which ncat >/dev/null 2>&1 || return $ksft_skip
> +	modprobe -q sctp 2>/dev/null || return $ksft_skip
> +
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
> +	ip netns exec server ip addr add 172.31.110.20/24 dev s1
> +	ip netns exec server ip link set s1 up
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
> +	echo "server" | \
> +		ovs_netns_spawn_daemon "$t" "server" \
> +				ncat --sctp -l 172.31.110.20 -vn 4443
> +	sleep 0.1

Instead of this pattern, we can probably do an ovs_wait on the Listening
string.  That way we aren't relying only on the sleep, but on the actual
Ncat output.  Something like

   ovs_wait sh -c
     "[ \$(grep 'Ncat: Listening on ....' ${ovs_dir}/stderr) ]" || \
     return 1

Or you could use a count and do '-ge <number>'

That way if the ncat spawn takes time to start up, it can be ready in
time.

> +	info "verify SCTP association with port-keyed flows"
> +	ovs_sbx "$t" ip netns exec client \
> +	    ncat --sctp -i 1 -zv 172.31.110.20 4443 \
> +	    || return 1
> +
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
> +	echo "server2" | \
> +		ovs_netns_spawn_daemon "$t" "server" \
> +				ncat --sctp -l 172.31.110.20 -vn 4443
> +	sleep 0.1
> +
> +	ovs_sbx "$t" ip netns exec client \
> +	    ncat --sctp -w 2 -zv 172.31.110.20 4443 \
> +	    >/dev/null 2>&1 \
> +	    && { info "FAIL: connection should fail without flows"
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
> +	echo "server3" | \
> +		ovs_netns_spawn_daemon "$t" "server" \
> +				ncat --sctp -l 172.31.110.20 -vn 4443
> +	sleep 0.1
> +
> +	ovs_sbx "$t" ip netns exec client \
> +	    ncat --sctp -i 1 -zv 172.31.110.20 4443 \
> +	    || return 1
> +
> +	return 0
> +}
> +
>  # psample test
>  # - use psample to observe packets
>  test_psample() {
> diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> index e1ecfad2c03e..7cfc29ec7e59 100644
> --- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> +++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> @@ -1982,6 +1982,11 @@ class ovskey(nla):
>                  "icmp",
>                  ovskey.ovs_key_icmp,
>              ),
> +            (
> +                "OVS_KEY_ATTR_SCTP",
> +                "sctp",
> +                ovskey.ovs_key_sctp,
> +            ),
>              (
>                  "OVS_KEY_ATTR_TCP_FLAGS",
>                  "tcp_flags",

