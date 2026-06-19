Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686153B5319
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 21:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781903522; cv=none; b=brUDhrZ/MO26I26zaXqKhREfxhBDU0NrOkGFk9Gx9vxIVs390MdfjXxAQdhjlu7f5XjWVL4lAVzE9/UrmiX0FN+pVxeqqO5iiJmQzSpdWdIEvYAONfiixHi4rsKQtsOFftf1h6MtwFuHXiOJVgPXE9hcJ3j3qPXEOVXkH2aKQlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781903522; c=relaxed/simple;
	bh=T2KlZNGN0UOpUaBsyFt0dhkaB+5rRVU9WeUsgi1eMDY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fAL7Po2UI5fg6vF2DmOOc8LUiRDLp2rIFTtgKBJjplt0oqTvZ6cl67OqrCSudu3FBK5ckhD4/76RvqozPSbcqCmGp93JwkU6jfcK79CO4szT5Ovv8eeljkO4u4P71hC03KXJrQzldF20T3/12PDlYudRsAyEDhzU7gJB9Z01t4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlNnZrr/; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlNnZrr/"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c88a4d79ba5so1580300a12.2
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 14:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781903521; x=1782508321; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oIcl1dO51OF/vN5hzYoL9vwavI++XbOEh7wMcceT2X4=;
        b=YlNnZrr/MVhvhs2KimGElwaYot4o4RqXBtWzhedQCLMUPcb+oiUbdCKJ5OXRu7qlqW
         2rkpUj8e49U9nTq6PKbip/FldiOwbfMYZoJuhj+GXwzXjyli1rmtDYY+Rg4i/FZRU4Kl
         2QFS2czrAJlMtzKbjfQ+lIgmy7dQOVlyR7nuLnJbVwCiL+c4D69q/af9q6Z1mOnLt+J0
         paqkxBp395txNLSXibJiGkomwQg48i0rY0F3rrm2X8jfuhMIiogFfxYIBA+JXMiHwink
         mC3pnB5AkUCJAJCvQJWnfICSW9jb3YtnzqG3FuQkotegY30K8U0QWtg5yd9D8Qm1e6cs
         UDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781903521; x=1782508321;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oIcl1dO51OF/vN5hzYoL9vwavI++XbOEh7wMcceT2X4=;
        b=YqMZuzcZAao3z0F05D8jj8/2IbMKNtha5azSE3xOc1oYRRgJ1hpQy49EhJfYnaAAf2
         /yb8JtGt9aPuHirZ+2z0FEJJK60k2LJpbvWHgfjZacLw4bQpQwXra92OkYJ5iK3MRnB/
         x2dzUU+6uJlLiK41b8PG11olDA8qgpUNKN+9amURJvvjqDkIptLZ67R12eJIXbx7LmJF
         6qn0G4joczO/kSwcIjaHq8Sy1K5XzObrIFmedy06JMfMEv53DBpBz3Brf4tolkDeRwYE
         HTn69weUOa4B1ZdWqEBOEDoZDEF+U4cksyFdVtdiX+wHrioidEwypWjb8iu0445PvVRw
         sVGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3/xbd0nt/c275UgEgO0D6cbgXGeCsBzo9ZoQHRaSjB8oDWqtpv06VtV1jPSim0eV59CF6h6Fu68uaFr5+N6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0aDxVr0A6TyJrYicXyXoQleyEWIYR8vRC+sYAvKX1UaJkT/11
	1Ic6FF1s23YiknlJPK1OYpqS3cJFRwR7CT9verfHFPx+cER/fFFHpQg1
X-Gm-Gg: AfdE7cn5Gzhez0uja2qqxrNxohgP/LSIlwauJ+OGqWXa0xJMJBfu3XBYqdCSJV8qMuI
	Gmc2iXXIQvNtGBfPmEir2v4ycYQXWhePJtM8AYE3F7WTEPuUH0FBgLuWEiKJ4MOwiVrzAWj+l6t
	hOaSYxvvWezxyjakNQbZQP3+22EC/4k1JA+OXGwDu5u6RggfUhgEA6v4ruOHcRfwpy+z730QHpd
	+kjjCWHn/9tx5AtrakwiiTRo4pPN/7lqd8k9YIJILHTsdnrucs9dXOtUKwxzC2HDDtIXFSC/2LS
	PCcfKGAx2i563oNH/kJvONcyba02oqN5NDcT0g8aZR6BNynBbrndxGZa3kmbnGRQZaF3rde9vCp
	2EMGJaXP/8T/+drH5njhMNmRmBR0+KyyqStWrEJp3Dh9Z7+azhBLdQ/Ys4awDQKWOvbGBXlI4Ct
	7FAMIZ4il46gehjK5QNhQzoe7/T/rJ+76CueCjfCbbfA==
X-Received: by 2002:a05:6a21:6b04:b0:3b4:b276:a789 with SMTP id adf61e73a8af0-3bb6c468accmr4619903637.36.1781903520540;
        Fri, 19 Jun 2026 14:12:00 -0700 (PDT)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc5d04858sm566257a12.28.2026.06.19.14.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 14:11:59 -0700 (PDT)
Message-ID: <130931685c8b2064325fc65a856ecd810c8a6b5c.camel@gmail.com>
Subject: Re: [PATCH bpf v2 2/8] libbpf: ringbuf: Prevent NULL callback crash
From: Eduard Zingerman <eddyz87@gmail.com>
To: Jiri Olsa <olsajiri@gmail.com>, Tamir Duberstein <tamird@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song	 <yonghong.song@linux.dev>, Shuah
 Khan <shuah@kernel.org>, Andrea Righi	 <arighi@nvidia.com>, Xu Kuohai
 <xukuohai@huawei.com>, Andrea Righi	 <andrea.righi@canonical.com>,
 Bing-Jhong Billy Jheng <billy@starlabs.sg>,  David Vernet
 <void@manifault.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>, Zvi
 Effron	 <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>, Emil
 Tsalapatis	 <emil@etsalapatis.com>
Date: Fri, 19 Jun 2026 14:11:56 -0700
In-Reply-To: <ajVKM9tJskwg9OFa@krava>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org>
	 <20260618-bpf-ringbuf-fixes-v2-2-33fde039ddf3@kernel.org>
	 <ajVKM9tJskwg9OFa@krava>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-06-19 at 15:54 +0200, Jiri Olsa wrote:
> On Thu, Jun 18, 2026 at 08:26:40PM -0400, Tamir Duberstein wrote:
> > ring_buffer__new() and ring_buffer__add() allow a NULL sample
> > callback. When callback-based consumption reaches such a ring, it calls
> > through the NULL function pointer and crashes.
> >=20
> > Check every ring before manager polling or consumption so a missing
> > callback returns -EINVAL before the manager waits or consumes another
> > ring. Check the selected ring before direct per-ring consumption. Perfo=
rm
> > both checks before honoring a zero record bound so invalid callback use
> > always reports the error.
> >=20
> > Fixes: bf99c936f947 ("libbpf: Add BPF ring buffer support")
> > Assisted-by: Codex:gpt-5.5
> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> > ---
> >  tools/lib/bpf/libbpf.h                           | 11 ++-
> >  tools/lib/bpf/ringbuf.c                          | 43 +++++++++--
> >  tools/testing/selftests/bpf/prog_tests/ringbuf.c | 93 ++++++++++++++++=
++++++++
> >  3 files changed, 136 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/tools/lib/bpf/libbpf.h b/tools/lib/bpf/libbpf.h
> > index bba4e8464396..9ba6b9ad3498 100644
> > --- a/tools/lib/bpf/libbpf.h
> > +++ b/tools/lib/bpf/libbpf.h
> > @@ -1526,18 +1526,17 @@ LIBBPF_API int ring__map_fd(const struct ring *=
r);
> >   *
> >   * @param r A ringbuffer object.
> >   * @return The number of records consumed (or INT_MAX, whichever is le=
ss), or
> > - * a negative number if any of the callbacks return an error.
> > + * a negative error code on failure.
> >   */
> >  LIBBPF_API int ring__consume(struct ring *r);
> > =20
> >  /**
> > - * @brief **ring__consume_n()** consumes up to a requested amount of i=
tems from
> > - * a ringbuffer without event polling.
> > + * @brief **ring__consume_n()** consumes up to a requested number of r=
ecords
> > + * from a ringbuffer without event polling.
> >   *
> >   * @param r A ringbuffer object.
> > - * @param n Maximum amount of items to consume.
> > - * @return The number of items consumed, or a negative number if any o=
f the
> > - * callbacks return an error.
> > + * @param n Maximum number of records to consume.
> > + * @return The number of records consumed, or a negative error code on=
 failure.
> >   */
> >  LIBBPF_API int ring__consume_n(struct ring *r, size_t n);
> > =20
> > diff --git a/tools/lib/bpf/ringbuf.c b/tools/lib/bpf/ringbuf.c
> > index f2bb619d5a75..0dae4d95d309 100644
> > --- a/tools/lib/bpf/ringbuf.c
> > +++ b/tools/lib/bpf/ringbuf.c
> > @@ -231,6 +231,26 @@ static inline int roundup_len(__u32 len)
> >  	return (len + 7) / 8 * 8;
> >  }
> > =20
> > +static int ringbuf_validate(const struct ring *r)
> > +{
> > +	if (unlikely(!r->sample_cb))
> > +		return -EINVAL;
> > +	return 0;
> > +}
> > +
> > +static int ringbuf_validate_callbacks(const struct ring_buffer *rb)
> > +{
> > +	int i, err;
> > +
> > +	for (i =3D 0; i < rb->ring_cnt; i++) {
> > +		err =3D ringbuf_validate(rb->rings[i]);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int64_t ringbuf_process_ring(struct ring *r, size_t n)
> >  {
> >  	int *len_ptr, len, err;
> > @@ -240,6 +260,9 @@ static int64_t ringbuf_process_ring(struct ring *r,=
 size_t n)
> >  	bool got_new_data;
> >  	void *sample;
> > =20
> > +	err =3D ringbuf_validate(r);
> > +	if (err)
> > +		return err;
>=20
> as Emil noted in first version, this seems like overkill, could you
> just check sample_cb !=3D NULL before it's actualy called?
>=20
> in [1] you mentioned you plan to add some feature that won't use sample_c=
b,
> it'd be easier to review/suggest the solution with more details on that
>=20
> jirka

As-is it appears that the simplest thing to do is to error out in
ring_buffer__new() and ring_buffer__add() when callback is NULL or
when overwrite map flag is present.
I checked our internal usage for then __new/__add functions,
and it seems there are no cases when NULL is passed as a callback.

[...]
