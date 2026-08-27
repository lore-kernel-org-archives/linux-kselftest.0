Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD6F2580F3
	for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 00:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787789476; cv=pass; b=oREVJXOcUkOjhzD/hThNyzbdCHeCDpNsBdM+9tocghUrjZYcIwJTTJdDtE0T+q66O/ZSEmrwEACl3vZ2amWGSV0VZqd/EKHpM54EdgvhL9i547BkIcTtexjkCtrzO0gXhTpN5di/dO7RLt7Ka8x1hbG5767Pd41kftJ0gGAELcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787789476; c=relaxed/simple;
	bh=q9fPaqLMvwojY1sDSJE1KOtBByV27/rWMVd0RMgF7LA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bw+INCxtminW0fDjcNpPeJs3VbikuhixOI3sPR0heWExCSULex1bpJa3WHj4VVbUPvO8sU8NUKIEbQ0hwNj+AHJXbAnvaWvShqpA7bZsA6HbCzUNz+cGhJ3XrI+5FDa6RL5SlHoqx3L+mawk94CNtjfDmFkYXuHHk3rPznEf7pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DDHytNYH; arc=pass smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DDHytNYH"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8efef6533aaso10514596d6.0
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 17:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787789473; cv=none;
        d=google.com; s=arc-20260327;
        b=ipHXh3QDPvZzdtJWCq8ZkUnDLmUvDXeJufOE5zfNuT4eSr0/L1NhMRcxuwFjE8W8TS
         bNY1ZY2+uufP79+tG2u9kv9rpI3VeawjorZiJGakfD5zKPM86n2pLT/JeF0zNxy8cBUo
         T8NDncktHd7QdrjiGkESoyzMg2fas6aCW0nBE7XUBvNCoteD4Gdq2PEBCDtZ+MILDOIs
         OLR75rGEiErj6hOGyTDahpEAOJ0DnXcAsv4qmkq438jupK2ygyWCUCdnSa+EuLbL84V+
         kfsX5xuSx23hIqAsAdoa6Rtut/WwNlagC6OsunuAZisdY252C/2nSaz6DVroKZerTqpN
         MvMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=AnLRTMnfrf4Gj+REZ5Itvxt0IiZsf+yGH35mZtX0wjs=;
        fh=FEh0O+gOAbjwph+D/Faix+EOKjC+JiK5BW+Ur5zu2cM=;
        b=dv2Wur5FPACjXvsfHlJwuOuNpex7CEHkaT46KfY1lUMH97CDpXMm34kKMVwsijKsBd
         ykDPl7gVIMYm9QhlslJbaHRVYGY4QEMB9Km+5XPMdu0ufSVloH6MYuwGPxPfUOYHQiKg
         08tCEUQymiJTfWMzIXL4Q2MwpUTTAAbeAKR4wVXGBuIjaT/ZyO3EJBX+/3QTpfZUx0P7
         k3V87GvMghR2Tg2IjcsBepyg+GKtmekM4oJoD9Qvd1xDJJQX3ZBTnxo3z/npxV351T0c
         goGYtavbUsvyIja0bsWlovQrHRvjACFgtVC6+QJK8DAyg+9vI0WQvOuN1O4PGEAZA9zo
         YzbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787789473; x=1788394273; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AnLRTMnfrf4Gj+REZ5Itvxt0IiZsf+yGH35mZtX0wjs=;
        b=DDHytNYHmL8ZZFfUZQMn9dv9i2pHGtixDiXKH9NcxPc4aJG167NL84W4W1eFrg82s6
         K6FGfBmIu0OB/N4HK5JAFeA1UGR0z5TlKmc3aM+GLZARcczL7zef3x1NOk3gnKVBbErt
         xi4wq6VzqorqIOe3iRB2OmS6mFTNQfV99usutBR7zO4DRLOWqjr7mfDN5C7fBQb5JJdH
         p2T/sZgpckboyIVBPJAuAoTIcUqpQdX0fSP1tMUoo2TLb4tdTLhQG1ds/xrwWWn36i8l
         cCnl653nK2rd+DQLX4EaUe9yQIPUT0c7flfn4QVBnz+eNFPfHNpbIF014eIJsP8Ak4Tx
         3CoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787789473; x=1788394273;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AnLRTMnfrf4Gj+REZ5Itvxt0IiZsf+yGH35mZtX0wjs=;
        b=HT711hnZQ63Q2Qynd2xieJjb27Lu8WeGz2v2PTDsNbJ31cw7X7vosJyDdgd8nKtNTh
         3AVEhxdVZVaS419v1f0l+dt3U14Xm9LLlRlAPYk/9+9Qj1mK/CiSo4ONb8wZJ/wKlDY6
         hk4UcGBDLGnE2VkePLR83lvSPZmtBROQ3aZiE7qv3dWbY+2kYXuvsnv1n1sXKMpr9ozG
         JCVRDYJTuED7Tq8zXdDz7DGn+CCE+57oSkIXFrDV7zSGifHsgB5X3M1k38tndPYfEt7g
         Eg8WHdULQPXoZ06NyBYe1FF5EidjXvTu3IQROsAFy0jqyryUeAQROFffAL+eeifobtXs
         MFIQ==
X-Forwarded-Encrypted: i=1; AHgh+RpN4gfMm1V45KJS25HuZStsxKswuL3eMS+oz0WaLb+lUtJsTgbzIbENAabwt2hv/PlBuBMEVk4V/OTUuGQ/6AM=@vger.kernel.org
X-Gm-Message-State: AFuF++mPx3zEALdWUPMwHMwGFiz6lubrlKNKgMDy95TazTUyX8IO4TBs
	FgaOCyFSt8CN0a8zt9PhlrJi+HbBB82rxRldHyYo/L7GaqqUhNaut9f8eFvYHQ9zLTVM/yyqJub
	0l4bn6MZa9A/dm8LdpU/Z7IWaaGYp9eqDheNM823H
X-Gm-Gg: AR+sD11a8ydm3tkguDOBkyF9AZx5R+c2IAqu1Rk0ilCmh2cdz88wmZvbQ6DWkEaZ2Ie
	iXpxiZV47a8gSz0CzH7H6lxqSoSgQzvmwxsikt6zHL7jL+PzUQ8pC/Y1E9RGew9gR+LLELrXgeE
	F00oXvaLZTjsgKNx/rAUCt8rv/oDWO1iG8hyj0pG9N80QDcO81Pd/jAPfSy+idJltVctaoQpMHI
	pZ0eGeIAuFlLGlPduweSdzGb6tyFzKEsufwQihImG6uuE6Bja3UX3bGjqPc4dyAvw4Gwkwyhi0J
	UHxoG362bUL3ZXbbuIH+MnLDvr0TZ4F1hZWuH26HxHzi4kaiCF8INdicAAC982RodYGRSHU9p4v
	cFDo=
X-Received: by 2002:a05:6214:4602:b0:908:98fa:f374 with SMTP id
 6a1803df08f44-90cc7858733mr168107566d6.6.1787789472172; Wed, 26 Aug 2026
 17:11:12 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 17:11:11 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 17:11:11 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ao8pCI3AaUssIO8S@google.com>
References: <20260823-memory-failure-mf-delayed-fix-v5-0-d97a5703e45a@google.com>
 <20260823-memory-failure-mf-delayed-fix-v5-5-d97a5703e45a@google.com>
 <8a99f753-0713-4194-8eb5-90da0724e647@kernel.org> <ao8pCI3AaUssIO8S@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 26 Aug 2026 17:11:11 -0700
X-Gm-Features: AcwNN1XfQOKyfEIZtdcwN4-zBTAXGB_PV6TdJFFinygb6qNke6evcDePz3wbfQE
Message-ID: <CAEvNRgHAwAJee6_ra9-zioDh_BqHM9Lbu+TGXxWHbG7za=g5Aw@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] mm: selftests: Add shmem into memory failure test
To: Lisa Wang <wyihan@google.com>, "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, 
	Hidehiro Kawai <hidehiro.kawai.ez@hitachi.com>, Rik van Riel <riel@redhat.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, rientjes@google.com, seanjc@google.com, 
	vannapurve@google.com, michael.roth@amd.com, jiaqiyan@google.com, 
	tabba@google.com, dave.hansen@linux.intel.com, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> On Mon, Aug 24, 2026 at 03:00:47PM +0200, David Hildenbrand (Arm) wrote:
>> > +++ b/tools/testing/selftests/mm/memory-failure.c
>> > @@ -20,6 +20,10 @@
>> >
>> >  #include "vm_util.h"
>> >
>> > +#ifndef fallthrough
>> > +# define fallthrough __attribute__((__fallthrough__))
>> > +#endif
>>
>> This doesn't belong into this test.
>>
>> rseq/rseq.c selftest already uses it.
>>
>> I think tools/testing/include/ already provides it.
>>
>> Maybe
>>
>> 	#include <linux/compiler.h>
>>
>> does the trick?
>
> Hi David,
> Thank you for replying.
> Would it be better to change it to /* FALLTHROUGH */
> like the rest of the mm selftests?
>
> If we prefer to include <linux/compiler.h>, we can
> certainly do that, but we would also need to update
> the Makefile and fix a redefinition in pkey-helpers.h.
>
> --- a/tools/testing/selftests/mm/Makefile
> +++ b/tools/testing/selftests/mm/Makefile
> @@ -37,7 +37,7 @@ endif
>  # LDLIBS.
>  MAKEFLAGS += --no-builtin-rules
>
> -CFLAGS = -Wall -O2 -I $(top_srcdir) $(EXTRA_CFLAGS) $(KHDR_INCLUDES) $(TOOLS_INCLUDES)
> +CFLAGS = -Wall -O2 -I $(top_srcdir) $(EXTRA_CFLAGS) $(KHDR_INCLUDES) $(TOOLS_INCLUDES) -I$(top_srcdir)/tools/include
>  CFLAGS += -Wunreachable-code
>  LDLIBS = -lrt -lpthread -lm
>
> --- a/tools/testing/selftests/mm/pkey-helpers.h
> +++ b/tools/testing/selftests/mm/pkey-helpers.h
> @@ -22,7 +22,7 @@
>  typedef __u8   u8;
>  typedef __u16  u16;
>  typedef __u32  u32;
> -typedef __u64  u64;
> +// typedef __u64       u64;

Removing this u64 typedef seems to be unrelated, the layers of includes
probably has some weirdness that needs to be ironed out.

If the weirdness is not too complex to iron out to be in time for 7.4, I
think we can iron that out, if not perhaps using /* FALLTHROUGH */ is
fine, to be aligned with the other mm selftests.

>
>
> Lisa
