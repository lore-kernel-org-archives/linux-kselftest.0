Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DDF32A3FF
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 22:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786746569; cv=none; b=LGP5lEYjjvaRDuifkmj+8+SMMJ3mGegEQzDQJF0sZ4Cg81REQc5SiCO7s+tggfS1wxABExbCnHJOmtZS94CuVsisBVPH2HATQb+g4AwpoB758F6G1cdIDOFHdfv3F8WjXApK9Pge4KL/TtTBK+M4U67QjkXocf8OvbEH88tFV5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786746569; c=relaxed/simple;
	bh=eyfpGam/aSm50j5HbRB+wj+hgQjfqDp9FRaABOmrq/s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eZRPioNEZh8bplsfkO1/RQCkxCOLR1Q9IbQFUYM3VzGZZsOA6KNDp36qYl4FNBzNuXe5lN2iZUJSMiQjwOFufHT2ZW/1MtEogaonPxO3tX1X9Wsd72NSlBV/V/B61shCXywjEby5i5BHGSz470VqAeieDjUi8XTbuNt+C69tf5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGXRVODk; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGXRVODk"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1313490a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 15:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786746566; x=1787351366; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/ufcPNnfJAyI3kkCJgjhE8EqLR38Q7jjROlx/CU0gNg=;
        b=HGXRVODk/On0XcVMmMmvmXaSwTmLQwArTafpwBYWWoyMsSE2lwaaKygXJD9/stQGGw
         scvSrKYtp4Zblt2lqi3ktrF4TwO2Q5zYTEa6by/HiU30uB1xygeF3KKTlGtwUHb2s52Y
         Y5ktu3nrAssV0k4k/sPBL/57bnbqpfmTpiB00MvhmFy4WJnIaa1I1s+xgD3JfzxwS6N6
         GixLufOGVOS+FYhLam2lYwb2gkg5yYh67inCl6Vc+IQhfRuTQ///ftF4AnqY0hSYT2PV
         pvUY5GtSqaHQnGMOTqTrWKYLWbmvJWGOazHtTRoBdw137AUW5eFig65VVBWyrPvuUM2C
         vs6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786746566; x=1787351366;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/ufcPNnfJAyI3kkCJgjhE8EqLR38Q7jjROlx/CU0gNg=;
        b=qmAwG9djpBwH6uo3ghJTm/xy64ecdtQ274wVbgFwJSFkyhgAMWbR/caLpfKCARHJZu
         bKoo34kKOi253rwJwc5Pry2f5MaBrF7VnJVBuHJ4XwG6sRR3DI/iMID1aOqj6wTK8DIy
         eAC4v93SPJFTEGyX6/jfiJYu02rqKaIoGifqP1u7mmXunwHIlgK0kaDu0uvhNUFnddj5
         /59lw9YNhS8q2p2DkytP6RCB2AEBqS39HT3BjCQgVggezYA8L64pDzCNm0USHvuNzRmb
         AG4ugz1nzi0eAcsC7vc3TWqggYmNMz/RNxoZ3V6W+WN5enyV/lpjkYGkEUUsXmj1JnO9
         fUqQ==
X-Forwarded-Encrypted: i=1; AHgh+RreAPrMQag4AAwray4OGqyS8tpeIfpczIbWB3TRbFi2Uufq0mlS9dIcGL8XWIAbmRA6kFbhfzMbgUB18xh9Dkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLdGU12w657EFNTW9ROT4qCbwe4uLDstjEy7hgohgxJldvL4fd
	XQ/AxaUHv3iTnvqUtScbKcDeqC/g1DS9oYrjh7diZnuxn62aBKVPhs8Q
X-Gm-Gg: AR+sD107C0YNSzPhEpdsdZhE/H34hB2Uks8/ozAoPr93Sq9qjn7XFSnxGWp4Mc0FI2F
	rtNLwbxIfHdcvWXZehFL008OOzZx+OPtaV9I9QJXA7RijvQ3ZAdeTLREdAbY15qhEcNb75Oq33H
	8dM/2lX0MRro3QQQcZbhWG05DuNju83Sja1Pc18JeeKf0a6/h73ToUASvHdMsvZs4j/PopkJW7U
	cnzIy9pa/DuPwgc+4Z3Nc+KjLIGDPscwc/8YBXCJXmBu10aWTA3/H40Uqb8BrmXICZR1m0cRWEv
	id9kYbdYrze9l65qLUs6piasGf2KjygdVxL48WT2kwC5KtONbz9Dt2JVza4PcaJExmEEmRxuEdt
	whP/dxubBFc2VN33qiloRs/xrP2r/jJdwUm3vVJhi2GAaDOpJSqec5NvGQBEJp+LkneiHBCf7hm
	EGa2DHxBw/CmRFSB76CxFmjPzmfndBd5p4MBOPw1nfCle+NZGq/3YtLDkCNhmCxNx/xh05fuXFo
	5RCSZpxlqQCWLlA/OoA8xU11e/YaoUEe93GBykV3QbrbMZUxy+LyvpUHiX8RuiNNHWINjBWDG9J
	buSpMA==
X-Received: by 2002:a17:90b:3c91:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-3933b78e3c2mr11216186a91.7.1786746566302;
        Fri, 14 Aug 2026 15:29:26 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ebb888e3sm4122477a91.11.2026.08.14.15.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:29:25 -0700 (PDT)
Date: Sat, 15 Aug 2026 07:29:22 +0900
Message-ID: <m2y0e8pc8t.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: ljs@kernel.org
Cc: linux-mm@kvack.org,
	geert@linux-m68k.org,
	daniel@thingy.jp,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: Re: [RFC PATCH 4/6] selftests: fix build errors on alpine linux
In-Reply-To: <an8MHlxZzu6a_1ui@lucifer>
References: <20260813063401.1786548-1-thehajime@gmail.com>
	<20260813063401.1786548-5-thehajime@gmail.com>
	<an8MHlxZzu6a_1ui@lucifer>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


On Fri, 14 Aug 2026 21:39:33 +0900,
Lorenzo Stoakes (ARM) wrote:
> 
> On Thu, Aug 13, 2026 at 03:33:59PM +0900, Hajime Tazaki wrote:
> > Some nommu architectures only work on Alpine Linux, which doesn't use
> > glibc for the standard library.  It uses musl-libc and is implemented in
> > a different way as glibc, resulting build failures.
> >
> > This commit fixes this issue by adding missing definitions. The fixes
> > are now only covered to TARGETS=mm which was tested for the moment;
> > future contributions are needed to fully build/execute tests on nommu
> > platforms.
> >
> > Cc: Shuah Khan <shuah@kernel.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: David Hildenbrand <david@kernel.org>
> > Cc: Lorenzo Stoakes <ljs@kernel.org>
> > Cc: "Liam R. Howlett" <liam@infradead.org>
> > Cc: Vlastimil Babka <vbabka@kernel.org>
> > Cc: Mike Rapoport <rppt@kernel.org>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Michal Hocko <mhocko@suse.com>
> > Cc: linux-kselftest@vger.kernel.org
> > Cc: linux-mm@kvack.org
> > Cc: linux-um@lists.infradead.org
> > Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
> 
> I mean vaguely looks un-invasive which is the test here.
> 
> Couple comments below.
(snip)
> > diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
> > index f02cc8a2e4ae..2cc819006424 100644
> > --- a/tools/testing/selftests/lib.mk
> > +++ b/tools/testing/selftests/lib.mk
> > @@ -197,7 +197,7 @@ clean: $(if $(TEST_GEN_MODS_DIR),clean_mods_dir)
> >  	$(CLEAN)
> >
> >  # Build with _GNU_SOURCE by default
> 
> You probably want to update this comment.

indeed, will update this part (may even not needed to modify this).

> > -CFLAGS += -D_GNU_SOURCE=
> > +CFLAGS += -D_GNU_SOURCE= -D_LARGEFILE64_SOURCE

(snip)
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
> 
> Probably better to declare different functions to make this less hideous.

I see your point.  will look for the other way.

-- Hajime
