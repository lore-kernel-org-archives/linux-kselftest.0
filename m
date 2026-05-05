Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34FA48C41D
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 16:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998736; cv=none; b=Una6oA253RKIMM4jV/bzzdItsZhoYwSqUcFWSCFFih+C6eI0chMgNZC7wBZmCPVEuzbBOxxrmM6P8dMDCpNBAXOspYkcffoNIeb9Gb3VVbi0Wfoqz9wTiBPxtZOB2UHZvUV4r1KN8ESqft6RKS1xko4DpWi6MpQDaZDOOjkFO3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998736; c=relaxed/simple;
	bh=GJGEWEuf1mltMI7Baya/uLbOVwDlPRX3aZa9klR0aM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSXR1Q8CTL6MCxoXx15buUmHAGpIJiHSj80AwZq0XQpIerqHbXzexjWTjPzjY+2I85nEutOwh1m7zvRVZvrto4HDH1R3ZGy5djVrvH9NKdc1m/Ussr5sFcZT12aBRsBp5SyV3T/Iy6DUGOn7FTCrKcGbJHuwin4LRCJDYe5+TIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=R2q+MhYJ; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="R2q+MhYJ"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8eab809593cso541462485a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 05 May 2026 09:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1777998733; x=1778603533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q6yeaFiPlZGZf41NsmyX0In93MXNmdncNWDHYjC/idU=;
        b=R2q+MhYJs/lM0AQ1CKX+MDTa6F8MLJn8ldkGPAvdokfVk5unUwwlYZtj0A3NysC6S6
         sxPV9779E85Ym+zwhYEcIxojIdS8Q2hyjC1HmqiWY7V3sfXD2eDVdUsgZFSNyAlwVtke
         TiYKgmL1iCZUPr0W42eNU8k+B3/K5kgPkiZyZBZRio6g+mm1Eae3UHMCAtO9a3cnDLuk
         hiWnd/XDwgOs/Q3HHqYIb/oMJKRbWV3wedMzPONNyWIEcR7SmuJbH6hcwb0hIuyJhOvk
         PjR84vBmPFZN0msWGf8gOMnyova/ATAznDlJKU29TTXlsah6d2nQB1m7wZnU54sCSANa
         N/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777998733; x=1778603533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6yeaFiPlZGZf41NsmyX0In93MXNmdncNWDHYjC/idU=;
        b=giXAM48PDg768fSpzsDOqgg2wJ0DXfXea4vqZn3wmCrZ740EhR0+RCPPiYs3uv+xTe
         Nd1yi6mnOqKHgg+HztrfiI6DCHeqhv4acL+fFkexKi/+xJBoCei2aRKWB65X4C4Rf0kh
         SnEo95Lk35wXECcO68aLDincAaRKcaeEqHIgzdyywCiSbiTP03rboqvhN+1iowLSoR/b
         QTTgasQx223/Z84xDDydWHhX5Etfl0Avc77p1bb+YiUmDqnp+MzNLnpbjtMZQoLee9F4
         bcuokIuFPfd21TZETHLfJ9IIZdq6UA4S5YPxgBvkkgjKtdnPKlP34w9e4PvOUOKYfFii
         D9QA==
X-Forwarded-Encrypted: i=1; AFNElJ9OFfMG5tdOVmZyWhvjkoGa4MskD3H08ITlkt7c6wvrrWKedeyi/g72rh372sXcGyIkrltJ+x3gRTRztk4Mmo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzUo2QXq/wUWt58chfdKCH4cL66bemtORYkFzpcw2lfBuAJGmK
	friXvf718b+C7aDeko/rNyxD0rweA3bNk8RxtYV2mLpa8F+nTUZm50KSdWjEq8maiBE=
X-Gm-Gg: AeBDieu3AT6olxKODqFMpKvEoSy4WLaGy4ZSgKi/uU1+1vHvV7A8BdxEdKEn1yQ/lJo
	/BbqB4gQzMLOqVD43Ekv4CncBvMzMIRyumK4HUMspHvldM32I79E1QJlnKzR7i5ANVPXOKclg3e
	aBI91tuxs8YcygrNXv9kHizO9vQRqmojLWHFdlJVI8E0O0brOsJ1MSdJrNhpOX6hwFxFCqiixez
	AE/TpsKxYYAk48i/8MuJEoheB2bcgiTIPzG9wHmqN3eWU7q0Su0zJdO8+vGnZn2udbqUBsNfXGD
	TWB5j2FsB/fFu3IRA2j7dqnTUyuxMCWedWI6/ijAcaRHGHEvDKwQifXc9TCzrvMwAklvxcFYbGb
	peOvwz1GlKtsVco0Z95TjKIk7ePxe1J9s8ah7u/ik5LHXLk+doVmO+xmGb/CbJScuC9CwUszyS6
	7MzpR7HnBke9Oln+rwfGBIY6szu1M2cLd+YICfwkOFoVA4zp3yeltABJ9cDj3yzQ==
X-Received: by 2002:a05:622a:424a:b0:50f:b137:3099 with SMTP id d75a77b69052e-5104bf42473mr215787061cf.33.1777998733271;
        Tue, 05 May 2026 09:32:13 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040b8174csm145009111cf.25.2026.05.05.09.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:32:12 -0700 (PDT)
Date: Tue, 5 May 2026 16:32:11 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Mike Rapoport <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Usama Arif <usama.arif@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 0/6] selftests/liveupdate: add memfd tests
Message-ID: <afoatCn99vvnr-cH@plex>
References: <20260404102452.4091740-1-pratyush@kernel.org>
 <afEKfQ0GUNVJ76a1@plex>
 <2vxzecjx52eu.fsf@kernel.org>
 <afT5FDAXmcIfz-wI@plex>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afT5FDAXmcIfz-wI@plex>

On 05-01 19:08, Pasha Tatashin wrote:
> On 04-29 15:20, Pratyush Yadav wrote:
> > On Tue, Apr 28 2026, Pasha Tatashin wrote:
> > 
> > > On 04-04 10:24, Pratyush Yadav wrote:
> > >> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
> > >> 
> > >> Hi,
> > >> 
> > >> This series adds some tests for memfd preservation across a live update.
> > >> Currently memfd is only tested indirectly via luo_kexec_simple or
> > >> luo_multi_session. Add a dedicated test suite for it.
> > >> 
> > >> Patches 1 and 2 are preparatory, adding base framework and helpers, and
> > >> the other patches each add a test. Some of the code is taken from the
> > >> libluo patches [0] I sent a while ago.
> > >> 
> > >> [0] https://lore.kernel.org/linux-mm/20250723144649.1696299-33-pasha.tatashin@soleen.com/
> > >
> > > Here are few observations that I noticed when I tried to run your tests:
> > >
> > > 1. The '-h' tells you nothing about --stage argument:
> > >
> > > root@liveupdate-vm:~/liveupdate# ./luo_memfd -h
> > > Usage: ./luo_memfd [-h|-l|-d] [-t|-T|-v|-V|-f|-F|-r name]
> > > 	-h       print help
> > > 	-l       list all tests
> > > 	-d       enable debug prints
> > >
> > > 	-t name  include test
> > > 	-T name  exclude test
> > > 	-v name  include variant
> > > 	-V name  exclude variant
> > > 	-f name  include fixture
> > > 	-F name  exclude fixture
> > > 	-r name  run specified test
> > > 	...
> > 
> > Yeah, unfortunately that is a side effect of using test_harness_run(),
> > which does not know anything about the options specific to our test.
> > 
> > >
> > > 2. '-l' does not work after you run stage1, do you keep /dev/liveupdate 
> > > open? That is not needed, we only need to keep session open.
> > 
> > Oh yeah, I keep forgetting that is no longer needed. The main process
> > closes the FD but the forked daemons hold a reference. I can clean that
> > up via a fixture.
> > 
> > >
> > > root@liveupdate-vm:~/liveupdate# ./luo_memfd -l
> > > 1..0 # SKIP Failed to open /dev/liveupdate (Device or resource busy) device. Is LUO enabled?
> > >
> > > 3. Stage 1 has proper [STAGE 1] prefix, but no [STAGE 2] prefix for 
> > 
> > Because stage 2 has no prints, all the prints are coming from the
> > selftest harness. Those same lines are also not prefixed in stage 1. If
> > you'd like, I can add a print beforehand that shows which stage is
> 
> Yes, please, add a least one [STAGE 2] print.
> 
> > running. Other than that, I don't see what else we can do. I don't want
> > to modify the selftest harness.
> > 
> > > stage 2:
> > > # Starting 4 tests from 1 test cases.
> > > #  RUN           global.memfd_data ...
> > > # [STAGE 1] Forking persistent child to hold sessions...
> > > # [STAGE 1] Child PID: 245. Resources are pinned.
> > > # [STAGE 1] You may now perform kexec reboot.
> > > #            OK  global.memfd_data
> > > ok 1 global.memfd_data
> > > #  RUN           global.zero_memfd ...
> > > # [STAGE 1] Forking persistent child to hold sessions...
> > > # [STAGE 1] Child PID: 247. Resources are pinned.
> > > # [STAGE 1] You may now perform kexec reboot.
> > > #            OK  global.zero_memfd
> > > ok 2 global.zero_memfd
> > > #  RUN           global.preserved_ops ...
> > > #            OK  global.preserved_ops
> > > ok 3 global.preserved_ops
> > > #  RUN           global.fallocate_memfd ...
> > > # [STAGE 1] Forking persistent child to hold sessions...
> > > # [STAGE 1] Child PID: 250. Resources are pinned.
> > > # [STAGE 1] You may now perform kexec reboot.
> > > #            OK  global.fallocate_memfd
> > > ok 4 global.fallocate_memfd
> > > # PASSED: 4 / 4 tests passed.
> > > # Totals: pass:4 fail:0 xfail:0 xpass:0 skip:0 error:0
> > >
> > > ./do_kexec
> > >
> > > root@liveupdate-vm:~/liveupdate# ./luo_memfd
> > > TAP version 13
> > > 1..4
> > > # Starting 4 tests from 1 test cases.
> > > #  RUN           global.memfd_data ...
> > > #            OK  global.memfd_data
> > > ok 1 global.memfd_data
> > > #  RUN           global.zero_memfd ...
> > > #            OK  global.zero_memfd
> > > ok 2 global.zero_memfd
> > > #  RUN           global.preserved_ops ...
> > > #      SKIP      test only expected to run on stage 1
> > > #            OK  global.preserved_ops
> > > ok 3 global.preserved_ops # SKIP test only expected to run on stage 1
> > > #  RUN           global.fallocate_memfd ...
> > > #            OK  global.fallocate_memfd
> > > ok 4 global.fallocate_memfd
> > > # PASSED: 4 / 4 tests passed.
> > > # 1 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
> > > # Totals: pass:3 fail:0 xfail:0 xpass:0 skip:1 error:0
> > >
> > > 4. I also do not like that we now have duplicated stage parsing code in  
> > > luo_test(), perhaps we should add our own  test_harness_run() variant 
> > > that depends on stage, and use it in both current tests, and the new 
> > > memfd tests.

One more comment:

root@liveupdate-vm:~/liveupdate# ./luo_memfd --stage 2
Bail out! Stage mismatch: expected 2, got 1
# Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0

Should be: excpected 1, got 2..


> > 
> > Sounds good in principle, but unfortunately ends up duplicating a lot of
> > logic in test_harness_run() that is not a good idea IMO. We should work
> > with the harness not fork off into our own.
> > 
> > I suppose we can refactor some of the logic there to split into
> > functions that we can then use in our luo_test_harness_run(), but
> > keeping the option parsing logic in sync is going to be difficult.
> > 
> > And for the duplicated logic, I agree. I thought about cleaning it up
> > but was feeling lazy... Well now that you have called it out let me see
> > what I can do.
> 
> The main point is that the luo_sessions and luo_memfds tests should use 
> a common framework, whether that's luo_test_harness_run() or the generic 
> test_harness_run(). I don't have a definitive answer for this, so I 
> recommend tinkering with it to see what works best.
> 
> Pasha
> 
> > 
> > [...]
> > 
> > -- 
> > Regards,
> > Pratyush Yadav
