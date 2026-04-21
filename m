Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85AB38422F
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 08:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776761415; cv=pass; b=XuLCc48S9zqDSL15Naq9/meOAIFs39MHjhwK1fermvacFkW2OCgq0vUdDkgqaa3MQucAakQWNa1d3ZSuOvKiRV0N/72W5n6My6zRVPPfM/bQ2vGDOrj8RCtTAKHvISxunEderktZ46zwXsqZWfqduLGyfDbpnyvTk45+Rq7emkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776761415; c=relaxed/simple;
	bh=xs2N39HHM6PqtgrRMGSJFnO7luxy+UhyOqy82YwC1R8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VnLF2HdWZI4EtdAHz4pH/AGXdzJNsnDmQ6TledV5wAIIVcC98gQZRx9B+1y4UqntGcYq4XQycr5YZdSvWGzL7QU0gueJpu8WpXzaKHGTB98zrmDMqlo5KmwQXCv7tSF+SmUg4aB4Z5MGB6lI4iYqF0FQ4V4NG9sXC6hkSITZeBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=an4JMKCf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DLWPZtud; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="an4JMKCf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DLWPZtud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776761411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLkS/Ta9vRJDH5KioddXAEgwRVTq9xjtMihkgqxZ3KQ=;
	b=an4JMKCfL9X6mLxbOWv2fmZhXnnUKbMQYTcMXwSSpCJoJCksiHvjThxIb714+/hkojUKm2
	stshGysuN0NvsxHaeOe+Q7RzYEogYeGS24EaReeuIItS3M7mZ1OXPUMiNYXDox6mPQOLIc
	2fLMMzUgGfWDBNPkyjcW7mUdfOtX0vM=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-rj4NgCkRPgutS5BKQ2LSWw-1; Tue, 21 Apr 2026 04:50:10 -0400
X-MC-Unique: rj4NgCkRPgutS5BKQ2LSWw-1
X-Mimecast-MFC-AGG-ID: rj4NgCkRPgutS5BKQ2LSWw_1776761410
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7a45cf7ff24so64685197b3.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 01:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776761410; cv=none;
        d=google.com; s=arc-20240605;
        b=heEa5VhUaYGDSNFCrDXYp37NfQyzlAVKhPdgcYGk6pL+QAK+pWzZO9neir+3BxyziF
         DjvOP99i0bQZAbO73yXIoJru5zQLXsdQZdTEgyd1VHVIpKjvVGFjYZ4AHhUHrMl7frBD
         bCzf/g6L9dBvDkczEspyM5wohmsxxmt5QU744XO+6TGVi5IfDnhsxv6Bfl1qmmG3O52Y
         QGtpvxxpY1x+j8bbq6IuhFKCibMwH2nLxjJInKxq2M84XHHL9Pf+elX0Soa1vUPKur1X
         w8/4Ep/aZsr4VeU7V7U7ZIaYyPLT3iJhRt3v5OjFYtdtPx4zIHW2qWknFnPxgJLZpHFF
         wE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZLkS/Ta9vRJDH5KioddXAEgwRVTq9xjtMihkgqxZ3KQ=;
        fh=a4PVgJLpk4v5QNVVy8Ei9wkh5w4IsPUmex0+82SLzNE=;
        b=iyRUIspOb3x98De/DemNZDAmp+uvEy+r//F61LwQVAH4x2qvZ83+4257WKRHXjl6gF
         SxkKS1ahliv/M4kQPvMV1+ccdle/aAm3Q/zvYyJcrA82o9MYduXKSlyfWDvuGSzj49hA
         d8Vh0q75sqibcfUsuKSBG1F8pxAEG3FzGf8hEvKfTZxo+uR7CM3UkY8IBRosVCqnz0k4
         fOAr8/q1ZEOswOR4I+aqHAZXbAiXdlGW1eHGHiFejxShKDPrqsojNEUSgpOwHH+Mo3Ua
         nOefIHiFJknLX+aXMasACDs5PL7VDO8LkY1v7Ms72UAsOFWKKC4bwspiAWHrCcCT6iFg
         zbUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776761410; x=1777366210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLkS/Ta9vRJDH5KioddXAEgwRVTq9xjtMihkgqxZ3KQ=;
        b=DLWPZtud7iL2OqOU4xQvCVQetOMkZ8xXfcTv/ioIwv5L0uhrmTBuaba1JNLfc61PTI
         6MEFRpkla/7ceyeAVIT9Oh5ymrzC/fQUgKdDzaa/7xSQdotalga+rOKUQy40peUmr+/u
         b6r9853w0/jMZo2bnmFwBSuAIjUIzVVax3O2NCsDZtoquO7Hq2bZnAIqJVrWpv+NFZgu
         b5Y6HVVXrYoSRmdxlGP5KRwLwIYcjSE8EEmJB10E1EW3DvzFVmepZhRd/DkS6bN+qyY4
         P+oJ/mBTU7n2UPC6R4+uG3C1NHEHyqgcajCqbd70VrrexRPSgyUozFiH0ZVQ+mF9v/TC
         HtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776761410; x=1777366210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZLkS/Ta9vRJDH5KioddXAEgwRVTq9xjtMihkgqxZ3KQ=;
        b=MD0olUkbRwutfe54LRFxXaGomlwGlGg6HZbSs1P3Us5LQrppt6aBVAD7/6zEA/GHzj
         2SRsvv6PTBWHbF3S9B2ae9+y/wzK1IbhFw9ku0O8dJT6zZAkOE314aVd+pe+yS5XxPFC
         D5BeCojW8jbmRXziaFoH7ThVWZrCXAgQOpjlXPEsMbGalz5BJzEac2aHSrQHf5M+1gzq
         kZV/KpQBkJzdtoJMZr9qEGCWyIU4uK0ARIOAZBoFV++2Ea9dZ00P50j6eIMzIDc/b/AN
         gOjNFbaqiCPw3g0w+LGHHND2R2HEskvHQYtyQDGZgbiGWTGhvlKtkCXgZGllzncnh4d/
         xcFQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EqX4Iw4qtNOCVyexCAX4cpi9wPoItT/+MlQRmGUAH0j5OStuItw9f2CdUzVww10o4UBVuS8pXesDhxXPu/yM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1RK72vCA7zH5PIVNHhbXypA4dlS8lR0S7URQhuZiLjKNQDp2M
	CQeH1gkT08K4VRwfOEkRvRd50cBsh4ehjD4HmVZA48arwipUmNL5NE6fgLI8xPA1FcZCyuCIJ2d
	LcGenaS3u4nTRCQDrik9E9RGAO8OnkywQGJgekD/Wv1F+sR2bibFe3nMNwNU3p9PxP+RtdboKhw
	v8v4NhNPebEPpZuZvzVP/OE+oy/Dm8AWIWP7EqpzejJN3h
X-Gm-Gg: AeBDiev0t/nzPWASkZi+EmV0p/31RTH+gqoCdZJV8YkU4I1BSUGOtjqZLyHjzV+lLbY
	tmauWFZacq+XvV35yCgGjQwjYQXGyjm5sf4JAG3MrmIz3DvOcqA/NKR+T414NNGfR1BCHcH5+RN
	g42SuQMYfVakifOiIrLS68o8ijZPKQ3wdW4K2b5uXuRBeU7gjmJ2nsxLrpxFEGn8arS9t9FXLRM
	zmzCD4P+lqoI0+B
X-Received: by 2002:a05:690c:dd5:b0:7b2:9347:7bdf with SMTP id 00721157ae682-7b9ed000a01mr173415487b3.37.1776761410082;
        Tue, 21 Apr 2026 01:50:10 -0700 (PDT)
X-Received: by 2002:a05:690c:dd5:b0:7b2:9347:7bdf with SMTP id
 00721157ae682-7b9ed000a01mr173415087b3.37.1776761409658; Tue, 21 Apr 2026
 01:50:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-4-e8bc6e0f70de@redhat.com> <20260420144702.GM3102624@noisy.programming.kicks-ass.net>
In-Reply-To: <20260420144702.GM3102624@noisy.programming.kicks-ass.net>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 21 Apr 2026 10:49:58 +0200
X-Gm-Features: AQROBzCldOYbfR8ys3ZZ4dkJqQQZYQ8VWy-mBIRFS67smM8o_e_X6azO-SUJq08
Message-ID: <CADSE00JJq6fsYbkFN5hBD=-ZWsFG9p4_C55fp3MupMJQj0QCUQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] drm: Suppress intentional warning backtraces in
 scaling unit tests
To: Peter Zijlstra <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	Guenter Roeck <linux@roeck-us.net>, Linux Kernel Functional Testing <lkft@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Alessandro Carminati <acarmina@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 4:47=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Apr 20, 2026 at 02:28:06PM +0200, Albert Esteve wrote:
> > From: Guenter Roeck <linux@roeck-us.net>
> >
> > The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
> > intentionally trigger warning backtraces by providing bad parameters to
> > the tested functions. What is tested is the return value, not the exist=
ence
> > of a warning backtrace. Suppress the backtraces to avoid clogging the
> > kernel log and distraction from real problems.
> >
> > Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Acked-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/gpu/drm/tests/drm_rect_test.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/te=
sts/drm_rect_test.c
> > index 17e1f34b76101..1dd7d819165e7 100644
> > --- a/drivers/gpu/drm/tests/drm_rect_test.c
> > +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> > @@ -409,8 +409,15 @@ static void drm_test_rect_calc_hscale(struct kunit=
 *test)
> >       const struct drm_rect_scale_case *params =3D test->param_value;
> >       int scaling_factor;
> >
> > +     /*
> > +      * drm_rect_calc_hscale() generates a warning backtrace whenever =
bad
> > +      * parameters are passed to it. This affects all unit tests with =
an
> > +      * error code in expected_scaling_factor.
> > +      */
> > +     KUNIT_START_SUPPRESSED_WARNING(test);
> >       scaling_factor =3D drm_rect_calc_hscale(&params->src, &params->ds=
t,
> >                                             params->min_range, params->=
max_range);
> > +     KUNIT_END_SUPPRESSED_WARNING(test);
>
> Would not something like:
>
>         scoped_kunit_suppress() {
>                 scaling_factor =3D drm_rect_calc_hscale(&params->src, &pa=
rams->dst,
>                                                       params->min_range, =
params->max_range);
>         }
>
> be better?

Since KUnit already has a few macros in its API it didn't occur to me.
Good idea, I like it. And I guess the scope approach matches well with
your __cleanup comment in the first patch. If no one opposes, I will
work toward that pattern for the next version.

>
> Also, how can you stand all this screaming in the code?
>

Again, KUnit already contains many macros, so this use didn't register
as such. Now I will not be able to unsee it.

