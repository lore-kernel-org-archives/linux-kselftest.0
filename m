Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DCC3F86E1;
	Mon, 19 Oct 2026 05:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386806; cv=none; b=mkHKxaH0x77fnzYuFinsqcXV3B6v1exDWLtetu+VVeip53TPMFvoZy5MCi0Qol831q6g0Qcgat851+rWADpgN5bWjBGBTZ92eq2WqtDw9FPjv+VkCn0EnvBx69XjUd0gWnNs4GxSjBBTZe4DrhnsSVq7HsaXlDzAjl5/lSYrAMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386806; c=relaxed/simple;
	bh=/cZAu8TZP4F38PHdEa60qvWPo9zmofCHFWZ65uJo+CM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y531St6+e91cV/wnO9veQSqqukHA23B0KKG3YsTo/JbhVgh6qeiPWk7wtVR9EzlXLAf7A44QIGmT5hQDc2OQtUT2d+NGsJG7Z13/kYz3nDQBk6K8A74/izLQdLy7TF9ZU8P9VuKyhnJr0kzs//VmQbCE8J81NnJu6KzXzNCwiZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sgeAvZuB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="sgeAvZuB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02B3E1476;
	Sun, 18 Oct 2026 22:13:18 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 469C33F7B4;
	Sun, 18 Oct 2026 22:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792386801; bh=/cZAu8TZP4F38PHdEa60qvWPo9zmofCHFWZ65uJo+CM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sgeAvZuB1W6o1SdRy9zYA7GJMhndI73Mrx1OMrKc6iaKtu+wVbV9Et6vqsUoL4Ei2
	 AlUw7uMs0dDHZIdIf/qR4ykATw7Uhw9c56n8TDd7wKgyWoGwhTy0njvoz+x1s9NB8X
	 vCST7KDRrGfaVAbHWEVbXIK7ptDuUgFZlv3Csl/g=
Message-ID: <d67a7c38-5f35-47db-8ddd-e84e01f63388@arm.com>
Date: Mon, 19 Oct 2026 10:43:14 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] selftests/mm: check that MADV_COLD and MADV_PAGEOUT
 preserve shared memory
To: "Gregory Price (Meta)" <gourry@gourry.net>,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org
References: <20261014175756.2035176-1-gourry@gourry.net>
 <20261014175756.2035176-6-gourry@gourry.net>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20261014175756.2035176-6-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/14/26 11:27 PM, Gregory Price (Meta) wrote:
> Both hints are non-destructive, but the tests so far only check that for
> private anonymous memory. Shared memory reaches reclaim through different
> paths: a dirty shared file page must be written back or left resident,
> shared anonymous memory is paged out through shmem, and a SHM_LOCK'd
> segment is unevictable without its VMA being VM_LOCKED.
> 
> Check that MADV_COLD and MADV_PAGEOUT preserve a dirty shared file page,
> that MADV_PAGEOUT preserves a shared anonymous page, and that it leaves a
> SHM_LOCK'd page resident. The SHM_LOCK test needs root to confirm through
> /proc/kpageflags that the page is unevictable, and skips if it is not.
> 
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
>  tools/testing/selftests/mm/madvise.c | 138 +++++++++++++++++++++++++++
>  tools/testing/selftests/mm/vm_util.h |   1 +
>  2 files changed, 139 insertions(+)
LGTM

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
