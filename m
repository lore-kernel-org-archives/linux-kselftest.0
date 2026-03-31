Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1096D2DB794
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 23:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774998397; cv=pass; b=kOC/iXjTL83quwphnM8sMm1dIUvIpY2blMd20Fdrfnh1T4Dcu0eMgN0NvOqtz2LJ9DYeZZ5HEWNr+N0wcAV/MGTbY5bGMdHOwLE3ElKBYFK04UrCA7vXTIrPfWXTK9wDxi+42RjrU0+sRFn7oQZujtHYrPWpJrm5swgq6CM5hTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774998397; c=relaxed/simple;
	bh=Ovm2d23tcLoijUc2I03Z4EbUwa7mw/0GhnKY4/laYtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrkxnvJ0aHb2UmRDKZgbXfJEyHuSAAyhfD9zfo5mF7rmQAL4Yvr8vjXIjZjPE1iXPcF4B0mVY8wbjRu6CgVV+qrzcfs9vvMWHoSw/8RnuqTNCHO7v5DHHeRnnp9imopJGd7FLYtGsNhmrWAXmn9bw+syqlIN0sD/37NRso9I1SU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdEjDxHX; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdEjDxHX"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c742d4df00cso166236a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 16:06:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774998395; cv=none;
        d=google.com; s=arc-20240605;
        b=GD80e+8NIg/Mk2qqIk4fXYmpTwzWE1Inrm6AFAU0HGlFp9NOlCAkfs03xE5GfrbWPm
         ZMVTw2qE4IvvaTSGomioVyuP0g3UCkM9bR2T07c28EXoBqsaXLWn/zGd/jSy8xK2YSYF
         jKH5m10tpNGqNDMWE1B74M3Okz2IXiO1s+/96kHaW098vd1weHV1S5wQhT1OcxjS+JFR
         e4dHqMwKu4bPB7OacvmFxaLkKCv6OTPT2GIFk9WsfEvC7cWY8ibuEHSdDg6sVVm2l4tw
         V1MGrdiN5E3Q0BYCVr+D0yTG9UQbGQijOM9Li7Tys1LRs88PD+WRVEHNYQvCQpVs2ZIk
         Ckiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cPgBgxBe1VDDRfBqQ4vQGSHlG2SlYNP0ipxuIgVazNs=;
        fh=WvBw2XC1fYkFzLNYxXEySiEe2V1rJPo5RDKTOCa872c=;
        b=f/6yyCKJy+6Yes5u2EzdkK+33/0GPM+Ngjqj+nddpRnOvjwudt1reIMRe1ktYfpeNO
         RLhGAVPh+f8Y+0BQgszzcBm7MF5A4VvugnVsnCGqH6gTJmQqvsrVIigsmEyyhorIF51O
         7tpkR3+/u+19aG+kAI10GWwsv7zRtuQdRRBaPgfor4EGfQi0sh1d/nR5kXcC41wyHp7l
         jluQs7RoUM4pV5/VCSrzBWTBu2ItsmUu5IgJZwK7H6jube24TVINQZqg+vSvU4fQL3u4
         U2QEKCHRF8W1yheXhoVxzlaSsfpYOUY8Z9zcX5WikIu1F21Ir+HTvQnbMIVQV52rcaLB
         WniQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774998395; x=1775603195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPgBgxBe1VDDRfBqQ4vQGSHlG2SlYNP0ipxuIgVazNs=;
        b=CdEjDxHXM0RI7HjnxtsdF0RJFqssu5/W75XNXBdIj0iTxcSkaG9hQ8KmzNWyLTt588
         0PxyFB57R8RrNcYzXTz0c61Dy+c42EM+lVv5BU9VpCtorK+QhKqWb481a+jn5tYPTKio
         /u2ISsSrvTbXaYF1B1JFCvjdjfTn6dFq8U+aB8jYfTixy2VSPkx2/ltLYHU9oSDcY3dm
         LR3ciTW0c9eNV7LeBl7jFOyXvTGp86Y2qVcFUSLaxo52kkWWrzmoyxokmCnuxxcKk8Rs
         2+K4bdaBljGRAofhhE8i+ORHoKoIqZsG6hH5GGG4i0krX+K5lXyIyQWHdyIdoWHzh/Pl
         UQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774998395; x=1775603195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cPgBgxBe1VDDRfBqQ4vQGSHlG2SlYNP0ipxuIgVazNs=;
        b=g4GqLrjd7aDSy3xEFrHrcxY1I6Dk/Ke+cQ3h31JgLYtOhCQ5ZgclYApLIOrUI8ABiw
         nTApMefFm+KfDBOgyblSgryNURirZfvfsg5+yuaH1y1Gs4juEfS358mVEci9FztYKlyk
         B3YcFDpKe1JUCp3esHJt4SONWGjGVdcbUCz2awaP4f9bjiCNIDUwcAaxMgSxFoFKdU4E
         Ja95HVabxwutdGo3wW1cp5hW35ceBgkvDoGnI4ULL6i7QwQhdzad8Q1GKxeQWYZ57hDx
         yzgdcoicUu0/4RYr6jyqiGWWLX+PiO6g+BBLJDq+18F7Ky2khOfWNHhwuD+EchQwh0D0
         z5mw==
X-Forwarded-Encrypted: i=1; AJvYcCXJsYQjOHmd00wV1/Gbo8jfE4NVRIoDsMsd5d3WgRI5z88DpSG2RVwW88XAsFwT8QGClCz6d5gI7OL5ghIIQl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuaGM8NR+opz9zN9NiaPx33UsAI6DrZLABDI1/S+YgjeNnmP/W
	CZgKKXvurawQzpvvmb/FoxYRfwz2H112o6HnhtauAtADliQCcupwEWdC9NRzdnVmrXgc64giV9P
	rh0v68EqiEc+lXfMAtrzAGZ/PWcW63ew=
X-Gm-Gg: ATEYQzxi2UwRBSz/t7g3W1oP61YFVbfEGjT+7qyXmTrHwL3n4GeJPOmtPw1LaDxbnYq
	gU8bkMvK0Qb3C3OgzH/RLqdqU76b2ctMdUjOA/N9Mu1nEru/IOem+9957U9JlF9A0xSxFG98pEC
	3o+VipemFc/8VPsba36KcCDM25VsaMYZa+Vu+GkjrI/BawlQXE33bFsEMUXW8PYYw4Qr40ZqjiS
	Evb9CPBLe2AzASI8aDb4uZAEIoTdsKG/QTkV1juZKX5Ty4N+OoWU19WsgI1DoNnYE/lf6UeMPAD
	z8LUknSpoi+e35Bj04O+1FY=
X-Received: by 2002:a05:6a20:9185:b0:39c:4b:9c4 with SMTP id
 adf61e73a8af0-39ef6c16ebfmr987689637.13.1774998395445; Tue, 31 Mar 2026
 16:06:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331152509.70468-1-hoyeon.lee@suse.com> <20260331152509.70468-3-hoyeon.lee@suse.com>
In-Reply-To: <20260331152509.70468-3-hoyeon.lee@suse.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 31 Mar 2026 16:06:23 -0700
X-Gm-Features: AQROBzDNtmfoPLKxb_3MKSYulocaKrNxh0JN9s-nc398jOuib6sJUVOj9pcMvZw
Message-ID: <CAEf4BzbFFYuNrgven8ONRs9s3ypdzZ2VvnVDVmnwm7REYTGscQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 2/2] selftests/bpf: add test for raw-address
 single kprobe attach
To: Hoyeon Lee <hoyeon.lee@suse.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Feng Yang <yangfeng@kylinos.cn>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 8:25=E2=80=AFAM Hoyeon Lee <hoyeon.lee@suse.com> wr=
ote:
>
> Currently, attach_probe covers manual single-kprobe attaches by
> func_name, but not the raw-address form that the PMU-based
> single-kprobe path can accept.
>
> This commit adds PERF and LINK raw-address subtests by resolving
> SYS_NANOSLEEP_KPROBE_NAME through kallsyms, passing the absolute address
> in bpf_kprobe_opts.offset with func_name =3D NULL, and verifying that
> kprobe and kretprobe are still triggered. It also verifies that LEGACY
> rejects the same form.
>
> Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
> ---
>  .../selftests/bpf/prog_tests/attach_probe.c   | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/attach_probe.c b/tool=
s/testing/selftests/bpf/prog_tests/attach_probe.c
> index 9e77e5da7097..817c4794d54e 100644
> --- a/tools/testing/selftests/bpf/prog_tests/attach_probe.c
> +++ b/tools/testing/selftests/bpf/prog_tests/attach_probe.c
> @@ -123,6 +123,82 @@ static void test_attach_probe_manual(enum probe_atta=
ch_mode attach_mode)
>         test_attach_probe_manual__destroy(skel);
>  }
>
> +/* manual attach address-based kprobe/kretprobe testings */
> +static void test_attach_kprobe_by_addr(enum probe_attach_mode attach_mod=
e)
> +{
> +       DECLARE_LIBBPF_OPTS(bpf_kprobe_opts, kprobe_opts);

DECLARE_LIBBPF_OPTS is a legacy backwards-compatibility macro, prefer
using shorter LIBBPF_OPTS

> +       struct test_attach_probe_manual *skel;
> +       unsigned long func_addr;
> +
> +       if (!ASSERT_OK(load_kallsyms(), "load_kallsyms"))
> +               return;
> +
> +       func_addr =3D ksym_get_addr(SYS_NANOSLEEP_KPROBE_NAME);
> +       if (!ASSERT_NEQ(func_addr, 0UL, "func_addr"))
> +               return;
> +
> +       skel =3D test_attach_probe_manual__open_and_load();
> +       if (!ASSERT_OK_PTR(skel, "skel_kprobe_manual_open_and_load"))
> +               return;
> +
> +       kprobe_opts.attach_mode =3D attach_mode;
> +       kprobe_opts.retprobe =3D false;
> +       kprobe_opts.offset =3D func_addr;
> +       skel->links.handle_kprobe =3D
> +               bpf_program__attach_kprobe_opts(skel->progs.handle_kprobe=
,
> +                                               NULL, &kprobe_opts);
> +       if (!ASSERT_OK_PTR(skel->links.handle_kprobe, "attach_kprobe_by_a=
ddr"))
> +               goto cleanup;
> +
> +       kprobe_opts.retprobe =3D true;
> +       skel->links.handle_kretprobe =3D
> +               bpf_program__attach_kprobe_opts(skel->progs.handle_kretpr=
obe,
> +                                               NULL, &kprobe_opts);
> +       if (!ASSERT_OK_PTR(skel->links.handle_kretprobe,
> +                          "attach_kretprobe_by_addr"))
> +               goto cleanup;
> +
> +       /* trigger & validate kprobe && kretprobe */
> +       usleep(1);
> +
> +       ASSERT_EQ(skel->bss->kprobe_res, 1, "check_kprobe_res");
> +       ASSERT_EQ(skel->bss->kretprobe_res, 2, "check_kretprobe_res");
> +
> +cleanup:
> +       test_attach_probe_manual__destroy(skel);
> +}
> +
> +/* reject legacy address-based kprobe attach */
> +static void test_attach_kprobe_legacy_by_addr_reject(void)
> +{
> +       DECLARE_LIBBPF_OPTS(bpf_kprobe_opts, kprobe_opts);
> +       struct test_attach_probe_manual *skel;
> +       unsigned long func_addr;
> +
> +       if (!ASSERT_OK(load_kallsyms(), "load_kallsyms"))
> +               return;
> +
> +       func_addr =3D ksym_get_addr(SYS_NANOSLEEP_KPROBE_NAME);
> +       if (!ASSERT_NEQ(func_addr, 0UL, "func_addr"))
> +               return;
> +
> +       skel =3D test_attach_probe_manual__open_and_load();
> +       if (!ASSERT_OK_PTR(skel, "skel_kprobe_manual_open_and_load"))
> +               return;
> +
> +       kprobe_opts.attach_mode =3D PROBE_ATTACH_MODE_LEGACY;
> +       kprobe_opts.offset =3D func_addr;
> +       skel->links.handle_kprobe =3D
> +               bpf_program__attach_kprobe_opts(skel->progs.handle_kprobe=
,
> +                                               NULL, &kprobe_opts);
> +       if (ASSERT_ERR_PTR(skel->links.handle_kprobe,
> +                          "attach_kprobe_legacy_by_addr"))
> +               ASSERT_EQ(libbpf_get_error(skel->links.handle_kprobe), -E=
NOTSUP,
> +                         "attach_kprobe_legacy_by_addr_err");
> +
> +       test_attach_probe_manual__destroy(skel);
> +}
> +
>  /* attach uprobe/uretprobe long event name testings */
>  static void test_attach_uprobe_long_event_name(void)
>  {
> @@ -416,6 +492,12 @@ void test_attach_probe(void)
>                 test_attach_probe_manual(PROBE_ATTACH_MODE_PERF);
>         if (test__start_subtest("manual-link"))
>                 test_attach_probe_manual(PROBE_ATTACH_MODE_LINK);
> +       if (test__start_subtest("kprobe-perf-by-addr"))
> +               test_attach_kprobe_by_addr(PROBE_ATTACH_MODE_PERF);
> +       if (test__start_subtest("kprobe-link-by-addr"))
> +               test_attach_kprobe_by_addr(PROBE_ATTACH_MODE_LINK);
> +       if (test__start_subtest("kprobe-legacy-by-addr-reject"))
> +               test_attach_kprobe_legacy_by_addr_reject();
>
>         if (test__start_subtest("auto"))
>                 test_attach_probe_auto(skel);
> --
> 2.52.0
>
