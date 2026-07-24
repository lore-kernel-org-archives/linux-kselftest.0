Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8CD12E1DC;
	Fri, 24 Jul 2026 13:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784898764; cv=none; b=Kqr/JburzjZmuIM1MDzot1aMLRkqruiryExdJrmPfqTn7acjdZJv7Ug9D4pAuenO4tdm4xJwZMv15DYTHrOGA+UHIDYAMz88n7k+ylS/2cU5vJTVCf1TLhXClaZH/utb5OLioT230zGAMpbXATYI8nqey54xKCTobjVhkrMqCT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784898764; c=relaxed/simple;
	bh=IbkXP/ld5YyP0BPHgPMPfTVOh8FLyYhzqlG+UY4rIA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oYXb8UCiWqV8WWOvWdNbBewVvKHWi9zJfXAHbhQgv1funRUBjxnUdZEQCP33nwe+wMHuCx/Hi7V4iDEtdv5a3hZ4pb4ImumsiNUa0Mh4sxNRpf+hXY/Ct16/Xxh4fEM9jNmqh3Jwfb+SMqebu5ORbgGZ23TpAfR/szMTVwjCY1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Plu7d+ck; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Plu7d+ck"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4ED1F00AC4;
	Fri, 24 Jul 2026 13:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784898763;
	bh=naMvV5qTQpv6+4E5v2yjY7wsj5yCDhGdWRTrzuxjKnc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Plu7d+ckx6eBZBeI0oMTavlBaVmmXVod135ZiBpbASOXHXBoRYDQ3ivXiQJ+EBs2a
	 /f21OIOwtkSvg5zKAEVWg6fT1xAXiLUxs4mvR4Bhq9Pgg2j2edo400LlGTrOqrwCwh
	 Wtp4l1a1s6dCPjQyWkIBLuwf2wY08j6GC68UraqjIlidOV7LFocbkmAqfohNKactj7
	 kYb28er7WdMmiC7LFRKUND6sI/9NZxivDaUfDlGk3nkqg2aXYLc+OXFHIjQ1Ktzt2/
	 uoOuIVgp/vV72qY5cDJttC2iYgDIscUmRO4w930oI9+sGCrAtQOHAPe1LpH/CAFMeY
	 ykyBD2AqebetQ==
From: Simon Horman <horms@kernel.org>
To: xiexinet@gmail.com
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	wsa+renesas@sang-engineering.com,
	jie.luo@oss.qualcomm.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	fmancera@suse.de,
	bigeasy@linutronix.de,
	fmaurer@redhat.com,
	luka.gejak@linux.dev
Subject: Re: [PATCH net-next v4 1/4] net: hsr: add PRP interlink (RedBox) datapath and duplicate discard
Date: Fri, 24 Jul 2026 14:12:30 +0100
Message-ID: <20260724131230.679892-1-horms@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717201457.54-2-xiexinet@gmail.com>
References: <20260717201457.54-2-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev/#/patchset/20260717201457.54-2-xiexinet@gmail.com?part=1
---
--- Patch [1]: [PATCH net-next v4 1/4] net: hsr: add PRP interlink (RedBox) datapath and duplicate discard ---
commit 56647cd99caab3cbc966d1e4d258db2aadbec967
Author: Xin Xie <xiexinet@gmail.com>

net: hsr: add PRP interlink (RedBox) datapath and duplicate discard

This commit adds PRP interlink forwarding rules to prp_drop_frame() and gives
RedBox nodes a second duplicate-discard slot. It also publishes the RedBox
state before the first hsr_add_port() to prevent sequence state sizing issues.

> diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
> index 0774981a65c16..7734a521a96c2 100644
> --- a/net/hsr/hsr_forward.c
> +++ b/net/hsr/hsr_forward.c
> @@ -440,12 +440,34 @@ static int hsr_xmit(struct sk_buff *skb, struct hsr_port *port,
>  	return dev_queue_xmit(skb);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does modifying the MAC header
directly in hsr_xmit() corrupt shared packet data?

When an HSR frame is received from a slave port, it is forwarded to both the
master and interlink ports. Both ports receive a cloned skb that shares the
same underlying data buffer.

If we look at hsr_xmit(), the source MAC is modified directly:

net/hsr/hsr_forward.c:hsr_xmit() {
    ...
    if (port->type == HSR_PT_INTERLINK)
        ether_addr_copy(eth_hdr(skb)->h_source,
                        port->hsr->macaddress_redbox);
    ...
}

At the same time, hsr_deliver_master() modifies the source MAC on its clone
before delivering to the local stack via netif_rx().

Since both clones share the same buffer, does this overwrite the exact same
memory and corrupt the packet data for whichever interface gets queued first?

Should the skb be unshared before making these direct modifications?

Similarly, does hsr_create_tagged_frame() have the same issue when it
modifies the HSR tag path_id directly on frame->skb_hsr (the original
received packet)?

Since this path is triggered by incoming frames destined for the Redbox from
the network, can this reliable data corruption be reached by unprivileged
remote input?
