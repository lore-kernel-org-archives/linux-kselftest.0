Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2662353A69;
	Sun,  6 Sep 2026 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788706818; cv=none; b=cUUSswW8KKHsX8ysWozKUXFtOK78PNDyCEHMz0+tiOxsScCnyQoGy19+KMwLRFuwMMYSvcLQ48L74obtzxthIuN05UHu0SzQRyqNtDkDTTC2IIlGQYkvapSLA2FSpVhI9v7k97oSpEgHPiKNtmRaOM7z1KjF7iSaKa+wXtjYU4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788706818; c=relaxed/simple;
	bh=FX+RcU6nl17biw9sc4qJEsghqJIQey4LWd7hqqHt4ug=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iYm++xjDhHthZrM8IekeKCTiHDvCTPX9We9RiatmYS4rsUvMF2dDBX7/Wm0xRDj3orK5hodZVf1lDSowW4I1bNzReay7sfdHeVEAcc95LLcS4k7DmgpXTr2S9WU2n+QefYqKPMLpeCDJZDwQiJ8FK6nv23fkfa7VcmIi8Qk8HqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZ8Vjwn1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZ8Vjwn1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70151F00A3D;
	Sun,  6 Sep 2026 15:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788706816;
	bh=Pi5UX23vDaXBI+GYlGYi5f/2tJhQkeyDgZDPpcmIajw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NZ8Vjwn1ake0Z9Do4fOU0UT5odaLBJmYTwalHIeqgsV1qljHfZFlnrw8lFavzb7Ug
	 VdHcwj0lxZiDk+d3j4NmxWHRDtfY+N8HpWPdOn8KumgsqvRWHhvrF2gGoAyOhS0G/j
	 6f4lLeo5ZWUVtGGbYgCES/kfHNI7ghCzSfJRgFy1fruEWlU4g2/ANmUzGE93983nop
	 cTNPWVKSGxhDIBw4zXA3X+hp//mBGxkZuV05OPJ7ZrFhdtP7fsEnJ/vuhbi8dvbrWz
	 /H5sTfFlw16nmZkNBfFmSAW+fGNbLo6QJbriMtdChHqeZkOaFBdTdmwts9aDZu+Ex0
	 31NPr3dbvgFsw==
Subject: Re: [PATCH net-next v2 2/2] selftests/net/openvswitch: add SCTP flow
 key test across conntrack NAT
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, aconole@redhat.com, davem@davemloft.net,
 dev@openvswitch.org, echaudro@redhat.com, edumazet@google.com,
 i.maximets@ovn.org, i.maximets@redhat.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 pabeni@redhat.com, shuah@kernel.org, horms@kernel.org
Date: Sun, 06 Sep 2026 15:00:15 +0000
Message-ID: <178870681538.219967.7170546046224229657@kernel.org>
In-Reply-To: <20260902125133.1828572-3-houminxi@gmail.com>
References: <20260902125133.1828572-3-houminxi@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 3 · Low: 1

- [Medium] Commit-message/coverage mismatch: the new
  `test_sctp_nat_connect_v4` cannot detect the bug class its commit…
- [Medium] `test_sctp_nat_connect_v4` probes only the plain `ct(commit)`
  action (openvswitch.sh:1224-1231) before deciding SKIP vs. run, but…
- [Medium] Unsynchronized cross-process check makes the new test flaky.
- [Low] The Open vSwitch selftest Kconfig fragment
  (tools/testing/selftests/net/openvswitch/config) is not updated for…

--

selftests/net/openvswitch: add SCTP flow key test across conntrack NAT

This adds test_sctp_nat_connect_v4 to the openvswitch selftest suite. It
builds a client/server namespace pair, installs ct(commit,nat(...)) plus
recirc flows, and checks that an SCTP association and a DATA payload cross
the translation.

A few questions about the new test below.

> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> index 06bd98d80a08..d5acdca0a0ac 100755
> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh

[ ... ]

> @@ -1186,6 +1187,91 @@ test_nat_connect_v4 () {
>  	return 0
>  }
>  
> +# sctp_nat_connect_v4 test
> +#  - SCTP association crosses a ct(commit,nat(dst=...)) translation
> +#  - post-recirc flows match ct_state(+trk) plus the extracted SCTP ports
> +test_sctp_nat_connect_v4 () {
> +	local t="test_sctp_nat_connect_v4"
> +	local payload="SCTP_NAT_DATA_OK"
> +	local rxfile="${ovs_base}/${t}/sctp-rx.txt"
> +
> +	modprobe -q sctp 2>/dev/null || return "$ksft_skip"
> +	socat -V 2>&1 | grep -q "define WITH_SCTP" || return "$ksft_skip"
> +	# SCTP conntrack is compiled into nf_conntrack.ko, so check that
> +	# loading it actually exposed the SCTP conntrack sysctls.
> +	modprobe -q nf_conntrack 2>/dev/null || return "$ksft_skip"
> +	[ -e /proc/sys/net/netfilter/nf_conntrack_sctp_timeout_established ] \
> +	    || { info "no SCTP conntrack support - skipping"
> +	         return "$ksft_skip"; }

[Severity: Low]

Should tools/testing/selftests/net/openvswitch/config gain the kernel options
this new test depends on?

The sysctl probed here only exists when CONFIG_NF_CT_PROTO_SCTP is enabled,
and that option is an independent bool:

net/netfilter/Kconfig:
	config NF_CT_PROTO_SCTP
		bool 'SCTP protocol connection tracking support'
		depends on NETFILTER_ADVANCED
		default y

With NETFILTER_ADVANCED=n the dependency is unmet and the option is off in
spite of the default, and a base config that sets it to n is unaffected by
merging the fragment.

The current fragment has:

	CONFIG_IP_SCTP=y
	CONFIG_NF_CONNTRACK=m
	CONFIG_NF_CONNTRACK_OVS=y
	CONFIG_OPENVSWITCH=m

so in those builds the test returns $ksft_skip and the coverage the changelog
describes never runs. Would adding CONFIG_NF_CT_PROTO_SCTP=y (and
CONFIG_NF_NAT=y, see below) to the fragment make it deterministic?

[ ... ]

> +	# Check if the ct action can be configured.
> +	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
> +		'in_port(1),eth(),eth_type(0x0800),ipv4()' \
> +		'ct(commit),recirc(0x1)' &> /dev/null
> +	if [ $? == 1 ]; then
> +		info "no support for ct action - skipping"
> +		ovs_exit_sig
> +		return $ksft_skip
> +	fi

[Severity: Medium]

This probe tests plain ct(commit), but the flows installed below require the
nat action. Does that turn a missing CONFIG_NF_NAT into a reported failure
instead of a skip?

In net/openvswitch/conntrack.c, both the policy entry and the parse arm are
compiled conditionally:

	#if IS_ENABLED(CONFIG_NF_NAT)
		/* NAT length is checked when parsing the nested attributes. */
		[OVS_CT_ATTR_NAT]	= { .minlen = 0, .maxlen = INT_MAX },
	#endif

With NF_NAT off the entry is {0, 0}, so the nested nat attribute fails the
length check in parse_ct() and the flow add is rejected with -EINVAL, while
the ct(commit) probe above still succeeds.

That configuration is reachable from the suite's own fragment, which does not
set CONFIG_NF_NAT, and:

net/netfilter/Kconfig:
	config NF_NAT
		tristate "Network Address Translation support"
		depends on NF_CONNTRACK
		default m if NETFILTER_ADVANCED=n

CONFIG_OPENVSWITCH only does "select NF_NAT_OVS if NF_NAT", so with the usual
NETFILTER_ADVANCED=y, NF_NAT defaults to n. Would probing with
ct(commit,nat(dst=...)) instead, or skipping rather than failing on the nat
flow adds, keep this a skip?

[ ... ]

> +	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
> +		"ct_state(-trk),in_port(1),eth(),eth_type(0x0800),ipv4(dst=192.168.0.20)" \
> +		"ct(commit,nat(dst=172.31.110.20)),recirc(0x1)" || return 1
> +	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
> +		"ct_state(-trk),in_port(2),eth(),eth_type(0x0800),ipv4()" \
> +		"ct(commit,nat),recirc(0x2)" || return 1
> +
> +	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
> +		"recirc_id(0x1),ct_state(+trk-inv),in_port(1),eth(),eth_type(0x0800),ipv4(proto=132),sctp(dst=4443)" \
> +		"2" || return 1
> +	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
> +		"recirc_id(0x2),ct_state(+trk-inv),in_port(2),eth(),eth_type(0x0800),ipv4(proto=132),sctp(src=4443)" \
> +		"1" || return 1

[Severity: Medium]

Can these flows actually detect a post-NAT SCTP flow key bug?

nat(dst=172.31.110.20) rewrites only the IPv4 destination and never a port,
and the post-recirc flows match ipv4(proto=132) plus sctp(dst=4443) /
sctp(src=4443) - exactly the fields NAT leaves alone. The translated
addresses are not matched at all.

The post-NAT ports are patched into the key here:

net/openvswitch/conntrack.c:ovs_nat_update_key() {
	...
		if (key->ip.proto == IPPROTO_UDP)
			dst = udp_hdr(skb)->dest;
		else if (key->ip.proto == IPPROTO_TCP)
			dst = tcp_hdr(skb)->dest;
		else if (key->ip.proto == IPPROTO_SCTP)
			dst = sctp_hdr(skb)->dest;
		else
			return;

		key->tp.dst = dst;
	...
}

If the IPPROTO_SCTP arms were deleted so the function took the bare return,
key->tp.dst / key->tp.src would keep their identical first-pass values and
both flows would still match, so the test would still pass.

Would matching on distinct translated SCTP ports, and/or on the translated
addresses in the post-recirc flows, give the intended coverage?

Also on the changelog:

	Conntrack NAT rewrites the packet between the first-pass and recirc
	passes, and OVS re-extracts L3/L4 on the recirculated skb via
	ovs_flow_key_update_l3l4().

Is that the path this test exercises? ovs_flow_key_update_l3l4() in
net/openvswitch/flow.c has a single caller:

net/openvswitch/conntrack.c:ovs_ct_handle_fragments() {
	...
	/* The key extracted from the fragment that completed this datagram
	 * likely didn't have an L4 header, so regenerate it.
	 */
	ovs_flow_key_update_l3l4(skb, key);
	...
}

that is, only for datagrams reassembled from IP fragments, which this test
never produces. On the plain ct+recirc path the key is not re-extracted:

net/openvswitch/actions.c:execute_recirc() {
	...
	if (!is_flow_key_valid(key)) {
		int err;

		err = ovs_flow_key_update(skb, key);
	...
}

and the CT/NAT action does not call invalidate_flow_key().

	After the association succeeds the test pushes a known payload across and
	verifies the listener received it, so a flow-key bug that matches
	handshake packets but breaks DATA chunks is caught too.

Is there such a distinction? SCTP key extraction reads only the common
header source/destination ports, which are the same for INIT and DATA
chunks.

> +	ovs_netns_spawn_daemon "test_sctp_nat_connect_v4" "server" \
> +		socat -u -t 1 SCTP4-LISTEN:4443,fork \
> +		OPEN:"$rxfile",creat,append

[ ... ]

> +	info "verify SCTP DATA chunk crosses NAT"
> +	ovs_sbx "test_sctp_nat_connect_v4" ip netns exec client \
> +	    timeout 3 socat -u STDIN "SCTP4-CONNECT:192.168.0.20:4443" \
> +	    <<< "$payload" || return 1
> +	grep -q "$payload" "$rxfile" 2>/dev/null \
> +	    || { info "server did not receive SCTP DATA payload"
> +	         return 1; }

[Severity: Medium]

Can this grep race the server writing $rxfile?

The listener is started in the background:

ovs_netns_spawn_daemon() {
	...
		ip netns exec $netns $*  >> $ovs_dir/stdout  2>> $ovs_dir/stderr &
	pid=$!
	...
}

and ",fork" means a separate per-association child does the read() and the
write() into $rxfile. The client socat exiting only means its own socket was
closed; delivery to the server socket, the child's read() and its write() to
the file all happen afterwards in another process, and "-t 1" decouples the
child's lifetime from the client's exit.

So this interleaving looks possible:

	client socat exits
	shell runs grep -q on an empty/short $rxfile   -> return 1
	server child writes payload

Every other cross-process observation in this file goes through the retry
helper, and this same test already uses it for endpoint readiness:

	ovs_wait sctp_eps_has server 4443 || return 1

with ovs_wait() polling up to WAIT_TIMEOUT (raised to 10s when
KSFT_MACHINE_SLOW=yes). Would "ovs_wait grep -q "$payload" "$rxfile"" be
more robust here?

The same one-shot grep pattern was introduced one patch earlier in this
series, in the IPv6 SCTP test, so both places would need the same change.

> +
> +	info "done..."
> +	return 0
> +}
> +

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260902125133.1828572-1-houminxi%40gmail.com
