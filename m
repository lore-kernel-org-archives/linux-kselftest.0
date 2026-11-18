Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012342;
	b=lOkG8fA4SN7OTUVnbERaW0vzSvj1quz7wPoqRAKt4Ppf9l7bhgpbyDBm2Zmnu1CwrYo5
	 IcEED2R1pUHMIAjNs8Uss98L72jgGUSZmdM3+XaHYkqIvLJ9YGmvK9XxHehj17s+MivyX
	 uaIiFG6NeBJPvLm+9BDJvknEOrnl1gGF0SxxbwbcRcprvaPgb9do7aSh7m5ToIidgAw7r
	 jaBfS0TRy29YLbrnP8RgRewg7TJ8HVkB66glcehft2q9S087fKrrhuMAFiJLX8XvXaqz/
	 JbdLTnm2eXdJ2xkDKTc4URR/Q8DNtC4YNahOO9oK3RWqYq/gggYLJVAp5a+Cnr+QWTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012342;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=HhclmHafCvRpxkVZZy1FUjsyN3cMPvpw1MvnobE5Sak=;
	b=AHLBd5bbD1Q6136dMxDJSiPZogADPUVM9QyWFBVvO3TIzWbljSXq+J9GWrGmMZLaGdF2
	 dKH+xoJzaExZ87862vBvp0BCEcdy+5Z/SiocwH41n4ghAU0TjHaSr88rqt0im/fntp0Dz
	 ikFkkT6ruiSdhpPnKmJoqYbe/rN8OUaoI+7RFHC2oXMMy2uayanwgSFFcSbPv4oAOjTHO
	 Vuw2KijADCxA8eAvrsnDPSWKZ7LgefQ7iqY7QgTHEIRQjrgvY7ZX/heu3127KnRTeDnLZ
	 qiaWRAfSZcHetavHacjNAVKa0vASxns4pr7BnBW73iuX2Lrcgvgfbg5sRJuio5KrdHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BI5g5+rN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05495606A337;
	Wed, 18 Nov 2026 14:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BI5g5+rN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161D81F000CB;
	Wed, 18 Nov 2026 14:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012341;
	bh=HhclmHafCvRpxkVZZy1FUjsyN3cMPvpw1MvnobE5Sak=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BI5g5+rNvREe9vzS+4y19knK4uGcLOuYNk9n9wj+TnFzBl+dO11XG+J3hUemgw1yw
	 PUWbM49kfT5hOgseEVfCnHXbnY3Idz8deiwSxEeDT3hV9116MgMARm2pk0ozAmADlF
	 mT/27uX4LPjGEJeQNiRCCpNW4Pz/v48/O6Ikv9wgGK/P9XT2TKKxCjsZ3KbLR6mbuh
	 ABLnlxQHeqN0ISPvEWOXq2UKAyvK02kqcNYpEnkanSrVMb9OI2+857umhq/gdkbWnf
	 ydFV9kayykt1RnPBXCqFHvGUd6TslU3G/WnMaAxWeJBGdnBkxiFOqdy/ZAJTLuXC3g
	 tgr2/rswBpBow==
Subject: Re: [PATCH net-next v2 2/2] selftests: drv-net: run tls_hw_offload on
 netdevsim
From: netdev-bot+sashiko@kernel.org
To: jiayuan.chen@linux.dev
Cc: netdev@vger.kernel.org, kuba@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 john.fastabend@gmail.com, sd@queasysnail.net, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Wed, 18 Nov 2026 14:32:20 +0000
Message-ID: <179501234066.3136.14918473890361031397@kernel.org>
In-Reply-To: <20261117140642.4008-3-jiayuan.chen@linux.dev>
References: <20261117140642.4008-3-jiayuan.chen@linux.dev>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In read_nic_stats(), the `ethtool -S` skip is keyed on whether
  the env created netdevsim itself (`if cfg.get_local_nsim_dev(): return…
- [Low] In netdevsim mode the comments in tls_hw_offload.py describe
  behaviour that no longer applies, and the patch doesn't update them.

--

selftests: drv-net: run tls_hw_offload on netdevsim

This commit lets tls_hw_offload.py run on the default netdevsim pair by
dropping nsim_test=False from the NetDrvEpEnv call. netdevsim does not
implement ethtool -S, so read_nic_stats() now returns an empty stats dict
when the environment created the netdevsim device itself.

> diff --git a/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py b/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py
> index e720ce6547610..1197f17caa13c 100755
> --- a/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py
> +++ b/tools/testing/selftests/drivers/net/hw/tls_hw_offload.py
> @@ -125,6 +125,9 @@ def read_nic_stats(cfg):
>      # before/after-delta caveat as read_tls_stats(): these are device-wide,
>      # so concurrent kTLS traffic on this NIC would perturb the deltas.
>      stats = defaultdict(int)
> +    # netdevsim has no ethtool -S, and the NIC counters below are optional
> +    if cfg.get_local_nsim_dev():
> +        return stats
>      output = cmd(f"ethtool -S {cfg.ifname}").stdout

[Severity: Medium]
Does this guard cover a netdevsim interface that is passed in through
NETIF?

get_local_nsim_dev() returns self._ns. That is only set when NetDrvEpEnv
creates the netdevsim pair itself, i.e. when NETIF is not set. If NETIF
names a netdevsim port (for example a hand-made pair with
REMOTE_TYPE=netns), it returns None and the guard is false.

The cmd() call below then runs with the default fail=True. nsim_ethtool_ops
has no get_sset_count or get_strings, so ethtool -S exits non-zero. The
resulting CmdExitFailure propagates out of run_tls_test(), and every case
fails at the first NIC snapshot. This is the same failure the commit
message says it fixes.

Before the netdevsim TLS emulation existed, check_tls_support() skipped
such a device because it had no tls-hw-*-offload. This failure path is new
in this series.

Would it work to run ethtool -S with fail=False and return the empty stats
on a non-zero exit? That would handle any device without ETH_SS_STATS. It
would also avoid get_local_nsim_dev(), whose docstring discourages its use
because it makes tests nsim-specific. macsec.py does already use it to
skip steps, though.

>      for line in output.strip().split('\n'):
>          key, sep, val = line.partition(':')

[ ... ]

> @@ -307,7 +310,7 @@ def test_tls_offload_record_type(cfg, record_type):
>  
>  def main() -> None:
>      """Set up the DUT/peer environment and run the offload test suites."""
> -    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
> +    with NetDrvEpEnv(__file__) as cfg:

[Severity: Low]
Now that netdevsim mode is enabled here, are some of the existing comments
in tls_hw_offload.py still accurate?

The header comment in drivers/net/netdevsim/tls.c says no crypto is
performed:

/* Emulated kTLS offload.  No crypto is performed: TX puts the record on the
 * wire as plaintext and RX marks it decrypted, so the RX side has to be
 * offloaded on netdevsim as well, otherwise the core runs the software AEAD
 * over plaintext and fails the connection with -EBADMSG.

So in nsim mode the peer's RX also has to use the netdevsim offload. The
current run passes because the peer is also a netdevsim port with RX
offload enabled. Several comments in the test say otherwise.

The run_tls_test() docstring says:

    The DUT (local) is the kernel under test; the remote is just a traffic
    source/sink and may run any kernel without HW offload. Both sides run
    kTLS because TLS is pairwise, but verify_tls_counters() requires HW
    offload only in enabled DUT directions. The peer and the DUT's other
    direction may use SW kTLS.

The comment in read_tls_stats() says:

    # sock_net(sk)). The test runs on a real NIC in the host namespace, so

The comment above HW_NIC_COUNTERS says:

#    the NIC encrypted anything; a broken HW encrypt shows up instead as a
#    peer TlsDecryptError or an echo mismatch.

On netdevsim, a peer TlsDecryptError would mean the peer did not get RX
offload. It would not mean the DUT encrypted badly.

The commit message also says:

    Everything the test checks on the DUT, device MIB counters,
    echo data and record types, works there as is.

On netdevsim, though, the test only covers the kTLS device control and MIB
paths, not encryption. Could the comments and the commit message be
updated to describe the netdevsim case?

>          cfg.bin_local = cfg.test_dir / "tls_hw_offload"
>          cfg.bin_remote = None
>          cfg.tls_skip_reason = None

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117140642.4008-1-jiayuan.chen%40linux.dev
