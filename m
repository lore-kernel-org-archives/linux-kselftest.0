Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46949221DB6;
	Tue, 27 Jan 2026 11:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769513695; cv=none; b=en8lHr+x5MFm+5L1f2QBuz51zwd3GYBYts32WpalphAWPe6vKoJeKAPqQzf5tJgpEiEzauLFymjgxu+ryUTBqviYCma91DHiwiQdYe5IiPZaUHYy1zZhFkKhIVtkowisBgUL4gjV6ebytcq9TPgDdnaYcvENd5ygiJ0oqp7tETQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769513695; c=relaxed/simple;
	bh=8wrNzKOoBYJNowQ2Axfo0UnFSivl2tAdKfnEyAICV+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=shLqqVyLF9DG+htZG51PCmAcC+upxwqKBj8VAKWgObU30IQ+bXRQhJBDmHJ9m1vjsit9AtHPN2atdez7BDS1DWQyuCM+ISkBTb+saScylk3d5hcbTLE+MKzLiLKSIj+hgntT3M8pE7ss5E19M9v1SxNKUkZoG9NyPqrMv4JL9FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=wvQdfUgr; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="wvQdfUgr"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7OVlyCGnMtuPpE3SpcE+mrUgLiRrEpQleMNAZmB70u0=;
	b=wvQdfUgrzrxqUOzxmPxzSBbFtRAleEg7rMLvtcXMZxuoOC7kzqmcjhV/IlNuEtHQZ38TKjP5K
	CH7MaWuXigDx5ZYp+v4pUb5qe2yiI0F6mIKppF9k9vP409WiebkUM8JCiND4dAqFOMYwMmgf4db
	hW43ezYzJ3stv4uzs1hOIzg=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4f0jrb4XC0zcZyb;
	Tue, 27 Jan 2026 19:30:39 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id D94EE404AD;
	Tue, 27 Jan 2026 19:34:47 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 27 Jan 2026 19:34:42 +0800
Message-ID: <4891191c-d1c3-6985-c2ea-1b29deb8abe1@huawei.com>
Date: Tue, 27 Jan 2026 19:34:41 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v10 05/16] arm64: ptrace: Move rseq_syscall() before
 audit_syscall_exit()
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>, Will Deacon <will@kernel.org>
CC: <catalin.marinas@arm.com>, <oleg@redhat.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <luto@kernel.org>, <shuah@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <macro@orcam.me.uk>,
	<charlie@rivosinc.com>, <akpm@linux-foundation.org>, <ldv@strace.io>,
	<anshuman.khandual@arm.com>, <mark.rutland@arm.com>, <thuth@redhat.com>,
	<song@kernel.org>, <ryan.roberts@arm.com>, <ada.coupriediaz@arm.com>,
	<broonie@kernel.org>, <liqiang01@kylinos.cn>, <pengcan@kylinos.cn>,
	<kmal@cock.li>, <dvyukov@google.com>, <richard.weiyang@gmail.com>,
	<reddybalavignesh9979@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
 <20251222114737.1334364-6-ruanjinjie@huawei.com>
 <aXe6W69Esd1NLEU8@willie-the-truck>
 <28e54f74-9b3d-4c3c-9172-ceb429e7fcbe@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <28e54f74-9b3d-4c3c-9172-ceb429e7fcbe@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2026/1/27 17:44, Kevin Brodsky wrote:
> On 26/01/2026 20:02, Will Deacon wrote:
>> On Mon, Dec 22, 2025 at 07:47:26PM +0800, Jinjie Ruan wrote:
>>> [...]
>>>
>>> To make it more reasonable and in preparation for moving arm64 over to
>>> the generic entry code, move rseq_syscall() ahead before
>>> audit_syscall_exit().
>> I've been struggling a bit to see how this helps to align with the
>> generic code.
> 
> rseq_syscall(), or rather rseq_debug_syscall_return() since eaa9088d568c
> ("rseq: Use static branch for syscall exit debug when
> GENERIC_IRQ_ENTRY=y"), is called first in the generic
> syscall_exit_to_user_mode_work(), so the aim of that patch is to align
> the order of calls with generic entry.
> 
>>  I'm also concerned that rseq_debug_update_user_cs()
>> operates on instruction_pointer(regs) which is something that can be
>> chaned by ptrace.
> 
> Isn't that true regardless of where rseq_syscall() is called on the
> syscall exit path, though?

My understanding is that if instruction_pointer(regs) is hijacked and
modified via ptrace at the syscall exit (ptrace_report_syscall_exit()),
this modification will not be observed by rseq. Specifically, in the
generic entry syscall exit path, rseq_syscall() is unable to detect such
a PC modification.


Regards,
Jinjie

> 
>> So, I'm not saying this is wrong, but it feels like a user-visible
>> change that needs better justification.
> 
> This seems to hang on whether the force_sig(SIGSEGV) that rseq_syscall()
> might issue interacts in any way with the tracing calls. My feeling is
> that it doesn't, but I haven't confirmed it. Worth noting this is only
> relevant if rseq debugging is enabled, so any potential user-visible
> effect is limited.
> 
> - Kevin
> 
