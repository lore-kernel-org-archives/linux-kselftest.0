Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066F23C0605
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 08:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785142773; cv=none; b=L4w2EU5IbMg/KsBf6Nn89SWJP9pZAp18PxTLuqMov1HRdaIIg/hzG8tVP9Y0CYyK/KD/PGDen6GkE1PxD3X4UhO/nQWsYbdUH6mQJFcbTfiY/10dQe0VKgHWybQaIRLkJpYLRxpIRBle6cYU9LbKxxk4SxwBrhZK4mHwMmPUauw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785142773; c=relaxed/simple;
	bh=TvaB5pDsZDJqz0nqqM/72TvbOhMxL40wRzdmMlRRozU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncGX6ZnluIIaG/7kDxCsIpTeqwi/svZKNE6Bsy3Qb7lbgtV9cTeHCa1pVyowm13m+nEYKPiXCjbg8Ln/MM4nU3/nvD1sE2w8r6gIp7IXSuEHvTmN2xMyj7j7juBpcakmLWss3PIqTKDyeIBOqcBdl9Yu9FHgwr93w7D6DvNVOcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=Gsd8DHbr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="Gsd8DHbr"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b966dd74so15422635e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 01:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1785142770; x=1785747570; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cKXBOXAtqJDj69Ps8FseAtzEzy7p5GmYrwezoJp9Vo8=;
        b=Gsd8DHbrX+tARlOxh/1frd7BmHEeZFioV9aA+R7U1bpPdVjA7crnkRj8lS3BCgY3TX
         mVZnZouhtUcOqXcmxDoZrqXiQ4fChc2texwmIIYDgqK+TzrhPfiFsz7MSOc1fAEJ0P1h
         jCdDfPEIFiABrYemmeSKfmyP2V4wmigFgxU/Zu9mWKUYUOTa4wmRbd565EK/25gHWOE3
         n1eVi2L3ZUbfNBFRwJVjT8ODrCcGemPCk9XcTNjI6LcFK8kiJEqnOCK++6A6Z8vz/iji
         yYfBFl2AsHeNqI8Fqir6PXoKPlIpxG39gqbVBZsiptGHTkAR/NRmpOjn94z3OzjBG3gU
         S58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785142770; x=1785747570;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKXBOXAtqJDj69Ps8FseAtzEzy7p5GmYrwezoJp9Vo8=;
        b=U9+XJkD3JMz5ZVq0sakbPk/PdrV9VVw9IUsnWWvyLzqCwOHIET8BTm3W8V7icPr98v
         Q+Swe7V8A4lMjldQmPHBEWUqt+rcot1ZlIuU6VzQa8xMru9y7t/QW17CFJYPqAQ6hC5f
         WRmwFGvPz1lvIYzmAl85K9JwGes7bBNPtC2UwIG4DqB2Q7lEyuOQEk1leMQs4OdBTqPP
         gdTK5YA3GDERPUHqjXeLuWRZD/oynl1ZMNWX2YQU9IrenzLHUi+S4TygDlhtweA6jB0X
         Izrj6XdLdmbhBHomq0vaS7cQCH9yWi/dLxWkX3rRkus4WxFTOPUsosjtuCrekPqqR/0Q
         xGSA==
X-Forwarded-Encrypted: i=1; AHgh+RrXPgbeVMtlwVRtTGLVdFzJGnWD7j0tTG4NzBDCpkxHTiiVBEVUCXZx317m+Qk3oq7SUm/+7bbgtLqg9hVDBNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyFR0WHofQbwC1nOYT3id2jMetP02o/dyEg34lXiaOLoMp3Fgf
	k1SO50DxpVV18zFgieWBQS8847DVvxU+ivoJAesa7O2dUuZxgtVY0PppI+TcGUcGh6c=
X-Gm-Gg: AR+sD10DZ5/RxWWvExcwJSY6VraE1H5ZWFYU/RfchNYdi+m17KfyGFIsim/Xdr0YNKO
	ItY6aA89tQyYx0TKicNYIIq33t4VWRi4c1ZszCVSp80Kyur7IUcwNSiLsthM/BYcMjDTBcGRE2p
	dUUytxa6AB28YreGlKAUeHwXFLykVEKV4Qm64DpJQfQy7P6aj8FqUi9FQhzcTNN8JIPgDyIORVh
	u2UVdVj/K44sVXYTSuOrpqeAJ2JUoTCKdq8Jhoz1+GGE0w4jmTBIirPtIl5xJ5pgQAvHIyXMAnI
	lVH+Xm3yE+nzJASm2BanrP8mMraAQoYGXMbcFiCGa7EoOKf6Elo6CvQ5ZWZep6QXOP7tbwP/TeB
	d9TXcqP1TeLQdQd/vmvrGULgiMDVD4q2DdtHpUSnxgkGfgjO+ODCT8ielheW9RhCFndc9r0FrRw
	==
X-Received: by 2002:a05:600c:8b14:b0:495:699:84ca with SMTP id 5b1f17b1804b1-496b57258d2mr102932055e9.28.1785142770032;
        Mon, 27 Jul 2026 01:59:30 -0700 (PDT)
Received: from localhost ([109.160.73.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a596sm46290167f8f.4.2026.07.27.01.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:59:29 -0700 (PDT)
Date: Mon, 27 Jul 2026 11:59:16 +0300
From: Nikolay Aleksandrov <razor@blackwall.org>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
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
	daniel@iogearbox.net, almasrymina@google.com, matttbe@kernel.org,
	skhawaja@google.com, dw@davidwei.uk, Joe Damato <joe@dama.to>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v6 1/3] net: devmem: allow rx-page-size >
 PAGE_SIZE per dmabuf binding
Message-ID: <amcd5DJF27eh8TZC@penguin>
References: <20260724-tcpdm-large-niovs-v6-0-7975f62cdfbb@meta.com>
 <20260724-tcpdm-large-niovs-v6-1-7975f62cdfbb@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-tcpdm-large-niovs-v6-1-7975f62cdfbb@meta.com>

On Fri, Jul 24, 2026 at 02:21:15PM -0700, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Every devmem dmabuf binding today hands the page_pool PAGE_SIZE niovs.
> This caps a single RX descriptor at PAGE_SIZE, burning CPU on buffer
> churn for large flows.
> 
> Add a bind-time netlink attribute, NETDEV_A_DMABUF_RX_PAGE_SIZE, that
> lets userspace request a larger niov size. The value must be a power of
> two >= PAGE_SIZE.
> 
> Measurements:
> Setup: kperf in devmem RX/TX cuda mode, 4 flows, 64 MB messages, 60s,
> dctcp, num-rx-queues=4, dmabuf-rx/tx-size-mb=2048, 10 runs per niov
> size, mlx5.
> 
> CPU Util:
> 
>    niov        net sirq %        net idle %         app sys %        app idle %
>   -----  ----------------  ----------------  ----------------  ----------------
>      4K   62.38 +/-  8.27   33.40 +/-  7.51   54.15 +/- 10.23   43.67 +/- 10.53
>     16K   58.91 +/-  5.35   35.23 +/-  5.88   41.05 +/-  8.87   56.42 +/-  9.24
>     32K   64.12 +/-  0.68   31.09 +/-  1.48   44.54 +/-  3.51   52.63 +/-  3.65
>     64K   54.69 +/-  5.54   39.67 +/-  5.81   35.47 +/-  3.11   61.97 +/-  3.27
> 
> RX app sys % drops ~19% from 4K to 64K.
> 
> Throughput:
> 
>    niov       RX dev Gbps   RX flow avg Gbps
>   -----  ----------------  -----------------
>      4K  300.63 +/- 53.21    75.16 +/- 13.30
>     16K  321.35 +/- 28.20    80.34 +/-  7.05
>     32K  347.63 +/-  2.20    86.91 +/-  0.55
>     64K  332.11 +/- 14.26    83.03 +/-  3.56
> 
> Throughput seems to increase, but the stdev is pretty wide so could just
> be noise.
> 
> kperf support (not yet merged):
> https://github.com/facebookexperimental/kperf/commit/8837577f920876bce6986ec18869ac04439ebcd2
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> Reviewed-by: Mina Almasry <almasrymina@google.com>
> ---
>  Documentation/netlink/specs/netdev.yaml | 17 ++++++++++++
>  include/uapi/linux/netdev.h             |  1 +
>  net/core/devmem.c                       | 49 +++++++++++++++++++--------------
>  net/core/devmem.h                       | 13 ++++++---
>  net/core/netdev-genl-gen.c              | 11 ++++++--
>  net/core/netdev-genl-gen.h              |  1 +
>  net/core/netdev-genl.c                  | 18 ++++++++++--
>  tools/include/uapi/linux/netdev.h       |  1 +
>  8 files changed, 83 insertions(+), 28 deletions(-)
> 

LGTM,
Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

Cheers,
 Nik
