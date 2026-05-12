Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20CB254B18
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 11:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778583776; cv=none; b=tdes2FVbYcRiY2zEBVO7cp9D2eNYC/LA7yyeR0ljdXXQdTiELCitdGiqYdVLGfAgZZZC7fAPRykzg4BRvk/iZnFYdpvDddMKoSP3lVdY2Ibkz71nKKfvRp5vqfgibT1GMHOev3PNliSNEMSqMlMGolSUIuvv1XiItQdI/Htm3dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778583776; c=relaxed/simple;
	bh=Ga5JPf6n1jpdDjVA+pd1zKMfPwv8abcvqFDXHuktbVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPZ8gnH97GXXWws1cu9FX0wjOWupfCa8rotYOID9KouWB2fBEnSz67AhmaDt3D3CMaSfdfS+GLRa+8cJzx25nVImYmrCIKPTb7o3/eJJWWfkNIISeX+pkmjyZIAMcQ3wJ5INYuxXejBdltB4O2qcPJ41HljLDgPGDBJh1kTT16Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMGI6aSI; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMGI6aSI"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so36429465e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 04:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778583773; x=1779188573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FFGUETPgm26h9XFyqe9suVV5/326pTXPraqjVQBHotQ=;
        b=CMGI6aSIa1QSUGEppO5DZE5bStYL/YvJxZ/qJsxprMZcqpr8jjcRldFTgDdmLikjRE
         3BnhZVQ38O8BBjeXER+GjcK13KWR8cV5Tp/jEfXjg+EGafjTy4NmUt3qe2tSG2sLzdMt
         +RWW76NNBeEe4ZR1P5NHKWyUaTlbPZDXLFkq6UEBFkThTiH6vzhf0zT6YtiUeAqvWzTe
         yIA/lz68/8Xbwmz9hW7HA41UF/9xcIqS6nlFjjKXFZXPdZjXTSgTN0XaPpsO5IxOaqF6
         u2ItGLIvsJhnqkeJN0wFNvCnY+cJGITxtre4L9T+lf6IN6JXzImjg4Cnpslix/VXYglj
         Teow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778583773; x=1779188573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FFGUETPgm26h9XFyqe9suVV5/326pTXPraqjVQBHotQ=;
        b=YTCeRXATxoTLba7Z05GsCo2IuBcDPr/LLCe6xOUfft1qby3FdwjvPywf/NS21L+mdc
         wOoBBRKuRSDwNe2TRxhEuE9DSRcESKgxD8tW28FsZNTzjG9vESrsBNI+O/eEI8e4pAZa
         fPbHBuwfxlnCkwlPH17eWvvQ2I8RYkYv5ZC2VTCCfqfoXfxhDcu+lKSlbWvy6VCl4UTn
         cjP/HGFS14br67dJIXwoRS4RrlEWgnyc+H8e8Lksg2qNyq12tHKNJC9aATBflSRLAvLB
         CGmw5l6lWfu9GwdsnIF9IzI3K/ujzmcJ/R2YLc8x85df4QrA+JRjwkO1LtO7RNkEKnnY
         RErg==
X-Forwarded-Encrypted: i=1; AFNElJ/hsFbt9sZl5FKG9Y31mn4L/aX+tJoKTgRugEEkYijQXvzZzj65Af34NQ8UDl9y2Zb3gh9mUmBMM6LTs1cGlKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR+3c32LNlafaq9+H1/CBIqLKPcJeOnuFsSQHJdvsVhcVgscLq
	JB8KBsNoJQQnbemjtJGBneEbGfwAZ+LSKSPjPSdmrsF1UXAcdmEa0MQM
X-Gm-Gg: Acq92OFMoYZnPUVGx0LeQDpRnSHhdTfTrg79mP3B1EGlA9/zAOJbIiPYbAcqAXwwmDd
	MQYCJ/KhrZq1gdYM/puRcVUN4LjkLRq4M22JO28F317MYNa9UVf1HXvC+vdvJboPCGnebSZAvSv
	lkYJt6JU7Y3bzN6fMMbrqP9sjRtOqiHVY6vloahCEIKGp/ZDB2Y+QAfdKjnxq5esaNyLt42NpsX
	z+DGHHz3J6CZN//WJKhp9XT1N0Geyp7ANw4ZQhNX4FyvXHJuEEF4GJ237ZRqedGpKDllW1eSMsC
	2UcxPx4WC7P6qa6ZwSMJ9ebEWydVOOvxAWJkc0VX3IZMwgr0fIHffeNg3q0mcBUxhJvRlJWykFp
	wueynZqZJShcDlRyH8Z3ABgIsJ1vpCre06EfMhgsLrbqyMNZ9ht1KOIFnB9svWeUWkN/o6+a9Fj
	FpYurMEeEamYNdLlWiCUJKYBGWxnYpkD1H4eCrlkA6rhKLLwgjOPvwtzXs3xoD1m+vVQ8YYbjn5
	SAXBue2c0sr4d2who0rlsjTDZ/so5SsNTLvZzU=
X-Received: by 2002:a05:600c:46d2:b0:48d:50a:6ef4 with SMTP id 5b1f17b1804b1-48e8e210753mr44805285e9.11.1778583772968;
        Tue, 12 May 2026 04:02:52 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::372? ([2620:10d:c092:600::1:8c90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3e174fsm23962585e9.3.2026.05.12.04.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 04:02:52 -0700 (PDT)
Message-ID: <539e235a-2027-4bda-ae26-00200c53cbaa@gmail.com>
Date: Tue, 12 May 2026 12:02:46 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] io_uring/zcrx: notify user on frag copy fallback
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>,
 io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Vishwanath Seshagiri <vishs@fb.com>
References: <20260422112522.3316660-1-cleger@meta.com>
 <20260422112522.3316660-3-cleger@meta.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260422112522.3316660-3-cleger@meta.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/22/26 12:25, Clément Léger wrote:
> Add a ZCRX_NOTIF_COPY notification type to signal userspace when a
> received fragment could not be delivered using zero-copy and was
> instead copied into a buffer.
> 
> Signed-off-by: Clément Léger <cleger@meta.com>
> ---
>   include/uapi/linux/io_uring/zcrx.h | 1 +
>   io_uring/zcrx.c                    | 7 ++++++-
>   io_uring/zcrx.h                    | 3 ++-
>   3 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/io_uring/zcrx.h b/include/uapi/linux/io_uring/zcrx.h
> index b8596d7d47b6..e0c0079626c8 100644
> --- a/include/uapi/linux/io_uring/zcrx.h
> +++ b/include/uapi/linux/io_uring/zcrx.h
> @@ -70,6 +70,7 @@ enum zcrx_features {
>   
>   enum zcrx_notification_type {
>   	ZCRX_NOTIF_NO_BUFFERS = 1 << 0,
> +	ZCRX_NOTIF_COPY = 1 << 1
>   };
>   
>   struct zcrx_notification_desc {
> diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
> index 35ca28cb6583..732e585aa13a 100644
> --- a/io_uring/zcrx.c
> +++ b/io_uring/zcrx.c
> @@ -1510,8 +1510,13 @@ static int io_zcrx_copy_frag(struct io_kiocb *req, struct io_zcrx_ifq *ifq,
>   			     const skb_frag_t *frag, int off, int len)
>   {
>   	struct page *page = skb_frag_page(frag);
> +	int ret;
> +
> +	ret = io_zcrx_copy_chunk(req, ifq, page, off + skb_frag_off(frag), len);
> +	if (ret > 0)
> +		zcrx_send_notif(ifq, ZCRX_NOTIF_COPY);

We also copy the linear part if present, depends on the semantics
would make sense adding it there as well.

Pavel Begunkov

