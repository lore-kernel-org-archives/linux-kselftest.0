Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C492E35DA68
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 08:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165939; cv=pass; b=Fr6P8PeUQ9uXPHveXXEGKf+vxMDkk36hCysX31VtJenTGfM1vq/OyBTMhimgtQApduGN8lmSIFBMZCJjkPZf7suTVoKwwhAd7a0WLSqE3vBMSBN+60WhCq6TZqN9C9+rL4Mxx4OtYYCrAJyQV6CN+17wA73gjXyDznKJinjQVhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165939; c=relaxed/simple;
	bh=VjLyCE3ULm1W9z56D4wq6X0rbN/EyoCSd9TZqyvP8TE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euzBhJQthv44i6+KTgfidoQbeDZwdfJwYBuFVbDS533x5kWMJzRllwx0DZiz/hbRSYLcKipUV5DbJLbe9C8xGrhHJjRMM6mIj+iB6Ubn97RKJQssOBaC5KkhjbBrZ28RFXtYuWCQ8DG8puAOLmRT3Ew8eLR1nGWxavM9rlEDJKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J/2sO0vC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=F2Pt5yZB; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J/2sO0vC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="F2Pt5yZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788165936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vg1jasgozEJAkrVTwgSp5gxj0PTi1l2mqJv39TXaqQc=;
	b=J/2sO0vCBrM5NXvlOMMdIRR/mkUUCg8/LcMJJmq++26r/bodgx3oEqXqtcJQQfVtc8Xsvd
	JMip9MxgWQwzq2oOxn2DhkK9+jUrCqa48GIZf9jxTDrTams2iOuQTJGx9LepVLYB9a12oA
	WfMfASnYTUkl9SZuBL9017gcZCWYCw0=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-LpNE-RpjOU6zDX7YnVv0QA-1; Mon, 31 Aug 2026 04:45:35 -0400
X-MC-Unique: LpNE-RpjOU6zDX7YnVv0QA-1
X-Mimecast-MFC-AGG-ID: LpNE-RpjOU6zDX7YnVv0QA_1788165934
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836c8fc09cfso50243687b3.1
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 01:45:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788165934; cv=none;
        d=google.com; s=arc-20260327;
        b=BhExJa2oQRNLQIOxwbbmHFr9Ke9rUEl1LV0QpA1czrVssnD9Ci6KPHVrDSkFqd5rPW
         y8TUbEYuB0LYcyld7r1Gyq0ca/kMD7kFBh1Eh2ck5I9IZJyU6P6QAv+zkyRJScajFypZ
         2ZFqaAnNMHKaCbwWUbIWmQ5tT1VI73rBGcI4wEz6ZgZ6BXfto+tpd8Wkmx5JAj1qbw/J
         6m9fXxSQWDWUjZBMeV3HDiN82UxiARp1rzK7NY/ZMrO9sk486zNcB2aOHxy1HOzP24aa
         Sw82TJl8F6wGHNgozCk/6VO/DOQznLOrHIxNxWpgoEP4II427kQWWYpvVIFRLSKBFx+V
         UHXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vg1jasgozEJAkrVTwgSp5gxj0PTi1l2mqJv39TXaqQc=;
        fh=pjT8Y2zpUD5rrq0XIUhECVyasKhsonEByxBhasDqjR0=;
        b=TaWlQ0Acs9CgMLsJRhoIvRJLtgKnS06rcC8eGbmYd+BTUROoc3X7itYchoZYOl4/3m
         1RDR4atCuFYSdmWRwgYnLsO2LDl9UYBOZmkKirXDeRHNbGbBbzHgc1908oDu+V8LCrif
         lZ+kc3M5y0yamKGmGZ9KY2kBnG080LqnaE/NXGZJHrrw8oGRLGegDjDdtlXeNOPAM7Ws
         I8+9vQRW3E/Yo7WD81uEo4Ke3pFjdncTmavm7bMlIkF8m29zFHEye+HbJe23CYWZ//DP
         6wqos1DLgBvXXRdliF5uIwb21zsXpGb7s7CGezxMdhQY2cO5Z+PwAyy5cdMcIIjsn/+u
         aDXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788165934; x=1788770734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vg1jasgozEJAkrVTwgSp5gxj0PTi1l2mqJv39TXaqQc=;
        b=F2Pt5yZBQ/IoUPjVPeuFlkIff/F1KhVvJo19zlPvTTV+FA4WNvcszJi4u3APb6alwf
         duqsRsIOwzgwwcLa3BcUfUQ7fjt3NbcH9yCnxW1WYyAPcCkrAaFH9H6K6OXaLnj6mwX7
         NyZYpYS8s1Na08gnpB33WeEFMYsO1JKlTYTbsh2FDZkXcgB/05xDzFkYe4bXPlzkcLQR
         OvJ8QE2xQGiByW4mrIraucsnu3GG08TDC+IYNtDrFm9BgvYvOrPc/d/HVi2TeA9zW+j9
         Batf3c3GDV86uL2IB4a45alOx9fcpUcE9h2J4IRiuzSCiBzIg6Eh2s6WKbCmuz8+smgA
         Yahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165934; x=1788770734;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vg1jasgozEJAkrVTwgSp5gxj0PTi1l2mqJv39TXaqQc=;
        b=JPZnVnaEuWdsouW68VOrhQbJJ28jfUbOWp+PqsQEuO0WdChCs5aE4bAxHjvptOU8/R
         kVWJq1kpORJClS/19W52Xpoe26bNKnTG5Wj7hY+nTpUn9r8ySduoT3ohd6kbDMOTyFS/
         pZN1b3vnbj6Toz4tykXQ4jLETrgePZQ+1LcA8E3iqwnuvDRUDOkIpdfUR7rvCxhUii29
         rAJky7xoIDEh0GwO4bWLP8fTeNyhflahVJUXqAZ9xXS8FhaXm+m6FNEk9rM4KUtEBU/5
         qZcI/LWxg3DGTH7LTn0g9fsRX6Y5WwjtFm6o94KSmLkcg4kYbE4gTqBk3WPOY6Yu/pQJ
         Iowg==
X-Forwarded-Encrypted: i=1; AKwUvBzSTksLY1UHDgXiptS3nP7HcJdHJsfYqC9u695Dz39Ilux2nBBWPRgNuRCAyH2mltBJu1jIgBOXjPsU+zx2ok0=@vger.kernel.org
X-Gm-Message-State: AFuF++l6mryCm+XzVO3r6VOHytyG0JvJuZgn9adAlKVCeXEjCQ27zBM7
	0yhb8Afjhpoe44rLBNlpuEQvPoqE3UwFzILwxqrV0gfPdssqLxduzO7Gdc8cXRMHnneGqiNiYOe
	Ml3YIMSLSnzzr9k3AsokOWfie+e/mATQP/ddfd3P3LoemdUTEnZsJ5A0AReNMSIUpcUQp4T9PZl
	lbWLZU4MbtoFvfVokQX99KyTsB+1fimpKNn03Qvx9ifoYu
X-Gm-Gg: AYBFou0TPPwU/rtvoR8p2kb3Q2FPicGtjKo5Whnp25hxlo/v+fx8zVwUow+b+0L24pG
	urPgdYe1uUF5FGCr7kLtmSlGb4pSKgraP1ccXEvV/R50GTTkrpOtcxT7ciuwRaf30ahvAoS/T+J
	C1ZjR4qrvtPASQK+kZTM8CTZxUAw6oY40H+r/jmC1DDn4zQZUX+Ha687U=
X-Received: by 2002:a05:690c:e3c1:b0:845:cc1a:af6e with SMTP id 00721157ae682-85d6c4f9797mr89839077b3.30.1788165934302;
        Mon, 31 Aug 2026 01:45:34 -0700 (PDT)
X-Received: by 2002:a05:690c:e3c1:b0:845:cc1a:af6e with SMTP id
 00721157ae682-85d6c4f9797mr89838877b3.30.1788165933810; Mon, 31 Aug 2026
 01:45:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-kunit_cgroups-v5-0-6c42c8753468@redhat.com> <aoyLV5ovAaY15G-h@localhost.localdomain>
In-Reply-To: <aoyLV5ovAaY15G-h@localhost.localdomain>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 31 Aug 2026 10:45:21 +0200
X-Gm-Features: AcwNN1URWgK4fv0lv7-8mBvsb3EpLpT39bC_2lvLWDVD0tpVvUbMExgZhTXTnyc
Message-ID: <CADSE00+5PWATGzHokJMEoY9fuYRYrf=H9NA1zfXXoaZA2NvPzA@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] cgroup: dmem: add selftest helper, coverage, and
 VM runner
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Eric Chanudet <echanude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 8:27=E2=80=AFPM Michal Koutn=C3=BD <mkoutny@suse.co=
m> wrote:
>
> Hello Albert.
>
> On Mon, Jul 06, 2026 at 02:06:39PM +0200, Albert Esteve <aesteve@redhat.c=
om> wrote:
> > Hi all,
> >
> > This small series adds practical test coverage for the dmem
> > cgroup controller.
> >
> > The motivation came from following the recent dmem API discussion in
> > thread [1]. That discussion considered changing the dmem API and
> > adding a new knob. Currently there are no dedicated tests covering
> > dmem behaviour, which makes such changes riskier.
> >
> > Adding selftests has an additional challenge: dmem charging paths
> > are driver-driven today, so regression testing is harder unless a
> > suitable driver is present in the test environment.
> >
> > This series addresses that by adding:
> > - a kernel-side selftest helper module to trigger charge/uncharge
> >   from userspace in a controlled way,
> > - cgroup selftests covering dmem accounting and protection semantics
> >   (including dmem.max enforcement and byte-granularity checks),
> > - a virtme-based VM runner for repeatable execution of the dmem tests.
> >
> > The goal is to make dmem behavior easier to validate when evolving the =
API
> > and implementation, while keeping tests deterministic and driver-indepe=
ndent.
>
> Thanks for the dmem selftesting. I'll respond to first two patches
> individually. I find the wrapper scripts in the last two a bit of an
> overkill for the selftest (as it adds dependency on particular VM
> environment, I'd keep the simplicity of selftests such that wherever
> they are executed (w/out wrappers), there they run (be it a physical
> machine or a VM). At most, I'd consider a simple wrapper that'd load
> ensure the test module is loaded.

Thanks for the review!

The last two patches were meant to follow the existing virtme-ng
vmtest.sh pattern used by other selftests, mainly as a convenient
developer loop. Anyway, I can see how it might be overkill, especially
in this initial version. I'll drop them for now and keep the first two
patches.

If a tiny wrapper that only ensures dmem_selftest is loaded turns out
to be useful, that can be added later.

BR,
Albert.

>
> Thanks,
> Michal

