Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F260D284672;
	Thu, 29 Jan 2026 16:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702426; cv=none; b=RTAxO/QNzWUXpNo4l7ky15XajzNWt/1fjmGHgKEOhesR1Te0Adnq/3WauNf/Ueifezuwqn2o8OaokWRdUbwTqfRVv5+TvEcQMnnduDAaIBbLE1tCsWejy9e17VfuS0xt+qur/vbLAZ5z2eVQaxL6bFo48vX73YjV3oYR0iPuNXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702426; c=relaxed/simple;
	bh=8GW6eXYbLn1gHU+nPtBLOi1GLiB5vXDdUTDOnH+gq58=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Pn3m3rdp1yMKb+K2HtBzADrLUjJrZSqxjgSghqKw5O4ZATymE1ivCU8BkErQrkQtJXITJbhsw1XGk6Vk8vyGsNeVT9Bd0Ws24y22/ajeggzNCeORh1u5hGeGrOw5/bxfQLqDz1dpTSWLWAhr8TcsGK7Pz9ZQ4cMWXsSZligM/+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B63F8153B;
	Thu, 29 Jan 2026 08:00:16 -0800 (PST)
Received: from [10.57.53.17] (unknown [10.57.53.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A38413F632;
	Thu, 29 Jan 2026 08:00:17 -0800 (PST)
Message-ID: <3bfa15fc-187e-4c39-9cb3-a936fdd443b2@arm.com>
Date: Thu, 29 Jan 2026 17:00:14 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 09/14] entry: Rework syscall_exit_to_user_mode_work()
 for arch reuse
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 deller@gmx.de, akpm@linux-foundation.org, charlie@rivosinc.com,
 mark.rutland@arm.com, anshuman.khandual@arm.com, song@kernel.org,
 ryan.roberts@arm.com, thuth@redhat.com, ada.coupriediaz@arm.com,
 broonie@kernel.org, pengcan@kylinos.cn, liqiang01@kylinos.cn, kmal@cock.li,
 dvyukov@google.com, reddybalavignesh9979@gmail.com,
 richard.weiyang@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-10-ruanjinjie@huawei.com>
 <56978cb8-f9de-4bf2-b1fc-b5564fec7387@arm.com>
 <ef52449d-7ae0-11d0-c8a9-2ca572454425@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <ef52449d-7ae0-11d0-c8a9-2ca572454425@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/01/2026 14:11, Jinjie Ruan wrote:
>>> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
>>> index e4a8287af822..c4fea642d931 100644
>>> --- a/include/linux/entry-common.h
>>> +++ b/include/linux/entry-common.h
>>> @@ -125,14 +125,14 @@ void syscall_exit_work(struct pt_regs *regs, unsigned long work);
>>>   * syscall_exit_to_user_mode_work - Handle work before returning to user mode
>>>   * @regs:	Pointer to currents pt_regs
>>>   *
>>> - * Same as step 1 and 2 of syscall_exit_to_user_mode() but without calling
>>> + * Same as step 1 of syscall_exit_to_user_mode() but without calling
>>> + * local_irq_disable(), syscall_exit_to_user_mode_prepare() and
>>>   * exit_to_user_mode() to perform the final transition to user mode.
>>>   *
>>> - * Calling convention is the same as for syscall_exit_to_user_mode() and it
>>> - * returns with all work handled and interrupts disabled. The caller must
>>> - * invoke exit_to_user_mode() before actually switching to user mode to
>>> - * make the final state transitions. Interrupts must stay disabled between
>>> - * return from this function and the invocation of exit_to_user_mode().
>>> + * Calling convention is the same as for syscall_exit_to_user_mode(). The
>>> + * caller must invoke local_irq_disable(), __exit_to_user_mode_prepare() and
>> Shouldn't it be syscall_exit_to_user_mode_prepare() rather than
>> __exit_to_user_mode_prepare()? The former has extra calls (e.g. rseq).
> Perhaps we can just delete these comments — at present only generic
> entry and arm64 use it, and nowhere else needs it; after the refactoring
> the comments now seem rather unclear.

Agreed, the comments are essentially describing what each function
calls; considering how short they are, directly reading the code is
probably easier.

- Kevin
