Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4414A8FC0;
	Sat, 10 Oct 2026 12:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636100; cv=none; b=hpbUg93vImCY6DiUo4kAauw1F2sobrx/ATRAl2BLUg/BmqEyUJ9gWNKlHaawDFIk8CZZw8IWBUxo/Sbq7EcBQAKKXytSQJlHHrZJwmoOvTHiW21+rcaUINwRmDqVx9H+TYwE5TxVxeOpOIE3qFzb/k5xM+Y9H4QjY1JtfB54TeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636100; c=relaxed/simple;
	bh=DOWLk2KPhGuBqGjqbbjZhS/X5KEgI8YhdKCMda6sp3I=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tuCRCgtMRylp80Tef3Lh47xoWM8ZFPa/WumbJWYbBaKLHzzxI3wLiAd/Ss098W065nplVHXZxuFpCty/FCj3KEWyNTjk5d+NKJJGMmBpcptdLElkaFsl5xJvwTREG4pJNG2Ia392lOrawo9dCZr+WR/wPNt/m6sXYcWw9IREJrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULzQbh4v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULzQbh4v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EBA1F00893;
	Sat, 10 Oct 2026 12:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791636096;
	bh=zeJbWA0x80spfrEHaqYLJB//IGbEAAErNMgbYI6cTIQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ULzQbh4v/YnfTiq0mLmW60Swx3+waIjQXLq1r6YI6oe4tZYnKADiVYrKDLhu+AqeS
	 scY5snJ/dr2FqY4tVtcnP7Yxme0nDESaS9xNSLerlK30HVnde1euGRt7LJHA1PVOlR
	 rsbFgFwKU05djcPO4ciUCGHiUhbDfkbrXy3hGuqgllGbPkv7GzgUdbHFiIGOJ7uH/N
	 xGLu964B+Ve5PTuxM1unHbm2sBPHveBySV9Lqy2zlTnLst2HviHer+szScWVb7Skpl
	 9Itgnr4L1eYl+wy12ejIwjjjX+h4VG75yMBsVzkwcIbrqwUy6nFFh+QvZ26mxEZxtf
	 9jEIgWMKeaEig==
Subject: Re: [PATCH net-next 12/13] selftests: net: add amt_v6.sh for an IPv6
 outer transport
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sat, 10 Oct 2026 12:41:35 +0000
Message-ID: <179163609571.434549.12748049029587713249@kernel.org>
In-Reply-To: <20261009122426.551178-13-omar@blockcast.net>
References: <20261009122426.551178-13-omar@blockcast.net>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] disc_answer() in tools/testing/selftests/net/amt_v6.sh (lines
  269-292) ignores two exit statuses.
- [Low] In tools/testing/selftests/net/amt_v6.sh, the `*"IPv6 support is
  disabled"*` branch in probe_v6_relay() (line 117) can never run.

--

selftests: net: add amt_v6.sh for an IPv6 outer transport

This adds amt_v6.sh, a variant of amt.sh where the gateways and the relay
run AMT over IPv6, with two extra gateways on the outer link. It covers
discovery, IPv4 and IPv6 multicast forwarding, the tunnel limit, tunnel MTU
handling, zero UDP checksum handling, Discovery sent to ff02::1, and link
down/up. It also enables CONFIG_IP_MROUTE in the net selftest config.

> diff --git a/tools/testing/selftests/net/amt_v6.sh b/tools/testing/selftests/net/amt_v6.sh
> new file mode 100755
> index 0000000000000..d2732945a3c7b
> --- /dev/null
> +++ b/tools/testing/selftests/net/amt_v6.sh
> @@ -0,0 +1,535 @@

[ ... ]

> +setup_links()
> +{
> +	local ns
> +
> +	# No DAD: the relay sources its MLD General Query from amtr's
> +	# link-local address, which must not be tentative when it is sent.
> +	for ns in "$LISTENER" "$GATEWAY" "$GATEWAY2" "$GATEWAY3" "$RELAY" \
> +		  "$SOURCE"; do
> +		ip netns exec "$ns" sysctl -wq \
> +			net.ipv6.conf.all.accept_dad=0 \
> +			net.ipv6.conf.default.accept_dad=0
> +	done

[ ... ]

> +probe_v6_relay()
> +{
> +	local err got
> +
> +	if ! err=$(ip -n "$RELAY" link add amtprobe type amt mode relay \
> +		   local "$RELAY6" dev br_gw 2>&1); then
> +		case "$err" in
> +		*"Local attribute is required"*|*"expected rather than"*|\
> +		*"IPv6 address in an IPv4 attribute"*|\
> +		*"IPv6 support is disabled"*)
> +			echo "SKIP: no IPv6 AMT support: $err"
> +			exit "$ksft_skip"
> +			;;

[Severity: Low]

Can the "IPv6 support is disabled" branch ever match?

In drivers/net/amt.c, amt_validate() returns that extack only when
CONFIG_IPV6 is off:

    if (data[IFLA_AMT_LOCAL_IP6] && !IS_ENABLED(CONFIG_IPV6)) {
        NL_SET_ERR_MSG_ATTR(extack, data[IFLA_AMT_LOCAL_IP6],
                            "IPv6 support is disabled");

On a kernel like that, the script never gets to the probe. The main body
runs setup_links() under the ERR trap before probe_v6_relay() runs:

    set -E
    trap 'setup_fail $LINENO' ERR
    setup_links
    trap - ERR
    probe_v6_relay

setup_links() starts with the net.ipv6.conf.*.accept_dad sysctl writes
quoted above, then adds IPv6 addresses. Without IPv6, those commands fail,
and setup_fail() exits with ksft_fail.

The commit message says:

    A probe creates a throwaway IPv6 relay first and skips only when the
    kernel or iproute2 cannot create one

Would a kernel built without CONFIG_IPV6 report FAIL here rather than the
intended SKIP? The net selftest config sets CONFIG_IPV6=y, so this only
affects configurations that don't use it.

[ ... ]

> +disc_answer()
> +{
> +	local dst=$1 filter=$2 opts=${3:-} pid i rc log
> +	local to="UDP6-SENDTO:[$dst]:2268,sourceport=40000"
> +
> +	log=$(mktemp)
> +	ip netns exec "$GATEWAY" timeout 6 \
> +		tcpdump -nni gw_relay -c 1 "$filter" > /dev/null 2> "$log" &
> +	pid=$!
> +	# Send nothing before the capture is live, or a missed packet would
> +	# pass the negative check.
> +	busywait 5000 grep -q "listening on" "$log"
> +	# Type 1 (Relay Discovery), version 0, then a nonce.
> +	for i in 1 2 3; do
> +		printf '\x01\x00\x00\x00\x12\x34\x56\x78' |
> +			ip netns exec "$GATEWAY" socat -u - \
> +			"$to,so-bindtodevice=gw_relay$opts"
> +		sleep 0.5
> +	done
> +	wait "$pid"
> +	rc=$?
> +	rm -f "$log"
> +	return "$rc"
> +}

[Severity: Medium]

Can test_mcast_discovery() pass its negative check when no Discovery was
ever captured or sent?

The exit status of busywait is thrown away, and loopy_wait() in lib.sh
returns 1 on timeout. The status of each socat send is thrown away too.

The function returns only tcpdump's status. That status is non-zero when
no matching packet was seen (124 from timeout 6), and also when tcpdump
itself failed (1).

test_mcast_discovery() then does:

    disc_answer ff02::1 "udp and src port 2268 and dst port 40000"
    check_fail $? "the relay answered a Discovery sent to ff02::1"

So if the capture isn't live within 5 seconds, tcpdump fails to start, or
the send to ff02::1 fails, the check records a pass. This is the case the
comment above the busywait says must not happen.

The unicast positive control runs its own tcpdump and its own send. It
doesn't show that the second capture went live or that the ff02::1 send
worked.

test_zero_relay() calls disc_answer() in the same way, though its
Udp6InCsumErrors check limits the effect there.

Should disc_answer() return a separate failure when the busywait or the
socat sends fail, so the negative checks can tell that apart from no reply?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009122426.551178-1-omar%40blockcast.net
