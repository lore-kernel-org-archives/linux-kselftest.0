Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8EE1E0B9C
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 03:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774236229; cv=none; b=WCQCIF8wcSLKF82ZboUNKlzXJlgp+CKi3paQDPt2veK1jsi4a2esRwvxmkJ1mWkOklRlNcuZ6KJRYP0TNYZInLUHJdNsEOrJSztTSoJT8MpvW5sXKf6qNugbnFOeUu3jtASuNWXWVo6NmXTknOXfwYmZN9Boiyk8l42WPt1LC7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774236229; c=relaxed/simple;
	bh=dvdkF/UsKfSpzISBzg+hQVtnBMhk/G6USXEJ2GRrMBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+544dH9kcCvg1N6sX7XssRmBO3qir8DfDu5tQGVhnvErLKhtR5ewEMDN9ZRPfRY58ybFuXgpwCEzi0jZBsX9YTE2YfuilI9UcUBCOMG+lc64azBUPr+gh1orBMs17i5dhG+e34zWhzAGp7W1I2v011fFYyiqv2jtO2lYNYIksY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gAxva1fr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y6iD4Nsi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gAxva1fr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y6iD4Nsi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774236227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WuN4IVRpe2UV4/L8jmgWKZsUdAcN2rX2txKuBjApf3Y=;
	b=gAxva1frmV9XD7G/MBT4ymYEsLourcdtcD/mCBe7npDfWmALp5WQ2dLcdehLDEwx7B28As
	hIz2Dvahdnxejhq/spPiCjczLeV0BPRo8vC+gVendWKLgk0echQW8GlYoYgcfVkfJFG28c
	ysQwKFKBckC+EJpyOQ1oKTD1V9dAFc0=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-s5hBaZYXP5OgS4ibV9H10g-1; Sun, 22 Mar 2026 23:23:45 -0400
X-MC-Unique: s5hBaZYXP5OgS4ibV9H10g-1
X-Mimecast-MFC-AGG-ID: s5hBaZYXP5OgS4ibV9H10g_1774236224
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c73a4983fc0so2742226a12.3
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Mar 2026 20:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774236224; x=1774841024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WuN4IVRpe2UV4/L8jmgWKZsUdAcN2rX2txKuBjApf3Y=;
        b=Y6iD4Nsivrf1/SDZLRKO19Fxh4xhA5Tkxzob5rTQXDEplS4gsquyUjOvbblqsx1adI
         EQhWWzQqoQzL7L7kOZoc4Vqn/1r9Te8Yhxgt9xJSgB3A3Fq1mY/fZGulsflFmUDJd05W
         jHCApMS//dfOQztL0USL8/V6dA84J9m7dScCvO151sVJQIpNiSUQhE9UXlavPiP9uuV+
         wv0eUQzS01g+CmVC1SJuJWnPplcpuDsI1Zy5cv+i1Dh/y7CtBpAKn+eWM//G/N9PafNc
         mbavrjCYzUs2xLAcJBEra7+5xQ20bFJvtDiVL/4nw2rECcjQIEzudmP0SRdvNDcf6YXb
         eWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774236224; x=1774841024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WuN4IVRpe2UV4/L8jmgWKZsUdAcN2rX2txKuBjApf3Y=;
        b=dVpHsOBV5OUKmKMuIIvtfujba/U8sJR25sUoaxGOupOtWGwqnwS/l7izUkjgLe0IDD
         RjvXuaVrOaJt3dCHXzlEmdG/vgYs0TVN2imXGjn8ecr9WhalYSmf53CeUpKuOFeOdgKa
         YwfQEdb/iBxsvQxI/W9ojk7eV3coAYQRuFb/qjdC17QZOE2bvCTLXbj7kOZbmMjnWKAt
         62nlFLbk2iPKkgP2bQCOO+cSIfHlDdVa6aJJoTq2gxS47RRTsxAluZ8yqGMg7MfjEhHx
         d++T1qOqgShu3Ucmr5/qVuQW/pCmLHIvO+J9OFhFtgu/4A+v/TH4xQ9XYZIea5TIVJiv
         8oGA==
X-Forwarded-Encrypted: i=1; AJvYcCXVwMoIq5P1xqrtxkye3OfocArT+fV9K8tQ2SB0im/GUMD1ntaLaiP//NJFbW5HzwZlLWt5/YuHFnLrx6WRk9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs3jQG9GVLywSmS1eWOpXCij3XhlmAJvAbM+kFm4bgSzQgmKOD
	jDH+DkIqqtPdf+y7q2gwVXKEae9Ly9E+Cj/F/3geUN4prUje1h2EcicnIjs3qfJlJnYSM3abwgj
	9Fx8LxYjSi2ejH14yTuh5tt0X+v+EnpWslQZqunvUVwtE1R2SJ3yNJWvvawDXRMfHL/iM6Q==
X-Gm-Gg: ATEYQzzqye9tJmng0VXE/9ZpLW65hX8TwskYp6r6Hs0F1bQgToE6EzcUwrsT8XP3Fd5
	ov/3J2WVleGJFVfpsl2cpHpNLmbu7NyqWHhsWEpccvUKtx+90EslLjr7u9VZn+WrFvQZsY/TjmW
	DqgYPZrDKNoNuTbVWrodyt7p5qXEsKjx4w25A1s8aFymqupsVfBVwEvUi+7R2O564g4neGB5e60
	SyiQ9LRzdN8UoU5CIiGH7umELItt2MS7U03jnYjFAOKNu3dAkirfUIZ2+dogizGS2z5LhAT2iwC
	dF4tPV19hkO4xUhSkJZruP2Ui2ai0wms1fGNFGRlWBNK1TyU9QlPobvsGe5nuKvIm8+B3N6PAp7
	TR2auICPRikjHEi5d7g==
X-Received: by 2002:a05:6a20:94cb:b0:398:d82c:ae6 with SMTP id adf61e73a8af0-39bceb427a6mr9147196637.31.1774236224292;
        Sun, 22 Mar 2026 20:23:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:94cb:b0:398:d82c:ae6 with SMTP id adf61e73a8af0-39bceb427a6mr9147173637.31.1774236223867;
        Sun, 22 Mar 2026 20:23:43 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74443ccbe4sm6215654a12.22.2026.03.22.20.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 20:23:43 -0700 (PDT)
Date: Mon, 23 Mar 2026 11:23:40 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>, longman@redhat.com
Cc: yosry@kernel.org, yosryahmed@google.com, nphamcs@gmail.com,
	hannes@cmpxchg.org, mhocko@kernel.org, mkoutny@suse.com,
	muchun.song@linux.dev, tj@kernel.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 0/7] selftests/cgroup: improve zswap tests robustness
 and support large page sizes
Message-ID: <acCyPNCBoTGAJjfs@redhat.com>
References: <20260322061038.156146-1-liwang@redhat.com>
 <20260322091851.e965d3a2f0d6af5bd985407f@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322091851.e965d3a2f0d6af5bd985407f@linux-foundation.org>

On Sun, Mar 22, 2026 at 09:18:51AM -0700, Andrew Morton wrote:
> On Sun, 22 Mar 2026 14:10:31 +0800 Li Wang <liwang@redhat.com> wrote:
> 
> > This patchset aims to fix various spurious failures and improve the overall
> > robustness of the cgroup zswap selftests.
> 
> AI review has questions:
> 	https://sashiko.dev/#/patchset/20260322061038.156146-1-liwang@redhat.com

> [Sashiko comments in patch 4/7]
> ...
> Could we update this loop, along with the identical loops in
> alloc_anon_noexit() and alloc_anon_50M_check_swap() shown below, to use
> sysconf(_SC_PAGESIZE) instead?

I found that Waiman submit another patch that do same thing like this
suggestion. I'd consider to merge that one into my patch 4/7.

So, let me talk to Waiman first.


> [Sashiko comments in patch 5/7]
> ..
> if (zswpin < MB(24) / sysconf(_SC_PAGESIZE)) {
> Should these also be updated to use the new global pagesize variable for
> consistency? Subsequent patches in the series do not seem to correct this
> omission.

Good catch, that remainds should be corrected too.

> If control_allocation is NULL, wouldn't the loop immediately dereference it
> and cause an unhandled segmentation fault rather than a graceful test
> failure?

That's right, but better to be resolved in another series, not this one.

> However, there does not appear to be a corresponding munmap() call in the
> test's cleanup path. Although the OS reclaims this memory when the test
> process exits, should this explicit unmap be added for a balanced resource
> lifecycle within the test?

That's right, but better to be resolved in another series, not this one.


> [Sashiko comments in patch 6/7]
> ...
> If malloc returns a null pointer in a memory-constrained environment, the
> loop will unconditionally dereference it. Should there be a null check
> before the loop?

That's right, but better to be resolved in another series, not this one.

> The test data is generated by writing a single 'a' character per page, leaving
> the rest zero-filled:

> 	for (int i = 0; i < control_allocation_size; i += pagesize)
> 		control_allocation[i] = 'a';

> This makes the data highly compressible. Because memory.max is set to half of
> control_allocation_size, 512 pages are pushed into zswap.

> 512 pages of mostly zeros can compress down to roughly 11 to 15 kilobytes
> using compressors like zstd, which is well below the 65536 byte (64k)
> zswap.max limit on a 64k page system.

> Since the limit might not be reached, writeback might never trigger,
> causing the test to falsely fail. Should the test use incompressible data
> or a lower fixed limit?

If Sashiko suggests reducing compressibility, we'd need to fill a significant
fraction of each page with varied data, but that would work against the test:

zswap would reject poorly compressing pages and send them straight to swap,
and memory.stat:zswapped might never reach the threshold the test checks
with cg_read_key_long(..., "zswapped") < 1.

So, at most I'd keep the data highly compressible and just ensure non-zero,
unique-per-page markers.

i.e.

  control_allocation[i] = (char)((i / pagesize) + 1);

-- 
Regards,
Li Wang

