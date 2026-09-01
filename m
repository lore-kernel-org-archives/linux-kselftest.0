Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875D047A0C7
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 11:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260586; cv=pass; b=RdO+sXV9JSvKCp4FP6+I4TMR77l01RGx4wEKlpFqs05bJOYJec+549mIBiCKN3TtOsLcCOOxRLAgBD09c4fUcgl6/xjmeBiJar4+emG0ZSkdgRR8s2sOH3fmiKTAUu6l2uwTWgCLoEQTA8vuRJHfZRrPfpVjkaipSVtGP5bOV4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260586; c=relaxed/simple;
	bh=9pZcWmQuwO7sUinLiZN20It+LnS0MxOvZ2XwTQJXn+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kTMHtkN8oCvsyAbSZjc1aO9CWGpwiaAdPEHrQ7cBiuWWw4EV57DG81fmt6SpzJ2RB7IME7MY8S4aHLtgCChGAxAsBLgPeYJtHk69iIiQloMH+IDxWbcO7Ap7Ox2uGXmXNBicPqdtL8kKp3jP2RxoCjO+fzsCgYJCBS/ohsjxiBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abHlSeKO; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abHlSeKO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d71ae3455aso11536875ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 04:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788260584; cv=none;
        d=google.com; s=arc-20260327;
        b=nQRooDh4wLkdqlGdylr4I7M24Dw1daAR3adHPd7pwhHtFYUWapdiwkvF3bctfY4tss
         eNfU5s6i3FAe4w6e2rzdrvivzVO62x+YHIUAxXnSokhttMNkjOOVgh+O7e5QfnVhgyVE
         4keuHvKHoi47InP73q+7/y/x7JTbwwD4yHR9tcHF7QCWgXN2uRiZA1JjLVCnqiFaygFm
         +ZG06se37VJR7vboYfkgt9OoWy9F2uYK2S7MWxg0Z4ESrYem/tQkWZi4IMRtdJnygPv2
         k20MAuwg+kyRhrptrGMI9WSbkncGex/7kgbCY8SOtFv44mID+tshYYluzHTv9H3zlu5w
         1y5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xni6XiC9n8biLyj8Lypf2TuiINVCW7jBKaUVbdQaKLQ=;
        fh=9QKTI0VHnblDIR/nbf+2HN8q1hFnHdYnkZYYeKbV3z8=;
        b=PNMM0cxqD4H+o6NiBU97ViD1hT7XVqXB9AlRNUuryFfsuVEZbWAWxNYVUV9BU269+A
         b+MhYmmWoY0Xiu1MBC0EOqWHX0N4AmEcBcstUZeqY1kEaG2lPRr1sIghFuy/g0Gx9oYI
         AJf50/hBKqeDh0HM2KiO2I2QKwYajFGpNZwskecBZf4Do/qU1dfQA6QO4nor5XRHGrEg
         YZ2s6SC+jo6EYYwWPONglvHuDCoh2qdC1TsH3C1KKVValQu1z1Len0cDTllBM8Huo1Ac
         X+hHWK8GgUwR5Lqw1jjU4ZA013489XVTCACfA6JZE9laH0vRM72Ls70TOcrU3riPxQ07
         NgQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788260584; x=1788865384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xni6XiC9n8biLyj8Lypf2TuiINVCW7jBKaUVbdQaKLQ=;
        b=abHlSeKO1AlUkgHdCmsPeiYX0dVDAN8SErGde6xEa4kLUKKXRyy/XdyoIsEFHuDjsk
         aVxqvDPizO4FDkDxtF/L3FTb0bMtKyKDO0KPK4Rty+FgRcmBXeDO/UoilxZmqxUKIF7k
         PRl0RbmHm2Ph1r2qw2TVsn4fhUH7vRRPB8zRbclFC5eX7LepmbYVww7u5ZnrVfVn1Tx+
         hzR/j656jmFfbQwq9CMhxiZbKHbtmcjrntWyJplJgmnf8AMmXTSAG9BWem5WhKV+2ahS
         nzOnIIe0Wrfnmc5aQAkQfgSncBjZQ5xIO5gdx++4Zf5qStqQoMSHIaf9W3CR1HFXLwY0
         C+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788260584; x=1788865384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xni6XiC9n8biLyj8Lypf2TuiINVCW7jBKaUVbdQaKLQ=;
        b=Vw/okwjrrXJ1o8pPPQuXaEgRpoUmVjY8nXIovkFJU/BS0tAytm3nSZeKIeUfJUIJ/Z
         JFuooKalhD5Kbl5VnQCNFoo9go1OXXXcbzpUCh6mG5Imj9lLP8Lj4Bpxq+0Lkyakum5m
         N3y1h8fehJDjxvIRzN7+BwdEIlJW+6c8r34pFse1z6C15jwNLbN2/Pn+ZzqboqvNNXix
         48s7mlqYj9Ism+E7Pti8EE8ed+P0VYcag7qiUcPm3FJ6OTxA9+4w2+/2JCIU0M47daLt
         IRcJcXAi3khGWEeYxFvnecJzMkTOwxW14j/ThcrzDsjLgkjxAVShQQJNjzPd7FZHaPoa
         dD3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxwme1jrpJhzl5pcRhgDLdLr/GSkPvwAi+uujcUvE5MIY6IH9KnjlfzehPQvZG+74BdsxHW8cdiH/TaI/nLgew=@vger.kernel.org
X-Gm-Message-State: AFuF++nTr90f8UTTNk/SaXbUFOe57ubJM5hzx21a3Q40wSPib5/sPS5g
	qzjcSaeRNNxi/zO1Xz5Ajk7NGy/QfUj0kh0ifeGl9HGd5N+KeS09goTKVcjrAWsZyMkRohSVlfS
	430idKBSD5pOGW5FeXpDRPqbIFYECMoo=
X-Gm-Gg: AYBFou32ov0gwOewlULPr3iUMuax5Lr6Z5cQUZbImGZT1mHsUrmoFFE2KRsCGzoOMEo
	OLAnSDQDxHA5SplOkpbx6uvlLArbN8kw1YURzRiH1K5uaJQvBYJFNNgCe812uMZKlGeESxaGM33
	Z0OkA2GeKQwV7BD5xS4BHYfUOGn9lLEsCfhz0p4xfm5A0Z4V71IUdxAn9qvr2Px3M40lkBMrKl0
	HhCkN/38uvmFsZjNocmqUnoW3VUJtHled0y8DgWc828NR+aL9gP9tG2zsdN/BLHwDgc/xfIOnSq
	J+41GGzC1T7fqNDNOksZme0FAusAUxG/iCy4iPzxrhfAj42vkDvQZrktp/1mWD4+JQH90vkjUK2
	A6A==
X-Received: by 2002:a17:902:f70a:b0:2d9:56d8:75f with SMTP id
 d9443c01a7336-2d956d80878mr69911895ad.9.1788260581562; Tue, 01 Sep 2026
 04:03:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-lockdep-kunit-v2-0-36a6fec9f72e@gmail.com>
 <20260824-lockdep-kunit-v2-2-36a6fec9f72e@gmail.com> <205be33b-362d-45cb-b3a1-cadaba87b44a@davidgow.net>
In-Reply-To: <205be33b-362d-45cb-b3a1-cadaba87b44a@davidgow.net>
From: Malte Wechter <maltewechter@gmail.com>
Date: Tue, 1 Sep 2026 13:02:47 +0200
X-Gm-Features: AcwNN1W79p2fFOH7uCKy1nc1ZzYo-juVYXphO2_ZqdYVlaVgFvGUZW4sRrBNbXc
Message-ID: <CAPB1BzeDC=V+jKZgX-2gucSZs8vOmZBvUgZLS8kTLvWa0x5S-Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kunit: add KUnit test to assert kernel state
 before KUnit suites are run
To: David Gow <david@davidgow.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den tirs. 25. aug. 2026 kl. 13.00 skrev David Gow <david@davidgow.net>:
>
> Le 24/08/2026 =C3=A0 21:32, Malte Wechter a =C3=A9crit :
> > add pre-defined KUnit test suite and test case that asserts both
> > `debug_locks` and `TAINT_WARN` prior to running any (user) KUnit tests.
> > This asserts integrity before tests are run.
> >
> > Signed-off-by: Malte Wechter <maltewechter@gmail.com>
> > ---
>
> I'm not quite as convinced by this as I am by the first patch. While
> ensuring the state of the system is good before tests are run is useful,
> this does seem a bit heavy-handed in some respects.
>
> This could probably use a more detailed description, particularly
> describing why such a test is useful, and why it would need to be
> implemented in a special way.
>
> And I do think the implementation here is a bit _too_ special-cased. One
> other possibility would be to prepend this suite using
> kunit_merge_suite_sets(), so we don't need to have any special handling
> of (e.g.) the test count. This could also allow this special suite to be
> filtered out (which has both advantages and disadvantages).
>
> It might also be nice to have this configurable independently from the
> other checks, and maybe at runtime (via a KUnit module / command-line
> parameter), particularly if this can't be filtered on. And, as before,
> this definitely needs to be documented. People need to know how to
> enable it, and where all of these extra results from tests they didn't
> enable came from.
>
> Thoughts?
I get your point, the purpose of this special test suite is to assert
that the kernel is in a "fine" state before any unit tests are run. If
this
check is left out the false positives could occur if the system is in
a bad state before the tests are run.
The reason that the case was handled differently compared to other was
because this assertion _must_ be run before any other tests,
and when kunit_merge_suite_sets() is called from kunit_run_all_tests()
it also filters the test suites, which would not give any guarentee
that this
special suite gets run first.

I do agree that this initial way is maybe a bit coarse, and i will see
if i can find a better fit for this assertion. But i dont want to
leave it out.
>
> Cheers,
> -- David
>
> >   lib/kunit/executor.c |  8 +++++++-
> >   lib/kunit/test.c     | 30 ++++++++++++++++++++++++++++++
> >   2 files changed, 37 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
> > index b0f8a41d61d36..0db67fe7f09f9 100644
> > --- a/lib/kunit/executor.c
> > +++ b/lib/kunit/executor.c
> > @@ -290,9 +290,15 @@ void kunit_exec_run_tests(struct kunit_suite_set *=
suite_set, bool builtin)
> >       size_t num_suites =3D suite_set->end - suite_set->start;
> >       bool autorun =3D kunit_autorun();
> >
> > +     #ifdef CONFIG_KUNIT_EXTRA_ASSERTS
>
> Nit: Let's not indent the #ifdefs.
>
> > +     size_t num_suites_plus_extra =3D num_suites+1;
> > +     #else
> > +     size_t num_suites_plus_extra =3D num_suites;
> > +     #endif
> > +
>
> I'm not particularly happy with this way of adding an extra suite.
>
> >       if (autorun && (builtin || num_suites)) {
> >               pr_info("KTAP version 1\n");
> > -             pr_info("1..%zu\n", num_suites);
> > +             pr_info("1..%zu\n", num_suites_plus_extra);
> >       }
> >
> >       __kunit_test_suites_init(suite_set->start, num_suites, autorun);
> > diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> > index 99773e000e1b7..e64c6d1575280 100644
> > --- a/lib/kunit/test.c
> > +++ b/lib/kunit/test.c
> > @@ -835,6 +835,30 @@ bool kunit_enabled(void)
> >       return enable_param;
> >   }
> >
> > +#ifdef CONFIG_KUNIT_EXTRA_ASSERTS
> > +#define DEBUG_LOCKS_OK 1
> > +#define TAINT_WARN_OK 0
>
> Not totally sold on these #defines: I think I'd prefer to just have the
> literal 1/0.
>
> > +
> > +static void pre_kunit_assert(struct kunit *test)
> > +{
> > +     KUNIT_EXPECT_EQ_MSG(test, debug_locks, DEBUG_LOCKS_OK,
> > +             "debug_locks are off before any test ran");
> > +     KUNIT_EXPECT_EQ_MSG(test, test_taint(TAINT_WARN), TAINT_WARN_OK,
> > +             "kernel already TAINT_WARN tainted before any test ran");
> > +}
>
> If we are going to generate a special suite, let's have the taint and
> lockdep checks as separate tests.
>
> This would also make it easier to have them be configurable separately.
>
> > +
> > +static struct kunit_case pre_kunit_assert_cases[] =3D {
> > +     KUNIT_CASE(pre_kunit_assert),
> > +     {}
> > +};
> > +
> > +static struct kunit_suite pre_kunit_assert_clean_state_suite =3D {
> > +     .name =3D "pre_kunit_extra_asserts",
>
> I think we could probably find a better name for this.
> "initial_system_state" or similar might be better?
>
> > +     .test_cases =3D pre_kunit_assert_cases,
> > +};
> > +
> > +#endif /* CONFIG_RUST_KUNIT_EXTRA_ASSERTS */
> > +
> >   int __kunit_test_suites_init(struct kunit_suite * const * const suite=
s, int num_suites,
> >                            bool run_tests)
> >   {
> > @@ -857,6 +881,12 @@ int __kunit_test_suites_init(struct kunit_suite * =
const * const suites, int num_
> >       }
> >       static_branch_inc(&kunit_running);
> >
> > +     #ifdef CONFIG_KUNIT_EXTRA_ASSERTS
> > +     kunit_init_suite(&pre_kunit_assert_clean_state_suite);
> > +     if (run_tests)
> > +             kunit_run_tests(&pre_kunit_assert_clean_state_suite);
> > +     #endif
> > +
> >       for (i =3D 0; i < num_suites; i++) {
> >               kunit_init_suite(suites[i]);
> >               if (run_tests)
> >
>
Best regards,
Malte :)
