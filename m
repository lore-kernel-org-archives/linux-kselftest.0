Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E77E3E16A9;
	Tue, 25 Aug 2026 14:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787667485; cv=none; b=syCnZfQ1+6nFKjCYq3DAtoH1iTuIlfVpQsALFvwUcQS0dW5sYDrkTRzTgBxuXw1kmMv95ccbg/p1jHXX+H4gfOx8rB/i3JvpAqh0Src9WqNOT82agxTzgKBADCUjDHo22G0s4FjlAgZk2hbpfGJ0HqInYEgxrH/0243erNMVjZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787667485; c=relaxed/simple;
	bh=IVo46GOYksHu59bUk9yX/+ss/yJkSBpPFWwNe27FDUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nzzZdAWs2iAE5d6x+sqBDNoiam9ZnjAPyHmaSIj52fNnlTByBUyLA/sLmEX1Z5yPED8NBQNgzMGZ8oE5kGufblioV919jb5HwxB+vZqOYHJSZlm5qXpGmXmGAgEUG1rD+QXS887GEL+gbrpszbGuq2DOfxTXyWM1TsLadaDvYdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfQk7Wo+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfQk7Wo+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435CE1F000E9;
	Tue, 25 Aug 2026 14:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787667483;
	bh=2m/dMXURvfpZ+cPx67e5HrKltzCqk468e+Tkq0xJoQg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lfQk7Wo+tK5nk8tvFV0CZEzaOaUWM0Mh5YDkbrjWjVtjWhscI8MJLS69M66Tu25+a
	 fbJEvOx8MgNAOlBOV+/XzLdLYLOm3bGxv+0UFbSn//FLHk6OZFFWwORKtxsSPjph3p
	 56VPgcJdJEi0UCoXC9842wvmIUVLsUc2/TlQJdpmNlKtpcDtY95C2CVN+SpwRASPfn
	 ehFjBG71Vba1XgoS1PYhTKruDwglLDrDex7LLOjTgUcPx0m5DamkjvIUYluCGZSpSe
	 bCwSD+1o9q2j0krEMh/rK7dQOAknp7cPXejiW0OnXXeUdbOGLRKU3hG3cnucfQJd19
	 7iFwxKMG5mQfA==
Message-ID: <bb9a3add-4849-4928-8b6a-0afc0c73b112@kernel.org>
Date: Tue, 25 Aug 2026 16:17:54 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] support kselftest on nommu platform
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Hajime Tazaki <thehajime@gmail.com>, linux-mm@kvack.org,
 liam@infradead.org, rbm@suse.com, akpm@linux-foundation.org,
 luto@amacapital.net, brendan.jackman@linux.dev, liuhangbin@gmail.com,
 corbet@lwn.net, kees@kernel.org, broonie@kernel.org, mhocko@suse.com,
 rppt@kernel.org, shuah@kernel.org, surenb@google.com, vbabka@kernel.org,
 wad@chromium.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org,
 geert@linux-m68k.org, daniel@thingy.jp
References: <20260825015945.141739-1-thehajime@gmail.com>
 <f2ac9432-4fea-4007-aab0-ad80597b284c@kernel.org> <ao2Tl9CLL7WjHYun@gremlin>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <ao2Tl9CLL7WjHYun@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/25/26 15:12, Lorenzo Stoakes (ARM) wrote:
> On Tue, Aug 25, 2026 at 10:37:41AM +0200, David Hildenbrand (Arm) wrote:
>> On 8/25/26 03:59, Hajime Tazaki wrote:
>>> We add an ability to execute kselftest on nommu platforms.
>>>
>>> Currently there are several issues if we wish to run kselftests on nommu
>>> targets:
>>>
>>> - it cannot compile/build test binaries because the current files mainly
>>>   assume to build with glibc,
>>> - some of the tests are not able to run on nommu targets as there are no
>>>   fork(2) syscall.
>>>
>>> The first issue can be avoided if we can build static PIE binaries (if
>>> targets support it), but in our case (build on ubuntu/glibc and run on
>>> alpine/musl-libc), it fails to invoke due to lack of the GNU ifunc
>>> mechanism.  Thus, we need to cross-compile with musl toolchain, which
>>> needs to be solved the first issue.
>>>
>>> The second issue is the lack of fork(2) syscall on those platforms.
>>> Especially the test harness helper (kselftest_harness.h) uses the
>>> syscall, which cannot be simply with vfork(2).  `timeout` command used
>>> in `runner.sh` never works for nommu platform as it uses fork(2).
>>>
>>> nommu component in the mm subsystem has several known issues and having
>>> test cases should help this situation, thus this patchset is very first
>>> step toward enriching test environment which has not been well tested
>>> for a while.  The test cases is implemented based on the document
>>> (Documentation/admin-guide/mm/nommu-mmap.rst).
>>>
>>> So, for the first step, nommu targets only support low-level API of
>>> kselftests (kselftest.h), and implement tests in a new target,
>>> TARGETS=mm/nommu.  Other targets are currently not even able to build
>>> due to toolchain issues but will be addressed once the initial
>>> introduction which mainly focuses on nommu test will be settled.
>>>
>>> The patch was initially combined with other patches but is decoupled to
>>> only focus on test framework and testcases.
>>>
>>> - rfc:
>>> https://lore.kernel.org/linux-mm/20260813063401.1786548-1-thehajime@gmail.com/
>>>
>>> Hajime Tazaki (2):
>>>   selftests: run tests on nommu architecture
>>>   selftests/mm: add nommu mmap and mremap behavior tests
>>>
>>>  Documentation/dev-tools/kselftest.rst         |  14 +
>>>  tools/testing/selftests/Makefile              |   1 +
>>>  tools/testing/selftests/kselftest/runner.sh   |   9 +-
>>>  tools/testing/selftests/kselftest_harness.h   |   4 +
>>>  tools/testing/selftests/lib.mk                |   8 +
>>>  tools/testing/selftests/mm/nommu/Makefile     |   7 +
>>>  .../selftests/mm/nommu/nommu_mmap_test.c      | 265 +++++++++++++
>>>  .../selftests/mm/nommu/nommu_mremap_test.c    | 353 ++++++++++++++++++
>>
>> That's odd.
>>
>> 	tools/testing/selftests/mm
>>
>> itself should know which tests can be built and ran on nommu. nommu-only tests
>> can be placed in mm/nommu, but I would expect tools/testing/selftests/mm's
>> Makefile and run script to compile and run only selftests that are supported on
>> the given platform.
> 
> I mean I think at this point with mm/nommu/nommu_xxx.c it'd make more sense to
> simply have selftests/nommu/ + update the mm makefile to not build stuff that's
> broken on nommu there.
> 
> That way positively nommu-stuff is put in its own place and what's broken on mm
> specific to nommu can be fixed there.
> 
> I'd rather isolate them clearly rather than having them live in a subdirectory
> of mm.

My understanding is that some MM tests could be enabled/changed in the future
that support both MMU and NOMMU. Not sure how to best handle that.

So wiring up mm/nommu as a separate thing did sound wrong to me. So it should
either be integrated or the tests in fact completely moved out of mm/

-- 
Cheers,

David
