Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BB634F270
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 21:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782940349; cv=none; b=KBeHgAajqvlzGpvlUdWGsFG9f0rLTTDRuju8ZqyUhuLpJak8S04tBLdKI1n/mL9LsKsoBKhWKrvVQj4IAjDqcNYzd1YnnJWe+b2ZBRycNjZagNx7P7xRj4zgoYee2VmDFXFp8TxB2FRnOYPnHgEbM1UXT7DRRwyuQR/FfbjPj3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782940349; c=relaxed/simple;
	bh=PhWu0asTybkDcO/nIytv29/vVGV777oc+iv+YZCX3Po=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=r+FSy+AElv/q3yhhQsUCsO6LJWdGKiwPg4IpdYCK6Np8F4lS+uD1UHAFLCbbWWAQ+37XOwBjfXIV6vMhTC1GyaD9b10ueNtp/vEWoJDFxD8mjErH5IZtuHtiwMWvF7zTaFy+oq90bS6rCyOhx1kPwX53AjVJ/ncK53/bBGqfDcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=SwZgnm1t; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="SwZgnm1t"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c2a449c57so4819601cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 14:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1782940346; x=1783545146; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ugCTwUEiFWSOAAZ9ZKycXOr74BRTGYQOGuhcwzpQp4=;
        b=SwZgnm1tgjFNxo71Eue/RFSsHyXq3hPx14AyQX0VUjI4dXZF4r3HZYh4difEpEgD3v
         Klr0/hMYwH+nvH6ZZynZB268vrAmHi0v3/mLoHiJm5Q/bSFVteJnqnbbePryaYvTcwrc
         Eu7vWzKHWa8jXS5REikkFPf1SQtaPtpY+4JcQn2yg/RarcCO96o/x6+/g5Ahy/2nzB3i
         mhuam+HAAFE1kEfFz7+hFXwjAFd082DpimT/bW8xoZj8V5Dwaz2limMOKLUcOisv6WxS
         wp2UprUB6lZaUDGBAEeC4ez0amVd1x4K48QUa212AQDTvllZYbB5lzEzFqavaIh8zpKy
         Fnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782940346; x=1783545146;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ugCTwUEiFWSOAAZ9ZKycXOr74BRTGYQOGuhcwzpQp4=;
        b=Mj+RJ6tCau18DdzCAutsttlQEEj/AYhheFvmY6JjS0l++f0Ej7ms8ohLbrl5HsVhmP
         FjCoeqgQuu2MeHSgtdT7rebHxg/se2p694URBvh4mAjAWTJh1cZOFGHe7i+4OwX1J8VR
         zQGQa6rUdMUIguCHROE/00ufLgx6H/ERf3F2gpr1OP3XYtg+yrcb5GL5w1VeSvlpZsPV
         Mxtn9OdfjaRugasuNrXJmNSFzPpPZIoQlER1gVeTOxM9gTIBor2Rqg3I8J4mMpHwwD7b
         v/Iz/1zkQNhJXty/sTR1HhqNTP1vkGJtEAvMVHJb1DbnQG6aCw6wfcS+dpqsQX6zmhsJ
         OWSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bIlZ2zm055h60T5f8+wj0CYeaOKI1ZUBWw61hKAugqXZN8oKnPLnbywX7nMiHR7jNFZQVKJ/ikvkvgsCbf7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA+nWQ1i/HGjcLxVayGSTh8dfJuNnLMYmiJ+1a/VIY8nabIcy1
	gsVq/Vocf5asW1Od1ZhDcEVXhQXyPkypRWGB05CsxHUD2+AL/vdKhIgbeXqZj3BFTyo=
X-Gm-Gg: AfdE7cnO2zS5zqwzvZ5uCJTz6hETbdkzUhqQiuccq0s5tcwfFbGIhH2knu8iEvO+WCr
	6bS6S6tnBoNZg4YxceJZtteUBlEs9DrJjtLElMiJt5JlioOlLmGqd4I1LLVPhKHA3rSNMtGjvG8
	dGv/cbCHnQh/63YX/PlGpXDDt4rDyfZqZOLWEA/Fc1IzVeuu/qDp61yO6DHHvNBKkUlEydEdFPJ
	FYXVKB3QJhMpx6xtqLuYvjLzcBwMz4Qbb2AJL+pHCsAbx5P63K6qfsUjF5ZC6nsbWfW9ip57UN0
	kFow2J0T+wMIq9g4MvE/ZLaUi0nbhWeQC/WoWOhMG+xZ+wI4l8pPwvQx9qy648OLKCqLhw7iAIP
	0KJMgFk9MfM0C7YfQzkPFJsmnsavMrVoEn1QQTNe7BWkdwmxAhJfNm9AclJY8EkDJW+ie/lQvRR
	v14QPwA3ySxTU=
X-Received: by 2002:ac8:5c81:0:b0:51c:161e:25a9 with SMTP id d75a77b69052e-51c26b5023emr46891721cf.62.1782940346045;
        Wed, 01 Jul 2026 14:12:26 -0700 (PDT)
Received: from localhost ([198.58.242.173])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f4724be503sm7479146d6.45.2026.07.01.14.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 14:12:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Jul 2026 17:12:24 -0400
Message-Id: <DJNJLQZIR0N9.2V69YW14LMS49@etsalapatis.com>
To: "Yiyang Chen" <chenyy23@mails.tsinghua.edu.cn>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Shuah Khan" <shuah@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>,
 "Puranjay Mohan" <puranjay@kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next 1/2] bpf: Reject arena frees below the arena
 base
From: "Emil Tsalapatis" <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <cover.1782813442.git.chenyy23@mails.tsinghua.edu.cn>
 <2a3747e64898cc7dda6578279cb5688f7029f658.1782813442.git.chenyy23@mails.tsinghua.edu.cn>
In-Reply-To: <2a3747e64898cc7dda6578279cb5688f7029f658.1782813442.git.chenyy23@mails.tsinghua.edu.cn>

On Tue Jun 30, 2026 at 6:12 AM EDT, Yiyang Chen wrote:
> bpf_arena_free_pages() accepts scalar arena addresses. The runtime
> masks the address to the low 32 bits and reconstructs a full user
> address from the arena base before returning the range to the arena
> free tree.
>
> When the scalar value is below the low 32 bits of the arena base,
> full_uaddr falls below user_vm_start. The existing upper-end clipping
> then turns this into an out-of-range free-tree offset. A later
> allocation can reuse that offset and return an address below the arena
> mapping.
>

This seems reasonable, my understanding is that this happens because
neither arena start nor end actually has to be aligned at a 4GiB
boundary, while the underlying kernel mapping does span the full
32 bits. AFAICT this bug returns an address that is not actually
mapped into userspace and is inaccessible from it, correct?

If the above is correct, feel free to add:
Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>


> Reject such frees before computing the clipped range.
>
> Fixes: 317460317a02a ("bpf: Introduce bpf_arena.")
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> ---
>  kernel/bpf/arena.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> index 49a8f7b1beef5..e28e83bed8c51 100644
> --- a/kernel/bpf/arena.c
> +++ b/kernel/bpf/arena.c
> @@ -693,6 +693,8 @@ static void arena_free_pages(struct bpf_arena *arena,=
 long uaddr, long page_cnt,
>  	uaddr &=3D PAGE_MASK;
>  	kaddr =3D bpf_arena_get_kern_vm_start(arena) + uaddr;
>  	full_uaddr =3D clear_lo32(arena->user_vm_start) + uaddr;
> +	if (full_uaddr < arena->user_vm_start)
> +		return;
>  	uaddr_end =3D min(arena->user_vm_end, full_uaddr + (page_cnt << PAGE_SH=
IFT));
>  	if (full_uaddr >=3D uaddr_end)
>  		return;

