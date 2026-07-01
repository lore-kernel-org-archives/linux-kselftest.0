Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999DD3EDE5F;
	Wed,  1 Jul 2026 08:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895773; cv=none; b=gZwpEqMoB55AYV1NMKE6GdJWrV5HEJlD+Md4PGt6c2OaRW97AUt921vh48oyIJx2vmDBjq8FlpHG2BUO58vmmZ+l24SYufw2gsFd+iW7lZN5s4pidYrZnDbbQ70Ck5r5jpzc2bzDJ7/ma021Bn00fcwFFY0YJhr6t/6XwxdHsMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895773; c=relaxed/simple;
	bh=uKjX69FEmz1w+EK9hRvmD936xbp9gVpWmS3vnjZ565I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LJ0BD7dolbxc93lcQKNeJl6VS5tTuBohOEgHH8hSJl9yCbWOjVs8fnNzw7I4CrGEdbx94LJB94umCT31vJn1aL1GknmWJzvvIcuIxoTmbZght0GLQxnCMEuwKeWBa3JM/WzuylMSfxdHIFcizU8Xv3jXZ5RylpMMqTyMKXQrJHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DtVstI2T; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DtVstI2T"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6A01339;
	Wed,  1 Jul 2026 01:49:26 -0700 (PDT)
Received: from [10.57.81.2] (unknown [10.57.81.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B30143F85F;
	Wed,  1 Jul 2026 01:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782895771; bh=uKjX69FEmz1w+EK9hRvmD936xbp9gVpWmS3vnjZ565I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DtVstI2TRlmEUurH4pBHky6MZtD1mgK2ngKEqVRi2venXIQw9HTyy+4XTDApXMkDh
	 Ayo/h3CzdRJ+SmlGkIQ0CuX3dsViWNTK7UPsyAxeYu+aeFttpyzTuvjUyjjEayIn+0
	 uC98ygLo4Q/14tR4NtmLvp3JnPwp6hpMeZy+SPlU=
Message-ID: <2572cfd5-70c0-41d6-819a-0b2f37e6289c@arm.com>
Date: Wed, 1 Jul 2026 10:49:20 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] selftests/mm: add missing pthread_create() return
 checks in pkey tests
To: Hongfu Li <lihongfu@kylinos.cn>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, keith.lucas@oracle.com, maddy@linux.ibm.com,
 usama.anjum@collabora.com, yury.khrustalev@arm.com, jhubbard@nvidia.com,
 joey.gouly@arm.com, zwisler@google.com, hongfu.li@linux.dev
References: <20260630073235.3802271-1-lihongfu@kylinos.cn>
 <20260630073235.3802271-6-lihongfu@kylinos.cn>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260630073235.3802271-6-lihongfu@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/06/2026 09:32, Hongfu Li wrote:
> Add missing pthread_create() return checks in pkey sighandler tests
> to avoid hanging in pthread_cond_wait() when thread creation fails.
>
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

> ---
>  tools/testing/selftests/mm/pkey_sighandler_tests.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> index d185d3da26cf..f30c9965a561 100644
> --- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
> +++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> @@ -224,7 +224,8 @@ static void test_sigsegv_handler_with_pkey0_disabled(void)
>  	pthread_attr_init(&attr);
>  	pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
>  
> -	pthread_create(&thr, &attr, thread_segv_with_pkey0_disabled, NULL);
> +	ret = pthread_create(&thr, &attr, thread_segv_with_pkey0_disabled, NULL);
> +	pkey_assert(ret == 0);
>  
>  	pthread_mutex_lock(&mutex);
>  	while (siginfo.si_signo == 0)
> @@ -263,7 +264,8 @@ static void test_sigsegv_handler_cannot_access_stack(void)
>  	pthread_attr_init(&attr);
>  	pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
>  
> -	pthread_create(&thr, &attr, thread_segv_pkuerr_stack, NULL);
> +	ret = pthread_create(&thr, &attr, thread_segv_pkuerr_stack, NULL);
> +	pkey_assert(ret == 0);
>  
>  	pthread_mutex_lock(&mutex);
>  	while (siginfo.si_signo == 0)
