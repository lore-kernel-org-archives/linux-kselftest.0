Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FA7394486
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130202; cv=none; b=KXx4qxV1CINqa3Hpgo65WnUI81RWHZHHv8yaY0/A9HRt5yvXH/LS2lF35XtD1iYf6L6xh8C/4EDPU0d8nVneR2E72/7BO0wAxS80uuy+fR/KqoeWZkZCbRMy3I7DjMdYQMzRFlX1mcND7c7pqG0c+gV45iaVV8XwieNpqOmJZiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130202; c=relaxed/simple;
	bh=E74u0jGKKgScJhcG7CywPv/BLC9ROHC/CDFNoVIFw7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+qQexQfNXG4XAb4StVjbMtcZxof0BnU46zCINlfvEAsWXYIx7ovgZVj8jzrVE7NAlZyGqgwTsX2vx9znLIb3xMdlJvHCkrBGBc5T0ELoUoRjBrHwgsekwCORBWnL1PhBN6wSUKSLIZPE86b7GSxVkDgxqS32lWPciCaZI4JxVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5AIFHQo; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5AIFHQo"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0c09bb78cso7474905ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Feb 2026 06:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770130200; x=1770735000; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IVDd3GBOvMzVD83UrS8KsxUCcTMuzQYNfiw90DmWGMc=;
        b=T5AIFHQo1n1PQhTtZwlqomvl+CD9z/i3CKDIq9fJTizIE5tUAT9PKVfPkn7phgUxMT
         5mqIGxkTIk5c1DlYMTHcD41U13FIC9A3/9XPt6nIyxcs4Kh2grF007HIvucqsJHTAnyA
         PA8riNoW6p8XXalKw+JXM3siXTRZakQLC0Oq6A5h3X1kEp5hnz1EKtJb9QGGgDu5ekRU
         0dHYH8BaYYr9RS58n9S6FpAV2umCIyiLyrJb134LdJubBQiXLLZflN/oVMPtqQCVsJda
         o26XD/85rdUEkecRmMZTz6VuDPxytkZmcFTLvtJ1qE2xwVig0L3HwNNOZGq8MzubsJ3s
         vGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770130200; x=1770735000;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IVDd3GBOvMzVD83UrS8KsxUCcTMuzQYNfiw90DmWGMc=;
        b=PsLmpLHo0dW6gjVcgfgxWen3zadXuNVetJlwyOVxdwp4kQawJzwL+FgyQ89Ew+l48t
         gvEFSZhaWOtqIm8qN0mJMeCEIoK992KDgy2hVdO/u93Ex1H5JRdmA5aMUvJ6/sHQmF1G
         U0qHP5m7rR8QRFJOB6vNi6hYU87bWHuxRLAGniAbmbOChzcTuzWdVdqEdyu3OqDm/4M6
         NJ2/31ku7jZ6gMBAkFAsO3dcg+OSEzQFqVYjYqxyiPKYUqDVKXJ4iPoy/qKbwxr3GEz2
         QjQzL5JXe4kkpRHLq+pSCnj9jsMlg0rr2LoQ52baA6sjMrY4JJ9Z+twsRUYoq0Yuu2Xn
         X+9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWg2QVVJg5b37wiINqFqGGx8yIXdIHR0DA3GH9jUHGey7oalOtsoY1fyeh/ZNhAgwF/S2jYbyErIAWAr9yrJY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw8OdqodMdaNTiAVG/2LISR0grPK3+GD2XN2GpFz9xkbFeQi9j
	jIp/gKtNlI/lQjXOdE7RBdECER6S6OR7daWapWS59Uw8ntmrjtnERnWu
X-Gm-Gg: AZuq6aJxZEqR8/wlGTVi86zMVz7xnETJHY+ncrjnX1YXmgVNwqM8KgJD2UgsK5M8Noa
	f0FXe9oECM6uqLT2g8e/r+a2qcMC29oDiVa2b9SNwlTbY+HP3F1K2aawgPjoNDs8bV8lAVuSrCl
	EZjZ9wDyOGZ1idI8tvu5uvJtpFf8eYPMEGqsYk2YxBRup8Co3crghUT7P4jIq3suPa58NHffS1i
	XSiv0RQI4pUQfcEDixOgZ0rTEt1eUOWssoSYpsXfvKTozT40V92SaeL/Aw+C3QdU2+h8Q+cJWCF
	/e5SE9ajIESO2R8Ngaio8Nd5GI6JgMfW7d633ljZaIqSmyyzSOymFyliWyjPBdPgfz+IuMlAG4d
	WEiKf+d0inAx5rzlJ0+d1XCgN2CjK1XW0B2d2OyXsF0qhqK5GS2EOOViLbNgPRZpRy7pF8ZZUQU
	YkT7jw6JFhHiFPrOcabDuFDtx/soUjNCqdGSo=
X-Received: by 2002:a17:902:ef12:b0:2a7:5f26:aaf9 with SMTP id d9443c01a7336-2a92465d24fmr31324055ad.14.1770130199997;
        Tue, 03 Feb 2026 06:49:59 -0800 (PST)
Received: from google.com ([2402:7500:479:35ee:e4d3:f3eb:beee:73a1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9281585d5sm34101205ad.87.2026.02.03.06.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 06:49:59 -0800 (PST)
Date: Tue, 3 Feb 2026 22:49:54 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Titouan Ameline de cadeville <titouan.ameline-de-cadeville@epita.fr>
Cc: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"kunit-dev@googlegroups.com" <kunit-dev@googlegroups.com>,
	"davidgow@google.com" <davidgow@google.com>,
	"raemoar63@gmail.com" <raemoar63@gmail.com>,
	"kees@kernel.org" <kees@kernel.org>,
	"eleanor.lin@realtek.com" <eleanor.lin@realtek.com>
Subject: Re: [PATCH v3] lib: math: tests: drop unnecessary KUnit param_value
 casts
Message-ID: <aYILEnkE6ZV90HCe@google.com>
References: <20260203083608.29109-1-titouan.ameline-de-cadeville@epita.fr>
 <aYG5YsZF6w0RJZpM@google.com>
 <PAZP264MB276566C20A6B2AF39554339BE49BA@PAZP264MB2765.FRAP264.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAZP264MB276566C20A6B2AF39554339BE49BA@PAZP264MB2765.FRAP264.PROD.OUTLOOK.COM>

Hi Titouan,

On Tue, Feb 03, 2026 at 11:05:30AM +0000, Titouan Ameline de cadeville wrote:
> Hi Kuan-Wei,
> 
> Thanks for the warning,
> I’ve resent this as v4 without email address mismatch.

Please avoid top-posting.
Also, please ensure the email is sent as strict plain text, without
html or base64 encoding.

Regards,
Kuan-Wei

> 
> Best regards,
> Titouan
> ________________________________
> De : Kuan-Wei Chiu <visitorckw@gmail.com>
> Envoyé : mardi 3 février 2026 10:01
> À : Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
> Cc : linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-kselftest@vger.kernel.org <linux-kselftest@vger.kernel.org>; kunit-dev@googlegroups.com <kunit-dev@googlegroups.com>; davidgow@google.com <davidgow@google.com>; raemoar63@gmail.com <raemoar63@gmail.com>; kees@kernel.org <kees@kernel.org>; eleanor.lin@realtek.com <eleanor.lin@realtek.com>; Titouan Ameline de cadeville <titouan.ameline-de-cadeville@epita.fr>
> Objet : Re: [PATCH v3] lib: math: tests: drop unnecessary KUnit param_value casts
> 
> Hi Titouan,
> 
> On Tue, Feb 03, 2026 at 09:36:08AM +0100, Titouan Ameline de Cadeville wrote:
> > Drop unnecessary casts from KUnit parameter access since param_value
> > is a void *. This improves readability and follows common kernel style.
> >
> > No functional change.
> >
> > Reviewed-by: David Gow <davidgow@google.com>
> > Signed-off-by: Titouan Ameline de Cadeville <titouan.ameline-de-cadeville@epita.fr>
> 
> checkpatch.pl reported the following warning:
> 
> WARNING: From:/Signed-off-by: email address mismatch: 'From: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>' != 'Signed-off-by: Titouan Ameline de Cadeville <titouan.ameline-de-cadeville@epita.fr>'
> 
> total: 0 errors, 1 warnings, 0 checks, 48 lines checked
> 
> Regards,
> Kuan-Wei
> 
> > ---
> >  lib/math/tests/gcd_kunit.c      | 2 +-
> >  lib/math/tests/int_log_kunit.c  | 4 ++--
> >  lib/math/tests/int_pow_kunit.c  | 2 +-
> >  lib/math/tests/int_sqrt_kunit.c | 2 +-
> >  lib/math/tests/rational_kunit.c | 2 +-
> >  5 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/lib/math/tests/gcd_kunit.c b/lib/math/tests/gcd_kunit.c
> > index ede1883583b1..b9c9b8758991 100644
> > --- a/lib/math/tests/gcd_kunit.c
> > +++ b/lib/math/tests/gcd_kunit.c
> > @@ -34,7 +34,7 @@ KUNIT_ARRAY_PARAM(gcd, params, get_desc);
> >
> >  static void gcd_test(struct kunit *test)
> >  {
> > -     const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
> > +     const struct test_case_params *tc = test->param_value;
> >
> >        KUNIT_EXPECT_EQ(test, tc->expected_result, gcd(tc->val1, tc->val2));
> >  }
> > diff --git a/lib/math/tests/int_log_kunit.c b/lib/math/tests/int_log_kunit.c
> > index 14e854146cb4..9f9b48232701 100644
> > --- a/lib/math/tests/int_log_kunit.c
> > +++ b/lib/math/tests/int_log_kunit.c
> > @@ -43,7 +43,7 @@ KUNIT_ARRAY_PARAM(intlog2, intlog2_params, get_desc);
> >
> >  static void intlog2_test(struct kunit *test)
> >  {
> > -     const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
> > +     const struct test_case_params *tc = test->param_value;
> >
> >        KUNIT_EXPECT_EQ(test, tc->expected_result, intlog2(tc->value));
> >  }
> > @@ -52,7 +52,7 @@ KUNIT_ARRAY_PARAM(intlog10, intlog10_params, get_desc);
> >
> >  static void intlog10_test(struct kunit *test)
> >  {
> > -     const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
> > +     const struct test_case_params *tc = test->param_value;
> >
> >        KUNIT_EXPECT_EQ(test, tc->expected_result, intlog10(tc->value));
> >  }
> > diff --git a/lib/math/tests/int_pow_kunit.c b/lib/math/tests/int_pow_kunit.c
> > index 34b33677d458..ef9c8a9bd8ac 100644
> > --- a/lib/math/tests/int_pow_kunit.c
> > +++ b/lib/math/tests/int_pow_kunit.c
> > @@ -31,7 +31,7 @@ KUNIT_ARRAY_PARAM(int_pow, params, get_desc);
> >
> >  static void int_pow_test(struct kunit *test)
> >  {
> > -     const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
> > +     const struct test_case_params *tc = test->param_value;
> >
> >        KUNIT_EXPECT_EQ(test, tc->expected_result, int_pow(tc->base, tc->exponent));
> >  }
> > diff --git a/lib/math/tests/int_sqrt_kunit.c b/lib/math/tests/int_sqrt_kunit.c
> > index 1798e1312eb7..9c46024b0fc1 100644
> > --- a/lib/math/tests/int_sqrt_kunit.c
> > +++ b/lib/math/tests/int_sqrt_kunit.c
> > @@ -45,7 +45,7 @@ KUNIT_ARRAY_PARAM(int_sqrt, params, get_desc);
> >
> >  static void int_sqrt_test(struct kunit *test)
> >  {
> > -     const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
> > +     const struct test_case_params *tc = test->param_value;
> >
> >        KUNIT_EXPECT_EQ(test, tc->expected_result, int_sqrt(tc->x));
> >  }
> > diff --git a/lib/math/tests/rational_kunit.c b/lib/math/tests/rational_kunit.c
> > index 47486a95f088..b05587a1e90a 100644
> > --- a/lib/math/tests/rational_kunit.c
> > +++ b/lib/math/tests/rational_kunit.c
> > @@ -33,7 +33,7 @@ KUNIT_ARRAY_PARAM(rational, test_parameters, get_desc);
> >
> >  static void rational_test(struct kunit *test)
> >  {
> > -     const struct rational_test_param *param = (const struct rational_test_param *)test->param_value;
> > +     const struct rational_test_param *param = test->param_value;
> >        unsigned long n = 0, d = 0;
> >
> >        rational_best_approximation(param->num, param->den, param->max_num, param->max_den, &n, &d);
> > --
> > 2.44.2
> >
