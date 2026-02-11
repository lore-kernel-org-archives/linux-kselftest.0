Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A6133032B
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 22:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770847890; cv=pass; b=q5MAeRVj4t1kISEsgPEuZiOEGZgxfxj0zXg0wW6WGevVksjZU8UvwlSL/j5NCmV529pB1l4XRpyyTnx+XF3cbJa/0LYUtDoxlGKlZUPsk76rOo/MPJSSx5TYriLq6avbfc7qQfL6h4NN7AKjhthxeu/wab9bPbA6bo3b1aL6v8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770847890; c=relaxed/simple;
	bh=JiSSwWSerMjJ0lnCuuErFYRTqBQvNbw9BigQz83PYg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VZ5JnqmSDO+XSKH8Eu+XQquLYVD0Jogo7NCFiXO//ZXWuF1G+6ulv12HN1w45ql0XPVPvgcR6Iy1nAjkBcc53sFOWMHh+7W6gS5krU2ML1E4tT447Z2ncWfCHVdBI/XDsR7/OwQdmgd51b5+xm10I73rQWKK59l0LGB7uiVadFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8NpOVMi; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8NpOVMi"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2aaf9191da3so17133745ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 14:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770847888; cv=none;
        d=google.com; s=arc-20240605;
        b=kU5PisGHK0ZUiM9Lekrcf1u9NNjG9wasZp3oTmjuSN/bv7IIPlIm4vdMpkD6xMsNHT
         WvbwaBgxUNz/Qz9eDBl/DBJHCAs+ss35FPI+VwWJWKpfx2hDp+5yVIv6gdFYbcvwhCkz
         z/ZnWlLYwmc9RyR9uViNUFGBwSrIN2GAWvVclFni8SnzQ9nhecRYJOkDvvQit6A5/Hjz
         IlNJWUrHI5z5FW/dYMa0doynxuwgpJxIDA1bqTdIx4P6MvtCw4j1BG/SGZV+GNWwmJ60
         Ik7Ptr6aVAv65ra7zs9cf0mB82KrCElEb3AvLEXTnYvDvHrYa3SHrhzbkUhltTPVUZOF
         1dwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s3YLj4yo1hdeJHDtsmSn5m8ezeqMhDQtpYJhbUhzSCs=;
        fh=kQwVLgEuBiEDwzE/Xed3U2fxHdsezZ+kyrh0fn/j6wI=;
        b=YzJBxqg41x5R6PXpepGlHSVFeZKWVSk2v4Uw3sl2JeCjQ9GmRQmyegtOxSOuwswCFd
         iOsadlFqIwtHSMfQ6GUtu7nsQYbO4AFK0mdhDbf7ze7rLgXDDpmjb14fxHn9vobdISw1
         25z8u+XukKVl0RDyuFgWLs8Ci9au27+2EY7a/T0XHYy17DD3vYduDC21BH7XdFkzda/c
         0pZNyUgGzjFfpKyVd3T4JH3oTpUElR1vuCAgHzk0JRAsUJe4KZV0ZlOGYDDlNeCeFsk0
         5qku3l+J7+t/zsSz/QTb5D41dar6LlsByz00xZMw0lxEauuo/+vB1wasFDOtPZaxtnp6
         lBkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770847888; x=1771452688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3YLj4yo1hdeJHDtsmSn5m8ezeqMhDQtpYJhbUhzSCs=;
        b=R8NpOVMiMcQX0I2yd5Hb/YdZiM01zGM4AZmbXy6oaymYPCBBuVcX1C7K48P+y18yjY
         5XHaiMojiKY8Q5YY6hW4d5H05j487AphhFrV55zXO+BYZF0hiTRvZnD6r/DZoWYukvkU
         ByM2uW0uJ9CUEjehdjZGmu0fuSPQqCKVdUqjjRnVazoOjdPQoVLlgmGU6lScb1YnHOhF
         dv0VcCVT6tTDgOAz+oWqYMsdBtBWUDnyM5gSmJz3BcxK84/a4tIdGVCSUVd+ShQf9kbA
         2kNBlxx1e2NAFOR1iDW2mDAfly6cgC+P74oW/jlBhltosgkBf8JA96RxF9YE1JzXk6YP
         oCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770847888; x=1771452688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s3YLj4yo1hdeJHDtsmSn5m8ezeqMhDQtpYJhbUhzSCs=;
        b=n8ADrfNa8JFGW6UR+TI/4RIQlHxVBnUOQhpqbpocSafNOeR0Dd1I+ZI/qWAGHJuTBO
         1rXC1ktlvkoV2pH0dLy1kI70NDl23zx/LFwkKAkLAu7/l2TIBrb4XxAkFVHuOa/NYc6X
         ikhb6chI+YA0EA5H1gnJXJ2tuqfggoq7OrgIjcY5+SX37zyGLa7Y4cjShz4PFn4W+z+Q
         Pwui40OOqpDJoDYSMbxYumGotZZyhKMahkXjDqcOaecMwYXb3+8xVqk0lUbnZb2dl6qr
         sVzcbjFNpMWBt+Ic3f2nFIEHn5bvzJTlW1YyTe670XinUc903PioMZZQf8gVSgKqaGpm
         4E5g==
X-Forwarded-Encrypted: i=1; AJvYcCXyZcYu7Y7WGvHtGcv3rouyHwxkG79AV2wtkphy6xBwAJpV3i3V04oN6d2T4eSjkFdAw47neLFdYguDLD+XeOY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Cn7YHu83+lqeXSz1m3nPKw7dApMTQmpWVhDia1Hi6Xkjylgf
	j8qxF+49pUYfXwIWY50StznnVT4tjCnYxWpVExsRDHS4vRkakGTpfK7FUO+hdyZvviNVdlQepWb
	67L3PW07mRznWLz3SV04zZw8WzgIMRLA=
X-Gm-Gg: AZuq6aKdfj0FI8Y3yXOY7nGT748HjdSbNP/jQCB4aNyUjzFkvJlQNdAAmtPn/e4dffB
	YdTeAl6nr8f4DefwfVpJTXBKoQSpDl/eMmiodDpRGnSAdtznyoLcs//vuS4WztHmZ6oPQs4y9Nq
	K+6CY5eEwoiQQftZ5i0BnAz8SdY2EDKFMR/qIxirVDFe6oT9YAPS51sOMI61i2M2DL0ogNiMMpY
	3kwVuaok/g1amBYF/3TeEP597Oh5IZNdkSvhURlsad4dQPNwc8KabMM50Ckx8CZqTmkpP2C01wU
	wyionbwiscSNa+qn3NvceH0=
X-Received: by 2002:a17:902:e845:b0:2a9:634d:de98 with SMTP id
 d9443c01a7336-2ab3b1a7943mr1909285ad.23.1770847887796; Wed, 11 Feb 2026
 14:11:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211151115.78013-1-leon.hwang@linux.dev> <20260211151115.78013-6-leon.hwang@linux.dev>
In-Reply-To: <20260211151115.78013-6-leon.hwang@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 11 Feb 2026 14:11:15 -0800
X-Gm-Features: AZwV_QhJt1PQFJH8kXPiKEX8G0i2EkGRQG9mZq9x-DDfQaPpKPgqIRSO-GyXGqY
Message-ID: <CAEf4BzY3GA+860RODLaXqqO3j5AgJ24pmKU1yv3+gHJpy0DvNA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v10 5/8] bpf: Add syscall common attributes
 support for btf_load
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Seth Forshee <sforshee@kernel.org>, Yuichiro Tsuji <yuichtsu@amazon.com>, 
	Andrey Albershteyn <aalbersh@redhat.com>, Willem de Bruijn <willemb@google.com>, 
	Jason Xing <kerneljasonxing@gmail.com>, Tao Chen <chen.dylane@linux.dev>, 
	Mykyta Yatsenko <yatsenko@meta.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Anton Protopopov <a.s.protopopov@gmail.com>, Amery Hung <ameryhung@gmail.com>, 
	Rong Tao <rongtao@cestc.cn>, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 7:13=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> BPF_BTF_LOAD can now take log parameters from both union bpf_attr and
> struct bpf_common_attr, with the same merge rules as BPF_PROG_LOAD:
>
> - if both sides provide a complete log tuple (buf/size/level) and they
>   match, use it;
> - if only one side provides log parameters, use that one;
> - if both sides provide complete tuples but they differ, return -EINVAL.
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  include/linux/btf.h  |  3 ++-
>  kernel/bpf/btf.c     | 30 +++++++-----------------------
>  kernel/bpf/syscall.c | 11 ++++++++---
>  3 files changed, 17 insertions(+), 27 deletions(-)
>

same remark about user space only log_true_size, but overall LGTM

Acked-by: Andrii Nakryiko <andrii@kernel.org>

[...]
