Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354B630D419
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 21:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784841534; cv=none; b=HSTs0hAiXZTc9E5TNJGfpaQmoqSM7P1ouul+V8Qr3ahCZyBsmGdNp42VXnRtfxBjrsCsrwILV3mmDqbqRZ6LM1ldyOJ8TJ//+udXa++Nad7c/WHJzmHP2y24DOWY57IHmnTmLYOAchXHIoL5eXkQh/cC8TjWIop+vViJyjgRV4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784841534; c=relaxed/simple;
	bh=SyZCInZKilbQdPQmrs2zGTsB3Jwy6Ej1gt7pA28JOUE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LWgwD5lVuiC5mgG/7NoEnEtBG9r5cv+bn+xjZ6V/0c3IAQ/JsCJ9CDufHMaXdSeYXovdl5eUMLQY1Cj8ikjke4U9GDMAnrUQTeeVew1NJITXBR+5q60cnh188T5MZrFykN1KKDGBwlwKXJ5j3dymcwcRHfDL8P2UdAgtKzeWmEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlGtFyE9; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlGtFyE9"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1036259a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 14:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784841532; x=1785446332; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RcG7tKEtGciiDJtTVHfd2DgDtlLt5OrXaeaVq5LH02I=;
        b=DlGtFyE9tpSRTw5It+KM9adpPnk3qx6xKilj6DIycei9KFn4VP1blFr09pcJoO1GJh
         cLZFq67z5OU61RUGrgKs46/ZeIAQaJoRO6gJFXic6ZiMulYevMdIbJ3rhnhLLjDBr1wN
         otiizVSt94Cy/SPwSkv1G4eVLpYZvqrnv8IN+6Jo41repN94GOJmvvFH/CXtVMXZw6gc
         L9CkidTQcpmo5IdwiBT+r4rSZSLfRz34sO0M05kpy4YXjegu0zh3hrW4XI+R67jUTYwR
         EI1093dmk3vFxeGSsRD55RjM9nF+26oLdqoa9JHXSPexabWd8k/P9xhH6SIeDNvFdxMl
         ma2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784841532; x=1785446332;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RcG7tKEtGciiDJtTVHfd2DgDtlLt5OrXaeaVq5LH02I=;
        b=RFQX6P9/+AosXzcVoS5fy53qgm2XNIi7Ykr0+YFi2RmqstCvzNxOFMBCw2gtNN8TQU
         3aHctXxBrsZf5Ts0uKsi5D1QpM1DCZEVrdLbg8Y0V4gL5CL3R1WaO3MkzD3VfW2GHfm1
         zFV2TupSPCjAbhieDDeehDme9jP9EEhLv7rB/tQtFfAvEEKelS0AwtSfSge+FTSPl0u2
         tj3FUU/7x3APS0b1vl9gpIuiEtnqfoBLrPG6aigWLbpzfv/xJzFnidXEonXbK4ZzLvLq
         KA0kudbOOLnp4bnefQOiQh9j0xVafaHRlJuW7en9Iai4M6lYnG7/TqSse35xUeDOWs3k
         /NPg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9DuaUAQl1hV58DFJ5+ysZpAy5JAN8CsN7tBKQvcFoSjfgqKCi+rsNbIhjbGPsQgrlEDjIoJKF7wKwLmlEkhk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0DiREGFeDJdXHBPfzg7D7TMwlkQLx2nE5Gpu72WKqFeRv54gl
	TGW5SGyS2MmSSK13U9gxuGx++9o028QnjAiBqDtfyPpw4SaTHcDTDd+6
X-Gm-Gg: AR+sD13gDhCeHZjr8nfR+VhT8hYH/sBg6y85T1oNgQJRYJRolk1AVvRSvBu5+TCt/Yg
	XBKFkLyKoSGlt3SLCHEFQeLFt6nwuKPayMghSYqyDLcoCgHgwasevILQcHG29hPxH98vBoCJM4m
	wJ85eOKo68tl1bKvKgyydL1gtsCOxhglmhpL/W0JExEDhvnDVG3Q5nnKe5qwZSMb5gxrK/A8mYm
	LFJ+ThOU6l++pLARteevA0S15jx6SG3r3Xc0DcXGhoPpc3UjlFRu6mnb0IRm7kqcbDBDcXT7KVW
	MXnq/fpm0PNfllGy/n6JHxuNJGZf/FKxOuFvpty7gucNVAcJTr5I77HY5NlDq14E4EZUOXBDXY0
	IBts3XJvUztpOHd5VUEKc8ZXat1KtjENgx5TJzo5gcbW2IrMx4vzJFtuoEwarSKNxXvJKjY5Fjd
	MRUEGi1Xu/tU6/L06vzt03F1DAySQd19Hb4LlSoIj9bOZGdO566lMlwtEhTag=
X-Received: by 2002:a17:90b:580e:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-38ec6495907mr5292630a91.4.1784841532556;
        Thu, 23 Jul 2026 14:18:52 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:c221:d012:6e37:77f9? ([2620:10d:c090:500::2:8dac])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a8421sm17306533c88.10.2026.07.23.14.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:18:52 -0700 (PDT)
Message-ID: <f2dc5760f49efced48afa9a7f99317b35318aa7f.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 3/3] selftests/bpf: Cover commuted pointer
 state propagation
From: Eduard Zingerman <eddyz87@gmail.com>
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>, Alexei Starovoitov
	 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	 <andrii@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau	
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan	
 <shuah@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai	
 <ihor.solodrai@linux.dev>, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Thu, 23 Jul 2026 14:18:49 -0700
In-Reply-To: <c1023bb6c9e24d98cbe69f63e1df487f4d490108.1784696372.git.chenyy23@mails.tsinghua.edu.cn>
References: <cover.1784696371.git.chenyy23@mails.tsinghua.edu.cn>
	 <c1023bb6c9e24d98cbe69f63e1df487f4d490108.1784696372.git.chenyy23@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-07-22 at 05:27 +0000, Yiyang Chen wrote:
> Add verifier coverage for the three cases affected by preserving the full
> pointer state across scalar +=3D pointer: stack frame number inheritance,
> readonly-untrusted memory access, and dynptr data-slice invalidation.
>=20
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

>  .../testing/selftests/bpf/progs/dynptr_fail.c | 31 ++++++++++++++
>  .../bpf/progs/mem_rdonly_untrusted.c          | 17 ++++++++
>  .../bpf/progs/verifier_basic_stack.c          | 41 +++++++++++++++++++
>  3 files changed, 89 insertions(+)
>=20
> diff --git a/tools/testing/selftests/bpf/progs/dynptr_fail.c b/tools/test=
ing/selftests/bpf/progs/dynptr_fail.c
> index 94489ac64da8e..7da4266bae09b 100644
> --- a/tools/testing/selftests/bpf/progs/dynptr_fail.c
> +++ b/tools/testing/selftests/bpf/progs/dynptr_fail.c
> @@ -1635,6 +1635,37 @@ static int callback(__u32 index, void *data)
>          return 0;
>  }
> =20
> +/* A commuted add should preserve the parent id of a dynptr data slice.
> + */

Nit: comments style is:

  /* foo */

or

  /*
   * foo
   * bar
   */

> +SEC("?raw_tp")
> +__failure __msg("invalid mem access 'scalar'")
> +int dynptr_slice_commuted_invalidate(void *ctx)
> +{
> +	struct bpf_dynptr ptr;
> +	__u32 *slice, *derived;
> +
> +	bpf_ringbuf_reserve_dynptr(&ringbuf, sizeof(__u32), 0, &ptr);
> +
> +	slice =3D bpf_dynptr_data(&ptr, 0, sizeof(__u32));
> +	if (!slice)
> +		goto done;
> +
> +	asm volatile ("%[dst] =3D 0;"
> +		"%[dst] +=3D %[src];"
> +		"%[src] =3D 0;"

Nit: no need to zero out 'src'?

> +		: [dst]"=3D&r"(derived), [src]"+r"(slice)
> +		:
> +		: "memory");
> +
> +	bpf_ringbuf_discard_dynptr(&ptr, 0);
> +	val =3D *derived;
> +	return 0;
> +
> +done:
> +	bpf_ringbuf_discard_dynptr(&ptr, 0);
> +	return 0;
> +}
> +

...
