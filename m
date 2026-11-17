Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932046;
	b=kgF4Q9UDvm0WE0eukQBUb6adsBmMmqJnIzvHQHlT9OPtcYfVpkIaB1eYYBYvSqxfYv6s
	 Jv7yCNokWNkEXL1bM7lUPyYsj50WX11/tIEh2wftoxY4NVnOdc7PCOSu6nLZyS5o4TQs/
	 St9aFd26RzPll7Oz18Or8OohlF113J6z3wyHKq0R3XM5UUeG/q0+uXntJWS5dvkgwgB7J
	 5+TIien60kII5nVrFXOi+gGA6LTldI0SIsJbsws5S3ZMGndGS43+WElG8MMxIUh5xZO3H
	 dvZYr+7wF/VhMctKIG0ZOzOuBHDPKk/+Jwq3EtfS97W7aCRsUar5qkSb0BAFN8U+QWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932046;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=HW3M2QrRHc3n1GK3RJRKy1yrUsd6CMKhaLE5Z9UJqrM=;
	b=uqtRhM6tQmh/u/+7fy5S2WiUv5rSz/n1x/CiNGzTiSrq3xT8qUj6FgdNy7NKTnGn5LnN
	 +r9eSxyRUomaVu9dwgdR9iuJJmI6ZwVUtzRkHf2WUraULPO8uaGrP7Cz4Nz/Q3WUk6doy
	 3c6wnIrzK8iQT6CUyxrFDriPoWity25nzsSX2qlvXMR/d9iNdtJoDvZE6O0VOCnVD6IKA
	 WrW8rsTqDVSmNw3vanT6cem5lTPS2N/QyFkwCM4GPCpgF411d0pLAvMrH53M7h1NzASDH
	 Qh/J5izzshRZG7njb+bkCQCdfHaJSp4M7bpZqL2vxEADlu7guwNatG1t0vIWZKdQQjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PSXkWR7g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EE2606A331;
	Tue, 17 Nov 2026 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PSXkWR7g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5E81F000C7;
	Tue, 17 Nov 2026 16:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794932046;
	bh=HW3M2QrRHc3n1GK3RJRKy1yrUsd6CMKhaLE5Z9UJqrM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PSXkWR7gP0357vG+MFlvzIduH/v2h5b+qJldoYlm3qzHqcXrhiAeUBg5bb6MOOdsD
	 GAU54BRJSdYCG5xGT+2K+vCCx07QAFanR2n3+/iyHc/HH1XUybLx4bHpy8cYAPfhAy
	 kNQ3//c8d6fzi1Sl1dFQMKV3qsOZPep8FNXzuzxX+n5HFqWyTpWajEzuA9nLsBBLLU
	 ISD0Cy4KsdE8YpWYHDLMObxrddxvVYE6McZs06tRAOCzavGOjdk2d0J2t1QjcPRlHi
	 Ycm1SeXY35W5CljWrpGHZXDIqvNyTxPvoNINEm9P5rHHcAZYy8kF2xAby7/LubtToH
	 aA52F8L5KuC5g==
Subject: Re: [PATCH net v4 2/2] selftests: net: add a test for vxlan snooping
 moving a MAC
From: netdev-bot+sashiko@kernel.org
To: ilskdw@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 kuniyu@google.com, mschiffer@universe-factory.net, nicolas.dichtel@6wind.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 17 Nov 2026 16:14:05 +0000
Message-ID: <179493204551.3136.7774320767698888409@kernel.org>
In-Reply-To: <20261113155133.75090-3-ilskdw@gmail.com>
References: <20261113155133.75090-3-ilskdw@gmail.com>
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

- [Low] In tools/testing/selftests/net/test_vxlan_snoop_move.sh,
  ping_from_cpu0() (lines 23-28) runs every ping as `taskset -c 0 ip…
- [Low] test_move_behind_router() (line 45, `setup_ns sw ex a r b`) and
  test_move_to_link_local() (line 102, `setup_ns sw ex a b`) ignore the…

--

selftests: net: add a test for vxlan snooping moving a MAC

This adds a selftest for a learning VXLAN device that snoops a known MAC
moving to another VTEP. The first case moves the MAC from an on-link IPv4
remote to one behind a router. The second moves it from a global IPv6
remote to a link-local one. Both cases ping from CPU 0 because the route
cache is per CPU.

> diff --git a/tools/testing/selftests/net/test_vxlan_snoop_move.sh b/tools/testing/selftests/net/test_vxlan_snoop_move.sh
> new file mode 100755
> index 0000000000000..e8c91fbccf6a3
> --- /dev/null
> +++ b/tools/testing/selftests/net/test_vxlan_snoop_move.sh
> @@ -0,0 +1,161 @@

[ ... ]

> +ping_from_cpu0()
> +{
> +	local ns=$1; shift
> +
> +	taskset -c 0 ip netns exec "$ns" ping -c 3 -W 1 -i 0.2 "$@" &> /dev/null
> +}

[Severity: Low]
What happens in ping_from_cpu0() if CPU 0 is not in the allowed affinity
mask? That can happen under a cpuset that limits the run to CPUs 2-3, or
when CPU 0 is offline.

In that case sched_setaffinity() would fail with EINVAL. taskset would
then exit non-zero and ping would never run. Both tests do this:

	ping_from_cpu0 "$ex" 192.168.0.10
	check_err $? "ping before the move failed"

check_err() records ksft_fail, so log_test() reports FAIL instead of SKIP.

The only precondition check is at the end of the script:

	require_command taskset

That goes through check_command(), which only runs command -v taskset.

Could the script probe first with something like taskset -c 0 true and
skip if it fails? Another option is to pick a CPU from the current
affinity mask.

For what it's worth, srv6_iptunnel_cache.sh also hardcodes taskset -c 0.

> +
> +add_sw_port()

[ ... ]

> +test_move_behind_router()
> +{
> +	RET=0
> +
> +	setup_ns sw ex a r b
> +	defer cleanup_ns "$sw" "$ex" "$a" "$r" "$b"

[Severity: Low]
Should test_move_behind_router() check the return value of setup_ns
here?

If ip netns add fails, setup_ns() in lib.sh cleans up the namespaces it
has already created and returns $ksft_skip:

	if ! ip netns add "${!ns_name}"; then
		echo "Failed to create namespace $ns_name"
		cleanup_ns "${ns_list[@]}"
		return $ksft_skip
	fi

The test keeps going anyway, but $sw, $ex and the other variables now
name namespaces that no longer exist. Every later ip -n, bridge -n and
ip netns exec command fails. The ping and fdb checks then call
check_err(), and log_test() reports FAIL instead of SKIP.

test_move_to_link_local() has the same problem with setup_ns sw ex a b.

A few existing tests, including bareudp.sh, fou_gre_gro.sh and
nsh_gso.sh, check the setup_ns return value with ||.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113155133.75090-1-ilskdw%40gmail.com
