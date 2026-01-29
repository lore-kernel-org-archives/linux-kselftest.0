Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E73387591;
	Thu, 29 Jan 2026 13:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769692300; cv=none; b=NG7zfn+GMtcx2v5jt+FU2m5lajEa4Cv26df99DWMHeBMvBvlHPa/EUPrb338n5CuSqLD1WiS0mScUusb+tLJcSpWCo2bVTNYCW79gnvCGvj1T0JpEmi766DApEdBk/pAMrg4lzzmrQoqtOf9Z5gazXgxXPWoA0Y/KXrioLqFPIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769692300; c=relaxed/simple;
	bh=y446zHC2ezxUtqbIMwjhXUZ2odlitYqEfBmBI9D/4ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nzpeYdmolAk+oVuRgmgXwUy0bRPqJMRUs4Fh1T0Bb57ultoU4NbCmUymqNYRCCDSkuCQVcSYwd0xUaf6Zde+x1ES+ZSa/KS/8ofLS4cziDO/J7WSZngUJ/23RwiHu8Pm1yFFCETkUGAIhhiHIb6Le1SW5Q/09jdw0RGMuKKr69o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=yJSsIM95; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="yJSsIM95"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lGAZNyC26tWnBJpgASq82yQ4JhsMQIeHg3yeTtqFNb0=;
	b=yJSsIM95rQZsy9ixGAVeMZvy88LA9/2puiU80aDMKMMRhXL/+4+gA3boCys2k8m379qDJG8zg
	dWqP4m4XUCKX7GBnaRNHsPpaSES4HGwg1W4/fw9yo5i458enHyvoBDYrVHjQwmUT5b8lGgF+CKM
	ai0NaSnMxI/fSczfaJu7ctU=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4f1zvJ0LTszcb0x;
	Thu, 29 Jan 2026 21:07:24 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 06A824036C;
	Thu, 29 Jan 2026 21:11:36 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 29 Jan 2026 21:11:34 +0800
Message-ID: <ef52449d-7ae0-11d0-c8a9-2ca572454425@huawei.com>
Date: Thu, 29 Jan 2026 21:11:33 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v11 09/14] entry: Rework syscall_exit_to_user_mode_work()
 for arch reuse
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <oleg@redhat.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <luto@kernel.org>, <shuah@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <deller@gmx.de>,
	<akpm@linux-foundation.org>, <charlie@rivosinc.com>, <mark.rutland@arm.com>,
	<anshuman.khandual@arm.com>, <song@kernel.org>, <ryan.roberts@arm.com>,
	<thuth@redhat.com>, <ada.coupriediaz@arm.com>, <broonie@kernel.org>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>, <kmal@cock.li>,
	<dvyukov@google.com>, <reddybalavignesh9979@gmail.com>,
	<richard.weiyang@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-10-ruanjinjie@huawei.com>
 <56978cb8-f9de-4bf2-b1fc-b5564fec7387@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <56978cb8-f9de-4bf2-b1fc-b5564fec7387@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2026/1/29 20:06, Kevin Brodsky wrote:
> On 28/01/2026 04:19, Jinjie Ruan wrote:
>> In the generic entry code, the beginning of
>> syscall_exit_to_user_mode_work() can be reused on arm64 so it makes
>> sense to rework it.
>>
>> In preparation for moving arm64 over to the generic entry
>> code, as nothing calls syscall_exit_to_user_mode_work() except for
>> syscall_exit_to_user_mode(), move local_irq_disable_exit_to_user() and
>> syscall_exit_to_user_mode_prepare() out from
>> syscall_exit_to_user_mode_work() to the only one caller.
>>
>> Also update the comment and no functional changes.
>>
>> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  include/linux/entry-common.h | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
>> index e4a8287af822..c4fea642d931 100644
>> --- a/include/linux/entry-common.h
>> +++ b/include/linux/entry-common.h
>> @@ -125,14 +125,14 @@ void syscall_exit_work(struct pt_regs *regs, unsigned long work);
>>   * syscall_exit_to_user_mode_work - Handle work before returning to user mode
>>   * @regs:	Pointer to currents pt_regs
>>   *
>> - * Same as step 1 and 2 of syscall_exit_to_user_mode() but without calling
>> + * Same as step 1 of syscall_exit_to_user_mode() but without calling
>> + * local_irq_disable(), syscall_exit_to_user_mode_prepare() and
>>   * exit_to_user_mode() to perform the final transition to user mode.
>>   *
>> - * Calling convention is the same as for syscall_exit_to_user_mode() and it
>> - * returns with all work handled and interrupts disabled. The caller must
>> - * invoke exit_to_user_mode() before actually switching to user mode to
>> - * make the final state transitions. Interrupts must stay disabled between
>> - * return from this function and the invocation of exit_to_user_mode().
>> + * Calling convention is the same as for syscall_exit_to_user_mode(). The
>> + * caller must invoke local_irq_disable(), __exit_to_user_mode_prepare() and
> 
> Shouldn't it be syscall_exit_to_user_mode_prepare() rather than
> __exit_to_user_mode_prepare()? The former has extra calls (e.g. rseq).

Perhaps we can just delete these comments — at present only generic
entry and arm64 use it, and nowhere else needs it; after the refactoring
the comments now seem rather unclear.

> 
> - Kevin
> 
>> + * exit_to_user_mode() before actually switching to user mode to
>> + * make the final state transitions.
>>   */
>>  static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
>>  {
>> @@ -155,8 +155,6 @@ static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
>>  	 */
>>  	if (unlikely(work & SYSCALL_WORK_EXIT))
>>  		syscall_exit_work(regs, work);
>> -	local_irq_disable_exit_to_user();
>> -	syscall_exit_to_user_mode_prepare(regs);
>>  }
>>  
>>  /**
>> @@ -192,6 +190,8 @@ static __always_inline void syscall_exit_to_user_mode(struct pt_regs *regs)
>>  {
>>  	instrumentation_begin();
>>  	syscall_exit_to_user_mode_work(regs);
>> +	local_irq_disable_exit_to_user();
>> +	syscall_exit_to_user_mode_prepare(regs);
>>  	instrumentation_end();
>>  	exit_to_user_mode();
>>  }
> 
