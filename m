Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964A230BB8A
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 06:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774419134; cv=none; b=EuGj4ctYJ+fgx9kfRC1ifM/P1O6S56gJYhL+h+ZAaIbSqEkLgfsji33pESeDwp+bRiW+mJnCatSXwsKeQNV/gt4im1+dA/eXCC3twCeDMQ7SQ2X36daxkhUrTPDj1eEOjnyBDTK9CfrbDeQRpybBKacL0UrHfbbWUK0BC4MZEeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774419134; c=relaxed/simple;
	bh=RJkU11X+HwvjqFI6nWL9zHpiG4ZdUawuMrHcGisLGKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwHV+fOTbIMiDM5ajAVGQYZ/ND+48CaQOyyH/zXY25MJ3aRVGEgSLdmDWaDl6uMAL4LxV+L8+vK8gAwH1Uu9gZiebOGoDdriWFM9N+X/cwCkCEDRviq8IvI6fs/lcoUkmHsnZdE+lfwfm/GwJSB1EFC6HeEy81uTHeryjhD/piU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XoTECeiD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WB87xf7I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XoTECeiD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WB87xf7I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774419131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pvC9vhXMy61hfhFlVL91GaPXvIVhH/OQT1gyqQkgzEQ=;
	b=XoTECeiDhdhIU+3zN8rLRWy0SJajjrkMJ8Gzlq/kR4bO8DgFeOo5eZMMWBBd8yiZjuvKj1
	J+QuYuDQalAW19PXKE3WEhszQ1nc9n4rE1HfJPJWlkoW5rwDgIciG5ZkI5z1kUDZoZWzzq
	cnZQXpVliWbz2ND9LGIrlieEcyyTN6s=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-SQSwwowIPvqSHYLe0KtJyQ-1; Wed, 25 Mar 2026 02:12:10 -0400
X-MC-Unique: SQSwwowIPvqSHYLe0KtJyQ-1
X-Mimecast-MFC-AGG-ID: SQSwwowIPvqSHYLe0KtJyQ_1774419129
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b04911610fso21774365ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 23:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774419129; x=1775023929; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pvC9vhXMy61hfhFlVL91GaPXvIVhH/OQT1gyqQkgzEQ=;
        b=WB87xf7InFQFVzR1/EZ40VDMzbt742K65VYB4RYe0C3UGz7mqQR/ApMh95LoPdaojV
         QAedeWQ/ygPLxjxBAtomcHNAAyi53lojKuTsHWJO+GaL6ori84RyzWGBLnxE5EqzbXJZ
         ikzrckBPzXeDqE/luI/AgflGo44W5oB3r9NiPdKMBVB+CMXdxMyl0whUbzX2YrU2Rsub
         EhHZlD+QErZJwFGrvHwat8fouIq1BX6DXARc4TQCPDKQt2ZjMel/sKJJWZ4tFnhcgBnR
         2UHZw7+jsdhGYvOqQvNQn9YFnG81gzswwVhLVZRDopnu+wD4+IsiJ00PTSBwvu+K1xy3
         sghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774419129; x=1775023929;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pvC9vhXMy61hfhFlVL91GaPXvIVhH/OQT1gyqQkgzEQ=;
        b=b3xATpHEVlojxrEvOs8IPuAhJbswIZ9P7a92UU2SZcJNX19pMCPKn1tnMt7BuHYZBt
         FQN4H6iEgElcdgk9YucdeZaJXh7NKVOp7STzG/qlfL4bAPFm4lCVPGfHI8l87IoYju2F
         oHMTk95Su1/ZfXl6eO9ndeHH2rfCwiDF4j2ArApVFAgLPL4XmKWjMpbvBV3y80rrVTQc
         B/kFZAL4GocQDDBK881A3VlSOonLAgIbw2mSCbGNs6DmZgCMF95/P69oFwxpd/CVYIAa
         mBa1OLmynSb4rcHQ8dlw8f2bRA3gfsP6Z9lI9Z1n/Q2lC+6l1mO36NjpttNmBSmzZwhy
         NXAw==
X-Forwarded-Encrypted: i=1; AJvYcCUMkfajdoYVueu/r7dtoeANwlLbZIvPqjy/ZMpW4/FVWE/5LJUpS1buQhRUnZFaBcy6+NWSYA4+V4raBpkNeT0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9yoX4jWiYvy5tdUyPkovw51r436diX9ItN32k4qsNmp+gMs/l
	UIH9uChXKOlajXF9zjei+uMTf5ms7ETKKiu550A8/f2AfcqS8SH5OH5VvKpgFqLIgmYVV6KsLHC
	/3CZJrbRPZBu0a/X4UayCj4R6q0WkIc/T5wz4YKk8pRA5dzKovDxyYxf6pGDSvj5OMUZc0Y9/A5
	V8SQ==
X-Gm-Gg: ATEYQzygQVk2NcETvUtWyziHjQR3yCc5QV+JNRHm92evr2puRMIZdAdpVDkmE2jc+Q5
	F2b544sxo9O7rSd1HOTl/74OLj7UZnmBXj0uHKG2NWM67M8tfOkoP9Q6PROmefOuk4fvctUcBwn
	5wznXhDmuonk/dzo7sR3BWqwdylt2szYNJdGfK5O5hXoW2LJcOLCxnLPWZinFwpKRsNiz1mjH9T
	vAl4E+JlUYl/KCe2ocQMfJS1EhaHAqkFLOusy2iq8qt/FzBjVS7GBR/C3n2GKWf2MF6ItSnAbzU
	Ykl7Tm4V99VHOpBRFW1GXtdcM0Dnc7z+xDD2I62LBTvyYU7GhNBHabcSKRXenXz/P/lJqbdsMFn
	ZIqUdituF2sZW6uqXaA==
X-Received: by 2002:a17:903:38cd:b0:2b0:7a50:886f with SMTP id d9443c01a7336-2b0b0b1dc00mr26591225ad.51.1774419128525;
        Tue, 24 Mar 2026 23:12:08 -0700 (PDT)
X-Received: by 2002:a17:903:38cd:b0:2b0:7a50:886f with SMTP id d9443c01a7336-2b0b0b1dc00mr26590895ad.51.1774419128038;
        Tue, 24 Mar 2026 23:12:08 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083527f90sm164354805ad.19.2026.03.24.23.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 23:12:07 -0700 (PDT)
Date: Wed, 25 Mar 2026 14:12:04 +0800
From: Li Wang <liwang@redhat.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, longman@redhat.com,
	yosryahmed@google.com, nphamcs@gmail.com, hannes@cmpxchg.org,
	mhocko@kernel.org, mkoutny@suse.com, muchun.song@linux.dev,
	tj@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v4 0/7] selftests/cgroup: improve zswap tests robustness
 and support large page sizes
Message-ID: <acN8tN4FhuoxCxzs@redhat.com>
References: <20260322061038.156146-1-liwang@redhat.com>
 <20260322091851.e965d3a2f0d6af5bd985407f@linux-foundation.org>
 <acCyPNCBoTGAJjfs@redhat.com>
 <CAO9r8zPxUv5V+VKEBuyacJUsc-UWh7hGc06yNQntY2GcUJLBPw@mail.gmail.com>
 <acKAr0TYzuYPxH4A@redhat.com>
 <CAO9r8zOCGWSX1+t8-5qe+04UZ6i4mChPJ8hkpiS5Z8pAPZ0sZg@mail.gmail.com>
 <acNH6C6Ay7As4y60@redhat.com>
 <CAO9r8zO2Nq=8dGBuJ0xpQTEr4EM2iJ=WNULtCU5FLLj4a23dYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO9r8zO2Nq=8dGBuJ0xpQTEr4EM2iJ=WNULtCU5FLLj4a23dYA@mail.gmail.com>

On Tue, Mar 24, 2026 at 07:49:17PM -0700, Yosry Ahmed wrote:
> On Tue, Mar 24, 2026 at 7:26 PM Li Wang <liwang@redhat.com> wrote:
> >
> > On Tue, Mar 24, 2026 at 01:28:12PM -0700, Yosry Ahmed wrote:
> > > > > Sashiko claims that 512 pages will end up consuming 11K to 15K in
> > > > > zswap with this setup, do you know what the actual number is?
> > > >
> > > > Not very sure, I guess each 64K page contains 1 byte of 'a' and 65535 bytes
> > > > of zero. A single page like that compresses down to roughly 20–30 bytes
> > > > (a short literal plus a very long zero run, plus frame/header overhead).
> > > > So the estimate is roughly 512 × 25 bytes ≈ 12.8 KB, which is where the
> > > > "11 to 15 kilobytes" ballpark comes from.
> > > >
> > > > > Especially with different compressors? If it's close to 64K, this
> > > > > might be a problem.
> > > >
> > > > Yes, good point, when I swith to use 'zstd' compressor, it doesn't work.
> > > >
> > > > > Maybe we can fill half of each page with increasing values? It should
> > > > > still be compressible but not too compressible.
> > > >
> > > > I tried, this method works on Lzo algorithm but not Zstd.
> > > > Anyway, I am still investigating.
> > >
> > > Do you mean the compressibility is still very high on zstd? I vaguely
> > > remember filling a page with repeating patterns (e.g. alphabet
> > > letters) seemed to produce a decent compression ratio, but I don't
> > > remember the specifics.
> > >
> > > I am pretty sure an LLM could figure out what values will work for
> > > different compression algorithms :)
> >
> > Well, I have tried many ways for ditry each page of the total, but none
> > works on zstd compreseor.
> >
> > e.g,.
> >
> > --- a/tools/testing/selftests/cgroup/test_zswap.c
> > +++ b/tools/testing/selftests/cgroup/test_zswap.c
> > @@ -9,6 +9,7 @@
> >  #include <string.h>
> >  #include <sys/wait.h>
> >  #include <sys/mman.h>
> > +#include <sys/random.h>
> >
> >  #include "kselftest.h"
> >  #include "cgroup_util.h"
> > @@ -473,8 +474,12 @@ static int test_no_invasive_cgroup_shrink(const char *root)
> >         if (cg_enter_current(control_group))
> >                 goto out;
> >         control_allocation = malloc(control_allocation_size);
> > -       for (int i = 0; i < control_allocation_size; i += page_size)
> > -               control_allocation[i] = (char)((i / page_size) + 1);
> > +       unsigned int nr_pages = control_allocation_size/page_size;
> > +       for (int i = 0; i < nr_pages; i++) {
> > +               unsigned long off = (unsigned long)i * page_size;
> > +               memset(&control_allocation[off], 0, page_size);
> > +               getrandom(&control_allocation[off], nr_pages/2, 0);
> 
> This should be page_size/2, right?

Ah, that's right.

> nr_pages is 1024 IIUC, so that's 512 bytes only. If the page size is
> 64K, we're leaving 63.5K (99% of the page) as zeroes.

nr_pages is 512, but you're right on the analysis.

> > +       }
> >         if (cg_read_key_long(control_group, "memory.stat", "zswapped") < 1)
> >                 goto out;
> >
> > Even I tried to set random data for all of the pages, they still not
> > works (zstd). But it can be worked on lzo compressor, I don't know if
> > the zstd have any addtional configures or I missed anything there.
> >
> > My current thought is just to satisfy the lzo (default) compressor in
> > this patch series, and leave the zstd for additional work.
> >
> > What do you think? any better idea?
> 
> Let's check if using page_size/2 fixes it first. If a page is 100%
> filled with random data it should be incompressible, so I would be
> surprised if 50% random data yields a very high compression ratio.
> 
> It would also help if you check what the compression ratio actually is
> (i.e. compressed_size / uncompressed_size).

Randomly dirty the page_size/2 always led to OOM, so I swith to page_size/4,
it looks like both algorithms compress pages successfully, but zstd doesn't
update 'zswpwb' stat so that test result fails.

Considering that zswap writeback is asynchronous, I additianlly introduced
a polling method for checking 500 times, but 'zswpwb' still returned zero.

==== Test results ====

lzo: 
  # uncompressed: 51511296, compressed: 13353876, ratio: 0.26
  # get_cg_wb_count(wb_group) is 206, get_cg_wb_count(control_group) is 0
  ok 7 test_no_invasive_cgroup_shrink

zstd:
  # uncompressed: 48037888, compressed: 12019013, ratio: 0.25
  # get_cg_wb_count(wb_group) is 0, get_cg_wb_count(control_group) is 0
  not ok 7 test_no_invasive_cgroup_shrink

==== debug code for the above output ====

  long zswapped = cg_read_key_long(control_group, "memory.stat", "zswapped");
  long zswap_compressed = cg_read_key_long(control_group, "memory.stat", "zswap");
  ksft_print_msg("uncompressed: %ld, compressed: %ld, ratio: %.2f\n",
		zswapped, zswap_compressed,
		(double)zswap_compressed / zswapped);
  ksft_print_msg("get_cg_wb_count(wb_group) is %zu, get_cg_wb_count(control_group) is %zu\n",
		get_cg_wb_count(wb_group),
		get_cg_wb_count(control_group));

In summary, the problem is that 'zswpwb' does not update when zswap is executed
under the zstd algorithm. I'd debugging this issue separately from the kernel side.

-- 
Regards,
Li Wang

