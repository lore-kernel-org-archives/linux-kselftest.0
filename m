Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192003A1687;
	Sat, 10 Oct 2026 21:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791668628; cv=none; b=UCsyiyYLNOUK30PDvrueS3yw27l4l6zeKHeejc59tLjHdk+Y0bUnEouRxoaMfuCnk4fQ1JrfC/cN71LUblU7O6i2/drP0wyc3Y3YUcIEAYpoyrPPE3MzPaQ3DV/vZQ9FQzJm76icEY9GLsaKp1CEHAlED9Hdf+wWNunBwFMvURA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791668628; c=relaxed/simple;
	bh=aC59iIni46oA6M4NH2YNFUMq4Ie8JtxCvLc9HFdkKCo=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QEFnsfs07p+3eSBBknXm2xz2Ww6Km6pEWFygp6Haz5tzJZtNBpF1fr5CdDYLXqhq9Fm/VPhvAWJNBV0BFtVX4jkF/hMZg/wNQLTXwnuGB47sX1STP9axvMpuytrnM9EZzMVB7dLbaVAy4WNANTKubv2UPuXTt2SCpQYlw99fwEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGCV/ksZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGCV/ksZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8C01F00893;
	Sat, 10 Oct 2026 21:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791668626;
	bh=po7STztVxdmjeFKOSSAFKvoqBdHgLSGwV5Bl7PgmJpc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=oGCV/ksZWDbIRpykHf9JQH1e9Ovv85wdTi5tOL3jIEqBS+aSxG3F3FQJmw5jCIJfe
	 xb4EX7YHH2/kKIJIbxf+l1rwR2bQLR9TveswlhM6xKeP8XagOqTiZLU/QqoJhC9IJv
	 C/gNMZD2UIvJIelMddZQlP4TyHQ4isg+zZMqyTWFbnTMyV6oQRIZHyE2+BiC0Jy5Jp
	 Lu4RtzfEs77aNvGI1+yxGwUHVIpLPVyHDSLVHLH/ozHDnqYHwKzdF8MBbFqwWCOEW0
	 Z59ShduU7racKboiqR/FnhFk7Yt/rugByrMHPWYS3ORSvnq5VxIy9uJdf3zRkOqjfB
	 LyZ/tciLKUmjA==
Subject: Re: [PATCH net-next v2 4/7] psp: add core tracked stat for
 outstanding tx keys
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: kuba@kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, donald.hunter@gmail.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Sat, 10 Oct 2026 21:43:45 +0000
Message-ID: <179166862537.434549.3280314687131205952@kernel.org>
In-Reply-To: <20261009-psp-v2-4-5596ab50f677@gmail.com>
References: <20261009-psp-v2-4-5596ab50f677@gmail.com>
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

- [Low] psp_dev_tx_key_del() (net/psp/psp_sock.c) calls
  psd->ops->tx_key_del(psd, pas) and then always decrements…

--

psp: add core tracked stat for outstanding tx keys

This commit adds a core-maintained tx_key_cnt to psd->stats. The counter
goes up when tx_key_add() succeeds and down in psp_dev_tx_key_del(). It is
reported to userspace as tx-key-count, but only for drivers that use an
SADB, and psp_dev_unregister() warns if any keys are still outstanding.

> diff --git a/Documentation/netlink/specs/psp.yaml b/Documentation/netlink/specs/psp.yaml
> index f3266763c3253..d14c11d098914 100644
> --- a/Documentation/netlink/specs/psp.yaml
> +++ b/Documentation/netlink/specs/psp.yaml
> @@ -190,6 +190,13 @@ attribute-sets:
>          doc: |
>            Number of PSP packets for transmission with errors.
>            Device statistic (from the PSP spec).
> +      -
> +        name: tx-key-count
> +        type: uint
> +        doc: |
> +          Current number of Tx keys installed on the device.
> +          Only visible if the driver stores keys on device.
> +          Kernel statistic.

[ ... ]

> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> index d21f7afd830a3..c458bc551b4b9 100644
> --- a/net/psp/psp_sock.c
> +++ b/net/psp/psp_sock.c

[ ... ]

> @@ -105,6 +107,8 @@ static int psp_dev_tx_key_add(struct psp_dev *psd, struct psp_assoc *pas,
>  void psp_dev_tx_key_del(struct psp_dev *psd, struct psp_assoc *pas)
>  {
>  	psd->ops->tx_key_del(psd, pas);
> +	if (!WARN_ON_ONCE(!psd->stats.tx_key_cnt))
> +		psd->stats.tx_key_cnt--;
>  }

[Severity: Low]
Is tx-key-count really the number of keys installed on the device? The
YAML doc says "Current number of Tx keys installed on the device". The
commit message says it counts keys "from the hw's perspective" and can show
whether "a device is approaching its SADB capacity".

struct psp_dev_ops::tx_key_del returns void, so psp_dev_tx_key_del()
decrements the counter whether or not the device actually freed the entry.

In mlx5, which is the only SADB driver, the delete path drops any firmware
error:

drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp.c:mlx5e_psp_assoc_del() {
    ...
	nkey = (struct psp_key *)pas->drv_data;
	mlx5_destroy_encryption_key(priv->mdev, nkey->id);
	atomic_dec(&psp->tx_key_cnt);
}

drivers/net/ethernet/mellanox/mlx5/core/lib/crypto.c:mlx5_crypto_destroy_dek_key() {
    ...
	mlx5_cmd_exec(mdev, in, sizeof(in), out, sizeof(out));
}

The call path is psp_assoc_free(), psp_deferred_del_work() or
psp_deferred_del_uninit(), then psp_dev_tx_key_del(), then
mlx5e_psp_assoc_del(), then mlx5_destroy_encryption_key().

If MLX5_CMD_OP_DESTROY_GENERAL_OBJECT fails (bad status or timeout), the
DEK can stay allocated on the device while tx_key_cnt still goes down. In
that case the stat would read lower than real SADB occupancy.

The counter still catches missing tx_key_del calls in the core. It does
not catch failed deletes on the device side.

Should the doc and commit message describe this as a count of keys the
stack believes are installed? The alternative would be for tx_key_del to
return an error, so the core can skip the decrement when the device-side
delete fails.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009-psp-v2-0-5596ab50f677%40gmail.com
