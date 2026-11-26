Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720626;
	b=N/9ChCbi3w34zWQDzK8xCUhLPzca2lwwZnZufLJy/OXfujNoBz478pJODX0Cco0G9PuO
	 8siaKgtImufMZs1cyUOXtYRJ2RXoC+IKrAO+3a8n434Le4wyDAykLi1bE2QTHjUK50XFj
	 nT2Iwcw08EcPUg5kZ3ow8i/A63aEys0l9+n74rLKdX1URweR0wQIZPM1/0syeURmD/15x
	 kz350LCY++MSJOLAfK7muvaFaDFq01MSLznxaPQdRUTCspoGWPmveJryrOL/IS5SFBHb8
	 HDNnefSx1hSpqbCc8dl1gxayUcgjF0edz5lUfgKSWfBkJ0feLZ1H3vqTV/CJ24mVLeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720626;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=WDme1QdEj+83k+T3SXxy9P/XoCYbV5jh4bto230OVDk=;
	b=HKjjgi2JIh0Z4xByiJ3B7vrc77oqwpvegseV+bYnKb4EHwxFqtBfj4LkUVNkQ5ha48Qj
	 daQSG/l/Q+Yig6Y24vk+u13ClG09LU0SBjMcFVZ8QvG0YNp4fcKMes2R+WjE1mGixBjIk
	 vZ7kX4inPUsXtnAaBhemQZRz+v+1wMy8iNFH1vnmVZvDkA68b7f+UDNgj2E+5g89YR46s
	 v4wOdEe5mk/igXez2JaxrKRtL7Hp20f0qiQ531w9lJT+xTwj0AEQ30Y6L0lZHrTIc+tLE
	 Qv2YosykOjn/VwJdrpck2w0KzeBpFCzKQ1RwNJmNh6M7uY6kZNWgInqJkmXkZ9qLeVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WlHqVF2y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DBB606A329;
	Thu, 26 Nov 2026 19:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WlHqVF2y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD1E1F00A01;
	Thu, 26 Nov 2026 19:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795720625;
	bh=WDme1QdEj+83k+T3SXxy9P/XoCYbV5jh4bto230OVDk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WlHqVF2yhvtPTr9dSYS6xrAT0F9d/ys7MCvMpQyPvouv++yGgiierKoKer1xnKITR
	 AjiIzsw5UeP5GQ4D70OOSC8atxpU5fKECOQgLkBIfiIF3SWHOie6I//tAWhR3QjG5w
	 Bp+diahQZe/ujbGEshiCFuBEmdER5bvvalRym1UNSxktHKumRmdvazN6v4XulOH5/I
	 rkIIEAcjPesiG0CvzogCDTS28kPbKkxNyG4bpvxdQin7CFXXS1lm1r9N4F7UHIGC6e
	 1v7KdMVM7jy+am4JUCMVPadYOebZKWzzJNMi0/fwhw219Pj8lRh9lubFaO6hx+vKDl
	 6758WpYqnELjw==
Subject: Re: [PATCH net-next v2 11/12] selftests: net: add amt_v6.sh for an
 IPv6 outer transport
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 19:17:04 +0000
Message-ID: <179572062428.3135.4041633001964825666@kernel.org>
In-Reply-To: <20261125191450.2497936-12-omar@blockcast.net>
References: <20261125191450.2497936-12-omar@blockcast.net>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] probe_v6_relay() in tools/testing/selftests/net/amt_v6.sh is
  meant to skip in one case it cannot recognise.
- [Medium] selftests: net: probe_v6_relay() fails instead of skipping
  without CONFIG_AMT
- [Low] The commit message overstates how closely amt_v6.sh mirrors
  amt.sh.

--

selftests: net: add amt_v6.sh for an IPv6 outer transport

This adds amt_v6.sh, a variant of amt.sh in which the AMT gateway and
relay use an IPv6 outer link, with a second gateway on the same link.
It checks discovery through a secondary relay address, IPv4 and IPv6
multicast forwarding, tunnel MTU handling, that a Discovery sent to
ff02::1 gets no answer, and rediscovery after down/up. A probe skips the
test when the kernel or iproute2 lacks IPv6 AMT support.

> amt_v6.sh is amt.sh with the gateway<->relay link moved to IPv6, and a
> second gateway on that link:

[ ... ]

> The namespaces, inner addresses and smcroute (S,G) routes are those of
> amt.sh, and the scripts use the same tools, plus jq.

[Severity: Low]
Is "plus jq" accurate? amt.sh already uses jq in test_remote_ip() and
test_query_egress().

Also, amt_v6.sh does not carry over test_query_egress() from amt.sh.
That test installs clsact and flower egress counters on amtr for IGMP
(ip_proto 2) and MLD query (ICMPv6 type 130) packets, and it fails if a
relay General Query leaves through the amt device. The
send_mcast_torture4 and send_mcast_torture6 runs are not carried over
either.

This series adds the IPv6-outer General Query path:

  amt_send_igmp_gq() / amt_send_mld_gq()
    -> amt_send_membership_query()

Should the egress check be added here as well? If not, could the commit
message say that these checks were dropped, instead of describing the
script as amt.sh with the link moved to IPv6?

> diff --git a/tools/testing/selftests/net/amt_v6.sh b/tools/testing/selftests/net/amt_v6.sh
> new file mode 100755
> index 0000000000000..9d3e4a20676c3
> --- /dev/null
> +++ b/tools/testing/selftests/net/amt_v6.sh
> @@ -0,0 +1,355 @@

[ ... ]

> +# An iproute2 without IPv6 AMT support either rejects the address or packs
> +# it into the 4-byte IFLA_AMT_LOCAL_IP, which this kernel refuses and an
> +# older one takes as an IPv4 address. A kernel without IPv6 AMT support
> +# ignores IFLA_AMT_LOCAL_IP6 and asks for a local address. Skip in those
> +# cases only.
> +probe_v6_relay()
> +{
> +	local err got
> +
> +	if ! err=$(ip -n "$RELAY" link add amtprobe type amt mode relay \
> +		   local "$RELAY6" dev br_gw 2>&1); then
> +		case "$err" in
> +		*"Local attribute is required"*|*"expected rather than"*|\
> +		*"IPv6 address in an IPv4 attribute"*)
> +			echo "SKIP: no IPv6 AMT support: $err"
> +			exit "$ksft_skip"
> +			;;
> +		esac
> +		echo "FAIL: cannot create an IPv6 relay: $err"
> +		exit "$ksft_fail"
> +	fi

[Severity: Medium]
Does this also skip when the amt link type is not available at all?

On a kernel built without CONFIG_AMT, or where the amt module cannot
be loaded, rtnl_link_ops_get() finds no "amt" ops and __rtnl_newlink()
returns -EOPNOTSUPP with the extack "Unknown device type". An iproute2
that does not know the amt link type at all rejects the command line
before anything reaches the kernel.

Neither error text matches any of the three case patterns. In both
cases probe_v6_relay() prints "FAIL: cannot create an IPv6 relay" and
exits with ksft_fail. A kselftest run on a config without AMT would
then report a failure rather than a skip.

amt.sh avoids the iproute2 half of this with its ip link help check
before setup. Should amt_v6.sh do the same? Should it also treat a
missing amt device type as a skip, for example by matching "Unknown
device type" or by checking that the amt module can be loaded first?

[Severity: Medium]
Does this skip in the packed-attribute case described in the comment
above and in the commit message?

If iproute2 packs the 16-byte IPv6 literal into IFLA_AMT_LOCAL_IP, the
kernel refuses it during generic netlink policy validation, before
amt_validate() runs:

drivers/net/amt.c:amt_policy[] {
    ...
	[IFLA_AMT_LOCAL_IP]	= NLA_POLICY_EXACT_LEN(sizeof(__be32)),
    ...
}

NLA_POLICY_EXACT_LEN() is an NLA_BINARY range of 4..4. A 16-byte
attribute therefore fails in nla_validate_range_unsigned(), which
returns -ERANGE with the extack "binary attribute size out of range".

That string matches none of the three patterns. As far as I can tell,
nothing in the tree emits "IPv6 address in an IPv4 attribute"; it only
appears in amt_v6.sh and amt_gw_v6.sh.

In that case, wouldn't the probe print "FAIL: cannot create an IPv6
relay" and exit with ksft_fail instead of ksft_skip?

probe_v6_gateway() in the later patch "selftests: net: add amt_gw_v6.sh
for the IPv6 netlink attributes" repeats the same pattern, so this is
still there at the end of the series.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125191450.2497936-1-omar%40blockcast.net
