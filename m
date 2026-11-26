Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720627;
	b=rdURSHX1GuXLyeQSw29T3kHo3eU5nEfYZlGpGtDScbzEazwbMqKoUDGGuHRd25A6/8+2
	 IymuOhTrnjyh1s2syUkTvN9Zr/+Knzor3zImBOinuybQWBmLnVSqyI7CbF/jQF3xGxr+D
	 YqtXYxTg8KQ49McE+s+LlALPPZIhc6HolkXXY9MAWetIMSXAlXsjgwzL3+JLTF9fgIG8Y
	 GgHkIZBTViy35e+uasBFdzyFPZCPKA5r04M64Jx6G2HtSVl75c3E4vBZLJfx4IdasUh/h
	 YGmX2WRnDyfFdEnzqzrlWS7a9eptO44r7FdHPPqFVEkMa/JmKD7fXWkSoFEfFNG+Org==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720627;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=TeBv919u0tdzRATsjRKyQB2JzyijIcDOw/pARemxP80=;
	b=dpALJ/hJIlxeSmmdW43+aw8jnA0MTU6VIk+BtbWqmbteur/4lQ7fbC14ji0w33ZlUpv4
	 ndQt4+ZWwwlWFYNZ6h75mlX8NaN2ReEAdGr13lK0D7ubE80PX8ekaLKP5X4ujdCGa2lig
	 immiZyg51J1w2SWcUS5bIZhF3Xwrb4M1Vr5SReRe6ell7u+/+Plgg1JPajzqDBiJjuUH4
	 f9IHrsyaKd7t3+I4JVo7KUCqYQ4N7YUllG1GqCjAKzu99qMjZ+UhykDdoT9utMFSDOrmS
	 Df+ckUX/tAQ/0GMEtbOpIPxyVXMcLNu6771hRKJ0onxn3xnvEFw6VSwFo4zP9l+myBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H4oVjYa0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6097D606A31E;
	Thu, 26 Nov 2026 19:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H4oVjYa0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C641F000D4;
	Thu, 26 Nov 2026 19:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795720626;
	bh=TeBv919u0tdzRATsjRKyQB2JzyijIcDOw/pARemxP80=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=H4oVjYa0yd00ENrH/AFrETnameCBDXf7RwHVT48HgftH5wKOaY2YRZF8R8C5ThMUI
	 jcqOMw+CN6JXTkUHLDZ+T+B2n1COVN4btv2XxscVZpsr5Dc3lkolMGdrvGPtMimc6K
	 NPcIowyAktvYl/oKk7fIycCb5tksJt1gNnvPkgVXBrWeuzlxDueqQkueHEZTHnzRpb
	 VHzuut/K549ECV4rybQOhaowKgTFgT4AE4vHMpG8Kqk5+lz6aTk0+46rrt8sKiBYpN
	 fRniFDWapuXffZwEkDI7F1QYu2JG38yLs4bwGBAmOThwYX6Po44KzSfPl33tklJYCv
	 VNc7J7gXkAq0Q==
Subject: Re: [PATCH net-next v2 12/12] selftests: net: add amt_gw_v6.sh for
 the IPv6 netlink attributes
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 19:17:05 +0000
Message-ID: <179572062595.3135.5756555149194177847@kernel.org>
In-Reply-To: <20261125191450.2497936-13-omar@blockcast.net>
References: <20261125191450.2497936-13-omar@blockcast.net>
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

- [Medium] In probe_v6_gateway()
  (tools/testing/selftests/net/amt_gw_v6.sh, lines 48-64), the first…
- [Medium] In probe_v6_gateway()
  (tools/testing/selftests/net/amt_gw_v6.sh, lines 66-80), the probe…
- [Low] selftests: net: missing CONFIG_AMT skip handling in
  probe_v6_gateway()

--

selftests: net: add amt_gw_v6.sh for the IPv6 netlink attributes

This adds a netlink-only companion to amt_v6.sh. It checks that the IPv6
local and discovery addresses of AMT gateways and relays read back through
amt_fill_info(), and that each invalid combination is refused with the
expected extack message. A probe at the start skips the test when iproute2
or the kernel lacks IPv6 AMT support.

> diff --git a/tools/testing/selftests/net/amt_gw_v6.sh b/tools/testing/selftests/net/amt_gw_v6.sh
> new file mode 100755
> index 0000000000000..92e48d2f54a5c
> --- /dev/null
> +++ b/tools/testing/selftests/net/amt_gw_v6.sh

[ ... ]

> +probe_v6_gateway()
> +{
> +	local got
> +
> +	if ! add_amt amtprobe mode gateway local "$V6_LOCAL" \
> +	     discovery "$V6_DISC"; then
> +		case "$ADD_ERR" in
> +		*"IPv6 address in an IPv4 attribute"*)
> +			# An older iproute2 on this kernel: the rule that
> +			# refuses the 16-byte IPv4 attribute is what ran.
> +			RET=0
> +			log_test "16-byte IPv4 address attribute is refused"
> +			echo "SKIP: iproute2 lacks IPv6 AMT support"
> +			exit "$ksft_skip"
> +			;;
> +		*"Local attribute is required"*|*"expected rather than"*|\
> +		*"IPv6 support is disabled"*)
> +			echo "SKIP: no IPv6 AMT support: $ADD_ERR"
> +			exit "$ksft_skip"
> +			;;
> +		esac
> +		echo "FAIL: cannot create an IPv6 gateway: $ADD_ERR"
> +		exit "$ksft_fail"
> +	fi

[Severity: Low]
What happens here on a kernel built without CONFIG_AMT, or where the
amt module cannot be loaded?

In that case __rtnl_newlink() in net/core/rtnetlink.c finds no link
ops for "amt" and fails the request with -EOPNOTSUPP and the extack
message "Unknown device type". ADD_ERR then holds "Error: Unknown
device type.", or "RTNETLINK answers: Operation not supported" from
an iproute2 that does not print extack. Neither matches any arm of the
case statement, so probe_v6_gateway() prints "FAIL: cannot create an
IPv6 gateway" and exits with ksft_fail.

An iproute2 with no amt link support at all ends up in the same place.
It cannot parse the mode, local and discovery arguments, so it
typically fails with "Garbage instead of arguments" before anything
is sent to the kernel.

Both are missing prerequisites, not failures of the code under test.
The comment above probe_v6_gateway() says only failures of the code
under test should be reported as FAIL. amt.sh already handles the
iproute2 side by checking ip link help for amt before it starts.

Would it make sense to do the same check here, and to add "Unknown
device type" and "Operation not supported" to the skip arm? The test
would then report SKIP rather than FAIL on such a setup.

[Severity: Medium]
Can the first case arm in probe_v6_gateway() ever match? I could not find
the string "IPv6 address in an IPv4 attribute" anywhere in the kernel
tree. It only shows up here and in probe_v6_relay() in amt_v6.sh.

As far as I can tell, the only thing that refuses a 16-byte
IFLA_AMT_LOCAL_IP or IFLA_AMT_DISCOVERY_IP is the policy in
drivers/net/amt.c:

amt_policy[] {
    ...
	[IFLA_AMT_LOCAL_IP]	= NLA_POLICY_EXACT_LEN(sizeof(__be32)),
    ...
	[IFLA_AMT_DISCOVERY_IP]	= NLA_POLICY_EXACT_LEN(sizeof(__be32)),
    ...
}

validate_nla() checks that policy before amt_validate() or amt_newlink()
runs. When the length is wrong, nla_validate_range_unsigned() in
lib/nlattr.c reports:

		if (binary)
			NL_SET_ERR_MSG_ATTR_POL(extack, nla, pt,
						"binary attribute size out of range");

Take an iproute2 that packs the IPv6 literal into the IPv4 attribute.
Wouldn't ADD_ERR be "Error: binary attribute size out of range." in that
case? That string matches none of the arms, so the script reaches the
"FAIL: cannot create an IPv6 gateway" exit on a correct kernel, not the
intended PASS and SKIP.

The commit message also says:

    this kernel refuses it ("IPv6 address in an IPv4
    attribute").

Does any rule in this series emit that message? The skip list in
probe_v6_relay() in amt_v6.sh has the same pattern, so it would also
report FAIL instead of SKIP with such an iproute2.

> +	got=$(amt_field amtprobe discovery)
> +	ip -n "$GW" link del amtprobe
> +	if [[ "$got" != *:* ]]; then
> +		# A kernel with the IPv6 attributes names the missing
> +		# discovery address this way, and must have refused the
> +		# 16-byte IPv4 attribute that an older iproute2 sent.
> +		add_amt amtprobe mode gateway local "$V4_LOCAL"
> +		ip -n "$GW" link del amtprobe 2>/dev/null
> +		if [[ "$ADD_ERR" == *"of the local family is required"* ]]; then
> +			echo "FAIL: 16-byte IPv4 attribute read back as '$got'"
> +			exit "$ksft_fail"
> +		fi

[Severity: Medium]
Can this FAIL branch be reached through anything other than a userspace
limitation?

If the probe link was created, the exact-length policy on
IFLA_AMT_LOCAL_IP and IFLA_AMT_DISCOVERY_IP means iproute2 sent 4-byte
attributes, not 16-byte ones. A readback without a colon here, or an
empty one from the "// empty" in amt_field(), would come from one of two
sources:

- an iproute2 that truncated 2001:db8:a::1 and 2001:db8:a::2 to
  32.1.13.184. The kernel correctly accepts that as a valid IPv4 unicast
  local and discovery address.
- an iproute2 that prints IFLA_AMT_DISCOVERY_IP6 under a JSON key other
  than discovery.

The follow-up check then creates an IPv4 gateway with no discovery
address. On this kernel, amt_validate() rejects every such gateway with
the same message:

	if (data[IFLA_AMT_LOCAL_IP6] ? !data[IFLA_AMT_DISCOVERY_IP6] :
				       !data[IFLA_AMT_DISCOVERY_IP]) {
		NL_SET_ERR_MSG_MOD(extack,
				   "Discovery attribute of the local family is required");

So doesn't this branch always print "16-byte IPv4 attribute read back"
and exit with ksft_fail, even though the kernel did what it should?

The commit message describes this case as:

    If such
    an iproute2 gets an IPv4 device back from a kernel that has the IPv6
    attributes, recognised by its "Discovery attribute of the local family
    is required" message, the refusal is broken and the probe fails.

The four truncated bytes cannot be told apart from a real IPv4 address.
Is there a kernel refusal that could be broken here, or should this case
be a SKIP?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125191450.2497936-1-omar%40blockcast.net
