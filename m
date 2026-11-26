Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728028;
	b=lMwUQlT6DFHRgmootToLCgfeMs2cGSA2x2YsO7DgRVPiX03r5gnAeRlzPCqkWmZAp9da
	 tBA1K175SwFF5aHQPcTJxP6pVZCN8h4nZt5YehmLU3bHOwxPrg7bCj9McoPtc588RnqKR
	 s9ZrKKAYt98FO8NU0rDUtjnVBxDz1Pq2fcxgPievj3x8uefhVf3D/UojWgx25lYRxyWf+
	 QXIgpqc+6uv228En8FS9Ts9zgr2XKC0IipUZ3VjuD/vhfi3C2lJYx5ob/CyqfVAh71gvw
	 1AHSV21GiYbwePbm4xca5TslylLx30ErP0Rii0/r+FGbj0sGvkXTPAsdAUkFJTSPmVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728028;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=WpnFRtFvn4rUzHOPiDA3buIdDTlwdvdiSjo/iAEXaNc=;
	b=vpIlCq1+WQihFBeFiiSEBGrWJpJGf4JiTK6Ps7zcJiJFbU+6pstdUppjmpnaUTOXr4Rn
	 EAv0jeB/DGTDWEDdlGmxuQAtKdlJfxcQvqaQ8H2/1NYdDEWdBSJx+u6kpevGXqDhWhkvw
	 eqcOFvqNmOTzbyknkUqzUmeP1pJ0k73U8Xill5qQKoGcJOH3c3Sx84h/hi08HpbTPPMaT
	 ezgTSAmR1UDLYkkpJ1q/1cm7VYQec8L7fIckhsuhRKPoXyrKI4+Bf0PcVI+vkpkW7j6MY
	 nqu9luYFe6igBZQEMI8FtYPEuyGgMKy/ij9XIE9aT7OUedurqqcB1xTACRODAT540Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nWh9269O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22E7606A332;
	Thu, 26 Nov 2026 21:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nWh9269O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 774B81F00893;
	Thu, 26 Nov 2026 21:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795728028;
	bh=WpnFRtFvn4rUzHOPiDA3buIdDTlwdvdiSjo/iAEXaNc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nWh9269ObV9qFD/T5/kn1f5F2/DBwuSvUXqIyPJq6lGQuVy2TgWBUl5GiWHAVrDcg
	 Rr/0Ug2oysUGhlY7rgBUNVuRtSrrffEwmlZjbRQUaX1bdErbDTQaxKI4fI6teswfOw
	 bKQgmToJ34Ri2Q0OZU0MORV2zpeQN8wc5rzawCOUZ4sQk3yPYJRstzOAigjLWrpNiq
	 gFm3CZmWvbyA9r8GlvxYplywu42Mc8eAk8xW0S4q4hr8KU7tNSwQHS+NAwotPu4U+h
	 QDLeyDzn33v5lC/DcD2c/QIMdOQQi/d4AT+g+RAxM8eYtqWCd3sIe/58TZLBMysCNX
	 BKv17V8lL3jsg==
Subject:
 Re: [PATCH net-next v2 2/2] selftests: net: add tcp_l3mdev_exempt_ports test
From: netdev-bot+sashiko@kernel.org
To: kalash@nexthop.ai
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org,
 idosch@nvidia.com, ncardwell@google.com, kuniyu@google.com, shuah@kernel.org,
 joel.granados@kernel.org, netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 26 Nov 2026 21:20:27 +0000
Message-ID: <179572802703.3135.17411865692194388871@kernel.org>
In-Reply-To: <20261125-tcp-l3mdev-exempt-ports-v2-2-b920f3ff8f5e@nexthop.ai>
References: <20261125-tcp-l3mdev-exempt-ports-v2-2-b920f3ff8f5e@nexthop.ai>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The header comment of the new test script
  tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh (lines 8-9)…
- [Low] In vrf_and_unbound_listeners() in
  tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh, the first…

--

selftests: net: add tcp_l3mdev_exempt_ports test

This adds a selftest for net.ipv4.tcp_l3mdev_exempt_ports. With
tcp_l3mdev_accept=1 and the port exempted, it checks that a VRF
connection reaches the VRF-bound listener in either creation order and
is refused by an unbound-only listener. It also checks that default-VRF
connections still reach the unbound listener, for both IPv4 and IPv6.

> diff --git a/tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh b/tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh
> new file mode 100755
> index 0000000000000..da7f20bf2e9e6
> --- /dev/null
> +++ b/tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh
> @@ -0,0 +1,260 @@
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

[Severity: Low]
This isn't a bug, but is this comment narrower than what the kernel
does?

Documentation/networking/ip-sysctl.rst describes tcp_l3mdev_exempt_ports
as:

    only a listen socket bound to the L3
    master device or to the receiving device can accept them.

The check in compute_score() (net/ipv4/inet_hashtables.c, and its twin
in net/ipv6/inet6_hashtables.c) only rejects sockets with no bound
device:

    if (!sk->sk_bound_dev_if && sdif &&
        tcp_port_l3mdev_exempt(net, hnum))
            return -1;

A listener bound to the slave device (veth_vrf here) still matches
through the sdif comparison in inet_sk_bound_dev_eq().

Could the comment say "bound to the VRF or to the receiving device"?

Also, none of the cases uses a listener bound to the slave device, so
that documented behaviour has no test coverage. Would it be worth adding
one?

[ ... ]

> +# Start a server in the background. nettest sets SO_REUSEPORT on its
> +# listeners, so an unbound and a VRF-bound listener can share the port.
> +# $1: IP version, $2: "vrf" or "unbound"
> +start_server()
> +{
> +	local args=()
> +
> +	[ "$1" = 6 ] && args+=(-6)
> +	[ "$2" = vrf ] && args+=(-I "$VRF")
> +	ip netns exec "$ns_s" nettest "${args[@]}" -s -p "$PORT" -t 3 -q &
> +}

[ ... ]

> +		for order in "unbound vrf" "vrf unbound"; do
> +			read -r first second <<< "$order"
> +			RET=0
> +
> +			start_server "$ver" "$first"
> +			pid_first=$!
> +			wait_listeners 1
> +			check_err $? "first listener did not start"
> +			start_server "$ver" "$second"
> +			pid_second=$!
> +			wait_listeners 2
> +			check_err $? "second listener did not start"
> +
> +			connect "$ns_c" "$ver" "$addr"
> +			check_err $? "VRF connection failed"

[Severity: Low]
Can the first server time out before the client's SYN arrives here?

start_server() gives each nettest a fixed -t 3. In nettest.c, do_server()
does a single select() with that budget right after listen(), and closes
the listener when it expires:

tools/testing/selftests/net/nettest.c:do_server() {
    ...
		rc = select(lsd+1, &rfds, NULL, NULL, ptval);
		if (rc == 0) {
			rc = 2;
			break;
		}
    ...
}

The first server's 3 second timer is already running while the script
does all of this:

  - finishes the slowwait poll
  - starts the second server through ip netns exec
  - polls until wait_listeners 2 sees two listeners (up to 2s)
  - starts the client through ip netns exec

On a slow or debug kernel (KASAN, lockdep) these steps can add up to
about 3s.

With order "vrf unbound", the VRF listener would then be gone. The
exempt port makes the unbound listener refuse the connection, so the
connect fails and rc_vrf is 2, even though the kernel behaved correctly.

With order "unbound vrf", the unbound listener exits early. The
check_timeout() on rc_unbound then passes trivially, and the subtest no
longer shows that the unbound listener was skipped.

If wait_listeners itself times out, check_err records it, but the
subtest still goes on to connect.

Would a server -t larger than the total wait budget avoid this?

> +
> +			wait "$pid_first"
> +			rc_first=$?
> +			wait "$pid_second"
> +			rc_second=$?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125-tcp-l3mdev-exempt-ports-v2-0-b920f3ff8f5e%40nexthop.ai
