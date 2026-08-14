Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3899345EA8
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 19:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786736074; cv=pass; b=MuccSmVS2IF92I1IA/o+FLKtL83a1d+CvvSke/gqtv1UWCehsPp91RRImA5tag0gjV/KFHPKoJH3O047gcnUiTKAEBLrFVPdDELu95j9nONci2z4Ihhd19Q2SxPZSzFU+Gzo9RxpXhFhCqRQ/w5KW0pTW/NyMBE0MQfR1fzRKrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786736074; c=relaxed/simple;
	bh=BijgrGWiD0sRMYcSax7e27hFwMfEy2yLRhbRUbhOeMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OaIT7TfO2yt99fFA4E1zYTpZukBUF8I98oFHKu5hjxs+m8PYCLycMHn3Mck6HSVZRosgtgfk3N6nps+Stc/FINY89F+Bedy7rEQvfUxept4pBJ6G3wYwJYeTb3La+Rb1hLJXPc32OQzqL2Q57Ut8VUvlUkj+E7ArXllP2Dcqz8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTcVqUa/; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTcVqUa/"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-848643382fcso1390788b3a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 12:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786736072; cv=none;
        d=google.com; s=arc-20260327;
        b=fXVWwbThav37omMvIa/b52GgwmUIuuN+fUraSrlzR+bFtUBKrXpjEBk5jd4v4wMaN1
         0YB3eePigTotxqpwJV0cg9jXHZtjRpXdrTSBT8V8g1RM5GWpIemuiS8GQY8ud6qmbSlv
         1xMewFE5ntywuDeIRlNHD+0iWe3+C2QDZIvtZo2Ct7H6pjfBYlqdEbV7C+G0ZrpKqYPj
         zRuFFfHbJ1fbBcT9cPIEyGp/tj5SGx7JonMa2/ebI5fEK7lx6vEA0DF3OrhBTXy4bl2Y
         spJCNn/IwUtCFe8CPQCHa1EMZDO+Iz9t/f+EJ8l04ziR2JZPrIhZsRwUCPT+XJMzJX+B
         NE2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y3Wg7BlO4Qo+99Bkr2kgupRM9RDswUzNhJatcCXw2Rk=;
        fh=XHuxLRxCKAyAUWKxWdVN/Hn0c8Hk8dpQTHseYj3Rc1Y=;
        b=HwenvxW2I0boL4P8eg3y+pfTkc1d1xddHca3hWf4ZDZJt1W5ZQW9Kq+AskA06A2Tp+
         veL0E0vLLTfKwXT9PMEzGrKbot0XSz0Xm0nnsplXz6YIezZkQdbYGw92i8YkQ1Jfz+5d
         75QNQnuu0manB6ZikB77j0GDaPKgSfcyRGfxGOqfeEIFg+//4+iy88QltoAKeGk7SJzs
         sk6sbA5G4s99Y1Fe5VjNJZh7za2e+jp5gNCdyDEh7V/cKRSCVOyfNgG4t0IMDJ6lF2+3
         riuhW+kqPhPMODGbdykn1ugYLNK1SaGfOiaj2wxsGLBVQ2/0L9ZtRL3s3CRGz6VKSBa1
         87qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786736072; x=1787340872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y3Wg7BlO4Qo+99Bkr2kgupRM9RDswUzNhJatcCXw2Rk=;
        b=PTcVqUa/wKQmshqC8/fRAQletZ+LKqWvR4MQMwILDg5NqbDYKQcLmamhcuzcJ9lsR5
         esifYIrlZGB44Y/cU13TmqYjRBl4PLDxUTEqWB8H5T7ZisYl1/7xh+NRUtqeE8E9anwM
         lpkPnr8++VxuyeHOkm3tAkLkS6s3667EiowTk18nEDgFwKCfZmShLdjrJpEaBoTBnUfC
         t1SpbWAPpxAVe+0m5CT0FvZRn+TFqCPYq96EsHqjwXG0VmqgRdGd7n0gfWEm6V+Ohqim
         b3sKUrJuxZgSkqZpKn+DrIagY9GMkm4tbjJ1RY+3cj3qWced3YIH9ZCAIV0pi4sBgAcT
         qRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786736072; x=1787340872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3Wg7BlO4Qo+99Bkr2kgupRM9RDswUzNhJatcCXw2Rk=;
        b=aTjNGdjISRS5CBzgYzkpCPlZjyHNK1cEKabIM6HfYQY1hGnplAiN9SCanUGo9ErFIe
         rJ8VoY2rBlvxTyONRnkE9vOWSNVIhy7eAv8lw/PJ0tIs/sjvSGK45A06Jw8+pQkhoEWb
         IYOTmqnJwQzb/Niq2/5o94y2VNORIplsIEMiJ0WkzjSxZ0USFw10niMX4P/G8vqUDFbp
         UOp54JtsWceqXlDnugeipwLhNWWBNAIKVo8zyjGi+Zb9G77+fWRTg+C1IqI+w1opP4un
         GGin91M5qvNj1dxrF/Ur8nhuvNcPnm45ei6BgTE4ucU3LokzJij9raGzCy8qvEaHaE5v
         +VIA==
X-Forwarded-Encrypted: i=1; AHgh+RqimfL5/icluhGW31X64GM+SLK76Kdc0WNRTRonwjvqpJaBXp1R6Dmb7FsVNIE487///C66QZ9QWTe1YXq/lyc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0bw8MPuSHcy1n1Obs29O5a5OEYOz7scNfyIXq8oDzIw/cU31s
	IZcBocQaWMm1NX+pUOzRBLimUolisUOPxqpv6nf3ruEzd2f+OCfUgebHbYTs5FPbS4njqB9AIqq
	YReRaheiEP/C5eF6gZOaZ+hsbfEeNKlI=
X-Gm-Gg: AR+sD11UIEn/f7lF6Aooj1xmK/YLtdAt7cpqWI4xjZ/PoGF+l12pn2HSHih7zUub3Qh
	9FoXw+VHsCyAi5IfpXFpkA5A+sh9f5yPiQdpmSG/KrjkWZSpbFihdu35ADir07FeD3+Y3pjBLjO
	w3U0J/2Mv5RJOjbpdmqRMZdV/E1D/8IjQF6ZAnHfCFk+NTNHdHRZiRv7yOosc/9qParXQx7oGbO
	SNa32o7UZ+k+vyEAEw+/utdL2lepG5KGZvLr1i+8pup3lqvb62K3fzrPK1rxA02xwO0WRSHZG9W
	MXoEE66uS9EZC7qWMaVVL5DFZRdo+XF68dW8z+x7oOYjLY0T3I9rngGCFvKp1KoanQE+FdwiZdn
	kY1Pb19dt0zAoSX7eVJRYybkP1+1iuh5FID23Bg==
X-Received: by 2002:a05:6a00:2394:b0:848:63c9:ee39 with SMTP id
 d2e1a72fcca58-84fde156853mr8605898b3a.12.1786736071843; Fri, 14 Aug 2026
 12:34:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813152324.97937-11-leon.hwang@linux.dev> <bd01566fa68ef3b993bdd4cfbd9802a24cd9b5052b5a746712067d8571ea0bd0@mail.kernel.org>
 <4c455c0f-9138-4183-8fb9-fe979d56ae3a@linux.dev>
In-Reply-To: <4c455c0f-9138-4183-8fb9-fe979d56ae3a@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 14 Aug 2026 12:34:18 -0700
X-Gm-Features: AUfX_myrT8YZ9muA99YdftkP-AO_rXmd-yDihK3ElrtWjk04_Mk_Tk0PPrSKF-Y
Message-ID: <CAEf4BzZWV7EQJpmS2dddkgVeDqXLun8UuGbNNzrQ6SVMEMTRtw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v12 10/10] selftests/bpf: Verify bpf_iter for
 global percpu data
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bot+bpf-ci@kernel.org, bpf@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, john.fastabend@gmail.com, qmo@kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-patches-bot@fb.com, emil@etsalapatis.com, martin.lau@kernel.org, 
	clm@meta.com, ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 11:13=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> =
wrote:
>
> On 14/8/26 00:26, bot+bpf-ci@kernel.org wrote:
> >> diff --git a/tools/testing/selftests/bpf/prog_tests/global_data_init.c=
 b/tools/testing/selftests/bpf/prog_tests/global_data_init.c
> >> index d308ca3b30457..7d6bda9092954 100644
> >> --- a/tools/testing/selftests/bpf/prog_tests/global_data_init.c
> >> +++ b/tools/testing/selftests/bpf/prog_tests/global_data_init.c
> >> @@ -327,6 +327,56 @@ static void test_global_percpu_data_verifier_log(=
void)
> >>      RUN_TESTS(test_global_percpu_data);
> >>  }
> >>
> >> +static void test_global_percpu_data_iter(void)
> >> +{
> >> +    DECLARE_LIBBPF_OPTS(bpf_iter_attach_opts, opts);
> >> +    struct test_global_percpu_data *skel;
> >> +    union bpf_iter_link_info linfo =3D {};
> >> +    struct bpf_link *link =3D NULL;
> >> +    int fd, num_cpus, len, err;
> >> +    char buf[16];
> >> +
> >> +    num_cpus =3D libbpf_num_possible_cpus();
> >> +    if (!ASSERT_GT(num_cpus, 0, "libbpf_num_possible_cpus"))
> >> +            return;
> >> +
> >> +    skel =3D test_global_percpu_data__open();
> >> +    if (!ASSERT_OK_PTR(skel, "test_global_percpu_data__open"))
> >> +            return;
> >> +
> >> +    skel->rodata->num_cpus =3D num_cpus;
> >> +    skel->rodata->offsetof_num =3D offsetof(struct test_global_percpu=
_data__percpu, struct_data);
> >> +    skel->rodata->offsetof_num +=3D sizeof(skel->percpu->struct_data)=
 - sizeof(int);
> >
> > This isn't a bug, but could these two lines collapse into a single
> > offsetof(struct test_global_percpu_data__percpu, struct_data.nums[6]),
> > so the offset names the field being read instead of depending on nums[6=
]
> > staying last in the struct?
>
> Sure. Will update.
>
> >
> >> +    skel->rodata->elem_sz =3D roundup(sizeof(struct test_global_percp=
u_data__percpu), 8);
> >> +    skel->percpu->struct_data.nums[6] =3D 0xc0de;
> >> +
> >> +    err =3D test_global_percpu_data__load(skel);
> >> +    if (!ASSERT_OK(err, "test_global_percpu_data__load"))
> >> +            goto out;
> >> +
> >> +    linfo.map.map_fd =3D bpf_map__fd(skel->maps.percpu);
> >> +    opts.link_info =3D &linfo;
> >> +    opts.link_info_len =3D sizeof(linfo);
> >> +    link =3D bpf_program__attach_iter(skel->progs.dump_percpu_data, &=
opts);
> >> +    if (!ASSERT_OK_PTR(link, "bpf_program__attach_iter"))
> >> +            goto out;
> >> +
> >> +    fd =3D bpf_iter_create(bpf_link__fd(link));
> >> +    if (!ASSERT_GE(fd, 0, "bpf_iter_create"))
> >> +            goto out;
> >> +
> >> +    while ((len =3D read(fd, buf, sizeof(buf))) > 0)
> >> +            do { } while (0);
> >
> > This isn't a bug, but would a bare semicolon (as in bpf_iter.c's
> > read-drain loops) be clearer here than do { } while (0)?
>
> Prefer 'do { } while (0);' instead of a dangling ';'.

humans used to have {} or { /* no-op */ } for cases like this, not a
dangling semicolon

do {} while (0) is for macros only

>
> >
> > [ ... ]
> >
> >> diff --git a/tools/testing/selftests/bpf/progs/test_global_percpu_data=
.c b/tools/testing/selftests/bpf/progs/test_global_percpu_data.c
> >> index d086e9417f9fb..71ff8d1bf49eb 100644
> >> --- a/tools/testing/selftests/bpf/progs/test_global_percpu_data.c
> >> +++ b/tools/testing/selftests/bpf/progs/test_global_percpu_data.c
> >> @@ -61,4 +61,29 @@ int verifier_snprintf(void *ctx)
> >>      return 0;
> >>  }
> >>
> >> +volatile const __u32 num_cpus =3D 0;
> >> +volatile const int offsetof_num;
> >
> > This isn't a bug, but would a name like nums6_off (set directly from
> > offsetof(struct test_global_percpu_data__percpu, struct_data.nums[6]))
> > make it clearer which field the iterator is summing?
>
> 'num_off' would be better.
>
> In iter, it should not know the concrete number. Instead, it identifies
> the number by offset 'num_off'.
>
> Thanks,
> Leon
>
> >
> > [ ... ]
> >
> >
> > ---
> > AI reviewed your patch. Please fix the bug or email reply why it's not =
a bug.
> > See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/REA=
DME.md
> >
> > CI run summary: https://github.com/kernel-patches/bpf/actions/runs/3171=
6447858
>
