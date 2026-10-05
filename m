Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2D54EFFB5;
	Mon,  5 Oct 2026 17:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221595; cv=none; b=rqmp5iASXi7rr1TzoOSwQexJ5ToUmNVQW7GFYbY2j/DmkZ4RB9bMUUj3JikTMpksnLzmHJb5/KJ7L4Ig8h95ZIiYHuw44E/aPqcVk49iKpCg2lWVXJsqewxppMpOYEn8Z2R2q8J44Z/lSEzc2lgJ66crmBRnoHBqo9rkJ8icRwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221595; c=relaxed/simple;
	bh=WWRrTogpoCm9jcwHZNNwWwDrAKXxnnRHkFLS0o3aEG8=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mu7KpJimaP7+RROcbW1mt74YR2KvhhgfNZYl83XPtnYRY/GnNV6YM7oG5PYhIuJNC3eLcVutkyS+8oQweOOIx8K7Mad1991vdc82blmf6gDztrAfzJ3aX07LLllfgfO4NadkieSn4ozUZUUb8vE5sRRdu5MSB3XwYxqFUoNtJ2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODcD1z/s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODcD1z/s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C50A1F000FF;
	Mon,  5 Oct 2026 17:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791221593;
	bh=X7sX2iazjw1D9MpNTPb5B5lFjvgNuPzBLZ4h+HtIiWk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ODcD1z/sucEbNUZWxF85evJ2a2CN1Hxbb5R5ZIqm+epeonNw1Ey/a5Gdov/fs8Inf
	 bnf7vGrCFVSF5l/57DX8RRV7/qD+W5ydTBo+f7kxhTSvt/OCtCZ6cpiDHpSwHp1ij4
	 +Jq+QImJBUNmnWvCJ2EcueiG5dEoQhIyMR5f0heA2ymwsuu6opksz6smYwDYkqgQ+M
	 TDq+ropT03SVv/Kz0xzU1J6ziHI6cV9BpzNbpfbAQMV0m0/ApN8jGUaFWcorFcT2Q8
	 8zeg1Iv7ShdlDkqJ1/s8T5pjzCMvvKpBz8UdHMXWis3tHgl+20pomieui8VBMDyu/Z
	 QFi9FSC7np/Cw==
Subject: Re: [PATCH net-next 2/2] selftests: net: add an amt test for
 UDP_SEGMENT through the relay
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 05 Oct 2026 17:33:12 +0000
Message-ID: <179122159202.434549.13854846307232722099@kernel.org>
In-Reply-To: <20261001171016.88208-3-omar@blockcast.net>
References: <20261001171016.88208-3-omar@blockcast.net>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In amt_gso.sh, a capture helper that fails is not noticed.
- [Medium] The READY handshake in amt_gso.sh does not actually make the
  sender wait for the listeners.
- [Low] The new test depends on AF_PACKET, but CONFIG_PACKET is not in
  the net selftests config fragment.
- [Low] If the AMT tunnel never comes up, the script reports SKIP and
  exits, so a regression in AMT discovery/request/update becomes a skip…
- [Low] In do_send() (amt_gso.c:148), `total = c->cnt * c->seg + c->tail`
  is computed in unsigned int and only then compared with MAX_DGRAM.
- [Low] wait_tunnel() (amt_gso.sh:124-130) reuses $TMPD/probe.out on
  every iteration and for both families, and never clears it in the…

--

selftests: net: add an amt test for UDP_SEGMENT through the relay

This adds amt_gso.sh and a C helper, amt_gso. The test sends a
UDP_SEGMENT burst from a sender on the AMT relay to a listener behind the
gateway, over IPv4 and IPv6. It checks payloads and drop and checksum
counters, and uses AF_PACKET captures on amtr and gw_relay to check frame
sizes and AMT message counts.

> diff --git a/tools/testing/selftests/net/amt_gso.c b/tools/testing/selftests/net/amt_gso.c
> new file mode 100644
> index 0000000000000..96c002e585914
> --- /dev/null
> +++ b/tools/testing/selftests/net/amt_gso.c
> @@ -0,0 +1,473 @@

[ ... ]

> +static int do_send(const struct cfg *c)
> +{
> +	static uint8_t buf[MAX_DGRAM];
> +	struct sockaddr_storage dst, src;
> +	socklen_t dlen, slen;
> +	unsigned int total, ifindex, i;
> +	int fd, ttl = 8, zero = 0;
> +
> +	total = c->cnt * c->seg + c->tail;
> +	if (total > MAX_DGRAM || (c->tail && c->tail < sizeof(struct chunk_hdr)) ||
> +	    c->seg < sizeof(struct chunk_hdr)) {
> +		fprintf(stderr, "amt_gso: bad sizes\n");
> +		return 2;
> +	}

[Severity: Low]
This isn't a bug for the values amt_gso.sh passes, but can this product
wrap before it is compared with MAX_DGRAM?

total is an unsigned int, so arguments such as -c 65536 -s 65536 give a
small total that passes the check. fill_dgram() then writes the full
cnt * seg + tail bytes into the 65507-byte static buf[].

do_recv() follows the same pattern:

	unsigned int per = chunks_per_dgram(c), expected = c->num * per;
	...
	seen = calloc(expected ? expected : 1, 1);
	...
	if (seen[h.seq * per + h.idx]++) {

If expected wraps, seen[] is allocated too small and this index can write
past it.

This needs large values passed by hand. amt_gso.sh only uses small fixed
sizes.

[ ... ]

> +static int do_sniff(const struct cfg *c)
> +{
> +	static uint8_t buf[MAX_DGRAM + 256];
> +	unsigned int n = 0, max_len = 0, over = 0, amt = 0;
> +	struct sockaddr_ll sll = { .sll_family = AF_PACKET };
> +	struct timespec t0, last, now;
> +	struct tpacket_stats st = { 0 };
> +	socklen_t stlen = sizeof(st);
> +	int fd, rcvbuf = 32 << 20;
> +
> +	fd = socket(AF_PACKET, SOCK_DGRAM, htons(ETH_P_ALL));
> +	if (fd < 0)
> +		die("socket(AF_PACKET)");

[Severity: Low]
Should CONFIG_PACKET be added to tools/testing/selftests/net/config?

Both captures in run_burst() need an AF_PACKET socket here, and every
run_case() verdict depends on them. The config fragment lists
CONFIG_AMT=m, CONFIG_BRIDGE=y and CONFIG_VETH=y, but not CONFIG_PACKET.

On a kernel built from that fragment without CONFIG_PACKET, both sniffers
exit through die() before printing READY. The script then ends up in the
empty field() handling in run_case() described below, and does not skip
cleanly.

[ ... ]

> diff --git a/tools/testing/selftests/net/amt_gso.sh b/tools/testing/selftests/net/amt_gso.sh
> new file mode 100755
> index 0000000000000..8b32f17b6f6b3
> --- /dev/null
> +++ b/tools/testing/selftests/net/amt_gso.sh
> @@ -0,0 +1,269 @@

[ ... ]

> +wait_tunnel()
> +{
> +	local fam=$1 v6="" grp=$GRP4 src=$SRC4 port=4999 i
> +
> +	[ "$fam" = 6 ] && { v6=-6; grp=$GRP6; src=$SRC6; port=6999; }
> +
> +	for i in $(seq 40); do
> +		ip netns exec "$LISTENER" $AMT_GSO recv $v6 -p $port \
> +			$PROBE_OPTS -T 1 >"$TMPD/probe.out" &
> +		local pid=$!
> +		busywait 5000 grep -q READY "$TMPD/probe.out"

[Severity: Low]
Can this grep match a READY line left in probe.out by an earlier receiver?

probe.out is reused on every iteration and for both families. The
truncating redirection happens in the background child. If the parent's
grep runs before the child has opened the file, it sees the READY from an
earlier failed attempt, or from the IPv4 run when wait_tunnel 6 starts.

The probe is then sent before the new receiver has bound its socket. The
probe is lost and the loop retries. In the worst case, repeated losses end
in the "tunnel did not come up" skip.

run_burst() avoids this by running rm -f before it starts its helpers.
Could the same be done here?

> +		ip netns exec "$RELAY" $AMT_GSO send $v6 -I amtr -g $grp \
> +			-b $src -p $port $PROBE_OPTS >/dev/null

[ ... ]

> +	rm -f "$TMPD"/{recv,amtr,gw,send}.out
> +
> +	ip netns exec "$LISTENER" $AMT_GSO recv $v6 -p $port $opts -T 3 -S 15 \
> +		>"$TMPD/recv.out" &
> +	pid_r=$!
> +	ip netns exec "$RELAY" $AMT_GSO sniff -I amtr -p $port -M "$AMTR_MTU" \
> +		-o -T 20 >"$TMPD/amtr.out" &
> +	pid_a=$!
> +	ip netns exec "$GATEWAY" $AMT_GSO sniff -I gw_relay -p $PORT_AMT \
> +		-M 1500 -i -a $v6 -T 20 >"$TMPD/gw.out" &
> +	pid_g=$!
> +	for f in recv amtr gw; do
> +		busywait 5000 grep -q READY "$TMPD/$f.out"
> +	done

[Severity: Medium]
What happens when one of these busywait calls times out?

busywait() in lib.sh returns 1 after the timeout. That result is ignored
here and in wait_tunnel(), so the counters are sampled and the sender
starts anyway.

If a capture has not bound its AF_PACKET socket yet, frames can cross
amtr or gw_relay without being seen. That would give a spurious
gwn != EXPECT failure. It could also leave big at 0, which turns a tx on
GSO case into a skip.

The commit message says slow helper startup on a loaded guest caused the
earlier flakiness.

There is a related ordering question later in run_burst():

	kill -TERM $pid_a $pid_g
	wait $pid_a $pid_g

do_sniff() installs its handler just before printing READY:

	signal(SIGTERM, sniff_sig);
	printf("READY\n");

A sniffer that is still starting up is killed by the default action and
prints no SNIFF line. run_case() then works with empty fields, as
described below. Since wait discards the exit status, a helper that never
started is not reported either.

[ ... ]

> +	run_burst "$fam" "$gso"
> +	big=$(field "$TMPD/amtr.out" over_mtu)
> +
> +	gwn=$(field "$TMPD/gw.out" amt_data)

[ ... ]

> +	check_err $(($(field "$TMPD/amtr.out" lost) + \
> +		     $(field "$TMPD/gw.out" lost) != 0)) \
> +		"a packet capture lost frames, the verdict is unreliable"
> +	check_err $RECV_RC "listener did not get every datagram intact"
> +	check_err $((DROPS != 0)) "relay_gw dropped $DROPS packets"
> +	check_err $((CSUMERR != 0)) "gateway counted $CSUMERR csum errors"
> +	check_err $((gwn != EXPECT)) \
> +		"gateway saw $gwn AMT data messages, expected $EXPECT"
> +	check_err $(($(field "$TMPD/gw.out" over_mtu) != 0)) \
> +		"frames larger than the MTU were put on the wire"
> +
> +	if [ "$tx" = on ] && [ "$gso" = 1 ]; then
> +		# Without this the case proves nothing about the driver.
> +		if [ "$big" = 0 ] && [ $RET -eq 0 ]; then
> +			RET=$ksft_skip
> +			retmsg="no GSO skb reached amt_dev_xmit()"
> +		fi
> +	else
> +		check_err $((big != 0)) \
> +			"a frame larger than the MTU reached amt_dev_xmit()"
> +	fi
> +
> +	log_test "$name"
> +}

[Severity: Medium]
How are these checks meant to behave when a sniffer exited without
printing its SNIFF line?

do_sniff() prints SNIFF only at the very end. Every die() path leaves the
output file empty: socket(AF_PACKET), if_nametoindex, bind, poll and
recvfrom. So does a SIGTERM that arrives before the handler is installed.

run_burst() ignores both the busywait results and the exit status from
wait $pid_a $pid_g. In that case field() returns an empty string.

If gw.out has no SNIFF line, the first check_err expands to something
like:

	$((0 +  != 0))

That is a bash arithmetic syntax error. The over_mtu check on gw.out has
the same problem.

Bash then discards the whole top-level run_case command. log_test is never
reached, no TEST line is printed, and EXIT_STATUS is not updated.

With CONFIG_PACKET=n, both sniffers die in socket(AF_PACKET) and all six
cases are dropped this way. wait_tunnel() still succeeds because it does
not use the sniffer, so the script exits with 0.

If only amtr.out has no SNIFF line, the first expression is still valid
and gives 0, but big is empty. In the tx on GSO cases, this test is then
false:

	if [ "$big" = 0 ] && [ $RET -eq 0 ]; then

So the "no GSO skb reached amt_dev_xmit()" skip is never taken, and the
case can pass without showing that a GSO skb reached the driver.

In the other cases, $((big != 0)) treats the empty variable as 0 and
passes with no data behind it.

Would it make sense for run_burst() to check the busywait results and the
sniffers' exit status, and for run_case() to fail when a SNIFF line is
missing?

[ ... ]

> +setup_topology
> +
> +wait_tunnel 4 || { log_test_skip "IPv4 AMT tunnel did not come up"
> +		   exit $EXIT_STATUS; }
> +wait_tunnel 6 || { log_test_skip "IPv6 AMT tunnel did not come up"
> +		   exit $EXIT_STATUS; }

[Severity: Low]
Should this be reported as a failure rather than a skip?

By this point the script has checked that iproute2 supports amt, and
setup_topology() has created both amt devices. If 40 probes then fail to
reach the listener, no prerequisite is missing. Discovery, request or
update is not working.

As written, an AMT forwarding regression shows up as SKIP and none of the
six cases run. amt.sh reports [FAIL] in the same situation.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261001171016.88208-1-omar%40blockcast.net
