Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4B93921C8
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 19:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785871293; cv=pass; b=L8hqyloXl9I4kt70hN8w1WFEr+V5d1cg5Gec6izdgIOJefX4zL9O1bPTH79FH5jwE0fA1zglwdAsvw+Bxfua04p4ipZmxnnJQ2b2+tdX263FSX+9MNhsCCvhrLwqkjBrLtHIiLjCYJFO5FD0xvcL9sWv4KaqVGzt0GhocQTj4yQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785871293; c=relaxed/simple;
	bh=oCzTqmGLsrIYX3wB3JC2SmDrysquH8+Sn42YPZPJCNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BDuYHu9G4A/414NhmzMIRRk6fgeBOKI2ko2NiS7RsjCvQUrfyFHToPq42PT9GTql76FiARPYlu8wJHmvssoXC38Mq96vlWTNczhwDzVZLTG2poYOPH4hbb2NdEGGI959zUY+iV3JbEF9ecoUdQiP2lz5rxG7V5/zxdsSasUm8Nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GXKYewx1; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GXKYewx1"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954d5d814fso13295e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 12:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785871289; cv=none;
        d=google.com; s=arc-20260327;
        b=KaRNM+OB36+r+xvoRJbrltmtirrplT6bOQ5eegVtuk06i1cEI2NV3Ngy8V20MV5E9w
         5Hc18EdNbFguRcUvtXXAu2ReAubVtq6xggs88o3s8BYifnpb4kt/vU4aYiwbS5BuYj7m
         HzVzqcAKUdiQ4IDKfH4CBkF2lNBpSOQTX7KHNTm97yf2MFIp74qB8BqDz+zjm04aUoaY
         nbeISXpbzz4gxCOTclK8+tMM3oTl2I3XspMjCT0lrUY2ODzGMiT8ViMX9TBcf4DoPtjg
         isG9TsobI6+fl051gggz+ld23SmlUcfl53HDl8pawsy/Gxbu480SBSlnebNzmBNU5Pyr
         8+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eiQ+mFWGiecdRR82uMzLV4tjsPRxwsS531+EQTi21qg=;
        fh=PJA+JXmBuQYmqZhfN7vyNqDw50fAWZ8x7fRFtnRvvEI=;
        b=IG/9RYD78v8p5qzCaRzOxTablUl+RJUG/QdBMtH5H1f4kTY4Z5wrP8ofaSd0pxOWR1
         uzdGE6Lh0CqHVx+mldj0oX5IVy0CDVFxHLE+hpBCU+I2U1KmlsUFZ7Lj/sK9x1BUtYa2
         1gtKdKx86nnMak0cVKwCMq3tP7veWuSu7DNtH93WY0yPmkD5uLrqcT2IbSMc1+qtF2ZO
         MeP5FPxTvb+XNqI90dva907eKfnywmDnRa3UDQwj8kQeOkKotcw+rNX1piQFvyPR3L+E
         bOZEM4bSGjG6yg7NEcUXvBoKl+m7esVTsQAzPbP6L+MmvCcD9BpwcAa8Vd3yN/URwAWK
         Ke4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785871289; x=1786476089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eiQ+mFWGiecdRR82uMzLV4tjsPRxwsS531+EQTi21qg=;
        b=GXKYewx1qSqaSum5qkE3BM03PW0agwoC5LOvfJjfkOvVtN36l/hMJhTqQOCZ1rC5tQ
         Q0kBK3BqQ4i+7wpYGhzLTzrebO0U5r7R52fOkkQZQLD/Pawk1f9CdK8Yi8UGjY300MFI
         zNaZc7sx/wBHAHPSlxyOxf0F2A7GpBdVmjkFbvao5ljWuSFfprQ3AWEy9rJ4Pb0J0EWd
         N712VtMoDcQOfHzb+02fx49bWO/m26jrTOWcwmFAAsPD1oG+0vyJPUom46REx7zb5uhr
         D1uAvUYOcQnjwf/wmMNNWRJjP83zKAnN95R00WuRyRbtDmzgJyswswsqXktdVbz/bFni
         nLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785871289; x=1786476089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eiQ+mFWGiecdRR82uMzLV4tjsPRxwsS531+EQTi21qg=;
        b=XSX4uY5BFP/AkzBoFgO8xb6EUV4nH8W6flpQXgFXLuDFGlDjJp+7fsvAellAqUyYGM
         5kfXs6YYN+qZhBfL8SCuinytjO5lKQiyfjxM9WgCc0jHJMsuqUxtKQrOSYhuafcaGbud
         6rFx90QmWYwFtsjMmJxzfBp5EXS32w4Bkt+N8NtH2w219tFvJyCUjCeRHEDcX1DS/4D4
         0R+xYmKfh4lU26QioSP0uJDig2WQyFinkru8F+ZH4WpuH7ZesGE4NKK4lzTlwyIxVgQ+
         ZEVwziXsx/RuYO6gt45o3e6yTwBDLzsnJwZTRCCisHsIquXDyjo7GEfb34ujomfgxH0X
         bkRw==
X-Forwarded-Encrypted: i=1; AHgh+RqApX5Q+v6DRpA0SlWKUs/1DkeN/AUPSqifQ5BgibmE6OysuQ16mvDDmmWmMlMQnQjYdrMlpAVQTHdRY014+TU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJKDZAIuLndfdDp3JzHkHD/p9FMKttBu663CrBhhkYHF4Wv467
	anVHWbbsG1v5OlUMTyPOGlaQtNSHrRsml3foe2OeWJ/VGExZPTPGWorJhWChOFtv5F49VVKYqRr
	mg3k65cOdEcmd5PUv4nkRuBiEZPfH6I64TnIk+JrR
X-Gm-Gg: AR+sD116doYSttTysmlamc8iPs8mRlPqqyVfkXoGo8igGhiaeKLA4D7JB5mv07eNWFI
	PJsjiWGnpKsVQfnO9NItZ+KzbEIN/x1v8iqwEeXg6zI+jSJTh593BWcyPqg9WDzI+L5YVsem3CX
	vzzF4A3sQgn2rP5pQdHzg8MwPQMZ7ItneTUIbxewJC0T2xmLTwqoWO1YZsiqVBN0rqUOu0Jl4UL
	pbn6gS+wVv9pWUwk44suTyaE8BrJQxrAqo976wGCh5Y4y87ck9tX2klhRyfi8VQeBRhBB21RD46
	o0sLDWPxzH2tjJVJ5FOj2rd2cvyTMIQ1a4n2V7bjjh3ytmdO5uCw0o96HRUv8Gcejij4VBdatqU
	ROe2RXZiXkEDDvgx6h+IBHT9/cZM2FYQ=
X-Received: by 2002:a05:600c:a218:b0:45f:2940:d194 with SMTP id
 5b1f17b1804b1-4994e5f4f08mr178735e9.2.1785871288247; Tue, 04 Aug 2026
 12:21:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801131220.1367229-1-almasrymina@google.com> <20260801131220.1367229-2-almasrymina@google.com>
In-Reply-To: <20260801131220.1367229-2-almasrymina@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 4 Aug 2026 12:21:15 -0700
X-Gm-Features: AUfX_myVmRzjrp685Tu8JJ3h6NSemdTy01R7tU1JzdsGDX3nrETED8K6T0Axa7k
Message-ID: <CABdmKX3Qyeho7Ru8HOzWyCrKXp=kf2H1pOUTXVR3tRWpYhKpTw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 2/2] selftests: drv-net: ncdevmem: gracefully
 retry bind()
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 1, 2026 at 6:12=E2=80=AFAM Mina Almasry <almasrymina@google.com=
> wrote:
>
Hi

> In testing environments, binding to the port can transiently fail
> following a driver reset caused by the preceding queue configuration.
> The failing bind() is typically caused by DHCP/IPv6 DAD needing some
> time to resolve and assign the IP address back to the interface after
> the reset.

With EADDRNOTAVAIL? Maybe loop only for that errno?

> Retry bind() multiple times before fully failing the test
> to improve robustness.
>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> ---
>  tools/testing/selftests/drivers/net/hw/ncdevmem.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/te=
sting/selftests/drivers/net/hw/ncdevmem.c
> index ffe1d5c1fa4e1..6724f81e389fa 100644
> --- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> +++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> @@ -898,7 +898,12 @@ static int do_server(struct memory_buffer *mem)
>         fprintf(stderr, "binding to address %s:%d\n", server_ip,
>                 ntohs(server_sin.sin6_port));
>
> -       ret =3D bind(socket_fd, &server_sin, sizeof(server_sin));
> +       int retries =3D 10;
> +       while (retries--) {
> +               ret =3D bind(socket_fd, &server_sin, sizeof(server_sin));
> +               if (!ret) break;
> +               sleep(1);
> +       }
>         if (ret) {
>                 pr_err("Failed to bind");
>                 goto err_close_socket;
> --
> 2.55.0.571.g244d577d93-goog
>
