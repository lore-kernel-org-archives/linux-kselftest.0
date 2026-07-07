Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B138B39B4BB
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 22:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461788; cv=none; b=gBJnl+iTk6FZR8JBTm1ckwsYjjQzmO5kvrYXEaMnKMAa4mOubnICggJgORA8S/FXGUbmEDd/mMmqAPpz2fwI3ZNEIN/xgvdkbusaEsbOuF4DSmPpCmL3n5v5Z6L+RLRLcXN2p8WVLdxuSWy1lPVGOXv+6TR4kfKwk6Q66xn+Ykc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461788; c=relaxed/simple;
	bh=QmI9y7LXjUNRevCboFwnS/cW5tvcm0xYKqsCkpJJyGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHOLKREy2l9ldgDint/rzfjsF0uVncNMAdlDAZDnXydk8MJfrwA/1FK137qcYG0LSjg7bTnaqBEkvevzVlVqQWdv5uU45OR4YkLgs6HsOr7cPCKd/HCFLy7vt0oSy0oW6lmnv/uO1+eXlLwRwapPm+q/CQihw3nUC4KnybbBoDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Em/IJI87; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Em/IJI87"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4a0c883ac23so40509b6e.2
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 15:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783461785; x=1784066585; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+Cz/DGzX9LixlJM1WDO9JL3XKhxalEZ7sqlBmeIS0k=;
        b=Em/IJI87bp0t1EKPL43O8QKUQ4CmWOXAeaCpkZ50fE6f2RPV8E8rMvN8xdW0AhABoP
         oDoAwmqbAQdB8ok4+W/73MHbS7URPWQMYPlU2sqjxukkTR4oJV7Zt4yKvUoAj4OWiGFg
         n0GYYgxDbcYI2RBr6chVeOinPPhYfebLkpKASmAZo+1MCnm4a1UlsWZ6iIZWRB4zjZTY
         eiySEQ5FH04tlDFau/5YfaXXu1Wep6i1EQ4TIwHOoaYHqW2jFzFkA7BhFaCkJMisAshT
         DZqQ6+JvV4BwNMXvabtagWBOKhex70nZerdcOgdo7EVckxyyrFgedMFiwjOZV6kepxv8
         SHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783461785; x=1784066585;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r+Cz/DGzX9LixlJM1WDO9JL3XKhxalEZ7sqlBmeIS0k=;
        b=GBI+9vsSTqVvfGFA/1aOvqDwBtoQvw5GsN9QAMerm/xZKz4RY4vQtaVby2gtQud9Vd
         yGFlHgfKjCkB9PWn6Gsgt8T6j628ZpfI/8FLNE0RwiDzmN6VwqbJzarKRPzaLQgd3B0J
         JC9IFU2PXuLmnsZtA+63dkKZNriI/Z06tyl5etLt7A+R4r3l5jnK/EL1+faZqQOvBUF/
         nkXvgTNmGsNP+blCQxksXA15LjjiHe/6tBaEoC4YpHtzMg/UiKbmUhJ+/4ocuPQlBlLa
         gqvyqPE1zFII4hbwCdmWnrFYWciuZepg5HqHmikrWDDZm4mTzrZNAeLPK1zQxcTPhp9z
         Xm1g==
X-Forwarded-Encrypted: i=1; AFNElJ96BhEJnTED39cN9IduZggA8J8Gv4+gDKkKAWixJ4dYs8R2ZsF3Ya6fdzojp7unFjI5qj2Vg/UOCb247VdpXME=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdFbF+gKxLFB35GwiZII+xkcutmK5qLnKOIavRrCkuqBl+m1ke
	6laCmN3GU+dQ01Yn13PX3ZKjE6xHbRLuGPt16/gA25wHras4/7uOS7/v
X-Gm-Gg: AfdE7ckp5Yd/gQlXIx909cLPfmdhBCihr6GP+fk3f4CupSp+aWdLqBU6aD5wq9nWHmb
	e3FWYiKR/iOmUQkCrWut6AYkXKp9/WlLZ+NYdnOwusbuqNNwsaCPyPO0YhMGN//FbiObg2W2L8G
	WrWFpNOWf8Y5BVcne9BbxlnPU3Uiau2eonapHLMZz4JVKtZcRdhaZPUpxZjf4fDySvHF3PFZRxV
	W3pTICQ2H3HNwGEoKUf+GV91IWbaW2HVyMaAxmOAhNYnqRMv84yaXT9Aw8/H/ryYq5qtpfNXOrx
	60IDBOi5/F/0OJs0ihNEGDvVfSiZpREllw3D1RNR5+A2WU0Hgi525TsxHxW1STR7hFYTmDq8odO
	MTBIGCC+Z9QNpXl9eV1ZvwhSrYGXX1MzoPDkn6qTvdmhHY3qnx/jb7The/9/Q5u3j9H7UfjgImr
	ycTZamF5aMlzyzU/HVr4YRkPI4Cbe8ZchG
X-Received: by 2002:a05:6808:5393:b0:489:f199:42bb with SMTP id 5614622812f47-49fdc040ab9mr5109894b6e.8.1783461784688;
        Tue, 07 Jul 2026 15:03:04 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:1::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1acc82f3csm430555b6e.3.2026.07.07.15.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:03:03 -0700 (PDT)
Date: Tue, 7 Jul 2026 15:02:59 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	razor@blackwall.org, daniel@iogearbox.net, matttbe@kernel.org,
	skhawaja@google.com, dw@davidwei.uk, Joe Damato <joe@dama.to>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v4 0/3] net: devmem: allow rx-buf-size >
 PAGE_SIZE per binding
Message-ID: <ak13k4XZsHnGKIOb@devvm29614.prn0.facebook.com>
References: <20260701-tcpdm-large-niovs-v4-0-ca4654f37570@meta.com>
 <CAHS8izOmA_U=Q6WOO5mcoi2vBps_JFEtAQa3gXk=JcL3rqE1BA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHS8izOmA_U=Q6WOO5mcoi2vBps_JFEtAQa3gXk=JcL3rqE1BA@mail.gmail.com>

On Tue, Jul 07, 2026 at 12:24:21PM -0700, Mina Almasry wrote:
> (I'm kinda reviewing this very late here. Some suggestions/comments
> but feel free to ignore if not useful).
> 
> On Wed, Jul 1, 2026 at 12:22 PM Bobby Eshleman <bobbyeshleman@gmail.com> wrote:
> >
> > Every devmem dmabuf binding hands the page_pool PAGE_SIZE niovs today.
> > On NICs that consume one descriptor per netmem, this caps a single RX
> > descriptor at PAGE_SIZE and burns CPU on buffer churn.
> >
> > In this series, we add a bind-time netlink attribute,
> > NETDEV_A_DMABUF_RX_BUF_SIZE, that lets userspace request a larger niov size
> > (power of two >= PAGE_SIZE).
> 
> FWIW we may be able to support arbitrary sizes with devmem. Because
> the genpool supports byte-aligned allocations AFAIR. Also the
> dma-mapping happens with the dma-buf size, so the actual niov size
> doesn't matter. The only thing I can think off which may not be
> flexible to arbitrary sizes is the driver itself. IDK what happens if
> you ask the driver to dma into a buffer that is frag size 5023 or
> something like that.
> 
> But that is something that can be relaxed in the future.


I think at least for mlx5 there would be some issues, as it splits the
memory region into fixed-size strides (256B), so I'd expect it needs to
at least be divisible by the stride length. The mlx5 driver seems to
guard against this by checking for sz > PAGE_SIZE && is_power_of_2.

> 
> > Drivers must opt in via
> > queue_mgmt_ops.QCFG_RX_PAGE_SIZE.
> >
> 
> nit that probably doesn't matter: ...QCFG_RX_NETMEM_SIZE, or
> (...NIOV_SIZE). This doesn't actually work with pages, right?

I probably could have worded this in the message more clearly, but this
name is not introduced by this series, so we probably can't get away
with changing it.

> 
> If you decide to extend to arbrary sizes, I would add to the
> queue_mgmt ops supports_netmem_size(size_t size) function, and let the
> driver enforce "it has to be power of 2" if it needs to. AFAICT core
> doesn't need to.
> 
> > Selftests use udmabuf, but udmabuf sgtables were previously hardcoded to
> > PAGE_SIZE. This series modifies udmabuf to respect folio sizes in its exported
> > sgtable. The result is that when backing udmabuf with MFD_HUGETLB 2MB pages,
> > the sgtable is populated with 2MB entries, allowing devmem's gen_pool to carve
> > out large (eg. 64K) niovs.
> >
> > Measurements
> > ------------
> >
> > Setup: kperf devmem RX/TX cuda, 4 flows, 64 MB messages, 60s, dctcp,
> > num-rx-queues=4, dmabuf-rx/tx-size-mb=2048, 10 runs per niov size,
> > mlx5.
> >
> >    niov       RX dev Gbps   RX flow avg Gbps         app sys %
> >   -----  ----------------  -----------------  ----------------
> >      4K  300.63 +/- 53.21    75.16 +/- 13.30   54.15 +/- 10.23
> >     16K  321.35 +/- 28.20    80.34 +/-  7.05   41.05 +/-  8.87
> >     32K  347.63 +/-  2.20    86.91 +/-  0.55   44.54 +/-  3.51
> >     64K  332.11 +/- 14.26    83.03 +/-  3.56   35.47 +/-  3.11
> >
> > RX app sys % drops ~19% from 4K to 64K.
> >
> 
> Hard to read the columns for me but seems like good perf data. Did
> performance become worse from 32K to 64K? I wonder why.

The drop off struck my eye too, but didn't investigate further. Given
the wide stdev, it appears to me like the trend is positive but probably
not huge. The cpu util deltas, on the other hand, look stronger to me.

> 
> I have some devmem performance fixes that are very critical for our
> production that I haven't gotten around to upstreaming yet. I wonder
> if I can send them to you for upstream submission. Are you potentially
> interested?

Definitely interested!

> 
> -- 
> Thanks,
> Mina


Thanks Mina.

Best,
Bobby
