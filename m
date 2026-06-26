Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6933353EC0
	for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 21:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507849; cv=pass; b=avS7I/jjOCRXosZreqMw1h3JOOJW03wMyHTR0YAcUI8Y6xj5mYhtno1D4MtWIoLPDKzxWQfeZqty8PV7ggY6ZZFYAI8KGfDEUIEw6S6Ol9YS9+CpHW++OziJ3u8UicOcLmDAgrNQUoRTT0JswGb5G9ElbUGKIr5KNvz8kEEbLRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507849; c=relaxed/simple;
	bh=Vwt5xW+F+uiSa1tQBJJ8nSM9E4LO58GodGc6uVU7V3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNV8rsFrwx3cnzPCm5FRhLtCDE+TsDUjaQ2u8RdhYJJfrRh6L4rlf6MvmZOpIdfUJKBVWsyzUQEFznKqn12J5qQYp6u9hP+aRWGsGQSBYi/dMau2SVHaYTQZfFP9+qG+KuxOoBzJD8B9fQ0i6rFFSaSt7aCnweVN5cBSdMr5Yj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RQbAIVHV; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RQbAIVHV"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso2712285a12.2
        for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 14:04:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782507846; cv=none;
        d=google.com; s=arc-20260327;
        b=tBR9sHd8FbqH7Lq5i2m/DuL3hRgdQv2z5MyI5sNxkv9ePxy4Enau7No3Bk+aiYQFyJ
         C9rhyqWLxvRNHfSeBKKI41CZmgMIf1ebAzhtWMStjB3n5xW/op5fyRp0C7KxG/kB9/87
         wieOCyfhcxC3EHbfe+NuyvvkdBiGwzc6IhPzoEqpbqnSE1E3a3rFr501EBO51va8MKKE
         mS6evThmXAstQ6LRpc6IqvbF5cA29066LXGsKlzwg7tM7D05Xl2g69tUtadL/tfoMo4r
         bW2QTNqUXb4OB5LNTKKgK6QwiMzUmnm/k7BcfDhyGS+OV1dworvqKMVCYa5EiEq0oKK+
         Gu0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tvCC8HZmChXEnRo8N9gbNXNqVSfwU8t8eArZec9rkjI=;
        fh=r6ytcD3ki5UfHqp5ZnzyYySodeHF84ZMFAXlJKycemg=;
        b=YCoz4/TOU+fvnfHkOlC+0HC1id3eG2KYixjlNpH3EQN4X1+648z9nF0qjU/ce0oPyA
         qTFigt5Cpy76oZbRJTdYAgsI52q9ZWdDHttJSPNgMR8IZJszZ98Ic0mYo/FlfTUQ0jWt
         RtE2pbMsBnFM8MMiw5yBQSi0jUxn/ifqajqaqIQWw6GyOgs5+IhR582fefF9doyxw6N8
         Wm2vn9Vqn3m5E3SU4XSw0h+dsOgYXZPiEEAxzk5/8yaBDFzT41WxbzSP+1Bre1UKzcga
         LbnRD8X8n5JateGfyAsCg/hhUyefV7iNVpKVqGVBpBuT2rr7nS/Ns4F3b/3MLP+2aik9
         LXPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782507846; x=1783112646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvCC8HZmChXEnRo8N9gbNXNqVSfwU8t8eArZec9rkjI=;
        b=RQbAIVHVzTu+u5DJwVg+56s5qoOktbvUMx+93V2Mj/kvl58IkMc0hFN9Ord4Mgn9yg
         bRjxKXSSkBzR99R6NuihGd9rJWlzc/8CpgN/qltnwnRgCl4WH2BG0GtEq/oMzNRgcgMA
         u34e1dFzklc9lyj627vBex6wkQMlIM/YjiTra6tonnka7/K2yY6bIm9hSnY9T0yQx2T1
         mzPq4iVh2SsQW2Ukg5qYnbYLr16q+0xjEmAR1ND4aajDhdYqRR822vOzQ883BjgeDtyf
         lsWxLKlhzAyYhQhKnO9urh+SyLd+qARQ2+4nlkmO8HdXtKPK505ICOTdxSdb1Uv+4j+B
         O0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782507846; x=1783112646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tvCC8HZmChXEnRo8N9gbNXNqVSfwU8t8eArZec9rkjI=;
        b=sijlekevS41nN+hei2ka+2gmEHR9+fdWDJIjHZGnwLBS1+s7jPTTtmrYb5eIhwbfWI
         HVt+iGH14D7Mi1/58AxIREXlVh3oackuZZVMxdczlmM7/vFv5NCQMVR0Bpda0ZtzW6OU
         xGdHaHwlCCTPi5r2KxrrTUixaEVSEjeHu58cGPKl58V+Y9DkzNyt5zjuJIyIk4uaBKYO
         pg3UbW7/ic61pPhKHIXCIS5IegDsKojDlMmy/5p7fmehKixD2xgzWboXPnipt2MLjgEh
         zftgxPbbQrOl+JinoF+DqeZSYSP/rLpUIAdwJ355q+CBuGZ3ylubNq47AfMJuFixnl4z
         4tkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3xeJuczW1B5zpJbNoqAEka1zZKxf55lrZSVz+K6wFPwznaYmLm20RpJAlSQM4R8o9kyj4yEOBY80MbK+JJBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLiNqX7uwt0cFKcAzOxOEN2hR+cCLPqQ6nxorNvOqv+xzFXO0n
	dSzmOtYnKduLRjxdqxY9uiLGsiweqQR5ZlXthajl2o0F8hGVG4tUAc9n6r8bA0TMu0jATFEywFJ
	8vLBeVPRJkFjKn7FJfSYWGbvqCm3ONIeIP95Mc7Il
X-Gm-Gg: AfdE7ckPrxS0rp5fDmkQ0N9EZnAsVS+9ArtmFdaHLHaCdiV1aLzC8VScJ+5Y4mAk+I7
	J1tXH/KtY45DckEJIypeo/c6Cxo6+DEix+hncsLM3vhcrKsnUt8aANmNaWIPURpeVGQrTl5kvYQ
	xc6qC2ukuOSib36a/3oWcFWGgOAx5BhiWVPq0XTeVfp1z8IDofc+2XSKNaavh48P4MDO0BKZ//y
	9Dr4LcCJs3VPFTLXIKf5HzHeFEru9h/brht9N2uQzcfEmnZxQci0ZmCqlXcdAXQMzwmV2/TOkIR
	zYtrjv1nrhiE4WFgeukIn94AeIizdyaLnUN2SFqHq88tAcvnM7GM3XYUL0zbNHcZXOUPCZLdiuW
	USheuViAYudVkDJqdgOQKzbktivW5ya4gspwAwYo=
X-Received: by 2002:a05:6402:d0e:b0:66e:abe5:ab22 with SMTP id
 4fb4d7f45d1cf-69810a15744mr3008960a12.5.1782507845615; Fri, 26 Jun 2026
 14:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-sockmap-lookup-udp-leak-v2-0-7e7e201c951a@rbox.co> <20260626-sockmap-lookup-udp-leak-v2-4-7e7e201c951a@rbox.co>
In-Reply-To: <20260626-sockmap-lookup-udp-leak-v2-4-7e7e201c951a@rbox.co>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 26 Jun 2026 14:03:50 -0700
X-Gm-Features: AVVi8CfI1JvVlmFD7FSw9WWO-q0ESRJAmfkw-4ZmG4UOIO4tf4PPeHZBhXKMPPU
Message-ID: <CAAVpQUAJYkOBEtgUpL5UgnwM9Hu3Y57a9xZWRy7zHg5XkGnW5w@mail.gmail.com>
Subject: Re: [PATCH bpf v2 4/4] selftests/bpf: Fail unbound UDP on sockmap update
To: Michal Luczaj <mhal@rbox.co>
Cc: Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, John Fastabend <john.fastabend@gmail.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Cong Wang <cong.wang@bytedance.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 1:37=E2=80=AFPM Michal Luczaj <mhal@rbox.co> wrote:
>
> sockmap now rejects unbound UDP sockets. Adjust test_maps.
>
> This effectively reverts commit c39aa2159974 ("bpf, selftests: Fix
> test_maps now that sockmap supports UDP").
>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---
>  tools/testing/selftests/bpf/test_maps.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/test_maps.c b/tools/testing/self=
tests/bpf/test_maps.c
> index c32da7bd8be2..81cd5d0d69c1 100644
> --- a/tools/testing/selftests/bpf/test_maps.c
> +++ b/tools/testing/selftests/bpf/test_maps.c
> @@ -759,12 +759,12 @@ static void test_sockmap(unsigned int tasks, void *=
data)
>                 goto out_sockmap;
>         }
>
> -       /* Test update with unsupported UDP socket */
> +       /* Test update with unsupported unbound UDP socket */
>         udp =3D socket(AF_INET, SOCK_DGRAM, 0);
>         i =3D 0;
>         err =3D bpf_map_update_elem(fd, &i, &udp, BPF_ANY);
> -       if (err) {
> -               printf("Failed socket update SOCK_DGRAM '%i:%i'\n",
> +       if (!err) {
> +               printf("Failed allowed unbound SOCK_DGRAM socket update '=
%i:%i'\n",

nit: Maybe s/Failed/Unexpectedly succeeded/ ?

If we want to avoid breakage, this patch needs to be squashed to
the fix patch, but it's discouraged in netdev, not sure about bpf tree.

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
