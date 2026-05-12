Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD273B7B76
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778618486; cv=none; b=UPgbMHZVuSvXI2sEK6bekQX0Gs2ztb6paGeot8MVFALyzpNRFMVN16yHgs6SsH0i+oXKHxqKXv19Wdk39beAcYin5vXFKRvBBo5qvBGS0hmViywvwISwrXgb8gTa0DG2I5CRcdolSyX6QPxQhCvQhSEW+Yks/D7sy1bnQg1zsEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778618486; c=relaxed/simple;
	bh=i2FMVqoCYm6FiVcFiqxhtfNbdlephUNWQBXqZIy8Ti0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfAJSwVrOPnsG+Va5d8fhDyBMf5zQ9qt7Bu3DUqqzcn2mIITgtIJio9IQB21afzVAyXXcsjHw1o9iNrZvFi6DXoCLqH32rrjUDVFa54a8qTV3YuqN0ja/IBXSxBiT7Rcd8T3+pnIc8LSZ1pmT3Lzu+WclOJWZF6yKUnIwG6k6ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=i+AO2G1D; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="i+AO2G1D"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8ec37d52c0dso839509385a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 13:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1778618483; x=1779223283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sq67mJ1Mle/Wjax+ZhdINyyVrcamDgHQ2bN9yr1Zbf8=;
        b=i+AO2G1DurT9T8SdPgRWjfiuEHxC8BINqSX13HrZAM9omqGM/c0ALZd0JXFYyBF9vJ
         OopR44JWA5+nhaPutZSFON5+OjqS81LX+IDNEK8aaoy+LYYEKrrUaQi98Z4o8FCRiwov
         OSggGR7D7+gmXWVwksSxTHwYSki9oymSwxWztax76ejWgw4yftwxRZK5+0wM3sSD9JuT
         /w4JctQO97I7Y6NwtRgWyfoMCZ7GR8bXV1438CHL7WYmcTBbfBhNjSVLVYKX02xH0ajY
         zZFfsEOfotGJzEA0Ip/PcohoLILbF459vkIWyTCwDgLu6DvRGSwNFvDBF43zJE0b8eNS
         n8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778618483; x=1779223283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sq67mJ1Mle/Wjax+ZhdINyyVrcamDgHQ2bN9yr1Zbf8=;
        b=IvM+5EbHPeCPHV7lxhRuCDoQjazsLkuqNwZPYJ2QLmaSAgkwXp7wSrW2tAb+V7KspI
         gESzJIxMZAdNTItH4ZhGBCmzDzG44Ev7+pYrH+GdwLdtogEaHmxapzzENlM+72xKVDMY
         hG21Mkh6tJyfDZfuTN7PutK3vmEGXKJbw9uK7toos5aYcCau2ZfttTm6f8c6Wq10HXUm
         wmkb6Lz5EtXFdE8PkxJ/9aFIHOK/lIHfshw414jm71epc35vSESK8GBUNndSEtHrEh1y
         bNgZ5U2Ur2pRawkj6Rbloo5Iqq8jqDWDMjCMsLRBLNv04t1XdZ5cFK2KefyDyUdA/TD1
         DnsA==
X-Forwarded-Encrypted: i=1; AFNElJ8BD8tL658/CpTL0E9TT7djnJyFGRBRiCyRJYJoXUvdAQv7dqvI7ucl6qBVWvwlTtcP/9TGianbCUDI+og6owk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw40dsHBaTXoRzYB4GdQZT7OaLGUUmGLp3pPUPckl5W1HWy/5Pw
	bH9XLrzJ7M34/Fnv1DuOtHDax5guku5YKMPijHnlEULFJvxLGiN+iT3A9Dq+p5KqI0A=
X-Gm-Gg: Acq92OGLzpf0TH/4WQbfShS1PFjdrlA65AlFzSzXYmBOdH/r5GPJjMRwPYCw72o/CV5
	i8rSQRK7efPP86w5cPXQniCvFYgbUPWPwa5Yg7d4ih6mT50pGaAvTHODYf7wWhcBsoi+pGYT0eY
	acUTcel9S7/yH7oHDOdV5lud85EC46Lx5vCnXn/EbpTnJ88nS3ONEN7Bmcf2nC1lB8yhNh6Fx9a
	mJJKhvb5+bkBdcIeu1QS5pVHNY69Hf22g/TZzxxcDMRicNSsHIPlao/YmQyeq9xnW7CbcNBA7kQ
	1WdkGJRQNlqgtz7hBiNdLHxCyUisvvXn8urGcIkLDT/X0E5OLdffUXeBSqd5J5QiqBhISCrIC8/
	oseZAsI8ch9gEock4ZOnkgU3HEGqKevM5InlBvksZ5fjwqag5p2kXiJdfUdQywwZWCo8N69KfoH
	TCWnu6oY5ks1RPfDd4VzOZLh2RnrSitN6fMOLet6lqGrfkjEHcTk4=
X-Received: by 2002:a05:620a:4593:b0:8da:d152:b7e2 with SMTP id af79cd13be357-90f88f92e19mr94041885a.25.1778618483528;
        Tue, 12 May 2026 13:41:23 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-90cd7a6c35csm354234285a.42.2026.05.12.13.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:41:23 -0700 (PDT)
Date: Tue, 12 May 2026 20:41:21 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, dmatlack@google.com, 
	kexec@lists.infradead.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH 4/5] selftests/liveupdate: Add stress-sessions kexec test
Message-ID: <agOQa0aGZMVRlCu2@plex>
References: <20260414200237.444170-1-pasha.tatashin@soleen.com>
 <20260414200237.444170-5-pasha.tatashin@soleen.com>
 <2vxzlddoafel.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxzlddoafel.fsf@kernel.org>

On 05-12 16:09, Pratyush Yadav wrote:
> On Tue, Apr 14 2026, Pasha Tatashin wrote:
> 
> > Add a new test that creates 2000 LUO sessions before a kexec
> > reboot and verifies their presence after the reboot. This ensures
> > that the linked-block serialization mechanism works correctly for
> > a large number of sessions.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> > diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c b/tools/testing/selftests/liveupdate/luo_test_utils.c
> > index 3c8721c505df..37c330b9bb36 100644
> > --- a/tools/testing/selftests/liveupdate/luo_test_utils.c
> > +++ b/tools/testing/selftests/liveupdate/luo_test_utils.c
> > @@ -20,6 +20,7 @@
> >  #include <sys/stat.h>
> >  #include <errno.h>
> >  #include <stdarg.h>
> > +#include <sys/resource.h>
> >  
> >  #include "luo_test_utils.h"
> >  
> > @@ -28,6 +29,30 @@ int luo_open_device(void)
> >  	return open(LUO_DEVICE, O_RDWR);
> >  }
> >  
> > +void luo_ensure_nofile_limit(long min_limit)
> 
> Since you are adding this to luo_test_utils anyway, I think you should
> do it in patch 3 and use it there too.

Done

> 
> LGTM otherwise.
> 
> > +{
> > +	struct rlimit hl;
> > +
> > +	if (getrlimit(RLIMIT_NOFILE, &hl) < 0)
> > +		ksft_exit_fail_msg("getrlimit failed: %s\n", strerror(errno));
> > +
> > +	if (hl.rlim_cur >= min_limit)
> > +		return;
> > +
> > +	hl.rlim_cur = min_limit;
> > +	if (hl.rlim_cur > hl.rlim_max)
> > +		hl.rlim_max = hl.rlim_cur;
> > +
> > +	if (setrlimit(RLIMIT_NOFILE, &hl) < 0) {
> > +		if (errno == EPERM) {
> > +			ksft_exit_skip("Insufficient privileges to set RLIMIT_NOFILE to %ld\n",
> > +				       hl.rlim_cur);
> > +		}
> > +		ksft_exit_fail_msg("setrlimit to %ld failed: %s\n",
> > +				   hl.rlim_cur, strerror(errno));
> > +	}
> > +}
> > +
> >  int luo_create_session(int luo_fd, const char *name)
> >  {
> >  	struct liveupdate_ioctl_create_session arg = { .size = sizeof(arg) };
> 
> -- 
> Regards,
> Pratyush Yadav
