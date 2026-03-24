Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C423275AFD
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 12:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354617; cv=none; b=At+buqCxI0wYcuRYucZOJC86wSaG24MEkQJ3q9mmehW52CqfELXYMiveej/1xmidCRfHQzHNu7gHETxtwy8W6rC5HSaAE4IgqjmAjAGS2tiXkFOoWRe6K81uTPE96wa4clkZgcgvg777mfE+v3f7hY9qESTeu4WQV/ESkq2B43c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354617; c=relaxed/simple;
	bh=+RaXOIWqsw+n2zcRxpSYHf2lblZVauhGDnf9UUpapKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkAvGfzxXqezOTuoUcs5l8fJI7cdf0f0HShqs4smoDO8Vso0YJJTazu9AtvE9W0yyONAbyjc3okYtawPsoSlf/nDAUzJ6TTIedJ1VgltyNn2EFkbR6A2BovNIVSRCAr3Pb89MqUHvCdiTJ9WMKTdoohUDqUNFeRc5/gXgQzaoT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EU5q+0kr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OGi8nS5l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EU5q+0kr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OGi8nS5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774354615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4OtOkqE5K1/9sgyu+3hID1K7mKq/H1/ijDAgg14kY/I=;
	b=EU5q+0kr+HXWB3/KRQ+8JJ92JCLcSvkVu+EByipxzkh3U/u3DYEJ+PXsWp0fsAV+N3rSUf
	O8TURC2HUntzRziHPiMpkx53aUzXZoHgUJ1gJYxKIcM5ss48FUhDcjE0vKVE3Ns/++dA3w
	3lqM37+8rGPcrIp/azzqisO5nqMer58=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-vPDv4l97OY2Iw8lDNfRKvA-1; Tue, 24 Mar 2026 08:16:52 -0400
X-MC-Unique: vPDv4l97OY2Iw8lDNfRKvA-1
X-Mimecast-MFC-AGG-ID: vPDv4l97OY2Iw8lDNfRKvA_1774354611
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aeb90532f6so25450685ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 05:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774354611; x=1774959411; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4OtOkqE5K1/9sgyu+3hID1K7mKq/H1/ijDAgg14kY/I=;
        b=OGi8nS5lca0EmSBiUneLLaNRsgTvFyMr535mhPvHJgsUqMkbcucVeSfgVGBac6MwLA
         K8Gj1v0SroPmBuDQEJWRfVxQMx/zFOWqjeptg+lR2TJxACmfycKBUjyS02QtRx4+BE0m
         U9Cs203P1d+g2t+8fqAQ+flQOOUHt/FESSyPjm/iPxVG7l9EcruD9oGutbp58IzXDNLY
         CH1wBfINtYJN5YOa8/aTjuaq8t5lPGM/Vn+3UA0RV+ukWvx87qnFamZD0GPW4U4N1ORS
         Nq3PuDCHwYHUxzc2Dn67PPI3sZ2st3DZI5UpR5ytnfbpJjOdBAuZ4XOFOp0NHGoi6RQP
         /wUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774354611; x=1774959411;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4OtOkqE5K1/9sgyu+3hID1K7mKq/H1/ijDAgg14kY/I=;
        b=a/T3IZN1NFLxvPro0v49Fs6x6n1We4F5EUhUomvnUVX+SXQbuvxg12jX0Lzo9j3aNj
         ftyV6ioM5bLFpua+cMOQxEiyd6MvcdWyVop53Sx3KVipxTrSGSkF66SVT7P7t2eL+VMC
         4b77lB0qSgcZnPmcU5UyN6vfU5J9qVwcklVbIeHkzwq/Y12zUMuVGfywwkn+yuuZWjTN
         VNATOfUNqvTz+JxFMg1fqoRdKc+36xWBowtLrWCTMQ/1eKjjoxvW9QashpzI5Oi2q804
         3GnscNLqdWsUmWdvMX/+EDZWXFdTVU6xT3xYSNtWVRMgChdblP9XSWQDFBZc/OIpiqav
         FkDw==
X-Forwarded-Encrypted: i=1; AJvYcCXNrbYGZjgD/e5xD87J6/FoK7M8ThsRBciH2RVcwMMsl9UZMlT6sus/kqd6cC/h4beE3PBnIWuJEDNE3F6nE1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzyyGDYwsXRmpcwoJmgNJVJIMxiarEjvUiKoGznaZbCxCJhx0P
	DMPpSHY/VYg7EnBts7vrduOJeIWbylYby8lobrI0eFrgdEdwR6W/dqt6QB5jqmgCMYGaF+zwvmZ
	o1ZA955nnwoYOkTGnsV5EOgTZRXU4L1X8ew7mYIKAxle2ewvmuRGjRTaChrd73ENr27dZgw==
X-Gm-Gg: ATEYQzxESC2pFqDve1RFydGfssGkirU0I6OR3aFixgj8j1HQGzJZVL8bX9o8P6GXivz
	KhtUfwpKdZwQ3mmUc5W3+ekyh+EqH/TLWshxTSiFRt3kixWYbRcCWz9WxXhJ3Djvkmck+4HFUTx
	DAogYVgDpZ6l0v3G8BwZiUnvS3o98YaVYsAMM/xrxVMzYQcuGMwerN5BXACj6fJ5GpRZoutiZ83
	rH2EzzToa10pNKtT+uVK9W5shpKRs8EEWBlexUA4eVj0SspY/iXEYImHCowcDVRzI62GcN4HWV6
	rX0SLMP1GrunIhXSCcUYICOt9XdZXSr1XeVaJSrXfH4cY/uSah46VmQ54b+KsjSbJeS360maQD4
	8BRNIewrYp1B34ARS9w==
X-Received: by 2002:a17:902:ebc2:b0:2b0:7e4d:f390 with SMTP id d9443c01a7336-2b0827e6024mr157429815ad.41.1774354611242;
        Tue, 24 Mar 2026 05:16:51 -0700 (PDT)
X-Received: by 2002:a17:902:ebc2:b0:2b0:7e4d:f390 with SMTP id d9443c01a7336-2b0827e6024mr157429585ad.41.1774354610733;
        Tue, 24 Mar 2026 05:16:50 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083656b51sm183313715ad.54.2026.03.24.05.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 05:16:49 -0700 (PDT)
Date: Tue, 24 Mar 2026 20:16:47 +0800
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
Message-ID: <acKAr0TYzuYPxH4A@redhat.com>
References: <20260322061038.156146-1-liwang@redhat.com>
 <20260322091851.e965d3a2f0d6af5bd985407f@linux-foundation.org>
 <acCyPNCBoTGAJjfs@redhat.com>
 <CAO9r8zPxUv5V+VKEBuyacJUsc-UWh7hGc06yNQntY2GcUJLBPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO9r8zPxUv5V+VKEBuyacJUsc-UWh7hGc06yNQntY2GcUJLBPw@mail.gmail.com>

On Mon, Mar 23, 2026 at 05:12:27PM -0700, Yosry Ahmed wrote:
> On Sun, Mar 22, 2026 at 8:23 PM Li Wang <liwang@redhat.com> wrote:
> >
> > On Sun, Mar 22, 2026 at 09:18:51AM -0700, Andrew Morton wrote:
> > > On Sun, 22 Mar 2026 14:10:31 +0800 Li Wang <liwang@redhat.com> wrote:
> > >
> > > > This patchset aims to fix various spurious failures and improve the overall
> > > > robustness of the cgroup zswap selftests.
> > >
> > > AI review has questions:
> > >       https://sashiko.dev/#/patchset/20260322061038.156146-1-liwang@redhat.com
> >
> > > [Sashiko comments in patch 4/7]
> > > ...
> > > Could we update this loop, along with the identical loops in
> > > alloc_anon_noexit() and alloc_anon_50M_check_swap() shown below, to use
> > > sysconf(_SC_PAGESIZE) instead?
> >
> > I found that Waiman submit another patch that do same thing like this
> > suggestion. I'd consider to merge that one into my patch 4/7.
> >
> > So, let me talk to Waiman first.
> 
> Probably fits better in your patch.
> 
> > > The test data is generated by writing a single 'a' character per page, leaving
> > > the rest zero-filled:
> >
> > >       for (int i = 0; i < control_allocation_size; i += pagesize)
> > >               control_allocation[i] = 'a';
> >
> > > This makes the data highly compressible. Because memory.max is set to half of
> > > control_allocation_size, 512 pages are pushed into zswap.
> >
> > > 512 pages of mostly zeros can compress down to roughly 11 to 15 kilobytes
> > > using compressors like zstd, which is well below the 65536 byte (64k)
> > > zswap.max limit on a 64k page system.
> >
> > > Since the limit might not be reached, writeback might never trigger,
> > > causing the test to falsely fail. Should the test use incompressible data
> > > or a lower fixed limit?
> >
> > If Sashiko suggests reducing compressibility, we'd need to fill a significant
> > fraction of each page with varied data, but that would work against the test:
> >
> > zswap would reject poorly compressing pages and send them straight to swap,
> > and memory.stat:zswapped might never reach the threshold the test checks
> > with cg_read_key_long(..., "zswapped") < 1.
> >
> > So, at most I'd keep the data highly compressible and just ensure non-zero,
> > unique-per-page markers.
> 
> Sashiko claims that 512 pages will end up consuming 11K to 15K in
> zswap with this setup, do you know what the actual number is?

Not very sure, I guess each 64K page contains 1 byte of 'a' and 65535 bytes
of zero. A single page like that compresses down to roughly 20–30 bytes
(a short literal plus a very long zero run, plus frame/header overhead).
So the estimate is roughly 512 × 25 bytes ≈ 12.8 KB, which is where the
"11 to 15 kilobytes" ballpark comes from.

> Especially with different compressors? If it's close to 64K, this
> might be a problem.

Yes, good point, when I swith to use 'zstd' compressor, it doesn't work.


> Maybe we can fill half of each page with increasing values? It should
> still be compressible but not too compressible.

I tried, this method works on Lzo algorithm but not Zstd.
Anyway, I am still investigating.


-- 
Regards,
Li Wang

