Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438DB280018;
	Fri, 24 Jul 2026 12:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784897288; cv=none; b=VoLjmAJ9F6O2RsisJ0E4MJlf5eCRyF2lt2w7KkBYrAnLvbi2DcII1HQQhUmz5zB0aTWqv+h+0RIl4SB3kqVFDTc6wjR6LGmsL33UenP48dbbRJuoUtUCUIhajnbIioqCpMk1H18ePyfz5o8DHkEmQ+sCoi7aSFq510oXZotK2e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784897288; c=relaxed/simple;
	bh=lfDCaVrs3tpIp3Z9gPs1+/7Ad422fKvwo45y5ndhnF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzoVChGBlcdDYEnUTHu7Zq65rSf4oOR+9foyMpzTsaNpttgIxbZgEJGQBusaDPXr1vrut7PaSojg+enZfSOiJW/DmLLgPlm7EIfXk/1NVhezamKmz3aULxCb/s5JPv6q+wj72t8tbXfVnsD0yjV8QGtwexYghUDD24RGIQXaPyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFxqUpxD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFxqUpxD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B961F00A3A;
	Fri, 24 Jul 2026 12:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784897286;
	bh=uMR56xxlvaMFPo9rkOz+DKWgVXCroLkJxwix/LSXXls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QFxqUpxDnr7FR1Mygai8ubB0/RxYFKP64TNOgb8vgSmBhAnmp+Q6gfB2BevyyC2Hn
	 mfycFF/YYqWonHZb9h7kCwOfWfJ/+xhhVMUM8jNWbtHDHVPE/gh3/ZxQRU7yrSMDbQ
	 sbthvUDvmbSWgK5tWMO4RPSFB9DvBsfUP7QNDvB5iY4joqUpSbfG06JYwYkSMzkfFw
	 rqZ2KfFyn1g2RxsyZ+IQi1ltBYhHCzVCIjtcjo++bJZ5hLKHEjSHrYmIq9UkoQRwfe
	 +RrjVBiQpd+LgKRmFRhYafd94QbIC1H478ggoa4bscS9l1VaxjBV8Ff04TZBC732dp
	 a/xwUe1xON/cA==
Date: Fri, 24 Jul 2026 13:48:01 +0100
From: Simon Horman <horms@kernel.org>
To: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	jhs@mojatatu.com, jiri@resnulli.us, shuah@kernel.org,
	vladimir.oltean@nxp.com, vinicius.gomes@intel.com,
	fejes@inf.elte.hu
Subject: Re: [PATCH net-next 6/6] selftests: net: add kselftest for IEEE
 802.1CB FRER tc action
Message-ID: <20260724124801.GJ418547@horms.kernel.org>
References: <20260717095549.10565-1-xiaoliang.yang_1@nxp.com>
 <20260717095549.10565-7-xiaoliang.yang_1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717095549.10565-7-xiaoliang.yang_1@nxp.com>

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev/#/patchset/20260717095549.10565-3-xiaoliang.yang_1@nxp.com?part=6
---
--- Patch [6]: [PATCH net-next 6/6] selftests: net: add kselftest for IEEE 802.1CB FRER tc action ---
commit af0b752d09a70dfd74c1c5880e3ee38044b284c6
Author: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>

selftests: net: add kselftest for IEEE 802.1CB FRER tc action

Add a TAP-format kselftest script covering the FRER tc action. The tests
exercise shared and individual recover modes using bond, point-to-point,
and relay topologies.

> diff --git a/tools/testing/selftests/net/frer_test.sh b/tools/testing/selftests/net/frer_test.sh
> new file mode 100755
> index 0000000000000..ecd88952f4958
> --- /dev/null
> +++ b/tools/testing/selftests/net/frer_test.sh

[ ... ]

> +cleanup()
> +{
> +	for n in "$NS_TALKER" "$NS_LISTENER" \
> +		"$P2P_NS_SRC" "$P2P_NS_DST" \
> +		"$R_NS_TALKER" "$R_NS_BRIDGE0" "$R_NS_BRIDGE1" "$R_NS_LISTENER"; do
> +		ip netns del "$n" 2>/dev/null || true
> +	done
> +}
> +trap cleanup EXIT

[Severity: Low]
Does this cleanup handler leak temporary packet capture files?

The test allocates files via mktemp /tmp/frer_... earlier, but this trap
handler only removes network namespaces and does not issue an rm for the
pcap files.

[ ... ]

> +capture_start_on()
> +{

[ ... ]

> +	# Wait until tcpdump opens a packet socket (max ~2.5 s).
> +	local tries=0
> +	while [ $tries -lt 50 ]; do
> +		ip netns exec "$ns" grep -q "$iface" /proc/net/packet 2>/dev/null && break

Simon says: I believe the common approach for the issue flagged below
            is to simply "sleep 1".
            Which has the advantage of being simple.

            Otherwise the index can be looked up from sysfs:
	    /sys/class/net/$iface/ifindex

[Severity: Medium]
Will this grep always fail and exhaust the 50-iteration retry limit?

/proc/net/packet exposes the integer ifindex of the interface, not the
string name.

This could cause a 2.5-second block per capture, wasting most of the 4-second
tcpdump timeout window. This leaves only 1.5s for the ping command and could
potentially cause test flakiness.

> +		sleep 0.05
> +		tries=$((tries + 1))
> +	done
> +}
> +
> +capture_stop()
> +{
> +	[ -n "$_CAP_PID" ] || return 0
> +	wait "$_CAP_PID" 2>/dev/null || true

Simon says: The issue flagged below like a design decision,
            I think we can pass on it.

[Severity: Medium]
Could this cause the script to idly block for the remainder of the 4-second
tcpdump timeout?

Because capture_start_on() spawns tcpdump using timeout 4 tcpdump &, running
wait without first sending a termination signal means it waits for the
timeout to expire naturally.

This could add significant delay across the full test suite.

> +	_CAP_PID=""
> +}

[ ... ]

> +test_individual_recover_bond()
> +{

[ ... ]

> +	# Per-slave capture A: verify veth_a1 passes frames; also use this run
> +	# for the overall ping_rc check (do_ping targets bond0->bond1).
> +	pcap_a=$(mktemp /tmp/frer_bond_indv_a_XXXXXX.pcap)
> +	capture_start_on "$NS_LISTENER" "$VETH_A1" "$pcap_a" "icmp"

Simon says: The issue flagged below seems to be a false-positive.

[Severity: Medium]
Will this BPF filter drop the ingress R-TAG frames?

Since tcpdump opens an AF_PACKET socket, it taps ingress frames in
__netif_receive_skb_core() before sch_handle_ingress() is called.

The ingress frame still contains the FRER R-TAG (EtherType 0xF1C1) and would
bypass the icmp (0x0800) filter, potentially leading to 0 captured ingress
ICMP frames and a deterministic test failure.

> +	do_ping || ping_rc=$?
> +	capture_stop

[ ... ]

> +main()
> +{

[ ... ]

> +	ksft_print_cnts
> +
> +	[ "$_ksft_fail" -eq 0 ] && ksft_exit_pass || ksft_exit_fail

[Severity: High]
Can this unconditionally fail the test with a bash syntax error?

When run in the kselftest tree, the script sources kselftest/lib.sh, which
skips the else block that initializes _ksft_fail=0.

Evaluating this with an unset variable triggers an integer expression
expected error and unconditionally takes the ksft_exit_fail path.

> +}
> +
> +main "$@"
