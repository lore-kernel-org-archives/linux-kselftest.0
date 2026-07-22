Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65A0367B99;
	Wed, 22 Jul 2026 15:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784733656; cv=none; b=KmOL+Uth8CttduXbWPTxvDuif6w3qH3b1VMEfklZszD99aBWpYqpN+E6Klgcndk+t9ko3T11tUkQWM5TqeE56uIP7Mfj5x9JfpKkC7Gd0EiOA7ntWv/Nn1xkK1EXF4i9G1BI9RpUiAntd7WJO7EtwDIdvcejC7z3ofVlvUF+RSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784733656; c=relaxed/simple;
	bh=GKK2KYqIOdbzMEb8X0acR8iuFokRUiuGf4jjFCbprEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nbsJfDsYBa7sIyDD02RT1mToLnkXccWtOzmJAMcb6qyZB0egGVXcD85Npm/q2nodykNVKHEHiwjrjPhiipYI2K8qeN3p4YmGICRuCiJZIym/cFuH51KpkGE8yj+LBdFvmEI63FPjUbScjCzxoKFiyyWRCu00xUtShF7RGwwJkRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=AridpmG5; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="AridpmG5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=XrF1wHwWKNSlqS1s1h1T1Tz5CmDSLUpYdgk8B0kZhrQ=; b=AridpmG5U2N+0mRjvAWqW4UT8V
	qc8+OS5AjtH13ImoBoc/fnoH0tSiK/B/fIyKTmAgC4gnnBjF+BgsWUMbNKUabZ0f8z2jpGIosakIC
	ApdqCL9PJd+P8eRkWAuaAlPDaAQ8huQqQkOWExxp5QZfkxDnHzyPkKv2qzh11yNX+jCJlbype8ARE
	YUZeVGfBYevmcyjKuusnIEk7Q11FJBKisvQu3ZrxBeRszeEnezUhfgqz4eFChOMO0HR1ZemwCvldN
	P5/MLFwXFusHpK/0zwEhqIIRIzmEjiF8jGnhfcWbPFzWAyo0y2dfzWtJwp/dsimwJ2C5zG9kIVy2o
	2I9N7KVQ==;
Received: from [179.118.191.219] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wmYkV-0033Ia-1P; Wed, 22 Jul 2026 17:20:43 +0200
Message-ID: <dca6abef-0f6c-414d-b7b5-02e5b2a355e3@igalia.com>
Date: Wed, 22 Jul 2026 12:20:37 -0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: futex: Restore support checks for futex2 and
 priv_hash
To: Wake Liu <wakel@google.com>
Cc: cmllamas@google.com, tglx@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, peterz@infradead.org, dvhart@infradead.org,
 dave@stgolabs.net, shuah@kernel.org, mingo@redhat.com
References: <20260722070801.2057634-1-wakel@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20260722070801.2057634-1-wakel@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wake,

Em 22/07/2026 04:08, Wake Liu escreveu:
> Older kernels may not support FUTEX2 syscalls or PR_FUTEX_HASH.
> Removing these checks causes false failures when running the tests on
> such kernels. Restore the checks so the tests can be gracefully
> skipped when the features are not supported.
> 
> Signed-off-by: Wake Liu <wakel@google.com>
> ---
>   tools/testing/selftests/futex/functional/futex_numa_mpol.c | 2 ++
>   tools/testing/selftests/futex/functional/futex_priv_hash.c | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/futex/functional/futex_numa_mpol.c b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
> index 78c0f7a59e17..d215acf88120 100644
> --- a/tools/testing/selftests/futex/functional/futex_numa_mpol.c
> +++ b/tools/testing/selftests/futex/functional/futex_numa_mpol.c
> @@ -103,6 +103,8 @@ static void __test_futex(void *futex_ptr, int err_value, unsigned int futex_flag
>   			break;
>   		}
>   		if (ret < 0) {
> +			if (errno == ENOSYS || (errno == EINVAL && (futex_flags & FUTEX2_NUMA)))
> +				ksft_exit_skip("futex2 or FUTEX2_NUMA not supported by kernel\n");

Why aren't you using SKIP() instead of ksft_exit_skip() like how you 
have done at

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=locking/futex&id=50c121e5a57abe446e46825fb9c69ac419765d5c


>   			ksft_exit_fail_msg("Failed futex2_wake(%d, 0x%x): %m\n",
>   					   to_wake, futex_flags);
>   		}
> diff --git a/tools/testing/selftests/futex/functional/futex_priv_hash.c b/tools/testing/selftests/futex/functional/futex_priv_hash.c
> index e8079d7c65e8..27c3ea5ff3ed 100644
> --- a/tools/testing/selftests/futex/functional/futex_priv_hash.c
> +++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
> @@ -145,6 +145,8 @@ TEST(priv_hash)
>   	}
>   	/* First thread, expect to be 0, not yet initialized */
>   	ret = futex_hash_slots_get();
> +	if (ret < 0 && errno == EINVAL)
> +		ksft_exit_skip("PR_FUTEX_HASH not supported by kernel\n");
>   	if (ret != 0)
>   		ksft_exit_fail_msg("futex_hash_slots_get() failed: %d, %m\n", ret);
>   

