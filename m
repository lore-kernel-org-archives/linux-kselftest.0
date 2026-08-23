Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33D52868AB
	for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 18:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787508640; cv=none; b=GU+5lf+N+uM/kcLawjqyjrtRPcrBUuuHjPOgWHrsUqI6/Bua9POa3B0ybOQSUEVX0U1KPWzIUyN7QQNWenry3kH7sXLGuiIAXdZBieU5x4+92nrT/HyzOjZLQ+FdGI4wLNYX7/4nSn7zGSXS9JKPUrIqOLevBPxBy5dLwWwMEO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787508640; c=relaxed/simple;
	bh=fGYi03ob++A1OM/7GWgjQOyXpfe+tdTeHisTLkTszvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWjqoGtolIYnAjWAtiXl7Vax2YCa/nB6AsYkI5gGQDI7r3O930b1owvbgw9r8fZziDskzUJhPZqLs5KqSTzk0sdHDwb0cFE0nQxxepwmOXsd4TJBGGwt0GfDr8LhmP3TvDF9C4NnlXnaDqOzDLVOQthQDe2tmdCq8wY2IuUox78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2uJI3vi; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2uJI3vi"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so1934649a91.0
        for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 11:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787508638; x=1788113438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=40bzyEpk4244+pXyR4A/V35aPJohFaRdnFjBwHWe5DM=;
        b=D2uJI3vi3WxZnfPn3ZjqspNiEPNmrh2ZZu968RILNByB/ZdBrYk4hj4mg8QQLNsXDK
         U3wTEWZhEa0q8dUDkNEwhN3DTFTW566uCCmBj8SZzrBTTns1b9olqxBH8cqtSFMICCug
         iot+VBD9XV6cdqRNIT0DDlMkSubimRJ2EAmlrJ02UjGimDBky21PNf2clvYo3z+uW1IM
         sVO9dNNNKd8A3kTVBmEyxHpzILkYP55Q4BNrfRalEeeNGhbM0+gH1D6+L7kBYOQi6nn3
         s05ViAGYGlqElNTQet2bmTq/sw8Jcahy91xazSQct4OEykM+sSROcQ6l8P4vktcM73he
         a5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787508638; x=1788113438;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=40bzyEpk4244+pXyR4A/V35aPJohFaRdnFjBwHWe5DM=;
        b=dQFo5C7EZSxeLzxgmptYm9CglmFJTeekTvBsucdgmE+heqP+ygCHmKpOFmbBbeAx+z
         Ytq9WckdF/xyM8XU79PP2qBXv2dKifybCdS4YSI571xbZ6Olfspc4BGbIn4Met4EpFvJ
         9D0oQVOv8mricYG+xVr/nCFn0MJ9xu75O3ha9DZ19DezY+CW+1VQJvKhe9W1uMUr8YSv
         Wcbf3WuDlow5gxOmh/uR0tF922S5MtKzPVUDNUZEzwZOARWmXUNNVl+Ic/ZsDZbiMUs5
         MFTjGeaRVLGfqUCSWsgu6lzi0uG7tpZsketKQ/LCKStbxxIUrqaNpiwZNVIcRFHDUlK3
         yiAA==
X-Forwarded-Encrypted: i=1; AHgh+RoYoLBwZm6456J9ryHgv7+izQvdPCM8k+w8UPrqdC2K7PBnEV5tXkBwa5rAchfpRQMocvvJqLJ2WKpl3wXxBn0=@vger.kernel.org
X-Gm-Message-State: AFuF++lAWj7XYSQynOB0rXrG5TPpsH/eu8wQT5wTNvJ1P4nqNNAyC2c8
	0nXit7M1KZ6zPVsvENDQ/PDA6+hX+jpoM3gRY4YTPt5FErJgjBnAaIEM
X-Gm-Gg: AR+sD10gwXRjXTAhdzPa3tYjJLGhizNMSNk5Rob1oCaUbSWdSNANRk4IBUEJ5XB7sGc
	f5N/dmgNaE0CJKazLWTLbhfNB2wFrYA/3EF6oDtvo34KlA/i/QrMD91Ku7ezFh41oqx3fzltj5n
	OXfXolsTGHP99CTrZiTr5RCA3DMlrCsefjYyov7bEGnrc8VDoUTd1KbLJgw3pqlW8KX4+Lir5ji
	BLw216WXgLzu1e1mwoMwXETVwjvM2mFl8kwlXg1494G4Df0kWDJQcE2+frg/nJPw1lDDkmaz+fJ
	X9p775PyPTLwLyteM5rOIr/ihb1EWKfx18ionH8nQGwmLXbstBqfR+6gUkp/WQIIgoIlfCQiCk6
	RY2tqJH99tlvwDaKQB8A06X8Y9dnDzl6zwLdLj2xJu/9Iexc7pBVUlf4SZ9ueshy1hYgjroUq/j
	NBdGoL2jNWve8b4qpT0kV/fHarVju9LEsau6dn/LSAJEDTP7bMpssOASMo764bPqNs5/erNxqu3
	L7dqiTZ2CXKQYjwRGMH4OlM2ypcxsM=
X-Received: by 2002:a17:90b:37c5:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-395c4c35ac3mr18952438a91.3.1787508638219;
        Sun, 23 Aug 2026 11:10:38 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49d8b1csm7092886a91.11.2026.08.23.11.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 11:10:37 -0700 (PDT)
Date: Sun, 23 Aug 2026 11:10:35 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Shuah Khan <shuah@kernel.org>, Paul Moore <paul@paul-moore.com>,
	Eric Paris <eparis@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
	Amy Griffis <amy.griffis@hp.com>
Cc: Frank Hofmann <hofmann@deshaw.com>, Noah Orlando <orlandon@deshaw.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	audit@vger.kernel.org
Subject: Re: [PATCH 0/3] audit: Measure and reduce syscall filtering overhead
Message-ID: <aos3m2wG3To3wCeo@skinsburskii>
References: <20260806-audit-v1-0-ddd0d94ff0b6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-audit-v1-0-ddd0d94ff0b6@gmail.com>

On Thu, Aug 06, 2026 at 06:01:18PM -0700, Stanislav Kinsburskii wrote:
> This series adds a repeatable microbenchmark for audit's fixed syscall
> overhead and uses it to address two cases where audit continues doing work
> which cannot produce a record.
> 

A gentle ping on this series.

Thanks,
Stanislav

> Patch 1 adds audit_bench, a manually run getpid(2) microbenchmark under
> tools/testing/selftests/audit.  It leaves policy management to the caller
> so the same workload can measure different rule configurations without
> silently changing the system policy.
> 
> Patch 2 fixes audit_n_rules and audit_signals accounting when rules are
> removed automatically with a watch or tree, or after an LSM rule update
> fails.  These paths could leave the counters nonzero after the last
> applicable rule had disappeared, causing every subsequent syscall to
> allocate a non-dummy audit context.  It also centralizes rule accounting
> so all rule removal paths share the same bookkeeping.
> 
> The median getpid latency in the same unpinned VM was:
> 
>                                   no rules   stale state   fixed
>   automatically removed watch       38 ns       55 ns      38 ns
>   automatically removed tree        38 ns       59 ns      38 ns
> 
> Patch 3 builds on those lifecycle helpers.  It maintains an aggregate mask
> of the syscall numbers present in exit rules and checks that mask before
> walking the exit filter list.  The mask is architecture-independent and
> therefore conservative: overlapping syscall numbers may cause an
> unnecessary scan, but cannot suppress a match.
> 
> For an unrelated getpid workload, the median latency scaled as follows:
> 
>   exit rules                         1       32      128      256
>   before                            55 ns    71 ns   428 ns   791 ns
>   after                             55 ns    55 ns    55 ns    55 ns
> 
> The aggregate mask is updated through the centralized accounting helpers.
> Insertion sets the relevant bits before publishing the rule with
> list_add_rcu(); removal unlinks the rule before clearing them.  This keeps
> the lockless rejection test conservative during concurrent rule changes.
> 
> The series does not change the audit userspace ABI or rule matching
> semantics.  The benchmark and complete reproduction procedures are
> documented in the individual patches.
> 
> ---
> Stanislav Kinsburskii (3):
>       selftests/audit: Add syscall overhead benchmark
>       audit: Fix filter rule accounting after automatic removal
>       audit: Skip exit filtering for syscalls without rules
> 
>  MAINTAINERS                                 |   1 +
>  kernel/audit.h                              |   7 +
>  kernel/audit_tree.c                         |   1 +
>  kernel/audit_watch.c                        |   2 +
>  kernel/auditfilter.c                        | 140 +++++++++++------
>  kernel/auditsc.c                            |  13 ++
>  tools/testing/selftests/Makefile            |   1 +
>  tools/testing/selftests/audit/.gitignore    |   2 +
>  tools/testing/selftests/audit/Makefile      |   9 ++
>  tools/testing/selftests/audit/README        |  30 ++++
>  tools/testing/selftests/audit/audit_bench.c | 227 ++++++++++++++++++++++++++++
>  11 files changed, 389 insertions(+), 44 deletions(-)
> ---
> base-commit: ea2bff00da89d7767d677bb68470130ba96f4928
> change-id: 20260806-audit-96a1e71d38b1
> 
> Best regards,
> -- 
> Stanislav Kinsburskii <skinsburskii@gmail.com>
> 
