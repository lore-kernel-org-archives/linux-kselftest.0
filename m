Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BF23E40F3
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 21:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198850; cv=none; b=K0BzhjB880f1RpRam1pSMErRtr41acx5m2Cqcnw8EEpKlS8VYAHHJ6zuspadqXXUgOTCsvJCFUhidBzy4R1SdmWyCLgoXEqeP0CTxsyqxVqPnTHKNB1tNFGs5hyf1DsUCT2H8SAYGwkupPFgOsnU3YKn4daulVlvVbw0kVs0928=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198850; c=relaxed/simple;
	bh=mkllFitehUiHcmTvhleoFTAEeeQDf9V9+bo50ETCWgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGG4GHdiIiX7bhZsVmJ5Jzbu9aJsrHsak1Lbnybra+44FO3fA2Te+M9om0bXDAYWME4DY2SDGcjZWIEiBsKS8exqlp9WvGt7WvmrUaVjCu90kjyfl3z3IFDotl/KGc+HYK9s9dYZBT7wLNGh53LNFwjp/BAGfD7kzAJPIzvJtBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=QAl4XaJL; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="QAl4XaJL"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb766bfd6so12756331cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790198845; x=1790803645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PcUop+HZQcR1eSCakcCGo/nA+544kosGhnj83z0mc1s=;
        b=QAl4XaJLfWTcEjCbmFDZyfxjxbSRRonMFfCcpp9GApt2uEFHHYod3l2E1g1CUgtIdF
         FvT5NmNsnrdK73UYC1FkazeeoKD3gevv+zHL9F65S6nQJl3wuqF8sVRETdELJcanwnYN
         UQQf5zhU07/4JVVpY1q6KDHhfiFXD11Uv+AaG5DFvCZggQ94ax1uJiSxQJvBxBVT2SMy
         thhagTV36EMRj32iYmQXJG0HHR2dofZerwBYKuUcyxADJGXGxcRjzqDGhOfx07NHNINf
         ZxOMPJOfNDs/7N++75TDagDSy2vYcVznpqA8dMlpeAQGflrRfiuJDrg+M3Y50Q8oTOAV
         89+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790198845; x=1790803645;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PcUop+HZQcR1eSCakcCGo/nA+544kosGhnj83z0mc1s=;
        b=x1OZD2eOUexGvDGNYUVrr1A/cLGTR3pIXBZyM5RDnso8qYv/W2Myz5z67NBy9FmqDz
         70LKfKuaSbZmp8h6RvRElnmJHeW4PbMd/LQRtHxRqdErAQrdzRIyg94jnMZVMzrpixXB
         7dGmbTSjhMRGHWI+HE1/ds1BPQ4Hpbf0XBpl9mcXv0siUM/4BuFn84NGmh8Ac1l0zwih
         FyxPyDKaCRuWBNJsDTomxrQ5bB8d9YWvdlxSv3+MicKdJ8OyMYIhKcuIT2O/oOBJ1j0b
         6omR0Y6bpxiDF4ISBWhEWUhr/yz4vzUyLzNnETkHo2NQna1nOM4zTQIUSdFAMSdDHL/5
         CGOg==
X-Forwarded-Encrypted: i=1; AKwUvBwnOvT7nL+gK6ch+6nbs6VHGMQZCcONZF/DIPfirYI+ztAyB87poluADwmxpmEWY7wRGcauTGI2QWB+bYVkQ0Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lrGKKyMoUKu1LV0vJq2xxQgFJrvXAkOKJH4KjPv7R4XwrRL3h1
	mQWClyoBN5aQQ4QMSD8kywtHP+cg0D3C3AG++itD4S+60jjjGvV/CvrmkMoLzP1qqVA=
X-Gm-Gg: AYBFou1Fe+Y+gvtRIZp31/Jj9+g6kn/KH89hpUUyYP8dWKjszguDfTFg6htTlDNSgMt
	wNkWyj9inY3L0CtRQdJ6FzkmRPLSOzu0L6Zx8vQLgmNe+K2it0n/iMXiaFOivhgZv/L6kdj+wpn
	Ba/RJqBqUdKTvz9EnksvSltUAw+zD6+VZDJvziNQ19wD6UtoPdLskIM3RnUoL549soO0t1Oc5I9
	N8VW8AfTUOoRdQY6tXJldA25d5B8GNZO68mSg7Si7lkqLBekhj3QQfm8bu0E0tepAB3flZbXt9S
	/uaCZzHHGnnu3aeCnoRj4dbxNAxVRvAzUKTsbjNiufqNCyi/hSSqvYcDsuatcr3hds+eOqs05IF
	1dpIhEk4HOwzGbPVDx2HLW7y7YXE76gXfkmYrn7cofv4JMYx70bLrfA3BT4rzb8NmPvlF+sBuIv
	9fnXj/fzqnOTQDXv3tStR3uAbXDc6cHReYY3VaK73N3WRIF6tv/gxWumnejzqJ27Qq+ZX3QBlS2
	C9pY1YhitPGpekRSQHE70dKlUMuJCRmJpgAmfwylNtTzrh1AN7BDN+Q
X-Received: by 2002:a05:620a:1724:b0:939:9b1c:ea4c with SMTP id af79cd13be357-93c3470cfd4mr78173685a.28.1790198843910;
        Wed, 23 Sep 2026 14:27:23 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e27b5c3sm3228816d6.30.2026.09.23.14.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:27:23 -0700 (PDT)
Date: Wed, 23 Sep 2026 17:27:21 -0400
From: Gregory Price <gourry@gourry.net>
To: Park Tae-sun <ts930@dgu.ac.kr>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Muhammad Usama Anjum <usama.anjum@arm.com>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: fix mlock2 errno handling and false PASS
 on ENOSYS
Message-ID: <arRD62HaBCs4Svcz@gourry-fedora-PF4VCD3F>
References: <20260923-selftests-mm-mlock2-fix-v1-1-750b627854c6@dgu.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-selftests-mm-mlock2-fix-v1-1-750b627854c6@dgu.ac.kr>

On Wed, Sep 23, 2026 at 06:26:48PM +0900, Park Tae-sun wrote:
> While inspecting selftests/mm syscall wrappers, I noticed that mlock2_()
> in mlock2.h handles the syscall return value differently from other
> wrappers:
> 
>     int ret = syscall(__NR_mlock2, start, len, flags);
>     if (ret) {
>         errno = ret;
>         return -1;
>     }
> 
> Commit 1ddae9d67ee1 ("selftests/mm/mlock: print error on failure")
> introduced this intending to make mlock2_() behave like libc by setting
> errno and returning -1. However, glibc syscall(2) already returns -1 on
> failure and sets positive errno. Assigning "errno = ret;" overwrites
> errno with -1.
> 
> To verify this, mlock2 was disabled in the kernel (via sys_ni_syscall) to
> return -ENOSYS. Testing revealed two interrelated defects:
> 
> 1. In the unmodified test, mlock2_() clobbered errno to -1. The check
>    "if (ret && errno == ENOSYS)" in main() was bypassed, resulting in an
>    immediate crash in the first test:
> 
>        ~ # ./mlock2-tests
>        TAP version 13
>        1..15
>        Bail out! mlock2(0): Unknown error -1
>        # Planned tests != run tests (15 != 0)
>        # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>        (exit code: 1 - FAIL)
> 
> 2. After restoring mlock2_() to directly return syscall(), errno correctly
>    retained ENOSYS (38), entering the ENOSYS check in main(). However, it
>    then called ksft_finished():
> 
>        ~ # ./mlock2-tests
>        TAP version 13
>        # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>        ~ # echo $?
>        0
> 
>    Because ksft_set_plan() had not been called yet (ksft_plan == 0) and
>    zero tests ran (ksft_pass == 0), ksft_finished() evaluated 0 == 0 as
>    success and exited with KSFT_PASS (code 0) without any TAP skip header.
> 
> Fix both issues by:
> 1. Returning the syscall() result directly in mlock2_() so that errno is
>    preserved.
> 2. Calling ksft_exit_skip() on ENOSYS so unsupported kernels report a TAP
>    skip ("1..0 # SKIP ...") and exit with KSFT_SKIP (code 4).
> 
> Verification on the mlock2-disabled kernel:
> 
>     ~ # ./mlock2-tests
>     TAP version 13
>     1..0 # SKIP mlock2() syscall is not supported
>     ~ # echo $?
>     4
> 
> Re-enabling mlock2 in the kernel confirmed all 15 tests pass cleanly:
> 
>     ~ # ./mlock2-tests
>     TAP version 13
>     1..15
>     ok 1 test_mlock_lock: Locked
>     ...
>     ok 15 test_mlockall_future_droppable: droppable memory not locked
>     # Totals: pass:15 fail:0 xfail:0 xpass:0 skip:0 error:0
>     ~ # echo $?
>     0
> 
> Fixes: 1ddae9d67ee1 ("selftests/mm/mlock: print error on failure")
> Fixes: 65c89684896d ("selftests/mm: mlock2-tests: conform test to TAP format output")
> Signed-off-by: Park Tae-sun <ts930@dgu.ac.kr>


Reviewed-by: Gregory Price <gourry@gourry.net>

