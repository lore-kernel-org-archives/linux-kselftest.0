Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E7D2BEC2B
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 05:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775020976; cv=pass; b=Ubr6lsq9IDzTfZU85A+3UnLmmW6zRIM9Ge0HZDhirN1Dgi7ipgy3ZmqWSYgC0gthmjSazBmko68RdIzy9085RmuA1OswkAwf2G6Gm1nrPgxITwef5bsakk++w8OcGGPz8fPUvJ9H5CMeUYzS1vZ4HK8PGbo+LFI5vNF1Azjg5ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775020976; c=relaxed/simple;
	bh=EToT+jbi74/I43F5MpaPRz2Ah2alfai5tT1/AmKTR60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bqTth8SvZOyuZQ/ux4kH97EA+nhIIzuSgwOt1z5HVjwe+6JuOWAuCYccqoUE5O7KVj1NmXwATz52kCHUmwJ8rZR7vQuQAC2IoYY66txFXgAeJaCAVTa0IuPd+wUgTBaSQJDcrrySMk79eRZAeti75o+WsuVx9h29q0Q0IznGrrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KjtOnyWj; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KjtOnyWj"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a2a8abac7dso4967416e87.3
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 22:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775020973; cv=none;
        d=google.com; s=arc-20240605;
        b=EoFnOX7GbwIokVWxIdlq0mT5uJJOmFxV3uQh5alqpDGkiPeqjaW08blZXzZCToCKbc
         ZcXWRlU8Ay34vIXwS0IWhHt++HWcGNsj2nM6W4JtYXtCYxAqmFjIiVrIsC/SjwDVLI8P
         6WmfQRksZTnGdCwLIlhSCOVwy5UjTFLbDJWXmjhm6G68V02ad1oIoc0ZdOX6a8kPcxSS
         152l7IOlrHo95zpm5ZGBx3V3/gvKeA6B8wmMcn3tdaF0ybUjWLB3V6Y3B6m8DX5WCgiS
         z8GVCjeZLB/OH7IAvnfFRSlMZPPGVopC3vxQnKYCYSanSQJajJ/gbBm4XPv/nck3AMcj
         6n+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9nRjIDw2DuYf2VjS3Dnf8WMoxKek5GPsaf/dodkzcEw=;
        fh=d3OAO1Lc0ggtdOKqbuRIlgkAGdr5oJmeXZvY0VksBY0=;
        b=aJyIGFGvlrtNJ/X0pt/YAaX8dcKAV8d6t8Zk64So2C4KLomENraErnU775CT88zNs3
         lYN7079tlW5xRxXWoc2ZMUnZoepf+sd9LbRY+e0RMNWbCv8py1Taqev0sZUU5dN5I5kc
         ReP5IcWWZBzfxWSkdkycDckgBBNiTaUgSzUuZKHu9DgbovDoFCjnhw6MbrFxuFlOgoGy
         ooU5/7/17EPN0aNvKvT0yhtYw6MU3ShATEe/O3gQaTegmXrsnTJRD3YykdVyU5Y7MG6s
         KGu9lSeSfU5LvvBX6v3lnzQUJ0AbtwqpYAIe+jpiGNGaJ7YcR2QrIt8xzhWwmex1pg1Q
         pMrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775020973; x=1775625773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nRjIDw2DuYf2VjS3Dnf8WMoxKek5GPsaf/dodkzcEw=;
        b=KjtOnyWjZU7AHJBXb1CRw22BCirx2kZwP2OOCv2I/MFCwuasG8TjQvKOqXKu6EdfSC
         zzk9E8aJ9v9Dl/fyvmGmCbi5QV6Tj6HZRfK1EWjucpnLGtcBOLPyUgOG7QrqucRjqMuQ
         NPYQ39z655lVg7PBkXQX1bjMGw88dSGDmxWX9s1Cx2LHWXllpvwrc09e1RbBWWM+ljQw
         Fk6qaqoTLU5QIDKfAQYXzfilW9FEZSzKa5dOno+diekzFAgBak8wpX0XLnXrispE83Qw
         mgZeWGpG5HV00qp6scKhFV6bAgf4iiDfZqoLyHCYdShIAOCGTIQKBgKwt+PZBWfxj49R
         3Dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775020973; x=1775625773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9nRjIDw2DuYf2VjS3Dnf8WMoxKek5GPsaf/dodkzcEw=;
        b=HMGlkRMUIGGh2tFofoPWzbgwflxFnaOSKCetaGankljpknzVtc4xdnyxLSuxahJx2u
         NaXhad/JxvYqSSJAc6LvvZ6+qcb6wjZGyxiEB5cm+6lbbLEdAqTtU/o95wnKJTztyQTh
         6fQQSNj5A7Qnkc0jBJLrQfnbozJ+TfF4jFq7wOCuaVXI5lrgXQwm4JwLQR6MoZ8Ei7Ah
         5ijF760YtiicebyAP7CP69CvDBEC9lu5yo+uhDUXziHVK+/I67WXIbXmXKzeKg3rSLaY
         Giot4uyxCOE7ItlzgC7HSJ0iIVIFJWzC2N7YTSMX8UyyPbag8t54fD4b1+Oc466ibInM
         tQGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbju0/AAVaU+2JDuBhYjfPKa9GAqy++nhFNKajk+YeIB18PWL/y3fWbcV1p2mwQht4LFE83UrWzKeIJMcn+aU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1pU7m5fZT+R8Bwe1c8bVqhP3S/rpoMGGTgA7JDHMSv1uY9Nn2
	r5mkgQgcxdO7NLQhmyrKnoQdZn7bDdnNeEoQVCjAjU5TSpuIFH+eiuCUxFetVBAd6pFS3uA5e0r
	SeOlPoxmdiELGhqbYoM/3p7ijdnhrDl9QLSHYFgn3Q69xBaqXOIh1G3f2xQ==
X-Gm-Gg: ATEYQzz0dLxBrb3VYynDYH1IB+/SSMf7Aamn+mr/tf+taBuGwVlWamfbyM6CyAvr2/g
	qlw0iglQ6aPww+Nq9sU1lJXfeyaTikO12tZuq2C0h3RdN1ACj9ijacSaLQN6zoPSSrnQNllmRTN
	LWmYZHd1GgmqNYFIiKeNXL5WFi3z6av6E9pZg9OCvALTuAyCWZRUAmR10TwGktKhfNs4c7lXlXy
	Em7ha3NyYBRpOJKFt6S8E37krFhFSnxgimv6D1WOyabRv4s82DgPQw7ISY5U7N9iNBCsoskR3tj
	9qQPmHttgDR8lpnrFYj57h0OooXUBXb8kl7TNyjn1w==
X-Received: by 2002:a05:6512:3090:b0:5a2:961a:f7c7 with SMTP id
 2adb3069b0e04-5a2c1f20accmr670225e87.21.1775020973157; Tue, 31 Mar 2026
 22:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331152509.70468-1-hoyeon.lee@suse.com> <20260331152509.70468-3-hoyeon.lee@suse.com>
 <CAEf4BzbFFYuNrgven8ONRs9s3ypdzZ2VvnVDVmnwm7REYTGscQ@mail.gmail.com>
In-Reply-To: <CAEf4BzbFFYuNrgven8ONRs9s3ypdzZ2VvnVDVmnwm7REYTGscQ@mail.gmail.com>
From: Hoyeon Lee <hoyeon.lee@suse.com>
Date: Wed, 1 Apr 2026 14:22:37 +0900
X-Gm-Features: AQROBzChoRCK5UAm8V3ba-jaSqzA35xdHS3dBo1XbSSrVl87VsiSv0U84cLcByw
Message-ID: <CAK7-dKYnYWnFNC=Q1DHqczv49N9eXUM=ALFg8qeO=tt_WHjUsQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 2/2] selftests/bpf: add test for raw-address
 single kprobe attach
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Feng Yang <yangfeng@kylinos.cn>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 8:06=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Tue, Mar 31, 2026 at 8:25=E2=80=AFAM Hoyeon Lee <hoyeon.lee@suse.com> =
wrote:
> >
> > Currently, attach_probe covers manual single-kprobe attaches by
> > func_name, but not the raw-address form that the PMU-based
> > single-kprobe path can accept.
> >
> > This commit adds PERF and LINK raw-address subtests by resolving
> > SYS_NANOSLEEP_KPROBE_NAME through kallsyms, passing the absolute addres=
s
> > in bpf_kprobe_opts.offset with func_name =3D NULL, and verifying that
> > kprobe and kretprobe are still triggered. It also verifies that LEGACY
> > rejects the same form.
> >
> > Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
> > ---
> >  .../selftests/bpf/prog_tests/attach_probe.c   | 82 +++++++++++++++++++
> >  1 file changed, 82 insertions(+)
> >
> > diff --git a/tools/testing/selftests/bpf/prog_tests/attach_probe.c b/to=
ols/testing/selftests/bpf/prog_tests/attach_probe.c
> > index 9e77e5da7097..817c4794d54e 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/attach_probe.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/attach_probe.c
> > @@ -123,6 +123,82 @@ static void test_attach_probe_manual(enum probe_at=
tach_mode attach_mode)
> >         test_attach_probe_manual__destroy(skel);
> >  }
> >
> > +/* manual attach address-based kprobe/kretprobe testings */
> > +static void test_attach_kprobe_by_addr(enum probe_attach_mode attach_m=
ode)
> > +{
> > +       DECLARE_LIBBPF_OPTS(bpf_kprobe_opts, kprobe_opts);
>
> DECLARE_LIBBPF_OPTS is a legacy backwards-compatibility macro, prefer
> using shorter LIBBPF_OPTS
>

Got it, I'll switch to LIBBPF_OPTS and updated the reject
expectation to -EOPNOTSUPP in v5.

> > +       struct test_attach_probe_manual *skel;
> > +       unsigned long func_addr;
> > +
> > +       if (!ASSERT_OK(load_kallsyms(), "load_kallsyms"))
> > +               return;
> > +
> > +       func_addr =3D ksym_get_addr(SYS_NANOSLEEP_KPROBE_NAME);
> > +       if (!ASSERT_NEQ(func_addr, 0UL, "func_addr"))
> > +               return;
> > +
> > +       skel =3D test_attach_probe_manual__open_and_load();
> > +       if (!ASSERT_OK_PTR(skel, "skel_kprobe_manual_open_and_load"))
> > +               return;
> > +
> > +       kprobe_opts.attach_mode =3D attach_mode;
> > +       kprobe_opts.retprobe =3D false;
> > +       kprobe_opts.offset =3D func_addr;
> > +       skel->links.handle_kprobe =3D
> > +               bpf_program__attach_kprobe_opts(skel->progs.handle_kpro=
be,
> > +                                               NULL, &kprobe_opts);
> > +       if (!ASSERT_OK_PTR(skel->links.handle_kprobe, "attach_kprobe_by=
_addr"))
> > +               goto cleanup;
> > +
> > +       kprobe_opts.retprobe =3D true;
> > +       skel->links.handle_kretprobe =3D
> > +               bpf_program__attach_kprobe_opts(skel->progs.handle_kret=
probe,
> > +                                               NULL, &kprobe_opts);
> > +       if (!ASSERT_OK_PTR(skel->links.handle_kretprobe,
> > +                          "attach_kretprobe_by_addr"))
> > +               goto cleanup;
> > +
> > +       /* trigger & validate kprobe && kretprobe */
> > +       usleep(1);
> > +
> > +       ASSERT_EQ(skel->bss->kprobe_res, 1, "check_kprobe_res");
> > +       ASSERT_EQ(skel->bss->kretprobe_res, 2, "check_kretprobe_res");
> > +
> > +cleanup:
> > +       test_attach_probe_manual__destroy(skel);
> > +}
> > +
> > +/* reject legacy address-based kprobe attach */
> > +static void test_attach_kprobe_legacy_by_addr_reject(void)
> > +{
> > +       DECLARE_LIBBPF_OPTS(bpf_kprobe_opts, kprobe_opts);
> > +       struct test_attach_probe_manual *skel;
> > +       unsigned long func_addr;
> > +
> > +       if (!ASSERT_OK(load_kallsyms(), "load_kallsyms"))
> > +               return;
> > +
> > +       func_addr =3D ksym_get_addr(SYS_NANOSLEEP_KPROBE_NAME);
> > +       if (!ASSERT_NEQ(func_addr, 0UL, "func_addr"))
> > +               return;
> > +
> > +       skel =3D test_attach_probe_manual__open_and_load();
> > +       if (!ASSERT_OK_PTR(skel, "skel_kprobe_manual_open_and_load"))
> > +               return;
> > +
> > +       kprobe_opts.attach_mode =3D PROBE_ATTACH_MODE_LEGACY;
> > +       kprobe_opts.offset =3D func_addr;
> > +       skel->links.handle_kprobe =3D
> > +               bpf_program__attach_kprobe_opts(skel->progs.handle_kpro=
be,
> > +                                               NULL, &kprobe_opts);
> > +       if (ASSERT_ERR_PTR(skel->links.handle_kprobe,
> > +                          "attach_kprobe_legacy_by_addr"))
> > +               ASSERT_EQ(libbpf_get_error(skel->links.handle_kprobe), =
-ENOTSUP,
> > +                         "attach_kprobe_legacy_by_addr_err");
> > +
> > +       test_attach_probe_manual__destroy(skel);
> > +}
> > +
> >  /* attach uprobe/uretprobe long event name testings */
> >  static void test_attach_uprobe_long_event_name(void)
> >  {
> > @@ -416,6 +492,12 @@ void test_attach_probe(void)
> >                 test_attach_probe_manual(PROBE_ATTACH_MODE_PERF);
> >         if (test__start_subtest("manual-link"))
> >                 test_attach_probe_manual(PROBE_ATTACH_MODE_LINK);
> > +       if (test__start_subtest("kprobe-perf-by-addr"))
> > +               test_attach_kprobe_by_addr(PROBE_ATTACH_MODE_PERF);
> > +       if (test__start_subtest("kprobe-link-by-addr"))
> > +               test_attach_kprobe_by_addr(PROBE_ATTACH_MODE_LINK);
> > +       if (test__start_subtest("kprobe-legacy-by-addr-reject"))
> > +               test_attach_kprobe_legacy_by_addr_reject();
> >
> >         if (test__start_subtest("auto"))
> >                 test_attach_probe_auto(skel);
> > --
> > 2.52.0
> >
