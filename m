Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D7B3FADFD
	for <linux-kselftest@vger.kernel.org>; Fri,  8 May 2026 15:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252486; cv=none; b=JaN9iS0MRQlASqtoJOmjnRBjgW8F0aqVwdx7v1sfBDgwOiFH3FsOLcsI3KLBzm+LO6Kar+vShvA7S1jpqLneqQqCeZ/LaxUtwdqcCCaWd8QAiRj1zzmyesamQqr5hea5FDdqsYN9bEiVHdnSe/syxeKjwixB9U3VbmL0GOiuyF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252486; c=relaxed/simple;
	bh=C4KEQYKYMt+jPGupFXeYgtyzFlnYTdxDs0//Owq2PWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sG4x7NNMLRJrQZE642c+sxWMsXg4ER3LT0rlOKwribbWWAcxW2qQh4YE5nZMAcaxEZa2Uz1j6ow4ov2xzEiwu5YPSsMGkEYeE++0+m7FsqHg2mJVDykKFoKnWbJd996Ohsm2zD+vCTO8dLVJJIKdImhOZvNfLGPLWlmJY02UBK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0GSFJJr; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0GSFJJr"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-3665a90bcd3so645040a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 08 May 2026 08:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778252480; x=1778857280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VVsAIDWuXutjxalCznuSZJzmb8d2/FmjsiE/YFxHP1o=;
        b=k0GSFJJrD1to0PbG8ZmvC0Y9LJNb3QkjjoZtb7wK/ZDczTYm3uWjZBFFtRLsX9t/eq
         +s8uZdFUFfdJz/tkhb9zkkihV4X9ZiK+TI0oRe16kpl8iYbUDquIXDqeqzOGTwJS2vVI
         5S1Jl/u0MS862SupdkPlckRMaUYyuej8xckw5Vm/alUJ3RY3tQms3rPS9lmbi1bxzblN
         KPr74+xMjODE1ognAQZHD2wDXQhDTyidKirrffNRx4FR9wX9o2Q/hxjbNO32U1L9fLgQ
         mbMr5b6mg/4oZBUt1XgFSBaygNFogyF3lxCq9TVhNSwvfPFBQV8mvBlj1bS7NjnNqhLa
         r0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778252480; x=1778857280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVsAIDWuXutjxalCznuSZJzmb8d2/FmjsiE/YFxHP1o=;
        b=WPlsVxyhn+j5tokhSUwj84DtrOVd+C/Bg/vrgghLW8Kr9Z33RYi98lyL6EySR79LWt
         Bgkq1FqlbJQleyyZUHijyAiRs6rTgfNCPmgtyDADbnrp4Nps/UWnWRyzm9cLGPnptpbu
         jJOT/qJV02f9K5Kp70sI1QxrQ2HPIVEmnYmMSavVsA2q+8b3u12xSWsREEPB0jIjajRI
         2WUZRKoYT1xT6e1fPsYPG2o3uxZXPgvzeVIrxfaUeJ7af4Fhbr7IFD3Ku3NPCCZsqH7X
         A9VLWR9H0QH3sVHdvsvmglvnke8fqJy2bAdiqABNBnvdYZJYb/D+3JrWxRbRPJUxnpgY
         1xGg==
X-Forwarded-Encrypted: i=1; AFNElJ+EWe7+uqzIKejG0ZOg4UvvTiUV4QiZEwmrI/ozjdB9NA9YRbnc8Bc5EfQVsN7AAE2bTfFluGZJRhohlsylrVI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys5FMnFT9O776TGrkz+BV8VkARL3EaCGVrHgsw3pox7snRrKu8
	jiCqIgVU7v/ULM7Xud5CfbGPM0+cda7DvezjlUfuziZO5LiqKiJh+4ep
X-Gm-Gg: Acq92OGg/jL7e+gnUkQYajbyy4YSFH9tGuta763s/WULg8hyOroR882n+Uh6HJxtWp4
	DcOLL4YJHHEwyiVJyl6ZHlWlfJowwT97m+3B2Trrg/33Rutgr5j1NmGkTO17P22IvKS6RbyA++7
	c5jzhxRj3Wqnya1sp5jwRs1VZoelSKa3coS6dzVbn4oABafcgFn3GuEMQSToM9huAvcKdS/qC9Z
	pmx5cWFuEonyvkw2kAdQ53DQSIwRi6qoSH7fIOoBgLcQ64JvhfkZweMRhKN/+X2K4CbDWX1xRtb
	DRnmD2lYTJ2lWmHyZiNeDXRKRNI8ynYMHrT8tPtmJy+d7dci0c/rKydXOiuvzMkBQJbJuEVJo/h
	PIYfTidSeV1GxKTyQ81l/U96VQa2/XJRJLWU7sWKTttWhYOTIMdGPBVmfXe2rD7ol85EE2ccZ0s
	Av+LAOcsOS/LcvNowyBqJVpTOJR9Cj9aZ/gICn
X-Received: by 2002:a17:90a:710:b0:366:159a:c228 with SMTP id 98e67ed59e1d1-36615b96cf0mr4284277a91.6.1778252479571;
        Fri, 08 May 2026 08:01:19 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:3::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367c119f372sm61912a91.2.2026.05.08.08.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:01:18 -0700 (PDT)
Date: Fri, 8 May 2026 08:01:17 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, Joshua Washington <joshwash@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Shuah Khan <shuah@kernel.org>, dw@davidwei.uk, mohsin.bashr@gmail.com, willemb@google.com, 
	jiang.kun2@zte.com.cn, xu.xin16@zte.com.cn, wang.yaxin@zte.com.cn, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v3 3/8] net: devmem: support TX over
 NETMEM_TX_NO_DMA devices
Message-ID: <af3593dYeiEeMzC2@devvm7509.cco0.facebook.com>
References: <20260507-tcp-dm-netkit-v3-0-52821445867c@meta.com>
 <20260507-tcp-dm-netkit-v3-3-52821445867c@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260507-tcp-dm-netkit-v3-3-52821445867c@meta.com>

On 05/07, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> When a netkit virtual device leases queues from a physical NIC, devmem
> TX bindings created on the netkit device must still result in the dmabuf
> being mapped for dma by the physical device. This patch accomplishes
> this by teaching the bind handler to search for the underlying
> DMA-capable device by looking it up via leased rx queues. The function
> netdev_find_netmem_tx_dev(), used for finding the underlying DMA-capable
> device, can be extended to support other non-netkit NETMEM_TX_NO_DMA
> devices in the future if needed.
> 
> Additionally, this patch extends validate_xmit_unreadable_skb() to
> support the netkit case, where the skb is validated twice: once on the
> netkit guest device and again on the physical NIC after BPF redirect or
> ip forwarding.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> ---
> Changes in v3:
> - Fix validate_xmit_unreadable_skb() bug for non-devmem
>   unreadable niovs (should not be dropped)
> - Major simplification of validate_xmit_unreadable_skb()
> - Fix prematurely released lock in bind-tx handler (Jakub)
> 
> Changes in v2:
> - In validate_xmit_unreadable_skb() to check netmem_tx mode before
>   inspecting frags (Jakub)
> - Lock bind_dev around netdev_queue_get_dma_dev() when bind_dev !=
>   netdev to fix lockdep (Sashiko)
> ---
>  net/core/dev.c         |  3 +++
>  net/core/devmem.c      |  6 +++--
>  net/core/devmem.h      |  9 ++++++--
>  net/core/netdev-genl.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++----
>  4 files changed, 72 insertions(+), 9 deletions(-)
> 
> diff --git a/net/core/dev.c b/net/core/dev.c
> index fbe4c328a367..268417c9ef22 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -3999,6 +3999,9 @@ static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
>  	if (dev->netmem_tx == NETMEM_TX_NONE)
>  		goto out_free;
>  
> +	if (dev->netmem_tx == NETMEM_TX_NO_DMA)
> +		goto out;
> +

Since this is a good case, maybe fold it into skb_frags_readable check above?

	if (likely(skb_frags_readable() || netmem_tx == NETMEM_TX_NO_DMA))

Otherwise it's a bit confusing to have:

if (xxx)
	goto out;
if (yyy)
	goto out_free;
if (zzz)
	goto out;

(or, reorder to be out/out/out_free)

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
