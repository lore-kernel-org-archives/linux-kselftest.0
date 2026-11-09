Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248962;
	b=idvnSURJSOvWpKaWySrku22gfR90zzub4SYeAHeWXmjCLg0FcUl2XCkyFbh5H0L0l70S
	 4LOPGJsSBJJ0iORz5Z+WiZPWn1ziOB9D47PQidV5ah77NUURhqjASZ8CFYeu7bWERAeFH
	 MvuN001u9DS+AfFPzEADJhgs/7XxyJ0iTQCty8kxeLCV2mOr1F5+H3/mn0fHOZlkS9TI7
	 wCYm/KzHWrYQcSxfoqv2ZXyI9tAlYbQeE9rBcSOvIasKwW5fYzy3151SjrIoS5JGo1Tdw
	 cG5jTC/1BrSPgpeOr17pzRIGgbGVEsapSnNYS0YbrTv2Vjzo5B/zLbYQgtjayHEMJCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:In-Reply-To:Subject:Content-Type;
	bh=eZXah+GU1zYRZgrwJ8SeyJuEq1JV0JX65ZErGIYWKN4=;
	b=OZjnM8q+E35dUpTjuCyVSQlXJJaQTTUuSvJbJaj9Xxml/JPJnEn36J3IxYf/4tF+eOc5
	 T/aqF0ZjUTA7uFoIM0RYaWXzLqzuW5hO4EOGpkMutP4ZCvQwkFlDowXUT2gSvyTtn3ZmM
	 RvVmFeVk5LESRNi7T+wKv8EYrZqb+KAYJSzYkRY6IOW7dLO02RpQOuuzBSk6+piyp5v28
	 0A2SYbiCfTWGgmHQnTky6p+T+GjJAMrCaVFRm7PoQ2KS7/s9e6Nwm07r5z6KIevXE2zFS
	 s0MFI5fun+O4xfE3QkKofWxYoXLmm6a52vOKuNTe+HL/1g3yst2JRrB9ZBSJSuspzRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KSJhy7sp;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEBA6070EFF
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 18:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CEBA6070EFF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KSJhy7sp
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso1649135eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 10:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248961; x=1794853761; darn=vger.kernel.org;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eZXah+GU1zYRZgrwJ8SeyJuEq1JV0JX65ZErGIYWKN4=;
        b=KSJhy7spSVu5bxRcystXBVzm1AoZWAvdpFQsG4ejBx9otx6a4+2dMgf2GDHtdvnAGF
         jA2RS+6Esp+A1s1IsndxuLyW4jjRdT+99xKWuANKBhT7XEBw6JMDu56+D5v78sr+CZQ3
         epMrT3Cb0EOf6gfAYdYs9yft2FRR6cey/8yTtq9j2979h/g75hxWoG4MP8S3dNDq3jTo
         JveOWlD/jjVgTb9h/9sefJef+OQLdIcfAYxIYfK3zpZJFwN+1YZ/gzE45F9G8iGhFOut
         EwlQ0ianw7caxy1nqlGQVzvV5uLTQ9lMZqesTRtpUQ/OFpRz5fRw4c4WhjujA6UhaKph
         H+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248961; x=1794853761;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZXah+GU1zYRZgrwJ8SeyJuEq1JV0JX65ZErGIYWKN4=;
        b=yoF9M+o3zyuXjOE8LnRtqhuanE7Bc4OHC/kHtRbe7W9hNh6rP1HlkHYuBpCOjFzXrq
         4I0aRmDTN8PFiyRMJVfa+ayfiRM2GB3k97RvDMdBAYoGAP2M0A3tMU+/n56Stj5bkIPq
         6kdrYKb7SK6qyPaCsrA29prOYBXjruws2xQzTYFwX3EYr+GLc2BzidswZbO0woBJLNFP
         XECLdHxgBJd4dBk99wr+azmkfj8OnAHgEBj7e29mSfxXnw/Fp80CoE5X8YI2mB0lnox1
         nOg9p+DHqFSFwVEf72NQvemJkoSxPxvt+T82gaWmJn7+KnmLy+fPZxihivqZSnnUNCKP
         YclQ==
X-Forwarded-Encrypted: i=1; AL+hErFNUCa8gsqxEU+IE4ha+iufxIfockL2So0+hOFIAknmCAt+ISt18khEYvYmI15iz+CZ2irRSz7nNHTIu8N6t6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sarDvw7QQRA0GlI1evIHw5ZVoisgZMlt/5gvBcTIW/awN1+Bc
	6WDrtjDBnL58PQLdFxdKu4cmwvvOkdAvFJ0pRHejCQCpAiEwsqfm51+2
X-Gm-Gg: AYBFou0Q3DOlJXNelrnlCmuDxmi4uUTq+692/uj/sey0RZ4a4/j8zTUlYK+5nCeZFKM
	njAHTn44npzpZM0NmB2iDLYn0KODblKl45z65xxtXuGIXzmqSU6/zukJ1HXE0Ny4ls53HmTCsoT
	VHcWuQS+Uy4IpcVue1VK5RxhYEmXwXdC+NS8uZUygV8/Lr9LeXEK7LmjLedW4dZVQN+5xswirx2
	OSGf2jriEZP0C/poqvKfcVCZjsJHDsI4A5hZluefoO02lNx2469XgKQLybHneJaE47alHC41MQI
	X67NZbZp7drnn5g2EMbfXv0uOjXIFOKyoDDassA5ClgFTNrt0RB0jqqAuC6W8wUKfHmmKuvyEsY
	5sfo1hNKtmhw1fVxOVxsXYZQNtAZlveh8jqKFiVp1B+u3hBG4EhSA8/RpHKl6s+e8FlDckb7Mue
	2Gn+mVj5eRLhGVUCEDFbQFFklRm4eXTEbpcaA8fQgkSskMjfkbFUJdvjxo52NL4c/3AkdQ9rSEk
	Tipi2VPuyUwxE6IINj+vnbNuqxf/BdsR3lID/EIGHrXlIWWesd4U2KqN7+WVma5RZAGSAK8GeO9
	tR+vBlj77oGiCTeNpUlVIFE=
X-Received: by 2002:a05:693c:41c5:10b0:372:7af9:b916 with SMTP id 5a478bee46e88-3751ef77c8dmr97324eec.18.1794248961138;
        Mon, 09 Nov 2026 10:29:21 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520608b52sm102777eec.13.2026.11.09.10.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:29:20 -0800 (PST)
Date: Mon, 09 Nov 2026 10:29:20 -0800
Message-ID: <e4def2839d68382fd50e4fe1e6b4f116@gmail.com>
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 edumazet@kernel.org, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
 sdf@fomichev.me, dimitri.daskalakis1@gmail.com, almasrymina@google.com,
 dtatulea@nvidia.com, bobbyeshleman@meta.com, asml.silence@gmail.com,
 daniel@iogearbox.net, razor@blackwall.org, leitao@debian.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, leon@kernel.org
In-Reply-To: <179418737248.994134.10509157155829463489@kernel.org>
Subject: Re: [PATCH net-next v3 1/9] bnxt_en: let the stack segment GSO skbs
 with too many frags
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list

> > +#if (MAX_SKB_FRAGS > TX_MAX_FRAGS)
> > +	if (skb_shinfo(skb)->nr_frags > TX_MAX_FRAGS)
> > +		features &= ~NETIF_F_GSO_MASK;
> > +#endif
> 
> [Severity: Low]
> Should this patch have a Fixes: tag?
> 
> Commit b91e82129400 ("bnxt_en: Linearize TX SKB if the fragments exceed
> the max") added the unconditional linearize in bnxt_start_xmit():

[..]

> The commit message describes both problems. Without a Fixes: tag, stable
> kernels that carry b91e82129400 won't pick up this fix.

Will add a Fixes tag, but not sure it's worth the backports..

> [Severity: Low]
> Can the segments that the stack produces here still have more than
> TX_MAX_FRAGS unreadable frags?

[..]

> Could the commit message mention this limitation? Fully closing the gap
> would need a fallback that handles unreadable frags, or a frag limit per
> MSS window at sendmsg time, rather than skb_linearize().

Not sure what's suggested here. The example that's given goes via skb_linearize
and fails cleanly (as expected). Handling this in a better manner is out of
scope?
