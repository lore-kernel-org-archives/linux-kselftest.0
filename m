Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841F43E0724
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 11:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175449; cv=pass; b=I7yFBK1cVAknHoFvSgHcqItYPkkqOlHFEJAsnzfUsCEUsd99wHG6SYugYQY3fLPo+fRShxF9NHjKpPCkStsXt205b67kjOtbY/4Q0OD7iI7sKAZsPNEUcYBPNL9tPFFN5iIrNTAZ11ZAtMn1EbGPBMrE9npyfa3KnIi2+h8V3cY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175449; c=relaxed/simple;
	bh=C9vgZ5OpqoqCmfcKT8JCoWSmu766g0cDfXH9A/VZNa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WySjCceCwIRZSAAPf7bnZSRloKtZKB3GUD+CHPoYS+FkIJVY/XKcxnFs5jUz2IJl482Ekmw+48phuDQwQ+Mt0c+U3akpvBq9WfCrywJkHmJRnow3WwvTBb2SVdqRKYnNQKdGElHB7SUe+S5Aw7mkD2ZM2Dig1M3srThgB9BwM5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hgx/ukqk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eJyhUWgt; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hgx/ukqk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eJyhUWgt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788175446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GynAiyqKaF7zNIjy+JX3ryfv5HnQb4XBD3qIOpzfei0=;
	b=hgx/ukqkNmmv5f8wtApRngzz+idIRZEVGTjOdXfPj5WOxSrYt2u5lunApwEBaJ/1TOVGtc
	aoSIAQnVtZ8JsT7/pTHT4hDKK8wxpq99q+4AzQ4jB3GYJB/MATSLZCM0mkA8nhQ3n4As8i
	9aiKw2Gb+wOMe6k7GfC0OicT4eboi94=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-y3jqIlevPdyoirX0XwZUgQ-1; Mon, 31 Aug 2026 07:24:03 -0400
X-MC-Unique: y3jqIlevPdyoirX0XwZUgQ-1
X-Mimecast-MFC-AGG-ID: y3jqIlevPdyoirX0XwZUgQ_1788175442
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-86617faa2b2so9330297b3.2
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 04:24:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788175442; cv=none;
        d=google.com; s=arc-20260327;
        b=pUB2xpnrtdxMJACm+07PPWN3Q24xlhaQQ57+hVh9WHrvxSSrzoHFOdEzflySKRaZPl
         A2K9aoPuF6w+7mpOOLKJey/tAZ9kTMe568r2n+XkXLijCi+N5siO31hIS+5HKTNi+ujJ
         RIXgjWuADqsA2W5vPuMdrqsFDqNbWxTyumN4Ouu89j3FQwIj4r9RgTE885NLzO6EjjYk
         giHHwo0xIa9gtOErQP7bslyagCF+Bw2LfcFQmx5INyWQN8yR0ccwZ06jIXbzR0aeo1qZ
         7SgaL+mUk7n+Y0K+FbEF7nBya/nIScJh4thR9EX0yBjrIX643HFtnpmqIoZCLrxrzV24
         TYrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GynAiyqKaF7zNIjy+JX3ryfv5HnQb4XBD3qIOpzfei0=;
        fh=uAlWs3voYgmujwH/OL35NpdNg0xoKL3tZl5znDFK1cU=;
        b=Ho//uTAlmuFiaMw8yZuaTWt3bAFFV+OFLFPYUNQhXW5QD6rMKs0YsE2zW8LwWIVhIu
         k4doWtehkZgq6Qit3squor8e2JMnvQmszP4n3HKjsIOcZjewI+Szqq6FhuRWabvBy8HC
         t3guAa5Z2xh73pN9YiiiF1L75z1aVJE7BGaxyhoFoYmg8A+rK/P1iBVSkFpM4RxQf+sH
         Km7znwSxOffCwUbQzwF089k7IHDYRxSIubeRSxqBEYpjpHu+v6A+5YmRHcrFeQ25pK1U
         Qq5GvzP6+Cz35TnMrgFT1N0+jd/8NKXt2s9tnUKbBFM6Ff7SiIVsmlff+rb46wdfnY1Y
         Ns/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788175442; x=1788780242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GynAiyqKaF7zNIjy+JX3ryfv5HnQb4XBD3qIOpzfei0=;
        b=eJyhUWgtKANGVUW4zMaluleGLmwM3cyd50f70DCIj5dfPFjbYnnuDyoMEhdRVd5XvP
         EU3k/0lEwdIh40wxAi1MbeNH6LErrWtsxJ0Ee+Yn8cN2pDkzWqcdj7YyOhbJmOCIl/Mj
         X7pEAR5tuoA1ocxqFUGd8zmw+CO1XcHAVkuLb/1UNimubyyIANP7wBCO0RTq85Nq0KYP
         aAO1xBSGVLVKz65tYGIP2+PFkM6sxqFgNNjuc7LBDT9IkRIj/SlNlr6oVY/B2rbJ1nDN
         6bkz4liuOBf546AARaIYMRPlHUSxTQxC0zHpnQmnR94F/WEzOzwSocAflXfvHgETG8Qa
         KUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788175442; x=1788780242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GynAiyqKaF7zNIjy+JX3ryfv5HnQb4XBD3qIOpzfei0=;
        b=Is6HX3G5H3TEJlUzxs8IVZIKunTDv/Wj2p1wrpTB1nIPh7LvI8QugUHJmXQQP4CZA1
         pPBqlZv7O0c58Se2EoPIx6H/Dv7GlYq5hVlWejj8E792E8M9pB+IMpNFcic2YQERvR6r
         2HmO6t3BGwwi8wgD231FBSqk1ZGn7KuBNaQ+aPBaQ7n7c9NICSk175qYBFobHNVRwMEK
         eGn2cXDbI4cgOFt+TLJ5N+LxcpSYETHmAdHTY5LKqMX1awS5Trdul6tEr8gew7lzORtK
         KK/HhL/o3Q0rJgZF3rioQKubzothcGTo36UzyoSIoU0QWkYH8L4EeQMSmCd6ordcmR9L
         +NgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCyZsxBvWCon9e6zSyYHY8hHaaiehZo0ZPH2XQMslIjSkbg4H7ZsBh8yviwixir0K8DkiIpJCN2xxe01Ff5ps=@vger.kernel.org
X-Gm-Message-State: AFuF++mVjlNfxh/95YcsZF2TNp+GEWULoLqQsFLqasDexC1hl9NvTpW9
	Z8q7oS3DZKVP0nbylDI/qYXnBjG4MdE5nRev5fGe/kXRb8zdK+KbHTCsn7JLFbZopnJZ3z0pz4E
	jI088olqxJU9HL/ySFVH/dOYeES/ZIGLMOA/QsXS+UnaKcfzONglngXR+eTt9QQCHR6f64IKiFi
	dtFZY0j5R359T1FE0ruOlfVxsqCU5L0TGnuDjOXOZIkBml7Lj2Dwub
X-Gm-Gg: AYBFou3+ZwxzBGKNdaVkicINAtXDIL5nTEzU3fxaz4TRoJLJKztcZBw67PwZC7E+FyE
	LEMpnkOIrnfbqNH6sINAsPIdGZwXHNpz6LfKaq76QGNSlsAyLzs048j8GSbOOWj5jK1breHE4ch
	zV8Q/SxL17JGN8EGcIbfLat+yO1NsjztNhGpBEzyqWy+Cxx8iFBAN+Hh4=
X-Received: by 2002:a05:690c:e3e6:b0:81e:6a10:f90f with SMTP id 00721157ae682-85d6a2e13f3mr94107807b3.17.1788175442392;
        Mon, 31 Aug 2026 04:24:02 -0700 (PDT)
X-Received: by 2002:a05:690c:e3e6:b0:81e:6a10:f90f with SMTP id
 00721157ae682-85d6a2e13f3mr94107637b3.17.1788175441869; Mon, 31 Aug 2026
 04:24:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-kunit_cgroups-v5-0-6c42c8753468@redhat.com>
 <20260706-kunit_cgroups-v5-1-6c42c8753468@redhat.com> <aoyFYWYmocJkTeXk@localhost.localdomain>
In-Reply-To: <aoyFYWYmocJkTeXk@localhost.localdomain>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 31 Aug 2026 13:23:50 +0200
X-Gm-Features: AcwNN1U0KtJvFymBd5EOdAW56G473bYb8daTnzAjeFTLioL1I8ELNQhwXHMDOSE
Message-ID: <CADSE00+8E_6q1PRhQdnH+HfqCHca5Oy4b4wgM67QPq-X6Z6FwQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] cgroup: Add dmem_selftest module
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 8:28=E2=80=AFPM Michal Koutn=C3=BD <mkoutny@suse.co=
m> wrote:
>
> On Mon, Jul 06, 2026 at 02:06:40PM +0200, Albert Esteve <aesteve@redhat.c=
om> wrote:
> > Currently, dmem charging is driver-driven through direct
> > calls to dmem_cgroup_try_charge(), so cgroup selftests
> > do not have a generic way to trigger charge and uncharge
> > paths from userspace.
> >
> > This limits any selftest coverage to configuration/readout
> > checks unless a specific driver exposing charge hooks is
> > present in the test environment.
>
> What about that
> drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> ?

But that test does not set up a dmem region (man->cg =3D=3D NULL), so
ttm_resource_try_charge is a no-op. Even if we add a region there, it
would not exercise nested dmem.{max,min,low} from userspace as
intended here. But I can reword the message to avoid sounding like
there is no in-kernel coverage whatsoever.

>
> >
> > Add kernel/cgroup/dmem_selftest.c as a helper module
> > (CONFIG_DMEM_SELFTEST) that registers a synthetic dmem region
> > (dmem_selftest) and exposes debugfs control files:
> > /sys/kernel/debug/dmem_selftest/charge
> > /sys/kernel/debug/dmem_selftest/uncharge
>
> Nit: I'd think about alloc and free (to denote meaning not how it's
> implemented).

Works for me. I'll change the naming for the next version.

>
> >
> > Writing a size to charge triggers dmem_cgroup_try_charge() for
> > the calling task's cgroup (the module calls kstrtou64()).
> > Writing to uncharge releases the outstanding charge via
> > dmem_cgroup_uncharge(). Only a single outstanding charge
> > is supported.
> >
> > This provides a deterministic, driver-independent mechanism
> > for exercising dmem accounting paths in selftests.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  init/Kconfig                  |  12 +++
> >  kernel/cgroup/Makefile        |   1 +
> >  kernel/cgroup/dmem_selftest.c | 198 ++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 211 insertions(+)
> >
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 5230d4879b1c8..6fab65d6b44ea 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -1267,6 +1267,18 @@ config CGROUP_DMEM
> >         As an example, it allows you to restrict VRAM usage for applica=
tions
> >         in the DRM subsystem.
> >
> > +config DMEM_SELFTEST
> > +     tristate "dmem cgroup selftest helper module"
> > +     depends on CGROUP_DMEM && DEBUG_FS
> > +     default n
> > +     help
> > +       Builds a small loadable module that registers a dmem region nam=
ed
> > +       "dmem_selftest" and exposes debugfs files under
> > +       /sys/kernel/debug/dmem_selftest/ so kselftests can trigger
> > +       dmem charge/uncharge operations from userspace.
> > +
> > +       Say N unless you run dmem selftests or develop the dmem control=
ler.
>
> Could this be made w/out introduciton of a new Kconfig option? (E.g.
> what tools/testing/selftests/livepatch/test_modules/Makefile does)
>
> (Maybe reword to insmod if you choose building the test module as OOT.)

Ah, nice example. I'll drop the CONFIG_DMEM_SELFTEST and have the
helper module as OOT.

>
> > +static int __init dmem_selftest_register(void)
>
> Just an idea to reduce the amount debugfs of boilerplage -- the testing
> args could be handled by module_param_cb().

Ok, I'll switch to module parameters and drop the debugfs boilerplate
and DEBUG_FS dependency.

BR,
Albert

>
> > +static int __init dmem_selftest_init(void)
> ...
> > +     add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
>
> Great!
>

