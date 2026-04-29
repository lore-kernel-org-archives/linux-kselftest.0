Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5307B3FCB00;
	Wed, 29 Apr 2026 13:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468813; cv=none; b=E2AWFJbhgGPXLsozUWp7vIF9LVpSn2pubek8ukNvSfbU3RY/LP4HEGpaY8obKKJtYzKnVQyWhOsilG8vnjZyvKgU+nvaMBez0ob0OBFHLjQL9SXzr2ANrl7EJERAQQhg1H05dKFfNnLRzQEMAgPasiWxuJm45NCr969yP7TQe7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468813; c=relaxed/simple;
	bh=WBIKlOKETVqEtql1+Yzk/jj+FrWANtHnrA8WI+d7PWk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a0+foN/l/RS17zT7QbziN2DWTOHGOHiiUOVms+kBFeKwVeHTiwlwTSStIiEYttd/9rGoCKVUao1cV2hjBGW36Euoqc3yim8L7ynS8VqI7qapJoZU5+ur+9eZwMSgAHWKKtH78VA79+MfFNFNwcY09scjoZOOyp5PxSlKcoWjsGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OqL/UlYT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OqL/UlYT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4242AC19425;
	Wed, 29 Apr 2026 13:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777468812;
	bh=WBIKlOKETVqEtql1+Yzk/jj+FrWANtHnrA8WI+d7PWk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OqL/UlYT8/yL8caVmjjltYa+hdLsEbO5IOitUCF+kl0IJnzAj6GolLqnmIfypQW9Q
	 KCs+F+Q5xuGEMgJpE1zr5S+QJQQPQuZXj8ccA8vRfWVbmlBZ/ZgRaKMCeUDlJkOECv
	 71cYfgXodQED7Z7WV+ngHFUSAKkJx4CyI+CdS7Ks9SsFEE4ZbpU8ZMLS7CGYoFvkqM
	 rUzNVQYz5MEo/Q0x+6aR/QzST1yqEL8IMTwjUur00zR9fWoPMH52ECRpXrDD/BKfTS
	 1NP1a3rfyjl4F6etV3UBIyFK+NHjsaT3lHIvLEJGi2j2w9HlvrQGdK8Dj+NVZQSjTG
	 tAU23rb1hrrUg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Mike Rapoport <rppt@kernel.org>,
  Shuah Khan <shuah@kernel.org>,  Andrew Morton
 <akpm@linux-foundation.org>,  Usama Arif <usama.arif@linux.dev>,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH v3 0/6] selftests/liveupdate: add memfd tests
In-Reply-To: <afEKfQ0GUNVJ76a1@plex> (Pasha Tatashin's message of "Tue, 28 Apr
	2026 19:31:04 +0000")
References: <20260404102452.4091740-1-pratyush@kernel.org>
	<afEKfQ0GUNVJ76a1@plex>
Date: Wed, 29 Apr 2026 15:20:09 +0200
Message-ID: <2vxzecjx52eu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Apr 28 2026, Pasha Tatashin wrote:

> On 04-04 10:24, Pratyush Yadav wrote:
>> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
>> 
>> Hi,
>> 
>> This series adds some tests for memfd preservation across a live update.
>> Currently memfd is only tested indirectly via luo_kexec_simple or
>> luo_multi_session. Add a dedicated test suite for it.
>> 
>> Patches 1 and 2 are preparatory, adding base framework and helpers, and
>> the other patches each add a test. Some of the code is taken from the
>> libluo patches [0] I sent a while ago.
>> 
>> [0] https://lore.kernel.org/linux-mm/20250723144649.1696299-33-pasha.tatashin@soleen.com/
>
> Here are few observations that I noticed when I tried to run your tests:
>
> 1. The '-h' tells you nothing about --stage argument:
>
> root@liveupdate-vm:~/liveupdate# ./luo_memfd -h
> Usage: ./luo_memfd [-h|-l|-d] [-t|-T|-v|-V|-f|-F|-r name]
> 	-h       print help
> 	-l       list all tests
> 	-d       enable debug prints
>
> 	-t name  include test
> 	-T name  exclude test
> 	-v name  include variant
> 	-V name  exclude variant
> 	-f name  include fixture
> 	-F name  exclude fixture
> 	-r name  run specified test
> 	...

Yeah, unfortunately that is a side effect of using test_harness_run(),
which does not know anything about the options specific to our test.

>
> 2. '-l' does not work after you run stage1, do you keep /dev/liveupdate 
> open? That is not needed, we only need to keep session open.

Oh yeah, I keep forgetting that is no longer needed. The main process
closes the FD but the forked daemons hold a reference. I can clean that
up via a fixture.

>
> root@liveupdate-vm:~/liveupdate# ./luo_memfd -l
> 1..0 # SKIP Failed to open /dev/liveupdate (Device or resource busy) device. Is LUO enabled?
>
> 3. Stage 1 has proper [STAGE 1] prefix, but no [STAGE 2] prefix for 

Because stage 2 has no prints, all the prints are coming from the
selftest harness. Those same lines are also not prefixed in stage 1. If
you'd like, I can add a print beforehand that shows which stage is
running. Other than that, I don't see what else we can do. I don't want
to modify the selftest harness.

> stage 2:
> # Starting 4 tests from 1 test cases.
> #  RUN           global.memfd_data ...
> # [STAGE 1] Forking persistent child to hold sessions...
> # [STAGE 1] Child PID: 245. Resources are pinned.
> # [STAGE 1] You may now perform kexec reboot.
> #            OK  global.memfd_data
> ok 1 global.memfd_data
> #  RUN           global.zero_memfd ...
> # [STAGE 1] Forking persistent child to hold sessions...
> # [STAGE 1] Child PID: 247. Resources are pinned.
> # [STAGE 1] You may now perform kexec reboot.
> #            OK  global.zero_memfd
> ok 2 global.zero_memfd
> #  RUN           global.preserved_ops ...
> #            OK  global.preserved_ops
> ok 3 global.preserved_ops
> #  RUN           global.fallocate_memfd ...
> # [STAGE 1] Forking persistent child to hold sessions...
> # [STAGE 1] Child PID: 250. Resources are pinned.
> # [STAGE 1] You may now perform kexec reboot.
> #            OK  global.fallocate_memfd
> ok 4 global.fallocate_memfd
> # PASSED: 4 / 4 tests passed.
> # Totals: pass:4 fail:0 xfail:0 xpass:0 skip:0 error:0
>
> ./do_kexec
>
> root@liveupdate-vm:~/liveupdate# ./luo_memfd
> TAP version 13
> 1..4
> # Starting 4 tests from 1 test cases.
> #  RUN           global.memfd_data ...
> #            OK  global.memfd_data
> ok 1 global.memfd_data
> #  RUN           global.zero_memfd ...
> #            OK  global.zero_memfd
> ok 2 global.zero_memfd
> #  RUN           global.preserved_ops ...
> #      SKIP      test only expected to run on stage 1
> #            OK  global.preserved_ops
> ok 3 global.preserved_ops # SKIP test only expected to run on stage 1
> #  RUN           global.fallocate_memfd ...
> #            OK  global.fallocate_memfd
> ok 4 global.fallocate_memfd
> # PASSED: 4 / 4 tests passed.
> # 1 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
> # Totals: pass:3 fail:0 xfail:0 xpass:0 skip:1 error:0
>
> 4. I also do not like that we now have duplicated stage parsing code in  
> luo_test(), perhaps we should add our own  test_harness_run() variant 
> that depends on stage, and use it in both current tests, and the new 
> memfd tests.

Sounds good in principle, but unfortunately ends up duplicating a lot of
logic in test_harness_run() that is not a good idea IMO. We should work
with the harness not fork off into our own.

I suppose we can refactor some of the logic there to split into
functions that we can then use in our luo_test_harness_run(), but
keeping the option parsing logic in sync is going to be difficult.

And for the duplicated logic, I agree. I thought about cleaning it up
but was feeling lazy... Well now that you have called it out let me see
what I can do.

[...]

-- 
Regards,
Pratyush Yadav
