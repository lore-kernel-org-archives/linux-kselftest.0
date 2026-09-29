Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE90014A60F;
	Tue, 29 Sep 2026 07:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668736; cv=none; b=kkJ/j72yfZiBdmTxgJ5C9rlxshtucWHRyRRBwCEpAC69bejXuCjDjBen3mevqnWSFuTPmnn0UiBXYv4OHJ/p3a6lQxuy0gYrEfJ1GFXfK6aEfnU4v8Utr6Mt1rS+ssDWKmCwHLNHOeBc7xDV3/iU9w/rtCFjVKCzmgT6Opx+YyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668736; c=relaxed/simple;
	bh=m/15/Y98HcsXIHQ2cjH89Yem0jJenowOvSgx3AheMGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qj1VZezYTNdfVhMAejqTf9Hi/wniWEwFGK3BhUqjJ243GB4iWd48sj859odtQSHoqUzDQAgqazGlvIQ1IYNqnSZC/72zLRTi2vrkQ0CcNHzCtDWzxKsC0LZmI5+Ro5MG4iO2g1pW3uhfj1zbL2zF74+/GWyHtjbcHRI2dkPqpDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpg3NxSK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpg3NxSK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3C81F000FF;
	Tue, 29 Sep 2026 07:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790668734;
	bh=7pk1v3z+VGNvnZ31sDmqvV8W/43hqaDHhcD0ieAuWqM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dpg3NxSKrMNJWRZNr2K0ov4/Q0jMbqr0pMwW/bMcZLPvUNEU7KxfLvevHMN58VSMB
	 iyrFoBNb2JfTJEPKfsBZCnESvjtg38WlSV13uOFUD4H7DpQ4J6SBpwCB4dyfKLbmOd
	 5r36xxXmVk0xudeYIGqs3y1+3uyIP78/AVcOH67+Hi9U0GvgYOKBy6OO4mAgVxI8ZF
	 8Lj3Wg2NXS+RLiMl9EyO3dqDGGargFsV20R61Ca+UhP9LUUwh30yI2R+t2ePZhA8N8
	 imlbYivATAtcPbTXIOF/+u/0hvU1mhOIWRKZsVFeJ/lZWBKysrznRulAGFff2kLfvh
	 2RLfq+e2mvgYw==
Message-ID: <6c349d10-2160-4166-8b63-3d60b42a5b69@kernel.org>
Date: Tue, 29 Sep 2026 09:58:48 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/9] selftests/mm: mremap_test: use kselftest
 helpers
To: Sarthak Sharma <sarthak.sharma@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Kalesh Singh <kaleshsingh@google.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Park Tae-sun
 <ts930@dgu.ac.kr>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260924050009.19974-1-sarthak.sharma@arm.com>
 <20260924050009.19974-2-sarthak.sharma@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260924050009.19974-2-sarthak.sharma@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/26 07:00, Sarthak Sharma wrote:
> mremap_test currently uses a lot of fprintf() and perror()
> calls. It also uses a variable "failures" to track the number
> of failed table driven tests.
> 
> Use ksft_print_msg() and ksft_perror() for diagnostics.
> Remove the variable "failures" and let kselftest counters
> handle the final exit status. Use ksft_finished() at
> the end instead of manually checking if failures > 0. Replace
> 
> if (success)
> 	ksft_test_result_pass(...);
> else
> 	ksft_test_result_fail(...);
> 
> calls with ksft_test_result(success, ...);
> 
> Also correct the duplicated "mremap" in "mremap move within
> range" and the spelling of "dontunmap".
> 
> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
> ---

[...]

>  #endif /* __NR_userfaultfd */
>  
> @@ -1124,7 +1096,7 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
>  	void *new_ptr = mremap(src + SIZE_MB(1), SIZE_MB(1), SIZE_MB(1),
>  						   MREMAP_MAYMOVE | MREMAP_FIXED, dest + SIZE_MB(1));
>  	if (new_ptr == MAP_FAILED) {
> -		perror("mremap");
> +		ksft_perror("mremap");
>  		success = 0;
>  		goto out;
>  	}
> @@ -1145,59 +1117,49 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
>  
>  out:
>  	if (src && munmap(src, c.region_size) == -1)

While at it ... why the comparison with -1. And why do we worry about munmap()
failing at all? We generally ignore these errors on the exit path, as it's
unlikely we would ever hit them, and there isn't a lot we can do.

So maybe just remove printing errors entirely?

if (src)
	munmap(src, c.region_size)

...

> -		perror("munmap src");
> +		ksft_perror("munmap src");
>  
>  	if (dest && munmap(dest, c.region_size) == -1)
> -		perror("munmap dest");
> +		ksft_perror("munmap dest");
>  
> -	if (success)
> -		ksft_test_result_pass("%s\n", test_name);
> -	else
> -		ksft_test_result_fail("%s\n", test_name);
> +	ksft_test_result(success, "%s\n", test_name);
>  }

[...]

>  static void usage(const char *cmd)
>  {
> -	fprintf(stderr,
> -		"Usage: %s [[-t <threshold_mb>] [-p <pattern_seed>]]\n"
> -		"-t\t only validate threshold_mb of the remapped region\n"
> -		"  \t if 0 is supplied no threshold is used; all tests\n"
> -		"  \t are run and remapped regions validated fully.\n"
> -		"  \t The default threshold used is 4MB.\n"
> -		"-p\t provide a seed to generate the random pattern for\n"
> -		"  \t validating the remapped region.\n", cmd);
> +	ksft_print_msg("Usage: %s [[-t <threshold_mb>] [-p <pattern_seed>]]\n", cmd);
> +	ksft_print_msg("-t\t only validate threshold_mb of the remapped region\n");
> +	ksft_print_msg("  \t if 0 is supplied no threshold is used; all tests\n");
> +	ksft_print_msg("  \t are run and remapped regions validated fully.\n");
> +	ksft_print_msg("  \t The default threshold used is 4MB.\n");
> +	ksft_print_msg("-p\t provide a seed to generate the random pattern for\n");
> +	ksft_print_msg("  \t validating the remapped region.\n");
>  }

That looks odd, as we will now print this as "# ". I would have assumed that
removing all parameters as the first patch would make things cleaner?

So as a first patch I think we should just remove the parameters entirely. They
are unused by our infrastrcture:

	run_vmtests.sh:CATEGORY="mremap" run_test ./mremap_test

Does anything speak against that?

>  
>  static int parse_args(int argc, char **argv, unsigned int *threshold_mb,
> @@ -1232,7 +1194,6 @@ static int parse_args(int argc, char **argv, unsigned int *threshold_mb,
>  #define MAX_PERF_TEST 3
>  int main(int argc, char **argv)
>  {
> -	int failures = 0;
>  	unsigned int i;
>  	int run_perf_tests;
>  	unsigned int threshold_mb = VALIDATION_DEFAULT_THRESHOLD;
> @@ -1260,7 +1221,7 @@ int main(int argc, char **argv)
>  	pattern_seed = (unsigned int) time(&t);
>  
>  	if (parse_args(argc, argv, &threshold_mb, &pattern_seed) < 0)
> -		exit(EXIT_FAILURE);
> +		ksft_exit_fail_msg("Invalid arguments\n");
>  
>  	ksft_print_msg("Test configs:\n");
>  	ksft_print_msg("threshold_mb=%u\n", threshold_mb);
> @@ -1282,7 +1243,7 @@ int main(int argc, char **argv)
>  	rand_addr = (char *)mmap(NULL, rand_size, PROT_READ | PROT_WRITE,
>  				 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>  	if (rand_addr == MAP_FAILED) {
> -		perror("mmap");
> +		ksft_perror("mmap");
>  		ksft_exit_fail_msg("cannot mmap rand_addr\n");

Would be better combined like:

ksft_exit_fail_msg("cannot mmap rand_addr: %s\n", strerror(errno));

?

-- 
Cheers,

David
