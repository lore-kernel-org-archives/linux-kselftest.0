Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFBB37B41F
	for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 16:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787242435; cv=pass; b=sj3OEUcVU42HrxixtZLGkAsux7K5PB6L5AGqqaZ5PAh/R5Vpq6WgCJWPVyp3D6M3G6ZAAW5PhKKtGZ7YNbCPEV+ZMRJlumE2RiziaVrh0vCFjS5T+xXXXNDkgPLk410YH6eq+9Ii2ZY9ubbz4foAqgAQxaj3onasFCFTyL+s74I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787242435; c=relaxed/simple;
	bh=R4MPBvVJo4QUrqfGiyzEHUoLl/o6jIbnVOLSKCY5MYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VNgaAygUYrtJSPLL4ZHrwBmPAbiJPFeCE0fsQobVUm1YdJMPSOPIKfGq5jDaffJkM3bjGgYeKIO/jQoBycjawQ5pLHrSbX6ckqdLAojwll2A4D1tB0xu1NouD4+r5j3Ob/LIFRHv1rAngPOk/pzQoF8RvPI2+V++j6mKoa01qPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k7LSrBqh; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k7LSrBqh"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so9230e87.0
        for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 09:13:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787242432; cv=none;
        d=google.com; s=arc-20260327;
        b=HlO7lwFRQKeYSv5Zt15uxPqGVnFVrsxswaf5G1IUjyfVEkZLZCdwNbYme+ovNomxK3
         Ls/taGuJLytUIXlXVF9iRy24M2O4K2E6yB9869yWrKDBWq7x9lnIwRRNgte/ZmbqHzyM
         bKbkf5L2fq6NA1Oaor9oaH2ZoTXFUHUocRAw5nNOv1wIBqInqe8G5JRmcuE/I4OEhneD
         kNu7lEP3DXfc0jrFeuwtAs7pUCzjo9B9V1qheG8M0w71tF4SBrQUqXThk8jZlpf45nQr
         JHURGvv+iPFaF0nSAZ73nI2wDK2kdlmsu7NAo/ON3jXXtqVHeTdQ5KBgnMQD2sQzxd4S
         Zynw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ztOfkRWaJIQKbe97d8qKHuDqRSY1ntMmOF6ikBWIndo=;
        fh=2D9DchxSaGK1VbZRnvkKXY1aJVfepAXmhwYi6J4ttGk=;
        b=Nti1k7GxsUdhw5iHGmqpRljkyElg6LpzqM6Ige7pIVMZZlLTftW5HZtQ0MZGI4ujHG
         Y54JlehQ5EDP4VASHSfrRw1cRlu6Z0LGp+byWY4xcJz1HgvnNjdYGMrUE6XPmkBP6O44
         4k2mUC6HvXoH+heZHhbfdUqgyLGkrg/wqac7qUgtxQWJL9A1BE9Nx/i/erb1ZVer2/qY
         cC9xx/lcqKQQcB67w50FkIT6eJ8KfIYfAE63iXvoGt0w7YERIwGr96CX4zMjqLZzbE6L
         lJPyGYzBeC7UeNis1B6L9jJm1UgQfwlQF2R+EMNkGNrJf+FrDCF7dBBtwc7ev4g9h5lc
         Xg/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787242432; x=1787847232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ztOfkRWaJIQKbe97d8qKHuDqRSY1ntMmOF6ikBWIndo=;
        b=k7LSrBqhGmZpQB3jf1SzAcJQ9lNIYnvntjR/GnOUdCMePaob0RmpMh3YVMxOyyRD6y
         GjmpTO8rj53bKy5hMlzsAoNaOJxdPz/YVGetptmUfXRGvlYJG63WSzJil/pdLwkQQP0S
         xiXDdtZrdgK9QXiubCKHsqmBH7d0j3tbbA+RKXrJyq97gJMDiImq4qTZu9djWDTkCsUp
         HgglrPNVS9CvtMXl7eXvUZRW3vkIbh0LBhlPnro8biQtkDFOmSiiee/oVzWVaFR/XLKY
         PDp8cgJvmdLeeHkBSADc4xIQKtr/NMnI8K9ry/hn4I/nUCX0IEKzrjBSHzGbeAnqaLqo
         YWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787242432; x=1787847232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztOfkRWaJIQKbe97d8qKHuDqRSY1ntMmOF6ikBWIndo=;
        b=Od2997ZEB14BCK13Va6Yns2RoEV2nUEj3SdpUzaFBchrEUvwqR3SLqWFM8mc7NTsNk
         O2h4qLCn3sJMF6QbvMhQHgC3dbstYIniD8S6Q8coeKB1VWKntHasO01vEE7u9ybRA7ic
         GSwm61gnWt9QENs1joFMEpPtJq8fiB95hzrNpY9TGivTKFmDuIXLAlamWaOs0c1N2plh
         EOLEjtVtB/u9jn7A7DJvHG/yj7YNAs+tWiQTIuUVSlkrkpPV1CvLzWuoHRzK5ctEVN5J
         lsuedXK6m7ngenHuGELw42CjtGhi0H2Dl4oMEnOpd9nk2yWPMVKSdHLljjO3F7BrM+0Y
         9fuw==
X-Forwarded-Encrypted: i=1; AHgh+RpAXyvRQVNT3BZdbO0J+yxxf13At88RbvSxA90iakAQXDGNMHES3QkgU3rYquhgTGnfaRXGi7PkBzM6Uq5TIx8=@vger.kernel.org
X-Gm-Message-State: AFuF++kRXvZqxuFGqJEkDLiYXvpKU6In8NvaZQuS3zEPUEQTrVD8yOWw
	xxQvEXo+3T4U4AmgAYJqknsZGs4dWaH/2J8tdE6GwRE2SDngEuBVzubfE+S6nUTOPVolQB755ie
	oTI6oP93tNgf2OgFcZbiKuGxETWhL5mXGO9lw82Cv
X-Gm-Gg: AR+sD12oLQA5aXy6bCYJLXESUbU/8mMAuXunfevGaobZGgvs1h6DoTs8JQKc4mPrACb
	Dv5jzg/bgjesz5dATItbfwRv45ue32RoPFfcaVY+U8ld31Rdnpt5A/x5IkFf08vIixVEWjdgUYz
	qQA+Hkw8sYqk74OqwuCBjhtehHKCmWeBSmIkIPM2H1hki5Qm29YdzuoGrmpOGZfFTlZXzaUU4w4
	qr0UNsfmUtuB56SGSaRxZnUv71UvPSMzkAPnVZ//3Opi+jR1tc0lgHaOO7nriPsWDfpSIr1iQFl
	2FyByUFV/5SKnZO+BxndwegMnjb7WvVFMHV2M86dSjkFbA==
X-Received: by 2002:a2e:bea4:0:b0:394:5c9a:f315 with SMTP id
 38308e7fff4ca-3a189a50d6emr37194921fa.14.1787242431336; Thu, 20 Aug 2026
 09:13:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803170825.925561-4-hisamshar@gmail.com> <20260817220457.554823-3-hisamshar@gmail.com>
 <aoOKMeua-cNeTxXT@google.com> <8d069fe1-a5b6-4a86-9604-26aebe2dc243@gmail.com>
 <aoSIBnFfy4osa6wt@google.com> <c2f7e904-2646-4b01-864d-d185221c7f56@gmail.com>
 <aoSyYtxBpEaoBwGY@google.com> <c9ee5f08-81c3-4c91-9189-002b260ea641@gmail.com>
In-Reply-To: <c9ee5f08-81c3-4c91-9189-002b260ea641@gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 20 Aug 2026 09:13:17 -0700
X-Gm-Features: AcwNN1XO2VnQdgDq24rSrB6pOvu040FA9J1FBskyMqv9L255R8Q4VMJYArlZmn4
Message-ID: <CALzav=fs4bqMM7BXNPXqhtbqGzA+LW5fgx2-1Q5=sTN5+krYhw@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: selftests: Replace ulong with unsigned long
To: Hisam Mehboob <hisamshar@gmail.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, pbonzini@redhat.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 2:03=E2=80=AFPM Hisam Mehboob <hisamshar@gmail.com>=
 wrote:
>
> On 8/19/26 00:28, Sean Christopherson wrote:
> > +David for the VFIO thing
> >
> > On Tue, Aug 18, 2026, Hisam Mehboob wrote:
> >> On 8/18/26 21:27, Sean Christopherson wrote:
> >>
> >>> Oh, so on top of "https://github.com/kvm-x86/linux.git next", this *i=
s* the last
> >>> blocker?  If so, then I'll grab this for 7.3.
> >>
> >> Not quite -- I tested kvm-x86/next + this patch with musl-gcc, and the
> >> build still fails. On top of the steal_time fix already in your tree,
> >> two more musl blockers remain, both from code that is only in
> >> kvm-x86/next so far:
> >>
> >> 1. hardware_disable_test.c, from 496779b54943 ("Pre-set threads affini=
ty
> >>     in hardware disable test when possible"):
> >>
> >>       hardware_disable_test.c:75: error: implicit declaration of funct=
ion
> >>       'pthread_attr_setaffinity_np'
> >>
> >>     The call sits under #ifdef _GNU_SOURCE, but lib.mk defines _GNU_SO=
URCE
> >>     unconditionally, so the path is always taken and musl (which lacks=
 the
> >>     function) breaks.
> >
> > Heh, Sashiko flagged that as problematic, and I was trying to figure ou=
t which
> > macro to key off of[*], but was (obviously) unsuccessful.  I don't supp=
ose you
> > know the canonical way for checking for support of glibc-only functiona=
lity of
> > this nature?
> >
> > [*] https://lore.kernel.org/all/am0KqJOD-FiC9BXs@google.com
> >
>
> __GLIBC__ is the pragmatic in-tree answer.
> _GNU_SOURCE is a request macro (input to the libc headers), not an
> availability indicator -- lib.mk defines it unconditionally, so it
> cannot detect anything. __USE_GNU works but is glibc-internal.
> __GLIBC__ is defined by glibc's <features.h>, which any libc header
> pulls in, and is the established idiom in selftests already:
> kvm/lib/assert.c uses "#ifdef __GLIBC__" for execinfo.h, as do
> bpf/test_progs.c and nolibc. musl deliberately provides no __MUSL__ --
> its FAQ's stance is "test for properties, don't assume them", which
> strictly implies a compile test (autoconf-style); with no configure
> step in selftests, __GLIBC__ is the established in-tree idiom. For
> hardware_disable_test.c that is s/_GNU_SOURCE/__GLIBC__/ in the three
> spots; build-tested with musl-gcc, passes.
>
> >>
> >> 2. The libvfio wiring from a262fc49e0aa ("Build and link
> >>     selftests/vfio/lib into KVM selftests"):
> >>
> >>       vfio_pci_device.c:25: fatal error: uuid/uuid.h: No such file or
> >> directory
> >>       sysfs.c:31: error: implicit declaration of function 'basename'
> >>
> >>     The former adds a hard libuuid dependency (its headers aren't visi=
ble
> >>     to musl-gcc here);
> >
> > Can you elaborate on what you mean by "its headers aren't visible to mu=
sl-gcc"?
>
> musl-gcc searches only its own include directories
> (here: /usr/include/x86_64-linux-musl and gcc's internal dir) and
> deliberately not /usr/include, to avoid mixing glibc-oriented headers
> with musl. uuid/uuid.h comes from libuuid (util-linux) and is installed
> at /usr/include/uuid/uuid.h for the glibc toolchain, so glibc builds
> find it and musl builds cannot. I see 2f0c30d0d1 already limits the
> libvfio link to x86; the remaining gap on x86 is that libuuid is now a
> hard dependency of the KVM selftests build (libvfio.mk adds -luuid),
> and for musl-x86 the header is not visible at all without a
> musl-targeted libuuid install. A uuid.h compile check to skip the vfio
> pieces would keep it optional; otherwise the new dependency is probably
> worth documenting.

libuuid is required to build libvfio, which VFIO and KVM selftests
both depend on.

How is this problem solved for other libraries, like -lpthread?

> >
> >>     the latter because musl declares basename only in
> >>     <libgen.h>, while glibc exposes it via <string.h> under _GNU_SOURC=
E.
> >
> > IIUC, sysfs.c just needs to explicitly include libgen.h?
>
> Yes, adding <libgen.h> suffices. One nuance: there are two
> flavors -- glibc under _GNU_SOURCE provides the GNU variant via
> <string.h> (char *basename(const char *), non-modifying), while
> <libgen.h> provides the POSIX variant (char *basename(char *), may
> modify) and takes precedence on glibc as well. Safe at this call site:
> rl_path is a writable buffer filled by readlink() (no trailing
> slashes), used once by sscanf(). Verified with compile tests on both
> libcs, and with <libgen.h> added, uuid/uuid.h is the only remaining
> musl failure in the whole build.

Feel free to send a patch, or I can if you prefer.


>
> >> The rseq __GNUC_PREREQ failure is already covered by my patch in
> >> linux-next. With the above sorted, the musl build passes.
>
