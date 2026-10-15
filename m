Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561F84E2F13
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062917; cv=pass; b=lF74fPJeItNgfBOGlMnOE1OdyWJpVOmNKz805JZ+0vPEXUeL4EbTI/werRcTxbBer7ZzERO6cnVDqH6QoC/B3oAiCtxOEYmOKwcfuerZVk2pZSBO5Sxu8lwZx294dK+l31zkoPNLQWP+dPE5pS74dyL1z391FXo2Wztm8lDljz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062917; c=relaxed/simple;
	bh=I9oPJ3YGlwxlNX6cpMBiC5ATHr477eWduZeRhnHEaoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tuYpBNor4JacAHGnqFjovOno3isvuwY4GWObIP0Uzf1DLpPg4GqIRLoZv3inrUvFUFNVPkReTe6ZjQbavpAQGRxLRzxV2DxmxGBEJXPmBn2XE2v6O2lqERRQ9lvYkyVNbgYqhkPogPlS3rACF5XwPPKDV8fWMUqKj0Ga2GguaiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=tFsok8Gu; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="tFsok8Gu"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b09e07e149so19764187b3.1
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 04:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792062915; cv=none;
        d=google.com; s=arc-20260327;
        b=NweQZaxHuyaUooaOwMG/rnzSA7RsLyBwtoHv+OLuwH1dyHvudIHQwN5zTk/Ajh9mmM
         GpZaiUgE36lWLaVCVn+5KBhoI7iyK2a4xSGhx1uWeLuOOQ/6NnrxKpsapLf+sM0Zw94t
         hY2PJtEIpRwex/M1FoQrFOOnznHrbfvgR7lbmljDJjbtDgn+gHhUJlKbeNzVYvT2PdVU
         Z7DdwtwcyeEbUXT7hVGf4Fn/VUMkmFuTqxx2312p+1nnJRN70LTIDnMKQds0LkvQ9GBR
         go6hahs4txEoPZvWC4lc90O2LDZ6yY0w/CLd5NskGUny9ej630R5bH3LKCjHjZlPAP6H
         0/3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I9oPJ3YGlwxlNX6cpMBiC5ATHr477eWduZeRhnHEaoM=;
        fh=jhqo2eBVtDMPiDI84PNkIl4GjLI5V7nGNAtkx2cC9ck=;
        b=QMN9HvVZsKcvcj3Rl5sSRuCC/T/sbXTGCy4l8Efg0NKuQKBi550zGFexVwcdP+YG3J
         JYrtCAfdewtW0HsDfKE/jldFLNWmHDXBZltEa9f2NoLV/SMIr8U8A6DsR2L+doIhvE+o
         Z8DoTDkzZ/jSleWtzN2TdVasB0nLkln1K/qUdcvLYmsMEHPGN0uNn0AAaq0KwdeRjQKf
         esfMHc8SFqjV6UJC9aeQGuLTo3o77wz/cGIfaf/HQx/EQ98ROIpqC1e1tD5KG+DL8Fg8
         xqUT6FLmpd8fd+N5C63Whyh1MnoIvOFwCzNx++bIKhNEjZ79RJc2qBJ9QQndfa0gREGH
         GebQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792062915; x=1792667715; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9oPJ3YGlwxlNX6cpMBiC5ATHr477eWduZeRhnHEaoM=;
        b=tFsok8Gu7pL10k+toUtA9U1xyWr1fKGTQGuD6siZNufYDmTlx5iGEacoYxtaO/9xuZ
         royzZQvQ6BThJfyJOQm1cjOvW32PR3hZrFJznN27ptUm1mghkbkPzgXvj2a6XHJP47TB
         bbih8OPOOMxnSjvYa3885JLpMvx+GgzIpy01s33Pr+h1OnjbITbetlHEid5It9BuxJdj
         +jtrJxAEb7mGxUwzI9gbGyCk7bauz2wHkzrmnfBsZ71s8dxlipqI21+C75FkHWcs/1y6
         QR+IKe4BLpXExBmfQlhIMoF33/KjpN4sl9hVB1ojQGf4RCv8Q7kgUbMcMuO8dLhZMhMI
         Fxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062915; x=1792667715;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I9oPJ3YGlwxlNX6cpMBiC5ATHr477eWduZeRhnHEaoM=;
        b=ELLBRkcozcTpWSr4gyFtTGxQslKEd15gAvCIJZC2nkQfw2Smgu//P0cIQjFlIu/8Fq
         AZxNjmqSr0OXRUzLDC2w4Vx76rRtPidDFeIAGnF9sxQJi3QIdjAPlFLLP0jrh09W84Bm
         0izk5wtq+4+A5xBGSk3JbH2rbj7mlWPU/aIVSDeW77OpKdZsUtsPYM8zrgO9zfD+wqQu
         PhecofNRLkDYHMROUm2LM5VeNhS5k6IivVD7L1GhsXD1OzGnKVe582qK5FrUhfsicvFd
         Ss3rZtDV8OXzdsKtgIOvW/KTncZdphkCpxBk8j1dNLjoCgvw3VYsD2TmZiCHzSq76dJN
         qshg==
X-Forwarded-Encrypted: i=1; AKwUvBzR7eI7WuYRkyep5gd/dMex5Lwmb2XkmvCmofYFd6xdFLUjOZsAELuS7VVBNJJkJIAgOgkm7ClHApoUgbw74pg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKs7ZeveHuEbdN5rA8ZvK1JJdyVIc1apGV1g4FNzdgGcZFoJpBz
	7hzrFMid+pSdN/dcxeXJyiz3MsflgeRKjJdKmDNbA4p0lXtFROjdG2lzLj8dMoq5S0JpNFx291h
	WEOTLQ71gGBEQ27HKpfZ5tEKwz8W13oBie9LIH7kq
X-Gm-Gg: AYBFou0MhQ4HhDwBPVWFpMnEUNwerulJgeKYjwiXpRc+4pdROvgHHoTwVPquB9Fi7zb
	v/uM+kGl/NJjY37mIjmO0OW2bXbFatH46hOYpm7W708ZwV4hsic1tOdUxJifNFiHmaImm/mCPgl
	6HEvRW4amYFoBPksPkAWv3q7IumDRIBBUVdS5mrnN+oUHlO2/2JGcMZxjjioJzm1waAT7u3QN66
	O+DrC2IUz6ZJRUlm9eudwL5bfCivUp7YFOftL4Wnp8Kv3BNtvQiaHjiExFTVMrB0mZc+Blh+Koc
	/v+O6pI6Mhlivr0dHMUvNogWzrNoODUPJq5ItnvpJDu7HtgS0urIeLCn5MDQHswYIS/POu/RsZ7
	fvDLg+/t8FbMrhLtjmofyUofdsoEZ/gkdOhklrKmWvUHHFlwYakByeogvU7k9v03fti1+oPwT3J
	kz37r+jQHFeYpvMSwBFccW0+MSSqv69CBa7Dv3R91VKLPSK06NasQAwgZI2wf/r1Hv54Hm0Q7bB
	l2EEc4TXX0QEOvLMuULbsgiBRIZCRHX/hVYi//8VcseisXk70nTL4FLgGQmh7AiWuXRDLr89syu
	+paFYlDt6d6dzQ==
X-Received: by 2002:a05:690c:7012:b0:8b0:cf3d:7b35 with SMTP id
 00721157ae682-8b0cf3d7ea6mr10078397b3.15.1792062915195; Thu, 15 Oct 2026
 04:15:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014235628.197976-1-julius@bairaktaris.de>
 <20261014235628.197976-2-julius@bairaktaris.de> <atCsGx2IRecQNK3r@chamomile> <atCs-U_AXIyvvpKd@chamomile>
In-Reply-To: <atCs-U_AXIyvvpKd@chamomile>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Thu, 15 Oct 2026 11:14:38 +0000
X-Gm-Features: AclHuK-GCm2OH3Jid7zEvImtoqSM3gq7UTcC3JLFEhmei75CLrzAl8zOZjCyOVw
Message-ID: <CAC1t37+g_5q2NbKmCkxhZthdHYabypyDZSoshwgAUVjbGm0NsQ@mail.gmail.com>
Subject: Re: [PATCH nf-next v7 1/2] netfilter: flowtable: tear down direct
 xmit flows when the fdb entry moves
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter-devel@vger.kernel.org, fw@strlen.de, kadlec@netfilter.org, 
	phil@nwl.cc, horms@kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, razor@blackwall.org, 
	idosch@nvidia.com, ericwouds@gmail.com, dqfext@gmail.com, 
	netdev@vger.kernel.org, coreteam@netfilter.org, 
	linux-kselftest@vger.kernel.org, bridge@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Pablo,

Thanks for looking over this.

I will incorporate your feedback and send out v8 + explanations for
the questions Saturday.

Julius
