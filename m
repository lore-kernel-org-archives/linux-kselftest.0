Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859324;
	b=haeI1VJASOGtdmyzkzDvoEX6af4KNWGInpud0WE0mk2iHnlJGVR5JoVJnIqGB6HevPmU
	 OHUAeneQg2qw+TFidYGOCCXrPj+vtXcUA6B1sP3nb2iwgsASAY2ZS12wze7jUv8GI01K9
	 eA5TDHj25BC0GelJH7iGP6LJyOIH4auCUPWZRcO44+2b7XIxt26QD+zWLMbgsGA8IpyqU
	 Bsi3P/tJFvnHoo9KEQ89pLLBnwjjMt7PN/h0H8sHfchfvZVAvaBT2BuVbmqCv+sHddtv/
	 Ph961waiRiMT1jy+pX7qeUwOuVE3pvntV73BAbXo+/Wa17X/kr5ascDj3YTe6FOLifA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859324;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=uGVYCMVsHA6dEUJ8RKY83xz970x/aKFi/WGNeJ/AVcY=;
	b=qWoYEhQA6wQbzVnmRA7WawKhVAZBw8FG7047m9CRzPYAoDNFVAlIl/ytp1lnQG6IlKaX
	 VXgFC50P6eDDN+ter3oZexCe1nqmiLCSm0AukFyrz8AXk37wkpHNZkh0KbaN/3l2uimwv
	 07qdO2hzEPfSaeEIy6riSZuEtgOmgn1FCW+RzYlgbdhKRHzpXkG7C460P5dfZ00YT+0t6
	 ytuxS6SxsqeGDAvqBYlUDz1OE+koViZGOGjZNa6/ZP633uizCP9ozH+oW4/ragOmgdfc1
	 chfvnGPbkiRy9XgsV48b2bJhon25ZjUtXfB1AcB5FPNLejidb/zGqkaLNrVKbNj/Hcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hzcP2AXQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEC8606A686;
	Sat, 28 Nov 2026 09:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hzcP2AXQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A7A1F0093B;
	Sat, 28 Nov 2026 09:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795859323;
	bh=uGVYCMVsHA6dEUJ8RKY83xz970x/aKFi/WGNeJ/AVcY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hzcP2AXQTw+k6I4VELIUECKg7K1IpzTCjykfU7y9gC/xt7FEjGQNpQjJKz4h7zNKa
	 k/LPvWszGK6rVsxAhDb9mtVCMjQ6EBjnkvM7B97xMsLIyR0fm0uiCU6CmSk46oXZ4E
	 FYc09FyYI/FTjmbqrnO1YJMOumM+VA7K8cZ/+BR07otTdq3H2qkgeypovFBJPGmCme
	 MyMfampm35veAofwkOlOT2yhxTQVmHBHE+114BZUamZdoXmyUI9fFDzOb6kGRRSD9n
	 SuuZ7MhI/W00VqPvr3qNEr0bwiJkduw5STdhvrEUJFJXJg0GPgMwzukh1WF9Tiwshl
	 HOGFKfDcWbYyQ==
Subject: Re: [PATCH net-next v3 11/12] selftests: net: add amt_v6.sh for an
 IPv6 outer transport
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, willemb@google.com
Date: Sat, 28 Nov 2026 09:48:42 +0000
Message-ID: <179585932242.3135.16441032758888744822@kernel.org>
In-Reply-To: <20261127094703.3025517-12-omar@blockcast.net>
References: <20261127094703.3025517-12-omar@blockcast.net>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In tools/testing/selftests/net/amt_v6.sh, the "none" mode of
  test_forward() is what checks "a third gateway in a /64 at its cap…
- [Low] In tools/testing/selftests/net/amt_v6.sh, disc_answer() starts
  tcpdump in the background with stdout and stderr sent to /dev/null.
- [Low] The comment in setup_links()
  (tools/testing/selftests/net/amt_v6.sh) gives the wrong reason for…
- [Low] In tools/testing/selftests/net/amt_v6.sh, the IPv4 and IPv6
  halves of the query-egress check count different things.
- [Low] The header and the driver now disagree on what a "source" is for
  the tunnel cap.

--

selftests: net: add amt_v6.sh for an IPv6 outer transport

This adds amt_v6.sh, a variant of amt.sh in which the AMT gateways and
the relay talk over an IPv6 outer link. It checks:

- discovery through a secondary relay address
- IPv4 and IPv6 forwarding over the tunnel
- the per-/64 tunnel cap
- that queries do not leave through amtr
- tunnel MTU handling
- that a Discovery sent to ff02::1 is not answered
- gateway link down/up

> diff --git a/tools/testing/selftests/net/amt_v6.sh b/tools/testing/selftests/net/amt_v6.sh
> new file mode 100755
> index 0000000000000..201e820cba683
> --- /dev/null
> +++ b/tools/testing/selftests/net/amt_v6.sh

[ ... ]

> +setup_links()
> +{
> +	local ns
> +
> +	# No DAD: the relay sources its MLD General Query from amtr's
> +	# link-local address, which must not be tentative when it is sent.
> +	for ns in "$LISTENER" "$GATEWAY" "$GATEWAY2" "$RELAY" "$SOURCE"; do
> +		ip netns exec "$ns" sysctl -wq \
> +			net.ipv6.conf.all.accept_dad=0 \
> +			net.ipv6.conf.default.accept_dad=0
> +	done

[Severity: Low]
Is this the right reason for turning DAD off? amtr never goes through DAD,
whatever accept_dad is set to, because amt_link_setup() marks the device
NOARP:

drivers/net/amt.c:amt_link_setup() {
    ...
	dev->flags		= IFF_POINTOPOINT | IFF_NOARP | IFF_MULTICAST;
    ...
}

addrconf_dad_begin() then completes DAD at once for that device:

net/ipv6/addrconf.c:addrconf_dad_begin() {
    ...
	if (dev->flags&(IFF_NOARP|IFF_LOOPBACK) ||
	    (READ_ONCE(net->ipv6.devconf_all->accept_dad) < 1 &&
	     READ_ONCE(idev->cnf.accept_dad) < 1) ||
    ...
}

The sysctl seems to matter for the global addresses on gw_relay,
gw2_relay, br_gw, gw3_relay and gw4_relay instead. Without it they would
stay tentative, and the gateways could not bind to them or send from them.

Could the comment say that, so the sysctl doesn't later get dropped as
redundant?

[ ... ]

> +	ip -n "$RELAY" link add amtr type amt mode relay local "$RELAY6" \
> +		dev br_gw relay_port 2268 max_tunnels 16
> +	# max_tunnels 16 allows two tunnels per source (max_tunnels / 8), and a
> +	# source is a /64: test_source_cap relies on it.
> +	# Count the IGMP and MLD queries that leave the relay through its own
> +	# amt device; test_query_egress expects none.
> +	ip netns exec "$RELAY" tc qdisc add dev amtr clsact
> +	ip netns exec "$RELAY" tc filter add dev amtr egress pref 1 \
> +		protocol ip flower ip_proto 0x2 action pass
> +	ip netns exec "$RELAY" tc filter add dev amtr egress pref 2 \
> +		protocol ipv6 flower ip_proto icmpv6 type 130 action pass

[Severity: Low]
The comment says these filters count IGMP and MLD queries, but only the
IPv6 filter is narrowed to a query (type 130). The pref 1 filter matches
every IGMP packet on amtr egress, including reports, leaves and MRD
messages, not just Membership Queries (type 0x11).

test_query_egress() still reports a non-zero pref 1 count as queries:

	check_err $? "$n4 IGMP queries left through amtr"

Should the IPv4 match be narrowed to type 0x11, for example with a u32
match on the IGMP type byte? Otherwise, should the comment and the message
say IGMP packets rather than queries?

[ ... ]

> +test_forward()
> +{
> +	local ns=$1 addr=$2 port=$3 grp=$4 src=$5 desc=$6 want=${7:-data}
> +	local out pid i
> +
> +	RET=0
> +	out=$(mktemp)
> +	ip netns exec "$ns" timeout 20 \
> +		socat -u "$addr,readbytes=128" - > "$out" &
> +	pid=$!
> +	wait_local_port_listen "$ns" "$port" udp
> +	for i in $(seq 15); do
> +		ip netns exec "$SOURCE" bash -c \
> +			"printf '%s %128s' $src | nc -w 1 -u $grp $port"
> +		[ "$want" = data ] && grep -q "$src" "$out" && break
> +	done
> +	wait "$pid"
> +	if [ "$want" = data ]; then
> +		grep -q "$src" "$out"
> +		check_err $? "nothing from $src reached the listener"
> +	else
> +		! grep -q "$src" "$out"
> +		check_err $? "$src reached a listener that should get no tunnel"
> +	fi

[Severity: Low]
Can the "none" case pass when the listener never started? wait "$pid"
throws away socat's exit status. If the port never appears,
wait_local_port_listen() in lib.sh just leaves its loop without reporting
a failure:

tools/testing/selftests/net/lib.sh:wait_local_port_listen() {
    ...
	for i in $(seq 10); do
		if ip netns exec "${listener_ns}" awk '{print $2" "$4}' \
		   /proc/net/"${protocol}"* | grep -q "${pattern}"; then
			break
		fi
		sleep 0.1
	done
}

Suppose socat exits at once, for instance because the bind or the
ip-add-membership on amtg4 fails. Then $out stays empty, and the only
check, ! grep -q "$src" "$out", reports OK.

test_source_cap() relies on this for "a third gateway in a /64 at its cap
gets no tunnel", so the cap would never actually be exercised.

A live listener in "none" mode always ends with status 124 from
timeout 20. Would requiring that status here, or confirming the group
join, close the gap? The commit message applies the rule "a broken
capture cannot pass it" to the ff02::1 check only.

[ ... ]

> +# The relay allows two tunnels per source, and amtg and amtg2 hold both for
> +# 2001:db8:a::/64: the relay counts the tunnels of one source per /64, not
> +# per address. A third gateway in that /64, with an address of its own,
> +# must get no Membership Query, so no tunnel and no multicast, while a
> +# gateway in another /64 gets all three. Counting per address would let
> +# the third one in, and let one host fill the table from its /64.
> +test_source_cap()

[Severity: Low]
This isn't a bug in the script, but the header still describes the cap as
per address:

include/net/amt.h:
/* Upper bound of amt_max_tunnels_per_src(), the per-address tunnel cap */
#define AMT_MAX_TUNNELS_PER_SRC 16

Meanwhile, amt_same_source() now compares only the /64 for IPv6:

drivers/net/amt.c:amt_same_source() {
	if (amt_v6(amt))
		return !memcmp(&a->ip6, &b->ip6, AMT_SRC_PREFIX6_LEN);
	return a->ip4 == b->ip4;
}

"amt: key relay tunnels on a union amt_addr endpoint" changed the
kernel-doc of amt_max_tunnels_per_src() to say "one source (an IPv4
address or an IPv6 /64)". It left this header comment as it was, and no
later patch in the series touches it.

Could it be updated to match what test_source_cap() checks?

[ ... ]

> +disc_answer()
> +{
> +	local dst=$1 filter=$2 pid i rc
> +	local to="UDP6-SENDTO:[$dst]:2268,sourceport=40000"
> +
> +	ip netns exec "$GATEWAY" timeout 6 \
> +		tcpdump -nni gw_relay -c 1 "$filter" > /dev/null 2>&1 &
> +	pid=$!
> +	sleep 1
> +	# tcpdump stays up until it matches or times out, so it is gone here
> +	# only if it failed to start.
> +	kill -0 "$pid" 2> /dev/null || { wait "$pid"; return 2; }

[Severity: Low]
Is a fixed sleep 1 followed by kill -0 enough to know that the capture is
ready? A running tcpdump process doesn't mean the packet socket is open
and the filter attached. Its "listening on" line also goes to /dev/null,
so the script can't wait for it.

test_mcast_discovery() runs the unicast control and the ff02::1 check in
two separate tcpdump instances:

	disc_answer ff02::1 "udp and src port 2268 and dst port 40000"
	[ $? -eq 1 ]

So the control says nothing about whether the second capture was ready. A
capture that attached too late also times out with 124, and disc_answer()
then returns 1, which this check accepts.

On a slow or heavily loaded machine (debug or KASAN builds), could the
test pass even if the relay answered the ff02::1 Discovery? That would
contradict the commit message's "so a broken capture cannot pass it".

The same race could also make the unicast control fail when nothing is
wrong.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127094703.3025517-1-omar%40blockcast.net
