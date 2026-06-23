Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DAC39E9D5
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 20:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246439; cv=pass; b=JvK9cnEv3NWCKwIP465/R+5IuS7H0J0O/68uEuZWGIclY8UcCqIM3y+JH6+B8Odj8/SsA1AqGXUhfgS2w2pAyHVE/2Jqe6DEPqkpt8uqp/Qp2KHtmjeBRdOJw07mPadcMmc9//gPrUdAw4WSuZd1gdR7J/Y8Ri+wZjOTBr+ffwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246439; c=relaxed/simple;
	bh=0givHChfCtgJoG3Jw5N8bUWO/zkCW2u8xflNqGJxbDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cAdZ/nOvenLuHbxAUkcnnkA6rc4JtxS6YvA6XaAB0d4CBt9T+w7K65CIpx/+wcDu8ewQXb/0vLg4b0L4ZxGLTaYGZF8kLz+IgkLB3k3yHb6PNl3mdGDHP/1u1JsnHKTWeKBIBONLin0+yakDlOgnTmIup1roQL965yQYptd9Qrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9c1OcuF; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9c1OcuF"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c40397e746so1605565ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 13:27:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782246438; cv=none;
        d=google.com; s=arc-20240605;
        b=ZmZViyDklg5EC0/G4IHNFCnfrj+4GpkSlGw5IJr/Vh0aT0Y+7bNEo6DMJfsj0+y/0h
         ewquQrll6k3NmVB/Ylyhz08vHYU5pIc23vIs2cGEj/GutZOdzUnT085yXrATqXNmUqCQ
         +0FE4UAxk1Q1RCEthv3dDQndKa1Le9qc8y0Un3ip8Nt9YDoB3Zcm/5218tk85SrxDZWv
         iAFliCBFPGZRrUY5BtUdkdcjhokNLlkSbs35/HTFSwFYT0Z0J4rzXfr4xtnFdtB3ntVs
         vWX5edb92rk6hBqbCJOVz6S0QtZSbZPmfK8oa8Di+ami6awgpqfpGwQAvt2KvC+/1x8n
         TiKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A2p3VMqob0x6dZXFsBHs+SV7dY60+U6kj2FwO5qGa2o=;
        fh=jiFJuFhq0xH9a6gfjPtBmAzCkX4omitDkRLCx7OAEbg=;
        b=Dv0buID1KI2/87ZamBZVu7iZ3xPVeorQ0+qM9ENTbT6j2Txn1dwHIF+sE5fcL6VqL5
         Pg/0s9e7qzbQPpn16EXY4OD7GS2KS+kZ2f3lBr/rJ/kBoxS5dsPzGYZTrIlkkpHD58PC
         hLdq092GPq4dXfgkeFOWz/C9bXi5pyyoNS3sPVwK6dURlo6PL9UANy+K2KcZVPyPZdM9
         /qjVmlkFgjXyzbZD/3RQwOHcybSIqKY9kmzERkYEjmYUuH0QylwAlWTIWSCeYHUBWXH6
         L+PEBO+LeUsjgHckwSoKL//komsOaSpRUtu3Zzm48OTQIUinM+VkhQg8QXYlvdSS+scK
         B6mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782246438; x=1782851238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2p3VMqob0x6dZXFsBHs+SV7dY60+U6kj2FwO5qGa2o=;
        b=Z9c1OcuFHmBWV7Ua7iIv195QoBl60M5YfeP4Yx3FsIsMloirTWshGhrF7mUoYjQQ7F
         UubvpL6zUTp9Lq64ALr60qaFrBSqFblKK3l7icw9Z8609FpXp1LJb6HhDjYS0oMOUnvp
         Ezpk3fjyjIpCTOrGGGQUqxLEVkzC+idDV9PxUMNpRVE4jD9XIX1kjEHcWaZz2T3c32Yc
         DfuQE8hx9gCbbZoZNZvAZ6/yIQsNWfCYVWrCUI2+gcMHgG8KOW0mVwOMI+hpKudiE2z1
         9KpJkcMUpyR4SC64b+NEmHejaXNAQK00xBtW690qvssYszxKyiTz49ZcaSgr8MV2gXsa
         hDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782246438; x=1782851238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A2p3VMqob0x6dZXFsBHs+SV7dY60+U6kj2FwO5qGa2o=;
        b=pD7YM3s/CwJzowV7liaIRR6UyB8uBZ3ZLCjKbyRGFR9FGXsKM7QFQcGFOfIl/aoykM
         fODfBhG+dk+O3ednisgg/ImOgVF+K7lBifTLkwWhupRh8XMa5j60ZWGs1tv3hHd0wh59
         Z5tKIOpQgLidmQQ7LPXU30nEu2hFDgRNpeB31nM5e0GGS1Si1B96gDs2iSlGX2Kv1rzV
         hd+kLyoMvIL3oghuyofZdqGqWRKfzqk8hPLhLdA5K/WdFyt9o/wRcvLXMlvhuouw6r6i
         FT9X7toeS9bGEPOpns50GDj3vsHhSmOsTti1mHwuLXnPngzh804TDLlV89XI7Bt7g1d6
         ngPA==
X-Forwarded-Encrypted: i=1; AHgh+Rri69ARqtq6Pv375xejXRyA6VuphQ03EXRX8WotSQJFvz8vIXXu07fkeNttSVAEPR4X/br6sncv97maOI6CHe0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqS7vwbolLahvp8R3L+MDuMcVHPJwV4fACrJCnLF9d4Uf+K49q
	+nVG6PnQ+X+Tqm6ECP/K0In2JRgonwTKL0quJUbrRf8qirrK8VmdQZWnxvlxT2BIiub31WXqdbM
	pxcYRtxtkr3+rSZtRJ8Tp9PTv74E9VbU=
X-Gm-Gg: AfdE7ckwCkJiaIPNhw/YyMtMR0m0ng2Ld2M1KKw+fOYkUAOn+4OIPfpsYLLKzqLCym/
	0ghqYH6T/dPxtpICF3jlfv10Dj63QvgKTg9ymhSiixi9sHO5vt3JwsgfTOPRZYeHlEniYjSNwrg
	B75pqmDN2QZZM4s405Dmepv/wXvi2TycpFTI0pORV4GafZgyZi2L1e+J+9cXIgDLMo95CWAHgcr
	47RDvCvvdo4K25aqQSbA3oo5nM/T3ZLimGULHlGjOqQCTDwPQ/0CjzA5I6mLv6wdJfPdaTDWPAp
	34VURYdrbKK1OVkVdKpJIQ5qREyRvTjHmK54D1hxKEhwpBlchXgO4EeZ+shee4g8LZD6Lg==
X-Received: by 2002:a17:902:d505:b0:2bf:23c3:34ba with SMTP id
 d9443c01a7336-2c742b3e10emr162283065ad.28.1782246437819; Tue, 23 Jun 2026
 13:27:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-8-33fde039ddf3@kernel.org>
In-Reply-To: <20260618-bpf-ringbuf-fixes-v2-8-33fde039ddf3@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 23 Jun 2026 13:27:03 -0700
X-Gm-Features: AVVi8CeXtZ15zdMfAxyxFrRffuXWFGGoz7UAyF138iQEs558FIoN6NKA4iLQNGs
Message-ID: <CAEf4BzYKewRUpOboOmPcxdX25731tF0w63V0Ha=_f4D_F-ie3w@mail.gmail.com>
Subject: Re: [PATCH bpf v2 8/8] libbpf: ringbuf: Prevent missed wakeups
To: Tamir Duberstein <tamird@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Andrea Righi <arighi@nvidia.com>, Xu Kuohai <xukuohai@huawei.com>, 
	Andrea Righi <andrea.righi@canonical.com>, Bing-Jhong Billy Jheng <billy@starlabs.sg>, 
	David Vernet <void@manifault.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>, 
	Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 5:27=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> After consuming the last visible record, ringbuf_process_ring()
> publishes the consumer position and checks the producer position. These
> operations lack a full StoreLoad barrier. A producer can therefore
> commit a new record but read the old consumer position while the
> consumer reads the old producer position. The producer sends no
> notification and the consumer waits despite a queued record.
>
> Insert a full barrier between publishing a consumer position and the
> next producer position load. When a record bound or callback ends the
> current invocation first, execute the barrier before returning so the
> load in a later invocation completes the same handshake.
>
> Add an edge-triggered epoll test that drains one record per call while a
> concurrent producer fills the ring. Without the barrier, a missed
> notification leaves the producer dropping records from a full ring while
> the consumer times out. Document that bounded consumers and callbacks
> that terminate consumption must drain before waiting again.
>
> Fixes: bf99c936f947 ("libbpf: Add BPF ring buffer support")
> Reported-by: Andrew Werner <awerner32@gmail.com>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/bpf/20260614015716.945AF1F000E9@smtp.kern=
el.org/
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
>  tools/lib/bpf/libbpf.h                           | 23 +++++++
>  tools/lib/bpf/ringbuf.c                          | 24 +++++--
>  tools/testing/selftests/bpf/prog_tests/ringbuf.c | 83 ++++++++++++++++++=
++++++
>  3 files changed, 123 insertions(+), 7 deletions(-)
>
> diff --git a/tools/lib/bpf/libbpf.h b/tools/lib/bpf/libbpf.h
> index ae46b17feaa6..3a649ed87034 100644
> --- a/tools/lib/bpf/libbpf.h
> +++ b/tools/lib/bpf/libbpf.h
> @@ -1440,6 +1440,11 @@ struct ring;
>  struct user_ring_buffer;
>
>  /* Callback-based consumption is unsupported for BPF_F_RB_OVERWRITE maps=
. */
> +/*
> + * A negative return stops consumption; non-negative values continue. St=
opping
> + * can leave records queued without a new readiness notification. Before
> + * waiting for readiness again, consume until no records remain.
> + */
>  typedef int (*ring_buffer_sample_fn)(void *ctx, void *data, size_t size)=
;
>
>  struct ring_buffer_opts {
> @@ -1456,6 +1461,20 @@ LIBBPF_API int ring_buffer__add(struct ring_buffer=
 *rb, int map_fd,
>                                 ring_buffer_sample_fn sample_cb, void *ct=
x);
>  LIBBPF_API int ring_buffer__poll(struct ring_buffer *rb, int timeout_ms)=
;
>  LIBBPF_API int ring_buffer__consume(struct ring_buffer *rb);
> +
> +/**
> + * @brief **ring_buffer__consume_n()** consumes up to a requested number=
 of
> + * records from a ring buffer manager without event polling.
> + *
> + * @param rb A ring buffer manager object.
> + * @param n Maximum number of records to consume.
> + * @return The number of records consumed, or a negative error code on f=
ailure.
> + *
> + * Reaching the requested bound does not establish that every ring is em=
pty.
> + * Records can remain queued without a new readiness notification. Befor=
e
> + * calling ring_buffer__poll() or waiting on ring_buffer__epoll_fd(), ca=
ll
> + * ring_buffer__consume() until it returns 0.
> + */
>  LIBBPF_API int ring_buffer__consume_n(struct ring_buffer *rb, size_t n);
>  LIBBPF_API int ring_buffer__epoll_fd(const struct ring_buffer *rb);
>
> @@ -1538,6 +1557,10 @@ LIBBPF_API int ring__consume(struct ring *r);
>   * @param r A ringbuffer object.
>   * @param n Maximum number of records to consume.
>   * @return The number of records consumed, or a negative error code on f=
ailure.
> + *
> + * Reaching the requested bound does not establish that the ring is empt=
y.
> + * Records can remain queued without a new readiness notification. Befor=
e
> + * waiting on ring__map_fd(), call ring__consume() until it returns 0.
>   */
>  LIBBPF_API int ring__consume_n(struct ring *r, size_t n);
>
> diff --git a/tools/lib/bpf/ringbuf.c b/tools/lib/bpf/ringbuf.c
> index 141f2cbe56eb..0598f6c2f7da 100644
> --- a/tools/lib/bpf/ringbuf.c
> +++ b/tools/lib/bpf/ringbuf.c
> @@ -271,7 +271,7 @@ static int64_t ringbuf_process_ring(struct ring *r, s=
ize_t n)
>                 return 0;
>
>         cons_pos =3D __atomic_load_n(r->consumer_pos, __ATOMIC_ACQUIRE);
> -       do {
> +       for (;;) {
>                 got_new_data =3D false;
>                 prod_pos =3D __atomic_load_n(r->producer_pos, __ATOMIC_AC=
QUIRE);
>                 /* Positions wrap; the consumer cannot logically pass the=
 producer. */
> @@ -279,9 +279,9 @@ static int64_t ringbuf_process_ring(struct ring *r, s=
ize_t n)
>                         len_ptr =3D r->data + (cons_pos & r->mask);
>                         len =3D __atomic_load_n(len_ptr, __ATOMIC_ACQUIRE=
);
>
> -                       /* sample not committed yet, bail out for now */
> +                       /* Retry a busy record once after publishing prio=
r records. */
>                         if (len & BPF_RINGBUF_BUSY_BIT)
> -                               goto done;
> +                               break;

so we do this one time retry just so that we can reuse the same memory
barrier, is that right? and similarly all those error-returning
conditions with cnt =3D err. Wouldn't it be cleaner and easier to
mentally follow to have `goto done` which would just duplicate memory
barrier and exit with whatever value err is?

>
>                         got_new_data =3D true;
>                         cons_pos +=3D roundup_len(len);

[...]
