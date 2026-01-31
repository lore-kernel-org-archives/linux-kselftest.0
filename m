Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F323DDAB;
	Sat, 31 Jan 2026 01:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769824127; cv=none; b=sRRZGdsZCmeNa9RvO4cyRFtJDmS+TN9Ly6TUqC+G3DaOoBCgrv/lzJeoBSA2DjQIgoHGCj8qCSbsaQKsCSzT50rabhhsXVGJLZc5IesjJamop6IqGCxoxA3w4gpjX1/iXjtgENNTOb1bkY8ZlWlcJibg4R1aB7a2B+ccbqiAKpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769824127; c=relaxed/simple;
	bh=SBSh+mAiflAWLJb0y1YnBp+erk89eZKRlpqvF+PXP30=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rM/Ol67tV+K7QkleA/G2MdRabuEn/qlc9wUnuVhXZMDlzV89quub6AA2EuZvGKPsD1me8PqJdgm8T77uAbeWVD1g3xckdyi613HvBq992r2NPzfBrVIS8Z5/fI/e4Z1jm721uWfCPYKbRbdhPwQsi4QhpDLjKOLjIDRTwxuJ1Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=HCX3tgfc; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="HCX3tgfc"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=I724FHP9bHMBxRJmzzeWHFpJXS4ju6lTv7pjaWoConw=;
	b=HCX3tgfcqmG9JPEPW+kfsIzNV7Bd+oulcnGPAAoY+A2vZFtGUOD+gHFUTmRJW/J3392qiTZgk
	FWg7lPTfrKPwr/N0Vjun2wkCae1S5IvHzqLs4B06H0iMpdGWEz2YRUjJB6ZsIWCXkffPEOYNv9n
	1+tUpdBYcXLI/+S1LKfUzJs=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4f2wgF4pYjzLlSd;
	Sat, 31 Jan 2026 09:45:13 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A43640565;
	Sat, 31 Jan 2026 09:48:42 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 31 Jan 2026 09:48:41 +0800
Message-ID: <be50aec4-336b-5bb3-e8dc-7f5cd12b43d2@huawei.com>
Date: Sat, 31 Jan 2026 09:48:40 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v11 13/14] entry: Inline syscall_exit_work() and
 syscall_trace_enter()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <oleg@redhat.com>, <peterz@infradead.org>,
	<luto@kernel.org>, <shuah@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<kevin.brodsky@arm.com>, <deller@gmx.de>, <akpm@linux-foundation.org>,
	<charlie@rivosinc.com>, <ldv@strace.io>, <mark.rutland@arm.com>,
	<anshuman.khandual@arm.com>, <song@kernel.org>, <ryan.roberts@arm.com>,
	<thuth@redhat.com>, <ada.coupriediaz@arm.com>, <broonie@kernel.org>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>, <kmal@cock.li>,
	<dvyukov@google.com>, <reddybalavignesh9979@gmail.com>,
	<richard.weiyang@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-14-ruanjinjie@huawei.com> <87qzr7l858.ffs@tglx>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87qzr7l858.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2026/1/30 18:14, Thomas Gleixner wrote:
> On Wed, Jan 28 2026 at 11:19, Jinjie Ruan wrote:
>> After switch arm64 to Generic Entry, a new hotspot syscall_exit_work()
>> appeared because syscall_exit_work() is not inlined, so inline
>> syscall_exit_work(). Also inline syscall_trace_enter() to align with
>> syscall_exit_work().
> 
> Has the same collision problem. I can pick that up and massage it on top
> of the pending time slice changes. Let me give it a test ride on x86...

Thank you very much, hopefully we'll see similar good results there too.

> 
