Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341D133372E;
	Tue, 27 Jan 2026 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507027; cv=none; b=H2rpNW7iHMk9YLszD9wvKG4DVunqaA8qv3HqPkv6AMgeRFUpmelx4WPBYH/alc7O18Qs21TgDtXdw4EoZay2bM1r26fra3Nnw33xpeXtdw1iOlt/CxrKQIWDjdu2jzB4KvfMfc0Chjo70ZUy7j7CfvfYpVHoNaBAJlOq62o8RCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507027; c=relaxed/simple;
	bh=uQl13lrqMl69+IiDkd49hEB1+YJN3AQemzDhQg61l5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tb1UZvDCz/pXfk43Ub+mFHlIBtILLA356BJyGUwcteGsd46kc+/yNAT24J+nRZfhpKXCG88H8700SFvtI1TQt2dbkQtVeqaoAgiKodZ9bcjYtSjKLG07+l1q69PuxO1sQ4wxfkXZWjCodF5g3W+rTAM2vkr+MA0kldHubefxEvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B770C339;
	Tue, 27 Jan 2026 01:43:38 -0800 (PST)
Received: from [10.57.54.43] (unknown [10.57.54.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDCF03F632;
	Tue, 27 Jan 2026 01:43:38 -0800 (PST)
Message-ID: <532b42e2-3417-4e0f-af59-8c79521c34a3@arm.com>
Date: Tue, 27 Jan 2026 10:43:36 +0100
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
 akpm@linux-foundation.org, ldv@strace.io, anshuman.khandual@arm.com,
 mark.rutland@arm.com, thuth@redhat.com, song@kernel.org,
 ryan.roberts@arm.com, ada.coupriediaz@arm.com, broonie@kernel.org,
 liqiang01@kylinos.cn, pengcan@kylinos.cn, kmal@cock.li, dvyukov@google.com,
 richard.weiyang@gmail.com, reddybalavignesh9979@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
 <20251222114737.1334364-5-ruanjinjie@huawei.com>
 <aXeZdh3CtznU8u6L@willie-the-truck>
 <4f07254d-b158-a1ce-69a7-4fa4b0f339c1@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <4f07254d-b158-a1ce-69a7-4fa4b0f339c1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/01/2026 04:01, Jinjie Ruan wrote:
>> I understand that you're gradually making the arch code more similar to
>> the core code so that we can switch over to it, but I'm struggling to
>> understand why syscall_trace_enter() takes the 'syscall' argument.
>>
>> Even the core code just seems to use it as a local variable, which it
>> overrides before it ever uses it. What am I missing?
> Hi,
>
> You're absolutely right. The 'syscall' parameter is indeed treated as a
> local variable and gets overridden before any real use. Should we
> refactor to remove the parameter entirely in generic entry?

I noticed this as well, removing it from the generic function would make
sense. AFAICT that removal could be propagated quite far in fact:
syscall_enter_from_user_mode_work(), syscall_enter_from_user_mode(),
even arch implementation (do_syscall_64() on x86).

- Kevin
