Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F81E38229C;
	Mon, 25 May 2026 18:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779735085; cv=none; b=PZAYhTqmMyhVnbhusV7mXLCGni/bnW/Z9nmR9Kmc3fx9/H2t8x9U2NI2f5VZ9MBVd5sKZbEJqnyg9jHHpC4u12NpWJERJx1D8YwNlZhTUpinN3n/I4sS9HOjoWE1no4RFYX174El0/tIkt66SipE6QWQVhmCaiF/OwUECmqT9hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779735085; c=relaxed/simple;
	bh=uFCFP6D9UvnulftDxE4NPjGFoDUN6dqmh0dCMtRMozU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8d5gHy/zNSAvJDubZ/Wp6kQkRr9cnn02VcjmRcaD2ac9Qy4xb/IXD/SSBd8buqsM8KOCVTFOwIdHdvezLc9+A6v3UMSzttqMYWUbxPsvvcZ0WDfo+NjPzuHbrYjSgqteC9J5RMWTyQTq0VM0zDZi0xIfq3vFITXeAfrn+d/lZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=XCl4/gba; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="XCl4/gba"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SzvjpocKn+Bw0W1auvOZf4J3c/SOniG1j3Yx5uS5URU=; b=XCl4/gba9UqCiciWGg6tFqPC4L
	77EZD1lyAKivZntMovFtr5CIjf5T79ipp5JOoYJLyL/zQG1nE1KokCemsgiEVfQ/59ENnu0eD/vED
	dkzMU3psiJ47u1uLvFooS63vU71b/5otVcpcV6y1zGEd94NHDm/EB7SS+uEWZ7CQMlKeXTvpmcgiH
	SE/6FYkzVEYyltHS3gzAvCduugAHtCJib+QsW/qnRgMcxLgdKja4Jx6LBiYQUyxl2lX1xq5SX98l8
	XzyRW3myHxb2KE6kJLJh/FuefgVPGY7jVRj4IlVg8z2LedDoGv/IEeScBuTjgvklm7DcgfPZ+cSdl
	l777ubpg==;
Received: from [179.118.191.12] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wRaOR-0087qK-C0; Mon, 25 May 2026 20:51:15 +0200
Message-ID: <5ae41797-83ef-4896-b67f-0ec6f957de67@igalia.com>
Date: Mon, 25 May 2026 15:51:09 -0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] selftests/futex: Migrate futex_wait to harness
To: Wake Liu <wakel@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 linux-kselftest@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Davidlohr Bueso <dave@stgolabs.net>, Carlos Llamas <cmllamas@google.com>,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com
References: <20260525092002.3762888-1-wakel@google.com>
 <20260525092002.3762888-2-wakel@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20260525092002.3762888-2-wakel@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Em 25/05/2026 06:20, Wake Liu escreveu:
> Migrate futex_wait test to the kselftest harness framework,
> removing mixed legacy ksft_* API usages and ensuring proper thread joining.
> 

Why is this patchset not part of the same series that you just sent?

> Signed-off-by: Wake Liu <wakel@google.com>
> ---
>   .../selftests/futex/functional/futex_wait.c   | 125 +++++++++++-------
>   1 file changed, 77 insertions(+), 48 deletions(-)
> 
> diff --git a/tools/testing/selftests/futex/functional/futex_wait.c b/tools/testing/selftests/futex/functional/futex_wait.c
> index 7b8879409007..ed4b040600b8 100644
> --- a/tools/testing/selftests/futex/functional/futex_wait.c
> +++ b/tools/testing/selftests/futex/functional/futex_wait.c
> @@ -9,6 +9,7 @@
>   #include <sys/shm.h>
>   #include <sys/mman.h>
>   #include <fcntl.h>
> +#include <stdlib.h>
>   
>   #include "futextest.h"
>   #include "kselftest_harness.h"
> @@ -19,125 +20,153 @@
>   
>   void *futex;
>   
> +struct waiter_args {
> +	struct __test_metadata *_metadata;
> +	unsigned int flags;
> +};
> +
>   static void *waiterfn(void *arg)
>   {
> +	struct waiter_args *args = (struct waiter_args *)arg;
> +	struct __test_metadata *_metadata = args->_metadata;

As much as I like the benefits of being able to properly use the harness 
macros in threads, I fell like we are touching private structs here. Are 
they safe to be used concurrently? If a child thread an the main thread 
fails, does that counts as two fails?

Perhaps we should have a look to create a kselftest wrapper for 
pthread_create().

>   	struct timespec to;
> -	unsigned int flags = 0;
> -
> -	if (arg)
> -		flags = *((unsigned int *) arg);
> +	int res;
>   
>   	to.tv_sec = 0;
>   	to.tv_nsec = timeout_ns;
>   
> -	if (futex_wait(futex, 0, &to, flags))
> -		printf("waiter failed errno %d\n", errno);
> +	res = futex_wait(futex, 0, &to, args->flags);
> +	if (res) {
> +		EXPECT_EQ(res, 0)

I have changed it to ASSERT_EQ(res, -1) just to see what happens when a 
child thread fails, but the test still reported PASSED: 3 / 3
