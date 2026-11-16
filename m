Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827244;
	b=XFPmOZFGy5eivW+NsNX0621c/SVKv/RjL783UWCOZo7btJzFrYwkrv14ID17j21AV1RE
	 uCFifCAEsEeJF4B0nfycYATx9ecHtCoI0k7gXVWfjjV2n5XRXQ1brBep/6dyHEPl0Unjl
	 Eq+boyvsA3n71/mUWSssV6/eT8yVur/HHrGrfq5trBF0vjwMfPoQr6vCKpK7jS7ysYOHd
	 JWbh7YJSNdstnh55/j9tjhA2ly5YwAT8gjyeu/xUrxEw33I2Qji8rZkIpNrsAGrav+ZUx
	 bD/prt3Sz+dANplNxzZzG+PQMUzPQyRf+j79z3+55V3Njr3dJIyemFVCzzen3zH7ZYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827244;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=13xqPWlH07Y9JkbX/hcL6Kr6C2rxu8D/5ewtdLHHCKo=;
	b=RkeDVnoN5BNQ/LB2pVG0+KQOUd5A4oAtDPSQqvkDK70N/+GSp81KUIezY/wAikBPEohI
	 494gl30S8kzgamlM/XsIOi5YvKInDhuC26Ronzuj4BKohW4j1Q58clPI0Ad3qp4QtIDvR
	 PYa28uBE6PppJIKeG1izN9NO22VHp0CSnxMpc2fbF3ckag7CP1tqEyyoOOchlKgJbOpaa
	 VIZGiP9CCQtR/YLbHPV7MbKYWTht55Z50e6Z/jNfPADk3RrsdyeeTotT7sGl1f7aMsND4
	 5f6T3z8j7yt/rNbFoPSv6BIxDwRsTO7CiGCzes84fwrw6ycr05ZvxoNJMXvdycoOYvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZRnoKWmD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497586071B3A;
	Mon, 16 Nov 2026 11:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZRnoKWmD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05671F000C6;
	Mon, 16 Nov 2026 11:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794827243;
	bh=13xqPWlH07Y9JkbX/hcL6Kr6C2rxu8D/5ewtdLHHCKo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZRnoKWmD34qhtWhjsgZ/TXVIblU1MDa4qdX4K2Sfmv9lnoDYKtD0oJCWme50oAeRs
	 7CsrZd59yru20fRlLQoY62hbky8hHK90YMEfl+hIeOsQ0nd44dGreK5PFHHSkJKXjN
	 7+NBaiA/wWAcxli+lOCtqmjIyxqLpHFmao44tS6InBbXvFLcGnD04df06lWrzhTbBI
	 6qhyy8fASw9tx6Un2Z5sji500GGYwl9s9QN/RYuxrAUpm25t7L+iUiFujYx0Yl3eH0
	 Ju6FvV8FrCWeKly+s8ssqQbFALHW9OtASr7/i2bAzUMywo+W1UgZ9dACMrD4x5MaAH
	 hIdK6tuMtb3OQ==
Message-ID: <b2abcfcd-2d89-44a3-ac03-7354c3be2436@kernel.org>
Date: Mon, 16 Nov 2026 12:07:18 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/powerpc: Fix set-but-not-used errors with GCC
 v16.2
To: Thomas Huth <thuth@redhat.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Shuah Khan <shuah@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Segher Boessenkool <segher@kernel.crashing.org>
References: <20261116103710.674746-1-thuth@redhat.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20261116103710.674746-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 16/11/2026 à 11:37, Thomas Huth a écrit :
> When compiling the powerpc selftests with GCC v16.2, the compilation
> fails with:
> 
>   ../pmu/lib.c: In function ‘eat_cpu_child’:
>   ../pmu/lib.c:86:22: error: variable ‘i’ set but not used [-Werror=unused-but-set-variable=]
>      86 |         volatile int i = 0;
>         |                      ^
> 
> and:
> 
>   ebb.c: In function ‘ebb_child’:
>   ebb.c:352:18: error: variable ‘val’ set but not used [-Werror=unused-but-set-variable=]
>     352 |         uint64_t val;
>         |                  ^~~
>   cc1: all warnings being treated as errors
> 
> Add some "asm volatile" statements here to make to mark the variables
> as used and to avoid that the compiler might optimize the code away.

This looks really uggly, a cleaner way is likely possible, see below

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tools/testing/selftests/powerpc/pmu/ebb/ebb.c | 1 +
>   tools/testing/selftests/powerpc/pmu/lib.c     | 5 ++++-
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c b/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
> index 21537d6eb6b7d..f4ef92bacd9ab 100644
> --- a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
> +++ b/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
> @@ -391,6 +391,7 @@ int ebb_child(union pipe read_pipe, union pipe write_pipe)
>   		val  = mfspr(SPRN_MMCRA);
>   		val |= mfspr(SPRN_MMCR2);
>   		val |= mfspr(SPRN_MMCR0);
> +		asm volatile("" :: "r"(val) : "memory");

If val is not used, why not just do:

		mfspr(SPRN_MMCRA);
		mfspr(SPRN_MMCR2);
		mfspr(SPRN_MMCR0);

mfspr() is already an 'asm volatile' so it will be executed even if the 
result is not used.

>   	}
>   
>   	ebb_global_disable();
> diff --git a/tools/testing/selftests/powerpc/pmu/lib.c b/tools/testing/selftests/powerpc/pmu/lib.c
> index 3213579874084..32cafd40d2c56 100644
> --- a/tools/testing/selftests/powerpc/pmu/lib.c
> +++ b/tools/testing/selftests/powerpc/pmu/lib.c
> @@ -95,7 +95,10 @@ static int eat_cpu_child(union pipe read_pipe, union pipe write_pipe)
>   	wait_for_parent(read_pipe);
>   
>   	/* Soak up cpu forever */
> -	while (1) i++;
> +	while (1) {
> +		i++;
> +		asm volatile("" :: "r"(i) : "memory");
> +	}

If 'i' is not used, why keep it ?

Just do

	while (1)
		;

or

	for (;;)
		;


>   
>   	return 0;
>   }

Christophe

