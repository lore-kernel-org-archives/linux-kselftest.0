Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBFE4825C1;
	Thu, 10 Sep 2026 12:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043234; cv=none; b=VIOkgXLeYP3EYW18A5R4mAy1zKAvQnRTMyMoCPKrNdMS8fgNZinfHVCvx4GQPWxS8VroL+a8rYNaSHkQ2wD+uI0ikQxJsPPSnHz99nLFpCDssmweA4n/n0bPyJXplssKd2V8wPPNeCmLxLCH8rjlywssS6jD8GKfkmNmW29KLCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043234; c=relaxed/simple;
	bh=nVsUGoOM1a5mvvvQIBYPbretmRmtpUYThx3YTrQx5PM=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TPusUNDJe1K4MfJAQEylpEJG5oRvvVamSYLD/Xqnw1XvcEz+7bPm+O9UyHEl4+4IH9btawBCBy4sAcLpikgmyVkj/XxbBX/qP4tYGVVUPN6eXymzCJTqFGgsu8s7q2RdOW4FamYQGnvnveKHuF3AKJqlUkTKlPr/YTrw/fJLshY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GLodpiOV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GLodpiOV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0D21F000FF;
	Thu, 10 Sep 2026 12:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789043232;
	bh=jlu4+CYpYNhoO3sD4DB7L4wk73GC/0bX4wxiBar4op8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GLodpiOVpCRE0H1C1/raXex8GmeAE6xuaDISYnW0SxxeGoToHKVPasplf8uBgBq4T
	 y7wzEqtx5QGY/35yDgG6wV2tFWFOAG5NRvghq4hdAFaAvTjBBQwGZW8R0+97EXvjTz
	 u5liyih+29KaYlPyKwoTmsTGyuPcXz7K/x3V3hFB83j1gj0KaTd9JwRX0FVMgsCIdH
	 amVxSY6bpQUofLbn6cScozj/4+HVYEXG3B7mMQqN6KiVPHxmmbE8iWXzOOX9La06LH
	 5siDtyUdytrAoR8B1LHm9+FOFeLlx6CP6ge1DLRCKvrE2XWH/etpAWsbR6AQH8WS6o
	 vRIk4DHiw5JqA==
Subject: Re: [PATCH net-next v4 1/2] selftests/net/openvswitch: add SCTP flow
 key test over IPv6
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, dev@openvswitch.org,
 linux-kselftest@vger.kernel.org
Date: Thu, 10 Sep 2026 12:27:11 +0000
Message-ID: <178904323159.219967.4281963773797281538@kernel.org>
In-Reply-To: <20260909122521.2687193-2-houminxi@gmail.com>
References: <20260909122521.2687193-2-houminxi@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 1

- [Low] test_sctp_connect_v6() gates itself on `[ -e /proc/sys/net/ipv6
  ]` (line 717) and on socat's `WITH_SCTP` define (line 716) only, and…

--

selftests/net/openvswitch: add SCTP flow key test over IPv6

Adds test_sctp_connect_v6 to the openvswitch selftest, mirroring the
existing IPv4 SCTP test: icmpv6() flows forward neighbour discovery,
ipv6(proto=132),sctp() flows gate an SCTP association over IPv6, a keyless
ipv6(proto=132) install is expected to be refused with EINVAL, and a payload
is pushed across the datapath.

> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> index a31f7fb6882d..1160f8ed7d8a 100755
> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh

[ ... ]

> @@ -700,6 +701,113 @@ test_sctp_connect_v4() {
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
> +	[ -e /proc/sys/net/ipv6 ] || return "$ksft_skip"
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

[Severity: Low]
Two questions about the skip/setup handling in test_sctp_connect_v6().

First, the capability probe only greps socat -V for "define WITH_SCTP", while
this test uses the SCTP6-LISTEN and SCTP6-CONNECT addresses, which also need
socat's IPv6 support (WITH_IP6). On a socat built with SCTP but without IPv6,
the probe passes, the listener never comes up, and:

	ovs_wait sctp_eps_has server 4443 || return 1

times out and reports FAIL for the SCTP flow-key path rather than skipping for
a missing userspace prerequisite. Would it make sense to also grep for the
IPv6 define here?

Second, the four addressing commands above discard their exit status. The rest
of the test does not depend on addressing until the association attempt, so if
"ip addr add fd00::1/64 ... nodad" fails (for example an iproute2 that rejects
nodad, or IPv6 disabled per-device in the fresh netns via
net.core.devconf_inherit_init_net), the first visible error is:

	ovs_sbx "$t" ip netns exec client \
	    timeout 3 socat -u STDIN "SCTP6-CONNECT:[fd00::2]:4443" </dev/null \
	    || return 1

which attributes a setup failure to the SCTP flow-key path. The file-level
"trap ovs_exit_sig EXIT TERM INT ERR" does not catch these, since set -e/set -E
are not in use and run_test() runs the body in a subshell via
"eval test_${tname}". Should these four commands carry "|| return 1" so the
failure is reported where it happens? The pre-existing test_icmpv6() and
test_sctp_connect_v4() use the same unchecked pattern, so this is the current
convention in the file rather than something new here.

> +
> +	# NS/NA forwarding

[ ... ]

> +	ovs_netns_spawn_daemon "$t" "server" \
> +	    socat -u -t 1 SCTP6-LISTEN:4443,fork \
> +	    OPEN:"$rxfile",creat,append
> +	ovs_wait sctp_eps_has server 4443 || return 1

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909122521.2687193-1-houminxi%40gmail.com
