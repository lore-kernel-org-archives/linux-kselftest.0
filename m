Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DC73E1223
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777909891; cv=none; b=Z8TlPf0xGDC96abKRUebvIIzyIKnMu2cvIqkD/TQ2g9lDM3z6Or6+OF8mhQXMvmB+jUlHXvQ7Cz0sM3e2ZH4RNQvcds6NFNwcEKYCUr1pvK41dOdMLwMFnWZjn4UZChj+3c7xeHSRWAO5aUAvj+o4yQKWax/+jZKqcokjxWa5tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777909891; c=relaxed/simple;
	bh=dKS5tOCUkQw2/WTdtU9Ru2emt+eAEMMtSM+W/lIi16w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B0u8xFVn51OvR9GATu5Ft+l09cYiRGDHbu2eemA6y/jMo/RDs5Nvq9qlt+w0Xnvcsi47fH9ilt8vjX168aD25w7QVAy+LbatBHy/+/xUI20VjmV6FHAPgEDLQDJgVy2Rq5V6BB/UCTboDZswM5Bky6zx592w+wlD0j67/yz5OZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aK6m41lW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aK6m41lW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777909888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7mAboTdKx/KzU26OvF2xuPSku3vGjfoT3BnD5m24x0E=;
	b=aK6m41lW5JUGskRQKmhc6Wxs2s7vLadXnb0jqgh47zNctXhhuMBGEIKF2B3AroiXdihYKB
	C+AHChvgzjkwUgyuWqqEqSxt9WAnE7ccQXny00HbFzV1DUgIKEANkcK6dgFj2ZJHmr/3D4
	I6uuNOHVjH8POa8Q4R7q7twpa9QyhKk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-510-ufGe0cqsOM2fCFMmiWRAgg-1; Mon,
 04 May 2026 11:51:25 -0400
X-MC-Unique: ufGe0cqsOM2fCFMmiWRAgg-1
X-Mimecast-MFC-AGG-ID: ufGe0cqsOM2fCFMmiWRAgg_1777909883
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5DD291800364;
	Mon,  4 May 2026 15:51:23 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.64.157])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7C98E19560A6;
	Mon,  4 May 2026 15:51:20 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  dev@openvswitch.org,  Eelco Chaudron <echaudro@redhat.com>,  Ilya
 Maximets <i.maximets@ovn.org>,  "David S. Miller" <davem@davemloft.net>,
  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,
  Paolo Abeni <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,  Shuah
 Khan <shuah@kernel.org>,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] selftests: openvswitch: add pop_vlan test
In-Reply-To: <20260501133924.3100680-3-houminxi@gmail.com> (Minxi Hou's
	message of "Fri, 1 May 2026 21:39:23 +0800")
References: <20260501133924.3100680-1-houminxi@gmail.com>
	<20260501133924.3100680-3-houminxi@gmail.com>
Date: Mon, 04 May 2026 11:51:18 -0400
Message-ID: <f7tlddzxjex.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Hi Minxi,

Thanks for the test (and the support infra in 1/2).  Questions below.

Minxi Hou <houminxi@gmail.com> writes:

> Add a test for the OVS datapath POP_VLAN action.  The test uses
> the VLAN sub-interface of a veth pair to generate 802.1Q tagged
> frames and verifies that pop_vlan correctly strips the VLAN tag
> before delivery via pcap frame capture.
>
> The test has two verifications:
> - Negative: forward tagged frames without pop_vlan, verify the
>   VLAN tag is still present on the egress interface.
> - Positive: apply pop_vlan, verify the tag is removed and an
>   untagged ICMP echo request arrives at the egress interface.
>
> Static ARP entries avoid the complexity of VLAN-tagged ARP
> resolution (the egress side has no VLAN sub-interface and cannot
> process tagged ARP).
>
> Signed-off-by: Minxi Hou <houminxi@gmail.com>
> ---
> v1 -> v2: rebase to latest net-next/main, drop --base=auto
>
>  .../selftests/net/openvswitch/openvswitch.sh  | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>
> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> index b327d3061ed5..cd614ff7b740 100755
> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> @@ -27,6 +27,7 @@ tests="
>  	upcall_interfaces			ovs: test the upcall interfaces
>  	tunnel_metadata				ovs: test extraction of tunnel metadata
>  	drop_reason				drop: test drop reasons are emitted
> +	pop_vlan					vlan-pop: POP_VLAN action strips 802.1Q tag

nit: The whitespace alignment above is slightly off.

>  	psample					psample: Sampling packets with psample"
>  
>  info() {
> @@ -830,6 +831,137 @@ test_tunnel_metadata() {
>  	return 0
>  }
>  
> +test_pop_vlan() {
> +	modprobe -q openvswitch 2>/dev/null || true
> +	[ -d /sys/module/openvswitch ] || return $ksft_skip
> +	ip netns add __test_pop_vlan_netns__ 2>/dev/null || \
> +		{ info "CONFIG_NET_NS missing"; return $ksft_skip; }
> +	ip netns del __test_pop_vlan_netns__ 2>/dev/null

Weird that this is here.  All other tests would also not work if there
were no netns or OVS module.  Why were these added?

> +	modprobe -q 8021q 2>/dev/null || true
> +	[ -d /sys/module/8021q ] || { info "CONFIG_VLAN_8021Q missing"; return $ksft_skip; }
> +
> +	local sbx="test_pop_vlan"
> +	sbx_add "$sbx" || return $ksft_skip
> +	ovs_add_dp "$sbx" vlandp || return 1
> +
> +	# --- baseline: untagged forwarding ---
> +	ovs_add_netns_and_veths "$sbx" vlandp ns1 veth1 ns1veth 192.0.2.1/24 || return 1
> +	ovs_add_netns_and_veths "$sbx" vlandp ns2 veth2 ns2veth 192.0.2.2/24 || return 1
> +
> +	# ARP + IPv4 bidirectional (all untagged)
> +	ovs_add_flow "$sbx" vlandp \
> +		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
> +	ovs_add_flow "$sbx" vlandp \
> +		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
> +	ovs_add_flow "$sbx" vlandp \
> +		'in_port(1),eth(),eth_type(0x0800),ipv4()' '2' || return 1
> +	ovs_add_flow "$sbx" vlandp \
> +		'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return 1
> +	ip netns exec ns1 ping -c 3 -W 2 192.0.2.2 || return 1
> +
> +	# --- POP_VLAN test ---
> +	# Register cleanup before creating resources (safe on failure paths)
> +	on_exit "ip -n ns1 link del ns1veth.10 2>/dev/null || true
> +		 ip -n ns2 addr del 198.51.100.2/24 dev ns2veth 2>/dev/null || true"
> +
> +	# ns1: VLAN sub-interface generates tagged frames
> +	ip -n ns1 link add link ns1veth name ns1veth.10 type vlan id 10
> +	ip -n ns1 addr add 198.51.100.1/24 dev ns1veth.10
> +	ip -n ns1 link set ns1veth.10 up
> +
> +	# ns2: no VLAN sub-interface. POP delivers untagged frames to ns2veth
> +	ip -n ns2 addr add 198.51.100.2/24 dev ns2veth
> +
> +	# veth disable VLAN offload + GRO (ensure kernel software tag processing)
> +	if command -v ethtool >/dev/null 2>&1; then
> +		ip netns exec ns1 ethtool -k ns1veth 2>/dev/null | grep -q vlan-offload && \
> +			ip netns exec ns1 ethtool -K ns1veth rx-vlan-offload off \
> +				tx-vlan-offload off gro off 2>/dev/null || true
> +		ip netns exec ns2 ethtool -k ns2veth 2>/dev/null | grep -q vlan-offload && \
> +			ip netns exec ns2 ethtool -K ns2veth rx-vlan-offload off \
> +				tx-vlan-offload off gro off 2>/dev/null || true
> +	fi
> +
> +	ovs_del_flows "$sbx" vlandp
> +
> +	# Static ARP avoids VLAN-tagged ARP complexity (ns2 has no VLAN
> +	# sub-interface, so tagged ARP would be invisible to ns2).
> +	local ns1veth10mac ns2mac
> +	ns1veth10mac=$(ip -n ns1 link show ns1veth.10 | \
> +		awk '/link\/ether/ {print $2}')
> +	ns2mac=$(ip -n ns2 link show ns2veth | \
> +		awk '/link\/ether/ {print $2}')
> +	[ -n "$ns1veth10mac" ] && echo "$ns1veth10mac" | \
> +		grep -qE "^([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}$" || return 1
> +	[ -n "$ns2mac" ] && echo "$ns2mac" | \
> +		grep -qE "^([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}$" || return 1
> +	ip -n ns1 neigh replace 198.51.100.2 lladdr "$ns2mac" \
> +		dev ns1veth.10 nud permanent || return 1
> +	ip -n ns2 neigh replace 198.51.100.1 lladdr "$ns1veth10mac" \
> +		dev ns2veth nud permanent || return 1
> +
> +	# --- Negative check: fwd without pop_vlan, VLAN tag stays ---
> +	ovs_add_flow "$sbx" vlandp \
> +		'in_port(1),eth(),eth_type(0x8100),vlan(vid=10),encap(eth_type(0x0800),ipv4(src=198.51.100.1,proto=1),icmp())' \
> +		'2' || return 1
> +
> +	local pcap_no_pop
> +	pcap_no_pop=$(mktemp --suffix=.pcap)
> +	on_exit "rm -f $pcap_no_pop"
> +	ip netns exec ns2 tcpdump -nei ns2veth -w "$pcap_no_pop" -U &
> +	local tpid_no_pop=$!
> +	on_exit "kill $tpid_no_pop 2>/dev/null || true"
> +	sleep $((WAIT_TIMEOUT / 5 < 2 ? 2 : WAIT_TIMEOUT / 5))
> +

We don't like to make extra files when not requested.  For example, this
is making some pcap file but do we need it?  We also have a specific
spawn function `ovs_netns_spawn_daemon` that should take care of
cleaning up at least the PID.

> +	ip netns exec ns1 ping -I ns1veth.10 -c 3 -W 1 198.51.100.2 \
> +		>/dev/null 2>&1 || true
> +	kill $tpid_no_pop 2>/dev/null || true; wait $tpid_no_pop 2>/dev/null || true
> +
> +	# assert: VLAN tag still present (no pop_vlan in action)
> +	tcpdump -nr "$pcap_no_pop" 'vlan' 2>/dev/null | grep -q . || {
> +		info "FAIL: negative check: no VLAN tag (expected tag present)"; return 1
> +	}
> +
> +	ovs_del_flows "$sbx" vlandp
> +
> +	# --- Positive: pop_vlan strips tag ---
> +	ovs_add_flow "$sbx" vlandp \
> +		'in_port(1),eth(),eth_type(0x8100),vlan(vid=10),encap(eth_type(0x0800),ipv4(src=198.51.100.1,proto=1),icmp())' \
> +		'pop_vlan,2' || return 1
> +	ovs_add_flow "$sbx" vlandp \
> +		'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return 1
> +
> +	local pcap
> +	pcap=$(mktemp --suffix=.pcap)
> +	on_exit "rm -f $pcap"
> +	ip netns exec ns2 tcpdump -nei ns2veth -w "$pcap" -U &
> +	local tpid=$!
> +	on_exit "kill $tpid 2>/dev/null || true"
> +	sleep $((WAIT_TIMEOUT / 5 < 2 ? 2 : WAIT_TIMEOUT / 5))
> +
> +	# ping reply unreachable: ns1veth.10 only accepts tagged frames,
> +	# ns2 sends untagged reply -> dropped by ns1veth.10.
> +	local ping_rc=0
> +	ip netns exec ns1 ping -I ns1veth.10 -c 3 -W 1 198.51.100.2 \
> +		>/dev/null 2>&1 || ping_rc=$?
> +	kill $tpid 2>/dev/null || true; wait $tpid 2>/dev/null || true
> +
> +	# ping failure is expected (reply path asymmetric)
> +	[ "$ping_rc" -ne 0 ] || \
> +		info "NOTE: ping succeeded unexpectedly (reply reached ns1veth.10)"
> +
> +	# assert: no VLAN tag (POP succeeded), untagged ICMP echo request arrived
> +	tcpdump -nr "$pcap" 'vlan' 2>/dev/null | grep -q . && {
> +		info "FAIL: POP_VLAN: VLAN tag still present"; return 1
> +	}
> +	tcpdump -nr "$pcap" 'icmp and icmp[icmptype]=8' \
> +		2>/dev/null | grep -q . || {
> +		info "FAIL: POP_VLAN: no untagged ICMP echo request"; return 1
> +	}

Do we really need these tcpdump checks?  The ping commands above should
already capture when we are expecting tagged / untagged traffic.

> +	return 0
> +}
> +
>  run_test() {
>  	(
>  	tname="$1"

