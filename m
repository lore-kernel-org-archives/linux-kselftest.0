Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523740;
	b=TJcwtbjnFqaxhvO1L7S1uvRMwxWiO1gauR9p1GwNBbVM1RtmRkWrQcF/dnnsY37lfYHW
	 yjzIFLCJmz8eOFZ3IZjJJAGiy8APgGmUWwh773Sdy6LOEmWA+0EYinCp9SDPZloFMXsNY
	 o7JHMJEmlCjGG8r+hcxDu0s3kwldCf0xG+Ff0PDE+VRjF2gkgTHElVaZQ9MQ84HksQFci
	 kWSIjQsuDynF/uJkaR7Ze7JTDGtBbAhlMbFOOE7peB5UrHYLmvDQ31g/xy4bTsXK8+OLQ
	 dCytKRWkvQItYQ0z9g+RDCZ+jExG8oF+O+mJnlh5VcBLiBQBolfH2AhtFekVqKKUTmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523740;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=zl/WMN5i6CYnrqe2aXgzhSk2a5FA5Upj9o2d7Ivp1Kw=;
	b=0aYP/BmhjXTLUnEW/t97XN0MGzy8WesOXRbunfZJSVQYmxM2MUN+upYZru+5mzFPKzvZ
	 BOZlh7wzSvbqJZhICeLw9t3IkVLB5WLbxTilLBEfyD9LP35Xg28VLyZs4A64jpPuajewH
	 nOAqjM555rKgU3MZfq1Z3BXmnP81nedwLZ5jaHrHkkTNDUTSTkp4eLK28/bG4O5WfbjG5
	 3gBvbUlcYdeiicnoRAsJERiob39FmyJ8lYyaoD41Z0vkfawoF1Nna7sts3ywvH3IpB2UI
	 o7t7hxTEXd6C5Sz3tUl5mweFzIyNGRnwoxlMfKN4gwNhjPKg/TSYda0CpZp63mvVhZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PhPfS9ua;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C691606A31C;
	Thu, 12 Nov 2026 22:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PhPfS9ua
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752561F000C4;
	Thu, 12 Nov 2026 22:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794523739;
	bh=zl/WMN5i6CYnrqe2aXgzhSk2a5FA5Upj9o2d7Ivp1Kw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PhPfS9uaI13NBSZUcdHJjyhGUPTYhX5DmdQhqSIUHqlmnqsbwmDyfLlQh+JxvOD9G
	 o/4UTvzSCiYA2kVxN/erVGjXwQ58kTLyBnSiI5T0zB3V9eJrjw7+3k+vuHyr2zQrU0
	 2nJ6GLuriy925qIMJFrRhlUxVj1qFCd7blU5TbF0uhev067/9/8rodKnuott6FHh35
	 9k9WL9X2RbKhJ1m8aM1Mfy914P+LY6RdSDUNAIl0nU06N4GEyCVtwPVpeadETvhgEq
	 UEcSLFkgzZCj03+Du+m5OVu+WuKmC9vSH0XYUksiBTtvygF1FX4qGVvAeNFap8scVX
	 A/aS6Pg6jMGXw==
Subject: Re: [PATCH net-next v4 1/5] bnxt_en: let the stack segment GSO skbs
 with too many frags
From: netdev-bot+sashiko@kernel.org
To: sdf.kernel@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 horms@kernel.org, shuah@kernel.org, almasrymina@google.com, sdf@fomichev.me,
 leitao@debian.org, dtatulea@nvidia.com, asml.silence@gmail.com,
 bobbyeshleman@meta.com, daniel@iogearbox.net, razor@blackwall.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 12 Nov 2026 22:48:57 +0000
Message-ID: <179452373797.2199510.8641970184828384072@kernel.org>
In-Reply-To: <20261111224740.2744522-2-sdf@fomichev.me>
References: <20261111224740.2744522-2-sdf@fomichev.me>
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

- [Low] This commit fixes two real bnxt TX bugs but has no `Fixes:` tag
  and no `Cc: stable`.

--

bnxt_en: let the stack segment GSO skbs with too many frags

This commit clears the GSO features in bnxt_features_check() for skbs
with more than TX_MAX_FRAGS frags when MAX_SKB_FRAGS > TX_MAX_FRAGS. The
stack then segments those skbs instead of bnxt_start_xmit() linearizing
them. Non-GSO skbs are still linearized in the xmit path.

Link: https://lore.kernel.org/all/CANn89i+ps_CozfOyRnKav0_LUmSekJ9ExB5JkDbTAVf_ss_98g@mail.gmail.com/

> With MAX_SKB_FRAGS > TX_MAX_FRAGS, the xmit path linearizes skbs with
> more frags than a packet can have BDs. For GSO skbs, linearizing needs a
> large allocation, can produce a head which doesn't fit in a BD with BIG
> TCP, and always fails for unreadable skbs. Clear the GSO features of
> such skbs in ndo_features_check instead, so that the stack segments
> them. Non-GSO skbs are still linearized.
>
> Suggested-by: Eric Dumazet <edumazet@google.com>
> Link: https://lore.kernel.org/all/CANn89i+ps_CozfOyRnKav0_LUmSekJ9ExB5JkDbTAVf_ss_98g@mail.gmail.com/
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

[ ... ]

[Severity: Low]
Should this patch carry a Fixes: tag and Cc: stable?

Both failures described above come from the linearize fallback that
commit b91e82129400 ("bnxt_en: Linearize TX SKB if the fragments exceed
the max") added to bnxt_start_xmit():

drivers/net/ethernet/broadcom/bnxt/bnxt.c:bnxt_start_xmit() {
    ...
#if (MAX_SKB_FRAGS > TX_MAX_FRAGS)
	if (skb_shinfo(skb)->nr_frags > TX_MAX_FRAGS) {
		netdev_warn_once(dev, ...);
		if (skb_linearize(skb))
			goto tx_free;
	}
#endif
    ...
}

The driver calls netif_set_tso_max_size(dev, GSO_MAX_SIZE), so with BIG
TCP the linearized head can be larger than 65535 bytes. The BD length is
then built in bnxt_start_xmit() as:

	flags = (len << TX_BD_LEN_SHIFT) | TX_BD_TYPE_LONG_TX_BD |
		TX_BD_CNT(last_frag + 2);

TX_BD_LEN_SHIFT is 16, so the high bits of len are shifted out of the
u32. Wouldn't the descriptor then get a truncated length of len & 0xffff?

For devmem TX, the driver sets dev->netmem_tx, so unreadable skbs can
reach this path. skb_linearize() can't pull unreadable frags, so every
such GSO skb with more than TX_MAX_FRAGS (30) frags goes to tx_free and
is dropped.

A later patch in this series, "net: devmem: size TX net_iovs from the
dmabuf sg table", also calls the bnxt BD length limit a bug that needs
a fix. An earlier fix to the same block, commit 00eeab0c644a ("bnxt_en:
Write doorbell when linearizing skb fails"), carried
Fixes: b91e82129400 and Cc: stable@vger.kernel.org.

Without the tag, stable kernels built with CONFIG_MAX_SKB_FRAGS > 30
would not get this fix automatically. Would something like this work?

Fixes: b91e82129400 ("bnxt_en: Linearize TX SKB if the fragments exceed the max")
Cc: stable@vger.kernel.org

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111224740.2744522-1-sdf%40fomichev.me
