Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E7A28C854
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 19:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777404669; cv=none; b=FRkjCZfRxvmtqEXduer/NFLXpbKfOWiyFA1R31JZHAzgmVFGiJvlpESuZMqSYs6FdGSmx6hzMTUOGvGjlT+w7F/Xj+qARSPMYP4QF93HkKNJ+5+DN57xRaid2kXT2zOqeYcq9eMu0Gs8x2cQCZX2vFEPlejp8D42+cE7nvgPuX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777404669; c=relaxed/simple;
	bh=MV4Ee5PABW2ZLMx9mFu6dM0/W+lBQ6B283fQiCq1qLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7iLExey2iruXtsCrh+IFmPkyRMC6SUo40rm7iE3VYqVG9N+p5hyDmzaCI7l8QaMBtwcPAMkYiwtSBdC7BxpXUhsvxfiVZD0aNg84Nofnv/m9WA5mGqUr8HDY0C1f2S+wRKsQCVX1jp8sfFP0O1s4krS+U4uhxEWino7g0SThHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=TgAbT3zN; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="TgAbT3zN"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8f83efb5729so99094985a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 12:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1777404667; x=1778009467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SAI8x2/bEv74FJXz3oAJzkvQVs+0CkcEMU6FT3AZkn4=;
        b=TgAbT3zNdZk2wo6872xifrmbuhx2y48bA3kmWpZKTvSMPHitzm64b52+he+lUEJJW1
         Em3AaMydSsNrwEBxZrHQlxLSb48XtoOm0pfOToWjJhXhi1DFbQlsmCtuxDjgGqG+H9FT
         RYwjv694N+5njAwmNdyYolY+wzybeb5GBtyaPaJF2TLsdQesK/Hs9U6B3ypXs0u5L2vZ
         eKV4cE/+0oWxF6n46r7IzdJKDB4EkZFcmEMGNRxVhyU2YQEoHccxUs0vD+D7NY2hi2jW
         Bdt6fkTMN1ozYVmzmb3Fa1z65nIQSTHqdTmigGX7IduijlNxmmQodMkMAvAQaZZu0SD/
         lliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777404667; x=1778009467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAI8x2/bEv74FJXz3oAJzkvQVs+0CkcEMU6FT3AZkn4=;
        b=pqGhrcii/LRXXlleaqE++9B4WSLCErU7klyZTsTJTCQ2npClnLroiRKbyBvsnl7zas
         MHZsQjvp+noZcNlygPdi/w6addONsZNWvldIFSwkda+SlxrG9uNP6c86ukW9rHFc61Si
         oflZS+z6O7eVeK4I/kj3sdNTwoedZy7jej40Stg5PZO4aYwdUNgszXYVeXn8DEQvCZ3J
         m3s7xXrzsZx4f1UwAhVZVPtbIUS0pgPYuoXAWR836GE3qaA8bDX7pVYBdCOAsMTfrExo
         mCJXKaVra/IA/nEABGjKUnKjMjtFfE8CWPMlxn4nE2nb6dx6NXJDHgkI8Jef5P6siIvm
         NkGA==
X-Forwarded-Encrypted: i=1; AFNElJ9wRCxofvxTRMACnmSWh/o6Raao7UJUmN7e9J9NB7sqSy7SUCXtRTuYoXSOCyf37OZPr2NCSfTCYHw+i3J4hoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YznjxwUK5OLgs6qLBiN8RTgXXpyx8gv7153apA1h9vqMv+fMoMU
	xL4ZSoSile3noEeL01dOTqse8LF0Htb7WB6zllxyYLPRh8R6ySRf65FQQf6NeBFxdmY39pVizFr
	bI9xSQ1g=
X-Gm-Gg: AeBDies1x6b+M/90zK2SS1H7/j83n5p4q1pXwSFV+FI+Z4aeLQBlN17kqkZc/0bvwaf
	+BGfUJ2kfI9ihg9UMZbp/3VF8kXQBSfbkrVKGrTmQ9er5uY+ZXBaP76Ka/MDDI87zHLXxeiV7Qb
	PVrJzOJN/mjFjY2dfgLaH8RhiTWHeIT1II7n3A5FwyQE9IAp901lQgD+OUy5sVoFreG9FwBfeq4
	8mT0PdjczxawZ3SngX0fjDHI8xtivss7FcokZNexoaYOEx9E5nBpckJTiY3PprkD9zlg55OGqn1
	vIYP4lpP989sco/BJ6cdqVmeieJccjmrPYbyqd1/SYW/j/YrKQv7/fRI+z8Yn1Yd9cjjRSpf74T
	kU32aNpAatDcILGZOIVDv63tK1QRGv4TBAncDdW0Ijks0gs+2m4dmnA941y5AQ9XP9LSsQc5XWx
	4S9RNjGKvqOhnXQ+cGSQv9M8ogUw3JcuQbPkh4Vavi1TtNo2xhFenH87b0IQJi3w==
X-Received: by 2002:a05:620a:46a2:b0:8cf:d62a:c81d with SMTP id af79cd13be357-8f7d9201d94mr664574885a.29.1777404666489;
        Tue, 28 Apr 2026 12:31:06 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c85a8eb1sm260640585a.41.2026.04.28.12.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 12:31:05 -0700 (PDT)
Date: Tue, 28 Apr 2026 19:31:04 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Mike Rapoport <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Usama Arif <usama.arif@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 0/6] selftests/liveupdate: add memfd tests
Message-ID: <afEKfQ0GUNVJ76a1@plex>
References: <20260404102452.4091740-1-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404102452.4091740-1-pratyush@kernel.org>

On 04-04 10:24, Pratyush Yadav wrote:
> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
> 
> Hi,
> 
> This series adds some tests for memfd preservation across a live update.
> Currently memfd is only tested indirectly via luo_kexec_simple or
> luo_multi_session. Add a dedicated test suite for it.
> 
> Patches 1 and 2 are preparatory, adding base framework and helpers, and
> the other patches each add a test. Some of the code is taken from the
> libluo patches [0] I sent a while ago.
> 
> [0] https://lore.kernel.org/linux-mm/20250723144649.1696299-33-pasha.tatashin@soleen.com/

Here are few observations that I noticed when I tried to run your tests:

1. The '-h' tells you nothing about --stage argument:

root@liveupdate-vm:~/liveupdate# ./luo_memfd -h
Usage: ./luo_memfd [-h|-l|-d] [-t|-T|-v|-V|-f|-F|-r name]
	-h       print help
	-l       list all tests
	-d       enable debug prints

	-t name  include test
	-T name  exclude test
	-v name  include variant
	-V name  exclude variant
	-f name  include fixture
	-F name  exclude fixture
	-r name  run specified test
	...

2. '-l' does not work after you run stage1, do you keep /dev/liveupdate 
open? That is not needed, we only need to keep session open.

root@liveupdate-vm:~/liveupdate# ./luo_memfd -l
1..0 # SKIP Failed to open /dev/liveupdate (Device or resource busy) device. Is LUO enabled?

3. Stage 1 has proper [STAGE 1] prefix, but no [STAGE 2] prefix for 
stage 2:
# Starting 4 tests from 1 test cases.
#  RUN           global.memfd_data ...
# [STAGE 1] Forking persistent child to hold sessions...
# [STAGE 1] Child PID: 245. Resources are pinned.
# [STAGE 1] You may now perform kexec reboot.
#            OK  global.memfd_data
ok 1 global.memfd_data
#  RUN           global.zero_memfd ...
# [STAGE 1] Forking persistent child to hold sessions...
# [STAGE 1] Child PID: 247. Resources are pinned.
# [STAGE 1] You may now perform kexec reboot.
#            OK  global.zero_memfd
ok 2 global.zero_memfd
#  RUN           global.preserved_ops ...
#            OK  global.preserved_ops
ok 3 global.preserved_ops
#  RUN           global.fallocate_memfd ...
# [STAGE 1] Forking persistent child to hold sessions...
# [STAGE 1] Child PID: 250. Resources are pinned.
# [STAGE 1] You may now perform kexec reboot.
#            OK  global.fallocate_memfd
ok 4 global.fallocate_memfd
# PASSED: 4 / 4 tests passed.
# Totals: pass:4 fail:0 xfail:0 xpass:0 skip:0 error:0

./do_kexec

root@liveupdate-vm:~/liveupdate# ./luo_memfd
TAP version 13
1..4
# Starting 4 tests from 1 test cases.
#  RUN           global.memfd_data ...
#            OK  global.memfd_data
ok 1 global.memfd_data
#  RUN           global.zero_memfd ...
#            OK  global.zero_memfd
ok 2 global.zero_memfd
#  RUN           global.preserved_ops ...
#      SKIP      test only expected to run on stage 1
#            OK  global.preserved_ops
ok 3 global.preserved_ops # SKIP test only expected to run on stage 1
#  RUN           global.fallocate_memfd ...
#            OK  global.fallocate_memfd
ok 4 global.fallocate_memfd
# PASSED: 4 / 4 tests passed.
# 1 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
# Totals: pass:3 fail:0 xfail:0 xpass:0 skip:1 error:0

4. I also do not like that we now have duplicated stage parsing code in  
luo_test(), perhaps we should add our own  test_harness_run() variant 
that depends on stage, and use it in both current tests, and the new 
memfd tests.

Pasha

> 
> Changes in v3:
> - Retry on EINTR instead of giving up in read_size() and write_size().
> - Use O_TRUNC in save_test_data().
> - Return the value of write_size() directly in create_random_memfd(). No
>   need to check errno since write_size() already returns -errno.
> - Save errno before calling close() in create_random_memfd() to avoid
>   overwriting the value.
> - Use memcmp() instead of open-coding the comparison loop.
> - Return value of test_harness_run() from main().
> 
> Changes in v2:
> - Drop LIVEUPDATE_DEV since it isn't used.
> - Split luo_fd and stage declaration on separate lines.
> - Split all 2-stage tests into helper function for each test.
> - Fix wording and argument order when LUO_DEVICE fails to open.
> - Rename verify_fd_content() to verify_fd_content_read().
> - Advance buffer pointer in {read,write}_size().
> - Add a check to make sure current working directory is not on a tmpfs
>   mount. If so, skip the tests since saved data files will be lost.
> - Rename RANDOM_DATA_FILE and RANDOM_DATA_FILE_FALLOCATE to
>   MEMFD_DATA_FS_COPY and FALLOCATE_DATA_FS_COPY respectively. Also
>   update the file names to reflect this naming convention.
> - Collect R-bys.
> 
> Regards,
> Pratyush Yadav
> 
> Pratyush Yadav (Google) (6):
>   selftests/liveupdate: add framework for memfd tests
>   selftests/liveupdate: add helper functions for memfd tests
>   selftests/liveupdate: add test for memfd content preservation
>   selftests/liveupdate: add test for zero-size memfd preservation
>   selftests/liveupdate: add test for operations on a preserved memfd
>   selftests/liveupdate: add fallocate test for memfd
> 
>  tools/testing/selftests/liveupdate/Makefile   |   2 +
>  .../testing/selftests/liveupdate/luo_memfd.c  | 355 ++++++++++++++++++
>  .../selftests/liveupdate/luo_test_utils.c     | 191 +++++++++-
>  .../selftests/liveupdate/luo_test_utils.h     |  10 +
>  4 files changed, 557 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/liveupdate/luo_memfd.c
> 
> 
> base-commit: 98ddd87f9704ef2fc837ec2ca38877c364d8dada
> -- 
> 2.53.0.1213.gd9a14994de-goog
> 
