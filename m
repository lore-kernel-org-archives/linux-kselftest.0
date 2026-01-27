Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2758C334C04;
	Tue, 27 Jan 2026 09:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507068; cv=none; b=WZ7gGCSQiwOZx3+LKtO5sWW6vtV4SPhsHWHGcD62YurO5LX83b3fVPoft+N1wKR0oxhpkNNOFH8Nx4+atW35yqrmK3cI1iPX64kKbHtD3/sWpuR+ISblpSrf4wgOCmWRTd9o1ARLwXDOT8ekNwVvnBghbxOqA+FJINz0sjYTN78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507068; c=relaxed/simple;
	bh=YGARJxFZr+9cy0bpkFU2GdwIwa7Iyeec0Bvd3kgOA9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+4COD9467NsI60P1ljYjiAbyWtkhiNwurHiFmOJCC2Zh6Qy/dD0hTY04viQZ5X95rH31d38czasVLousebjXQeuKFG5tIQfR2s+DpEjrf2zdjzNwtfgV1aRYkKv6ke2bGCFTh/nbbryWdB366fpNvK1ZN/RnBl4RTczKYFi1h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 154B1497;
	Tue, 27 Jan 2026 01:44:20 -0800 (PST)
Received: from [10.57.54.43] (unknown [10.57.54.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 701203F85F;
	Tue, 27 Jan 2026 01:44:20 -0800 (PST)
Message-ID: <28e54f74-9b3d-4c3c-9172-ceb429e7fcbe@arm.com>
Date: Tue, 27 Jan 2026 10:44:17 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/16] arm64: ptrace: Move rseq_syscall() before
 audit_syscall_exit()
To: Will Deacon <will@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>
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
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <aXe6W69Esd1NLEU8@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/01/2026 20:02, Will Deacon wrote:
> On Mon, Dec 22, 2025 at 07:47:26PM +0800, Jinjie Ruan wrote:
>> [...]
>>
>> To make it more reasonable and in preparation for moving arm64 over to
>> the generic entry code, move rseq_syscall() ahead before
>> audit_syscall_exit().
> I've been struggling a bit to see how this helps to align with the
> generic code.

rseq_syscall(), or rather rseq_debug_syscall_return() since eaa9088d568c
("rseq: Use static branch for syscall exit debug when
GENERIC_IRQ_ENTRY=y"), is called first in the generic
syscall_exit_to_user_mode_work(), so the aim of that patch is to align
the order of calls with generic entry.

>  I'm also concerned that rseq_debug_update_user_cs()
> operates on instruction_pointer(regs) which is something that can be
> chaned by ptrace.

Isn't that true regardless of where rseq_syscall() is called on the
syscall exit path, though?

> So, I'm not saying this is wrong, but it feels like a user-visible
> change that needs better justification.

This seems to hang on whether the force_sig(SIGSEGV) that rseq_syscall()
might issue interacts in any way with the tracing calls. My feeling is
that it doesn't, but I haven't confirmed it. Worth noting this is only
relevant if rseq debugging is enabled, so any potential user-visible
effect is limited.

- Kevin
