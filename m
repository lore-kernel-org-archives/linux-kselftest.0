Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDB046A612
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 17:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787767067; cv=none; b=gk0XtimE8qegP4HntAUEsjZ8bZFG640T87pUTu3PZhvK2lcsdHu+Av8Axa7vJSKc4nY/TMbQ4yqOM5cqrjIVKjLxn21/uw9PzPz1o4qcw341+JyJRanXUxmMhqameFe+4jiKpZu+WmiHCMmrSWfUa3SAkhvrbahUIL+AIhyJEqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787767067; c=relaxed/simple;
	bh=WP3lzz3sPwNr/uWnF1dnEtr6qfIaUelhmsrLvivFud4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+cjCi/7Xin2nLZ7Y91HU8MoszkbgH5xBVVS0wSczaNZzJsXkrxfzb/YSO7sQRP96p1bPfBNdSiMFi2Bk37bXspRdI7DiAxRhguaOekhSi10sdSMNrgv5UTl+jRzq4BQMIXGYoSW54rMN4I+FhJ0qK0uEof3vlgWTugujs7ewPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hquZmByv; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hquZmByv"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d3b440b97aso10745ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 10:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787767053; x=1788371853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mOyt5LoY374Qkpz6cQhUC33i8CoGf2Yn2cDcltrm0Cc=;
        b=hquZmByvqvONjAlbXKuBbz8QPQjRA5q24l+0d+Wr/FDWY71EaBqGj8IlwKdWAZ/7rN
         qfhOOD0fECT1ixEw028sq04lhB5Z07hNlWPm6R3OajIctcl5IT/kz9pvApm4OixZ97oz
         VZxiM4k8JmKXtVKR8jk7Gp9I4YGU5A7Chzn6ygBLmMqOe6Oa3kypdshgeQT3A/tHJtny
         haMbvbBbdWrldqdotn11ykqbR6cZYMaVgFxEYpU5hbmi6FjSNGAfZNFD30VDJSmHUmlR
         W7RvcM+aVp9V7cuZCosewrtpuz1dmLCXobqo+V3HFTZhZC6AHrBOyzbhjJdfQJguASa7
         7CYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787767053; x=1788371853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mOyt5LoY374Qkpz6cQhUC33i8CoGf2Yn2cDcltrm0Cc=;
        b=JT/STfONBmwMppbG+0l9doDCd1OgvytVHYhpHVIzwYUe2uXkHhNQpp1QTTAXlcK/Rc
         WL5IWHJskytUvwxL+LA/LTNBIF6jD8yzAEhuFUTZHuJFjG9I0rpEnF2toEJRVWz/yog1
         t1+VUrmymdWeRxmCUPoYue8NQ/YuCZ86/p1K1xfbhn9dZUzaPtyhRZORtrg8gL6gmbcw
         tXCeRMSJNwwKbCecsUymTG2Nuu7Tx+ppamFXODmVtoBqZ7wxb/3eeAD+hU0arGO7LriO
         8lA3MBPDpZtYCUHtKVv4AXxPX7BX0hXvEiGRu6+jjodzKc/XbJ2jYmDapXsTK79AIiut
         5acQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7dp17qK0yTM2NM3+qZdgYGBg9xXKO8AkrMesUL4YKGcUxpkdDsHh4uJr9aSogGPMJg3Q1vfaRX4g6wfupA2E=@vger.kernel.org
X-Gm-Message-State: AFuF++kspT6dK7E4F7PSpQ5uP6LZk3bjzU2XSHMb59ndYzYfkwTriMvl
	zaWUVPjoKzolR0AytNSMnumbEgK+QqhSVDN0iN8hg36C21dwQ4AaDR3G4YZ3OTBBnw==
X-Gm-Gg: AR+sD10sNX0rlcgvDPrgKu1UjgZJjZ2aJoySSRVrcUguFA7jcYuQ3XssFEnfGr1Zzwa
	JvfeW/LiFiKDBgbtfK6ogCvEAbqksix4LIQUDq8XQUJOFTAI7T1KjfyO10bu6kTxFA2So2r5u8K
	1ohJEsstPCytY60vbaMzetcan8T0zLun/LsKmKkxXlmtfxsGb653Jx0fsS84iXVOUZoPQkwHAvU
	qaegVuH6VU+n4iCjefFLu2xInjPYcvEKh3EjIFGubuhfH4g2XfwKv6hb8njIWKPPYA4Mms4nCkE
	4Vdh44QFuPjjlYWQot0aRot8yO9WWehdB5xy4fpuRI0TfW64FkHoO82rhvD4m0XIQTyNwBCdt4x
	nsdW6OO2nbr8zeyRZlxvXV6oZGlOaG3lMBHkAfmYwY2Pb0P0ODYmSdooNJFjlWZcx6DTeWBdwzM
	B7TZFHHManBvcrOrU/6F8tbHv4T57/oNjY3cATp4HdW1uihwgVSqn17bzUESs8/ftD3gXk2sVUL
	R8osLaAbDJrW9YVu9hfvQ==
X-Received: by 2002:a17:902:d4c7:b0:2c9:b404:b55 with SMTP id d9443c01a7336-2d72a6912edmr556605ad.6.1787767052531;
        Wed, 26 Aug 2026 10:57:32 -0700 (PDT)
Received: from google.com (195.5.127.34.bc.googleusercontent.com. [34.127.5.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d31e8csm9002581a91.9.2026.08.26.10.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:57:31 -0700 (PDT)
Date: Wed, 26 Aug 2026 17:57:28 +0000
From: Lisa Wang <wyihan@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Andi Kleen <andi@firstfloor.org>,
	Hidehiro Kawai <hidehiro.kawai.ez@hitachi.com>,
	Rik van Riel <riel@redhat.com>,
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>, rientjes@google.com,
	seanjc@google.com, ackerleytng@google.com, vannapurve@google.com,
	michael.roth@amd.com, jiaqiyan@google.com, tabba@google.com,
	dave.hansen@linux.intel.com,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [PATCH v5 5/5] mm: selftests: Add shmem into memory failure test
Message-ID: <ao8pCI3AaUssIO8S@google.com>
References: <20260823-memory-failure-mf-delayed-fix-v5-0-d97a5703e45a@google.com>
 <20260823-memory-failure-mf-delayed-fix-v5-5-d97a5703e45a@google.com>
 <8a99f753-0713-4194-8eb5-90da0724e647@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a99f753-0713-4194-8eb5-90da0724e647@kernel.org>

On Mon, Aug 24, 2026 at 03:00:47PM +0200, David Hildenbrand (Arm) wrote:
> > +++ b/tools/testing/selftests/mm/memory-failure.c
> > @@ -20,6 +20,10 @@
> >  
> >  #include "vm_util.h"
> >  
> > +#ifndef fallthrough
> > +# define fallthrough __attribute__((__fallthrough__))
> > +#endif
> 
> This doesn't belong into this test.
> 
> rseq/rseq.c selftest already uses it.
> 
> I think tools/testing/include/ already provides it.
> 
> Maybe
> 
> 	#include <linux/compiler.h>
> 
> does the trick?

Hi David,
Thank you for replying.
Would it be better to change it to /* FALLTHROUGH */
like the rest of the mm selftests?

If we prefer to include <linux/compiler.h>, we can
certainly do that, but we would also need to update
the Makefile and fix a redefinition in pkey-helpers.h.

--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -37,7 +37,7 @@ endif
 # LDLIBS.
 MAKEFLAGS += --no-builtin-rules

-CFLAGS = -Wall -O2 -I $(top_srcdir) $(EXTRA_CFLAGS) $(KHDR_INCLUDES) $(TOOLS_INCLUDES)
+CFLAGS = -Wall -O2 -I $(top_srcdir) $(EXTRA_CFLAGS) $(KHDR_INCLUDES) $(TOOLS_INCLUDES) -I$(top_srcdir)/tools/include
 CFLAGS += -Wunreachable-code
 LDLIBS = -lrt -lpthread -lm

--- a/tools/testing/selftests/mm/pkey-helpers.h
+++ b/tools/testing/selftests/mm/pkey-helpers.h
@@ -22,7 +22,7 @@
 typedef __u8   u8;
 typedef __u16  u16;
 typedef __u32  u32;
-typedef __u64  u64;
+// typedef __u64       u64;


Lisa
