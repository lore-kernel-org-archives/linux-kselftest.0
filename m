Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4E32D249B
	for <linux-kselftest@vger.kernel.org>; Fri,  8 May 2026 16:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257165; cv=none; b=OKo0XdlhcQP/apRcrAPwEBWqDIDMReUUTMvFVaMsLk7O00+AzhKvj5+GfwDIVvYtofu9oGCsz4zR4obpOOF11ojdBEh1j63HYaxkG0AcuhSu/0yRNAJgUbmNy+Oz+42iFL2QbHTB4XZnPUeIWzXYv1dKb2ivHmr3tudyiC6Pp0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257165; c=relaxed/simple;
	bh=uc3jnip+H+oiJSYneTaQeBj5rHlfyX/72RGhkpqkc34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkuekGNJoTakm4tWs7561kc5qOB2uL9mEW1Mhk3kEKsPIbU6PukafCHssEHj5zbml4UKYPeENWEUbjz3WgIYZSm0NTfRA5ad7ZZIPMOhGOCXL/foJzdkFrsK6YwKjxx1g3O/JL4v8g5E+vPecEKn1qgUF3EisGy81ZxNkzyIUuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=daEkcEoH; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daEkcEoH"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8ee7ffd738dso362975185a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 08 May 2026 09:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778257160; x=1778861960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4bkqlCvbruBHnLjafR3XguFKTezYBeYRy/KbFBaQEw0=;
        b=daEkcEoH1UhQuK+JpnN1jrE/KdqXkddeyf858Hm0b8tLuc0/CJEGBoPTjizNAgLnIA
         vhElmBKzNi8+wLbmNYYtHbu+EARdyEWCwNGFdn5GUwIA1oqD+D70Vwm+Lhnv9KMuM7qs
         27/p7UZFnH13LGY0bIcihBOBsfMmoJXDhKsETkXEEvCiT1BCgmg6HQ0bVc7cDstTDk02
         X0KCPgEpGzQs5gCSbVgBC/eI+DFTK9QDmU0K19YQDem3IPv9FR3gJJYJAh4ePtUn/d3A
         qE//px4aaoaZM55Dytc/NGh/AwIPe+6myMJSgx9S/W6O8frsgCGgKflLJMW2NzOuzJhV
         qoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257160; x=1778861960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bkqlCvbruBHnLjafR3XguFKTezYBeYRy/KbFBaQEw0=;
        b=OKnwGfAtLOkQYVsbOcw7gaz5jTzJ6pu5E4WMW9nxOzPvsXXEnv8kOsef4DRsj58kNa
         CB5ciOvVepCe9qZpwV7z22q03URrxg369KpwgJOmPxRyG2qtC0BR/mGo7FhVoMYnlhrD
         Vf1/0gqbI/TVHPV8QHUJXg9htTT1eILqpHaW2F8QV4+QCmxNCuEID9yt2BZ0d4CBQxOy
         1BuxjCmvdqWPGiv3pz3Up3nK5IRPZUHiBcStgx7hHGYOQX2YN46uOad4YxTuVDQkLIht
         pT1AxPTRLBsSYVkhUcX+FhQnCZhdS5HC3WTG3YtP0EARZ2PogLsWCdDeVFGaDIei3Ouw
         iG5g==
X-Forwarded-Encrypted: i=1; AFNElJ8YGcu3fNOSCEv9kuUzBJJ4pRAe3Z/2pLfGAEsYUpmLA7l0jFnxH0IQwii40/nOicREa+Sep3HZXF6pSUPqhU8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5VwviaiYupsNYZUksRCFUUMxCA+AXw5gs5Upmm26OW0rFX5ML
	opmeQq7LyOpze4SKjW0Y09la9IsY7iQAfZvnR8o6wdk9+1JbcmW+dkQf
X-Gm-Gg: AeBDiesdgxwRKz7R6jfY5O5imtQMzGwphY7aOAlXYmzVoBl1dc4QNVS/DHvaaKCIJlp
	QAOjr9gJTEdFYOheC4WVvg8mVsGzg/okyG147D8PoShcgioZxFLc+c98SH37KxrqMbZ7nvmdbTR
	jeXeqsfVodc5cxlIsEDIZBh9XCdxhh2S7JO99HYc8Dkt0LSIvPN4CfGEWDtXaY9PAry1mZrwLS4
	VE1X7keR8rQ6IpS67vmqsK67vy7D2xbdWQCuTw9HzpVxfmTn31Vvgu13AAf+Hg5x1nLfcjoxX1P
	Ws5eAgUbmel2tw/e3dWeGuXxmPpOE4keUAe+/84Su938Dle55uRKiC9cdvOORn2/DFvBZ88g2fi
	RCPgqNjSk0luNe3df/Y3Dyiu09SNfy3NJ3Kz43icREUXbpawHHwJ1FzvnpDXENpOpC97nQx1StN
	0QbUQLFmHsnFZLLygvYkiqxFB9h6XHGWCpVLcTgkFK4DuZsbmOM4PiCznPew==
X-Received: by 2002:a05:620a:4554:b0:8cd:94f9:1bc5 with SMTP id af79cd13be357-90650ef5401mr1076760685a.12.1778257160389;
        Fri, 08 May 2026 09:19:20 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:f800:1b::])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b986aeccsm228049085a.4.2026.05.08.09.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:19:19 -0700 (PDT)
Date: Fri, 8 May 2026 09:19:13 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com,
	Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>, dw@davidwei.uk,
	mohsin.bashr@gmail.com, willemb@google.com, jiang.kun2@zte.com.cn,
	xu.xin16@zte.com.cn, wang.yaxin@zte.com.cn, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v3 3/8] net: devmem: support TX over
 NETMEM_TX_NO_DMA devices
Message-ID: <af4NAebQLJbdCB6p@devvm29614.prn0.facebook.com>
References: <20260507-tcp-dm-netkit-v3-0-52821445867c@meta.com>
 <20260507-tcp-dm-netkit-v3-3-52821445867c@meta.com>
 <af3593dYeiEeMzC2@devvm7509.cco0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af3593dYeiEeMzC2@devvm7509.cco0.facebook.com>

On Fri, May 08, 2026 at 08:01:17AM -0700, Stanislav Fomichev wrote:
> On 05/07, Bobby Eshleman wrote:
> > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > 
> > When a netkit virtual device leases queues from a physical NIC, devmem
> > TX bindings created on the netkit device must still result in the dmabuf
> > being mapped for dma by the physical device. This patch accomplishes
> > this by teaching the bind handler to search for the underlying
> > DMA-capable device by looking it up via leased rx queues. The function
> > netdev_find_netmem_tx_dev(), used for finding the underlying DMA-capable
> > device, can be extended to support other non-netkit NETMEM_TX_NO_DMA
> > devices in the future if needed.
> > 
> > Additionally, this patch extends validate_xmit_unreadable_skb() to
> > support the netkit case, where the skb is validated twice: once on the
> > netkit guest device and again on the physical NIC after BPF redirect or
> > ip forwarding.
> > 
> > Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> > ---
> > Changes in v3:
> > - Fix validate_xmit_unreadable_skb() bug for non-devmem
> >   unreadable niovs (should not be dropped)
> > - Major simplification of validate_xmit_unreadable_skb()
> > - Fix prematurely released lock in bind-tx handler (Jakub)
> > 
> > Changes in v2:
> > - In validate_xmit_unreadable_skb() to check netmem_tx mode before
> >   inspecting frags (Jakub)
> > - Lock bind_dev around netdev_queue_get_dma_dev() when bind_dev !=
> >   netdev to fix lockdep (Sashiko)
> > ---
> >  net/core/dev.c         |  3 +++
> >  net/core/devmem.c      |  6 +++--
> >  net/core/devmem.h      |  9 ++++++--
> >  net/core/netdev-genl.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++----
> >  4 files changed, 72 insertions(+), 9 deletions(-)
> > 
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index fbe4c328a367..268417c9ef22 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
> > @@ -3999,6 +3999,9 @@ static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
> >  	if (dev->netmem_tx == NETMEM_TX_NONE)
> >  		goto out_free;
> >  
> > +	if (dev->netmem_tx == NETMEM_TX_NO_DMA)
> > +		goto out;
> > +
> 
> Since this is a good case, maybe fold it into skb_frags_readable check above?
> 
> 	if (likely(skb_frags_readable() || netmem_tx == NETMEM_TX_NO_DMA))
> 
> Otherwise it's a bit confusing to have:
> 
> if (xxx)
> 	goto out;
> if (yyy)
> 	goto out_free;
> if (zzz)
> 	goto out;
> 
> (or, reorder to be out/out/out_free)
> 
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>

Makes sense, will use the combined conditional.

Best,
Bobby
