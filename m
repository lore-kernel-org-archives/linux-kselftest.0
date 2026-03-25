Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C931283CBF
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 02:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774405617; cv=none; b=P6i8nfgT8DteBhArVNePwtAPSeuea8imYqTHc6eNdwGFHKZVtSuwoXSt34mXXJDe6i+Ambe4lVArzxXRs/b9t+24Wf27UDKWPTUzmkt4t+ga+EjzmR3GlWf9pBBP498VO1SJLCUXWrS+Xewytohc80a+az4kcQEtnakH+qFbKuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774405617; c=relaxed/simple;
	bh=uaOXi8+Uaz+CtoxjqhLmQyoQhmCYXQYtJirqEaqsTuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4Zm+l6ud9wqVRjdwN5mZwKH5c+wh2LplUBP25DMQNFweset3YxovJP+BSk3vTlYGxaY17najcGLOK+n7u4+swSKEDgOD50A2esOA5yvzn43KwkeQ5TKmYyw8iM2dUgRK4gEoXKQZEc6I0D68rrPL3ILhPZ4k+DB7+EdKtH9n9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M/z8VoD8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RWzVho1a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M/z8VoD8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RWzVho1a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774405615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GGhwUXkV7JnIH35nWRgyF7GMpBr4atLQijvaTPOK50k=;
	b=M/z8VoD8bBszzfEIbVp85fugR41Y/N3xZ04fI9EJEX5Sjb7rWadjUUNKCizW2Pq+giCAdY
	ZA5nLEntUo4fVuqvQaUCDb+v5Gs9gpXv+AAGrwsbbbCG5ZA/3//4cmRZSxOEmKyh+nRoNE
	uRMvqTPWGQmOsjjQsWSRA5NWBlfHoiA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-2S29NuNAMkuFEkV4GPdtvw-1; Tue, 24 Mar 2026 22:26:53 -0400
X-MC-Unique: 2S29NuNAMkuFEkV4GPdtvw-1
X-Mimecast-MFC-AGG-ID: 2S29NuNAMkuFEkV4GPdtvw_1774405612
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso2699315a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 19:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774405612; x=1775010412; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GGhwUXkV7JnIH35nWRgyF7GMpBr4atLQijvaTPOK50k=;
        b=RWzVho1aD8xLapD0FHj4+4PoHyL2xwQT1KIeH3NVfD1yvE7RaJs97+Mli7VYIMoYTA
         YC8Ab/oYU99txqQXpOfQtR06yIiL5Emr441V11KdyVqmLQndax4l3dGMqHfWHsPNEtPL
         0r3IziIogmFUidyXutfxWdMB92mHdOBcvbJ2atZvlr44I0HTy5SAJF0u2l8qnWaUoPDg
         GdQmD7BeINRK0hAdVnNdH/9IISfzi12EbVVksxWzyUR6UDFA+an7xWG9nYuZaZV1vsth
         age8rY1JcruSYcCLmDxNNoaB8zmn058w/s0f2rVP2ypPBCoGQjTioPYfCfvpPD7t6OE2
         ukUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774405612; x=1775010412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GGhwUXkV7JnIH35nWRgyF7GMpBr4atLQijvaTPOK50k=;
        b=OEfQZxGCrqXWL3Y2Hrtfh7gPOrQuOj6JbekK66tmiRXW5+TATTEl/66CfwWABxTZOC
         ylK7MnO3yFHKBXYWVGdredSSGvMawesED3QLmjnsUMJ1fkz6JU2xBH1sUqvAtm9I9vWz
         ZxI31CGkiHjMqwse3fZNVJ68+FLUeNBf3uxzwmsRK7DKg3o23kdFxfrov6R0XYfxkrK0
         uP5j7tlu524HLl3zXjOyrdDgS4JtFXnWaBpIoyYIiK9i064lfidjHBJfj/hjwnCvGw7a
         HPZX37xg8NZ9ZLSGs8OV36jCxqYZWBTHlMZxgTmrERlXluFdoDunDtUcBw81MpFkL3se
         gq0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxlnX7HIgzVBkr+NQgkTDi303Uhz+wT0D1vo+6/SpnXlDvp4WiubLP4P3Fp9hQsqZAGYgOiBzxcw8/Qi0AMC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZyKeLObRkl7jcbo5yviIQWngJmIH/k6ORUrwcHpOwwITOvzIS
	tXw5/jPTCUjR1hPbELEk7END19OQ23uX0Wux6Y62SGrf8fd7lEOOsZ0rt09lWnA5y+RYc69quK7
	izqM0uXaVwHgA1RHP+9DnHJhrE+Y4K44JLHbHm+9zA/Uv9hmkPOGls/b2vxzw05wQaQDzdg==
X-Gm-Gg: ATEYQzz4VEgMXmUvKfX+JgSZJm1lnr03Pz78q2nCN4i8yCUPwaakUYCf8ebj/606Dy7
	X4NmprUUGSiY/RMJLcr7oE2YUhI5TDyosecgiG2/D4HAFC7purYQc7wxGPeH4hqHKMMXr1eHJ5u
	E048u4fAkZQ9qa71YpU6vOoFFsJFvWhSFjhAOrjhNZpjhtQ1CY53V86EdPUWa6h/n1WeEzoV/YO
	Kyecc+xhVodA4dAepyse6i1ogZaUSg0xcBaLqWr6aGdG8I6CtIKOgLsLFPHr2niEaPok/xocssV
	E1TmWtQXsQci/uw9dJboB/IPUVSnZfuHnQyQqNe/PllVwgEtyz93XW2A5A3vEyL2isXwU8BPJ/E
	AzMu6oA4jbddOOMl/cA==
X-Received: by 2002:a17:90b:3fcd:b0:359:1821:b4d5 with SMTP id 98e67ed59e1d1-35c0dcb0d3cmr1536846a91.5.1774405612258;
        Tue, 24 Mar 2026 19:26:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcd:b0:359:1821:b4d5 with SMTP id 98e67ed59e1d1-35c0dcb0d3cmr1536815a91.5.1774405611803;
        Tue, 24 Mar 2026 19:26:51 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0e95653csm245975a91.4.2026.03.24.19.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 19:26:51 -0700 (PDT)
Date: Wed, 25 Mar 2026 10:26:48 +0800
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
Message-ID: <acNH6C6Ay7As4y60@redhat.com>
References: <20260322061038.156146-1-liwang@redhat.com>
 <20260322091851.e965d3a2f0d6af5bd985407f@linux-foundation.org>
 <acCyPNCBoTGAJjfs@redhat.com>
 <CAO9r8zPxUv5V+VKEBuyacJUsc-UWh7hGc06yNQntY2GcUJLBPw@mail.gmail.com>
 <acKAr0TYzuYPxH4A@redhat.com>
 <CAO9r8zOCGWSX1+t8-5qe+04UZ6i4mChPJ8hkpiS5Z8pAPZ0sZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO9r8zOCGWSX1+t8-5qe+04UZ6i4mChPJ8hkpiS5Z8pAPZ0sZg@mail.gmail.com>

On Tue, Mar 24, 2026 at 01:28:12PM -0700, Yosry Ahmed wrote:
> > > Sashiko claims that 512 pages will end up consuming 11K to 15K in
> > > zswap with this setup, do you know what the actual number is?
> >
> > Not very sure, I guess each 64K page contains 1 byte of 'a' and 65535 bytes
> > of zero. A single page like that compresses down to roughly 20–30 bytes
> > (a short literal plus a very long zero run, plus frame/header overhead).
> > So the estimate is roughly 512 × 25 bytes ≈ 12.8 KB, which is where the
> > "11 to 15 kilobytes" ballpark comes from.
> >
> > > Especially with different compressors? If it's close to 64K, this
> > > might be a problem.
> >
> > Yes, good point, when I swith to use 'zstd' compressor, it doesn't work.
> >
> > > Maybe we can fill half of each page with increasing values? It should
> > > still be compressible but not too compressible.
> >
> > I tried, this method works on Lzo algorithm but not Zstd.
> > Anyway, I am still investigating.
> 
> Do you mean the compressibility is still very high on zstd? I vaguely
> remember filling a page with repeating patterns (e.g. alphabet
> letters) seemed to produce a decent compression ratio, but I don't
> remember the specifics.
> 
> I am pretty sure an LLM could figure out what values will work for
> different compression algorithms :)

Well, I have tried many ways for ditry each page of the total, but none
works on zstd compreseor.

e.g,.

--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -9,6 +9,7 @@
 #include <string.h>
 #include <sys/wait.h>
 #include <sys/mman.h>
+#include <sys/random.h>

 #include "kselftest.h"
 #include "cgroup_util.h"
@@ -473,8 +474,12 @@ static int test_no_invasive_cgroup_shrink(const char *root)
        if (cg_enter_current(control_group))
                goto out;
        control_allocation = malloc(control_allocation_size);
-       for (int i = 0; i < control_allocation_size; i += page_size)
-               control_allocation[i] = (char)((i / page_size) + 1);
+       unsigned int nr_pages = control_allocation_size/page_size;
+       for (int i = 0; i < nr_pages; i++) {
+               unsigned long off = (unsigned long)i * page_size;
+               memset(&control_allocation[off], 0, page_size);
+               getrandom(&control_allocation[off], nr_pages/2, 0);
+       }
        if (cg_read_key_long(control_group, "memory.stat", "zswapped") < 1)
                goto out;

Even I tried to set random data for all of the pages, they still not
works (zstd). But it can be worked on lzo compressor, I don't know if
the zstd have any addtional configures or I missed anything there.

My current thought is just to satisfy the lzo (default) compressor in
this patch series, and leave the zstd for additional work.

What do you think? any better idea?

-- 
Regards,
Li Wang

