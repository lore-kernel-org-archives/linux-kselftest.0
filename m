Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAAB434E42;
	Mon, 21 Sep 2026 20:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022059; cv=none; b=sB7vBSSrPuAvdv7pqxDPLKjcUNJdQJahFDTK5aWqE8PXZpH1H2ooDQUzZ6QHfmYuWkvrGlj/on88I/0vldc2M81oapysIxyI4vQ1f8ZMr6Z702PTZFo8Xo/X3NatSV7OYZiCSSkC+THQ0CNvIEmxJOa7xWFr/MWw33dO1K3HDFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022059; c=relaxed/simple;
	bh=ReYLXHNFtT/K5Zs4fdRlX7rfSg4iXApJqVxhDoqvA+M=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uw4tx6Wn5BgZAUY6d5KO/lOPWIh6Vd8A+IYTXj5rqScg8fumT+gG/gFrz1B9P3LdRykGkrXPsIq0h4qhSh0J4zY0TUqH3wEzBSXTDR3OvewE3TrCnOb3THM8Ed5HN/t/NDPhZ1V4U/CqsZbhs7dLzXunphCJgCBMCnctrJWn0tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYPpsxvj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYPpsxvj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6261F00893;
	Mon, 21 Sep 2026 20:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790022057;
	bh=hTOTY1vDZ/URN1ByDhuIA/NtkHJAtz5pa2SS2+OP/9E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HYPpsxvjtkjXtUIFzXFcYCbFay0UHA8Nhx10iROOSDFOEfIog343t2rjbBMu+J3aH
	 IErl4DZns224nBaxRf3ujn0ieQlCtfsVn2QnNqa7gHBInl0tvWXPw4YPdJiQI1uPDQ
	 XFhJdwqeT5/45LjkC6Po+7hSLxt7EvH0Wxzs8w7Zh9Sl2ar1bBKxmlyH6j/edeQS2Z
	 IZ+i3HXujgtTBE2URrdI9vIJj5cNj4zV3wKxQ5+ngT0PNCfNhFggBZh9q7RrWsih52
	 rG9DvY/qZWjroW6gdF87q+xRGdOdgyD+gszkMigxAQWfVOGq5AgrrFpdwzKgQe2XBp
	 xFgn1mH3fYx9A==
Subject: Re: [PATCH net-next v3 3/3] selftests: net: cover IPv6 uncached route
 device mismatch
From: netdev-bot+sashiko@kernel.org
To: carges@cloudflare.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com
Date: Mon, 21 Sep 2026 20:20:56 +0000
Message-ID: <179002205606.2160803.14680010273423486409@kernel.org>
In-Reply-To:
 <20260917-hash-bucket-route-lists-v3-3-30493a37b6eb@cloudflare.com>
References:
 <20260917-hash-bucket-route-lists-v3-3-30493a37b6eb@cloudflare.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] test_ipv6_uncached_mismatch() mutates the shared topology built
  once by setup() and never restores it: it installs a root netem qdisc…
- [Low] The test's regression signal depends on bucket separation that
  the implementation does not guarantee.
- [Low] test_ipv6_uncached_mismatch() replaces the VRF root qdisc with
  `netem limit 1 delay 10s` (line 397) but neither checks nor logs the…
- [Low] The test verifies 'route retained in the VRF qdisc' with a one-
  shot `tc -s qdisc show` snapshot (line 408) and then performs the…

--

selftests: net: cover IPv6 uncached route device mismatch

This adds test_ipv6_uncached_mismatch() to vrf-xfrm-tests.sh, which installs
a delayed netem qdisc on the VRF, adds a local IPv6 route on the VRF member
interface, sends raw-header packets with msg_zerocopy, and then deletes the
member interface while the uncached route is still referenced by the qdisc
backlog.

> diff --git a/tools/testing/selftests/net/vrf-xfrm-tests.sh b/tools/testing/selftests/net/vrf-xfrm-tests.sh
> index b64dd891699d3..4f409d135a99a 100755
> --- a/tools/testing/selftests/net/vrf-xfrm-tests.sh
> +++ b/tools/testing/selftests/net/vrf-xfrm-tests.sh
> @@ -385,6 +385,37 @@ run_tests()
>  	cleanup_xfrm_dev
>  }
>  
> +test_ipv6_uncached_mismatch()
> +{
> +	local sender_pid
> +	local backlog
> +	local rc
> +
> +	# A local route through a VRF uses the VRF as dst.dev while retaining
> +	# the VRF member interface in rt6i_idev. Raw header sends create uncached
> +	# routes, and netem keeps them referenced while the interface is deleted.
> +	run_cmd_host1 tc qdisc replace dev ${VRF} root netem limit 1 delay 10s

[Severity: Low]
Should the result of this qdisc replacement be checked or logged like the
other setup commands in this script?  The script does not use set -e, so the
status is discarded here.

The main flow has already installed a different qdisc on the same device
before calling this function:

	run_cmd_host1 tc qdisc add dev ${VRF} root netem delay 100ms
	echo
	echo "netem qdisc on VRF device"
	run_tests

If the replace fails, the 100ms qdisc stays in place.  msg_zerocopy with
-t 0 runs for about 200ms (parse_opts() computes
cfg_runtime_ms = 200 + strtoul(optarg, NULL, 10) * 1000), so packets
enqueued in the last 100ms are still in the backlog when tc -s qdisc show is
sampled and the grep for a non-empty backlog still matches.  That backlog
then drains in about 100ms, well within the 2s deletion timeout, so every
added check can pass without ever holding a route across the device
deletion.  Would checking the replace status here close that gap?

> +	ip -6 -netns "$host1" route add local ${HOST1_6}/128 dev eth0
> +	ip netns exec "$host1" ./msg_zerocopy -6 \
> +		-S ${HOST1_6} -D ${HOST1_6} -s 1200 -t 0 raw_hdrincl \
> +		>/dev/null 2>&1 &
> +	sender_pid=$!
> +	wait "$sender_pid"
> +	rc=$?
> +	log_test $rc 0 "Create uncached IPv6 routes with mismatched devices"
> +	[ $rc -ne 0 ] && return
> +
> +	backlog=$(ip netns exec "$host1" tc -s qdisc show dev ${VRF})
> +	if ! echo "$backlog" | grep -Eq 'backlog .* [1-9][0-9]*p'; then
> +		log_test 1 0 "Retain uncached IPv6 routes in VRF qdisc"
> +		return
> +	fi
> +	log_test 0 0 "Retain uncached IPv6 routes in VRF qdisc"
> +

[Severity: Low]
Is the retention observed by this snapshot guaranteed to still hold when the
delete runs a few statements later?

The only thing keeping the skb, and therefore the uncached route reference,
in the qdisc is the netem 10s timer, and that timer is armed at enqueue time
during the msg_zerocopy run rather than at the moment of this check.  With
-t 0 the sender runs about 200ms, so roughly 9.8s of slack remain between
the tc -s qdisc show sample and run_cmd_host1 timeout 2 ip link del eth0.

If that slack is consumed by shell forks, grep, printf, or scheduling stalls
on a loaded single-CPU or nested VM, netem has already dequeued the packet
and dropped the dst/idev references, so the delete completes promptly
regardless of whether the kernel bug is present, and the test reports a
pass.  Would a longer netem delay, or re-sampling the backlog immediately
before the delete, make the assertion self-checking?

> +	run_cmd_host1 timeout 2 ip link del eth0
> +	log_test $? 0 "Flush uncached IPv6 routes with mismatched devices"
> +}

[Severity: Low]
Can a hash bucket collision make this check pass on a kernel where the
insertion key regressed?

rt6_uncached_list_add() in net/ipv6/route.c reduces the keying device
pointer to one of 64 buckets:

	ul = &table->buckets[hash_ptr(dev, RT6_UNCACHED_HASH_BITS)];

and teardown of a non-master device scans only that one bucket:

	ul = &table->buckets[hash_ptr(dev,
				      RT6_UNCACHED_HASH_BITS)];
	rt6_uncached_list_flush(ul, dev);

With RT6_UNCACHED_HASH_BITS == 6, if a regression reintroduced keying by
dst_dev() (the VRF) and hash_ptr(vrf) happens to land in the same bucket as
hash_ptr(eth0), the eth0 scan still reaches the wrongly indexed route,
rt6_uncached_list_flush() matches on rt6i_idev->dev == eth0 and releases the
reference, so the delete succeeds and the test passes.  The pointers differ
per boot, so that is roughly a 1-in-64 chance per run.  Would creating
several VRF and member pairs make the signal independent of bucket layout?

[Severity: Low]
Does this function need to undo the state it installs?

test_ipv6_uncached_mismatch() mutates the topology built once by setup() and
never restores it:

  - a root netem qdisc with limit 1 delay 10s on the VRF
  - a local IPv6 route on eth0
  - deletion of eth0, which is the VRF's only member and the only veth to
    host2

There is no matching tc qdisc del or ip -6 route del on any exit path, and
both early returns (the [ $rc -ne 0 ] && return after the sender, and the
backlog-check failure path) skip even the eth0 deletion, leaving the 10s
netem qdisc behind.

That makes the function correct only as the final statement of the script,
and that constraint isn't documented anywhere, so anything appended after it
runs against a namespace with no eth0 and a limit 1 / 10s-delay qdisc.

Related, and not introduced by this patch: the script has no trap cleanup
EXIT, and the cleanup 2>/dev/null in the main flow runs before setup while
$host1/$host2 are still unset, so the namespaces and this state are simply
abandoned at exit.  setup_ns() in tools/testing/selftests/net/lib.sh only
records names in NS_LIST and does not arrange teardown.  Since setup_ns()
picks a fresh randomized name per invocation, a re-run does not inherit the
broken topology, so what remains is leaked state plus the undocumented
ordering requirement.

>  
>  ################################################################################
>  # usage
>  
> @@ -425,6 +456,10 @@ echo
>  echo "netem qdisc on VRF device"
>  run_tests
>  
> +echo
> +echo "Uncached IPv6 route with mismatched devices"
> +test_ipv6_uncached_mismatch
> +
>  printf "\nTests passed: %3d\n" ${nsuccess}
>  printf "Tests failed: %3d\n"   ${nfail}
>  

Would a short comment here noting that this test must stay last, or a
cleanup/restore inside the function, help whoever extends the script next?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917-hash-bucket-route-lists-v3-0-30493a37b6eb%40cloudflare.com
