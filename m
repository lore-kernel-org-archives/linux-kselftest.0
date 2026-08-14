Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683E73DAABE
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 15:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786722637; cv=none; b=N0kR1eji6gtjViZ47omJNcVHQzlHfNjl0/claZbubuKbYLlSMXLzhod1y0zoxm1lCp1zqjirHDaUz1FfVEL4Q+VUXVtNrPk0el5ZJRuA5ZmFosuHX90Jqjd0LXBitM9WrhccGrqwKVlATaUch09qxMm6PvExuqBDI33SiIy8UEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786722637; c=relaxed/simple;
	bh=fylv9N5GG8WON01Ni6+SzdlApu1Tt/sl3B5ACfe67+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6cg8u3k5MpjJFIfwl9h2zkyzE+YzD8I/cxLAlwfJBrrpgdnDPVXNSyXEXHO0NYVZbwaHtapxzvtZf9z+FRkwU3gQbluceVqUF0G3+cU8icrG8H69e9/Ji5SM6bBmSEJ9D9y/qGQqiEQ/ncpCTtE7wvALdqtG8xCY2FgtDzn7V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b=zf0BWdEK; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b="zf0BWdEK"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7eb29ed2bbdso600645a34.2
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 08:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20251104.gappssmtp.com; s=20251104; t=1786722631; x=1787327431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UWw9B4B1zgG/vzwCp5+dWn0TyEBoX3jbzAzU/meOxQ=;
        b=zf0BWdEKWohUmZqlM6WENFM9JEYKZCwoHQ401UYB397JJj6/YYKeEIub5DeiVL2gr/
         +vK/AuedxQMlETT76QI7gwpJtC5NWuSmXT0AkEkDZSE1smdoVr7PxBo1E0PQmGAPg7EJ
         8XOYG/tK9Ih71CzwMziU0AnAhlYs+SF6lLfYQbR7dqECNLXWUqxlOf+M04xckYHX4hLr
         O0smXHtPXPsPpXNPAiRtQ+2XNyjABnwK5YSaxfzIwjMjKN+Jp2iWvLmXXYnX/2mP77CF
         1SbEq5Zcs7cwdjC5HHAjx31szpYb2alBJMCAj+UZ2BPUQsObRahDMpnbQcsfLQq8hEKe
         cyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786722631; x=1787327431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UWw9B4B1zgG/vzwCp5+dWn0TyEBoX3jbzAzU/meOxQ=;
        b=tGFDBsXpo42VnHRPpNc4QnvqrJeqttYM/HWEVHbnua6HaW3BMmzEAxVYwL0nfHaeSr
         K4SH3NIfGfD/LlL9vE1ed01PsMZOHJ1+vX4/Z0KAR6lIFndtbEPDdC/0l9G3IY7WXtFX
         YIaZYaB6fdlYwChDvWMIax64GUHWynNdBIvMx+Vw1pJScveJc3iDvLzn/1QdP7JtHgzd
         YnOvKhi1aogrgZyiLf7CkRCN4yX50lw8y2JqTS/8Bzkxg8D07lNHab4/dTmE8UiHwLQI
         h6dyMzRorlAPmza0RbN+LBx2+/7EOcecXuTPO/gqyV5HstYNyeEzuOTeCrf2YEgvE5Ju
         fB8A==
X-Forwarded-Encrypted: i=1; AHgh+RpzgrocpydyAUcFheyYseZ5irY2/154mUUUXneuJ2lVUxwJDE3JWEv+R0nP8MJGD+d9uUfi0Fe8539hDoF0Yio=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfsJKhBZSzsM/mxY7oetTjxG9DOsq1jN3kaXbj2MMMpcHvbO37
	sOGEGoAn8Sj31I7euIXnjnzsDUGD8O3Pn0pYQ7yDsdmeuYHpbnojF+gO+fEoeoLKP94=
X-Gm-Gg: AR+sD130wP9P4DLp2iCjA1GznNnzdzOAN168Mh/OlKppD8XnGfc1RLhzyqSgzZbEseF
	KwcjHyrGVswhx/0yfAjlk99vqop7OUkb4+vGrQ/gNGjzBIvdTPBe0Dz/z8qA2iZqVdGC7eGYCnv
	t7caPjDicp1zLQXA4lcX9pS5sbASi6yX3oxcc34Avq9YnJZ/tIhEVVNNwYkJGVH6TcEysxwm18f
	r6J/Qc6dkYoyhZ3AUjdzG1StkcKLFqhW9KHXidcrCApAXF8GNL0iDGVnu9m3MHjdgTK/YcZWBH5
	wdNXx8yCx7vPA411Yar21+vX4SZYf95ohGBmBmsgNLiUujRJh5Mkr77GiyvlI35H9T3qTK+L2jy
	NSffFGc/kZLHE+vunGm3Kv3cPhLfxXzlMj1aw90GPNxNY9HNDc7a8wRu8v+9dHGavKFiGTdIjZx
	RAw/etxEVXENFname9AuJ+B06xAPPvzlKWWyV4DVce8btPovSsJIv4AWAOrmjIIutsf1FTmaT7v
	biUL3Nok6hCZuBF8lF2W54Nev+W7DkcQpCUjmoXwEEYiGqzgVbNk2vgcHSldQ==
X-Received: by 2002:a05:6830:3692:b0:7e7:8dc0:3951 with SMTP id 46e09a7af769-7f3de51da19mr5494859a34.8.1786722631567;
        Fri, 14 Aug 2026 08:50:31 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:c8f:b917:4342:fa09? ([2620:10d:c090:500::4:a11e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3e849478esm1158487a34.6.2026.08.14.08.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 08:50:31 -0700 (PDT)
Message-ID: <34915029-869a-4a5a-9bde-060a9a6eec20@davidwei.uk>
Date: Fri, 14 Aug 2026 08:50:29 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 5/6] selftests: net: add multithread server
 support to iou-zcrx
To: Juanlu Herrero <juanlu@fastmail.com>, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com,
 pabeni@redhat.com, shuah@kernel.org
References: <20260814012348.46958-1-juanlu@fastmail.com>
 <20260814012348.46958-6-juanlu@fastmail.com>
Content-Language: en-US
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20260814012348.46958-6-juanlu@fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-08-13 18:23, Juanlu Herrero wrote:
> Run the iou-zcrx server as N worker threads, each owning one receive
> queue with its own io_uring and zero-copy receive (zcrx) ifq, so the
> test can exercise multi-queue zero-copy receive.
> 
> The main thread owns the listening socket, accepts connections, and
> dispatches each to the worker owning the queue it landed on by matching
> SO_INCOMING_NAPI_ID against per-queue NAPI IDs.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
> ---
>   .../testing/selftests/drivers/net/hw/Makefile |   5 +-
>   .../selftests/drivers/net/hw/iou-zcrx.c       | 262 +++++++++++++-----
>   2 files changed, 195 insertions(+), 72 deletions(-)
> 
[...]
> diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> index f793a6c04e412..008d3f4b76263 100644
> --- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> +++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
[...]
> @@ -289,12 +279,13 @@ static void process_recvzc(struct thread_ctx *ctx, struct io_uring_cqe *cqe)
>   		error(1, 0, "recvzc(): %d", cqe->res);
>   
>   	if (cfg_oneshot) {
> -		if (cqe->res == 0 && cqe->flags == 0 && cfg_oneshot_recvs) {
> -			add_recvzc_oneshot(ctx, ctx->connfd, page_size);
> -			cfg_oneshot_recvs--;
> +		if (cqe->res == 0 && cqe->flags == 0 &&
> +		    ctx->oneshot_recvs[conn_idx]) {
> +			add_recvzc_oneshot(ctx, conn_idx, page_size);
> +			ctx->oneshot_recvs[conn_idx]--;

This needs an early return. Sorry the bug was pre-existing but I just
noticed it.
