Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C2A3EAC80
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 16:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784739129; cv=none; b=HY1JP8tkzdR3u/LOWBtrRWnACtIQoWBQUJAZNWM8vQ7TIgZtKVXjuIkzctJEAe92e5Pr8tXum37lwOIVHgGRMHdj65yw/eG5Q8B5sa5xPZqtkbvipWruhrEKBKR2khrJlEYNyOFxbUmJeZL7+NeBYCy9IvxkD58nluTjJhcGrlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784739129; c=relaxed/simple;
	bh=FCpfcM+nT4aR46CkZhE83zlD19BADWSaL+1+/WtmNO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZe8oAPMaCbnTFDgMQ+LNr5oLklGRlOnidhU9d/iLb1xXtNrcYFfNc8AxhCMX3rJyqFnMN5WDIX29ffuPbJO/4j4yikmds7j9nv4Ryh6+nbdEd6Ic+WVhC0zG/1D9Er7CO4RJK7QcRM2sX2qBbiAcK9VCfFP4VrdWyVOGVqbsIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UFzqwuai; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UFzqwuai"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cede6375caso10705ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 09:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784739123; x=1785343923; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRkas0M1ny2EvNaHC3azwt0fIUYZNjvZg2vzKttAMCM=;
        b=UFzqwuaiknAa/UoJEXHZyzyfI8PsGY3cBnc7/d7P4c+Rn5hho4XYwZBdSUBz4WRY8s
         WQOg/uLM02MvVWMKL7lmBXCPYsHMHvM+pJ6gbxYU8x1oEQqgma88jw0VNmEYe002+/NG
         GgQZGfEBLbqmoqvnj0IwLZCjalqJSE7zoei/7HP5quOzkaRblW22zuIjCfCjFAleJcty
         9SHrPaBoIZ84MJtXLDTuGCinORC2fFAqyZzvcWtnRU4s5Abi93+2jVXfyuxR2j1LsZez
         RVQdE9FHLdAXhXxFL+GW+QyeGLpCQlSC9ybyv8CjOQKsASOJMJd/To+3jDmegpagKol4
         cWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784739123; x=1785343923;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pRkas0M1ny2EvNaHC3azwt0fIUYZNjvZg2vzKttAMCM=;
        b=lguc+hdKd0R27ZiBBY9J3+QmnlcYIM2EOYZv5vuceoiVmNTuKszRU+J1pZ3RCjWDEI
         xGGsfkLVQpJm61aRowMf38SlrgCJfj1AvReifHLiEc5XZ9sfoF3anWD9q+TrVdTT2DA0
         WBgmj5rSXYDeUvpNruw6vYXRfsdXdqO3EpiSgwrRELCG2CbaTSjOQlzO/rJj6twk/JGQ
         fkdm4+bMBnjP4p78iXI0YCfs8xGlaPDh3oeMqjsJylBEsPwRVIpykAs4HltQgBkjkIa2
         yWB8Y60UAFED9UjIP7VKumt2EFaWQXCEHXj/Jfy81Ehxc2vFNM3Dj01Jj98hdmbjbZgQ
         nvvA==
X-Forwarded-Encrypted: i=1; AHgh+RpaUy3/Tchoyxxmuhobj60GsiiZciuUq+/bpQssWEyuealHi7jkG2gxRrtV5RJtvp9jbkcxax+9zq7A2NP0XSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTU4FxWOdTeIpJOk5iGzoNDDCx/X4789KV0SGisfX7q5h/iPW1
	4aBmnVDzdPsmouBzKoE5OcCaa3xz5BWzdwcCUhQUHqlm3RTpzdBC6WSLn1iBuAj+uw==
X-Gm-Gg: AR+sD115q7gltMZTz8Y71ObHCdkwxZGnmFFceniwTmjnCBy6an16aaR/+911lYIXuhi
	bdP47gR5pvYnn47RfhQxQIr4Z8rJKGKOSFRKB8eYhv8/9D1O3p/rBfI00c2GW9CpTgPF8594qV7
	52hMrQL/9YF75kSUl6rOwZ7eCTEwqI7jzw0F1PDIXxFgKURlekRNPDXf9Fox8CLQt3T3AcBGtl3
	eY3ech+fecRvaTkcvBZ77XC0Il7dr6G29bVvrpe8rfmtvvfjOXWQoNjwewNK8fa76tpAae80nmH
	oyRT0rvkyDSNV5d5wfv1gWkfI5p2BdubqfXWqxGqR9Ts7d51UHi/evQOfNmCTggaaJ/+A7uQMLO
	ugnzucfPluUVI5mgY6+9CIgPgT3a4oUI5Yd+Vpqr1M+LYjQogx3UdbKkFw9uRVfBRU5s8BBDRij
	0/p3F9D2NqvSbXFSn9gkJ40QulTLc+IJtlkNkLIf+93/eTEuXEo5zam13NVx2x7QqvIVpYl9g+O
	hmeFczeX923oOnIkL8TXQScsiemvRMLUno=
X-Received: by 2002:a17:903:3202:b0:2c6:a078:bfb7 with SMTP id d9443c01a7336-2cfa2995d66mr462105ad.7.1784739122233;
        Wed, 22 Jul 2026 09:52:02 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf96ac33eesm11535215ad.72.2026.07.22.09.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:52:01 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:51:56 +0000
From: Carlos Llamas <cmllamas@google.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Wake Liu <wakel@google.com>, tglx@kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	peterz@infradead.org, dvhart@infradead.org, dave@stgolabs.net,
	shuah@kernel.org, mingo@redhat.com
Subject: Re: [PATCH] selftests: futex: Restore support checks for futex2 and
 priv_hash
Message-ID: <amD1LPWCvNNrYdQs@google.com>
References: <20260722070801.2057634-1-wakel@google.com>
 <dca6abef-0f6c-414d-b7b5-02e5b2a355e3@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dca6abef-0f6c-414d-b7b5-02e5b2a355e3@igalia.com>

On Wed, Jul 22, 2026 at 12:20:37PM -0300, André Almeida wrote:
> Hi Wake,
> 
> Em 22/07/2026 04:08, Wake Liu escreveu:
> > Older kernels may not support FUTEX2 syscalls or PR_FUTEX_HASH.
> > Removing these checks causes false failures when running the tests on
> > such kernels. Restore the checks so the tests can be gracefully
> > skipped when the features are not supported.
> > 
> > Signed-off-by: Wake Liu <wakel@google.com>
> > ---
> >   tools/testing/selftests/futex/functional/futex_numa_mpol.c | 2 ++
> >   tools/testing/selftests/futex/functional/futex_priv_hash.c | 2 ++
> >   2 files changed, 4 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/futex/functional/futex_numa_mpol.c b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
> > index 78c0f7a59e17..d215acf88120 100644
> > --- a/tools/testing/selftests/futex/functional/futex_numa_mpol.c
> > +++ b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
> > @@ -103,6 +103,8 @@ static void __test_futex(void *futex_ptr, int err_value, unsigned int futex_flag
> >   			break;
> >   		}
> >   		if (ret < 0) {
> > +			if (errno == ENOSYS || (errno == EINVAL && (futex_flags & FUTEX2_NUMA)))
> > +				ksft_exit_skip("futex2 or FUTEX2_NUMA not supported by kernel\n");
> 
> Why aren't you using SKIP() instead of ksft_exit_skip() like how you have
> done at
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=locking/futex&id=50c121e5a57abe446e46825fb9c69ac419765d5c

It's actually the same patch. See:
https://lore.kernel.org/all/20260624070223.1533167-1-wakel@google.com/
Thomas, just refactored it to use the harness API.

I'm not sure why Wake sent the same fix twice but it was likely by
mistake. That's all, nothing to see here.

--
Carlos Llamas
