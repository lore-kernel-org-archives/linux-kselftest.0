Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2113B6377
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 18:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338573; cv=pass; b=o/jw8gbjYAIF5PqgFYntdh2tJ4sRNMlGjE5oXLBbXgARKUbWrrEpn6p2CMwZztChP6hXa47qar/Czik8UN379KZqxZwLO1pYJwX8lWOEkRjS2qnsnuoHWTUQx/bJtAzLgmW98ceetQtB2uTryr6mmrOS+/KaO1JXgYHjduaJgds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338573; c=relaxed/simple;
	bh=mzJidH9Z4jxuuUj+CXMYu3n+LJDaJltgHopocBX/YA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pa/jRwC5jd2Hfi8Vvf9Dfl2fhtPFnk0VS/PjII6X7Tml51/HasFMq6fhBkO9jUeI62gFDDw6xDr36SKWHjSMhyOc3TRi8dtfRmnRQJOD0OflGAlIHykwE539I2dPYnJ25NdIIYwzIinti3Sz9S5O3ro/nmdGBjnGYzqmwqReH1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8J4qWsL; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8J4qWsL"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbee3777e1cso823066a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 11:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787338571; cv=none;
        d=google.com; s=arc-20260327;
        b=J9GtU76tjSsaBVz2zvWh1PfL7vQfF9ZhlKQt7/z3oD5q9A/L7t2TjqI8PSnDcguEoP
         fdkJwcxrOUl28kB+e/qqQqpzZl32ttyWlH0yo93wPM9TL8HxKhtMmRbNKhp8CuT7lN//
         f4IqRF70EDuA56BVZUnwa1FZykuP16sm1DwSAsv5WiNUYQdeK6l3kItgwfTOZhDkKDju
         VaUKmdhL8tARYniDmZw6Ey6u9ouJUG+UUHIpJ72q9/9m0KlgJtudVvu1rVNvxYbgXQ30
         UuUzaGudLy2k566c9VRI9viB8pa4sqDfpbj4H34iSNaH8NBnmW67PubFRkAmsbBNS5G2
         9upA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QZChrTs2TY5qhvo4NTZDeb5uyLGhsO4JVZFUF4N2cyk=;
        fh=gHnK382+ea95zO2OQBnlqoJvqt/matT4TNSEThgu0rw=;
        b=SRTfoap2DpTdb06zW1tku+D+bY/NQVWOsMaZM6iyDU5oShAdrNJj+8IpsZFo54+H/2
         n0sqgyXdiFsfwVruyv6UWfN/gZShJK0spCvMgJQOFm2rGKYCJkEOS30GVLMWdVOQTBnJ
         MSJNeqsKMIpbJ2Kt/ibuDDe5POWVpcX5IbBwoUt66J1zfSwMRvEKAPFmrdi0w2bKPKT4
         IcEiHO4GOuzfm8N5tnowAjPglA1M9AF4IFGMsu/OcFwii6AL/QyU33ttXPoM60iaA0Hv
         vv+yRIjvBcbaqQ4KK8VN72+Fgq0J50eqFHOME1YnTWRSrPiA8lH5LMGloPZLTgaxRVh6
         Y1Ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787338571; x=1787943371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QZChrTs2TY5qhvo4NTZDeb5uyLGhsO4JVZFUF4N2cyk=;
        b=d8J4qWsLHTXSdLbhWL3d32BUIPeyhnXVfFTHZJfGxs3UA34xifzMCSIrWQlpAls3Rq
         MKObi+7Pg45DVRKk2xOEy7G+aJkY+7suzvAZ/SNuwjpTBH73jsiqVq91bhoqC3DfpbIx
         RA5VUOhhVZ42GEwndtItd2IlxBkLsqTaoXzx19IQ4i/nbbOxIqG11IoAqeX5ZOPOXGU7
         c2pJweQ/9BIpdPTznhiQwiprVw/w0BE6v3BBIu7HZYaOe6oA9crByHyjGCgogdb3eLmU
         oPiPy7muzb91ypMijp0lp4Pbi4mdtYhYgGrE8yhgumByNrSXxjvmpRp+LjeNDpDwWmtg
         QUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787338571; x=1787943371;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZChrTs2TY5qhvo4NTZDeb5uyLGhsO4JVZFUF4N2cyk=;
        b=XyMN8247/ny/jNckxOVQOlJRSJoyxIqeBSKsVxMpvK7LiFIIU1VfKSm1qiywV74QLS
         WLizoLk+YfJC2JaAD2qmUS5O5h/KhqZTOvUFuUA2OW4vI1ShFzgy0BpP9E4kRnJzbPGK
         7NSiF8uLTLlwoaBYHxJcxLfWvvk5bMhTa60YEqUmTkc3L9PGzrcxG7KDD3nh7eS+f4jl
         PuZTG9iRhfYcVJD4fVmMeYdhl898Hee9RaI7Ba+zRBlfz+oImYVX8VBtESs3gjycHIIn
         WLuAMrUv5b4QhuxS3t1jkrrpjeKxohztyjdz4ugYI6XMmbXFNJyDPOVs5rTg8jtNyH1y
         3uxg==
X-Forwarded-Encrypted: i=1; AHgh+RrXFt1r+mj1brafqEaS8E8Rhk1MrjjCeYTBOElEtV3dKBpqYeMb1r3liKZUaRejpmwvou7BomVMRm4rreS+ZD8=@vger.kernel.org
X-Gm-Message-State: AFuF++lcuJJdfmUQK7/CVPnM2yYA5Xy5xpQMlkIx4omOJEvx7mOmyatu
	8UP9yHHAZeZb459ublWp3cfKfIJx58L57SMc1NqDWHfwbzpAe8hNJjS/0UtsHIYrC6onkPZNsXP
	8pur3OmMNU6Gz/WPt8A4rhDPEz3POYMc=
X-Gm-Gg: AR+sD10u5sZnL2zTK+Db84iv9YhWBQ+V95zALCh81ryCxaSAc24rL4EYhYW/O5T1Dzi
	fvnmEAqLEWlLbET7nNG/Nh2gdBC2TpC2Goy601LXSKse7T6G6VcxLK9qlTjjXOMae5a/7PLAOSk
	c0qJz/OzLj9TKhZuX8WP+KxIJ8SyIbJ5rK0pJy0cor17gZAglBde+Vlwi6JKgcROzefD/nAU5Dm
	rKl9+Nj+goD4gCvC+8Zne5avlPGHYZ9NeQ+59N2ANa0cpWqK3vrH1gd2f/vltMZg5WpMpi0K0W1
	kHThNBeO+K7Ro3eoTHlFtSDG7NpdibsxOo8VlSgS6m1ZBEcDbx9k+ZUmgzrJQ83IIABbWsdHy5+
	qhZV+ybH1LPx77gYw178hR4zW2dnymSKHyGNu
X-Received: by 2002:a05:6a21:1186:b0:3c0:eeb7:28b with SMTP id
 adf61e73a8af0-3cd2fea65b6mr16579968637.8.1787338571125; Fri, 21 Aug 2026
 11:56:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819090426.267-1-zhaofuyu@vivo.com> <20260819090426.267-3-zhaofuyu@vivo.com>
 <67d62b1943b093ac1eb16c9cc1ff38e0d5eda72b.camel@gmail.com> <d94fdb54-09b6-4d70-bfac-8483024e94ea@vivo.com>
In-Reply-To: <d94fdb54-09b6-4d70-bfac-8483024e94ea@vivo.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 21 Aug 2026 11:55:58 -0700
X-Gm-Features: AcwNN1UhAoOZSahXNfZhvGknDPaAHZ_CPsgNHBo8TzCukx_sWSywc7QatN5Q-uY
Message-ID: <CAEf4BzYkFPK37zaW10RBX04un5xuWs42gJ2pAtE0_iy2+X=58g@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next v3 2/2] selftests/bpf: add tests for
 selective kmod BTF loading
To: Fuyu Zhao <zhaofuyu@vivo.com>
Cc: Eduard Zingerman <eddyz87@gmail.com>, bpf@vger.kernel.org, alan.maguire@oracle.com, 
	andrii@kernel.org, ast@kernel.org, daniel@iogearbox.net, memxor@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	shuah@kernel.org, yatsenko@meta.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 8:51=E2=80=AFPM Fuyu Zhao <zhaofuyu@vivo.com> wrote=
:
>
>
>
> On 8/21/2026 8:10 AM, Eduard Zingerman wrote:
> > On Wed, 2026-08-19 at 17:04 +0800, Fuyu Zhao wrote:
> >
> > ...
> >
> >> +++ b/tools/testing/selftests/bpf/prog_tests/kmod_btfs.c
> >> @@ -0,0 +1,196 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +#include <test_progs.h>
> >> +#include "kmod_btfs.skel.h"
> >> +
> >> +static bool btf_skipped;
> >> +static bool dup_ignored;
> >> +
> >> +static const char btf_skip_fmt[] =3D
> >> +    "libbpf: skipping module BTF '%s', not in kmod_btf_names\n";
> >> +static const char dup_ignore_fmt[] =3D
> >> +    "libbpf: duplicate kmod BTF name '%s' ignored\n";
> >> +
> >> +static int libbpf_print_cb(enum libbpf_print_level level, const char =
*fmt,
> >> +                       va_list args)
> >> +{
> >> +    if (!strcmp(fmt, btf_skip_fmt)) {
> >> +            if (!strcmp(va_arg(args, char *), "bpf_test_no_cfi"))
> >> +                    btf_skipped =3D true;
> >> +    } else if (!strcmp(fmt, dup_ignore_fmt)) {
> >> +            if (!strcmp(va_arg(args, char *), "bpf_testmod"))
> >> +                    dup_ignored =3D true;
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >
> > Idk what Andrii would say about this, but I'd rather add an internal
> > function akin to:
> >
> >   size_t bpf_object_btf_module_cnt(const struct bpf_object *obj);
> >
> > in libbpf.c and expose it via libbpf_internal.h (*not* via API),
> > instead of intercepting log messages.
> >
> > ...
>
> I think your suggestion is better. It also addresses the issue raised by
> the bot about potentially hiding other libbpf logs. I'll wait for Andrii'=
s
> feedback on this.
>

I would do neither and just not validate explicitly that we skipped
(or not) some module. Instead, I'd see if it's simple and maintainable
to do a functional test: try to attach to a func or have relocation
fail against a type of a test module you explicitly do not allow to
load. If that succeeds, bad. Also have positive and negative tests to
show this custom kernel module list makes a difference as promised.

And try to keep the boilerplate to a minimum with all this, don't go overbo=
ard.

> Thanks,
> Fuyu
>
