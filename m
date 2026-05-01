Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F248235DA5B
	for <linux-kselftest@vger.kernel.org>; Fri,  1 May 2026 19:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777662512; cv=none; b=ncBwInGjCqHYOibFK/V5J+1h/kDi8MBOE3hD4jQXxX/Gk3hG/7rhZQcq1bYVWL4hIETO1+Gqb5dXDpdU9HWMQ/v7IwtI5etovN56OGHTIcPpxhMgTuMfop4Md8L0L+Oc4+GJTcEcejGVFs5xEFvLTKp2sZRpQTPkrAuYepVfsOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777662512; c=relaxed/simple;
	bh=K7rNHwwndzrwpeqnwCJRPX2YLZfLu0+OC6EciijTGN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+q3PeHkAjUflbNaIU/2uD716C0qgtiq+B402UWaGl0oH+QiAV/aznrpmceApWA6dbBmIzQKdDWCk5rYJZlecYmBNG5nuIMvZx5XLnoh6vdBMSIBjyXbz43HqIB5TujG7Y/JXhDx7CSu9ifOhuPKkrYbGpPcwhUhk9Y2cueftPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=iHhrAG9Q; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="iHhrAG9Q"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8ea8563c693so256083085a.2
        for <linux-kselftest@vger.kernel.org>; Fri, 01 May 2026 12:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1777662510; x=1778267310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hw/dnUiNx0MfDmN48zYPSTLx5QFCgo4F6clziTzz9Vc=;
        b=iHhrAG9Qsi8Do5/vq+goT8xZ230mX+9L45GbYjoeqcm8XSP3pjMhfQbDtgevMHdfHM
         fW3SNZ5CtorluHZaitK9Cp65WKJE5Vg5bOhk9XLIBl7VYgq8wsxheNqCcLVChZZdadQ6
         H51YCVltnM+Wojz3V5sb68dngipRRl828ABAF6X1DNdgaYzoK/TZeyBD51E49j5cblWF
         ztlOQRKnLnD+A9TrhmdT3MLxfDArhDB+V55J2chljUve7l/0+cBDDPH0klNPftalDu6d
         ULS9ddWTZc2uA8QPznPFCGjjYzw/k8qiHMaz6/EC4LcaCTfzTJeyZznM0IqEZie3G0Oc
         SbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777662510; x=1778267310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hw/dnUiNx0MfDmN48zYPSTLx5QFCgo4F6clziTzz9Vc=;
        b=hqhgD1mJPq/2n/hJaUvsyg+ebj6T6xcYhCSdDFOMXE42RN8PCDhTYySqvrjzfaGzlj
         X3zZT0ew+28Rr24e9AAY7uFsYenwbRi/yHBTT+UWZ14GY2bEHTrgG0PDSup17xgQBm0R
         NnUdHI63ETzEG0SOcLVEVzElZye+DzL0CodwRRv2B32IXwj8z59e5SRPPhQdxR8pmyb1
         7Rd+P5WHfgojAuXrYiSrde/OvRcW0aWc9XHGrGQIh87HnNxUhWls6r2orELU3OEqgqip
         tEXmZqejWqshALojns/gO4i4C0uHk+BbHgYqN0VkvQKsEfYxv8qNbuV7cAXokcCXS6z5
         RUaQ==
X-Forwarded-Encrypted: i=1; AFNElJ826Q53QXh+N2NQGrXYascQxIxroTq+CrCS5iTKkqjaA35Dnvuqg3CIP+ejbB6Kz2lCXk3DKNrwUxqmRALFl0U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4q3fEa3MmUMYJhIM+Kx+gmUJO4kp2TTYA5nNSrrTEcZ80ySZo
	TS0kFb6AcL+y8XfaGKP1Bk/Idu0jzG30zt819hPTHm2dpcvYMrDfpoDcS4Ts8pscnCI=
X-Gm-Gg: AeBDieuFs5MBOFCJ1sao8yMvj6IzFxzgD+0QMBFGZC/qcYGn366UiZcxCdr3aUDT3qV
	hqYDT06pj3tgsH7pNrvVSFviTYQHPQXERgcWPE0Vi5cQXNrTDBPGzRu3Fy2Y9kaknLbDokCLvi0
	UBoC6DscLr8QTFTpAjxS/KbWp/O49qyYIGddqFRqS0+t6Ushmq6OMzJShrG8ireHGB1Me1hvHb8
	Bu+mIoVmHMUMPxHJDCu3PN68bOHs0M52B77lh6f42nXDrvo1PztGNIbHMEqxO8UoK8HaTDu5910
	oyzMf5jJMKabLVDO4GqUvZ9XR1benOan+ZskAIRQ2lVmejc+UW9BsqTNgkvQz0OyXt3vpyspI9B
	0BNYjmret2vL0XfGAX2sUSGkIcUIrpUDZDbK5rLv3yoNEmgWC97z811sI0v5+WieVaSeo2FwXEF
	N4YrPQuB/Ase2Q5GMiUVhOhzAM/9TuigH+1IR5eSpTH8ngmtiG/8QnhgAvq3ecoA==
X-Received: by 2002:a05:620a:4613:b0:8ed:45b8:de90 with SMTP id af79cd13be357-8fd17d497f2mr110554085a.39.1777662509842;
        Fri, 01 May 2026 12:08:29 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2938e7f8sm242450085a.7.2026.05.01.12.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 12:08:29 -0700 (PDT)
Date: Fri, 1 May 2026 19:08:28 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Mike Rapoport <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Usama Arif <usama.arif@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 0/6] selftests/liveupdate: add memfd tests
Message-ID: <afT5FDAXmcIfz-wI@plex>
References: <20260404102452.4091740-1-pratyush@kernel.org>
 <afEKfQ0GUNVJ76a1@plex>
 <2vxzecjx52eu.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxzecjx52eu.fsf@kernel.org>

On 04-29 15:20, Pratyush Yadav wrote:
> On Tue, Apr 28 2026, Pasha Tatashin wrote:
> 
> > On 04-04 10:24, Pratyush Yadav wrote:
> >> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
> >> 
> >> Hi,
> >> 
> >> This series adds some tests for memfd preservation across a live update.
> >> Currently memfd is only tested indirectly via luo_kexec_simple or
> >> luo_multi_session. Add a dedicated test suite for it.
> >> 
> >> Patches 1 and 2 are preparatory, adding base framework and helpers, and
> >> the other patches each add a test. Some of the code is taken from the
> >> libluo patches [0] I sent a while ago.
> >> 
> >> [0] https://lore.kernel.org/linux-mm/20250723144649.1696299-33-pasha.tatashin@soleen.com/
> >
> > Here are few observations that I noticed when I tried to run your tests:
> >
> > 1. The '-h' tells you nothing about --stage argument:
> >
> > root@liveupdate-vm:~/liveupdate# ./luo_memfd -h
> > Usage: ./luo_memfd [-h|-l|-d] [-t|-T|-v|-V|-f|-F|-r name]
> > 	-h       print help
> > 	-l       list all tests
> > 	-d       enable debug prints
> >
> > 	-t name  include test
> > 	-T name  exclude test
> > 	-v name  include variant
> > 	-V name  exclude variant
> > 	-f name  include fixture
> > 	-F name  exclude fixture
> > 	-r name  run specified test
> > 	...
> 
> Yeah, unfortunately that is a side effect of using test_harness_run(),
> which does not know anything about the options specific to our test.
> 
> >
> > 2. '-l' does not work after you run stage1, do you keep /dev/liveupdate 
> > open? That is not needed, we only need to keep session open.
> 
> Oh yeah, I keep forgetting that is no longer needed. The main process
> closes the FD but the forked daemons hold a reference. I can clean that
> up via a fixture.
> 
> >
> > root@liveupdate-vm:~/liveupdate# ./luo_memfd -l
> > 1..0 # SKIP Failed to open /dev/liveupdate (Device or resource busy) device. Is LUO enabled?
> >
> > 3. Stage 1 has proper [STAGE 1] prefix, but no [STAGE 2] prefix for 
> 
> Because stage 2 has no prints, all the prints are coming from the
> selftest harness. Those same lines are also not prefixed in stage 1. If
> you'd like, I can add a print beforehand that shows which stage is

Yes, please, add a least one [STAGE 2] print.

> running. Other than that, I don't see what else we can do. I don't want
> to modify the selftest harness.
> 
> > stage 2:
> > # Starting 4 tests from 1 test cases.
> > #  RUN           global.memfd_data ...
> > # [STAGE 1] Forking persistent child to hold sessions...
> > # [STAGE 1] Child PID: 245. Resources are pinned.
> > # [STAGE 1] You may now perform kexec reboot.
> > #            OK  global.memfd_data
> > ok 1 global.memfd_data
> > #  RUN           global.zero_memfd ...
> > # [STAGE 1] Forking persistent child to hold sessions...
> > # [STAGE 1] Child PID: 247. Resources are pinned.
> > # [STAGE 1] You may now perform kexec reboot.
> > #            OK  global.zero_memfd
> > ok 2 global.zero_memfd
> > #  RUN           global.preserved_ops ...
> > #            OK  global.preserved_ops
> > ok 3 global.preserved_ops
> > #  RUN           global.fallocate_memfd ...
> > # [STAGE 1] Forking persistent child to hold sessions...
> > # [STAGE 1] Child PID: 250. Resources are pinned.
> > # [STAGE 1] You may now perform kexec reboot.
> > #            OK  global.fallocate_memfd
> > ok 4 global.fallocate_memfd
> > # PASSED: 4 / 4 tests passed.
> > # Totals: pass:4 fail:0 xfail:0 xpass:0 skip:0 error:0
> >
> > ./do_kexec
> >
> > root@liveupdate-vm:~/liveupdate# ./luo_memfd
> > TAP version 13
> > 1..4
> > # Starting 4 tests from 1 test cases.
> > #  RUN           global.memfd_data ...
> > #            OK  global.memfd_data
> > ok 1 global.memfd_data
> > #  RUN           global.zero_memfd ...
> > #            OK  global.zero_memfd
> > ok 2 global.zero_memfd
> > #  RUN           global.preserved_ops ...
> > #      SKIP      test only expected to run on stage 1
> > #            OK  global.preserved_ops
> > ok 3 global.preserved_ops # SKIP test only expected to run on stage 1
> > #  RUN           global.fallocate_memfd ...
> > #            OK  global.fallocate_memfd
> > ok 4 global.fallocate_memfd
> > # PASSED: 4 / 4 tests passed.
> > # 1 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
> > # Totals: pass:3 fail:0 xfail:0 xpass:0 skip:1 error:0
> >
> > 4. I also do not like that we now have duplicated stage parsing code in  
> > luo_test(), perhaps we should add our own  test_harness_run() variant 
> > that depends on stage, and use it in both current tests, and the new 
> > memfd tests.
> 
> Sounds good in principle, but unfortunately ends up duplicating a lot of
> logic in test_harness_run() that is not a good idea IMO. We should work
> with the harness not fork off into our own.
> 
> I suppose we can refactor some of the logic there to split into
> functions that we can then use in our luo_test_harness_run(), but
> keeping the option parsing logic in sync is going to be difficult.
> 
> And for the duplicated logic, I agree. I thought about cleaning it up
> but was feeling lazy... Well now that you have called it out let me see
> what I can do.

The main point is that the luo_sessions and luo_memfds tests should use 
a common framework, whether that's luo_test_harness_run() or the generic 
test_harness_run(). I don't have a definitive answer for this, so I 
recommend tinkering with it to see what works best.

Pasha

> 
> [...]
> 
> -- 
> Regards,
> Pratyush Yadav
