Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795861519;
	b=S9SaDjfTwVEqNEOtH0WZU+wSoyBWiK7GxwaQMm7auGZNDL8XyDap289YbipwUbuAyMk/
	 FTzI+8bora7bfHfQC2UBBYdGhF0WO/lWEwjwvLU9N1TrCYWbUpkbTE/ZNkiNyQG3m4L27
	 7aXfkgyG1nmyW2m0hKN5NIDrAEg3/LvCRIuSdf0yAAOoo/RDUaoYho1ASFjyDBf7FOCMj
	 jQjfnK6nYeD9+Y4KIHqxF6NSHKqDAUrATRVCXJrNkrjqsK5Ket4Ei79bsW+/Q6mD4t8WD
	 S7iSUn5HiJ7yniaA92qqKB2P0SHBNdRscUKLerSvVZNoh/XcQCxnWzn3BVam9QNggGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795861519;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=VY2l0xjOLwNl/vWxE6ifCQZY2eHn010i2nRNQ5w5xpI=;
	b=VAB7ljtpZ+K8I8Lkiksi4Rr1xGbMevH/jdvqzqA+GZcsxPk6EK10beoZ1M8sB0abhu5C
	 N72HMHiXbeCH3gKrNahh/0oeB+vKYJTBQFJda9Ufx4oV3qqbnYsM3m1GHnRe8Hr9JMGbD
	 5O6PK2vqnY8QJ2Gw9J0fPQfL5h1PQxz4+kXEqHfLadAZsMvZZwGsABLIFQBdKJMidBIgK
	 IWAaEbp5yhyRWE6hfb9u3W5fkSrHpEIQH4iR/ZSVeSGDxxIqpiXk5dzN+sYMtbRDzJWiV
	 Z6eV/VN3jzZPgfGfV2zXn2eV69B+7eCPxRD8h8IbPrGdl2/tUnIu352XSIdNIIgjQMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h8rHK1yG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F08B606A335;
	Sat, 28 Nov 2026 10:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h8rHK1yG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA5A1F00898;
	Sat, 28 Nov 2026 10:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795861519;
	bh=VY2l0xjOLwNl/vWxE6ifCQZY2eHn010i2nRNQ5w5xpI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=h8rHK1yG0nyHTDjDvM8yINTzVnZLAFuuFgcm7S75VrO4x9fnsPc/NLbOka+bBAoyj
	 jV/YegVw/b95b8UL8e4wZkP4gu3cUYK6aE3cJD2l3T7Z+IlPENDgRGpHoI3Kb+bizv
	 Z6b7b01iK706e60+j1eJeYyLtXwSPOHyTaQBK+QRX4NIh+YPbpJLoPCeYcibF13Eis
	 lvR4IHUaiCqWm57c+Fvi0L9GycM3w/ZxsyVbny9p/6zmrEydU53GZsGNdbQRSG0lUi
	 StttZ74+OePphODfCPS/tCXH4tz+utLXn9Xj45Ceh5gdQBKc9sQo2H+FuMohsi2FfJ
	 hWxwmO4igCAAw==
Subject: Re: [PATCH net v3 2/2] wireguard: selftests: remove a peer under load
From: netdev-bot+sashiko@kernel.org
To: apasichnik9@gmail.com
Cc: Jason@zx2c4.com, wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 28 Nov 2026 10:25:18 +0000
Message-ID: <179586151812.3135.2067343848576373135@kernel.org>
In-Reply-To: <20261127102243.49405-3-apasichnik9@gmail.com>
References: <20261127102243.49405-3-apasichnik9@gmail.com>
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

- [Low] With the in-tree default VM configuration, the new loop in
  tools/testing/selftests/wireguard/netns.sh (lines 210-222) will…

--

wireguard: selftests: remove a peer under load

This adds a loop to netns.sh that removes a peer ten times while a UDP
flood is running, and re-adds it after each removal. The goal is to catch
packets left on the per-peer receive queue that keep the peer alive. It
also raises CONFIG_LOG_BUF_SHIFT to 21 in the qemu kernel.config so the
created/destroyed object check sees the whole log.

> diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
> index a8f550aecb35d..8303802c02f27 100755
> --- a/tools/testing/selftests/wireguard/netns.sh
> +++ b/tools/testing/selftests/wireguard/netns.sh
> @@ -207,6 +207,20 @@ n0 iptables -F INPUT
>  ip1 link set wg0 mtu $orig_mtu
>  ip2 link set wg0 mtu $orig_mtu
>  
> +# Remove a peer while a UDP flood keeps its receive queue busy, then re-add it;
> +# packets left on the per-peer queues would keep it from being destroyed,
> +# which the created/destroyed check at the end catches.
> +for ((i = 0; i < 10; ++i)); do

[Severity: Low]
Will this loop catch a regression of the rx_queue purge in the default
selftest configuration?

The qemu Makefile defaults to a 4-CPU guest:

tools/testing/selftests/wireguard/qemu/Makefile:
    NR_CPUS ?= 4
    ...
        -smp $(NR_CPUS) \
    ...
    printf 'CONFIG_NR_CPUS=$(NR_CPUS)\n...

The commit message says that with four CPUs "the leak is hit much less
often, so NR_CPUS=1 is the configuration that checks for it". The leak
needs rx_queue to still hold more than one NAPI budget of packets at
napi_disable(). With several CPUs, the decrypt workers and NAPI usually
drain the queue first.

Nothing in the tree records this. No Makefile target runs netns.sh with
NR_CPUS=1. The comment above also says the leak is something "which the
created/destroyed check at the end catches", with no mention of the
single-CPU requirement.

As a result, a plain "make -C tools/testing/selftests/wireguard/qemu" run,
including in CI, would usually pass on a kernel where
peer_remove_after_dead() no longer calls peer_purge_rx_queue().

Could the comment or the qemu Makefile mention NR_CPUS=1? Alternatively,
could a single-CPU run be added so the check is exercised by default?

> +	n1 iperf3 -s -1 -B 192.168.241.1 &
> +	pids=( $! ); waitiperf $netns1 $!
> +	n2 iperf3 -Z -t 2 -b 0 -u -l 64 -P 4 -c 192.168.241.1 >/dev/null 2>&1 &
> +	pids+=( $! ); sleep 1
> +	n1 wg set wg0 peer "$pub2" remove
> +	kill "${pids[@]}" 2>/dev/null || true; wait "${pids[@]}" || true
> +	n1 wg set wg0 peer "$pub2" preshared-key <(echo "$psk") allowed-ips 192.168.241.2/32,fd00::2/128 endpoint 127.0.0.1:2
> +	n1 ping -c 1 -W 1 192.168.241.2
> +done
> +

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127102243.49405-1-apasichnik9%40gmail.com
