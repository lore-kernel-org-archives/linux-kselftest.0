Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7793ABDA8
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 09:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279979; cv=pass; b=S7mrfjXRE9T/GzYfiLwhKpX5QovI8Up0MZq6PRYt0wfTqlMMX6Asgs9ZPvkllsH1DYxKhswmTqf+kxJFNcaZKBwc8UftBr5FTsHWM8nohIWWXg3GDdmzEzWlkRAEcq1RHmclhnl0CStdtl9vnDAYsRpsdcdBW8w0sLNLqnpvWoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279979; c=relaxed/simple;
	bh=eLX+GLrTA5q/rdkDIBaCWY2QUMfEjidy8HXm1+abyMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTltmpVGexs8hff9UpPndBPFh5GhxaPrpyOdXcwuXvxvEJzXbAWMrBgXc+X0nS+K3DGEX2ZgRWHu+Dn2ze535YWPiI2c4wbvSRwqjItN9pEZsadlLTkjVBIUvz6z72InGED5hZsv39AHPoI5lsMOet77yGbgCN2BOhp+9flIg5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PxwHpoOB; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxwHpoOB"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-144f7915346so972704c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 06 Oct 2026 02:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791279976; cv=none;
        d=google.com; s=arc-20260327;
        b=N/c3mxfUybhS8KP3fgYfGBhNo2WYEVXmCFG23Di+n3E3Xto+IbO+PknEPFpEO5gSod
         VOxxkVWjF9Ts5ly1cjszBifcfwsSx042+m5jRyz+DEop8FuWO83tsjqi3r0AcndbkMsO
         gJGYAvChe3cOQGX7GVyPgfzwB2LW/5x/p6F/FGnuJkvZTpVgCMoUZ4V2tChmoXwtIavJ
         2ZZ7fSDILi/rW/69u0+6YuMJu/J7FWAE4uYSEKrbBAHI/85vtlLGkvrE/zSjblfGVlKu
         /wQSTwFzZdA1oF1WAza58CfYE04hOUK8G1Lo51dwKwyKj/uyMJiQ6VZHB97MvwjeqCOI
         7nZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g9WspFC7w4sKTniUPMV/pCZAN1RV4PF3Cz3GTIu/oow=;
        fh=y7volvPIzvNQs3JsGMR/mqhgjoVPnv9fXR3AVcYJabQ=;
        b=A4MiwUdlITI24CS2SURRlrfSMbsUb5dlzVldupkFgtXHKs7vxXTzZxc8vFqieP59zK
         +rPW7iXRk6FsJRJzqNWMNhrG/sJUt7sTMTo9DM2176FRuQQc5kJ32dh9jApbMYqCdMC0
         ZfKQcFtv9cdVVfeu9HKOVaRftRUzg3iHmhqIykcDr/wD5n6ovLSpVqS3DwyTZ0hIOVC/
         LpUw5YFntV72Pq93HcV5A4QggWollmqKMqWA5xhehUlW2N50Z1hm1NV2Ui8b5JOYCz5J
         fh2Bo5BlHIo7EjtXUAtI1B8Cm2hrT/epSaOzD4NLzz2MlRX5rI2ZDYGOXOVg7tmv2kKy
         XpBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791279976; x=1791884776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g9WspFC7w4sKTniUPMV/pCZAN1RV4PF3Cz3GTIu/oow=;
        b=PxwHpoOBT917KY5FQS/3cxXy50FasXw43L36JviPdaFZTMy3iA2POCtU3Km9805845
         Q9oQgkHfRPeW8JEFDPF27aZ3smTbVPyFwoMwMBX9Z4YPm9RVjxo7eUfosh1StaBrnrKv
         LzaVSD+g/+6gy3DZYnueP5aVLMab8FgOkS10HXP496+7l/5CbkTpNejzEt1vqx8xvu5z
         b0garFYtcMuJIL/incbGKOitXlATypkywyZbOk0ajhxNKRROyup0grxkHk42APwdojbm
         fU4s0jC9kwHD4Zhesbl6MG30TF3T7kZXIyLDwpofWvDpYwdtV61U3nbi81yr42Q6vFFo
         2YQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791279976; x=1791884776;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g9WspFC7w4sKTniUPMV/pCZAN1RV4PF3Cz3GTIu/oow=;
        b=HI3Hf++mcBqRQXXR6Tl6YT1EfQsItsScc9hZE8/AE4WR3jP6j8Bc6rARbp+97ZLqHQ
         aCGV1m6uScZgQeEpCO/CrjjPb7VLm3VE5U39hsG07W+vXlJc+6IDqWQWK9uSMwkBq+22
         YVLxt0rt576HOSJCCB5zI/Ib8n18dexTevRnVqrbHKWE+1ZdikdFcnRf79zEIOYqdPZm
         eL3KZwY2uiDXHwEOO0gpc3LNLmYQ9gtwPMneuimYorvsBK9AF9+nDSL14QRgv7RnLEHI
         1t5GrwAfqClpucpgE81S6n65llQrR4LEYpCz5SUvOBP1OKXv4vA5ulmvM7iMGE7PsMrh
         4NKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzATFLpkCn9C878/ysy0n0PX0wQTy4dp6XZ6UWngBsRJKfdqMRgp9SsMbq0EQ9/v0ejFTCajD5AYj6qh6/JQjE=@vger.kernel.org
X-Gm-Message-State: AFuF++k8a5I0UGmaGMZH4ni0tBOlUL3Zc0ILhmbK/A75JnKtofs/WrQ6
	iwDomSO1NtXnijvo24q7DfI8PDLT5ad6QtUztSm62woxk5o5Xwam9wSBKEvUL2KfLvC733NXFdK
	pl6kRGBpkxh6MrsX0jKzI0LSk6szmPFw=
X-Gm-Gg: AYBFou3Cs0AlVoAL84TAm7lqrRUdXNiq38pvgey8Kj40CziXdLq+vDZ/j3rHvq3dMEM
	tjpnidbvAuHC5MVDOm0oHQ3RZ8klLFGigay1AnLv6eiKDHy8v8IjwqPbo/NF4Woi/X/vhxESe39
	tiuZ4z0lHfTT/2f7MYs8t0nWcvOm4jpsjVjVU9U20Q5glH/BhVUyYQp6r/28TWsdDOIPQwdXB3Q
	wU7iLdJyAEKrskXHE7CIZIJg22Ze/G1DjthS3Pg2l8UExRtxsRuYRxI3owZEoOXIJbc7uOxLqXn
	ChppHMaTe44KUAdMLlcJYkkJmLRdDJeOPJEWaFI+TLGcBVsylb8uYllutwS7MTIlhlN9v4NAukL
	3CBexVS6baqY9QIH/MHg9KfQVKfK3bOF0cHPJCCMe
X-Received: by 2002:a05:7301:18ad:b0:34d:de2e:1fca with SMTP id
 5a478bee46e88-3514e2e98f9mr1134349eec.21.1791279976246; Tue, 06 Oct 2026
 02:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-lockdep-kunit-v2-0-36a6fec9f72e@gmail.com>
 <20260824-lockdep-kunit-v2-2-36a6fec9f72e@gmail.com> <205be33b-362d-45cb-b3a1-cadaba87b44a@davidgow.net>
 <CAPB1BzeDC=V+jKZgX-2gucSZs8vOmZBvUgZLS8kTLvWa0x5S-Q@mail.gmail.com> <f6cf93a1-8fce-4d7e-8f77-fd106a05647a@davidgow.net>
In-Reply-To: <f6cf93a1-8fce-4d7e-8f77-fd106a05647a@davidgow.net>
From: Malte Wechter <maltewechter@gmail.com>
Date: Tue, 6 Oct 2026 11:46:04 +0200
X-Gm-Features: AclHuK-CljIdbsec02xfGxJW_w2gwuU9ArkS3KoUg9IfcQTsAOVoCO6znrXRlME
Message-ID: <CAPB1BzeT=CLjhTotYz8tX2JZEvGSgfK7eEHEKTm1wv=q28PpOQ@mail.gmail.com>
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

Hi,

- I was actually considering this as an option, and as you might also
believe, extending KUnit with a test case that is guaranteed to run
before any user implemented a test case, might be too complex of a
task.
- For the taint i could implement the inverse of `test_taint(flag)`
that simply checks that no taints except `flag` is set. Or it could be
tailored specifically for the `TAINT_TEST`.
- And for the case where the kernel becomes tainted somewhere in the
middle and starts skipping unit tests, it is a rare case and would
require more work to be able to distinguish between a KUnit test
triggering a taint/lockdep or somewhere else in the kernel. I believe
this is important to recognize and document, but the change is still
good even with this edge case present.

Best regards,
Malte :)

Den tirs. 6. okt. 2026 kl. 08.47 skrev David Gow <david@davidgow.net>:
>
> Le 01/09/2026 =C3=A0 19:02, Malte Wechter a =C3=A9crit :
> > Den tirs. 25. aug. 2026 kl. 13.00 skrev David Gow <david@davidgow.net>:
> >>
> >> Le 24/08/2026 =C3=A0 21:32, Malte Wechter a =C3=A9crit :
> >>> add pre-defined KUnit test suite and test case that asserts both
> >>> `debug_locks` and `TAINT_WARN` prior to running any (user) KUnit test=
s.
> >>> This asserts integrity before tests are run.
> >>>
> >>> Signed-off-by: Malte Wechter <maltewechter@gmail.com>
> >>> ---
> >>
> >> I'm not quite as convinced by this as I am by the first patch. While
> >> ensuring the state of the system is good before tests are run is usefu=
l,
> >> this does seem a bit heavy-handed in some respects.
> >>
> >> This could probably use a more detailed description, particularly
> >> describing why such a test is useful, and why it would need to be
> >> implemented in a special way.
> >>
> >> And I do think the implementation here is a bit _too_ special-cased. O=
ne
> >> other possibility would be to prepend this suite using
> >> kunit_merge_suite_sets(), so we don't need to have any special handlin=
g
> >> of (e.g.) the test count. This could also allow this special suite to =
be
> >> filtered out (which has both advantages and disadvantages).
> >>
> >> It might also be nice to have this configurable independently from the
> >> other checks, and maybe at runtime (via a KUnit module / command-line
> >> parameter), particularly if this can't be filtered on. And, as before,
> >> this definitely needs to be documented. People need to know how to
> >> enable it, and where all of these extra results from tests they didn't
> >> enable came from.
> >>
> >> Thoughts?
> > I get your point, the purpose of this special test suite is to assert
> > that the kernel is in a "fine" state before any unit tests are run. If
> > this
> > check is left out the false positives could occur if the system is in
> > a bad state before the tests are run.
> > The reason that the case was handled differently compared to other was
> > because this assertion _must_ be run before any other tests,
> > and when kunit_merge_suite_sets() is called from kunit_run_all_tests()
> > it also filters the test suites, which would not give any guarentee
> > that this
> > special suite gets run first.
> >
> > I do agree that this initial way is maybe a bit coarse, and i will see
> > if i can find a better fit for this assertion. But i dont want to
> > leave it out.
>
> Had a chat with Andreas about this yesterday, and we think we've come up
> with another possible option here: instead of doing one check to verify
> the state before any KUnit tests are run, have an option to check the
> taint before _every_ test, and to skip it if the kernel isn't clean.
>
> There are a few consequences of this:
> - You'd need to be able to mask out taints you don't care about,
> especially TAINT_TEST (as without it all tests but the first would
> fail). Of course, that might still be useful if you really want to
> ensure isolation between tests (e.g. --run_isolated)
> - If the kernel is already tainted, and so all tests are skipped,
> kunit.py should report 'no tests run' as an error. I think this actually
> only reports an error if no tests are executed at the moment, so this
> may need looking at.
> - This will trigger if the kernel is tainted by some other part of the
> kernel either between KUnit tests, or in another kthread. However, in
> this case, the results will look like a series of successful tests,
> followed by skipped ones, with no failed tests. (And hence won't trigger
> a failure exit code from kunit.py). This is likely to be incredibly
> rare, but we could add a fail-on-skip option or similar if needed.
>
> Thoughts?
>
> Cheers,
> -- David
>
> >>
> >> Cheers,
> >> -- David
> >>
> >>>    lib/kunit/executor.c |  8 +++++++-
> >>>    lib/kunit/test.c     | 30 ++++++++++++++++++++++++++++++
> >>>    2 files changed, 37 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
> >>> index b0f8a41d61d36..0db67fe7f09f9 100644
> >>> --- a/lib/kunit/executor.c
> >>> +++ b/lib/kunit/executor.c
> >>> @@ -290,9 +290,15 @@ void kunit_exec_run_tests(struct kunit_suite_set=
 *suite_set, bool builtin)
> >>>        size_t num_suites =3D suite_set->end - suite_set->start;
> >>>        bool autorun =3D kunit_autorun();
> >>>
> >>> +     #ifdef CONFIG_KUNIT_EXTRA_ASSERTS
> >>
> >> Nit: Let's not indent the #ifdefs.
> >>
> >>> +     size_t num_suites_plus_extra =3D num_suites+1;
> >>> +     #else
> >>> +     size_t num_suites_plus_extra =3D num_suites;
> >>> +     #endif
> >>> +
> >>
> >> I'm not particularly happy with this way of adding an extra suite.
> >>
> >>>        if (autorun && (builtin || num_suites)) {
> >>>                pr_info("KTAP version 1\n");
> >>> -             pr_info("1..%zu\n", num_suites);
> >>> +             pr_info("1..%zu\n", num_suites_plus_extra);
> >>>        }
> >>>
> >>>        __kunit_test_suites_init(suite_set->start, num_suites, autorun=
);
> >>> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> >>> index 99773e000e1b7..e64c6d1575280 100644
> >>> --- a/lib/kunit/test.c
> >>> +++ b/lib/kunit/test.c
> >>> @@ -835,6 +835,30 @@ bool kunit_enabled(void)
> >>>        return enable_param;
> >>>    }
> >>>
> >>> +#ifdef CONFIG_KUNIT_EXTRA_ASSERTS
> >>> +#define DEBUG_LOCKS_OK 1
> >>> +#define TAINT_WARN_OK 0
> >>
> >> Not totally sold on these #defines: I think I'd prefer to just have th=
e
> >> literal 1/0.
> >>
> >>> +
> >>> +static void pre_kunit_assert(struct kunit *test)
> >>> +{
> >>> +     KUNIT_EXPECT_EQ_MSG(test, debug_locks, DEBUG_LOCKS_OK,
> >>> +             "debug_locks are off before any test ran");
> >>> +     KUNIT_EXPECT_EQ_MSG(test, test_taint(TAINT_WARN), TAINT_WARN_OK=
,
> >>> +             "kernel already TAINT_WARN tainted before any test ran"=
);
> >>> +}
> >>
> >> If we are going to generate a special suite, let's have the taint and
> >> lockdep checks as separate tests.
> >>
> >> This would also make it easier to have them be configurable separately=
.
> >>
> >>> +
> >>> +static struct kunit_case pre_kunit_assert_cases[] =3D {
> >>> +     KUNIT_CASE(pre_kunit_assert),
> >>> +     {}
> >>> +};
> >>> +
> >>> +static struct kunit_suite pre_kunit_assert_clean_state_suite =3D {
> >>> +     .name =3D "pre_kunit_extra_asserts",
> >>
> >> I think we could probably find a better name for this.
> >> "initial_system_state" or similar might be better?
> >>
> >>> +     .test_cases =3D pre_kunit_assert_cases,
> >>> +};
> >>> +
> >>> +#endif /* CONFIG_RUST_KUNIT_EXTRA_ASSERTS */
> >>> +
> >>>    int __kunit_test_suites_init(struct kunit_suite * const * const su=
ites, int num_suites,
> >>>                             bool run_tests)
> >>>    {
> >>> @@ -857,6 +881,12 @@ int __kunit_test_suites_init(struct kunit_suite =
* const * const suites, int num_
> >>>        }
> >>>        static_branch_inc(&kunit_running);
> >>>
> >>> +     #ifdef CONFIG_KUNIT_EXTRA_ASSERTS
> >>> +     kunit_init_suite(&pre_kunit_assert_clean_state_suite);
> >>> +     if (run_tests)
> >>> +             kunit_run_tests(&pre_kunit_assert_clean_state_suite);
> >>> +     #endif
> >>> +
> >>>        for (i =3D 0; i < num_suites; i++) {
> >>>                kunit_init_suite(suites[i]);
> >>>                if (run_tests)
> >>>
> >>
> > Best regards,
> > Malte :)
>
