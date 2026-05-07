Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD1539098C
	for <linux-kselftest@vger.kernel.org>; Thu,  7 May 2026 15:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778168346; cv=none; b=sV18/zzzaW6EqrokD4abTU4qSgJ2NpgGcfQ27pyVbP5eK3orEqPay8clx6B/pSP/G9KljNjbuJ9X4O69DTJwkzSA+1fl9l+yCqWDH6aSz46uJBikvmbtQkFNFILDzqLL4eGE4HsZ28niV3wtSIPlTS+xtcwtgmCr+CWAxdJ8o2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778168346; c=relaxed/simple;
	bh=I7bHVcUPCbFavnPQE9NIAPWTbSlQISkdMWu7R9FX+Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1Zg5jzD3Ljc/wdBQC/Z7I3F6SE9IMvk4MHFQ9siNubS2f97jzRm6o+ggy8Qhw8G2H2Lnxi8G/PNiddk2S5NejkPvBo5tzPwKVca1FK1NjG2CtkFffwIrwvn+IelQr3g1LG/lQg3D8rN2kEwI1Sr+V22VLQ4nElK9M2S+e/9g9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lELMVwd2; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lELMVwd2"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8ef2118b478so100241985a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 08:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778168344; x=1778773144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hQASz0K9bAEWsvTANOg3uGMuZOgruzesi2JgdTAVAkE=;
        b=lELMVwd2v+v3Y2UjmN0rjzuYIZkTeRK8VqQUHf+rI68gGfgcG8NCRLWnzDSU7Ejg3a
         Fkw6my+S6bAF/4E4hCUawNWJPvhr1TNcPhPRWjqkvLDfn3aOBNptDGyNH86WSvyJo283
         sWtpk53zfbttBN4gwE+xdhjPtewc4RWBahS89D/lN22YvuzFwhbBxwkjAQV+wl+AgeCk
         lXNzb4qXqs00gTDv0uytVS0ClClxoEGzxVnEniq0d3y4Gw9GHs0fmfn66iThHtOpR7TJ
         l3wCy1J1YODPtn2r0c+N3ZstW4mN3WeMU4SFG3zlY2trp4eE2dESUXTSK8mMG8ZRqvme
         3PWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778168344; x=1778773144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQASz0K9bAEWsvTANOg3uGMuZOgruzesi2JgdTAVAkE=;
        b=aLZCacfz9gly84CjMHpYB9Q6Xr/D+9NwcD2AU7ndVyc6wM2hoKynYYMN8xw3QJABcW
         GCePzxiLF21SiCqhdzR3QLdmTQn12j0xIoUTSiCeKi3ivEvxD7/2bOWOY777hGhpbmjL
         tL++v93EKD+0mrHhWWpoC009CsB3P12oWe1ctgwzfaBr6DPH9WODw7KxwSAZleiA/kat
         cwZFLvltwtId1Atnog+K+kduRfQ8DYc3o4c0k5Jy0q0ojtZhhQNUUpBmg3YbvDg8wcSU
         8VaqGCyvfxVh0y3aWM0yoFsfLhazn3pw1KVhZgPOC083xxTb6V+980axKQgEWI9ZcoDd
         QFkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZY2nN/07NRM9aRm1BS82qVNzeLw3ENAoALwLvjwVyoJRlOgwvG3AOFyfLHkvDJq1+/5KFc1oIfZhb0v8QlOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxNC+P/U1MKpko4V6vb35LALLw353K1KWn84CbpnY8t0lOJOQ9
	Fw8YodbYjpgcbXqsyl36ZifworNjApLoCZLmbUcjDnlccS/Qr36mUHds
X-Gm-Gg: AeBDieusEeVytCmmLPrgAVKJgJcwsRAxQRyWDCluinoPmPcIWESl4WYZR+LrZPp49e4
	LhM9+3rdBfSSOfmvl97F4gAp0Z5TkfS3gnZS/Bj+aAjE/5nM7j3XBwsr5JLWJcJX4oBFCwNRl/Y
	AKE8/X9yqvPCPe8wFb7GJ6yS7jaJTTx+JewAPA73WlzDP1NmE/pbVQpcowL4FQA3TMJZnMP5FWd
	Z5JfiLC6mX2Aj9JOYuPzo+d7l4NWEW6866rL/alZhwQYEDY/Ni5e/po5lV+GRhpwJz73D22VeId
	l90M7u0ytgNZ9FANQT/E8FPdcP4IJk4M8NayWPxzxLDtoYPkYIjovVY4yeilShK5486XkT+JDt9
	NFAJTFX8a/BbHWYg5wah98EWTWBb4BoeHtF5dxy1YDR9lt/0OJDmInDNnXgqYPaw71tJQ92M5U9
	X2RiEOX0fojRXlI7CsWOtxHSRkZp2MP1IVC2GIJkkHGLvTrF4Tw8jWxo0h6A==
X-Received: by 2002:a05:620a:440f:b0:8ed:11b9:1ecb with SMTP id af79cd13be357-904d4b58929mr1205520185a.20.1778168344205;
        Thu, 07 May 2026 08:39:04 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:f800:13::])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc293837b5sm2153539785a.10.2026.05.07.08.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 08:39:02 -0700 (PDT)
Date: Thu, 7 May 2026 08:38:56 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
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
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v2 2/6] net: devmem: support TX over
 NETMEM_TX_NO_DMA devices
Message-ID: <afyyEJNbrBem8igi@devvm29614.prn0.facebook.com>
References: <20260504-tcp-dm-netkit-v2-0-56d52ac72fd4@meta.com>
 <20260504-tcp-dm-netkit-v2-2-56d52ac72fd4@meta.com>
 <20260506193420.575e1806@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506193420.575e1806@kernel.org>

On Wed, May 06, 2026 at 07:34:20PM -0700, Jakub Kicinski wrote:
> On Mon, 04 May 2026 17:27:49 -0700 Bobby Eshleman wrote:
> > +	if (bind_dev != netdev)
> > +		netdev_lock(bind_dev);
> > +	dma_dev = netdev_queue_get_dma_dev(bind_dev, 0, NETDEV_QUEUE_TYPE_TX);
> > +	if (bind_dev != netdev)
> > +		netdev_unlock(bind_dev);
> > +	binding = net_devmem_bind_dmabuf(bind_dev,
> > +					 bind_dev != netdev ? netdev : NULL,
> > +					 dma_dev, DMA_TO_DEVICE, dmabuf_fd,
> > +					 priv, info->extack);
> 
> Not sure if it matters but are we intentionally releasing the bind_dev
> lock before calling net_devmem_bind_dmabuf() ? Previously more code here
> was covered by the physical netdev's lock.

True, lock needs to be held at least until after binding. I have this
fixed in the next rev.

Best,
Bobby
