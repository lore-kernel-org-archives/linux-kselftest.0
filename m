Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1522D63E5
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 07:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777015045; cv=pass; b=ajCVuyQQtMlIxNv0OvsmXvfpnVQYV7WzKbbwNAeGyDl44hgpHcr8gwo7jNapbc1NJx2lAx7APjT+4MG15Z1waw8nvWI7tHqY1vTWu7zecxgrHEl8whEdrh7/9I6kPUE/BvECb6EPpCnjkM6UFO1wIhDwcWNwyMkledDPEdHaojw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777015045; c=relaxed/simple;
	bh=yClHRF8OjhIxck88Jx+vYcQmNKKejUFC6AKG1u3nJUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p+OLFnbGeYWdT/G49xb98GAPiLD/32cxvf6m/K58efTc+yDEKsE4RTdWmZ5gH16L6LfzL2hnRZUJ80BzS+8MwGoHPnEH+iUy4SlSmEjzxKHiswwJNhp+kiLMhgxNAgJKV5imRa+di4sjo2MWuOAKC8ykXMfDrcAz3a0Gohk02Ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VhMgJcif; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RYGFxIrY; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VhMgJcif";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RYGFxIrY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777015042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ocRQwsGxmUd24plQscvID6P4Yrryzt44ghQQY2RzSsk=;
	b=VhMgJcifyfNzMNRBZNOywJiItloosTs0tP3paQ5MkRNa+7BomKUWKMFR8rUkM3HTxOJaxP
	h6SlcaehQdPBDl11rsW8hUVH3ZGfnK0e7M+R5Buz3MifEeIZru7rH04kk0mc3mT9cZ79AJ
	Mpx63iHhR+MBVcGHrJFe/Zd8AEHt5dY=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-iTe4Mgd3ONeYL_jbDP9q_Q-1; Fri, 24 Apr 2026 03:17:18 -0400
X-MC-Unique: iTe4Mgd3ONeYL_jbDP9q_Q-1
X-Mimecast-MFC-AGG-ID: iTe4Mgd3ONeYL_jbDP9q_Q_1777015038
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7a5f9d43c48so72420187b3.2
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 00:17:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777015038; cv=none;
        d=google.com; s=arc-20240605;
        b=XO9GoD/8jm/dpSMPbcIhXO/eMq2PS6tW29cdlIllvPpTzsoGtbyW6/5MflMgGx9P5G
         q6/CXtI6ZzzIcRVoZa6hsrig807NNL1vmWYZE/DudOgh/F9z2Ls1ycLBgvogDcFQfZha
         59QBDR+MKvrpEPWVEp6gbyXkRxovuuUmXsPBHrKtWYrhJvRMCmLdCXdMAaNSlbDBnPau
         +H5kXiI+yNnqS3EkGZb9XGnRBCPVTkGWzx1WKyyIx3pa7RMlVEjPINjp3zJ4maLpnX2m
         QZSwVl9/wiqWv38NRX40Apd3/2ps48FDkKSLnBIhelp1fMm0QYMREcyIfWprUZrtXRca
         on7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ocRQwsGxmUd24plQscvID6P4Yrryzt44ghQQY2RzSsk=;
        fh=6q4bTgI7jl3mefvdXtLvyAnxl9M8rBCQ0hDkBG4C+mI=;
        b=I/cLypIDC0ua9rm5onJEVeHfOrcViju9IE62QkeilJd3VkNXC3o+0QuHT1pq5hK22z
         I9xFGBB21N4zksDcB+FcIwcpTc4NhWohZF3KA3M0I/eFaqLiVS8K4FiBz1Ztct27Wlmi
         TRM6hXkgPxFu+58mroOZPWlwXUyDBhSxUSeWIp2tRWU/ZLbmpnl7VCLJ4eW1wNTi4OKb
         1tC+KgSDlL1RxYrv3NwZw99pbXz1RMuIF1+6T3gWN3qimZ36n5H2LBSupZl6bClJkHfe
         eHSMT78A8Zp5wEyC1bp+DVjTlNv3Td5KOGTpG0niRZc4+7kjPdhHkjRTCeYldSdaPcTP
         +zjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777015038; x=1777619838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocRQwsGxmUd24plQscvID6P4Yrryzt44ghQQY2RzSsk=;
        b=RYGFxIrYmkdPH5H6sCnbRVAiE21g7fScoKvsLDZjrODthL/MNFbzmR0zDYAz4D0JEU
         3VF8Ypl6Xua84ndVEP9DtGOKMuIDvDY+BgSIX7cB/ExtidMYVDyzplilORHQreGfdIoG
         uprang6fhniPd7CGuEpa+tcq8zU42mmV7eQMpQZEaZM6yBkUBjb+svkh8Zlyu5XtjJiE
         RXhVE+99TjOvYdQ5QTZgyUM8S2G/e4kVe6PPDB/ny0/QMLfjGC4CqGGqPNGbDR2hQsns
         DQaBpYjDwFDqhp80jX4gI58zrf250ID6XU3o/mULjqqz3JZ8Cjn/3fXNBHDrW7wmyRvx
         vv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777015038; x=1777619838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ocRQwsGxmUd24plQscvID6P4Yrryzt44ghQQY2RzSsk=;
        b=bDl2USsilKmG2mpbQjVrvf3ZviMOm4OhYULu87g3seTZJ7WJEZXs5Mv5PLhWaUDtSJ
         ALD4S7MUHdciFY69ZVGuY36wofeqtXICUsz5+5Mc9Vdi4p5QJpprFZSY7n2MEWA9BYGs
         DCYGE3j7ZVC85oyRnHIyejkqYputB5sw435nP1dlO92AVgEWb256435zm3IQC8frsrWQ
         BmLI2cKcvvqwRskcwIpl8UfvG+T+d5b3T7UYN+dLb3S/czSEQM85CUc/JCioYr2VtPh3
         9R4khdy/4rKVuqEoCz4Giy685GibuqQsnJKMxv3Wbe1239uhCy/M+OZye9hqmmz+ORbD
         w5Fw==
X-Forwarded-Encrypted: i=1; AFNElJ+CHQLfbe9zwxfwIIZMOQZeq+qK9PcaLF8HbQuhSD8BhCjLnnTB8EXnthcq1uXtgQ+PSSgMwAKDHBS3busq3Rk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQbGoxrU43noUwzTubnF8gWSw0gvhADo9OTj+uW/fl+JmQsVhQ
	SydFkhYLHLbWo6jJcy++AaJas/AWg9RanNyxC2A7mq+rgQ2yE6hEWid5yggfA8Ixvpk5MnE14Iy
	VwNZ9Ix4qtUd3kBs1p/+jF5zMNIjVpe20iRoH/HSQfIVyUvRWDrMdzGqSxx1M5djdqp5jYnf2Wt
	E7b2dKXplWy0QW3xDn8lTt5FrhtAwmOy81rehWnq3MePc2
X-Gm-Gg: AeBDieuph75NrtlXjPpWyqw1QzAyLfFuhQIs/qZy1NEqIz8tlwZsNlEa260f73DuHa1
	TAeP0tTZ3jV9BwaeizCyi/OAScWrqCP2s7lV2t32mICmyqC3h4HjbjO8/ldp4GloySdcuSwqTAZ
	Q96MJ2E1Y1SfRmIIyzhzYx0GT/tsYLp/k74qTcMurkQlxf0jSbCSxJFu/mUhsKtsSelzD9WTSqu
	BKHQRFA5qHZKGoA
X-Received: by 2002:a05:690c:2701:b0:79b:cf31:9767 with SMTP id 00721157ae682-7b9ece638bbmr313691337b3.3.1777015037624;
        Fri, 24 Apr 2026 00:17:17 -0700 (PDT)
X-Received: by 2002:a05:690c:2701:b0:79b:cf31:9767 with SMTP id
 00721157ae682-7b9ece638bbmr313691117b3.3.1777015037197; Fri, 24 Apr 2026
 00:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-4-e8bc6e0f70de@redhat.com> <20260420144702.GM3102624@noisy.programming.kicks-ass.net>
 <CADSE00JJq6fsYbkFN5hBD=-ZWsFG9p4_C55fp3MupMJQj0QCUQ@mail.gmail.com> <8a9c125c08206296d698c79c3d3dd6aea36a7e3b@intel.com>
In-Reply-To: <8a9c125c08206296d698c79c3d3dd6aea36a7e3b@intel.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 24 Apr 2026 09:17:05 +0200
X-Gm-Features: AQROBzD6yZWbejVMF7ldH8G24-m4djSD1N4zfjIlQ_Qh0r0EH3w2r9AAFZGj5x0
Message-ID: <CADSE00+b-8moX5FkLjLs+wzyaW5dtJDMxvTT6Gu-QmDoDxJdVA@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] drm: Suppress intentional warning backtraces in
 scaling unit tests
To: Jani Nikula <jani.nikula@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Alessandro Carminati <acarmina@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 1:51=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Tue, 21 Apr 2026, Albert Esteve <aesteve@redhat.com> wrote:
> > On Mon, Apr 20, 2026 at 4:47=E2=80=AFPM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> >>
> >> On Mon, Apr 20, 2026 at 02:28:06PM +0200, Albert Esteve wrote:
> >> > From: Guenter Roeck <linux@roeck-us.net>
> >> >
> >> > The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tes=
ts
> >> > intentionally trigger warning backtraces by providing bad parameters=
 to
> >> > the tested functions. What is tested is the return value, not the ex=
istence
> >> > of a warning backtrace. Suppress the backtraces to avoid clogging th=
e
> >> > kernel log and distraction from real problems.
> >> >
> >> > Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >> > Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> >> > Acked-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> >> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> > Cc: David Airlie <airlied@gmail.com>
> >> > Cc: Daniel Vetter <daniel@ffwll.ch>
> >> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> >> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> >> > ---
> >> >  drivers/gpu/drm/tests/drm_rect_test.c | 14 ++++++++++++++
> >> >  1 file changed, 14 insertions(+)
> >> >
> >> > diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm=
/tests/drm_rect_test.c
> >> > index 17e1f34b76101..1dd7d819165e7 100644
> >> > --- a/drivers/gpu/drm/tests/drm_rect_test.c
> >> > +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> >> > @@ -409,8 +409,15 @@ static void drm_test_rect_calc_hscale(struct ku=
nit *test)
> >> >       const struct drm_rect_scale_case *params =3D test->param_value=
;
> >> >       int scaling_factor;
> >> >
> >> > +     /*
> >> > +      * drm_rect_calc_hscale() generates a warning backtrace whenev=
er bad
> >> > +      * parameters are passed to it. This affects all unit tests wi=
th an
> >> > +      * error code in expected_scaling_factor.
> >> > +      */
> >> > +     KUNIT_START_SUPPRESSED_WARNING(test);
> >> >       scaling_factor =3D drm_rect_calc_hscale(&params->src, &params-=
>dst,
> >> >                                             params->min_range, param=
s->max_range);
> >> > +     KUNIT_END_SUPPRESSED_WARNING(test);
> >>
> >> Would not something like:
> >>
> >>         scoped_kunit_suppress() {
> >>                 scaling_factor =3D drm_rect_calc_hscale(&params->src, =
&params->dst,
> >>                                                       params->min_rang=
e, params->max_range);
> >>         }
> >>
> >> be better?
> >
> > Since KUnit already has a few macros in its API it didn't occur to me.
> > Good idea, I like it. And I guess the scope approach matches well with
> > your __cleanup comment in the first patch. If no one opposes, I will
> > work toward that pattern for the next version.
>
> There's a catch with kunit and __cleanup and thus (scoped) guards. Kunit
> runs in ktreads, asserts lead to kthread_exit() and the __cleanup won't
> be called.

Hi Jani,

Good point. In this specific case, the actual cleanup is handled by
kunit_add_action_or_reset(), so __cleanup not firing on assert is
harmless.

>
> Warning suppression being part of kunit infrastructure, asserts can and
> should end the suppression too. But setting the example (scoped) guards
> are safe in kunit tests in general feels like a trap waiting to happen.
>

... but I agree it sets a misleading precedent. I'll stick with the
explicit start/end API, then? Or maybe we can clearly document why the
scoped approach is safe in this case and use it.

>
> BR,
> Jani.
>
>
> >
> >>
> >> Also, how can you stand all this screaming in the code?
> >>
> >
> > Again, KUnit already contains many macros, so this use didn't register
> > as such. Now I will not be able to unsee it.
> >
> >
>
> --
> Jani Nikula, Intel
>

