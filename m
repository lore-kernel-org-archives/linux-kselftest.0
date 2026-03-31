Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D565D8F0
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 02:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774922520; cv=pass; b=Y2/z6szbjQsFCLi893OSlDrtDjCH5BAsKV6S2Stt+eiyFhEQpYdksYybJzgMwa2IM7+KcjAoySLb15YOgjoxUfzfSCbGT9oAdMiTlZv15Vpnz+vGrFaIX5xDYvM6+dUEZLxpMPk0UamgjSrNoCzo3kpvKqhiSIOzIj23R8oJJBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774922520; c=relaxed/simple;
	bh=5BtMxuKQ9DexShkvI2pZkLDVdrz52htk8/hMj2EaJF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BeHGWICg//v6ynwqWfVL2yIjba3g+LwGYb1X9YBw0jxhXvsAByo2Q5951V+X60h+bocWsHBuK4heLBfVEQOq9u6Ti8CtZ7ZtJJk5VWq/1cdLoVleWqNhDD2893K7keE6ZDBubSFOrG1XKj3VbeMDb+GLd40FDHhGZz2Rcb0WILA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WnPj/HCf; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WnPj/HCf"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a12cd0bd79so6088397e87.2
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 19:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774922517; cv=none;
        d=google.com; s=arc-20240605;
        b=Ko+kMHQm0xBtkhRmEN6PdlU38tt/5Ky9Egrq5fPCqhcWL3zQfUX+lu1FFEUtHvyvLS
         LH91ejuqeRRLZtyoeuAT3RSNbq1ZinJe1xSFRc4eYtI+aKCDt3s5frS4onxxonYvGom/
         HHKfrTXwmDneyOO+wtegdRzfxfXZTiIjt1rplJmmWyr9Nuo8XQ9996VvXB+ktpjvgl32
         zoi1URhluD9TpSmw1HGtV5eRCApeN4UlZ+NY70I6CuqjeMI1wGnIy+xC6HHxlLfc6upO
         SDmOdPSh1iR73k08tlqRXdRUIeI+g9elCDH1ie+0K4c9ngvbPId/TPaA8Jn2xduOMtea
         8AfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5/Ig/DGLQgf1ppLMDpJjT+8F/4O/vfBiYS4W92t7hC8=;
        fh=VXmmQqvg7Ih+ZnAHCZ5WJ5tFr8MEYVDhYWtv9wrysW0=;
        b=hxy+g5jBWV9l5F6wranNhg1L2GMp7cHYcHVlMa613IkUizIWbOdZhx+GVbo2YvDYcY
         eG+Rt15OBO/IouNFOFrHQyuN52hwIBlgYPNmg9XZCpMqTzlliIpO07fAgsFPPiaSnxtA
         m5IBlcs5tPmlYHpmuwdUMcb2Z6yR7KI+gnrsMPof49SyPqTZkMckml5pGctq9DrpvZ91
         BMZs7mURkNpEUGNh0U3eVAFh2JdP/cX6fzX9JUrh2PwS9MtmwuE1rDtAa5uUzNPHFs+/
         YijCl287d9rvKdBo4ITQMu5WL+M+VlyhvN0eqZQGnt6ruv0VhyJ4lpmFAZWJWu69tRfS
         L7cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774922517; x=1775527317; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/Ig/DGLQgf1ppLMDpJjT+8F/4O/vfBiYS4W92t7hC8=;
        b=WnPj/HCf0JP3WHw84ngdasnCEqMuZYeHl4loM3mXS66j0we/ueaFADSGnMp+4fLOSN
         +O5pVzr45JstBseRKlB7igrA1DArnMEIPHdMGFYtWxpeQRqeosxYJk97uurbr/eOHXXg
         qQixvQM9yV2UnHlVw2YJaBEF/Js9ebq+jKmu1qAC92EDtt0FSh/PdSLgbY7Oxm7KVipU
         J8HyoH5w1hRQEki6iRXAOPTNT0TuiVRLTYkKNEHKPePXI/PRacntvjLbJ77+KJBTwOrS
         QUb4M5WfVHXKl5TgSfX+5kZAUXk/PNkSGm4/M6eIARxIEHrMY1OFbJITE4WR94tClvDw
         iGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774922517; x=1775527317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5/Ig/DGLQgf1ppLMDpJjT+8F/4O/vfBiYS4W92t7hC8=;
        b=DzhTlDGwspciI18E4qWBoLRc9lPf0mTjm+0gCy+zO0cbKxZ+ueel7ojK4uAN0ARWRC
         /vvglkGzX8MFFOZQzubEvmOiQggIOZg3rr0EIcOH4vdI9NrX2yh1MDyXFGWKFdy5UQc5
         Og/AaGQ2abXOf+pif5aoABaiXuLxVZE70c/dtoI2OD1Gv57yHORnobV0iquDnYK8S/Qx
         OU17IOfU5UTAs8xojVzU6IBfs+IwKztusAn2xRIXLzr02mu9238EvlAB+X8g7nvxaJAc
         ecoL5JDxf8Kle/DjHwZ18zezL0xihUPa8VZmM528zQ7O59IjfimTzahgaqDgh6vq8U3d
         KSQw==
X-Forwarded-Encrypted: i=1; AJvYcCUiOTRjYrzygU+dozgqmQsTC7rmU7xp7jaIOO3xPOHXVvyCBatE+b1l5Chq2faI+DGDGnMTwhInf3fz1Xnd8ok=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0MAPvs3y3K+//CsqrtY9aVfETXaVMS6MREXEafekh+gl6ukjS
	iySnoejuqbjx+u6JNc1QpwmigrGiun6m5bUDUIhVlAaU42Fafa4WTGFd6eqLR/DIJa7btBT/MbL
	ZkKZW7yAQnTPNiGMwg+cyFodx+kVrMxNqQu/I6OSB+g==
X-Gm-Gg: ATEYQzxy+XXRdoL/1k5oXMQcwDe+2wFsyDIHOb8hIIzZricIleCdO02Enu2bI3snfoe
	xrLjvMrPgaM8JIxNwn13yz2EEsBQ0kIg6sQDBDohczPnGjCNTg/w03OcQ2Agu9YjU5XUqr4ValD
	gn5Suw/rgBkbn+poadUEMgZ1T+BTmbMWD2pR4U2wCA7iAcEF7ALAbJTNaW1B99vpSgSG4P+wong
	12a9V73oyNB1ZACEa+t/6YfUG2HVrWk/XkmeaNF1rwpbo0nzWDMhhWQce7dBpgw7Pzrh3VKKZZo
	iiK7C+T7I1uUKl/hzaiGx04lQvlQfJGjRqrA3Bb3dg==
X-Received: by 2002:a05:6512:10d1:b0:5a2:a5f6:dfce with SMTP id
 2adb3069b0e04-5a2ab7ea285mr5096157e87.11.1774922517043; Mon, 30 Mar 2026
 19:01:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329124429.689912-1-hoyeon.lee@suse.com> <20260329124429.689912-3-hoyeon.lee@suse.com>
 <acpLlFg_UUmzp80f@krava>
In-Reply-To: <acpLlFg_UUmzp80f@krava>
From: Hoyeon Lee <hoyeon.lee@suse.com>
Date: Tue, 31 Mar 2026 11:01:41 +0900
X-Gm-Features: AQROBzDg0qcd_MUjXbT6jLQeGM7P_6EVEMeqa7ZA9em-EgNqL92HBMqjpED8Yxk
Message-ID: <CAK7-dKY+_wxF4X9pg8isQh_7+_T3vCX=BwgdJhP9wd9vMntZHg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] selftests/bpf: add test for address-based
 single kprobe attach
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
> On Sun, Mar 29, 2026 at 09:43:39PM +0900, Hoyeon Lee wrote:
> > Currently, attach_probe covers manual single-kprobe attaches by
> > func_name, but not by raw address. This commit adds address-based
> > single-kprobe attach subtests for the two underlying attach paths,
> > legacy tracefs/debugfs and PMU-based non-legacy. The new subtests
> > resolve SYS_NANOSLEEP_KPROBE_NAME through kallsyms, pass the result
> > through bpf_kprobe_opts.addr, and verify that kprobe and kretprobe are
> > still triggered.
> >
> > Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
> > ---
> >  .../selftests/bpf/prog_tests/attach_probe.c   | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >
> > diff --git a/tools/testing/selftests/bpf/prog_tests/attach_probe.c b/to=
ols/testing/selftests/bpf/prog_tests/attach_probe.c
> > index 9e77e5da7097..64f2ed75779d 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/attach_probe.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/attach_probe.c
> > @@ -123,6 +123,51 @@ static void test_attach_probe_manual(enum probe_at=
tach_mode attach_mode)
> >       test_attach_probe_manual__destroy(skel);
> >  }
> >
> > +/* manual attach address-based kprobe/kretprobe testings */
> > +static void test_attach_kprobe_by_addr(enum probe_attach_mode attach_m=
ode)
> > +{
> > +     DECLARE_LIBBPF_OPTS(bpf_kprobe_opts, kprobe_opts);
> > +     struct bpf_link *kprobe_link, *kretprobe_link;
> > +     struct test_attach_probe_manual *skel;
> > +     unsigned long func_addr;
> > +
> > +     if (!ASSERT_OK(load_kallsyms(), "load_kallsyms"))
> > +             return;
> > +
> > +     func_addr =3D ksym_get_addr(SYS_NANOSLEEP_KPROBE_NAME);
> > +     if (!ASSERT_NEQ(func_addr, 0UL, "func_addr"))
> > +             return;
> > +
> > +     skel =3D test_attach_probe_manual__open_and_load();
> > +     if (!ASSERT_OK_PTR(skel, "skel_kprobe_manual_open_and_load"))
> > +             return;
> > +
> > +     kprobe_opts.attach_mode =3D attach_mode;
> > +     kprobe_opts.retprobe =3D false;
> > +     kprobe_opts.addr =3D func_addr;
> > +     kprobe_link =3D bpf_program__attach_kprobe_opts(skel->progs.handl=
e_kprobe,
> > +                                                   NULL, &kprobe_opts)=
;
> > +     if (!ASSERT_OK_PTR(kprobe_link, "attach_kprobe_by_addr"))
> > +             goto cleanup;
> > +     skel->links.handle_kprobe =3D kprobe_link;
>
> we usually use skel->links.handle_kprobe directly, no need to use
> kprobe_link or kretprobe_link
>

Thanks for the review! I'll change that in v3 and assign directly to
skel->links.handle_kprobe and skel->links.handle_kretprobe.

> > +
> > +     kprobe_opts.retprobe =3D true;
> > +     kretprobe_link =3D bpf_program__attach_kprobe_opts(skel->progs.ha=
ndle_kretprobe,
> > +                                                      NULL, &kprobe_op=
ts);
> > +     if (!ASSERT_OK_PTR(kretprobe_link, "attach_kretprobe_by_addr"))
> > +             goto cleanup;
> > +     skel->links.handle_kretprobe =3D kretprobe_link;
> > +
> > +     /* trigger & validate kprobe && kretprobe */
> > +     usleep(1);
> > +
> > +     ASSERT_EQ(skel->bss->kprobe_res, 1, "check_kprobe_res");
> > +     ASSERT_EQ(skel->bss->kretprobe_res, 2, "check_kretprobe_res");
> > +
> > +cleanup:
> > +     test_attach_probe_manual__destroy(skel);
> > +}
> > +
> >  /* attach uprobe/uretprobe long event name testings */
> >  static void test_attach_uprobe_long_event_name(void)
> >  {
> > @@ -416,6 +461,10 @@ void test_attach_probe(void)
> >               test_attach_probe_manual(PROBE_ATTACH_MODE_PERF);
> >       if (test__start_subtest("manual-link"))
> >               test_attach_probe_manual(PROBE_ATTACH_MODE_LINK);
> > +     if (test__start_subtest("kprobe-legacy-by-addr"))
> > +             test_attach_kprobe_by_addr(PROBE_ATTACH_MODE_LEGACY);
> > +     if (test__start_subtest("kprobe-perf-by-addr"))
> > +             test_attach_kprobe_by_addr(PROBE_ATTACH_MODE_PERF);
>
> should we test PROBE_ATTACH_MODE_LINK mode as well?
>

I covered only LEGACY and PERF here, because they test the two
underlying single-kprobe attach paths, legacy tracefs/debugfs and
PMU-based non-legacy.

I treated LINK as duplicate coverage here. If you think explicit LINK
coverage is still worth having, I can add it in v3.

> jirka
>
