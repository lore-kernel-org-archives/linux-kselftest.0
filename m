Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471940;
	b=LQpLeIpl+Q+2T252y0kU+V3hC+r9lc+Nw4f/BqbLspmiuxuva9oB3dFH3bAPW0enMB4M
	 Y/9Ucoki15+kFnTCnwKTms8ALq9XyuAZBLqejCpSTUGV/kfZ/pmnt3jDqxfKvjd+mUQci
	 XgXxj8uRTz/mGtuJlOoXNJcCrlUXLpujsWbkjascgxySrsOfYJw/ob9tgSHZ3fjDZqIsy
	 hFOgZTU92qrWEnL2RWVO1GdvXJJkD6a0RADo0ThEryAqDyaSgUK9r7BdRFo7rsR6kN2fr
	 JvfoScmTHrWmjOv7AboKGUF5lj3MK4XOiI8itvASZzuVHs5dw6jufJr2PuSrCfs/WvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471940;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LPCy+z0w9PTU6iVc8q6WjsQJyzcLfP1PI31Guk/FlWc=;
	b=kSrwVBt45iRVHgOE2iz5XJb2QeYPKpKAkHNeZ6+SgSi/hRjx7qTlTwlwfGs7oZ9/vhWA
	 2dkbRDf/o6Sp5RayXDa28kruAAPTWOEnbLM3mKeBOa5juT2jaQAX48coDj2XN+DKOPYzb
	 N0pIjC5FicrXMeB0tQXaZiXWvi1zRy0TogRla//prQ1gHUnnqIHQT0adQb9wvLccgXaSP
	 10kaxhAKpuQV0kq7wnPJUbH3cmqhjv/ymCPlgSs+HVekvM99Nfi29CRX4aeMhJ4r7uwJ5
	 LPICZsqWOoFxK7d495OfxjTQqVh4UJsc5JZg94YUulFGbBw0l8J2ZOYToOc0UwVUvlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PZyvhv7N;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=HpDVyfKa;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6F2606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 08:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E6F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PZyvhv7N;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=HpDVyfKa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794471939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LPCy+z0w9PTU6iVc8q6WjsQJyzcLfP1PI31Guk/FlWc=;
	b=PZyvhv7NB6ufris9LBWhiWzGzZlPCakLAr7CsF8qP3cIAwDNsZJR0g/v3XrkTaki2rXH7U
	qvnPuBEf8O385Rmr2m01qzv9WNrcEDBGcUEqgLkOg/m3Dsfarh48Md5bfW8x19AsDGSt+4
	YpiMzYNHM8tF8fY/U4W/vXzw8q4a1XA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-RCkdTt06OJe3ceumg7wXxQ-1; Thu, 12 Nov 2026 03:25:38 -0500
X-MC-Unique: RCkdTt06OJe3ceumg7wXxQ-1
X-Mimecast-MFC-AGG-ID: RCkdTt06OJe3ceumg7wXxQ_1794471937
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e0af48c18so3012624f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 00:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794471937; x=1795076737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LPCy+z0w9PTU6iVc8q6WjsQJyzcLfP1PI31Guk/FlWc=;
        b=HpDVyfKaQrovrXUj41MHfxK7V2DJvBLgMgy0AlNpVxuK9tKfAQ3L6pojjLnXyGAYuW
         IOPLHv0WMJOt6Q8j73Ow79pi26kDqC1v9hC6y51a9h4kmZ0bWTvmT4ZwmxWY8MyMe9HR
         cs/9i0ZVYh3dVF+CT119oqvFAdCdBR5Vf2mofZUfrMGTPtU7Eh9fKfPOMoYDhA6SWglC
         FGJfKJou4A9tP6rwbHKneCbTngGrO4WDR5Hq7yK97spLLoMfNLPvXlYQnesE2XbZV3ap
         RAzWWOO2ToRZtNPZkXKWW22go9Wt2x3p70FBPubogsrxGZweY751zHitjv+Dqe+aRwEV
         FCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471937; x=1795076737;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LPCy+z0w9PTU6iVc8q6WjsQJyzcLfP1PI31Guk/FlWc=;
        b=OodbmODS8xFAneT/Xr5neG2vSU85+4LTZRoJGBwFPATYlOPCtiMF5aNwZCV0RSqYXi
         JUqfRiqiYa/x6FBrXY5YTc8Rhtl2/o8raVTkbt1M0qGWN4Er8AezJYJGAHVkJuHk1IjP
         lP2grupKWkUwaaA1duv6Js+FS27r3YDjTCW9Uq6jfD7NyUdTs0NLGl/av6F0P7yGGQDV
         YRgC3owddqgGUky9pAouM8JOsgcO+RsnKSNKHaHzpz91IiLqIfyRV1nkxZavDTtBExJ2
         GDUV1MPuZ3og9ec7qT7bJG609JrepOx2KFUYVFJJ+EBGFzclILkiT5m5A2uKIu4sVC3S
         6EgQ==
X-Forwarded-Encrypted: i=1; AL+hErFXn5usikk6+D8sxM6gESx+mz/UW7itGlf8sg4UKnh0lusIDM6m/vezITG995j457YOlKDxxB4oj8S83AEu/Cs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AIeI9caVQaXZcYE1SnsWd4V2lzZvjgNoixyt590AogKTJvrCX
	XweFXd+oT7MHDkMAeNmXAWnKmxzXdZ9kW8vOVPvMdPuTcLBAeKJ9/VqOr48Y//SCFgdK1V7QFqZ
	mb9Ma+vGwLgjPN1ej6bf2Mt4J+J84YdpxnEEdTQLzSo5mTNss1KvsUfkgKL9uRNnzRKmgrw==
X-Gm-Gg: AYBFou2eIwUnBiI8n046ZkSFx6RZzuWaizi8BV11yJp7A+9aUXtOcqYqAcFJkvBbGB7
	EEatbQLlqlv2i8nPPv/Q/g8Qd6ijCtj/i4rjejlayTiR6BZx50HSaFrKYsT+3I8mOQuR6AyCGV/
	T5AzwZt4f3084nuz3mMrRCTiV22Krv6Gd9nirAuLMoR/8OECj5xsLs++O2P5+E1H5BOMqHxF7We
	ozxpnnLODF+nIRUtEL4hE4HQBf0siCDtameb288WHrK2S9bnPUPZ5IBH58jBRluFwXf6LRKIjn9
	QgrXxaHrKQxNpIJPzp9AZ6IdOv2PWfoHJ4y/84Xj6zgeqvsdfGsX6CVFXwp71piRUDQKM9OR0CO
	gvAVda7rpW0YBCR/xb3bFiP/VOhIGG+LeBCw9RGYDuH3a7BBUBDVyuqLaeaZOgwQ4Au+qHDG7Y7
	+3Na0ZnCHDnb1FNYqTodK2MIJ6ora2fR4orviE4UUIIL98
X-Received: by 2002:a05:6000:2310:b0:48e:6264:c373 with SMTP id ffacd0b85a97d-499c69ca8b1mr8604184f8f.14.1794471936694;
        Thu, 12 Nov 2026 00:25:36 -0800 (PST)
X-Received: by 2002:a05:6000:2310:b0:48e:6264:c373 with SMTP id ffacd0b85a97d-499c69ca8b1mr8604117f8f.14.1794471936155;
        Thu, 12 Nov 2026 00:25:36 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49884b99869sm14313091f8f.4.2026.11.12.00.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 00:25:35 -0800 (PST)
Message-ID: <1b764043-2efd-4e65-adb9-a47c0136446b@redhat.com>
Date: Thu, 12 Nov 2026 09:25:34 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 0/5] net: devmem: size TX net_iovs from the
 dmabuf layout
To: Stanislav Fomichev <sdf.kernel@gmail.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 michael.chan@broadcom.com, pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
 edumazet@kernel.org, horms@kernel.org, shuah@kernel.org,
 almasrymina@google.com, sdf@fomichev.me, leitao@debian.org,
 dtatulea@nvidia.com, asml.silence@gmail.com, bobbyeshleman@meta.com,
 daniel@iogearbox.net, razor@blackwall.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261111224740.2744522-1-sdf@fomichev.me>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261111224740.2744522-1-sdf@fomichev.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

A few (late) questions/comments to check I'm not missing relevant
points,

On 11/11/26 23:47, Stanislav Fomichev wrote:
> TX bindings use PAGE_SIZE net_iovs, so a frag covers at most a page.
> A 64KB skb needs 16 frags, and MAX_SKB_FRAGS caps devmem skbs at about
> 68KB, which makes BIG TCP ineffective for devmem TX.

... with default .config. You could set MAX_SKB_FRAGS to 45 and reach
~180K...
> This series picks the TX net_iov size from the dmabuf sg table instead:
> the largest power of 2, up to 2MB, which aligns every DMA segment. With
> a 2MB hugepage-backed udmabuf a BIG TCP skb takes a few frags. There's
> no UAPI change since TX addresses are dmabuf offsets.

... still this option should be more effective because the limit would be
higher and the skb would use less cachelines for the shared_info,

I'm wondering if making a comparison vs MAX_SKB_FRAGS==45 would be
complex and if you could do that, too.

> This doesn't make skbs larger. TCP still sizes them with size_goal.
> Only the frags get larger, and a single frag can now cover the whole
> skb.
> 
> An skb stays under 64KB unless BIG TCP is enabled. With BIG TCP,
> MSG_ZEROCOPY from huge pages can already create frags of 64KB or
> more. So drivers already have to handle them:
> - mlx5 has a 31-bit length per data segment
> - gve splits frags into 16KB descriptors
> - fbnic doesn't enable BIG TCP
> - bnxt has a 16-bit BD length. It is broken for such page frags today
>    and will be fixed separately.
> 
> Tested on two mlx5 400Gb/s hosts with kperf (udmabuf, 32KB RX
> net_iovs, 2MB hugepage-backed TX buffer), series backported to a 7.1
> kernel on the sender only. 1 flow, MTU 4200, receiver tcp_rmem capped
> at 16MB so it doesn't drop, median of 5 x 60s runs:
> 
>                                before    after
>    frags per skb (sender)       16-17      1-2
>    throughput (Gb/s)            208.6    211.2
>    sender sendmsg CPU (sys)     40.8%    19.5%   (-52%)
> 
> The receiver's CPU is the bottleneck, so the gain is CPU, not
> throughput. More of the transmit runs from the ACK path, so the
> sender's softirq grows (52% -> 59%), but sys + sirq still drops by 16%.

is the receiver using GRO H/W offload/big TCP? Which are the gro_max_size/
gso_max_size limits? In the `after` scenario, is the 2nd frag used for the
headers?

Thanks,

Paolo

