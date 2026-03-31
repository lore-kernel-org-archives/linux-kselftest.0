Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2C51990C7
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 01:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774921680; cv=pass; b=fqpYv0SbFJXgdmBgNgTirhsA8LI/xTlPJhObjmtnkwvzgfUvCCXBORNmWvzZS165omqDTTKeZm0jauJCEAOzHlW8rJdAqU1dKZAcW94Ymo4aV1NRaIeZLzPLM1H8Wt9SnB4izdQdxBbs7ygzIpZUZX/QQsr/lpkJIwMsbs3a1sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774921680; c=relaxed/simple;
	bh=uOwufVDMxYCsZYUk9KcPLNbgRBhNOcycbb+P2ZuFK40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZNztKcUZr6zAYQMVX7T+aIc6SDCWeQfWfRZ8JCNriQYiEU2l5f+5QYBd4Um5AULwHgoiUiabpfgRaldPADRHRrSu9lUxNT3sn/OYKlzlwbtgJHYeJuoV05a5PpcMCv6P+ud+RkyeHaY3QF9kNTU63us1e48HFbuIBSmSJCBayS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=a4bQtYA/; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="a4bQtYA/"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a133b686f7so5973401e87.0
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 18:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774921676; cv=none;
        d=google.com; s=arc-20240605;
        b=Hckabozfo/AN1S4ZUDHwGlSMZ9ZFo+KGCpdh88yw3K4Nb/4zuh1eWJ3GMFv+OvA+UF
         bDCvHia6yRF1pqcZxjC82VW/eVsM8+N7kcyDGoX0IADwEUP/T14i3XetXLQt0MmiqRGj
         Z7OARGOIbijxjm4yrRAZpBGQNc6ik2K5hErBq2VFlnhJk+DtF7LqeH0gRmf6dTO9DZq0
         clwvtQgzNh1LgjaD6F53EFthCJ6BrtdGq0Ir1GLJFgm8LECA8XZnxviYZFvdKpKXsJMl
         BoOBaK2l04Q4V7PHVToix/Qp9rz91ePk84Y2mx7omoQlCWkTmGKEatEESTxht9GNMy0u
         tM9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=21ttnbUgN39YeO+81bfZoJgf8ewTVFP1OWSVQFAPReE=;
        fh=lLO4w/9zth6arEDTPZ6fjWzklccqSmp2gf5I8FiszSI=;
        b=MS7JamWTLFkyZ/cmEHO+hka6P9I/5LN8prvkgokK6znys4vqQFqXpIEo5uchRx4cen
         YjM/2PG4VzmbRMAZvGEyvrzEKF7RiU/YG7BMTL1izyiUWWgUm+sLqVtU4E2jZBvlIG1i
         UJOf5bKmHMraq27vkkPuBP96UZc8VshUcZsjAeGBmTQGU3OTcMN8Bq2Vz5Ic1FFrVFvd
         i7NIiP7NBGP840N/V4nO9Go7Gb2SZ0yFqJmkkqnvqNFUA0fl8NJPyHc78ET6vlLtIRlI
         S3py2d9EPz6APO/mYmVYiINdGeQJekafEFov9aF+u4pfjylmRJ6r+wGkT8q2LjOhphgp
         HK6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774921676; x=1775526476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21ttnbUgN39YeO+81bfZoJgf8ewTVFP1OWSVQFAPReE=;
        b=a4bQtYA/XsOYuxaYoj6CLEmGO5LycdosIJV24HlqhJVsaWMdxL+ls2mXFl2ob+QtaH
         gpcLWzC5Ed2fsrufoXbJIigz4W38EB2SxVzH0j4VmPtJ0NGwmQEeLEQ3H8JUmUG/2FUu
         XixHyeLVajISsGIKMsDNpEN2j90l+XYIdJmR6jLxE0o4aRZM39oie5UZ+2MDeruANwCx
         eyR3XLkseQX2IUWWccaCBfTyQKQBBbUD+58Z6G+cp2NH6wVVRhW7FNAdi8Iz2JUu7dpk
         DxRErX91lbK48BQL663dThxOCQdGA8lwJjasXuFBKDoLbcYXt1leAR/Vn8xcnTgoqbwq
         hR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774921676; x=1775526476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=21ttnbUgN39YeO+81bfZoJgf8ewTVFP1OWSVQFAPReE=;
        b=op7TYrKdSxMjY74FVMc0IJ5CWxGM6AKfpmCCVhHX1q9F0TdDGFI+eyk1kyvzj3Ctfd
         55YFyYVBGLEho3cS7JPr0T3QFN/SXU90i6WqxsynQI+Bb5AON+6zP9Ratnso8TyscuhQ
         ex8XY/9WMc1oUfYHrjydXDxjomN8Kh4luRBew5TX3P7ET+ehkSVVBydVlE39TNvKfj4o
         iuMoOKGAckfV7xnd0egqD0PArMdmC2YrA5R2fXe6h4tmFPkpH0p/XV/FLpI2BKJViLdz
         RWw2/IcBUPWoFUp7i1NkgL1W9SQaI0B87vWmGowWvANEoaPV0bzScSlc4QwUaBGuRhG1
         mKlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2FCa2hXu6T6rBmrwM2gGlOzsybPT0kvN2OK91CecupJ7QoEnpSOU1sFSMCgpiFwetmDA9x+Rl27w4vyNxcZk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl6jwffgi24WsFNou3mb/OVMyrG4O5ZK3yZwNgGRHCPHw1A6yK
	Xbw3MeKXRq3PkdC3Bn2gZC5OHP88CzBA7P5PbpHTNG7HaIMPGMaPEKfUMzuUFrcz3g4p209iuRU
	5vTzPwf0ig2TrA7dnnrPX6x7XG8gzp6pm/93TBls6aA==
X-Gm-Gg: ATEYQzwLO65lbVILdKW7f9xotqNgwZqQV3nz5A5PKZzymqChpVW80sIXo2VpIWYKaUR
	zzWx1mYLF2MbbOFQCQ6AZmiLmrh3e7iWOEzQJ3gKjYN9BKzHh8qF92UrBU4ABsarhwjr8HfLw1s
	taTMKTimmWroOdAosQbjrZjD2sh/H9TEaMWZ4AJjcw65LuGKbByQuPJas0DPWAx/qtcLPlVAmQK
	G+JNXsSseolyau0pyikTvsuGpuurU5Nuw1qgeptKXEiL5W3sWPCqDtYrK0BckgpWQ5yhuFheFyr
	ciWJOvBLW3gVNZxTB8CZk8qCcf/3pqYZ2EINh8xmOg==
X-Received: by 2002:a05:6512:1108:b0:5a1:1e44:8682 with SMTP id
 2adb3069b0e04-5a2ab9294a9mr4352365e87.34.1774921676487; Mon, 30 Mar 2026
 18:47:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329124429.689912-1-hoyeon.lee@suse.com> <20260329124429.689912-2-hoyeon.lee@suse.com>
 <acpLiCDwAtn8xLjs@krava>
In-Reply-To: <acpLiCDwAtn8xLjs@krava>
From: Hoyeon Lee <hoyeon.lee@suse.com>
Date: Tue, 31 Mar 2026 10:47:40 +0900
X-Gm-Features: AQROBzAeGQUXighGkOirYDW9eQNKDx11DdyYoeCc-y1CtUFPhi-4ktpsLwrcXa8
Message-ID: <CAK7-dKabFLTs1tTeynHMnp8MzM_cg6QMH6Lg6oj_7e9_bhNsRA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] libbpf: allow address-based single kprobe attach
To: Jiri Olsa <olsajiri@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Feng Yang <yangfeng@kylinos.cn>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 7:08=E2=80=AFPM Jiri Olsa <olsajiri@gmail.com> wrot=
e:
>
> On Sun, Mar 29, 2026 at 09:43:38PM +0900, Hoyeon Lee wrote:
> > bpf_program__attach_kprobe_opts() currently attaches a single kprobe on=
ly
> > by func_name, with an optional offset. This covers only the symbol-
> > based form, not the raw-address form that the kernel already supports
> > for both kprobe PMU events and legacy tracefs/debugfs kprobes. Callers
> > that already have a target IP still have to drop down to
> > perf_event_open() or direct tracefs writes.
> >
> > libbpf already exposes address-based attach for kprobe_multi through
> > bpf_kprobe_multi_opts.addrs. This commit adds bpf_kprobe_opts.addr so
> > that single kprobes can be attached either by func_name + offset or by
> > raw address.
>
> curious, is this change just for the api to be complete or you do have
> a usecase where you can't use kprobe_multi and need to attach kprobe
> by address?
>

The main motivation was to fill the single-kprobe API gap, not to
replace kprobe_multi. There is also a case where kprobe_multi is not a
drop-in replacement. bpf_task_fd_query() operates on perf event fds and
does not support generic link fds, while kprobe_multi returns a link fd.
That link fd can be queried through bpf_link_get_info_by_fd(), but it
still cannot be used as a drop-in replacement here.

For PMU-based non-legacy attach, Andrii is right that func_name =3D NULL
with opts.offset =3D <raw-address> already works today. However, this does
not work for legacy tracefs/debugfs kprobes, because the tracefs event
string formatting still expects symbol-based input.

So I think the better direction for v3 is to avoid adding a new field to
bpf_kprobe_opts(), document that offset is treated as an absolute
address when func_name =3D NULL, and make the legacy path support the
same raw-address form as well.

> SNIP
>
> >  static void gen_probe_legacy_event_name(char *buf, size_t buf_sz,
> > -                                     const char *name, size_t offset)
> > +                                     const char *name,
> > +                                     uint64_t offset_or_addr)
> >  {
> >       static int index =3D 0;
> >       int i;
> >
> > -     snprintf(buf, buf_sz, "libbpf_%u_%d_%s_0x%zx", getpid(),
> > -              __sync_fetch_and_add(&index, 1), name, offset);
> > +     snprintf(buf, buf_sz, "libbpf_%u_%d_%s_0x%" PRIx64, getpid(),
> > +              __sync_fetch_and_add(&index, 1), name ?: "addr",
> > +              offset_or_addr);
> >
> >       /* sanitize name in the probe name */
> >       for (i =3D 0; buf[i]; i++) {
> > @@ -11648,13 +11651,28 @@ static void gen_probe_legacy_event_name(char =
*buf, size_t buf_sz,
> >       }
> >  }
> >
> > +static void gen_kprobe_target(char *buf, size_t buf_sz, const char *na=
me,
> > +                           uint64_t offset_or_addr)
> > +{
> > +     if (name)
> > +             snprintf(buf, buf_sz, "%s+0x%" PRIx64, name, offset_or_ad=
dr);
> > +     else
> > +             snprintf(buf, buf_sz, "0x%" PRIx64, offset_or_addr);
> > +}
> > +
> >  static int add_kprobe_event_legacy(const char *probe_name, bool retpro=
be,
> > -                                const char *kfunc_name, size_t offset)
> > +                                const char *kfunc_name,
> > +                                uint64_t offset_or_addr)
> >  {
> > -     return append_to_file(tracefs_kprobe_events(), "%c:%s/%s %s+0x%zx=
",
> > +     char probe_target[128];
> > +
> > +     gen_kprobe_target(probe_target, sizeof(probe_target), kfunc_name,
> > +                       offset_or_addr);
> > +
>
> it seems like it'd be easier to get probe_target (via gen_kprobe_target)
> in bpf_program__attach_kprobe_opts and pass it down instead of generating
> it over and over again
>

Good point. I'll simplify this in v3 and build probe_target once in
bpf_program__attach_kprobe_opts(), then pass it down.

> > +     return append_to_file(tracefs_kprobe_events(), "%c:%s/%s %s",
> >                             retprobe ? 'r' : 'p',
> >                             retprobe ? "kretprobes" : "kprobes",
> > -                           probe_name, kfunc_name, offset);
> > +                           probe_name, probe_target);
> >  }
> >
> >  static int remove_kprobe_event_legacy(const char *probe_name, bool ret=
probe)
> > @@ -11674,25 +11692,29 @@ static int determine_kprobe_perf_type_legacy(=
const char *probe_name, bool retpro
> >  }
> >
> >  static int perf_event_kprobe_open_legacy(const char *probe_name, bool =
retprobe,
> > -                                      const char *kfunc_name, size_t o=
ffset, int pid)
> > +                                      const char *kfunc_name,
> > +                                      uint64_t offset_or_addr, int pid=
)
> >  {
> >       const size_t attr_sz =3D sizeof(struct perf_event_attr);
> >       struct perf_event_attr attr;
> >       int type, pfd, err;
> > +     char probe_target[128];
>
> we need bigger buffer as explained by sashiko [1]
>

Thanks for the pointer! I'll switch this to a larger buffer in v3.


> [1] https://sashiko.dev/#/patchset/20260329124429.689912-1-hoyeon.lee%40s=
use.com
>
> jirka
>
> SNIP
