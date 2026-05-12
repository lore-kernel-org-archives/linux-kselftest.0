Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1544BCAC1;
	Tue, 12 May 2026 11:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778584407; cv=none; b=gZvbsWrvgGYtE5mUXH0M+X7smJr2fknqLW7xEY6sOCmJe8reons9tzapBECnyXf9ex/HKCoMG/wsHhhYmPtbOBOrIIGob53mt7ETYdu8vvUm+itdCYrUp/vm2Ct69tgwTAvexAfcd9Wq6D6zZ2/Iv1BByeGX01Zr5z6l3QUII1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778584407; c=relaxed/simple;
	bh=rBzh25T0xairjqFtgwirNaUtmwEFujCzK8ALPjS6dRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TIBn2ilnBOo7FmT3i4WjjUL9UYzLQvbtKps9steo8mgwA0DnE/T+vMgMCYPzXRnLv6dEGV5WbX6HyNmyWlMqNnMs75XYppPaXExPP2GpC6N6xjhA4Q10hnxhK67ESENAxvAd9qWIA9iAnJSqxCUW2TWjaNcv8QRsSVnUXOdVNvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gV7TN+Db; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gV7TN+Db"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26C6C1691;
	Tue, 12 May 2026 04:13:18 -0700 (PDT)
Received: from [10.164.148.42] (MacBook-Pro.blr.arm.com [10.164.148.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A1773F85F;
	Tue, 12 May 2026 04:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778584403; bh=rBzh25T0xairjqFtgwirNaUtmwEFujCzK8ALPjS6dRg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gV7TN+Dbz5tzaOrAbCMWHlB+ykfhxbyPEdM4wcjGYq+0I1X2m8RQcA7h/EnzXTodh
	 shob5b98AgeVYcZX7fZWcMf6PGfj7nb0xTIc/7Y+kJAluCLYK6muaymcTD0KUEIcvS
	 /vTSpdtMRdxyAQJQtmQ1brWsFwyRQPX10X+gxOYc=
Message-ID: <df87e6a4-b157-42c7-a596-cbdbd99806cd@arm.com>
Date: Tue, 12 May 2026 16:43:15 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: Fix mmap() return value check in
 run_migration_benchmark
To: Hongfu Li <lihongfu@kylinos.cn>, jgg@ziepe.ca, leon@kernel.org,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 shuah@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260512101305.139509-1-lihongfu@kylinos.cn>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260512101305.139509-1-lihongfu@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/05/26 3:43 pm, Hongfu Li wrote:
> mmap() returns MAP_FAILED on error, not NULL.  The current check uses
> !buffer->ptr, which evaluates to false when mmap() fails (since
> MAP_FAILED is (void *)-1, not 0), so the error path is never taken.
> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> ---

Reviewed-by: Dev Jain <dev.jain@arm.com>

>  tools/testing/selftests/mm/hmm-tests.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
> index 788689497e92..d72adba5c74e 100644
> --- a/tools/testing/selftests/mm/hmm-tests.c
> +++ b/tools/testing/selftests/mm/hmm-tests.c
> @@ -2688,7 +2688,7 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
>  	buffer->ptr = mmap(NULL, buffer_size, PROT_READ | PROT_WRITE,
>  			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>  
> -	if (!buffer->ptr)
> +	if (buffer->ptr == MAP_FAILED)
>  		return -1;
>  
>  	/* Apply THP hint if requested */

