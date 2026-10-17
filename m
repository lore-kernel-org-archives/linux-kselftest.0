Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3139481652
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 10:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233465; cv=pass; b=Dktl+76ggLWCY2DrnKud5SJUh08h5YbZg7Ue7Y3Y4w1uIAZm0MCvfLc92f/NNuJfXRrcaAdU0UpAIjWcGVu/NAYXqEbdhNLArGeC0s5pne0xYj/JSymgqR1QZG1TINQmfdy9d4Bq1BoG6UhYdJ9vxQxmR5fbiF70rzSuAj3h2wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233465; c=relaxed/simple;
	bh=DdTRwYsOyMO2Pon1eB9HGGKKuUN6WYiZ/XENSt+d+ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i9/qFT11JD+UjqQV3+tPdAUpbl0K+kLX4Eu7kOzuC+NN99xRSALRsTG9V2pTdsmzk0sHcQ+FeSzPxaX62BWjGzagAdz5tFGDUL/q6oc14lHKIUozpEhL6BO2dD8VVTeEA/olUBscJUbU0cSyYoj7UTCcyQ7gjGesMt8KAE72OMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=Gz8k7RRe; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="Gz8k7RRe"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6798eb0d13fso572784d50.0
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 03:37:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792233462; cv=none;
        d=google.com; s=arc-20260327;
        b=ESUXQdL4JuhZxU2cG0JczUiw/8GmISenXoo6j41+wfyBNxTOr9UfuHb8+ANnLi05xF
         o6ZuIKWvN8tBpE7gQVC97RAAzOZIQtrg+JzNFvncY0pQOePaweQxrlyizG6xYZnO8hyh
         PSer6WMlj4kMleXRqBV/n+OLOIZr8EBlzaX0fHX4uLA+FPwUE1bUlmYkY+x8IgQ3M7hN
         /iqbUcrSsCvs2Qu5520K8vPtedivUqqXSi/Uk45pJhso35b1PG93P+a1vSvY+1o/OFzc
         EDJC0fnqvDAdBED6Vk5hCO5h2J73n4xxCLcZMoQCeptJifFkKLdPLCPD8Ghv+twcPyUm
         22RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8xQtVA18Ly6EVrTffA/+C9Ju5Q0HewYi23Ad/Eu06YI=;
        fh=G6VOARoXafcZ4f4xrID0A3kH3qPIrqkHDdcfmalZ6QY=;
        b=G5oOHq/swz3NJFrcmCXZKM9WhCISWHwodHFT3DPr52udmUPh1POf0/ZGq7BKU5eBo3
         BlnQ8n/jT+x4P8XPCNONmH+Zsrpvu8PgmKhol8avjaAVT0+xA2oVHX88vt/ByVzm4hNB
         etP7xKS5vSLU/xrjogsX1SfJzIC1rQDFmjpW/TYsI2+aAJfr5CBjRFb6edf5TjOdeckx
         QiSSBOOyAaDCP81l8p8Q11VhK3dyWb3SnGveHzz/CXwsj/1ZT31Aq+GYzfvAn2q756NW
         iXgVkaWv9nL3mR9L1LGXu7QheSbWSKsJPPEq6jhIbx8TKd9oqjD9B3jPVsWBQzrASBnO
         vqBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792233462; x=1792838262; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8xQtVA18Ly6EVrTffA/+C9Ju5Q0HewYi23Ad/Eu06YI=;
        b=Gz8k7RReE/vgqJIU2IlmmvzZtxgqj7Zoz1Pqg9mI57Ea0Zjc9gnNpvTRM8DDyEByI8
         KR4iQRBvgZjjOWswddPDV1Tl/sWmckZUrR2NlxR2jl42h63QQUetaHO6ieZGz/8wmWZ3
         MIMzj31omne/mFjOOAKGgAvjQvM4c5omH1sOhnT8KjKTdWh1dAQoSfuwK6uVJCwBNqPh
         T1TQ6e8QIYjRj9JeRF+24xakerjrFEM5UAcQ4d4Iy3cwyT2oKVeqH5JvCYZfYnk3oJYk
         emC21QpdAUUd5mZGxoOv7FN+tsAPAl43Cx/+SW3/XatAAY+2Jukl3l07heiWDmO3MnXX
         02UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792233462; x=1792838262;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8xQtVA18Ly6EVrTffA/+C9Ju5Q0HewYi23Ad/Eu06YI=;
        b=czXqAtIBYXsDesHMTdo3YcY1uyg3HOHfa7d7SdyWG2QJzOvNikmjbzfJtKCnUJDDmS
         Eolt96kWS+dGPJJWUNl/2J/tKoopwbP6HVaA7cfF+Nycm3LogCLFXLSnRpHGxb4WRWAR
         1RRnUIyOExffd0dFgIiUF25QRtO+645a8Xi+dRx3+eOQQ8LHLyANb3lCGdRsxcfrB/2N
         NKLIagFWkYffK5UI/XthiuE41sDEyS5Zxmkk8vh0AcRqJFxaLxqYH8OTXUyb0ECbwAv7
         2BTWKrG0/WAPsyCS0inD1ZvKsyBq10pA+zZXNcBuSzmloJqwL/nHC0dO7w7OfU1o80Wv
         662g==
X-Forwarded-Encrypted: i=1; AKwUvBytX3MtZyRCxkpe/uN5SbEKD30406xsm28m8nUlLX6ykvigdSH8beXjvyKfWGMZCd/N2Hd28PV26uzPlTDdl5Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1clodFiwYl6VskANMkHm8s6RTQod8RtW5iQOeOeEpyDt8IYYC
	wslXRFNmKPNNK5KekOutv0i4TlhOFlnIrLEFhiOUAAQkozll5aIE2QxMuHrS7gqLsYPIdCF/Ulo
	yvNA3L9RsaSpFtbKK/ywd56natL4d5J+vnveB/uWz
X-Gm-Gg: AYBFou3dTkl2764ETEd45O0xE1/ToOWRgH/Gs+fC0ehHIoVJ2hIm/x38ZjbYMGCyUt8
	ZDyTTdGI+4UMXF37SxxfyU96zBBGK4r0zjPXmE1w6rpgbjFMRJj2y0HKEwWLgPveTfZZRZxQOK2
	9Kr/sPOR+TdTJ+Raw25Be0dAJNMIAFsc8aX6yxhYnlFr4UzAv37RMCIDeUSHvX3Wrtxc3tGRuQx
	AA3/enYTZ3eTpRvKgKIMEIii2R8IPgOmw7kKSMTofxJvGviA9mlp+wkFWmEzXZ9Z/yhrxbWHv4I
	9DFVO1qvStXhZAi4UDNJj2L+1vgBBOjHkoGrvbY4L1TDMSFEDboBeulThBva8N8aRRBdji2TYeL
	LGLsudSsQASYsIu2SQJZdPjByCyVKN8uJZsIY5NMW9b0Y/ubqjKIDlARILZIeIO2BVqEpLGW2oG
	q6OabnnsU8idxC4yx9Eo80/vKKSgF5T7LKWNArSV35WM+ErC+FfRhN181U6z1Gxe4N8IM3cmlcv
	tif56ZHjtoKLMLAtXbOpwLDK9FqQbj1V0evRxhNPVkiI5TpCb5I+xuq2gr5ullSHgqRGEpLx8wu
	wj2Gpg4kTRlhKg==
X-Received: by 2002:a05:690e:1913:b0:674:981:a937 with SMTP id
 956f58d0204a3-679ca914780mr522735d50.121.1792233461776; Sat, 17 Oct 2026
 03:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004171616.3544880-1-julius@bairaktaris.de>
In-Reply-To: <20261004171616.3544880-1-julius@bairaktaris.de>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Sat, 17 Oct 2026 10:37:05 +0000
X-Gm-Features: AclHuK-ma-16nXT2QPoniX4Y6rIglK1_-HkBDcD-pfQT-pjJWoWmgSkOWis1dDQ
Message-ID: <CAC1t37LLnXEaD2YDSj1iBBxezSKjHGNqm_AR9G4s5Nhy_O=9mA@mail.gmail.com>
Subject: Re: [PATCH nf-next 0/3] netfilter: flowtable: update upper device
 stats in the fast path
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org, fw@strlen.de, phil@nwl.cc, coreteam@netfilter.org, 
	netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@nbd.name
Content-Type: text/plain; charset="UTF-8"

Hi Pablo, Florian,

gentle ping on this series. Let me know if you'd like anything
changed.

Thanks,
Julius


Am So., 4. Okt. 2026 um 17:16 Uhr schrieb Julius Bairaktaris
<julius@bairaktaris.de>:
>
> With the software flowtable, packets bypass the bridge, VLAN, PPPoE and
> tunnel devices above the flowtable device, so their counters only see
> the first packets of each connection. The classic forwarding path
> always counts them, so this series does too, without a flag.
>
> Patch 1 adds VLAN stats helpers; it touches include/linux/if_vlan.h, so
> a netdev ack would let it go through nf-next. Patch 2 updates the
> counters from the fast path with the lengths the classic path counts.
> Patch 3 adds bridge, VLAN and tunnel counter checks to nft_flowtable.sh,
> which fail without patches 1 and 2.
>
> Hardware offloaded flows are not counted. A GSO packet sent through a
> PPPoE device counts once, not once per segment.
>
> Cost: struct flow_offload grows from 296 to 328 bytes (slab object 320
> to 384). Forwarding from a bridge with a VLAN port to a veth in an x86
> guest, mean of three interleaved runs without/with the series: TCP
> 55.7/55.0 Gbit/s, 64 byte UDP 177/173 kpps.
>
> This series was written with the help of an AI coding assistant. I have
> reviewed and tested it.
>
> Julius Bairaktaris (3):
>   8021q: add vlan_dev_sw_netstats_rx_add() and
>     vlan_dev_sw_netstats_tx_add()
>   netfilter: flowtable: update upper device stats in the fast path
>   selftests: netfilter: nft_flowtable.sh: check upper device counters
>
>  include/linux/if_vlan.h                       | 36 ++++++++++
>  include/net/netfilter/nf_flow_table.h         |  8 ++-
>  net/netfilter/nf_flow_table_core.c            |  3 +
>  net/netfilter/nf_flow_table_ip.c              | 53 +++++++++++++++
>  net/netfilter/nf_flow_table_path.c            |  9 +++
>  .../selftests/net/netfilter/nft_flowtable.sh  | 67 +++++++++++++++++++
>  6 files changed, 175 insertions(+), 1 deletion(-)
>
>
> base-commit: 87b80c2f6b05cad9f0ff9136709c62a0f59923e3
> --
> 2.53.0
>
