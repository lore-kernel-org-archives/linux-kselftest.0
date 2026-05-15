Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E007D3E4C7F
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 10:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840787; cv=none; b=UhLrz+mKKgKu5yXEbnCAqGxjMH/GgaZjU/Dy3Q74rO8j5e3LIQiRCMH5N0BzooXMu9mJFnLP113+So7ZDGls9Wxx4+Anz6+qx8AAlMdu53Mra5aE/lvz2sjzAraiadmwCf2vgkXGyqtqyornr6VjUiR487e1xyCY3bIGjupqzN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840787; c=relaxed/simple;
	bh=n6/8XoyOcyWPTIe28ELVeszjm9hAAv6mm4s2tszqSTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mu4a/mEmCRo8OuYRdSWjoJq0DvPVKGDhOi2Wts7xePkCW0hEq04fFltwSYiNPTrkhVf4Rrkcvx8EBz/8RyW3PVjT9nsnhWZ6bG8ut5jGvzREYBEpgNfowIGQpONdlCMEcs7NFU+RtJvEwXwiVhs5e0GOPTQhC/yrf1JhI8hPAA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bL/Ss4/f; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bL/Ss4/f"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso61517455e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 03:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778840784; x=1779445584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m8javZePBSomMzDxRk4JOXFkifBGHMbX/5UYzJMP8uo=;
        b=bL/Ss4/fi2wuAEq6gu8KB/BY6SkHIqMeOlOpNGxCJywHG4CY04waiCNaePT+VfEAbf
         syeVpHDuy4pRy/UvU3OLclME0o0jkab8irQLYXWcIWcPguieJhmIpCFdzuzAMz2kxnoe
         6HOVNSdHcK8PluZorhVtshQZC0HB0J9XWKb/8+YVbfI5+pJ4pFH1DAc6E4ouxbdSg8Nc
         HvEJbMBivEOhkf3NNiIq0BxHVHG7ksdIyfbkiw3MNptlldqgEe7robZ+kdo4W7pwGI5b
         4apCGRBY74bhYAUsBtLV0c77pYjCDOeCUj7Bn8SJOqzlut/qAbHkRpWXPlxdmIeArN9C
         KWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840784; x=1779445584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8javZePBSomMzDxRk4JOXFkifBGHMbX/5UYzJMP8uo=;
        b=D3wwD5rQWYg/yIJYjhIdMYBpOuIMGQZTZksLaN61mfFTqlQRFHRyUP6+UM1vi7LbaM
         PhDz3ispv/T/I8rqw5kNl6D1foJAJviJT32TXBYBoJARbj9qNMVxVFnGAuo+4ATH6smb
         Crf2RGf8Ym2ogRF2BxhfwojKCwGbBNrQEMrNZ4VhwQyMTfk4AQswmB4E6olUoDKaO5R9
         Hqc9HDI4zeMiXWnUGnJCN5UIbqYZuhxGDbBk2gjg5vNAWCB99B/7Ahxtvu4MCk51e8mz
         VPjwnQEnRbXjOA7mc/yAg3jUY2cswNcp0Sm9Xkvb1zGIUT48QGRsK+vr8MRNr3O//M2y
         irig==
X-Forwarded-Encrypted: i=1; AFNElJ8TsA2AKSEGoJLzdu4arCrHYOYfVom0q/ow8o21/jWzGkGpsrq8uJpZUM//CsZ9rA6nU0mtFAAB8rjozujMG7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoZamItN0Ep+c/gsp0WPgcCSWO4SyMLgqMcfAbewLlOS2bJSRv
	OK03IyWhXzuQwyfAPeZztgcQi9EuhaPMFU7bBLCJAzVY22ADwaEEsqBb
X-Gm-Gg: Acq92OFrrnQy72/GQdFxjS/wSph54GJMW3uNuk2v14WLyA3YnDZrGSoLo80fDXa1OC3
	1c2pPV18GcGMjcFpcYVs0JsRlqPXvzBSm/mpd45FX2wu+FQ2Fm14tBlzWzxkCkThiuKBYykG+kP
	bUBHDG2apRazhTMrrVum1yx0oOd1he1+LHEu5Mr+Zf2eSQoji524Xesh83eY+8OwBccM1lPXQEn
	I25L8bTs6WUrZQ4vypcr/RaWWA/iILNHLQVrf5ybjioqzKsxXRmqcBD9KGGGIakQR51SBa4K6r4
	/HhaP0GPSI83M89TB232YXYhuWwecgop9fUg6dQy27SYTiF5SgaOP6eikP9VtSPl1+el0IW1x7H
	HuelxOzxmReiaaYeEqVGGD5cNp/MsieFTLQv/ifRYfzYZRv7IRFmvlin9MjeAgC3FFjUNoStA30
	hskvkE1YQxtcsOHVPRDTykeSOE/0LR+Di6znltdYG/X3qCxMOZxcBnzBIP6IL8VuWDnGVRdMTVL
	mOVBtUaP9Qe3mIlK7QPIhVIo3uCXhyiTKEtcnD3IuZVFmLxx59f0opmZiI=
X-Received: by 2002:a05:600c:2d09:b0:48f:e1ac:c96d with SMTP id 5b1f17b1804b1-48fe61f2bcemr24840585e9.20.1778840784159;
        Fri, 15 May 2026 03:26:24 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:5f66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe6b60csm14137405e9.6.2026.05.15.03.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:26:23 -0700 (PDT)
Message-ID: <9732fdae-5e0d-4373-90a6-251d270eae16@gmail.com>
Date: Fri, 15 May 2026 11:26:05 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] io_uring/zcrx: notify user when out of buffers
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>,
 io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Vishwanath Seshagiri <vishs@fb.com>,
 Vishwanath Seshagiri <vishs@meta.com>
References: <20260422112522.3316660-1-cleger@meta.com>
 <20260422112522.3316660-2-cleger@meta.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260422112522.3316660-2-cleger@meta.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/22/26 12:25, Clément Léger wrote:
> From: Pavel Begunkov <asml.silence@gmail.com>
...>   static inline struct page *io_zcrx_iov_page(const struct net_iov *niov)
>   {
>   	struct io_zcrx_area *area = io_zcrx_iov_to_area(niov);
> @@ -531,6 +541,7 @@ static struct io_zcrx_ifq *io_zcrx_ifq_alloc(struct io_ring_ctx *ctx)
>   
>   	ifq->if_rxq = -1;
>   	spin_lock_init(&ifq->rq.lock);
> +	spin_lock_init(&ifq->ctx_lock);
>   	mutex_init(&ifq->pp_lock);
>   	refcount_set(&ifq->refs, 1);
>   	refcount_set(&ifq->user_refs, 1);
> @@ -585,6 +596,11 @@ static void io_zcrx_ifq_free(struct io_zcrx_ifq *ifq)
>   	if (ifq->dev)
>   		put_device(ifq->dev);
>   
> +	scoped_guard(spinlock_bh, &ifq->ctx_lock) {
> +		if (ifq->master_ctx)
> +			percpu_ref_put(&ifq->master_ctx->refs);
> +	}
> +

Something very odd happened here. It's not my patch but rather an edited
squash of two other patches. This particular hunk creates a circular
dependency, i.e. io_uring waits for this reference to be put down before
destroying the zcrx instance that triggers io_zcrx_ifq_free.

-- 
Pavel Begunkov

