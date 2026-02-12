Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EAC035CBA9;
	Thu, 12 Feb 2026 17:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770915847; cv=none; b=g03O6thNq3zz6Y0KDWNoBT4kmatLYPO7Rh3T0AKs2qVPNud0WYw2CLR+JAhvELlXN/VQBmbIiFx/DNF33RXKdvgOlxPXy+DqQKKEbRF0816fJt5uPyDygLYUnZiT33Oi1rhstZFKLa1wgR9GNbEzX/ja9ZWfTROIZABzPJcYK1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770915847; c=relaxed/simple;
	bh=d6IspwNShmSCe5WX/VNjAB7yyfiN0dvMlkK6PcfVcfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PIPyrTXkIFVV6n1QdIGohKctDs+E7j9deJpOjnePTnWLJRGJBrqnX5jdcIF/r63IaQVDFJPHi0PM/mTiBiAzyaOfQmyMxx11RAT4NfYJsBZDAPuR4SR0Dlpkt7+A8l0f3rVcZL9IxIkueboL66pZRVhYv9Zt/R8xqLQ78pqx+zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 339A1339;
	Thu, 12 Feb 2026 09:03:58 -0800 (PST)
Received: from [10.163.135.73] (unknown [10.163.135.73])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C8A93F632;
	Thu, 12 Feb 2026 09:03:59 -0800 (PST)
Message-ID: <a354dfb9-a125-45cc-8937-84513b296274@arm.com>
Date: Thu, 12 Feb 2026 22:33:56 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: Remove duplicate include of unistd.h
To: Chen Ni <nichen@iscas.ac.cn>, akpm@linux-foundation.org, shuah@kernel.org
Cc: linmiaohe@huawei.com, nao.horiguchi@gmail.com, david@kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260211064311.2981726-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260211064311.2981726-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/02/26 12:13 pm, Chen Ni wrote:
> Remove duplicate inclusion of unistd.h in memory-failure.c to clean up
> redundant code.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---

Reviewed-by: Dev Jain <dev.jain@arm.com>

>  tools/testing/selftests/mm/memory-failure.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/tools/testing/selftests/mm/memory-failure.c b/tools/testing/selftests/mm/memory-failure.c
> index 3d9e0b9ffb41..032ed952057c 100644
> --- a/tools/testing/selftests/mm/memory-failure.c
> +++ b/tools/testing/selftests/mm/memory-failure.c
> @@ -13,7 +13,6 @@
>  #include <unistd.h>
>  #include <signal.h>
>  #include <setjmp.h>
> -#include <unistd.h>
>  #include <fcntl.h>
>  #include <sys/vfs.h>
>  #include <linux/magic.h>
