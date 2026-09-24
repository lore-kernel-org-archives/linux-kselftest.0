Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49E740BCD8;
	Thu, 24 Sep 2026 08:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239225; cv=none; b=ceFdpp9BEruwfW5NzoROZWxWvgmugKW9cdynoUU2SnGl9jG2zWqhGbVdRHv+4NHSPv+dWNV3/2jneL8KcN5NV/K18m5a5joWYXuKjs6aLj+uK4L/kEK+HldLzgTF+MUUh8S6EyyGKgHfhQVj6ks2KOrNn45gveb5GxDNGRfL8mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239225; c=relaxed/simple;
	bh=MhBfAYuxvgKfiG3YkrVR2/wbxWCunlPFCUrfwTap79k=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hlcDcmj3OeEiz8HRwPZX9EapXN40+Tz3gR/j3XuMo8CZst+D+G6CdbZKo8f2VLpPOBkAiPNX2bUYwNq6OcM2WOLkliP6C1tX1Vxu3yElRESnPU3hTZwm54DKxbc450aC1J4RDtEF3zhWt7f/sli0AVReB7y4VmWf/OA4413VrXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=r/A95m+M; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="r/A95m+M"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A79981477;
	Thu, 24 Sep 2026 01:40:18 -0700 (PDT)
Received: from [10.2.198.93] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D4F73F86C;
	Thu, 24 Sep 2026 01:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790239222; bh=MhBfAYuxvgKfiG3YkrVR2/wbxWCunlPFCUrfwTap79k=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=r/A95m+M/2PSch11YrrKkRkpvkDpNeDFxsDCMV8LiDUIHv1D+AOIumnheUw/cUBRP
	 mFpGM4PgceSqap/xH+4GiKQuqqj9ko5jIuQ+JWpkwmkbxCoRZ8HqghM9lAbKS4W0mQ
	 jAJzJnuTRTN7mwjPWS5sSW5U7YJmX+bDORIT4Eos=
Message-ID: <f09d40e8-abec-4dcd-a1dd-00de203dfb07@arm.com>
Date: Thu, 24 Sep 2026 09:40:18 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Brendan Jackman <brendan.jackman@linux.dev>
Subject: Re: [PATCH] selftests/mm: fix mlock2 errno handling and false PASS on
 ENOSYS
To: Park Tae-sun <ts930@dgu.ac.kr>
References: <20260923-selftests-mm-mlock2-fix-v1-1-750b627854c6@dgu.ac.kr>
From: Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <20260923-selftests-mm-mlock2-fix-v1-1-750b627854c6@dgu.ac.kr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/09/2026 10:26 am, Park Tae-sun wrote:
> While inspecting selftests/mm syscall wrappers, I noticed that mlock2_()
> in mlock2.h handles the syscall return value differently from other
> wrappers:
> 
>     int ret = syscall(__NR_mlock2, start, len, flags);
>     if (ret) {
>         errno = ret;
>         return -1;
>     }
> 
> Commit 1ddae9d67ee1 ("selftests/mm/mlock: print error on failure")
> introduced this intending to make mlock2_() behave like libc by setting
> errno and returning -1. However, glibc syscall(2) already returns -1 on
> failure and sets positive errno. Assigning "errno = ret;" overwrites
> errno with -1.
> 
> To verify this, mlock2 was disabled in the kernel (via sys_ni_syscall) to
> return -ENOSYS. Testing revealed two interrelated defects:
> 
> 1. In the unmodified test, mlock2_() clobbered errno to -1. The check
>    "if (ret && errno == ENOSYS)" in main() was bypassed, resulting in an
>    immediate crash in the first test:
> 
>        ~ # ./mlock2-tests
>        TAP version 13
>        1..15
>        Bail out! mlock2(0): Unknown error -1
>        # Planned tests != run tests (15 != 0)
>        # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>        (exit code: 1 - FAIL)
> 
> 2. After restoring mlock2_() to directly return syscall(), errno correctly
>    retained ENOSYS (38), entering the ENOSYS check in main(). However, it
>    then called ksft_finished():
> 
>        ~ # ./mlock2-tests
>        TAP version 13
>        # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
>        ~ # echo $?
>        0
> 
>    Because ksft_set_plan() had not been called yet (ksft_plan == 0) and
>    zero tests ran (ksft_pass == 0), ksft_finished() evaluated 0 == 0 as
>    success and exited with KSFT_PASS (code 0) without any TAP skip header.
> 
> Fix both issues by:
> 1. Returning the syscall() result directly in mlock2_() so that errno is
>    preserved.
> 2. Calling ksft_exit_skip() on ENOSYS so unsupported kernels report a TAP
>    skip ("1..0 # SKIP ...") and exit with KSFT_SKIP (code 4).
> 
> Verification on the mlock2-disabled kernel:
> 
>     ~ # ./mlock2-tests
>     TAP version 13
>     1..0 # SKIP mlock2() syscall is not supported
>     ~ # echo $?
>     4
> 
> Re-enabling mlock2 in the kernel confirmed all 15 tests pass cleanly:
> 
>     ~ # ./mlock2-tests
>     TAP version 13
>     1..15
>     ok 1 test_mlock_lock: Locked
>     ...
>     ok 15 test_mlockall_future_droppable: droppable memory not locked
>     # Totals: pass:15 fail:0 xfail:0 xpass:0 skip:0 error:0
>     ~ # echo $?
>     0
> 
> Fixes: 1ddae9d67ee1 ("selftests/mm/mlock: print error on failure")
> Fixes: 65c89684896d ("selftests/mm: mlock2-tests: conform test to TAP format output")
> Signed-off-by: Park Tae-sun <ts930@dgu.ac.kr>
> ---
>  tools/testing/selftests/mm/mlock2-tests.c | 2 +-
>  tools/testing/selftests/mm/mlock2.h       | 8 +-------
>  2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/mlock2-tests.c b/tools/testing/selftests/mm/mlock2-tests.c
> index e16e288cc7c1..144b550813a6 100644
> --- a/tools/testing/selftests/mm/mlock2-tests.c
> +++ b/tools/testing/selftests/mm/mlock2-tests.c
> @@ -502,7 +502,7 @@ int main(int argc, char **argv)
>  
>  	ret = mlock2_(map, size, MLOCK_ONFAULT);
>  	if (ret && errno == ENOSYS)
> -		ksft_finished();
> +		ksft_exit_skip("mlock2() syscall is not supported\n");
>  
>  	munmap(map, size);
>  
> diff --git a/tools/testing/selftests/mm/mlock2.h b/tools/testing/selftests/mm/mlock2.h
> index 81e77fa41901..4417eaa5cfb7 100644
> --- a/tools/testing/selftests/mm/mlock2.h
> +++ b/tools/testing/selftests/mm/mlock2.h
> @@ -6,13 +6,7 @@
>  
>  static int mlock2_(void *start, size_t len, int flags)
>  {
> -	int ret = syscall(__NR_mlock2, start, len, flags);
> -
> -	if (ret) {
> -		errno = ret;
> -		return -1;
> -	}
> -	return 0;
> +	return syscall(__NR_mlock2, start, len, flags);
>  }

Reviewed-by: Muhammad Usama Anjum <usama.anjum@arm.com>

>  
>  static FILE *seek_to_smaps_entry(unsigned long addr)
> 
> ---
> base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
> change-id: 20260923-selftests-mm-mlock2-fix-fee59d31b124
> 
> Best regards,

