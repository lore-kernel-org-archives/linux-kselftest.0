Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA60825771;
	Wed, 28 Jan 2026 01:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769562593; cv=none; b=Z3dkY3KjpUg6DnYWK0KELHWhGDi3/vUf6tra+BObZeySRh2esSbr2AQs1LaJ1Wi4ZjirPdpgZCPKmAAQXjaxbFpBlJd7Tz0biiudexFrKunOCVygnoWal0jfN8Anwd7FrSBEnyby8djyilvhHI3DVD4IWeiIRH0i1jgvEazNGdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769562593; c=relaxed/simple;
	bh=yQJxG5ol7R1Pha3NPKZmpxQkDs6Gx6RTpj9zF6OFrvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jCAouTKy6lMjjlG3cbCl3iWjZ52vb+u6sNnvuQ16qxri3EhCDz47EEWsTqjimApQC9HsuKsA7OHWcXRmg9DFb5WedkipTnvQBkbt3yFtZw3hh4qZxAg4uwvAbJbwKCF7mHVM8ou8xcHa7mWbXoA1xRPSsje2Sq9xCRcPLKOjLiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=QY7A13ii; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="QY7A13ii"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lGaN5t5yAecwPUfPu0SWueHdZEkikh9tEoeETEh9yTU=;
	b=QY7A13ii//yij9w8amV6AnjLuC+xtRqv0A5aFsx3HH/AlxEldqDn/3RHxWvHg4XCGjY+vMPoM
	xDYlbw0sAN61KfC1rfk0soKq+1gPzpS63y8dwVM+1f/VRY4qYvJh3V+fwomgMb3SkgYG4AXKBWS
	2GTl9/3wIU/WFXh/bhW3eEg=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4f13xd2zLrzLlSt;
	Wed, 28 Jan 2026 09:06:13 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 85C2240561;
	Wed, 28 Jan 2026 09:09:40 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 28 Jan 2026 09:09:36 +0800
Message-ID: <6ff5d366-3a2d-089b-5ac7-e40b81a8664c@huawei.com>
Date: Wed, 28 Jan 2026 09:09:35 +0800
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
 <4891191c-d1c3-6985-c2ea-1b29deb8abe1@huawei.com>
 <0f6212c1-7034-42f4-ba77-10e9ec52a4f5@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <0f6212c1-7034-42f4-ba77-10e9ec52a4f5@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2026/1/27 23:06, Kevin Brodsky wrote:
> On 27/01/2026 12:34, Jinjie Ruan wrote:
>>> [...]
>>>
>>>>  I'm also concerned that rseq_debug_update_user_cs()
>>>> operates on instruction_pointer(regs) which is something that can be
>>>> chaned by ptrace.
>>> Isn't that true regardless of where rseq_syscall() is called on the
>>> syscall exit path, though?
>> My understanding is that if instruction_pointer(regs) is hijacked and
>> modified via ptrace at the syscall exit (ptrace_report_syscall_exit()),
>> this modification will not be observed by rseq. Specifically, in the
>> generic entry syscall exit path, rseq_syscall() is unable to detect such
>> a PC modification.
> 
> Good point. So concretely that means that currently on arm64, one could
> make the rseq debug check pass/fail by using the syscall exit trap to
> modify PC. OTOH this is impossible with generic entry because the rseq
> check is performed first. I'm not sure this is a feature anyone has even
> noticed, but it is a user-visible change indeed.

After digging into the ptrace code, I found that ptrace does not modify
instruction_pointer(regs) on the syscall exit path; it only changes the
return value as below.
Therefore, if my understanding is correct, Will's concern does not apply
here.

ptrace_set_syscall_info()
  -> ptrace_set_syscall_info_exit()
     -> syscall_set_return_value(child, regs, 0, rval)


Regards,
Jinjie

> 
> - Kevin
> 
