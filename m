Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C0B29827E;
	Wed, 28 Jan 2026 14:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769612019; cv=none; b=UODj1IbzOoCBJev0eLwfwp4bFJQYCj3WrbUbXny18sSEJGh+rEVw3Py+UX2eiAV8DIhPl+gmFOv8YYWLxHpv+b2XfsrCVcYLCTc5SpEu+yuDs8ZumtAqCBquBSr0ysfqXTvLoOkNZ+S1BI/6a6iyMt99nPUmyC9VZ5TEL59oq3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769612019; c=relaxed/simple;
	bh=0lM4PcSgf1rtjHZvdcOhwOvjmWfkwAE8vzlY6lxtmaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HwesBCUW+P6SByfRyHTFZ295ehg3+R+yoI7w95JMdXo/UM6QXwILAijqFyHPqxALQttG7fuZxPrqbMz9eBdK5tvS3DzuebpBltQugeqGAl4sgR64jHnJ5UEdF9ipajjW2jsUhFkL6J9VsjpjTs9o7x/wY8GzMEADOFUe4vDJc9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 614011515;
	Wed, 28 Jan 2026 06:53:30 -0800 (PST)
Received: from [10.44.160.85] (e126510-lin.lund.arm.com [10.44.160.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 563313F73F;
	Wed, 28 Jan 2026 06:53:31 -0800 (PST)
Message-ID: <647fe97e-e8c1-464f-bbc7-39dac0bda6b2@arm.com>
Date: Wed, 28 Jan 2026 15:53:28 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/16] arm64: ptrace: Move rseq_syscall() before
 audit_syscall_exit()
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
 <20251222114737.1334364-6-ruanjinjie@huawei.com>
 <aXe6W69Esd1NLEU8@willie-the-truck>
 <28e54f74-9b3d-4c3c-9172-ceb429e7fcbe@arm.com>
 <4891191c-d1c3-6985-c2ea-1b29deb8abe1@huawei.com>
 <0f6212c1-7034-42f4-ba77-10e9ec52a4f5@arm.com>
 <6ff5d366-3a2d-089b-5ac7-e40b81a8664c@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <6ff5d366-3a2d-089b-5ac7-e40b81a8664c@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/01/2026 02:09, Jinjie Ruan wrote:
>
> On 2026/1/27 23:06, Kevin Brodsky wrote:
>> On 27/01/2026 12:34, Jinjie Ruan wrote:
>>>> [...]
>>>>
>>>>>  I'm also concerned that rseq_debug_update_user_cs()
>>>>> operates on instruction_pointer(regs) which is something that can be
>>>>> chaned by ptrace.
>>>> Isn't that true regardless of where rseq_syscall() is called on the
>>>> syscall exit path, though?
>>> My understanding is that if instruction_pointer(regs) is hijacked and
>>> modified via ptrace at the syscall exit (ptrace_report_syscall_exit()),
>>> this modification will not be observed by rseq. Specifically, in the
>>> generic entry syscall exit path, rseq_syscall() is unable to detect such
>>> a PC modification.
>> Good point. So concretely that means that currently on arm64, one could
>> make the rseq debug check pass/fail by using the syscall exit trap to
>> modify PC. OTOH this is impossible with generic entry because the rseq
>> check is performed first. I'm not sure this is a feature anyone has even
>> noticed, but it is a user-visible change indeed.
> After digging into the ptrace code, I found that ptrace does not modify
> instruction_pointer(regs) on the syscall exit path; it only changes the
> return value as below.
> Therefore, if my understanding is correct, Will's concern does not apply
> here.
>
> ptrace_set_syscall_info()
>   -> ptrace_set_syscall_info_exit()
>      -> syscall_set_return_value(child, regs, 0, rval)

I'm not following, how is that related to the call to
ptrace_report_syscall_exit()? That eventually results in a call to
ptrace_stop() (via ptrace_notify()), which synchronously causes the
tracee to sleep and allows the tracer to issue ptrace commands, e.g.
setting PC.

- Kevin
