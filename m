Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082065;
	b=jc8owevNnu8a6WZUczLt1J3ytmDotdkbTXeeRD4IVMTxotnpXtfP1JdaxEq7n+JkY7Pj
	 yE6vh+Zqhox87pyNAG3fz0cHqESY/VkI72kDoxsJLrPFO+UBPbkkmsNgucmQeLD4/T6xU
	 hCLqcuVbyvhsVWjUI7dHQVV8Zpm9KZmORICly8ttZRUk8DGC+1IWyxkXtFhEaKUTBsy95
	 24TsjLhwxzfBXQwMhbR/qSY7jwDwhdCygG2LPwgPyDlNix1gY/8vqx0I0foxutS4VQaV3
	 oW5QttCs1vS8AT/XV/R1lSw4orvLGp+gMIIb0Fw8dyhTg+pgR0R1i3bArcrsBwQWMeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082065;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=iaaigDaoiSglzrhEIeaHh66YbhLhyJ2puYJ5HUmv1e0=;
	b=aIgMPhw8M+lVEFXGDsaxycjvsiPDaOR9U9NMlfx55dKv08ROSb6mKtr/RjXEwJkm4/eO
	 jA4vuwdD8AZn1T2sX7KQoHs9KLGDzXhKBQcLcSKsu3jEMUi1zNsEm+4yl2VSCUcRcBrZs
	 rr8S3S6gy9f3xLsDyblOy2na4NGlrP/BOL4OnknlrP2LgQo/JzjGJvOtLv0rVfaDUvOjD
	 c0RQjfSy4gCLkVeBKO2kvgR+1kigt5w+1vMoZ0XlPYLpeEchFO3GJS7t4vQSgWGBakt5G
	 /tnX3ExWTEEELccXKbiBD0/pyU2hw2W5ZCzuLquN0L6jfCGkxwfD4CnHt7h0piIf39g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oEOnirph;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1500C606A334;
	Thu, 19 Nov 2026 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oEOnirph
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33711F000C4;
	Thu, 19 Nov 2026 09:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082064;
	bh=iaaigDaoiSglzrhEIeaHh66YbhLhyJ2puYJ5HUmv1e0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=oEOnirphtLD2ym8ndUD5y9NGkptBl4tKNArxdXKspI1a9DtmYp58Mra290JLMoIKn
	 7DNXNG9lsiZXTGUbc8OJpmErXaF8hKn04pQ9qT238U9NovGVPWmuETVwd+fI3TSdyP
	 9yk/3S1iSb5LdvG0DldDusuKJOtWE/nF8YYJ5YbiPKj3NojngtjNVHOmkK2gh3xE6h
	 cxisi27LS8Z7cFPkV8Gs7brSdQQkNeGDFNeLFj4rG74tO2MSTdk6MyLJgDv6p0ULX/
	 gshqrTF6JW9oh0E+Wd6fyWBzU9nB+QWtExxCoUXoJGP4VOvXZDLytb9p2oqH+a89+u
	 KII5WurvwVwhg==
Subject: Re: [PATCH net v2 5/5] selftests: drv-net: stats: query timestamping
 stats while down
From: netdev-bot+sashiko@kernel.org
To: dimitri.daskalakis1@gmail.com
Cc: davem@davemloft.net, alexanderduyck@fb.com, kuba@kernel.org,
 kernel-team@meta.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 pabeni@redhat.com, shuah@kernel.org, hmohsin@meta.com,
 mike.marciniszyn@gmail.com, sdf@fomichev.me, bobbyeshleman@meta.com,
 bjorn@kernel.org, leitao@debian.org, horms@kernel.org, almasrymina@google.com,
 vadim.fedorenko@linux.dev, daskald@meta.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Thu, 19 Nov 2026 09:54:23 +0000
Message-ID: <179508206338.3136.8445234401487583362@kernel.org>
In-Reply-To: <20261117215416.1901246-6-dimitri.daskalakis1@gmail.com>
References: <20261117215416.1901246-6-dimitri.daskalakis1@gmail.com>
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

- [Low] In check_down_ts_stats()
  (tools/testing/selftests/drivers/net/stats.py), if a counter present…

--

selftests: drv-net: stats: query timestamping stats while down

This patch adds check_down_ts_stats() to the drv-net stats selftest. The
test reads timestamping stats over ethtool netlink before and after taking
the link down. It then checks that no counter went backwards.

> diff --git a/tools/testing/selftests/drivers/net/stats.py b/tools/testing/selftests/drivers/net/stats.py
> index b08e4d48b15ce..e61db30b51817 100755
> --- a/tools/testing/selftests/drivers/net/stats.py
> +++ b/tools/testing/selftests/drivers/net/stats.py
> @@ -220,6 +220,28 @@ def check_down(cfg) -> None:

[ ... ]

> +    ip(f"link set dev {cfg.dev['ifname']} down")
> +    defer(ip, f"link set dev {cfg.dev['ifname']} up")
> +
> +    stats2 = ethnl.tsinfo_get(req).get("stats", {})
> +    for k in stats:
> +        ksft_ge(stats2[k], stats[k], comment=f"{k} went backwards on device down")

[Severity: Low]
What happens here if a counter that was reported while the link was up is
missing from the reply after ifdown?

The kernel only puts counters in the reply when the driver filled them in.
tsinfo_prepare_data() resets every counter on each query:

net/ethtool/tsinfo.c:tsinfo_prepare_data() {
    ...
	ethtool_stats_init((u64 *)&data->stats,
				   sizeof(data->stats) / sizeof(u64));
    ...
}

Then tsinfo_put_stat() skips any counter that is still unset:

net/ethtool/tsinfo.c:tsinfo_put_stat() {
	if (val == ETHTOOL_STAT_NOT_SET)
		return 0;
    ...
}

So the second reply can contain fewer keys than the first. When that
happens, stats2[k] raises KeyError before ksft_ge() runs.

This already happens with wangxun ngbe/txgbe. On ifdown, ngbe_close() and
txgbe_close() call wx_ptp_stop(), which does:

	if (wx->ptp_clock) {
		ptp_clock_unregister(wx->ptp_clock);
		wx->ptp_clock = NULL;
		...
	}

After that, wx_get_ptp_stats() fills nothing while the link is down:

	if (wx->ptp_clock) {
		ts_stats->pkts = wx->tx_hwtstamp_pkts;
		...
	}

ksft_run() catches the KeyError and still marks the test as failed. The
output is a Python traceback, though, and not the "went backwards on device
down" message.

Would it be better to check that the key is present first, for example
with ksft_in(k, stats2, ...), before calling ksft_ge()?

Also, when ETHTOOL_FLAG_STATS is set, tsinfo_fill_reply()->tsinfo_put_stats()
always adds the stats nest to the reply. The {} default in
.get("stats", {}) therefore never takes effect, and it can be dropped.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117215416.1901246-1-dimitri.daskalakis1%40gmail.com
