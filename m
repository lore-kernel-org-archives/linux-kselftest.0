Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157485;
	b=y0M6JqSjH2ZSZkre2/aaAftHGkVwgGdN2HSJvLROCwEjzZAOciwexv9kDNd8SDaCkwLn
	 SUHOkci+ve2W/wJwV+iQ3q6/bdWeVq//gZwDrsuhJUGYWb98xVyI9aDWjlNSdW7HKhErH
	 4ghK4Ey1L0Y4JLEwqw02sEJ1D2e1ufhbG+J/meenEQe4qHRXrOHYHpa/f8TXZsBpDW1AE
	 w1EEAhOaCb077So/36t+gckNso6Gl8eOfFTtmofdIIFrb3p1Q/6M9Q70kLoWl16lDiVl3
	 RopmC8zD6rRkCHiDDhODxv94C6CAMt5w2ycmhlXlWQwUwSfSIPLSfVCmz7ymfvqV1qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157485;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=1g1qowK/Vhy/51ATJ4wve21dh0EgoCYYqHxYRokZ4Cs=;
	b=GuBgUrY5u95keMtz6o9EDvLQGBUR42NgIIVvWnv8BSEZ5+w259fVsW6S8afM0cj0KKeW
	 MVwpp3krF9pClXBD4YRvnqCv6q9NpGYdoTou3O7ugc5sU8PRPHheqLDnxhYJeWdffuifm
	 BKSy7hyQ4cdEcFw7sp9nzWr++mU3ng2+A+/yP7lfJcOVypHSzMtrHSJvV6OoNTQImD++S
	 dcfOlz8ZNe/set8iMg/UBPvUH2IzRTuA1+7UhswGCdbVrKnH4l8rmGsfiJdov27pCudS/
	 FFH1iOHQIzssepbRvitvbIXsu1XTzg3J6n5mhCdVODVyOlJ50R2QER6PsFYuIgHuBRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TyGyL+pv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C36A606A33E;
	Fri, 20 Nov 2026 06:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TyGyL+pv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F361F000C4;
	Fri, 20 Nov 2026 06:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795157484;
	bh=1g1qowK/Vhy/51ATJ4wve21dh0EgoCYYqHxYRokZ4Cs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TyGyL+pvUVyjqSzJMtV6EH6roUrKZbb9TejLfSQgNn6/Cg+1TDAJmvomZIhnT7+7E
	 tUSgd3y/cyEkt263xOaPoa9E2ZNvcFsVI28ztYrjNHqxlrIr7HsTg8hgUQgTlrWknv
	 F/O0aqOs1yTlQ/E+hUqX1LiRNxZNWTshEubFMqBXOZSssGfuNaJIPV6N07KuXAzlr0
	 8vpGB1SKBdKwhokLEzPq1botFI2N4m9D05PWC+4smWR3/ympqz/kPcoyR/LOW/N6CR
	 LEvfZR07SblM3XdBCzVjg6Kl+ueNDvtUdPPNPLVMZ5quM5slrC23usEsPVbJD9nWCn
	 KlNYaaag13SYA==
Subject: Re: [PATCH net-next v3 2/2] selftests: drv-net: run tls_hw_offload on
 netdevsim
From: netdev-bot+sashiko@kernel.org
To: jiayuan.chen@linux.dev
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 john.fastabend@gmail.com, sd@queasysnail.net, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Fri, 20 Nov 2026 06:51:23 +0000
Message-ID: <179515748385.3136.10275675955381531740@kernel.org>
In-Reply-To: <20261119064902.242502-3-jiayuan.chen@linux.dev>
References: <20261119064902.242502-3-jiayuan.chen@linux.dev>
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

- [Medium] In read_nic_stats()
  (tools/testing/selftests/drivers/net/hw/tls_hw_offload.py:128-131),…
- [Low] Several comments still describe a real-hardware-only setup, but
  after this patch the default run (no NETIF) uses a netdevsim pair that…

--

selftests: drv-net: run tls_hw_offload on netdevsim

This drops nsim_test=False from tls_hw_offload.py, so the test runs on the
default netdevsim pair when NETIF is not set. It also makes
read_nic_stats() skip the ethtool -S snapshot when a local netdevsim
device was created by the environment.

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
Does this guard check the right thing? The comment is about the driver,
but get_local_nsim_dev() only returns self._ns. That is set only by
create_local() when NETIF is not in the environment:

tools/testing/selftests/drivers/net/lib/py/env.py:NetDrvEpEnv.__init__() {
    ...
        self._ns = None
    ...
        if "NETIF" in self.env:
            if nsim_test is True:
                raise KsftXfailEx("Test only works on netdevsim")
            self._check_env()
    ...
}

If NETIF names a netdevsim port, self._ns stays None. The test then falls
through to cmd("ethtool -S ...") with the default fail=True. netdevsim
has no get_sset_count, get_strings or get_ethtool_stats, so ethtool exits
non-zero and cmd() raises CmdExitFailure. run_tls_test() does not catch
it, so all 8 variants fail at the first snapshot. Any other TLS-offload
netdev without ethtool stats would fail the same way.

The test header already says these counters are optional:

    # counters. Each counter is checked only when present.
    ...
    # Missing NIC crypto counters remain optional.

The get_local_nsim_dev() docstring also discourages this kind of use:

    Using this method is discouraged, as it makes tests nsim-specific.
    Standard interfaces available on all HW should ideally be used.

Would a driver-agnostic check be simpler? For example, run ethtool -S
with fail=False and return the empty stats dict on a non-zero exit. That
would cover the default nsim pair, NETIF=netdevsim and any stats-less
driver, with about the same amount of code. The commit message mentions
the NETIF case but doesn't say why the environment check was chosen
over a capability check.

[ ... ]

> @@ -307,7 +310,7 @@ def test_tls_offload_record_type(cfg, record_type):
>  
>  def main() -> None:
>      """Set up the DUT/peer environment and run the offload test suites."""
> -    with NetDrvEpEnv(__file__, nsim_test=False) as cfg:
> +    with NetDrvEpEnv(__file__) as cfg:

[Severity: Low]
This isn't a bug, but with netdevsim now the default environment, a few
comments still describe a real-hardware-only setup. Should they be
updated?

The comment in read_tls_stats() says:

    # sock_net(sk)). The test runs on a real NIC in the host namespace, so

The header of tls_hw_offload.c says:

    * Tests kTLS hardware offload between two physical nodes using

The run_tls_test() docstring says the remote:

    source/sink and may run any kernel without HW offload. Both sides run

On netdevsim this isn't true. drivers/net/netdevsim/tls.c says:

    /* Emulated kTLS offload.  No crypto is performed: TX puts the record on the
     * wire as plaintext, so the RX side has to be offloaded on netdevsim as
     * well, otherwise the core runs the software AEAD over plaintext and fails
     * the connection with -EBADMSG.

So on the default nsim path, the peer has to receive with HW offload.
If its RX offload were turned off, the test would fail, even though the
docstring says that setup is allowed.

>          cfg.bin_local = cfg.test_dir / "tls_hw_offload"
>          cfg.bin_remote = None
>          cfg.tls_skip_reason = None

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119064902.242502-1-jiayuan.chen%40linux.dev
