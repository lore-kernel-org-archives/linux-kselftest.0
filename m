Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D223839B8
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 10:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778583575; cv=none; b=X4WPhuUtKoxejOTYJ+zwMbXicq0CxL6wEwyl1Z11icrJ1GbFiqWNPYw5hRONME8IPr+/nHMaD2c8HG/zMOtau63qzwAqFNDldQXI1BV8f0H8MFJ+7TnDYlu489EL+aRsE2mxPmvUJ0KKekg62XE0UhdFBC+uPvfWw50lViA14Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778583575; c=relaxed/simple;
	bh=2O6kMZeCfa2WzuVxLVjO6q02eX3L6eA7J+7iqPYMAV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tZCYnV3gQYMkokkGFXASxCuoJ7zV71ynV8XAd8Ymsnd0Y6PIZa6/9jatGmRssgllsOqBq8ycdKjfkCM2NA8pvCVcNLXR/bYFBumevQxWvqnJe4+8naWtjcTcgj+HR4Q/kfuCpu0btC5XdMjyzjjVJuaekHbNy58E1S6fGF+V4Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htg5d6Cd; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htg5d6Cd"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b150559bso41777545e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 03:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778583571; x=1779188371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uhHS6zVrC9HlZ4w9H9Y7re+MM/8aX/6jJDkwDStDfFo=;
        b=htg5d6Cdq6YZFukk5+nG+yX0wzoJ9Ss8Hi6w+Frzd5rNbk+/ZgcWNez/43uXtwSEze
         h+2d0/0fHDqceJff76lQ0IYJOeY32NktATIyibop5TsxzTkPEpBiqhtalzE4O8ZMj2jj
         xHiNGOar8P0og8mBB1tkuXSrlj7GJMTl/HJ82FqBgnkDymQkweYNEmMd50l6CKpXI/Ls
         6GT2LLxdoA5FghfXUsQZxXbqd1W7ooRJvZoEgRa68fbZccb3tG3msU+OubN1rCA/UiLh
         UW3vVG9kB9QZ2o5yWPSj+bmOyMAeJtCooL87mNSff/5okn2m4EHWbjvDfKiCJm3uxQYR
         0BbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778583571; x=1779188371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhHS6zVrC9HlZ4w9H9Y7re+MM/8aX/6jJDkwDStDfFo=;
        b=eQctGrmgi4ohcCftk7PuN06SgE9kD9uIelOr4qM7qHV4YVoGSx5quqa08gEAn7n+0Q
         9KGHf9P8cTWBXuf7ueDD2dAczNfLFO6u1vA63+Tp85h1YQWvUV5+2y+U8yChnuAX7SLJ
         3zP4mt+lh3sUAWFlTHJ4XO8Nk0NOXn7BfZjOMGKLabYX5wmZtFN4ygmpOBrw1Ji3oGj9
         9QmlBRjMarKmPzci9EGw1HqkpmY18Qg4OMIwDTIH18K8nbTBcF/Qe2EqyZfrQCtd+uoz
         6OtPnsYjDGV+m9HkZ//MUNipRBMA1FVDnPaxnOigiK13hzO4v4X1UFFE97YVFii0+wKU
         5LgA==
X-Forwarded-Encrypted: i=1; AFNElJ8rla3yQRlpUj5xkSbT+2jfYoq0Wy9NeYveWU/AGiT+QvfW0yJWGNK6a9iCo2JKcOAvPHaHmBEhWweHioOctqo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy02AdzYflF3Sw1971vK+osBYAb6eOWZYO7mxT2lbh1UQyeyuyF
	sYiYxq97HpYokCe2w9tpMwymYl5bfSWCv93f37Pg+rSjXrUmNLSFAIHL
X-Gm-Gg: Acq92OE+3BofNnXi0I+k4jii4CrQi0XDb3BZGtnbYpH8J5t7u9GKMqaA1KNIwT9cld2
	NCKYo47KE2ouWx5E2mRxsUXrLxjLF+1HWnxXeQ8m3AKBwYhzHMJO5NFRp/DixV+Dqt3rx6ytnF0
	dhjH3NHRnqO6b342aG93KaB3qBmPUix2u1xpbHO49tHq2au0cXHHgKZAsk0tyE7FzG7er6hQ2F6
	kclcWIo0IfoiFFuLvg57iVa7uX21t/x0XpE21roQ4xcyCYTuzI6EtJRLgcUUNHwkWONtu1mr/bj
	FrtKmNw57BcMHgKE11lwFXPVPoAx1q0FRfdQzdAnQZPEnDgfcyAkw0Fye9vNWjoWJh0KffLt3xb
	zqpu4/TNk2EOwOGVh+RKwRUXQEN79gPdgsjoBj4b8bmHakKQOc/B12lYWa9F2T39MuAJfwWv/YN
	uagGPpZC+BIz1pp6TcncTGX2AA2tzSrKR0DAOtwG5tzCGsbX4bqjgdsBMkcmOEjk6qcNUq7QCqC
	l2ZnRqEtu9vGyiFJzofiza8l9FU3PA79pDoEWQ=
X-Received: by 2002:a05:600c:45d0:b0:488:7ff6:1f75 with SMTP id 5b1f17b1804b1-48e707f821dmr219403715e9.21.1778583571615;
        Tue, 12 May 2026 03:59:31 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::372? ([2620:10d:c092:600::1:8c90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6b00fsm35042477f8f.11.2026.05.12.03.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 03:59:30 -0700 (PDT)
Message-ID: <1ae85366-de3e-4891-8581-bdfc6e605a23@gmail.com>
Date: Tue, 12 May 2026 11:59:26 +0100
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
...
> +static void zcrx_notif_tw(struct io_tw_req tw_req, io_tw_token_t tw)
> +{
> +	struct io_kiocb *req = tw_req.req;
> +	struct io_ring_ctx *ctx = req->ctx;
> +
> +	io_post_aux_cqe(ctx, req->cqe.user_data, req->cqe.res, 0);
> +	percpu_ref_put(&ctx->refs);
> +	kfree_rcu(req, rcu_head);
> +}

Note to myself:

io_poison_req(req);
kmem_cache_free(req_cachep, req);

-- 
Pavel Begunkov

