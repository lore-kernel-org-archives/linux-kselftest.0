Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8BA35C1AD;
	Tue, 22 Sep 2026 15:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089512; cv=none; b=AoNprcsG3p1E+z+RNyw2Gebw6djhapyeUJzeZJx0v8NPzAoxHnMofCMIunRq0RpEm2MTxTP0jxv/o0VaIFFPyfq3wRJOVt370byEuXq1cBLQ6K7x4BtyQxg1dI39dADaflfE4ZfZBToppdg6E0oZQetlQjvuGXoSseCY8nGJxgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089512; c=relaxed/simple;
	bh=vZKtwmqX5JGTI1FcPLHLyAMq16Kqkv/lA6S6Anss64s=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CAGqmPG7wk0tklHX3j4ikCGvZuwRBEKcgtJIbUqTom5L/u0ACROmNrSBsXNteCXp9PlNFnKnU98HvRtl0qHaiLMXicfjcHMvcdCNyzMAB+3xbdCtgWcqu2pPpMMuZSVyL43oF5X65RzMq5mkFtySuXamIZlCQe8fiESwiXoyVYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hekZjgEx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hekZjgEx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD801F000FF;
	Tue, 22 Sep 2026 15:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790089510;
	bh=TCzshrRO1ZIki5NMcVenkUxrTYuUZop6YN9zEA0sSn4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hekZjgExvPV6O2kgjyujuDe+5YcV3f+peRPg5Ds0j9XiT4C9gGds0zOyk+eI8hiNq
	 ailXnWizcynDcgRol4HLhxm3yBnh3baNQMAx8nxlhrnHD+dm0fshC+Z5J7aUvgnPSb
	 /WqczJueR+BPgopDZUTVtSV9QYxVHXNKj+kWTC40LKY237/CA9qgsUib3vKOEpDlwt
	 phwnob+fqNmOgs6c2F+SM338bq3R7jvcqvuJ9dS4Dgt/VJzf9fzBEsuYAIvg+0zL8t
	 xSIL3GICXFsv81omdFlbhOlB/9ayH00HhCkuBQn4KMDO7u9yft9PMqC+Pk+teRcjlL
	 P63ypAcDM39iA==
Subject: Re: [PATCH net-next v5 1/2] selftests/net/openvswitch: add SCTP flow
 key test over IPv6
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, dev@openvswitch.org,
 linux-kselftest@vger.kernel.org
Date: Tue, 22 Sep 2026 15:05:09 +0000
Message-ID: <179008950943.2160803.15856491533624064435@kernel.org>
In-Reply-To: <20260918144647.2024095-2-houminxi@gmail.com>
References: <20260918144647.2024095-2-houminxi@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The promised skip when IPv6 is unavailable is incomplete in
  test_sctp_connect_v6().

--

selftests/net/openvswitch: add SCTP flow key test over IPv6

This adds test_sctp_connect_v6 to the openvswitch selftest, mirroring the
existing IPv4 SCTP test: icmpv6() flows forward neighbour discovery while
ipv6(proto=132),sctp(dst=4443)/sctp(src=4443) flows gate an SCTP
association across the datapath, with a keyless ipv6(proto=132) install
expected to be refused with EINVAL.

> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> index a31f7fb6882d..aa84fafc3201 100755
> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh

[ ... ]

> @@ -700,6 +701,114 @@ test_sctp_connect_v4() {
>  	return 0
>  }
>  
> +# sctp_connect_v6 test
> +# - sctp(dst=4443) matches client-to-server INIT
> +# - sctp(src=4443) matches server-to-client INIT-ACK
> +# - icmpv6 NS/NA flows forward neighbour discovery
> +# - remove flows and verify connection fails, reinstall and recover
> +test_sctp_connect_v6() {
> +	local t="test_sctp_connect_v6"
> +	local v6="eth_type(0x86dd),ipv6(proto=132)"
> +	local payload="SCTP6_DATA_OK"
> +	local rxfile="${ovs_base}/${t}/sctp-rx.txt"
> +
> +	modprobe -q sctp 2>/dev/null || return "$ksft_skip"
> +	socat -V 2>&1 | grep -q "define WITH_SCTP" || return "$ksft_skip"
> +	socat -V 2>&1 | grep -q "define WITH_IP6" || return "$ksft_skip"
> +	[ -e /proc/sys/net/ipv6 ] || return "$ksft_skip"

[Severity: Medium]

Is this gate enough to cover the case the changelog describes as "IPv6 is
unavailable"?  /proc/sys/net/ipv6 only tells us inet6_init() ran.  Only
ipv6.disable=1 short-circuits it:

net/ipv6/af_inet6.c:inet6_init() {
	...
	if (disable_ipv6_mod) {
		pr_info("Loaded, but administratively disabled, reboot required to enable\n");
		goto out;
	}
	...
}

With ipv6.disable_ipv6=1 instead, initialization completes and the sysctl
tree exists, so this check passes, but the module default is copied into
every new netns:

net/ipv6/addrconf.c:addrconf_init_net() {
	...
	/* these will be inherited by all namespaces */
	dflt->autoconf = ipv6_defaults.autoconf;
	dflt->disable_ipv6 = ipv6_defaults.disable_ipv6;
	...
}

so the veths created for the client and server namespaces come up with
cnf.disable_ipv6 set, and address assignment is rejected:

net/ipv6/addrconf.c:ipv6_add_addr() {
	...
	if (idev->cnf.disable_ipv6) {
		NL_SET_ERR_MSG_MOD(extack, "IPv6 is disabled on this device");
		err = -EACCES;
		goto out;
	}
	...
}

Would testing something that reflects usability, for example whether an
address can actually be added in a test namespace, match the promised skip
better?

> +
> +	sbx_add "$t" || return $?
> +	ovs_add_dp "$t" sctp6 || return 1
> +
> +	info "create namespaces"
> +	for ns in client server; do
> +		ovs_add_netns_and_veths "$t" "sctp6" "$ns" \
> +		    "${ns:0:1}0" "${ns:0:1}1" || return 1
> +	done
> +
> +	ip netns exec client ip addr add fd00::1/64 dev c1 nodad
> +	ip netns exec client ip link set c1 up
> +	ip netns exec server ip addr add fd00::2/64 dev s1 nodad
> +	ip netns exec server ip link set s1 up

[Severity: Medium]

These four setup commands in test_sctp_connect_v6() discard their exit
status, unlike the surrounding calls which all use "|| return 1".  If the
ip addr add calls fail with EACCES because disable_ipv6 was inherited by
the new namespaces, does the test keep going with no IPv6 addresses
configured and then report a failure at the association check below?

Would checking these with "|| return $ksft_skip" (or at least
"|| return 1" with an info message naming the failed step) make the
outcome match the cause?

[ ... ]

> +	info "verify SCTP association with port-keyed flows"
> +	ovs_sbx "$t" ip netns exec client \
> +	    timeout 3 socat -u STDIN "SCTP6-CONNECT:[fd00::2]:4443" </dev/null \
> +	    || return 1

[Severity: Medium]

This is the point where an unusable IPv6 setup surfaces.  With
ipv6.disable_ipv6=1 the connect cannot succeed, so run_test() reports FAIL,
while the changelog says:

    Skips when the sctp module is missing, socat lacks SCTP or IPv6
    support, or IPv6 is unavailable

Should this configuration end up as a skip rather than a failure, or should
the changelog be narrowed to say the skip only covers IPv6 not being
initialized at all?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260918144647.2024095-1-houminxi%40gmail.com
