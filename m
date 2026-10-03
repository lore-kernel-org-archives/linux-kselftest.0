Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B991F344D91;
	Sat,  3 Oct 2026 21:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791064166; cv=none; b=NXnExRXtqjBTFZlIgt9JX+0pKXrmB4Lm5g9180pdynDtsHtZnBP5GLbqBLIT07gO1KpOW3X+5jGejJwZQ94kfTYgjjCb0xAEC4fWkEJRwJin5l+wu9BTLPC5Oj0ws8L8D8unptTeLOH9BDtDEI2sNTlWMflHl0uxa7+Jy4lH8D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791064166; c=relaxed/simple;
	bh=BKH8PX+y0pOC8w745CjUjPgBs1Jy2AaZfFoYvJ5kAEU=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=toz8nsFjU3xZCMX2PCaxffQ41njAbck6fvJ2HijwFcXfyoZoMLAXGO3yRpSoHfvtVBQl2ESWkat3DP/D+EkfyYWgBv5oRoTyXSHnsmenIbTvehYEEOYP/7JiiOvmwz0icMbpKujDtZ4M28IKy6wVjQFV3Z9tsHBAZJe/Zrl8cC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVvsC/Pz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVvsC/Pz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC0D1F0089C;
	Sat,  3 Oct 2026 21:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791064164;
	bh=RDy2m2oxu3R65RPvJv/J5OvLzymzXKgX6whOWb+nG6g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LVvsC/PzV6EsPd09TdlrQ6w7qiTTDCF1TZi3UNnpg8lYiK45UOiOA4HmMQEZOMuXU
	 /WNG7q5LWFs+lf53b3G2lWfQH5vElYsih7gIFTFKUN9Nsswe1ECnln3n7d9f9uf9fb
	 y5cNnxyJJRUlCBhetweUHGVry66B5oM/xtZmHPm8bAvV7DFOFGtxBWPn7II6f3elcF
	 Z8JIcYpyP2SsuW5NExSz/BMxkxveVsqBtAMmqsUSSyyraklfJg0A9TtI7JmzMbRM8V
	 pQI6tveLjatcMkTgURXem176Dq9OufEr7jZOBY9Dyx/J/XmszINt6fEob3rfZFxt2x
	 lTBODqgy599Vg==
Subject: Re: [PATCH net-next v2 2/2] selftests: net: add an amt test for
 UDP_SEGMENT through the relay
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sat, 03 Oct 2026 21:49:23 +0000
Message-ID: <179106416321.434549.5874142465613964174@kernel.org>
In-Reply-To: <20261002212458.34247-3-omar@blockcast.net>
References: <20261002212458.34247-3-omar@blockcast.net>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] If a capture fails, its checks pass anyway.
- [Low] The commit message says the test checks that "the relay's egress
  device and the gateway report no drops or checksum errors".
- [Low] wait_tunnel() (amt_gso.sh:126-142) counts the tunnel as up only
  when a relayed, non-GSO probe reaches the listener.
- [Low] The READY handshakes are not enforced.
- [Low] do_send() computes `total = c->cnt * c->seg + c->tail`
  (amt_gso.c:138) in unsigned int and only checks `total > MAX_DGRAM`…

--

selftests: net: add an amt test for UDP_SEGMENT through the relay

This adds amt_gso.sh and its C helper amt_gso. The test sends a
UDP_SEGMENT burst from the relay namespace through an amt relay and
gateway to a listener, with tx offload on the amtr device off and on.

It checks delivery on the listener and uses AF_PACKET captures to check
frame sizes, both those handed to amt_dev_xmit() and those put on the
wire. CONFIG_PACKET is added to the net selftests config.

> diff --git a/tools/testing/selftests/net/amt_gso.c b/tools/testing/selftests/net/amt_gso.c
> new file mode 100644
> index 0000000000000..eebf3ecb94979
> --- /dev/null
> +++ b/tools/testing/selftests/net/amt_gso.c
> @@ -0,0 +1,457 @@

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
> +	if (total > MAX_DGRAM ||
> +	    (c->tail && c->tail < sizeof(struct chunk_hdr)) ||
> +	    c->seg < sizeof(struct chunk_hdr))
> +		error(2, 0, "bad sizes");

[Severity: Low]
Can this multiplication wrap before the total > MAX_DGRAM check runs?
cnt, seg, tail and num all come from atoi() with no range checks. For
example, -s 65536 -c 65536 gives a total equal to tail, and -s 1200
-c 3579140 gives 704.

fill_dgram() ignores total and writes cnt chunks of seg bytes into the
static buffer:

	for (i = 0; i < n; i++) {
		unsigned int len = chunk_len(c, i);
		...
		buf += len;
	}

Would that overflow buf[MAX_DGRAM] in do_send()? Also, chunk_hdr.len is
a uint16_t, so any seg above 65535 is silently truncated.

do_recv() has the same pattern:

	unsigned int per = chunks_per_dgram(c), expected = c->num * per;
	...
	seen = calloc(expected ? expected : 1, 1);
	...
	if (seen[h.seq * per + h.idx]++) {

If c->num * per wraps, can seen[] end up too small? The index is only
bounded by h.seq < c->num and h.idx < per, not by the allocation size.

amt_gso.sh only passes small fixed values, so this only applies when the
helper is run by hand with large arguments.

[ ... ]

> diff --git a/tools/testing/selftests/net/amt_gso.sh b/tools/testing/selftests/net/amt_gso.sh
> new file mode 100755
> index 0000000000000..3c37cb59d9b02
> --- /dev/null
> +++ b/tools/testing/selftests/net/amt_gso.sh
> @@ -0,0 +1,269 @@

[ ... ]

> +# Send one single-datagram probe every second until the listener sees it,
> +# which means that discovery, request and update are done for this group.
> +wait_tunnel()
> +{
> +	local fam=$1 v6="" grp=$GRP4 src=$SRC4 port=4999 i
> +
> +	[ "$fam" = 6 ] && { v6=-6; grp=$GRP6; src=$SRC6; port=6999; }
> +
> +	for i in $(seq 40); do
> +		ip netns exec "$LISTENER" $AMT_GSO recv $v6 -p $port \
> +			"${PROBE_OPTS[@]}" -T 1 >"$TMPD/probe.out" &
> +		local pid=$!
> +		busywait 5000 grep -q READY "$TMPD/probe.out"

[Severity: Low]
Can this grep match a stale READY? probe.out is never removed, either
between iterations or between the IPv4 and IPv6 calls. The truncating
open for the redirection happens in the background child after fork.

If the parent's grep runs before the new child has truncated the file
and bound its socket, the probe goes to nobody. recv then waits out its
1 second idle timeout, exits 1, and the iteration is wasted.

The busywait return value is also ignored here and in run_burst():

	for f in recv amtr gw; do
		busywait 5000 grep -q READY "$TMPD/$f.out"
	done

If one of the helpers is not ready within 5 seconds, the burst is sent
anyway. Could that cause a spurious listener failure? Could a sniffer
also get SIGTERM before its handler is installed and exit without a
report?

> +		ip netns exec "$RELAY" $AMT_GSO send $v6 -I amtr -g $grp \
> +			-b $src -p $port "${PROBE_OPTS[@]}"
> +		wait $pid && return 0
> +	done
> +	return 1
> +}

[ ... ]

> +	wait $pid_r
> +	RECV_RC=$?
> +	# The receiver is done, so every frame the captures will see is already
> +	# queued on their sockets. Ask them to drain it and report.
> +	kill -TERM $pid_a $pid_g
> +	wait $pid_a $pid_g

[Severity: Medium]
What happens here if one of the sniffers has already died? The exit
status is discarded. With two PIDs, wait only returns the status of the
last one anyway.

do_sniff() exits through error(2, ...) when recvfrom() fails or poll()
fails with something other than EINTR. It also dies with no output if
SIGTERM arrives before this line runs:

	signal(SIGTERM, sniff_sig);

In that case field() turns the missing key into 0:

	echo "${val:-0}"

so big and lost both read as 0 for the amtr capture.

In the control and plain datagram cases, would check_err $((big != 0))
and the lost check then pass with no capture behind them? In the tx-on
UDP_SEGMENT cases, the result becomes a skip ("no GSO skb reached
amt_dev_xmit()") rather than an error.

A failed gw capture is still caught indirectly by gwn != EXPECT. A
failed amtr capture does not seem to be caught at all.

> +
> +	DROPS=$(($(dev_stat "$RELAY" relay_gw tx_dropped) - DROP0))
> +	TXP=$(($(dev_stat "$RELAY" relay_gw tx_packets) - TXP0))
> +	CSUMERR=$(($(csum_errors) - CSUM0))
> +	GRX=$(($(dev_stat "$GATEWAY" amtg rx_packets) - GRX0))
> +	LRX=$(($(dev_stat "$LISTENER" l_gw rx_packets) - LRX0))
> +	GRXD=$(($(dev_stat "$GATEWAY" amtg rx_dropped) - GRXD0))
> +	EXPECT=$((NUM * (cnt + (tail ? 1 : 0))))
> +}

[ ... ]

> +	stats="relay_gw tx +$TXP drop +$DROPS; gw csum_err +$CSUMERR"
> +	stats="$stats; amtg rx +$GRX drop +$GRXD; listener rx +$LRX"
> +	log_info "$name: $stats"
> +
> +	check_err $(($(field "$TMPD/amtr.out" lost) + \
> +		     $(field "$TMPD/gw.out" lost) != 0)) \
> +		"a packet capture lost frames, the verdict is unreliable"
> +	check_err $RECV_RC "listener did not get every datagram intact"
> +	check_err $((DROPS != 0)) "relay_gw dropped $DROPS packets"
> +	check_err $((CSUMERR != 0)) "gateway counted $CSUMERR csum errors"

[Severity: Low]
The commit message says the test checks:

  "that the relay's egress device and the gateway report no drops or
  checksum errors."

GRXD is sampled in run_burst() but only printed in the log_info line
above. No check_err uses it, so a nonzero rx_dropped on amtg never
fails a case.

Some of those drops have nothing to do with the tested data. For
example, amt_membership_query_handler() in drivers/net/amt.c does this
on a failed query delivery:

	amt->dev->stats.rx_dropped++;

so a case can pass with GRXD > 0. TXP, GRX and LRX are also computed
but only logged.

Should GRXD be passed to check_err, or should the commit message be
reworded to match what is actually checked?

The commit message also only describes the UDP_SEGMENT cases with tx
offload off and on. It does not mention the two "plain datagrams, amt
tx offload on" cases.

[ ... ]

> +setup_topology
> +
> +wait_tunnel 4 || skip_all "IPv4 AMT tunnel did not come up"
> +wait_tunnel 6 || skip_all "IPv6 AMT tunnel did not come up"

[Severity: Low]
wait_tunnel() only succeeds when a relayed probe reaches the listener.
That probe goes through amt_send_multicast_data(). The preceding commit
"amt: mark relay data as a UDP tunnel packet before sending it" makes
that function run this on every relayed packet:

	if (udp_tunnel_handle_offloads(skb, true)) {
		kfree_skb(skb);
		return;
	}

If relay data forwarding breaks completely, every probe is lost and
the whole test exits with KSFT_SKIP. Should that be reported as a
failure instead, given that this is the data path the test is meant to
cover?

The existing amt.sh would still report FAIL for its IPv4/IPv6 multicast
forwarding cases, so the gap is limited to this test's own verdict.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261002212458.34247-1-omar%40blockcast.net
