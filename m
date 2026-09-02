Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF6C305667;
	Wed,  2 Sep 2026 13:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355757; cv=none; b=peMIwLs2ZtF8c4Kz0LVeE6ks7+3/T4x4Rggt8pbLxIWQ/0BB285JQuwQp4Aaor5jfXKbUprxo/VV2z2hJAVysI80DLWMYggtOmzJFIGd4UskTWPhvBsAybJfMdAMGkJ+UcZ6Zfq9HEpYHxLJnW15CfxCXnu29XORJf7Vpm3GXsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355757; c=relaxed/simple;
	bh=1Kg8VeVvPIDG8OjLXhgVskjzW4whxSsl1We5uuEsfkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AMuw8dEveF8UpvrN3Fp4aVasVqdoBRP2upacvyauv/9jzVBtd1xtZ9BXWV0ul1Etc1oT0trC1hbkQ+b8/i/E5wNfpIs0Kn7KkMbRzPHnGkKM7vLO+OKnbpz+kHODffCgdTjuz1LkloDxDDdUDfBXg+bo1DbnqTLuXTWwOkOLufI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id CED742000FE; Wed,  2 Sep 2026 21:29:07 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id E655E2000C8;
	Wed,  2 Sep 2026 21:29:04 +0800 (AWST)
Message-ID: <18b60321-e3c1-4f8b-8963-b16d44b39e59@davidgow.net>
Date: Wed, 2 Sep 2026 21:29:02 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kunit: Return void from kunit_run_all_tests()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
References: <20260901-kunit-void-v1-1-c91952391d66@linutronix.de>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20260901-kunit-void-v1-1-c91952391d66@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 01/09/2026 à 17:50, Thomas Weißschuh a écrit :
> No caller tests the return value of this function.
> 
> The integer return type is still a remnant from when the function
> was executed as initcall. This usage however was removed in
> commit 8c0d884986ba ("init: main: add KUnit to kernel init")
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---

Nice catch, thanks.

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David

>   include/kunit/test.h | 5 ++---
>   lib/kunit/executor.c | 5 ++---
>   2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index da5312e0dfa5..31d549578f8e 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -400,11 +400,10 @@ struct kunit_suite_set kunit_merge_suite_sets(struct kunit_suite_set init_suite_
>   const void *kunit_array_gen_params(struct kunit *test, const void *prev, char *desc);
>   
>   #if IS_BUILTIN(CONFIG_KUNIT)
> -int kunit_run_all_tests(void);
> +void kunit_run_all_tests(void);
>   #else
> -static inline int kunit_run_all_tests(void)
> +static inline void kunit_run_all_tests(void)
>   {
> -	return 0;
>   }
>   #endif /* IS_BUILTIN(CONFIG_KUNIT) */
>   
> diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
> index b0f8a41d61d3..c798a02470d8 100644
> --- a/lib/kunit/executor.c
> +++ b/lib/kunit/executor.c
> @@ -371,7 +371,7 @@ static void kunit_handle_shutdown(void)
>   
>   }
>   
> -int kunit_run_all_tests(void)
> +void kunit_run_all_tests(void)
>   {
>   	struct kunit_suite_set suite_set = {NULL, NULL};
>   	struct kunit_suite_set filtered_suite_set = {NULL, NULL};
> @@ -382,7 +382,7 @@ int kunit_run_all_tests(void)
>   		__kunit_suites_start, __kunit_suites_end,
>   	};
>   	size_t init_num_suites = init_suite_set.end - init_suite_set.start;
> -	int err = 0;
> +	int err;
>   
>   	if (init_num_suites > 0) {
>   		suite_set = kunit_merge_suite_sets(init_suite_set, normal_suite_set);
> @@ -432,7 +432,6 @@ int kunit_run_all_tests(void)
>   
>   out:
>   	kunit_handle_shutdown();
> -	return err;
>   }
>   
>   #if IS_BUILTIN(CONFIG_KUNIT_TEST)
> 
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260109-kunit-void-b2f71f7e980c
> 
> Best regards,
> --
> Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> 

