Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A82C1D88B4
	for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 01:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779411823; cv=none; b=b9u78hpyDg5feuOsFyQwvfiv6eEWAsNSXcIvaUHZnuFaHgq/h6xt6Vohy66+ZGpbDOVP/TMPlyZIhPDdwdIaPIdJkvy711w29e4otRkjzwqCP/NM2gxtpnGhRC+bFO6M2aqjgSMa4S4sM4hg/nrFWkbWTNNzrq6xn3IsJ1qfe2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779411823; c=relaxed/simple;
	bh=jFuf+29sm0CT6yCCrd/GHo1vk06R/G857Y8gCI5R4Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYWabXQgSQPiTkH8zmpVstRRidZjt7TxrLkOEMK0NisCyfBUSTkttafgS31QajxOfIolgJGd7POjrAuGowT6gZLEQOccrEHLLf98DzbdpomyrO8h4ORCt7i2xLyGSxrYUGcSewgNLUdHeVdvwdvt61eOvM4Id4PeeeLHq7E/dcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LR/7kmEM; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LR/7kmEM"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36974217d4eso4298146a91.2
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 18:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779411822; x=1780016622; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wKk87Bzqf6zyI2T2MlfJ+TmLsi8WzInd0FzeqW5at+k=;
        b=LR/7kmEMDNSrT+3y6I4D5+4hNZEjVqHnRpMHG95sf5xE1etPIXr5EacboAff795Jif
         ulC1/Wxq590dqKhpTOVA0A0MzzT+HNLU7Uyh3qnz+0YmyiX0mS8yiVJ+fKYTEU8vEj5E
         yYLXEjHi6DL81Pso5CvaKo5AVMDQxa4foiAS63VD2zegJdIxhS13h/oQxqlO7BS6uqfl
         V/1Wx1EA22vBIPgHhAeb5giEjahEcof2y1UCAlkUnDuiIj8UxI/lb0pxYlAsqnF72my0
         9ZZdrI5eCPSaVItC0B714NCxsbT1IAEky9yTsL9ffL+J43wEvc0xQ5wqBUahQBQ6Ytr8
         Lodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779411822; x=1780016622;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wKk87Bzqf6zyI2T2MlfJ+TmLsi8WzInd0FzeqW5at+k=;
        b=f9qRJHiiixzpko8MCWGQjgIM7Xgytq79i2A32cawGtGtb+NEYm2vEq+XDi6ZDai1nS
         f1GPneR/u+s14hC6dDgesedx1CplTUaC1CIAxrdXYOrXgO7Dz3DOQN5F/uX+TgHnk02s
         0RpgemNtQRrdn3TmvoNASIC/BAG2Ayin/XxZVYGtW6cEGUz/PherhuvPiBiaG+6AegF7
         pnKvMkeg/9EmXOyFF1J8kMYOFn8Rdv/mvw6mIs2tVHlZvfBeP2nx/AvvtGg1qMNZ/xXx
         3gKsyzSvRbXkqlBLhgMopn42G+VMKJU+7Qrt3ibd+Oou+8qrCZ/EwepIkTB1C238pLdv
         eA0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9NkAbz2+ohCAg/3VPvyXnhqbusZsngbGcPQ4TKKPuHRpKonxp2hIu0klfrvhZ9l82W0AkzwiyBMYFgMHimODc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8xo05J4MfLVG3jPknVYyZmGXpdAe50qrqmcHwTsO/iJJ2kL3b
	GjSdYX14yi/68/NwDyyXOkkPkvpnGWCo43l/Vkd5MOI965QunwEiYPMk
X-Gm-Gg: Acq92OGeE2uKhwf06AhCbBec4GBo6vckYyutzXOHeHlvDE+3w9MPWdgVrzFL+qxPqH6
	wMfIVDbrh2coWAW7b/KNooH2MZ3iUbNsqUGhHGDVVN0Eo6Wsk1nqYLrkPCSplihyKx/3OCMOw5Y
	2H/GEP/WV0ug+vYKVfI9q8F1bS4GXxcunqf6rJv17nuW28K4pUc9+z4HGPLrR3VAZ2T6T6mHF1/
	t+6kE877E2vV1DDUbtkIbZr/HwkKLDHmLECO1WhjHq1q+3eTLYa9/vWPVwvrXq3YbX75zoaAax+
	buheOyX4z3aFugZGYbYREz25MhqBt9vtKkf50IPQ1Urk8iRrWY1Vmbh7vhQnCGdwS4zF7DgJYA3
	+dXHb4xkv/MRR3TqNp21byor9KCP0nNa2oAyYO9rp0OoHXp7mR8GrFYf0JE+/5QZcWTPXiFPE4S
	/BqkbNEf6OocYGdXGDg7QK/tNk26GeXoRiE9EThG4bXgV88l2tPue09IIcnTRpvgjxbg==
X-Received: by 2002:a17:90b:564f:b0:35b:e5ce:73bb with SMTP id 98e67ed59e1d1-36a676f5108mr1245665a91.1.1779411821776;
        Thu, 21 May 2026 18:03:41 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c98b95sm189315a91.16.2026.05.21.18.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 18:03:41 -0700 (PDT)
Date: Thu, 21 May 2026 18:03:39 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Liam.Howlett@oracle.com, david@kernel.org, jgg@ziepe.ca, corbet@lwn.net,
	leon@kernel.org, ljs@kernel.org, mhocko@suse.com, rppt@kernel.org,
	shuah@kernel.org, skhan@linuxfoundation.org, surenb@google.com,
	vbabka@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 0/3] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-ID: <ag-ra7N7KbUxXPyG@skinsburskii>
References: <177928604779.589431.14703161356676674288.stgit@skinsburskii>
 <20260521163309.c5cc5d3f6cf16bac212cf90b@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521163309.c5cc5d3f6cf16bac212cf90b@linux-foundation.org>

On Thu, May 21, 2026 at 04:33:09PM -0700, Andrew Morton wrote:
> On Wed, 20 May 2026 07:09:19 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > This series extends the HMM framework to support userfaultfd-backed memory
> > by allowing the mmap read lock to be dropped during hmm_range_fault().
> > 
> > Some page fault handlers — most notably userfaultfd — require the mmap lock
> > to be released so that userspace can resolve the fault. The current HMM
> > interface never sets FAULT_FLAG_ALLOW_RETRY, making it impossible to fault
> > in pages from userfaultfd-registered regions.
> > 
> > This series follows the established int *locked pattern from
> > get_user_pages_remote() in mm/gup.c. A new entry point,
> > hmm_range_fault_unlockable(), accepts an int *locked parameter. When the
> > mmap lock is dropped during fault resolution (VM_FAULT_RETRY or
> > VM_FAULT_COMPLETED), the function returns 0 with *locked = 0, signalling
> > the caller to restart its walk. The existing hmm_range_fault() is
> > refactored into a thin wrapper that passes NULL, preserving current
> > behavior for all existing callers.
> > 
> > Faulting hugetlb pages on the unlockable path is not supported because
> > walk_hugetlb_range() unconditionally holds and releases
> > hugetlb_vma_lock_read across the callback; if the mmap lock is dropped
> > inside the callback, the VMA may be freed before the walk framework's
> > unlock. Hugetlb pages already present in page tables are handled normally.
> > Possible approaches to lift this limitation are documented in
> > Documentation/mm/hmm.rst.
> 
> Thanks.  AI review identified one possible issue, possibly a duplicate
> from the v2 series?
> 
> 	https://sashiko.dev/#/patchset/177928604779.589431.14703161356676674288.stgit@skinsburskii
> 

I think this Sashiko finding is a false positive for current kselftest_harness.h.

ASSERT_EQ() expands to __EXPECT(..., 1), then the optional handler calls
__bail(1, _metadata). For assertions, __bail() calls abort() after
fixture teardown, not a plain return from the test function. See tools/
testing/selftests/kselftest_harness.h:521 and
tools/testing/selftests/kselftest_harness.h:962.

So for these lines after pthread_create() in
tools/testing/selftests/mm/hmm-tests.c:2979, a failed ASSERT_*
terminates the test process. The background thread does not continue
running after the test function returns with uffd_args popped, because
there is no normal return from the assertion path.

There is still a cleanup-quality argument: aborting skips the explicit
eventfd wake, pthread_join(), and frees/closes. But in a kselftest child
process that should be an acceptable failure-path behavior, not a stack
use-after-free.

> I'll take no action at this stage, shall await reviewer input.  Please
> poke me in a week or so if nothing has happened.
> 

Given the explanation above, I don't have an intent to address sashiko's
comment and send another revision unless you are certan there is an
issue to fix there.
If you are, please let me know.

> Which is quite possible - things seem rather hectic at this time and
> we're almost at -rc5!

Indeed.

Thank you again for your time,
Stanislav
