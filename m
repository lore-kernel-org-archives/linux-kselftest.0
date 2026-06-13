Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A601A39DBC9
	for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 01:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781314618; cv=none; b=oFpK9/o4kgB/FRmRwXICFHNxTGa8LlhpF+bvtTqsMoelARWMtLjQPTTPm3LqkvmCN6vgKE4EfBtnKCrc7L56qpXFGRKxP+CQcHQpx6uVpXozeveK25dK0P7dhz0GGcIVv8A32gUCYfFBtjYbiDxaOXWwBn3xaVuDeSWmaqCs6m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781314618; c=relaxed/simple;
	bh=ATCD8YWcyycCwAf5daRrjVD1RP8gGZsuumqpfm7uutY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=U+Y+m7DIu+f3XpYleJExAioV9PZ5sCNO4NHsAfAh2cXH4ZhczaZjkoyJRolSE/NHDriHe8TmWTAiNP67ff1vw9DvM/JFwNZu7FPl8cTEamAq0i+dOe2tVuUw24eW95L2w0esaYSkEHr1cSuQ6HSKzluXWhcOu2zx/mgUC45pthI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpY886Fr; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpY886Fr"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4863cd41330so1157313b6e.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 18:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781314617; x=1781919417; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvfgZCv77btIU2CurjCFxTmu/1bI2beZuVQe8JJi27c=;
        b=CpY886FrNj4EQww+vVk87tNbyjOoMjx5GMiDePF0Y5cfPIi/mYw+Z5j18KHqIZZEbg
         FcDVvF609q7lA5/qi9oCQWCW/F0JTLseILy9f1ltPgHuI+ERjGzNq4trVID7nckeTiEB
         lcKYy7CuOQtxw0uLSNFJtBBqYZhraCvIM0i2GpgkCGt3IMvKQZhG5pmOwRGoFDizFjrC
         0j5mLhEc8kclUYhZE5PWjZLar0R1iPaX0IzytiUn2tQUaz5KdiQ18c6McNxBWis8E8zg
         ocTy7QMIm5+h12O4CGNre7BV46gPOqf+3Jng+FbkUF/Gr+3vBXrpw2cD9ivkz806XQEi
         c7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781314617; x=1781919417;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uvfgZCv77btIU2CurjCFxTmu/1bI2beZuVQe8JJi27c=;
        b=bWSw5mjwXg3izgo84HX/iw/C62Y9X7ZGRyQH7B1ap898rLGby0o5Q6Dy5HFwam2zdr
         dwbdQj7HzaUBbJPsyM7+Sm3p9FNT+cryKQwCEl+b86ruh88aGwsLd8fQWov3Iatu5iE5
         zutR0HA+rfrK9pIiu623FqhvAxYtgr1UQv1Y/95Jv1NZvezx09x9azFOcA1EFnJy2yDt
         +W32YTbGr5R885+QaYja9A/ClmICqXDqZm/bxv4HQZeID2+N+XWpSy0OJuc/EBeQK3LG
         8sSOs2bXvZhWX+SWeA+NJt3x7odqVxifmUx1VpyA9eIvXkyI0D+GNCDDsRbytcF0kCxV
         +Qpg==
X-Forwarded-Encrypted: i=1; AFNElJ8t/ipBMKJeU1EV8EoHaZpCD95jrw/e9O79qvwD8MHhXw3r5l4rsIEyrHKZppcIXtb09KMuuI3lEYVTSkXJe2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsdQlseA7SZQnQ6eHzhfsrDuvaB0/vTBYrs5GUvHBjEOGaaOSZ
	MffOkLLLgIq7IHlx7yZrtTj4syNqPlcNnSHJxiNIThVA8oIyBuDNz2KY
X-Gm-Gg: Acq92OFLMysjOfUQjn8HAWBGB3QKIYyPyz8Pcz5FZY9YWl7jY37tyl3PnSw9be9pn4V
	7omsiV0k0SJl5W2j9/DfWO0U6VuAtOtCT5us50Ep783mrpkFMgJ7EaDmOp9HI1JndZ0xjxFihBS
	sqnN5nCyc9nyBfWCh4l4DRq1QFb6p1m2v74LB0yZx4zl8+v++cUovDRTOebAhHDr9Lt4CHaKQqX
	BTddv1ud5uSvb5GCyn9cnFihrnxce76nu4pEzpuyjoDtNgMjn2yupiWARx87PtleYxG7bcy593n
	OosDaWsrRywwFMAs+p2HB3RBEVlrFaegnOiUgEuMkbO4ttHEd0xH7vEYTdPBobaeSM5fKKxbz7M
	FnvccL96niefBUDOZQoln7O3vDbeTrI3Nr/7k4RKS70ERxzUY7Uqvmo++ZpwZmTnGxjz8uz+XM5
	18RH2P4hzMfUy317RET0AZ/pRv7Nju32VY4TOewTGkEshQYIcVF/MYzZXfqGyW0qmuFHudXuHlY
	yc/U5KNHcBhyKgY
X-Received: by 2002:a05:6808:159c:b0:486:cab8:cb7e with SMTP id 5614622812f47-4872dd9f213mr3099133b6e.1.1781314616544;
        Fri, 12 Jun 2026 18:36:56 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:6::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-487315b016csm2006539b6e.18.2026.06.12.18.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 18:36:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 18:36:54 -0700
Message-Id: <DJ7JBWTVOBVX.1YKW7ULLZC9Z4@gmail.com>
Cc: <andrii@kernel.org>, <ast@kernel.org>, <bestswngs@gmail.com>,
 <bpf@vger.kernel.org>, <cong.wang@bytedance.com>, <daniel@iogearbox.net>,
 <davem@davemloft.net>, <eddyz87@gmail.com>, <edumazet@google.com>,
 <emil@etsalapatis.com>, <hawk@kernel.org>, <horms@kernel.org>,
 <ihor.solodrai@linux.dev>, <jakub@cloudflare.com>,
 <john.fastabend@gmail.com>, <jolsa@kernel.org>, <kuba@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <martin.lau@linux.dev>, <memxor@gmail.com>, <mmmxny@gmail.com>,
 <netdev@vger.kernel.org>, <pabeni@redhat.com>, <rhkrqnwk98@gmail.com>,
 <sdf@fomichev.me>, <shuah@kernel.org>, <song@kernel.org>, <xmei5@asu.edu>,
 <yonghong.song@linux.dev>
Subject: Re: [PATCH bpf-next v3 3/7] bpf, sockmap: zero-initialize pages
 allocated in bpf_msg_push_data
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Kuniyuki Iwashima" <kuniyu@google.com>, <jiayuan.chen@linux.dev>
X-Mailer: aerc
References: <20260612130919.299124-4-jiayuan.chen@linux.dev>
 <20260613002906.1336958-1-kuniyu@google.com>
In-Reply-To: <20260613002906.1336958-1-kuniyu@google.com>

On Fri Jun 12, 2026 at 5:28 PM PDT, Kuniyuki Iwashima wrote:
> From: Jiayuan Chen <jiayuan.chen@linux.dev>
> Date: Fri, 12 Jun 2026 21:07:47 +0800
>> From: Weiming Shi <bestswngs@gmail.com>
>>=20
>> bpf_msg_push_data() allocates pages via alloc_pages() without
>> __GFP_ZERO. In the non-copy path, the entire page of uninitialized
>> heap content is added directly to the sk_msg scatterlist, which is
>> then transmitted over TCP to userspace via tcp_bpf_push(). In the
>> copy path, a gap of len bytes between the front and back memcpy
>> regions is similarly left uninitialized.
>>=20
>> This leads to a kernel heap information leak: stale page content
>> including kernel pointers from the direct-map and vmemmap regions
>> is transmitted to userspace, which can be used to defeat KASLR.
>>=20
>> Add __GFP_ZERO to the alloc_pages() call to ensure the allocated
>> page is always zeroed before it enters the scatterlist.
>>=20
>> Link: https://lore.kernel.org/all/20260424155913.A19FDC19425@smtp.kernel=
.org
>> Fixes: 6fff607e2f14 ("bpf: sk_msg program helper bpf_msg_push_data")
>> Tested-by: Xiang Mei <xmei5@asu.edu>
>> Tested-by: Xinyu Ma <mmmxny@gmail.com>
>> Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>
>> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
>> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
>> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
>> ---
>>  net/core/filter.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/net/core/filter.c b/net/core/filter.c
>> index 3e555f276ba80..6e345ca65ca14 100644
>> --- a/net/core/filter.c
>> +++ b/net/core/filter.c
>> @@ -2832,7 +2832,7 @@ BPF_CALL_4(bpf_msg_push_data, struct sk_msg *, msg=
, u32, start,
>>  	if (unlikely(copy + len < copy))
>>  		return -EINVAL;
>> =20
>> -	page =3D alloc_pages(__GFP_NOWARN | GFP_ATOMIC | __GFP_COMP,
>> +	page =3D alloc_pages(__GFP_NOWARN | GFP_ATOMIC | __GFP_COMP | __GFP_ZE=
RO,
>
> This is a red flag.
>
> We have a bunch of KMSAN reports due to raw/packet sockets,
> which requires CAP_NET_ADMIN, and leave them unfixed although
> some people attempted to "fix" them by adding __GFP_ZERO to
> __alloc_skb().

yep. It's a bpf prog responsibility to avoid garbage in the payload.

pw-bot: cr
