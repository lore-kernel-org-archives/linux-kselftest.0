Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C44746EC9D
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 12:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711495; cv=none; b=ndsNr/BnqsolgbG7ALDX8WWkT6Z4PtQhRg/aukPf66F3X4lTxvaOK/VuPgg+KQZvk1qlYi3Hia5bhAwwUTixyYVHcfT9D5ixb0DBdM4q69GrsOZGjKFFTFteu40U4EPD83Wer86CaNvTea6XynRopybBVtr0WWlq0tzU1bmYbFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711495; c=relaxed/simple;
	bh=p9YGStyShDEQYivEs3XXEs/FwPS1+MKUWpzOFPaXD8E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LJuqzWUs5bzgj9ZyKpUreno/4x47EKjxXl8E0oskmNU0lzOMoGNfaM1x2um+vH3gFVlGJAzK7FFoGd2KlwMlAVBIVtf8PNT/Z/Y8iWHiPz7lRRyM+HRRRUIYNbYoxSoiUqSYn5yNVoosjxaeymgjOe15O6cGTIHsfFKHmXPUcdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAJg1aGZ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAJg1aGZ"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so705163b3a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 05:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786711490; x=1787316290; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uVL8QQveaA14mGW2dIQPVe+Wbaf5USv9xkXEwll8c7c=;
        b=CAJg1aGZPaJDtU9Gdp/ZR2TupWVocCfL3QAU0pAv+pXqZov0kwiqyAcnkG1ChI6EF4
         wcSKb3MuQW2xeCeEZpBi48+0hq2c/mqx43bAcpyHPSbqtKssbuTOZ48bc9Fz7VHOWSGN
         OkMfgAxzXkFbyTw6yckNVeZ65dRIpmVdtTflMUc+3kkuuIwi//ErZbRDKrA/9VKIEGp/
         dBykjuUmi3l3rWeJK5MXjrg0ziDfP8y3vJKDU8IscqKd3ag08LhOOiahRSgIV3yODBCv
         gRUT+JVoeFgySVDMMiQYmRsyu32oyiDwr6WQuU4i/DpTgMrY2jbC46VeBm6AFNzb6MCy
         A+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711490; x=1787316290;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uVL8QQveaA14mGW2dIQPVe+Wbaf5USv9xkXEwll8c7c=;
        b=E5mdkKuyJTf2D4A6w5SbPOZB8GEcxCzGq4Jyxpston4RFw6mdb+SiJ6vHJtpXrITMN
         uwLOayuKxrqHignIc5fR2TMKEcf5Qijlz3srWTLqeARBK8wRfTupE0UB+3a3KcZO/mwQ
         3z29TkdBflM0CN7RRBU4Mx5qsfHtwOZlXpen8h4VozxnwIgbpUe76MVic5UBsoKr49C1
         i8DD30vz56nASyWnpNiT6w9Vswg6ggkfMHbtvWqFWoAPg52RLvwXqPzoz12UlXcFbhiH
         QGeKDqVz2pOdvkMkEP6yZ9/bDRjPHHDh2U1105u4Eb+bUe0UNhLMTZmkCa//q9XUaCQ/
         xyRw==
X-Forwarded-Encrypted: i=1; AHgh+RqYAw7WaHv6NI6cff2KfVdWg8UmgkO5E/nE51TfeRnKHItYBa/1gEAuQDlbtAfmYP1acdNd8yn1LoQBSWyy/XU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw941qKeIn1kPO/AFJLboNR+22QUAMuOgrnTOOlFHyiY+iIhMTU
	QD7xhFrddYR5NKry9EKDBXYjWOtSBg4/rGPFoYSkgT/ixLA0MXOsf+60
X-Gm-Gg: AR+sD12FxwBtvDcnwOg1iU7dMwolOpQPgNoHZ+GmRXVmPza7wVcY/9qlJryh0HBUQ+x
	Rtx5vqHmq/EOo5lhJpMsQzIBeuTATXldTA9g+R3g1RM1NgQm9/rG+zBpSJAoPdZox0V1BBU35NJ
	cvqc2zPoc8HyQDA2Un3ObvJRtZC/iLqHqNbqAVMXh+X3UtYPF5k2qdOPsz5SFxZFs2tubJKWU+C
	q9zkJt5lB1KaYjBHx1U1MQmmWfpwh3hc+0K3lnsVIMnChx3SdAQvMy6lglhm/+5AC+iJ72LOcgD
	mPuNcyRqbF6i+qyuV1/zjX/p4NrPl17NSMeOU/uMwaZ+8QsyfhXMoIweRiVlKP/aMQtDAazaxsP
	iC3cUgHoQFLeGND55T2DklUEuiwwOud24FfnPkmmDku5iC7MwBPLSqx9J4079du1+47to+joe4R
	+LTYQWtj2/citU2fZ0ETGaeDsj04d5CGw2wNA9BsPAEU0bEjxG/dTFBXZuj3Mnfsop7Mj0WnZUH
	XdvPuCgYw6Ebj7ID8iIivahM29sLBgNTL+9HehsXsRVP5xuXrAcV0cPLZicIqlXY95krV0wKN/F
	lJDRLw==
X-Received: by 2002:a05:6a00:3981:b0:848:2eac:bfb2 with SMTP id d2e1a72fcca58-84fde004804mr5805806b3a.13.1786711490219;
        Fri, 14 Aug 2026 05:44:50 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d266e36sm399011b3a.55.2026.08.14.05.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:44:49 -0700 (PDT)
Date: Fri, 14 Aug 2026 21:44:45 +0900
Message-ID: <m24igwrhvm.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: pfalcato@suse.de
Cc: linux-mm@kvack.org,
	geert@linux-m68k.org,
	daniel@thingy.jp,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: Re: [RFC PATCH 4/6] selftests: fix build errors on alpine linux
In-Reply-To: <an7eC0oBvfjB6g54@pedro-suse.lan>
References: <20260813063401.1786548-1-thehajime@gmail.com>
	<20260813063401.1786548-5-thehajime@gmail.com>
	<an7eC0oBvfjB6g54@pedro-suse.lan>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


Hello Pedro,

thank you for the review and looking at the patch.

On Fri, 14 Aug 2026 18:34:21 +0900,
Pedro Falcato wrote:
> 
> /me puts on his libc hat

thanks, this is really a good news to me.

> > diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
> > index ae18c491ae53..ac21bf3d802e 100644
> > --- a/tools/testing/selftests/kselftest.h
> > +++ b/tools/testing/selftests/kselftest.h
> > @@ -58,6 +58,7 @@
> >  #include <string.h>
> >  #include <stdio.h>
> >  #include <sys/utsname.h>
> > +#include <stdint.h>
> >  #endif
> >  
> >  #ifndef ARRAY_SIZE
> > @@ -81,6 +82,48 @@
> >  #endif
> >  #endif /* end arch */
> >  
> > +#if !defined(NOLIBC) && !defined(__GLIBC__)
> > +#ifdef __LP64__
> > +typedef int64_t __fsword_t;
> > +#else
> > +typedef int32_t __fsword_t;
> > +#endif
> 
> The code should not be using __fsword_t. Per statfs(2):
> 
>        The __fsword_t type used for various fields in the statfs
>        structure definition is a glibc internal type, not intended for
>        public use.  This leaves the programmer in a bit of a conundrum
>        when trying to copy or compare these fields to local variables in
>        a program.  Using unsigned int for such variables suffices on most
>        systems.
> 
> and indeed if you look at musl's statvfs definition:
> struct statvfs {
> 	/* ... */
> 	unsigned int f_type;
> 	/* ... */
> };
> 
> so it should be perfectly cromulent to use unsigned int here. Or use an
> actual usable interface :)

thanks, I will drop this chunk and propose to update mm/gup_longterm.c
to address the issue with musl.

> > +
> > +/*
> > + * for a workaround to avoid struct conflict under
> > + * musl-libc (<sys/prctl.h> v.s. <linux/prctl.h>)
> > + */
> > +#include <sys/prctl.h>
> > +#ifndef _LINUX_PRCTL_H
> > +#define _LINUX_PRCTL_H
> > +#endif
> > +
> > +#ifndef PR_SET_MDWE
> > +#define PR_SET_MDWE 65
> > +#endif
> > +
> > +#ifndef PR_MDWE_REFUSE_EXEC_GAIN
> > +#define PR_MDWE_REFUSE_EXEC_GAIN (1UL << 0)
> > +#endif
> > +
> > +#ifndef PR_MDWE_NO_INHERIT
> > +#define PR_MDWE_NO_INHERIT (1UL << 1)
> > +#endif
> > +
> > +#ifndef PR_GET_MDWE
> > +#define PR_GET_MDWE 66
> > +#endif
> > +
> > +#ifndef PR_SET_MEMORY_MERGE
> > +#define PR_SET_MEMORY_MERGE 67
> > +#endif
> > +
> > +#ifndef PR_GET_MEMORY_MERGE
> > +#define PR_GET_MEMORY_MERGE 68
> > +#endif
> > +
> > +#endif
> 
> This looks fine. It's the same old problem with musl and kernel headers.

noted with thanks.

> >  /* define kselftest exit codes */
> >  #define KSFT_PASS  0
> >  #define KSFT_FAIL  1
> > diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
> > index f02cc8a2e4ae..2cc819006424 100644
> > --- a/tools/testing/selftests/lib.mk
> > +++ b/tools/testing/selftests/lib.mk
> > @@ -197,7 +197,7 @@ clean: $(if $(TEST_GEN_MODS_DIR),clean_mods_dir)
> >  	$(CLEAN)
> >  
> >  # Build with _GNU_SOURCE by default
> > -CFLAGS += -D_GNU_SOURCE=
> > +CFLAGS += -D_GNU_SOURCE= -D_LARGEFILE64_SOURCE
> 
> What needs this?

this is a leftover chunk of patch not for TARGETS=mm, but
TARGETS=drivers/dma-buf, which generates the following errors.

udmabuf.c:137:9: error: unknown type name 'off64_t'; did you mean 'off_t'?
  137 |         off64_t size;

I will drop this chunk from this patch as the patch is only focusing
on TARGETS=mm.

> >  
> >  # Additional include paths needed by kselftest.h and local headers
> >  CFLAGS += -I${top_srcdir}/tools/testing/selftests
> > diff --git a/tools/testing/selftests/mm/hugetlb_dio.c b/tools/testing/selftests/mm/hugetlb_dio.c
> > index fb4600570e13..aee6be530ccb 100644
> > --- a/tools/testing/selftests/mm/hugetlb_dio.c
> > +++ b/tools/testing/selftests/mm/hugetlb_dio.c
> > @@ -22,12 +22,9 @@
> >  #include "kselftest.h"
> >  #include "hugepage_settings.h"
> >  
> > -#ifndef STATX_DIOALIGN
> > -#define STATX_DIOALIGN		0x00002000U
> > -#endif
> 
> Why doesn't this fallback work?

I thought that if this macro isn't defined, it's not available in the
underlying kernel, but that's very idiot modification given that the
libc headers is not up-to-date but the kernel is supporting this, this
ifndef should help.

I will look for another approach to address the situation of musl, and
revert this for the original purpose.

> > -
> >  static int get_dio_alignment(int fd)
> >  {
> > +#ifdef STATX_DIOALIGN
> >  	struct statx stx;
> >  	int ret;
> >  
> > @@ -43,6 +40,9 @@ static int get_dio_alignment(int fd)
> >  		return 1;
> >  
> >  	return stx.stx_dio_offset_align;
> > +#else
> > +	return -1;
> > +#endif
> >  }
> >  
> >  static bool check_dio_alignment(unsigned int start_off,
> > diff --git a/tools/testing/selftests/mm/mdwe_test.c b/tools/testing/selftests/mm/mdwe_test.c
> > index 647779653da0..031c79ed067e 100644
> > --- a/tools/testing/selftests/mm/mdwe_test.c
> > +++ b/tools/testing/selftests/mm/mdwe_test.c
> > @@ -1,5 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  
> > +#include "kselftest_harness.h"
> > +
> >  #ifdef __aarch64__
> >  #include <asm/hwcap.h>
> >  #endif
> > @@ -14,8 +16,6 @@
> >  #include <sys/wait.h>
> >  #include <unistd.h>
> >  
> > -#include "kselftest_harness.h"
> > -
> >  #ifndef __aarch64__
> >  # define PROT_BTI	0
> >  #endif
> > -- 
> > 2.43.0
> > 
> > 
> 
> Honestly, I'm surprised you needed so few hacks for this! But if I am to
> guess, there are certainly much more problematic selftests out there.

Currently I only tested with `TARGETS=mm` and didn't look carefully to
other tests.  I will look more into running other tests on alpine
(with CONFIG_MMU enabled) first, then will see !MMU environment with
investigating if those are meaningful to test on nommu.

anyway, (again) thanks for the review.

-- Hajime
