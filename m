Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562729;
	b=KdF17wiZntIIhzwgqtcAOLnFREURPHizwLjQRdnFOhzDUcMq8GrGBz2/caL//UTlG96A
	 mePCpY2m9NRdLJzNjvHHp0jmSvCqwRldgtDV6PXGqcz9PGy/wBSw8uLohvbu8nRnNHtXR
	 JdYgo2goa6YGq/mBTFSuJQx7l4fG+3VWKVtmPsnYyns3mNiXIkwLMpyxUkBk+4CQNCX2Y
	 svhflt5qq+dKEa2AsBBoLb7pI1Fplz9cwmNGUF9jtPtpP8x8GYtneZ4A6TMWvZJkjKb/9
	 tUJwGaw9FeI2r7Q0gnckYoK3IM6RwQCxKX1txuXjqD/py27opKt6kBiM3hrpZuGCtmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562729;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=eN1u1gTaPPH7ebLhTHxinCBnb4TjDDGC0qHw5MBYakc=;
	b=aMHzlASTb69u0bkVtT2/HFj5D+zIflncOiMVt1GKEk9QeIZHVMJypUNbmV9CrWsmgygX
	 EAMpIHVDGidZT3Jhs5+LvrHg5R/Gm8+x4Esm5aMrVXapeoN1LUvpyQTOuc9K5IEgD9GOV
	 el3LGbklYi3wDz5qSpcD/51ykGWdXOiE2Bw0plt6J1+LejTjbxcKllepixQjf2mzpkrZA
	 7os+oRSQ/xxX1HklrttRPvEDu6XCZw6kEf4lbbbAKt5ZsSHzKpzxrBoLhlwb/V4O7yMZt
	 mIWox8mVuqa3GkjSHFNIC5m0nzoii95d8Kt3j6ZyQA0EeC0lV/gwYaSL4b6tukQ5pAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TYU5Wamx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28D3606A33F;
	Tue, 24 Nov 2026 23:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TYU5Wamx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3681F000D3;
	Tue, 24 Nov 2026 23:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795562729;
	bh=eN1u1gTaPPH7ebLhTHxinCBnb4TjDDGC0qHw5MBYakc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TYU5WamxGXIU+uMF0uPvwnOf2jO285E0qnh6r/V7AVQbGu9Da5kXdDQktSc+nIs8s
	 7TYTyXMAqmCoEfeKRMGcTzWfJT+6CG0eIFf2uxJZons9H1IBRkfrP48UI9fJU0Ol4w
	 dgU2iLN/7MlPtU1E3j0hmWLGdAOa+G9iSNOfn5a/cn4WMEt5gZ9OcoEjYOosVELzRa
	 T/ncXp0DX68wtY8umYo918go0yjUZBvMBigwgF1i9U5uKK+NCblS5BEuxjW/3hRa/y
	 cDL80FF6vT0jB91jSfR4NQL6XYupaNnwPSD0xA2efAmGnePCoYf3AObmQZ80NKyUT3
	 WHhEI3T5E6WSg==
Subject:
 Re: [PATCH net-next 2/2] selftests: net: add tcp_l3mdev_exempt_ports test
From: netdev-bot+sashiko@kernel.org
To: kalash@nexthop.ai
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org,
 idosch@nvidia.com, ncardwell@google.com, kuniyu@google.com,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 24 Nov 2026 23:25:28 +0000
Message-ID: <179556272812.3135.6671930746959900620@kernel.org>
In-Reply-To: <20261120-tcp-l3mdev-exempt-ports-v1-2-ccc2a3a6cd09@nexthop.ai>
References: <20261120-tcp-l3mdev-exempt-ports-v1-2-ccc2a3a6cd09@nexthop.ai>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] vrf_and_unbound_listeners() in
  tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh waits for the…
- [Medium] selftests: net: missing VRF and l3mdev prerequisite checks in
  setup()
- [Low] The negative checks treat any non-zero exit from nettest as the
  expected 'did not get the connection' result.
- [Low] In unbound_listener()'s 'exempt, VRF conn to unbound listener
  rejected' subtest (lines 117-125), the server is started in the…
- [Low] selftests: net: tcp_l3mdev_exempt_ports.sh bypasses lib.sh
  helpers

--

selftests: net: add tcp_l3mdev_exempt_ports test

This adds a selftest for net.ipv4.tcp_l3mdev_exempt_ports. With
tcp_l3mdev_accept=1 and the port exempted, it checks that a VRF connection
reaches only a VRF-bound listener (in both listener creation orders) and
is refused by an unbound-only listener. It also checks that default-VRF
connections still reach the unbound listener, for IPv4 and IPv6.

> diff --git a/tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh b/tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh
> new file mode 100755
> index 0000000000000..f075abb9e8fbf
> --- /dev/null
> +++ b/tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh
> @@ -0,0 +1,213 @@

[ ... ]

> +unbound_listener()
> +{
> +	local fam addr pid
> +

[ ... ]

> +		RET=0
> +		set_exempt "$PORT"
> +		start_server "$fam" unbound
> +		pid=$!
> +		wait_local_port_listen "$ns_s" "$PORT" tcp
> +		connect "$ns_c" "$fam" "$addr"
> +		check_fail $? "VRF connection accepted by unbound listener"
> +		wait $pid

[Severity: Low]
Can this negative subtest pass even when the exemption does nothing?

wait_local_port_listen() in lib.sh gives up after about one second and
does not return an error:

tools/testing/selftests/net/lib.sh:wait_local_port_listen() {
	...
	for i in $(seq 10); do
		if ip netns exec "${listener_ns}" awk '{print $2" "$4}' \
		   /proc/net/"${protocol}"* | grep -q "${pattern}"; then
			break
		fi
		sleep 0.1
	done
}

If the backgrounded nettest has not reached listen() by then, connect()
still runs. The SYN then gets a RST because nothing is listening on
$PORT, not because of the exemption.

check_fail cannot tell this case apart from a real refusal caused by
tcp_l3mdev_exempt_ports. The server status from the following wait $pid
is not checked either.

Would it make sense to confirm that a LISTEN socket exists, or make the
readiness wait fatal, before the negative check runs?

[ ... ]

> +vrf_and_unbound_listeners()
> +{

[ ... ]

> +		for order in "unbound vrf" "vrf unbound"; do
> +			read -r first second <<< "$order"
> +			RET=0
> +
> +			start_server "$fam" "$first"
> +			pid_first=$!
> +			wait_local_port_listen "$ns_s" "$PORT" tcp
> +			start_server "$fam" "$second"
> +			pid_second=$!
> +			sleep 0.2

[Severity: Medium]
Is a fixed sleep 0.2 enough to make sure the second listener is up before
the client connects?

Only the first listener is synchronized with wait_local_port_listen().
Calling it a second time would not help. It greps /proc/net/tcp* for the
port in LISTEN state and returns as soon as any socket matches, and the
first listener already matches.

On a slow host, for example a debug kernel with KASAN or lockdep or a
nested VM, the second ip netns exec ./nettest may not reach listen()
within 200ms. The two orders then go wrong in different ways.

In the "unbound vrf" order, only the unbound listener exists. The port is
exempt, so the VRF SYN is reset. Both check_err $? "VRF connection failed"
and check_err $rc_vrf then report a failure that has nothing to do with
kernel behaviour.

In the "vrf unbound" order, only the VRF listener exists, so it takes the
connection. The unbound listener later times out with rc=2, which
satisfies check_fail $rc_unbound. The subtest passes without testing
whether a later-created unbound listener can win.

Could the test poll until two LISTEN sockets exist on $PORT instead? For
example, it could wait for ss -Hltn sport = :$PORT | wc -l to reach 2.

> +
> +			connect "$ns_c" "$fam" "$addr"
> +			check_err $? "VRF connection failed"
> +
> +			wait $pid_first
> +			rc_first=$?
> +			wait $pid_second
> +			rc_second=$?

[ ... ]

> +			check_err $rc_vrf "VRF-bound listener did not get the connection"
> +			check_fail $rc_unbound "unbound listener got the connection"

[Severity: Low]
Does check_fail $rc_unbound accept more outcomes than intended?

do_server() in nettest returns 2 only when select() times out with no
connection:

tools/testing/selftests/net/nettest.c:do_server() {
	...
		rc = select(lsd+1, &rfds, NULL, NULL, ptval);
		if (rc == 0) {
			rc = 2;
			break;
		}
	...
err_exit:
	ipc_write(ipc_fd, 0);
	return 1;
}

Setup failures go through err_exit and return 1. That covers device
resolution, address validation, and bind or listen in lsock_init().

check_fail passes for any non-zero value. In the "vrf unbound" order, if
the unbound listener fails to set up, the VRF listener still takes the
connection and the subtest passes without testing that the two listeners
coexist.

The exempt subtest in unbound_listener() has a similar gap. Any client
failure counts as the expected rejection, and the server status is
discarded:

	connect "$ns_c" "$fam" "$addr"
	check_fail $? "VRF connection accepted by unbound listener"
	wait $pid

If the unbound listener never started, nothing is listening and the
connection is refused, yet the subtest still reports "rejected".

Should these checks require rc == 2 from the listener that must not get
the connection? Should the server status also be checked in the
unbound_listener() exempt case?

[ ... ]

> @@ -0,0 +1,213 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Test net.ipv4.tcp_l3mdev_exempt_ports.
> +#
> +# With tcp_l3mdev_accept=1, a listener that is not bound to a device also
> +# matches connections that arrive in a VRF. For a port listed in
> +# tcp_l3mdev_exempt_ports it must not: only a listener bound to the VRF
> +# may take such a connection. Connections in the default VRF are not
> +# affected.
> +#
> +#  ns_c (client in VRF)       ns_s (server)             ns_d (client in default VRF)
> +#      veth0 ------------- veth_vrf [vrf red]
> +#                             veth_def ----------------- veth0
> +
> +source lib.sh
> +
> +PORT=12345
> +OTHER_PORT=23456
> +VRF=red
> +VRF_TABLE=1000
> +
> +VRF_SRV4=172.16.1.1
> +VRF_CLI4=172.16.1.2
> +DEF_SRV4=172.16.2.1
> +DEF_CLI4=172.16.2.2
> +VRF_SRV6=2001:db8:1::1
> +VRF_CLI6=2001:db8:1::2
> +DEF_SRV6=2001:db8:2::1
> +DEF_CLI6=2001:db8:2::2
> +
> +TESTS="
> +	unbound_listener
> +	vrf_and_unbound_listeners
> +	default_vrf_unaffected
> +"
> +
> +cleanup()
> +{
> +	cleanup_all_ns
> +}
> +
> +setup()
> +{
> +	setup_ns ns_s ns_c ns_d || exit $ksft_skip
> +
> +	ip -n "$ns_s" link add "$VRF" type vrf table "$VRF_TABLE"

[Severity: Medium]
Does this skip correctly on a kernel without VRF support?

setup() creates the VRF device, enslaves veth_vrf to it and writes
net.ipv4.tcp_l3mdev_accept=1. It never checks whether any of these
succeeded. The only capability check is the test -e on
/proc/sys/net/ipv4/tcp_l3mdev_exempt_ports, which runs after setup().

That check does not cover the VRF dependencies. tcp_l3mdev_accept is
only registered under CONFIG_NET_L3_MASTER_DEV, and the vrf link type
needs CONFIG_NET_VRF. The new tcp_l3mdev_exempt_ports sysctl from patch
1/2 appears to be registered whenever CONFIG_SYSCTL is set.

On such a kernel, ip link add ... type vrf fails and veth_vrf stays in
the default VRF. The sysctl write also fails, with only a message on
stderr. The exempt_ports check then succeeds and tests_run() goes ahead.

The exempt cases in unbound_listener() then see the connection accepted,
because it never arrives in a VRF. The nettest -I red listeners in
vrf_and_unbound_listeners() cannot bind to the missing device. The
result is a series of FAILs rather than ksft_skip.

Could setup() bail out with $ksft_skip when the VRF cannot be created?
Alternatively, the script could check for
/proc/sys/net/ipv4/tcp_l3mdev_accept alongside the exempt_ports sysctl.
Checking the return of the remaining setup commands would also make
other setup failures visible, instead of having them show up as
unrelated test failures.

> +	ip -n "$ns_s" link set "$VRF" up
> +
> +	ip -n "$ns_s" link add veth_vrf type veth peer name veth0 netns "$ns_c"
> +	ip -n "$ns_s" link set veth_vrf master "$VRF"
> +	ip -n "$ns_s" link set veth_vrf up
> +	ip -n "$ns_s" addr add "$VRF_SRV4/24" dev veth_vrf
> +	ip -n "$ns_s" addr add "$VRF_SRV6/64" dev veth_vrf nodad
> +	ip -n "$ns_c" link set veth0 up
> +	ip -n "$ns_c" addr add "$VRF_CLI4/24" dev veth0
> +	ip -n "$ns_c" addr add "$VRF_CLI6/64" dev veth0 nodad
> +
> +	ip -n "$ns_s" link add veth_def type veth peer name veth0 netns "$ns_d"
> +	ip -n "$ns_s" link set veth_def up
> +	ip -n "$ns_s" addr add "$DEF_SRV4/24" dev veth_def
> +	ip -n "$ns_s" addr add "$DEF_SRV6/64" dev veth_def nodad
> +	ip -n "$ns_d" link set veth0 up
> +	ip -n "$ns_d" addr add "$DEF_CLI4/24" dev veth0
> +	ip -n "$ns_d" addr add "$DEF_CLI6/64" dev veth0 nodad
> +
> +	ip netns exec "$ns_s" sysctl -wq net.ipv4.tcp_l3mdev_accept=1
> +}
> +
> +ipver()
> +{
> +	[ "$1" = "-6" ] && echo 6 || echo 4
> +}
> +
> +set_exempt()
> +{
> +	ip netns exec "$ns_s" sysctl -wq net.ipv4.tcp_l3mdev_exempt_ports="$1"
> +}
> +
> +# Start a server. nettest sets SO_REUSEPORT on its listeners, so an
> +# unbound and a VRF-bound listener can share the port.
> +# $1: "-6" or "", $2: "vrf" or "unbound"
> +start_server()
> +{
> +	local dev_arg=""
> +
> +	[ "$2" = "vrf" ] && dev_arg="-I $VRF"
> +	# shellcheck disable=SC2086
> +	ip netns exec "$ns_s" ./nettest $1 -s $dev_arg -p "$PORT" -t 3 -q &
> +}
> +
> +# $1: client netns, $2: "-6" or "", $3: server address
> +connect()
> +{
> +	# shellcheck disable=SC2086
> +	ip netns exec "$1" ./nettest $2 -r "$3" -p "$PORT" -t 2 -q
> +}
> +
> +unbound_listener()
> +{
> +	local fam addr pid
> +
> +	for fam in "" "-6"; do
> +		addr=$VRF_SRV4
> +		[ "$fam" = "-6" ] && addr=$VRF_SRV6
> +
> +		RET=0
> +		set_exempt "$OTHER_PORT"
> +		start_server "$fam" unbound
> +		pid=$!
> +		wait_local_port_listen "$ns_s" "$PORT" tcp
> +		connect "$ns_c" "$fam" "$addr"
> +		check_err $? "VRF connection not accepted by unbound listener"
> +		wait $pid
> +		log_test "IPv$(ipver "$fam"): not exempt, VRF conn to unbound listener accepted"
> +
> +		RET=0
> +		set_exempt "$PORT"
> +		start_server "$fam" unbound
> +		pid=$!
> +		wait_local_port_listen "$ns_s" "$PORT" tcp
> +		connect "$ns_c" "$fam" "$addr"
> +		check_fail $? "VRF connection accepted by unbound listener"
> +		wait $pid
> +		log_test "IPv$(ipver "$fam"): exempt, VRF conn to unbound listener rejected"
> +	done
> +	set_exempt ""
> +}
> +
> +# Both an unbound and a VRF-bound listener on the port. The VRF connection
> +# must reach the VRF-bound one, whichever listener was created first.
> +vrf_and_unbound_listeners()
> +{
> +	local fam addr order first second pid_first pid_second
> +	local rc_first rc_second rc_vrf rc_unbound
> +
> +	set_exempt "$PORT"
> +	for fam in "" "-6"; do
> +		addr=$VRF_SRV4
> +		[ "$fam" = "-6" ] && addr=$VRF_SRV6
> +
> +		for order in "unbound vrf" "vrf unbound"; do
> +			read -r first second <<< "$order"
> +			RET=0
> +
> +			start_server "$fam" "$first"
> +			pid_first=$!
> +			wait_local_port_listen "$ns_s" "$PORT" tcp
> +			start_server "$fam" "$second"
> +			pid_second=$!
> +			sleep 0.2
> +
> +			connect "$ns_c" "$fam" "$addr"
> +			check_err $? "VRF connection failed"
> +
> +			wait $pid_first
> +			rc_first=$?
> +			wait $pid_second
> +			rc_second=$?
> +			if [ "$first" = "vrf" ]; then
> +				rc_vrf=$rc_first
> +				rc_unbound=$rc_second
> +			else
> +				rc_vrf=$rc_second
> +				rc_unbound=$rc_first
> +			fi
> +			check_err $rc_vrf "VRF-bound listener did not get the connection"
> +			check_fail $rc_unbound "unbound listener got the connection"
> +
> +			log_test "IPv$(ipver "$fam"): exempt, $first first, VRF-bound listener wins"
> +		done
> +	done
> +	set_exempt ""
> +}
> +
> +default_vrf_unaffected()
> +{
> +	local fam addr pid
> +
> +	set_exempt "$PORT"
> +	for fam in "" "-6"; do
> +		addr=$DEF_SRV4
> +		[ "$fam" = "-6" ] && addr=$DEF_SRV6
> +
> +		RET=0
> +		start_server "$fam" unbound
> +		pid=$!
> +		wait_local_port_listen "$ns_s" "$PORT" tcp
> +		connect "$ns_d" "$fam" "$addr"
> +		check_err $? "default VRF connection not accepted"
> +		wait $pid
> +		check_err $? "unbound listener did not get the connection"
> +		log_test "IPv$(ipver "$fam"): exempt, default VRF conn to unbound listener accepted"
> +	done
> +	set_exempt ""
> +}
> +
> +trap cleanup EXIT
> +
> +if [ ! -x ./nettest ]; then
> +	echo "SKIP: nettest not built"
> +	exit "$ksft_skip"
> +fi
> +
> +setup
> +if ! ip netns exec "$ns_s" test -e /proc/sys/net/ipv4/tcp_l3mdev_exempt_ports; then
> +	echo "SKIP: net.ipv4.tcp_l3mdev_exempt_ports not supported"
> +	exit "$ksft_skip"
> +fi
> +
> +tests_run
> +
> +exit "$EXIT_STATUS"
>

[Severity: Low]
Should this use the lib.sh helpers instead of open-coding them?

The script sources lib.sh, but it checks for ./nettest by hand and then
hardcodes ./nettest in start_server() and connect(). lib.sh already
provides check_gen_prog(). That helper looks the program up in PATH and
falls back to prepending $PWD. Other nettest users in this directory,
such as fcnal-test.sh, pmtu.sh and vrf_route_leaking.sh, call
check_gen_prog nettest and then invoke plain nettest.

With the open-coded check, running the script from any directory other
than tools/testing/selftests/net skips the whole test. This happens even
when nettest is installed and in PATH.

Separately, the script assigns TESTS unconditionally near the top.
tests_run() in lib.sh iterates over TESTS with ALL_TESTS as the
fallback:

tools/testing/selftests/net/lib.sh:tests_run() {
	...
	for current_test in ${TESTS:-$ALL_TESTS}; do
	...
}

Scripts are expected to define ALL_TESTS, so that a developer can run a
single case with something like:

  TESTS=default_vrf_unaffected ./tcp_l3mdev_exempt_ports.sh

Here that override is silently discarded and all three cases always
run.

Could this switch to ALL_TESTS and check_gen_prog nettest, with nettest
invoked through PATH?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-tcp-l3mdev-exempt-ports-v1-0-ccc2a3a6cd09%40nexthop.ai
