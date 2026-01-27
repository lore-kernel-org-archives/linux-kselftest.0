Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D19513AF2;
	Tue, 27 Jan 2026 14:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769525686; cv=none; b=nCvGuAlAcKh7GOD6213zNDwDnNVGlWUqgSe/DsoXS213nodz2FQ7jw+QsDTfvS2RSGdUO2pO7ZweQPMfmVee2C6Y2mJ0Jhqv4N9Cw9yzSDvO4IZD6OjmYCGPU6BnbqT3BswvR8APy2G88mMyi80J9zVsIjIkRa8cEys5rKXJaS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769525686; c=relaxed/simple;
	bh=EjITxFfaHrNpRvj40ij3H0cLe0GrW6QZX2QjuknHNxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLmfo0+8FKeO91IZX3nsHE5oJAQWblPGfkuwHiA5PKZvnI40Fito1Gqzw98fgOBJw9zTrlisjawsO2XAQ45VA0byBMe5Kha7zDMWmP3iWgalF+8egoPScnRqhP3XQXLedFWhbce9yLfRvwPG7S8cx7Rsb2NRx2iLtQ+tWIy/EEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7E6F1595;
	Tue, 27 Jan 2026 06:54:37 -0800 (PST)
Received: from [10.57.52.3] (unknown [10.57.52.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A14F3F632;
	Tue, 27 Jan 2026 06:54:38 -0800 (PST)
Message-ID: <666db2a4-6015-46ac-8eba-565beff8b0c1@arm.com>
Date: Tue, 27 Jan 2026 15:54:35 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 04/16] arm64/ptrace: Refactor
 syscall_trace_enter/exit()
To: Jinjie Ruan <ruanjinjie@huawei.com>, Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, oleg@redhat.com, tglx@linutronix.de,
 peterz@infradead.org, luto@kernel.org, shuah@kernel.org, kees@kernel.org,
 wad@chromium.org, macro@orcam.me.uk, charlie@rivosinc.com,
 akpm@linux-foundation.org, anshuman.khandual@arm.com, mark.rutland@arm.com,
 thuth@redhat.com, song@kernel.org, ryan.roberts@arm.com,
 ada.coupriediaz@arm.com, broonie@kernel.org, liqiang01@kylinos.cn,
 pengcan@kylinos.cn, kmal@cock.li, dvyukov@google.com,
 richard.weiyang@gmail.com, reddybalavignesh9979@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
 <20251222114737.1334364-5-ruanjinjie@huawei.com>
 <aXeZdh3CtznU8u6L@willie-the-truck>
 <4f07254d-b158-a1ce-69a7-4fa4b0f339c1@huawei.com>
 <532b42e2-3417-4e0f-af59-8c79521c34a3@arm.com>
 <a1f8a28e-84c3-dcf1-26d6-edbb37a5b750@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <a1f8a28e-84c3-dcf1-26d6-edbb37a5b750@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/01/2026 12:02, Jinjie Ruan wrote:
>
> On 2026/1/27 17:43, Kevin Brodsky wrote:
>> On 27/01/2026 04:01, Jinjie Ruan wrote:
>>>> I understand that you're gradually making the arch code more similar to
>>>> the core code so that we can switch over to it, but I'm struggling to
>>>> understand why syscall_trace_enter() takes the 'syscall' argument.
>>>>
>>>> Even the core code just seems to use it as a local variable, which it
>>>> overrides before it ever uses it. What am I missing?
>>> Hi,
>>>
>>> You're absolutely right. The 'syscall' parameter is indeed treated as a
>>> local variable and gets overridden before any real use. Should we
>>> refactor to remove the parameter entirely in generic entry?
>> I noticed this as well, removing it from the generic function would make
>> sense. AFAICT that removal could be propagated quite far in fact:
>> syscall_enter_from_user_mode_work(), syscall_enter_from_user_mode(),
>> even arch implementation (do_syscall_64() on x86).
> Not really, it is the default return value of
> syscall_enter_from_user_mode_work() as below, so we only need to remove
> the parameter in syscall_trace_enter().
>
> static __always_inline long syscall_enter_from_user_mode_work(struct
> pt_regs *regs, long syscall)
> {
> 	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
>
>        if (work & SYSCALL_WORK_ENTER)
>             syscall = syscall_trace_enter(regs, work);
>
>       return syscall;
> }

You're right, hadn't realised the call to syscall_trace_enter() was
conditional.

- Kevin
