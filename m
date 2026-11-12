Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523743;
	b=DHaqgU0ktvmHOG1pWt1DECq7e0HVcpgf2bQy9TMWGIlXu0ZYjYiKhD3S7s4c/e5/YQUr
	 PwEERmlzXu0Wqh8YipZKgx8aawoUFrIn1hEOrZocltYUqE3PjVFsXtCRI+2hoBKgqorNu
	 VrBns7zH0203sPD3w4c2/gpe7uHxHkHs3MAsRLnCNY+u5wtp2XfbBJAI0XKPrsVQLPtp1
	 XeGbPrHU3xbFZl0tR/aA8TjL6zzkQO+m7JcUuZ3u2Ma6JAGMGIUfke66nEaWbiyHQFJRW
	 5pVrdeU26EQWNG4bL1KYtPX1MMxed+rDUxOHNjaRUPxs8SxVpw0u4+p73MLOCKSe/EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523743;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=GbRc4oId6LYe34THYRyu66PRGg8zCXpBZWRDZ3yETCo=;
	b=nCgERK7egNyslFDCX8y7Widude0n6nIy3Ciipkgu/p6G5gekIv9M4naboJlfm0cACauN
	 scwxL9gy1hbUTMwW6UwiWw1x9riJgWPkRNn/mep34nPkS0oEC+a2I6uuxF8fq4K5Lpkrm
	 LwOnxtIvXQDp6CsVmet9J/qnLujPGMCGOOCdIxb6hJJZHrYoFYcOAGHXP1xNrgU5emXc+
	 CT2lnGXkPRaQ9xUFXtATILHXAr6Lv5AuKrUeDCbAX3sdzOSwXDVEiiaH8JkHbfmfHbKNg
	 q2cnR5HD4Jj6VBv0QBnbLsDSHDRhXfyltRJGB0Nck1XmgK9X16a7VadB7JTVup8IqLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NLC1eLBI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09C8606A890;
	Thu, 12 Nov 2026 22:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NLC1eLBI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29BD91F000CA;
	Thu, 12 Nov 2026 22:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794523743;
	bh=GbRc4oId6LYe34THYRyu66PRGg8zCXpBZWRDZ3yETCo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NLC1eLBIsQcEMIYC4UALSZAP+eDj8jl+WS0MLatOxbw9swOzUPqlu0P84/xnkVR0M
	 Z5+c/fhQEK333cuIEhiAGcS1LpQap01c3Z1dUfaSVzTCRFQH1/I56Y21fsomswuSsG
	 gg2GSbDF8Sj4rNcuHgyBaYAXL0Es89FZTsZ3VVrjS37HzQ4LugNe1qfESLxLPrtyhb
	 d/kn3gzg0LviK3yvRsagYe+u3CoB8OQbtx/LjlbRVmKzsZUID3G7Ta4TBmiN1WMeut
	 VnCq8KBfmsCwUWDZ9dceOrM46X+RK2cCspYk3pBoVzNm9RrQmgg/VIk48RitZe0xCG
	 kN32mwtsAHjlg==
Subject: Re: [PATCH net-next v4 4/5] net: devmem: size TX net_iovs from the
 dmabuf sg table
From: netdev-bot+sashiko@kernel.org
To: sdf.kernel@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 horms@kernel.org, shuah@kernel.org, almasrymina@google.com, sdf@fomichev.me,
 leitao@debian.org, dtatulea@nvidia.com, asml.silence@gmail.com,
 bobbyeshleman@meta.com, daniel@iogearbox.net, razor@blackwall.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 12 Nov 2026 22:49:01 +0000
Message-ID: <179452374171.2199510.7419014613400346072@kernel.org>
In-Reply-To: <20261111224740.2744522-5-sdf@fomichev.me>
References: <20261111224740.2744522-5-sdf@fomichev.me>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch makes devmem TX net_iovs up to 2MB.

--

net: devmem: size TX net_iovs from the dmabuf sg table

This commit lets TX devmem bindings choose the net_iov size from the
dmabuf sg table. It uses the largest power of two between PAGE_SIZE and
2MB that aligns every DMA segment. netdev_nl_bind_tx_doit() now passes
niov_shift 0 to request this, so hugepage-backed udmabufs get 2MB TX
net_iovs.

> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index c6868f39261ad..7135280488971 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c

[ ... ]

> @@ -387,6 +400,17 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
>  		goto err_unmap;
>  	}
>  
> +	if (!niov_shift) {
> +		niov_size = SZ_2M;
> +		while (niov_size > PAGE_SIZE &&
> +		       (!IS_ALIGNED(dmabuf->size, niov_size) ||
> +			!net_devmem_sgt_aligned(binding->sgt, niov_size)))
> +			niov_size /= 2;
> +		niov_shift = ilog2(niov_size);
> +	}

[Severity: Medium]
netdev_nl_bind_tx_doit() now passes 0 here. That means a 2MB aligned,
hugepage-backed dmabuf gets 2MB TX net_iovs no matter which device it is
bound to. Can this produce frags that bnxt silently truncates?

Before this patch, every devmem TX frag was capped at PAGE_SIZE. Now
zerocopy_fill_skb_from_devmem() limits a frag only by niov_size - off,
the copy length and the iov length:

net/core/datagram.c:zerocopy_fill_skb_from_devmem() {
    ...
		size = min_t(size_t, size, length);
		size = min_t(size_t, size, iter_iov_len(from));

		netmem_inc_ref(net_iov_to_netmem(niov));
		skb_add_rx_frag_netmem(skb, i, net_iov_to_netmem(niov), off,
				       size, size);
    ...
}

So with BIG TCP enabled (gso_max_size > 65536), a single frag can be 64KB
or larger.

In bnxt_init_one(), bnxt sets dev->netmem_tx = NETMEM_TX_DMA and calls
netif_set_tso_max_size(dev, GSO_MAX_SIZE). bnxt_start_xmit() then writes
the frag length into the BD without checking its size:

drivers/net/ethernet/broadcom/bnxt/bnxt.c:bnxt_start_xmit() {
    ...
		len = skb_frag_size(frag);
		mapping = skb_frag_dma_map(&pdev->dev, frag, 0, len,
					   DMA_TO_DEVICE);
    ...
		flags = len << TX_BD_LEN_SHIFT;
		txbd->tx_bd_len_flags_type = cpu_to_le32(flags);
    ...
}

TX_BD_LEN is (0xffff << 16), so the length field is 16 bits wide. A 65536
byte frag would be written as 0, and a 70000 byte frag as 4464. The DMA
mapping and BQL still use the full length. Depending on the hardware, the
result could be a corrupted LSO payload on the wire or a TX error and
ring reset.

The "Dropped oversize" check in bnxt_start_xmit() only looks at gso_size
plus hdr_len for GSO skbs, so it does not catch this.

The commit message says:

    bnxt doesn't handle them yet. It has a 16-bit BD length and needs a
    separate fix.

That fix does not appear in this series, and it is not listed as a
prerequisite. The only bnxt change in the series is "bnxt_en: let the
stack segment GSO skbs with too many frags". It handles nr_frags >
TX_MAX_FRAGS in bnxt_features_check(), but it does not limit frag size.

NETDEV_CMD_BIND_TX does not require GENL_ADMIN_PERM. Once an admin enables
BIG TCP on a bnxt port, any local user who can create such a dmabuf (for
example a udmabuf from a hugetlb memfd) could reach this path.

MSG_ZEROCOPY from huge pages can already hit the same truncation. This
patch adds a new path to it through devmem TX, in the BIG TCP setup the
patch is meant to enable.

Should the auto-selected niov size be capped per device until bnxt is
fixed? Or could the bnxt fix land before this patch?

> +	binding->niov_shift = niov_shift;
> +	niov_size = 1UL << niov_shift;
> +
>  	if (!IS_ALIGNED(dmabuf->size, niov_size)) {
>  		err = -EINVAL;
>  		NL_SET_ERR_MSG_FMT(extack,

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111224740.2744522-1-sdf%40fomichev.me
