Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F8036998C;
	Tue, 27 Jan 2026 15:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526431; cv=none; b=rOglt4vVVQ49ynVwn0SnIrynRQj1wk1ZRWjk+9U/OI1baSD1mukhtwz2SHs1t2IrhQkVIkySLPNqlpkBNGozkBGG9jQUjYxVz3Ppvay9DplhwYVuayMBY6Zaenq4DpAQry7Byq2Lla2dO9zlo6AFLGN68l1emfXpdexnKYKSdnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526431; c=relaxed/simple;
	bh=dJKyICceK6bdEWAH7DNOFgLmHG+jusOYqKDU2HOiTi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fCy1MpC9ouzfXUP4wUJX8KJxFmeaE/K7akYCiPBpplAuexTUmlZ79sM7oipKYdmerubbTk3kMLolBmjnlR0ktWHywIBMeUirBmjxHiAfnGTa8k7abh5P9dZHgkZAgomQzARpzNvQHYbSDC6aKjnQdP5HV5NJx1vV5CyK2osyBQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E29FB1595;
	Tue, 27 Jan 2026 07:07:01 -0800 (PST)
Received: from [10.57.52.3] (unknown [10.57.52.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 869BF3F632;
	Tue, 27 Jan 2026 07:07:00 -0800 (PST)
Message-ID: <0f6212c1-7034-42f4-ba77-10e9ec52a4f5@arm.com>
Date: Tue, 27 Jan 2026 16:06:58 +0100
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
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <4891191c-d1c3-6985-c2ea-1b29deb8abe1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/01/2026 12:34, Jinjie Ruan wrote:
>> [...]
>>
>>>  I'm also concerned that rseq_debug_update_user_cs()
>>> operates on instruction_pointer(regs) which is something that can be
>>> chaned by ptrace.
>> Isn't that true regardless of where rseq_syscall() is called on the
>> syscall exit path, though?
> My understanding is that if instruction_pointer(regs) is hijacked and
> modified via ptrace at the syscall exit (ptrace_report_syscall_exit()),
> this modification will not be observed by rseq. Specifically, in the
> generic entry syscall exit path, rseq_syscall() is unable to detect such
> a PC modification.

Good point. So concretely that means that currently on arm64, one could
make the rseq debug check pass/fail by using the syscall exit trap to
modify PC. OTOH this is impossible with generic entry because the rseq
check is performed first. I'm not sure this is a feature anyone has even
noticed, but it is a user-visible change indeed.

- Kevin
