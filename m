Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794500850;
	b=oLkbyArtiGB8Y3EvjSybgSkMwdmHwBWDRmphmuIdTFav1+dZ5LKZH0PjqVvG7tCtDIAw
	 RKg562MFeq5J6S1LtMf4KTE3bKxW+9XSKTnpTUehco542JVbRwqcOi55/frtUFLUpXocD
	 BropomH5vLAjnPpSUvnz8eepplHWGGZyZccHFWSRP0W3rBJsCpQbtLuxNjOeD8Ceh9MKw
	 dgZKh6BTl2RshpASELoyVOgk3Bg4VoKRtLIBSVTA1eZsjNbEcVI5JKlzx/VNF+QpYuPOe
	 izYDlXX6mzVIuT8uwIEp5agvAy1ZxSOVmhU/DMHtP8/CIS1iI9dveKnfUzQO1F8QtaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4rfQtqmAIAvmt99DAIISM3k+R3AqubbosQEc8qLWnGI=;
	b=srwohA/aemqBRGD+sBwVTXnOSIVM2xIJW163dD53e4c+XehCmkIqK9LqWVer2gOoZrOo
	 uH3cirdZOc+gg1AKGhgnNYr0/PFZkOxpp2LzDd2vfksBxN6U2u9zpe6M0P5SbAZIGTRpu
	 cdKriEBKzPF+F4Wdm1d/7/FZQ/F07du/Zn1JWEvMRJyXnm7VbYfcAw7ZBcAlEcmJVMamt
	 dPm4/LyjQa6Ak/gY31TZGm8n/P1trC8o8KDOe/r8MeWaSFZLLb6EeZ28EJjEd6zp/queM
	 OXRiMPM7CBvLgVaipT6lp9wib473sdWsDGmyenNARZ91gJf31kubcW9yD5mOUZ2Iaqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YcmCDyza;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC00606A321
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 16:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CC00606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YcmCDyza
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b76c15ae36so45325e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 08:27:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794500848; cv=none;
        d=google.com; s=arc-20260327;
        b=aD4h7630TYSi+l8V2uDRdadFv25YkC7n4nxQGzY9tNY4EVBrHCyD/7oEoiLIiPWFwP
         qBAWezkSPG4/w4wGModEBNbqZ1Ry5wZwRmOHM3qmo3SolTTXD+Xjr4T8JApwck63Ij2I
         WSAlT/1tCE5KF7t8GCQippq6yEPeeA0lFhNskl+IjXL4ikFgjRwcnRJNO6g6sy53sPJd
         SZj+fLFd5uiig/UxWHTURpym+hRLZjA1pouRuFPgm0HV9P+xYDINItlvFIu9UnYjn7GP
         pwgtEzRwRk4irUgr9XjObiOSlfilr391+ViX4MVp+QoTozEpC3KACwOP8w2D020hLwGr
         eqiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4rfQtqmAIAvmt99DAIISM3k+R3AqubbosQEc8qLWnGI=;
        fh=HFryzWpoWN4Wp91SwuSxVRCJn/DBuc1zOjCgcSWhDDU=;
        b=HSQRPltHi/BzRqXjK6kqweQQzVWP35f0zloAk8I7DR1BkVWB59gqgwO3fOmjNUcddb
         Tryv8xU+LE+noI0CD5lYSiK6eIl9Q4rHzIAtVwfoV9shTPp8dtf9hYuDXT69vPiYkwnH
         dGvp9FnDl36L4At1XLzmnRqeFQBkZ4Xo9+wRy0vcf6ooAIjTFvYL7U2ie/fDFyTQXQox
         JHAzVU0dj4bfPlj5wqI+s2JDYltBYaixkZiG0UOsEy5P7IGip8KQJ5kpTZpTk7+aSEhd
         lxZQ2+rVyOcjW3MQW7o+N09XthM4pfVpF7N54BQ6B3lGe3YHkrYpMMDYyvBXUuOgRiuB
         hJPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794500848; x=1795105648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4rfQtqmAIAvmt99DAIISM3k+R3AqubbosQEc8qLWnGI=;
        b=YcmCDyzav8Nt9tsG6YB1qdzrsUj2K7xN0qRg6FjWZ85PVWjBDXTysbYRtMopeaGbHw
         3AD3NY7Klvu3c//cl4xWyT9uv9XZ/YXGR9E9IhVCPadmz4MO66ZCO1opX2iXapP6/oAW
         rtO+VtvjKI3UtJ9VnqFC+tm2nkYPOWL4ytG4YVF/EbhrczQOQcN6os3wrD4qT8Ih8wns
         9iFRpW+zxr43BA4tifJ2kpNVhhJvQbYNQfVQQLbcZpDT7Hl0lS70q9bjAg3WzVJsnTRQ
         f5B7HuJNmAZOpibG3xssCazggPBdHG8B4QJ6mGcJJJb8+oewtXsLgZxQ5gCpnjQ0hotN
         VoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500848; x=1795105648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4rfQtqmAIAvmt99DAIISM3k+R3AqubbosQEc8qLWnGI=;
        b=ciakR9gGnPlu3JRAtbV9w8biGMKcSlQKsCsX3kL72EBFFXURAMAXBYwPvpJlpabeU9
         zHnm/bmhGYbXL82sMiVFcgkcx0IxBQdNxfWgDx39SGJtvzyfdClKp14I/sQdoapyhtYV
         wTjabqR+7QDjVceV8nj9/REdgpsWP9p/uF8u+jQ6wxenVA/SZd2HzHiljyHD0TJbGgH+
         7sqbOuwPc/+QqaMyFPm4tI8RuhScet8PsvxuQUEWZyXhJyoqLNzVRAJce6g7hyv1nAAQ
         QhnLRMrVqbIaCOu70DhrJHHizsurPYMZleWYqJdN4mP9YYwapcGMu2wgs13FS2KLDo5g
         69Jw==
X-Forwarded-Encrypted: i=1; AL+hErEK0UvE/F+UfCwOKQOcJ+7AUxrqx96BU9d7xhtUr3YY04e8iIDRJZCWw9J+qg4QuwE3pvkO5SK9DT078YE/Ebg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q10h1GXEopz4gbfKsv4/RTECc4X0CD+EETnMOGjxYbQCceIAg
	e3lP6hseksmh0aLD+Tlr9mv2tiwCp/sFkZdhNLl9qaM9945Jz3cI68NDZl4XozmlVLQFER7fQHt
	5Q6e+B/VkeppEDr88DDZ63CfXsDkbIgyo+lxiUtBa
X-Gm-Gg: AYBFou0jTL9BgPudANIKW5UB31gpnksFfbtIJ4AxCjMhdEYtomUXOQImrxBp2MyiRyo
	xGTgKEoupcdL+PXuYAn7FvdgxbCX4Ceg0uiLceC+7E1bFsC8y8HQWAiSnAyRy0MeHnWzWxXRfwp
	RKGVYO8uIP/SWFKdIup011+7KzZuv5o8jUVJTIUo7cfC71yc7zExXUgc+fG2WQPs8RvteQLMwrY
	iVd+yrbdE5fPLLIWxQDtypDSULBrGMhplRtdEWlM9FTNV5SZ8BL+fklGysYqSZM9EbRjFUlunXv
	NLKGmD+vraOTPwhesIntKd0CGkjX0bTAc2COqs9GxMhhdxQsBpgG9hOds8NJDDMK+NUIRDax9QI
	s372ZYMismAD6MMn0zXOEm61C8yjlhWp8nUUk5BlEjYoucvytl7LnnJQGhjit3rjpCJId3qEJUx
	4KBlDmKjOV6/doNBEP4sAd
X-Received: by 2002:a05:600c:3484:b0:4a1:d7fa:ae36 with SMTP id
 5b1f17b1804b1-4bb4f596156mr1132755e9.4.1794500847262; Thu, 12 Nov 2026
 08:27:27 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110125106.2935677-1-k.chen@smail.nju.edu.cn>
 <20261111195942.1283060-1-tjmercier@google.com> <70c7192e-b9e7-4b06-9d78-38e9de85f486@amd.com>
In-Reply-To: <70c7192e-b9e7-4b06-9d78-38e9de85f486@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 12 Nov 2026 08:27:15 -0800
X-Gm-Features: AclHuK-uQbQFbW5RNXEONirv5hUwyDZLZazYVkX411MRAANXcv3dooeKp4V1qsc
Message-ID: <CABdmKX3rqcf-U7W7E+d79dM9H3VnwUjAH3Hv92MczMSmQauC3w@mail.gmail.com>
Subject: Re: [PATCH bpf] selftests/bpf: Test that a drained dmabuf iterator
 keeps returning NULL
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: k.chen@smail.nju.edu.cn, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, shuah@kernel.org, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	sumit.semwal@linaro.org, phasta@kernel.org, tj@kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 1:35=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 11/11/26 20:59, T.J. Mercier wrote:
> > The BPF iterator docs in bpf_iterators.rst specify that the next
> > function of an open-coded iterator should keep returning NULL after it
> > has been returned once.
> >
> > Add a subtest that checks this for the dmabuf iterator. It drains an
> > iterator, calls bpf_iter_dmabuf_next() once more and checks that the
> > result is NULL. The dma-bufs the test creates keep the list from being
> > empty, so an iterator that starts over would return one of them.
> >
> > The existing open_coded subtest uses bpf_for_each(), which stops at the
> > first NULL and never calls next() on a drained iterator.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Let me know if you already have drm-misc commit rights.
>
> Regards,
> Christian.

Thanks! Still waiting but no rush.

> > ---
> > This depends on Kang Chen's fix and fails without it:
> > https://lore.kernel.org/bpf/20261110125106.2935677-1-k.chen@smail.nju.e=
du.cn/
> > Kang, feel free to carry it as 2/2 in your v2.
> >
> >  .../selftests/bpf/prog_tests/dmabuf_iter.c    | 19 +++++++++++++++++++
> >  .../testing/selftests/bpf/progs/dmabuf_iter.c | 19 +++++++++++++++++++
> >  2 files changed, 38 insertions(+)
> >
> > diff --git a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c b/too=
ls/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> > index 1a5dc1adae73..c1f81b5dccdc 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
> > @@ -265,6 +265,23 @@ static void subtest_dmabuf_iter_check_open_coded(s=
truct dmabuf_iter *skel, int m
> >       } while (bpf_map_get_next_key(map_fd, key, key));
> >  }
> >
> > +static void subtest_dmabuf_iter_check_next_after_drain(struct dmabuf_i=
ter *skel)
> > +{
> > +     LIBBPF_OPTS(bpf_test_run_opts, topts);
> > +     int err, fd;
> > +
> > +     fd =3D bpf_program__fd(skel->progs.iter_dmabuf_next_after_drain);
> > +
> > +     err =3D bpf_prog_test_run_opts(fd, &topts);
> > +     if (!ASSERT_OK(err, "test_run_opts err"))
> > +             return;
> > +     if (!ASSERT_OK(topts.retval, "test_run_opts retval"))
> > +             return;
> > +
> > +     /* The test buffers exist, so a restarted iteration would find on=
e */
> > +     ASSERT_EQ(skel->data->next_after_drain, 0, "next_after_drain");
> > +}
> > +
> >  void test_dmabuf_iter(void)
> >  {
> >       struct dmabuf_iter *skel =3D NULL;
> > @@ -315,6 +332,8 @@ void test_dmabuf_iter(void)
> >       }
> >       if (test__start_subtest("open_coded"))
> >               subtest_dmabuf_iter_check_open_coded(skel, map_fd);
> > +     if (test__start_subtest("next_after_drain"))
> > +             subtest_dmabuf_iter_check_next_after_drain(skel);
> >
> >  destroy:
> >       destroy_test_buffers();
> > diff --git a/tools/testing/selftests/bpf/progs/dmabuf_iter.c b/tools/te=
sting/selftests/bpf/progs/dmabuf_iter.c
> > index 9cbb7442646e..d5421b75c39c 100644
> > --- a/tools/testing/selftests/bpf/progs/dmabuf_iter.c
> > +++ b/tools/testing/selftests/bpf/progs/dmabuf_iter.c
> > @@ -99,3 +99,22 @@ int iter_dmabuf_for_each(const void *ctx)
> >
> >       return 0;
> >  }
> > +
> > +/* Result of a bpf_iter_dmabuf_next() call after the iterator was drai=
ned */
> > +__u64 next_after_drain =3D -1;
> > +
> > +SEC("syscall")
> > +int iter_dmabuf_next_after_drain(const void *ctx)
> > +{
> > +     struct bpf_iter_dmabuf it;
> > +
> > +     bpf_iter_dmabuf_new(&it);
> > +     while (bpf_iter_dmabuf_next(&it))
> > +             ;
> > +
> > +     /* Store the raw value; the verifier would remove a branch on it =
*/
> > +     next_after_drain =3D (__u64)bpf_iter_dmabuf_next(&it);
> > +     bpf_iter_dmabuf_destroy(&it);
> > +
> > +     return 0;
> > +}
>
