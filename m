Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C76E40148F
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 14:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778511598; cv=none; b=ZtQ4N8TMbpKyOu94SADd13FJyO71Rle3LiOl+IUgPHIo5H3M4lsbNubaV139CVw3iGskE4xFFv1e3kqcx/bEB4F5LIDlnRSh1zHAyC2WFk33SYprdNx9QyqTQFJ77VvR8mSjJpkOWnn28IYSuVjyUL7sfZ59q3zGfBo5upO9lkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778511598; c=relaxed/simple;
	bh=ZMLJorGRDLuLGDQaifkVphFcd2Gm4O18yI8qmtudl20=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hrpVSRSlzfl02cZW31+DMI4z3WBNeYR3eHmV4kz1c5OQBEuGPfd8buD6a4j6QnpmplmItvu0xNWjhHd/Qa8jptyepaR0CC7w/5OAf3eXUcKDnT6BrxG9CVnyB3gCsoM3acF7f093V36DTt161lGtcod3RFgR8iLFRN2e8XnEtr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o/hTYTM7; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o/hTYTM7"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8353b042152so4452899b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 07:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778511596; x=1779116396; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D1G5BQDNCElQMhRaqBFDq8nj6aplN+o28Im2m1TUiS0=;
        b=o/hTYTM7iDB0eysqilcKdKexvGqPK1VSMeVvLHf2vB/PrA5zpkJbeTg0hf4JbLIzvD
         ZLdGdq/TXRmVSv4nuwcNNjIMoR+B2V/dJwGTE+FrMseG33bruNoq0C8IQoW9OsHWX8/J
         lQ7E5oD0KwmLISMSN+Jcx4Y+fIDG8F1o73s25VmNqs/A8/bFbBxNUwm0oVbyGIFSX61C
         D0KfYRYFJPm3tHYJRtjPx2JhgkDxgXjtSf2Z/nqBNsH+J3WL00XyWDqFwy85MnU3gRTX
         FNqtuGj4CWIOr733ZKDSAUmxNp4TUfV54xHIEqexmHzrMP9xdqFmclSPpGCbiLnPcSCr
         m3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778511596; x=1779116396;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1G5BQDNCElQMhRaqBFDq8nj6aplN+o28Im2m1TUiS0=;
        b=Q4XvpYIePOuZAqv4zb3RppcHuu9oL7QQBdcAz5+WvoVQAWTWBl09HloYTG6M7+xhJZ
         QbllfaCg/mN0sb9mXv9yTo8Ia2YH5b9AO6I0QG9hnHPqQ5bIuzr2ahV/zlgMC8HTsZf3
         Cp2FpRIGkH5LIBEtzqomRarPB8FPM6U5BqsvmEGeO/brh1ZAV9FAf73JkcIp+3uEXHdB
         CTYsJYPhWkgnnlksPfK1OVuzRwb0hr09fStfxEOvz6x5kD1PkmgR/IuI+90K06c9T0J9
         c1lD69+LIQEwer++YedPjIQLTzDrJgvt9efu4tw/sZ9vg7P4IEQAl9kudrjl9kyXhTOO
         QjnQ==
X-Forwarded-Encrypted: i=1; AFNElJ9BYyysbsTba+WXFCMu9N799J/JYoHR+aGZWlyc3bSfF9yn/7bzQ8NOuZAc7TGB3O73gI+ilPW6amfmAlR27q4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI06on0QxwLKlqcgXq3skO3npKCp4UbHQXrxqZ9Rf1QlxdI4km
	b6GIqKT6swA0r7FMqFaQBUw8avXN02W4UCoS4anLG+NUzdXV6EKZBQi41txStEn3+rrwHBXD5I9
	x76NTFg==
X-Received: from pfbmd16.prod.google.com ([2002:a05:6a00:7710:b0:82f:c134:e67c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:198f:b0:838:1ece:9716
 with SMTP id d2e1a72fcca58-83a5c5bd45cmr24637410b3a.22.1778511596079; Mon, 11
 May 2026 07:59:56 -0700 (PDT)
Date: Mon, 11 May 2026 07:59:55 -0700
In-Reply-To: <20260511113759.610924-2-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260511113759.610924-1-tabba@google.com> <20260511113759.610924-2-tabba@google.com>
Message-ID: <agHu666UaLA3PxVe@google.com>
Subject: Re: [PATCH 1/2] KVM: selftests: Fix MADV_COLLAPSE build failure on
 older toolchains
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Ackerley Tng <ackerleytng@google.com>, David Matlack <dmatlack@google.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, May 11, 2026, Fuad Tabba wrote:
> guest_memfd_test.c uses MADV_COLLAPSE unconditionally, but the
> constant was only exposed in glibc 2.37. Distros still on older glibc
> (e.g. Debian Bookworm, glibc 2.36) cannot build the test.
> 
> Add a compile-time fallback that defines MADV_COLLAPSE to its
> kernel-ABI value when the libc header does not, matching the
> established selftest pattern for sometimes-missing libc constants
> (see selftests/bpf/uprobe_multi.c, selftests/mm/hugetlb-soft-offline.c).
> 
> Fixes: 9830209b4ae8 ("KVM: selftests: Test MADV_COLLAPSE on guest_memfd")
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  tools/testing/selftests/kvm/guest_memfd_test.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> index d6528c6f5e03..45990ae5f1e5 100644
> --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -23,6 +23,10 @@
>  #include "test_util.h"
>  #include "ucall_common.h"
>  
> +#ifndef MADV_COLLAPSE
> +#define MADV_COLLAPSE	25
> +#endif

Fixed by:

  https://lore.kernel.org/all/20260428012503.1213654-1-seanjc@google.com

I'll get that applied and on its way to Paolo this week.
