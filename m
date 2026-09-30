Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C264CCDC1;
	Wed, 30 Sep 2026 12:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769965; cv=none; b=Z2PcUkBlbP55AXsWUfTsdvfHk9g8qgReBv6y4dKIPyRGX4CuPKiJjJ+DTGHbxwRlprDoAhA5Al2hwBIqBR1z3aH5DQuUGA0LbmsNj+Uvk4fjrX67zc8W4O8SU9AidXIUBt04mmh2RFyC4D0sOfIGIKZuIWbZ7tjBX6IKb9fW2FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769965; c=relaxed/simple;
	bh=buBf7t9Hn6EBP0vAciAAVetVActYmbebNI7mVh5g4oo=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nwyTHOUBm6tVgZJMQPJe2wTLMsDBl/jTXNqe5B3nDe12vXCrMnyrg3mr4HzMWZNbHSZy5oZDoHeBj95z/Rs/X+FMrzNSF42dLG5HXsJaZlCMqAeAKt8TOIh6FKph4XoZoSXWlSZcByrdlXfseeuUgrWJGUfbeAR+/VtKxgyNjXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aytuilX+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aytuilX+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4901F000FF;
	Wed, 30 Sep 2026 12:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790769963;
	bh=8nNtuJZdcWbpoaJYlOZyiCIkleDqMmN5g1ivBvMT0rQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aytuilX+0FO6M/0ru752d7Xv7MoofxyAiHYqkWFI64N/XgsFoC92jl7+LYapkyYgx
	 txtXm2t7odGuKhdKSoBCzJVeb2oAzyiu2b5pC3RGqWd5xV7lsLbap+dIATZz8nDa02
	 HGN/7PHSzxJ1WkZkxWy9WFBRzZvGfu/n3ylKVO+3EQQonrVpkzyDC7CW/+6sH1EXkS
	 WAPX8TGN/WyxLZTYeRS+Px4JgFO1swoCggUVGaxaU7Ruyy9JXJwrWxafuB3E7OFr8m
	 rNS9WqrGnzwsxpTgNKIfIWkgbeaZWMCO/CJoSUGpKnHZ4v1rKLf9XoAwdAgfmh/kLT
	 Slf6Zl/nODSMA==
Subject: Re: [PATCH net] macsec: check the resolved SCI for duplicates
From: netdev-bot+sashiko@kernel.org
To: haseebulhaq55@gmail.com
Cc: sd@queasysnail.net, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 shuah@kernel.org, hannes@stressinduktion.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 30 Sep 2026 12:06:02 +0000
Message-ID: <179076996248.434549.3813789807508446133@kernel.org>
In-Reply-To: <20260927-fix-macsec-duplicate-sci-v1-1-085bd742c8e9@gmail.com>
References: <20260927-fix-macsec-duplicate-sci-v1-1-085bd742c8e9@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The two new tests, test_duplicate_sci() and
  test_undefined_sci() in tools/testing/selftests/drivers/net/macsec.py,…

--

macsec: check the resolved SCI for duplicates

macsec_newlink() now passes macsec->secy.sci to sci_exists() when checking
for duplicates, instead of the unresolved local sci. Before this change, an
all-ones IFLA_MACSEC_SCI request could create a second MACsec device with
the same transmit SCI on the same lower device. The commit also adds
selftests for duplicate rejection and for the all-ones fallback.

Link: https://lists.openwall.net/netdev/2026/09/16/11

> diff --git a/tools/testing/selftests/drivers/net/macsec.py b/tools/testing/selftests/drivers/net/macsec.py
> index 9a83d9542e04a..72ee1c6e146ee 100755
> --- a/tools/testing/selftests/drivers/net/macsec.py
> +++ b/tools/testing/selftests/drivers/net/macsec.py
> @@ -263,6 +263,52 @@ def test_offload_state(cfg) -> None:
>              "features should match first offload-on snapshot")
>  
>  
> +@ksft_variants([
> +    KsftNamedVariant("default", "", ""),
> +    KsftNamedVariant("explicit", "", "sci {sci}"),
> +    KsftNamedVariant("undefined", "", "sci ffffffffffffffff"),
> +    KsftNamedVariant("undefined_default", "sci ffffffffffffffff", ""),
> +    KsftNamedVariant("undefined_explicit", "sci ffffffffffffffff", "sci {sci}"),
> +    KsftNamedVariant("undefined_twice", "sci ffffffffffffffff",
> +                     "sci ffffffffffffffff"),
> +])
> +def test_duplicate_sci(cfg, first, second) -> None:
> +    """Reject duplicate transmit SCIs, including the undefined-SCI fallback."""
> +
> +    ms0 = _macsec_name(0)
> +    ms1 = _macsec_name(1)
> +    sci = _get_mac(cfg.ifname).replace(":", "") + "0001"
> +
> +    ip(f"link add link {cfg.ifname} {ms0} type macsec {first}")

[Severity: Medium]
Should test_duplicate_sci() and test_undefined_sci() check that the local
iproute2 supports MACsec before they create links?

Every other test in this file calls a _require_* helper first:

  test_offload_api, test_offload_state -> _require_macsec_offload(cfg)
  test_max_secy, test_max_sc           -> _require_ip_macsec_offload()
  test_vlan, test_vlan_toggle          -> _require_ip_macsec(cfg)

Each of these helpers raises KsftSkipEx when "ip macsec help" shows that
support is missing.

In test_duplicate_sci(), this first ip link add runs outside ksft_raises().
With an iproute2 that lacks MACsec, it raises CmdExitFailure and the case
is reported as a failure instead of a skip.

test_undefined_sci() has the same problem:

    ip(f"link add link {cfg.ifname} {ms0} type macsec port 2")
    ...
    info = ip(f"-d link show dev {ms1}", json=True)[0]
    ksft_eq(info["linkinfo"]["info_data"]["sci"], sci)

If info_data is not in the JSON output, indexing it directly raises
KeyError, which also counts as a failure.

In that environment, all seven new cases (the six test_duplicate_sci
variants plus test_undefined_sci) would FAIL, while the rest of the file
would SKIP.

Both tests use only the local host. Would a local-only check be enough
here, such as _require_ip_macsec_offload() or a local variant of
_require_ip_macsec()? The existing _require_ip_macsec(cfg) also checks
cfg.remote, which these tests don't use.

> +    defer(ip, f"link del {ms0}")
> +    with ksft_raises(CmdExitFailure):
> +        ip(f"link add link {cfg.ifname} {ms1} type macsec "
> +           f"{second.format(sci=sci)}")
> +        # Clean up if the kernel incorrectly accepted the duplicate.
> +        defer(ip, f"link del {ms1}")

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260927-fix-macsec-duplicate-sci-v1-1-085bd742c8e9%40gmail.com
