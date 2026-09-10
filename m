Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B99361969;
	Thu, 10 Sep 2026 01:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003054; cv=none; b=aGTuVRE0ZOc65xQh1NPXjZvNBvy4P1h2LxjvmzC6qXb1rm5It6FV4sdnF+bWoxny7qZWiQ6GqvjmkO5385Ry+xLXsuCNrQ1kZugKRtdNgG2YV2IJyYQZ1bocPGq5GgPv2NtlD8X0al/pkNiDnDbIpLP/9vcWq0mQUuPMrCgmSWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003054; c=relaxed/simple;
	bh=RoDaDkiHMdrBkp1/V00edGpp+g5AFntVm0K4p6AB31w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zm7e2mluYvF1b9xB3L3O5Yyb1G8rGIucttzG7+2k0xtMLsjWeyuHu0Y5iBvS/+CUqj1ENEj2z6tidVaULYonUTqNDz5qzKXd4GQEorqfIP+W20B5TeRHfymsATD4HXNMMz47jTUSt5nrgRYtl4ZeV7Vs3iIJtZ8deCpgHC8ghz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=p6733vXn; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="p6733vXn"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789003042; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=2IVJH8MPwJAkeuj2dMMiZHrS4p/p8L2+EkoUpA5hPNI=;
	b=p6733vXnaxnNV/DL+umHCEwzQM1WfBhHAB8HYwIsgMMztIuNm5L4cn+fVr9gRC8FwmwGoEPjgB39rY/mxAIWhdM33kqMVksIuyG0X/Qjx/XP8wineZat3xYAw/PyRIN+/Bhp8u3S6TdnQIx59o2w1qRVXePcNwL6LBqVLoD4HsA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R351e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XAg1fiJ_1789003039;
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAg1fiJ_1789003039 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 10 Sep 2026 09:17:20 +0800
Message-ID: <d65b4d23-b9d4-405e-84f5-a814fc984ebd@linux.alibaba.com>
Date: Thu, 10 Sep 2026 09:17:19 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/19] selftests/mm: add khugepaged completion barrier
 helper
To: Kiryl Shutsemau <kirill@shutemov.name>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, rppt@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, usama.anjum@arm.com, usama.arif@linux.dev,
 nico.pache@linux.dev, ziy@nvidia.com, baohua@kernel.org, dev.jain@arm.com,
 hughd@google.com, lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com,
 ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com,
 vbabka@kernel.org, agordeev@linux.ibm.com, jgg@ziepe.ca, leon@kernel.org,
 kernel-team@meta.com, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
References: <20260908125105.1510704-1-kirill@shutemov.name>
 <20260908125105.1510704-11-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260908125105.1510704-11-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> A khugepaged test has to tell "not collapsed" from "not scanned yet", and
> nothing in the selftests can.  wait_for_scan() in khugepaged.c comes
> closest: it polls full_scans until the counter has advanced by two, since
> the pass in progress may already have passed the test's mm.  But it only
> returns in time if scan_sleep_millisecs happens to be short, and it is
> private to that one test.
> 
> Add khugepaged_full_pass() to hugepage_settings, built on the same
> advance-by-two wait but driven through sysfs: a store to
> scan_sleep_millisecs wakes the daemon, so the barrier completes whatever
> the scan cadence.  A store made while the daemon is scanning rather than
> sleeping is lost, so the helper keeps storing until the pass lands.
> 
> One wake completes one pass only if pages_to_scan covers every mm on the
> list, so callers need it large.
> 
> Settings pushes must not start passes of their own.  A store to either
> sleep knob wakes the daemon, so thp_write_settings() now writes a
> khugepaged knob only when its value changes.
> 
> Assisted-by: LLM
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

Make sense to me.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
