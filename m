Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5268B3B47F3;
	Sat, 19 Sep 2026 02:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789786137; cv=none; b=jD/D5kg/DCyUCMmtuYCBV/FWF+wXwnR8uWukMZnvcB9Da1+GLU/6iM5801YB3xxtDWQd9fWa47cqS48xcgQOyPF6OEzPqxbT/+EjeNqhF7c5cx46dLhTqTi6ZpMKlIu+poqcxrp0ghYClZb36yG3bcODX/WRjvp4GBx4yZuSFvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789786137; c=relaxed/simple;
	bh=hmK1KmJnPGtFZiSqwkb8jUmFtgTVb6VkH8huqrCAcd4=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ynw2Bj6WlslWrzd/KvNBUWGAitro7BPHtHdb6fJwqdwmEJZkiaOorN4mKYbxJ/wN9MUMFfQEZLfmKgs2OvYQSq88Wy5kkAScIXhSRfcDoOvizyUYdhVwVBRnFcsC0NUec9MVOfMrIHti5MTVUJJw2nvqhwBOymM2UE5ZV4IDF1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cb3bG/Wt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cb3bG/Wt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 327BE1F000FF;
	Sat, 19 Sep 2026 02:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789786135;
	bh=Lzb//P0FRNtOAyMRhQ6NZyCRfipS3HuTWg658oFykSw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cb3bG/Wt/qyKy8ky0hjVCYl5vf7V+Dyfh2ZgLVLxTnIVGrzNzA6sv5CJc44qMLKQi
	 Zp3AEUPZphftRw87pMibsiyHDU/N/54Uygly/DTiWc3bMbDB/IsIcKqG2w0zwqftuo
	 HKp/Zw8DhPgOedO7SXsQ0zFjMwZ7+z+iDPqGGapagCcNBxhTUO0gGIj29/bwJtuSaV
	 NIUkM116mpvsk43YBFru2Aiu0JV/fetfK1jdCQkPaDh3qEIzjkJvNBGIVj4X8AW2EW
	 I1RVOCra4SIP8kBxWSJpCfxfINFF3O2Gwy9KFUNs6jKhMMCaFtaVNq/gzAuOOWxRAE
	 HovmYhRlZuyjg==
Subject: Re: [PATCH net-next v2 3/3] selftests: net: cover IPv6 uncached route
 device mismatch
From: netdev-bot+sashiko@kernel.org
To: carges@cloudflare.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com
Date: Sat, 19 Sep 2026 02:48:54 +0000
Message-ID: <178978613474.22033.16435022861441934492@kernel.org>
In-Reply-To:
 <20260914-hash-bucket-route-lists-v2-3-29f6297d8a5a@cloudflare.com>
References:
 <20260914-hash-bucket-route-lists-v2-3-29f6297d8a5a@cloudflare.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider:

Critical: 0 · High: 1 · Medium: 2 · Low: 2

- [High] test_ipv6_uncached_mismatch() (tools/testing/selftests/net/vrf-
  xfrm-tests.sh:388-417) asserts that `timeout 2 ip link del eth0`…
- [Medium] Both setup steps of the new test are unchecked.
- [Medium] `run_cmd_host1 timeout 2 ip link del eth0`
  (tools/testing/selftests/net/vrf-xfrm-tests.sh:415) is used as the…
- [Low] test_ipv6_uncached_mismatch() mutates and then destroys the
  shared fixture without any teardown: it replaces the VRF root qdisc…
- [Low] The retention of the uncached route depends solely on a 10 s
  netem timer armed at enqueue, and nothing re-verifies that the packet…

--

selftests: net: cover IPv6 uncached route device mismatch

This adds a new test case to vrf-xfrm-tests.sh that creates a local IPv6
route through a VRF so that dst.dev is the VRF while rt6i_idev stays on the
member interface, holds the resulting uncached route in a netem queue, and
then deletes the member interface. A few questions below about the new test
function and about the commit message.

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
> +	ip -6 -netns "$host1" route add local ${HOST1_6}/128 dev eth0

[Severity: Medium]
Should the exit status of these two setup steps be checked?

The tc qdisc replace status is discarded, and the route add is not run
through run_cmd_host1 at all, so it is invisible under -v and has no
log_test either.

If CONFIG_NET_SCH_NETEM is not built, the qdisc is never installed, but
msg_zerocopy still exits 0 because rawv6_send_hdrinc() in net/ipv6/raw.c
masks -ENOBUFS:

	err = ip6_push_pending_frames(sk);
	...
	if (err == -ENOBUFS && !inet6_test_bit(RECVERR6, sk))
		err = 0;

So the first log_test passes and the failure instead shows up later as
"Retain uncached IPv6 routes in VRF qdisc" FAIL, which reads as a kernel
route-retention regression rather than a missing scheduler. Would a check
plus a skip be clearer here?

The same applies to the route add: it is the precondition that creates the
dst.dev(VRF) versus rt6i_idev(eth0) mismatch the test is named after. If it
fails (EEXIST, table/rule differences, older iproute2), the test either
fails at the sender assertion or silently exercises an unrelated path. The
later "[ $rc -ne 0 ] && return" guard cannot help, since rc only carries
msg_zerocopy's status.

Related to this, the commit message says:

	verify route creation, qdisc retention, and prompt interface
	deletion.

Is "verify route creation" accurate?  No assertion covers the route add; the
first log_test only reports the sender program's exit status.

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

[Severity: Low]
Is the retention window here deterministic?

The only thing holding the uncached route is the 10s netem timer armed at
enqueue, and the backlog is sampled once and then assumed to still hold at
the ip link del below.  Between enqueue and the delete the script runs
msg_zerocopy for its full runtime (cfg_runtime_ms is 200 + 0 * 1000 with
-t 0, see tools/testing/selftests/net/msg_zerocopy.c), one ip netns exec tc
-s qdisc show, and two more process spawns.

If the timer fires before the grep, the result is a spurious FAIL. If it
fires after the grep but before the delete, all three checks pass while
nothing is actually exercised. Would a much longer netem delay, or a
re-check of the backlog immediately before the delete, make this
deterministic?

> +
> +	run_cmd_host1 timeout 2 ip link del eth0
> +	log_test $? 0 "Flush uncached IPv6 routes with mismatched devices"

[Severity: High]
Can this assertion pass on the tree the patch applies to?

The uncached dst created via ip6_pol_route() -> ip6_rt_cache_alloc() ->
rt6_uncached_list_add() holds a reference on the local route's fib6_info
through ip6_rt_copy_init() -> rt6_set_from(). That fib6_info's nexthop holds
a tracked netdev reference on eth0:

net/ipv6/route.c:fib6_nh_init() {
	...
	dev = netdev_get_by_index(net, cfg->fc_ifindex,
				  dev_tracker, gfp_flags);
	...
}

and that reference is only dropped by fib6_nh_release(), which runs from
fib6_info_destroy_rcu(), i.e. after the last fib6_info reference goes away.

The teardown path does not break that chain:

net/ipv6/route.c:rt6_disable_ip() {
	...
	rt6_sync_down_dev(dev, event);
	rt6_uncached_list_flush_dev(dev);
	neigh_ifdown(nd_table(net), dev);
	...
}

and rt6_uncached_list_flush_dev() only swaps rt6i_idev/dst.dev to
blackhole_netdev:

	if (rt_idev && rt_idev->dev == dev) {
		rt->rt6i_idev = in6_dev_get(blackhole_netdev);
		in6_dev_put(rt_idev);
		handled = true;
	}

It never touches rt->from. The xchg(&rt->from, NULL) in ip6_dst_ifdown() is
only reached through dst->ops->ifdown from dst_dev_put(), which is not
called for this dst because ip6_rt_get_dev_rcu() gives the VRF master as
dst.dev for an RTF_LOCAL route on an enslaved device - the very mismatch
described in the commit message.

So eth0's refcount stays elevated until netem dequeues the skb roughly 10s
later, ip link del blocks in netdev_wait_allrefs_any() for that long,
timeout 2 returns non-zero, and this log_test reports FAIL. The commit
message does not name a kernel fix this test accompanies and does not
mention an expected failure. Is a corresponding kernel change meant to be
part of this series?

[Severity: Medium]
Separately, can timeout bound this operation at all?

RTM_DELLINK finishes unregistration synchronously in the caller's syscall
context via rtnl_unlock() -> netdev_run_todo() -> netdev_wait_allrefs_any(),
whose loop is:

net/core/dev.c:netdev_wait_allrefs_any() {
	...
		} else {
			msleep(wait);
			wait = min(wait << 1, WAIT_REFS_MAX_MSECS);
		}
	...
}

There is no signal check there, so the SIGTERM that timeout 2 queues cannot
be delivered until the syscall returns, and killing ip would not roll back
the in-kernel unregistration either. During that window the half-removed
device also emits the periodic "unregister_netdevice: waiting for eth0 to
become free" messages.

That makes the verdict of this log_test depend on signal delivery timing
rather than on the outcome of the delete, and if a reference were genuinely
never released the script would block indefinitely and never reach the
summary printf and exit $ret.

The test also never removes the retaining netem qdisc, which is the one
action that would release the pinning skb immediately. Would deleting the
qdisc before the link delete, and checking device refcounts instead of
wrapping ip in timeout, be a more reliable detector?

> +}
> +

[Severity: Low]
Does test_ipv6_uncached_mismatch() need to restore what it changes?

It replaces the VRF root qdisc with netem limit 1 delay 10s, adds
local ${HOST1_6}/128 dev eth0, and then deletes eth0, which is the veth
carrying the whole host1/host2 topology built once by setup().

Neither early return ("[ $rc -ne 0 ] && return" and the backlog-grep
return) removes the qdisc or the added route, and the success path also
leaves the 10s qdisc on the VRF.

Because the shared fixture is consumed, the file also gains an implicit
ordering constraint: the test only works while it is the last thing invoked.
Adding anything after it, or repeating run_tests, would fail.

> @@ -425,6 +456,10 @@ echo
>  echo "netem qdisc on VRF device"
>  run_tests
>  
> +echo
> +echo "Uncached IPv6 route with mismatched devices"
> +test_ipv6_uncached_mismatch
> +

Continuing the point above: the earlier phase leaves netem delay 100ms on the
same VRF device, so if the replace in the new test fails the leftover qdisc
can still produce a non-zero backlog and satisfy the grep without holding the
route past the two-second timeout.

The script also has no final cleanup and no EXIT trap. The existing
"cleanup 2>/dev/null" runs before setup() while $host1/$host2 are still
unset, so cleanup_ns gets no arguments. That part is pre-existing and not
introduced by this patch, but with eth0 now deleted and the qdisc and route
left in place the namespaces are leaked in a modified state.

>  printf "\nTests passed: %3d\n" ${nsuccess}
>  printf "Tests failed: %3d\n"   ${nfail}
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260914-hash-bucket-route-lists-v2-0-29f6297d8a5a%40cloudflare.com
