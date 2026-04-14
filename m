Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A923B6347
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776156839; cv=none; b=PfIDz++wRVf4f23prThJyMLCsCnpTf++HZXdf35ugG8Ko4xyf0ElFkYwV0lQaw0ZY124Z7FHxg/gbCzueqHZeLBfSQq91VtQcbog8E5ZpEzAOZgJlNEOYS/rJ24GUyCWxOxg8D8LYIbTFaAw9YrL+e0r2Y8jdcAMu00Bn0x7Ezw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776156839; c=relaxed/simple;
	bh=OVu9KdSJZseM7Nt2ItB4OpCFv/h6niQO/sezNN27FOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GR84m7jcFnu7IhLY574DhwDfc5hZuD+7k4O/yd0neLPvlhH0MgxFKh59cPpdGpdjyNQrGxwsM2nkMEmN0bpwVvmcY3QGEn4f6ll5jAyCYI8SzJSStEH+L+NdoMPBw9SL3SLS3YVhBURv34zqdwJPJhR1x8Zbt0Ig9JY2HkMqn3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CKKyqhqO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=D8045Z7D; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CKKyqhqO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="D8045Z7D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776156835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oxmBacf55etftW8UnPkV/EpOImxHgh4CswOaaLPDOw4=;
	b=CKKyqhqO2So0XpOB4Uh/L9Kq3rF8sqLrwta2N8pLYMrogylHIgUicCxeMU9HRexeSicwts
	ryvVpSAg5otUrSF0cqmkD9nQCFSiYE3zghYUchT/hVf9rw6DZrTGxATC6+6sYtVBi0gObC
	PLlgM6rO4wcefbgrdtsUTaDEAgeerAw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-RoDMknJ9NpmAhrq9PFujwg-1; Tue, 14 Apr 2026 04:53:54 -0400
X-MC-Unique: RoDMknJ9NpmAhrq9PFujwg-1
X-Mimecast-MFC-AGG-ID: RoDMknJ9NpmAhrq9PFujwg_1776156833
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-488d64eba6eso26516675e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 01:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776156833; x=1776761633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oxmBacf55etftW8UnPkV/EpOImxHgh4CswOaaLPDOw4=;
        b=D8045Z7DM4W6TRMmcU3o9sEfc1br3fLGCCWbiZy6gZ036NAzT2SNL1ZO0JRVW9NAv7
         +/L+RVVPNigrXF2DTqzeIkotIPNfokQwJlrQj5oUABBwTuD4dKek5A2WdNiDzYj3S+uZ
         L+V/TSILikmX0dFpylurwkW4cfw8vTYf0J50Xl3K60H7BGw56Kxx5bCe3AtsBCQJqyE4
         ZP6Z+02zx609KNdcioUQv61v9vxZ085+TxmI0XxZ8uYCRh5+ukpYnv4RnljYl7uJXE7o
         2QmZ2mQTdTw91jnJEA4CyPcHyrNgZyJ2USNACTRucftITeH+uT4Xp798U2m5zXwONzmQ
         d8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776156833; x=1776761633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxmBacf55etftW8UnPkV/EpOImxHgh4CswOaaLPDOw4=;
        b=OB00R2frpXlp5rliIB20rm/yHC3GdGnW718u+dxMqI/VOTHeAeb2yiWbrSh71TT4L4
         93+ex8d+vUNvwND75/WQ4hv1Z95+Vu2DqvNrJpDL89B2s59cREtPOPIjmiL3LmmhR4MY
         7WcSVUywxo6t+RwZy4m2iBAJP+wC7MhdTkA4lYZgRHLyQ1DkuWuCZc8zl1SyqlMksRt9
         7zT80lUbEzyzjyyVynqm2+RpLxC7SArEY0loQiWSQoL1ztNLt+kmNCyCftWH4xK6mSNh
         u+pE8i77bxkv/es86H9S7a0XSfbI2+nyS+oUf9JM9tUMOpvfrxwyksBFV5ECjXZiwnHg
         nt7g==
X-Forwarded-Encrypted: i=1; AFNElJ+LS+o3HQ2e3eE2WM16JbI+UiM5f/KnmfUZIdTqaZRVvu+qz5S45/w2tnyWYbkOA3Gph/1dLFOpcANQkmhQLx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvoGsU/zISrustHaw/KsMEox9h08q8uGpQlGX4hlKn5jwiNFCQ
	VElTgeRArzJuEs+tJllRZj6ZMhxhYUk9+KmOMh0olu33YukqDPwiNZ7S/7zNg9Vy0JLHBF4rddO
	jrcDPBhx89Ft2IiFcpPstm4xjRUbFju4DWF9kRBp52jzEnXE5HO/G1XlfFJctFDaD/Ynhgw==
X-Gm-Gg: AeBDietHNWV/KXEjNdyfshhh4YL9T/pP/BdTpNrcLepfa6g6Pf2DSTjthbYxFTG7Le0
	wiAdEBz4554G3Q5Wv4hgXXjbSlAISPZ8sfU2htk8OELuOy5YVfi4410KbhVqx03qv8NA+vv2izD
	Ds6eiJlRw57XAoPPs9/yPDKslk2piUi+0o3cDlLeid0wqZvtBxv5Wd3N2nu/2f6oSvBckpN7Mwh
	4N16WyFbk+72RdRFoCc4voQQdptYJ7guUXR59mn1dq6Gw7l7Fzs6RJnwmb4j5lpmFCmwlAZeATh
	t4Lg463tXnKjWNjhLBwWXAeGHnRSzKP8xD5RiCtIgERqSuT6/JyhYS+ujCIeJlvIsY3OEE3thEN
	2B/Jjb50Wc+L43eLduPWudA7Bw01geprLIbu/zGurWRonsxP4DavApArC
X-Received: by 2002:a05:600c:3150:b0:486:fcc7:d6a with SMTP id 5b1f17b1804b1-488d67f4c4dmr251372885e9.13.1776156833185;
        Tue, 14 Apr 2026 01:53:53 -0700 (PDT)
X-Received: by 2002:a05:600c:3150:b0:486:fcc7:d6a with SMTP id 5b1f17b1804b1-488d67f4c4dmr251372295e9.13.1776156832656;
        Tue, 14 Apr 2026 01:53:52 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d6f4bf2b4sm23579778f8f.20.2026.04.14.01.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:53:52 -0700 (PDT)
Message-ID: <c79bdb62-eab2-4bf3-af8b-3875730adc53@redhat.com>
Date: Tue, 14 Apr 2026 10:53:49 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v7 1/2] net, bpf: fix null-ptr-deref in
 xdp_master_redirect() for down master
To: Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>
Cc: syzbot+80e046b8da2820b6ba73@syzkaller.appspotmail.com,
 Martin KaFai Lau <martin.lau@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Jussi Maki <joamaki@gmail.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260411005524.201200-1-jiayuan.chen@linux.dev>
 <20260411005524.201200-2-jiayuan.chen@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260411005524.201200-2-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/11/26 2:55 AM, Jiayuan Chen wrote:
> syzkaller reported a kernel panic in bond_rr_gen_slave_id() reached via
> xdp_master_redirect(). Full decoded trace:
> 
>   https://syzkaller.appspot.com/bug?extid=80e046b8da2820b6ba73
> 
> bond_rr_gen_slave_id() dereferences bond->rr_tx_counter, a per-CPU
> counter that bonding only allocates in bond_open() when the mode is
> round-robin. If the bond device was never brought up, rr_tx_counter
> stays NULL.
> 
> The XDP redirect path can still reach that code on a bond that was
> never opened: bpf_master_redirect_enabled_key is a global static key,
> so as soon as any bond device has native XDP attached, the
> XDP_TX -> xdp_master_redirect() interception is enabled for every
> slave system-wide. The path xdp_master_redirect() ->
> bond_xdp_get_xmit_slave() -> bond_xdp_xmit_roundrobin_slave_get() ->
> bond_rr_gen_slave_id() then runs against a bond that has no
> rr_tx_counter and crashes.
> 
> Fix this in the generic xdp_master_redirect() by refusing to call into
> the master's ->ndo_xdp_get_xmit_slave() when the master device is not
> up. IFF_UP is only set after ->ndo_open() has successfully returned,
> so this reliably excludes masters whose XDP state has not been fully
> initialized. Drop the frame with XDP_ABORTED so the exception is
> visible via trace_xdp_exception() rather than silently falling through.
> This is not specific to bonding: any current or future master that
> defers XDP state allocation to ->ndo_open() is protected.
> 
> Fixes: 879af96ffd72 ("net, core: Add support for XDP redirection to slave device")
> Reported-by: syzbot+80e046b8da2820b6ba73@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/698f84c6.a70a0220.2c38d7.00cc.GAE@google.com/T/
> Suggested-by: Daniel Borkmann <daniel@iogearbox.net>
> Acked-by: Daniel Borkmann <daniel@iogearbox.net>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
>  net/core/filter.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/net/core/filter.c b/net/core/filter.c
> index cf2113af4bc9..9ec70c4b7723 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -4398,6 +4398,8 @@ u32 xdp_master_redirect(struct xdp_buff *xdp)
>  	struct net_device *master, *slave;
>  
>  	master = netdev_master_upper_dev_get_rcu(xdp->rxq->dev);
> +	if (unlikely(!(master->flags & IFF_UP)))
> +		return XDP_ABORTED;
>  	slave = master->netdev_ops->ndo_xdp_get_xmit_slave(master, xdp);

The AI review noted that the master could be (theoretically) NULL here.
Since that event is not a regression (unconditional `master` dereference
already present) and syzkaller failed to trigger it (despite being the
sort of thing syzkaller is very good to find) make me thing it's better
to eventually follow-up instead requesting another revision here, but
please have a look.

Thanks,

Paolo

>  	if (slave && slave != xdp->rxq->dev) {
>  		/* The target device is different from the receiving device, so

