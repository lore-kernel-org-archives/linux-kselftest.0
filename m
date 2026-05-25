Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9231E7C18;
	Mon, 25 May 2026 18:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779734296; cv=none; b=U3FxLZ6FpjpK2eXATnSHCW0cTTWl/nPpAgvKTAx4sRIQBR0ZLa9GSNwKRffeSF2c+CvbfmcBTsttWgWIKWH8OATFU8uxE+qufB3B9txpidVVq7I8rGdO1lr3bkkyv8Y0YZtwWESi7L/WEiXs8msATG5J2Mt77AJ+cfhlWOLXvCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779734296; c=relaxed/simple;
	bh=EUovOhk55MKPyhFkMWdyQ8tsmgmYIjaoag4+03FUVzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USDsfd7+saEyq4k3GKOVrDsPa4SHWAhKZ/MshXSwjlullGMXugTedIox8HxcmprD06EJz75P3iKjS+30u/o/2/Bo94/pKRBQ++sK2l3iMrxVW/ybr+B/PgjIrxwkLdaBZaAHZYksqnrv9TSseHKwOY6DclsXXQ89oJ5UQqio8S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=e+TKhnTG; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="e+TKhnTG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0Ont71X727MAFCH1/DO4EfRgVgHYQAxDNqVPWEFex5I=; b=e+TKhnTGQrttzMsbkzaMzAVJ2P
	QDTY7+BpcrrHf8mNexwtkbormb6LZ72WqlT5ExuNKDY1HWEXRQXAznvaUbaFT4xffwncOKKeTVA8a
	p9GVmtr4VFYxddcc/1MdZUX8SLYWQO7T2DH3nR5LIYl7a0vQajADAN0TIYezmjByoz/cPEb11DHSK
	gM1fYVLkhljcWcqzlh3lH046dPZxzhhf6GtSpyzDXhvSwuHgPufTa1NC1mIQpqHEeYgeYOF8HODVz
	Msjq7dveVZsSSnyiuYIUWrpYbmDO23dmzk12OwgdzohB9qhseG9UTyx780c8DS22fXcHfWhz89TdO
	Z585vUcg==;
Received: from [179.118.191.12] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wRaBX-0087cK-Qm; Mon, 25 May 2026 20:37:56 +0200
Message-ID: <11eaf534-f90a-4eda-a3be-3a78bf1c6af2@igalia.com>
Date: Mon, 25 May 2026 15:37:49 -0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] selftests/futex: Migrate functional tests to harness
To: Wake Liu <wakel@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, linux-kselftest@vger.kernel.org,
 Davidlohr Bueso <dave@stgolabs.net>, Carlos Llamas <cmllamas@google.com>,
 Edward Liaw <edliaw@google.com>, linux-kernel@vger.kernel.org
References: <20260525075748.3720995-1-wakel@google.com>
 <20260525075748.3720995-2-wakel@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20260525075748.3720995-2-wakel@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Wake,

Thanks for the help fixing my mix of kselftest_harness and ksft_() :)

Em 25/05/2026 04:57, Wake Liu escreveu:
> Currently, multiple futex functional tests (wait_timeout, waitv,
> wait_wouldblock) mix low-level ksft_* logging and result APIs with
> the kselftest_harness.h framework. On older kernels where system calls
> like futex_waitv are missing (returning -ENOSYS), this mixed usage
> triggers framework inconsistencies, causing the test to fail with:
> "Illegal usage of low-level ksft APIs in harness test".
> 
> Address this by completely refactoring these tests to exclusively use
> the high-level kselftest_harness.h framework (gtest-like API), mapping
> all low-level calls to native harness macros:
> - Non-fatal assertions: Replace ksft_test_result_fail() with EXPECT_EQ()
>    and EXPECT_NE().
> - Fatal assertions: Replace ksft_exit_fail_msg() with ASSERT_EQ() and
>    ASSERT_TRUE() to immediately terminate execution upon setup failure.
> - Test skipping: Replace ksft_exit_skip() with the graceful SKIP() macro
>    combined with early runtime availability checks for sys_futex_waitv.
> - Debug logging: Replace ksft_print_dbg_msg() with TH_LOG() to inherit
>    automatic file/line context.
> - Success reporting: Remove explicit ksft_test_result_pass() calls,
>    deferring to automated harness completion reporting.
> 
> Additionally:
> - Fix a critical SIGSEGV crash in early syscall probing logic caused by
>    passing a NULL pointer to inline user-space timespec conversions.
> - Introduce TEST_TIMEOUT() and GET_ABS_TIMEOUT() macros in wait_timeout
>    to encapsulate assertions while preserving source line attribution.
> - Pass test metadata (_metadata) into secondary threads to allow native
>    harness assertions during concurrent execution.
> 
> Signed-off-by: Wake Liu <wakel@google.com>
> ---
>   .../futex/functional/futex_wait_timeout.c     | 101 +++++++----------
>   .../futex/functional/futex_wait_wouldblock.c  |  40 ++++---
>   .../selftests/futex/functional/futex_waitv.c  | 107 +++++++++---------
>   3 files changed, 118 insertions(+), 130 deletions(-)
> 
> diff --git a/tools/testing/selftests/futex/functional/futex_wait_timeout.c b/tools/testing/selftests/futex/functional/futex_wait_timeout.c
> index 674dd13af421..89d6a7daeda4 100644
> --- a/tools/testing/selftests/futex/functional/futex_wait_timeout.c
> +++ b/tools/testing/selftests/futex/functional/futex_wait_timeout.c

[...]

> -}
> +#define TEST_TIMEOUT(_res, _test_name, _err) do { \
> +	if ((_res) < 0 && errno == ENOSYS && (_err) != ENOSYS) { \
> +		SKIP(return, "%s is not supported (ENOSYS)", _test_name); \
> +	} \
> +	EXPECT_EQ((_res), -1) \
> +		TH_LOG("%s returned unexpected result: %d", _test_name, (_res)); \
> +	if ((_res) == -1) { \
> +		EXPECT_EQ(errno, (_err)) \
> +			TH_LOG("%s returned unexpected errno: %d (expected %d)", \
> +			       _test_name, errno, (_err)); \
> +	} \
> +} while (0)

Perhaps we should always check for ETIMEDOUT and threat the only time we 
check for ENOSYS here as a special case. But no strong preference.

[...]

>   
>   TEST(waitv)
> @@ -172,16 +157,14 @@ TEST(waitv)
>   	int res;
>   

For the other futex_waitv tests you call is_futex_waitv_supported(), why 
don't you call for this one as well?

>   	/* futex_waitv with CLOCK_MONOTONIC */
> -	if (futex_get_abs_timeout(CLOCK_MONOTONIC, &to, timeout_ns))
> -		ksft_test_result_error("get_time error");
> +	GET_ABS_TIMEOUT(CLOCK_MONOTONIC, &to, timeout_ns);
>   	res = futex_waitv(&waitv, 1, 0, &to, CLOCK_MONOTONIC);
> -	test_timeout(res, "futex_waitv monotonic", ETIMEDOUT);
> +	TEST_TIMEOUT(res, "futex_waitv monotonic", ETIMEDOUT);
>   
>   	/* futex_waitv with CLOCK_REALTIME */
> -	if (futex_get_abs_timeout(CLOCK_REALTIME, &to, timeout_ns))
> -		ksft_test_result_error("get_time error");
> +	GET_ABS_TIMEOUT(CLOCK_REALTIME, &to, timeout_ns);
>   	res = futex_waitv(&waitv, 1, 0, &to, CLOCK_REALTIME);
> -	test_timeout(res, "futex_waitv realtime", ETIMEDOUT);
> +	TEST_TIMEOUT(res, "futex_waitv realtime", ETIMEDOUT);
>   }
>   
>   TEST_HARNESS_MAIN
> diff --git a/tools/testing/selftests/futex/functional/futex_wait_wouldblock.c b/tools/testing/selftests/futex/functional/futex_wait_wouldblock.c
> index 9ff936ecf164..4fd517404f1f 100644
> --- a/tools/testing/selftests/futex/functional/futex_wait_wouldblock.c
> +++ b/tools/testing/selftests/futex/functional/futex_wait_wouldblock.c
> @@ -28,21 +28,26 @@
>   
>   #define timeout_ns 100000
>   
> +static bool is_futex_waitv_supported(void)
> +{
> +	struct timespec ts = {0, 0};
> +	int res = futex_waitv(NULL, 0, 0, &ts, CLOCK_MONOTONIC);
> +
> +	return !(res < 0 && errno == ENOSYS);
> +}
> +

[...]

> +static bool is_futex_waitv_supported(void)
> +{
> +	struct timespec ts = {0, 0};
> +	int res = futex_waitv(NULL, 0, 0, &ts, CLOCK_MONOTONIC);
> +
> +	return !(res < 0 && errno == ENOSYS);
> +}

If you want to have this function in two tests, why don't you add it to 
include/futex2test.h?

Also, even if not super common, we keep adding new futex features (like 
syscall(__NR_futex_{wait, wake}), maybe there could be a more generic 
function to skip tests if a given syscall, op or flag is not available?

	André
