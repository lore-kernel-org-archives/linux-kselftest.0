Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1696538C2D4
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Mar 2026 21:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772573548; cv=none; b=diDjTUPyzzFERmNK5w9aYuuwz41hypD+LdwOMJn7WsdF8IApo1uVrKHtwCjuru2PrglxbQxZPwqsrN9V57efx1LMSJHcvUCGRHoLR9wAu8D0KQQQA7YwOa4FCFdSmdXEJLThRRfiyGP8IOmITxNmUIA1RPkie+NZnIuJn5SHR5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772573548; c=relaxed/simple;
	bh=uQoYobiJBLW1BwG4IeY+AthOG/587Taupj/7yoajbuw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8jHWesEOaddTc1+eHjKtfJkafECcPd7y2ys9QcGbQP+GXakUTiwSwycMiL4sa6EmkQDHftAf94UKQXVntAB6749Gt+/rmWGuY1y2bmWu5XmZ2xT25/u1xwlBazoeZnQ2mUo9VH3oDhQBgm2hH8JH34o3cYVhAlTPpRIt5pf5BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/kHgP0F; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/kHgP0F"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48372efa020so54240375e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Mar 2026 13:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772573545; x=1773178345; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jFfuFE8AhVRdTQIo7yFIA0XBx4MtB82nE83fwRvD6WM=;
        b=X/kHgP0FzP4oeBcJSgmywn0E9Rzbl7VZOoJKx+x7DBg+mdoJuPuHssUZnKevzmPG1o
         Or0qJrFzOlC4PkfBkgVDjoeAJkkFChno6GPIqexNargHLdkLl6Mtv86uLIeU3NOLRcbi
         eP2CKaTFAJfFP/vi/Ft42DtY40/MxRBwXhYzuoa0xTeYB/7hZN2xgY6XtVufSSjQQeSb
         RHmwgXY0QCs2tCgRzy3LASyAoH6Hbp/gfhMdyXd8RVUPFW9jBnHfY/vstT0NviIv9qiW
         qY6BDs3urUqGCssyeKmVwRGo5+ae/Yay/Y+o04r03qvi1Lkwb0PObl3ZU4vAS4VPvXkY
         xzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772573545; x=1773178345;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jFfuFE8AhVRdTQIo7yFIA0XBx4MtB82nE83fwRvD6WM=;
        b=ldu0T+xFba/k8DdWjlqvBrFUZ63NX1LhCYoNOlQwX5tebR/9k3ApAXCjY8Qqcs7/Bi
         kknpYBxQ7cr548HPnFoaE1svyz5hcNgjNsdHbQiNYziO7LwY/gLFlRH0kPnwVPDN/uEQ
         7tIPlQXugeUSkLlC8Vp/g4fdUUVP5QqcLTeYYWKKJKz9UaECjKpfvQUvtmtXSzUQX9Sj
         1f0mPz7tHmmrzWXKS14M5V7nI4CJseK27xDJlJ0C8dFrXvX1lReIF1PQqL2xf20GFJim
         K6+sR9UW6umm45QqZwmiP1jltiB9L+WOVOAk6LsTyU+pT18qu91xpQFZ7Y3K78HgBUHr
         pqEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFEUPrZM5ENXYeA4mxbBELNj0JmWf7/fngakx+jinMnugTuXpKQTb/fkOsjWTddP8p3UEnZEmq56tYRLbSyZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4b6MjkMDP0LbgTVineHDxUWBsSNbfSUQwt4mSRQjHjO6/1OCD
	y6IVpCOkDurmyzynKoPZYf5Y1loAqg8DWB6w0hPtpu37JT6Cvsgrm1fI
X-Gm-Gg: ATEYQzyv7H8iVkxPE8//0e9TVQZH3fi/+iLivl1V5Mkv6ABOg0pY9WA+IABtfbo/x47
	FGt6XLZqAUjVt8FQtpYBOXl6QvROT/lfT2cVA9X/1qN8DMY3zd+Vd+gtPVoGPMqrdxc4gRgO7px
	75f7jg0a/Q2tMXFswruCCTf0D3MFXRxRM4WMTAkNgO6nfRqszg1brooJSiB5Gp+H2CwQLiT2Kn4
	jvbzvxO+NPSifKqoDT3WODyFtfL9ZOYkDg42vsMd8D8phuJsp3Hq3+TfSLH1hiqnnWy7wpEYvJl
	EvQD4VIlUHFpVbTAH0s4waisuTuxkqovjvsQeNvhHBFDschCXb+bJ1UbZ6G04FYW9LfiKm2uuWf
	2DAN6PouD1uig431Hii1Tz8ecC4HXLgoq9DXO2N4ObOk+F/PHCYr5/uOIg8TB29R6FwdmLZJy5F
	BoWndC5pN1T9M=
X-Received: by 2002:a05:600c:3e0c:b0:480:4d38:7abc with SMTP id 5b1f17b1804b1-483c9bbcdf3mr295238065e9.11.1772573545049;
        Tue, 03 Mar 2026 13:32:25 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485187bf2fcsm6734425e9.4.2026.03.03.13.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:32:24 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 3 Mar 2026 22:32:23 +0100
To: sun jian <sun.jian.kdev@gmail.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
	Shuah Khan <shuah@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] selftests/bpf: bpf_cookie: make perf_event
 subtest trigger reliably
Message-ID: <aadTZ8r5XAn4-pOt@krava>
References: <20260228074555.122950-1-sun.jian.kdev@gmail.com>
 <20260228074555.122950-3-sun.jian.kdev@gmail.com>
 <aaVgTiHlc4rXvzKJ@krava>
 <CABFUUZGAK-kD75QAc8acfoGvPVj+EuaFNLT7rcPcWP7SOnpKqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABFUUZGAK-kD75QAc8acfoGvPVj+EuaFNLT7rcPcWP7SOnpKqw@mail.gmail.com>

On Tue, Mar 03, 2026 at 10:15:26AM +0800, sun jian wrote:
> On Mon, Mar 2, 2026 at 6:02 PM Jiri Olsa <olsajiri@gmail.com> wrote:
> >
> > On Sat, Feb 28, 2026 at 03:45:55PM +0800, Sun Jian wrote:
> > > The perf_event subtest relies on SW_CPU_CLOCK sampling to trigger the BPF
> > > -static void burn_cpu(void)
> > > +static void burn_cpu(long loops)
> >
> > nit, there's another burn_cpu in prog_tests/perf_link.c,
> > we could add it to trace_helpers.c or test_progs.c
> >
> 
> happy to refactor into a shared helper if maintainers prefer, but I keep it
> local to minimize the diff.
> 
> > >  {
> > > -     volatile int j = 0;
> > > +     long j = 0;
> > >       cpu_set_t cpu_set;
> > > -     int i, err;
> > > +     long i;
> > > +     int err;
> > >
> > >       /* generate some branches on cpu 0 */
> > >       CPU_ZERO(&cpu_set);
> > > @@ -443,9 +445,10 @@ static void burn_cpu(void)
> > >       err = pthread_setaffinity_np(pthread_self(), sizeof(cpu_set), &cpu_set);
> > >       ASSERT_OK(err, "set_thread_affinity");
> > >
> > > -     /* spin the loop for a while (random high number) */
> > > -     for (i = 0; i < 1000000; ++i)
> > > +     for (i = 0; i < loops; ++i) {
> > >               ++j;
> > > +             barrier();
> >
> > what's the rationale for barrier call in here,
> > together with the volatile change above?
> >
> 
> The burn_cpu() loop is only meant to consume CPU time to reliably trigger the
> SW_CPU_CLOCK perf_event overflow. With an side-effect-free loop, the
> compiler may optimize the loop away or significantly shrink it under -O2.
> 
> The old version relied on volatile to prevent the loop from being optimized, but
> checkpatch warns against it. Using barrier() achieves the same goal  — keep the
> loop intact as a CPU-burn  — while making the intent more explicit.

ok, would be great to have this in the changelog, other than that:

Acked-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka
