Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75DF2D660E;
	Fri, 30 Jan 2026 13:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769779640; cv=none; b=lVHwGiSzOq68SaF6UqH1dchgcOBe+niSXT379A13Cgp/IebhWmBdfzj/8w5D0RsEjGt8Odqn5rGeNVUFol4tH1M7ileKvnCXlqcjnsBFZMvB09qvhiGDUqphMsd6mhaHiwTpIu8s1pa/3TMkW4ROMBOS/1uWe2uW+0ExjO4gQgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769779640; c=relaxed/simple;
	bh=EpHEzX5oSY4/kv7rFwjFdQL4xQBp0DQ4cWf5uXb62A4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZgKfHaTew35Grx0puu/1mqRiX34OtcH7BVXbJwSEhZHWQ1HGwtK478j7REtRG2zJp7QQN1jXEWsclS6EdvXWgELZW6mpb/e2k733avYpE34hZGaoGD7/VgYrCKczNmBcGH4vgjlRlSuiPWsFM2uUovBKZES3aH4CAV7hZOxN5zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A0B4153B;
	Fri, 30 Jan 2026 05:27:10 -0800 (PST)
Received: from [10.57.51.191] (unknown [10.57.51.191])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6335F3F73F;
	Fri, 30 Jan 2026 05:27:10 -0800 (PST)
Message-ID: <13d22231-d84a-4993-9a69-e3922e45b500@arm.com>
Date: Fri, 30 Jan 2026 14:27:07 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 09/14] entry: Rework syscall_exit_to_user_mode_work()
 for arch reuse
To: Thomas Gleixner <tglx@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
 catalin.marinas@arm.com, will@kernel.org, oleg@redhat.com,
 peterz@infradead.org, luto@kernel.org, shuah@kernel.org, kees@kernel.org,
 wad@chromium.org, deller@gmx.de, akpm@linux-foundation.org,
 charlie@rivosinc.com, mark.rutland@arm.com, anshuman.khandual@arm.com,
 song@kernel.org, ryan.roberts@arm.com, thuth@redhat.com,
 ada.coupriediaz@arm.com, broonie@kernel.org, pengcan@kylinos.cn,
 liqiang01@kylinos.cn, kmal@cock.li, dvyukov@google.com,
 reddybalavignesh9979@gmail.com, richard.weiyang@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-10-ruanjinjie@huawei.com>
 <56978cb8-f9de-4bf2-b1fc-b5564fec7387@arm.com>
 <ef52449d-7ae0-11d0-c8a9-2ca572454425@huawei.com>
 <3bfa15fc-187e-4c39-9cb3-a936fdd443b2@arm.com> <87o6mbl82j.ffs@tglx>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <87o6mbl82j.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/01/2026 11:16, Thomas Gleixner wrote:
> On Thu, Jan 29 2026 at 17:00, Kevin Brodsky wrote:
>> On 29/01/2026 14:11, Jinjie Ruan wrote:
>>>>> - * Calling convention is the same as for syscall_exit_to_user_mode() and it
>>>>> - * returns with all work handled and interrupts disabled. The caller must
>>>>> - * invoke exit_to_user_mode() before actually switching to user mode to
>>>>> - * make the final state transitions. Interrupts must stay disabled between
>>>>> - * return from this function and the invocation of exit_to_user_mode().
>>>>> + * Calling convention is the same as for syscall_exit_to_user_mode(). The
>>>>> + * caller must invoke local_irq_disable(), __exit_to_user_mode_prepare() and
>>>> Shouldn't it be syscall_exit_to_user_mode_prepare() rather than
>>>> __exit_to_user_mode_prepare()? The former has extra calls (e.g. rseq).
>>> Perhaps we can just delete these comments — at present only generic
>>> entry and arm64 use it, and nowhere else needs it; after the refactoring
>>> the comments now seem rather unclear.
>> Agreed, the comments are essentially describing what each function
>> calls; considering how short they are, directly reading the code is
>> probably easier.
> No. Please keep them. There is more information in them than just the
> pure 'what's' called.

That is true before this patch, where it made sense to highlight that
exit_to_user_mode() must still be called after this function (without
re-enabling interrupts). With this patch there is however much more that
this function is lacking, and it feels very likely that comments will go
out of sync with exactly what syscall_exit_to_user_mode() calls.

I suppose we could simply point the reader to
syscall_exit_to_user_mode() to find out what else is needed, and keep
the comment about the calling convention being the same.

- Kevin
