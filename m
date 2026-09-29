Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CBA344D9B;
	Tue, 29 Sep 2026 09:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673187; cv=none; b=f5Xfqe1on4m7xgNKUg7uR3J8XMGwZAisyXKEbDzzxXkxnPdgBWBKNXGMPAVWyg6ErX/fghfi+/sz+0k8fazF+8VdK+TSd2jel4RqEGTYBu2zejFlZIsGFabUn9Tl+PCr9I9RqmYyJbYmBDS6M0Ab4uutg25tjAnxL3asGMDjI5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673187; c=relaxed/simple;
	bh=L+A+ki4F258ZbWCrWJlsH2ukcU/51HiXJ123/RCt0cQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sG2FM9IMSiihiE5qBXZB6h/EwcuNM2o79VhFmKFmnDpWO54Jz+zAhm3WoEh8uwqoJLADEuaFdSRGbW2wZR1g64WcVdMS6NHyevHcXBhvS0KUdXQG5NDSo0gq2UqcOxKPvqTVshTzr2M8+942LedYTDtkwBxgkybWRPdirJa+8DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=js/r2/ns; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="js/r2/ns"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89B061516;
	Tue, 29 Sep 2026 02:12:50 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA4863F85F;
	Tue, 29 Sep 2026 02:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790673174; bh=L+A+ki4F258ZbWCrWJlsH2ukcU/51HiXJ123/RCt0cQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=js/r2/nsA1DwL2WcPDO5OkJF7bZRGKScgjzgGMCwIST8iXOV5Sr5cJTpwJpzGiiBc
	 bOT/l1RvLUkJ7ULIyZAgBvUYe75Sb5bsKniFMPIqa7ORqSb8KvMNJKm1iQxb8KyN/3
	 7V/udeDnpU65E9tX4vXIHlIRSsmqc3tR3NzBZn88=
Message-ID: <498b8fc3-ef39-424c-81b1-aa4bfdb7eac7@arm.com>
Date: Tue, 29 Sep 2026 14:42:47 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/9] selftests/mm: mremap_test: use kselftest
 helpers
To: "David Hildenbrand (Arm)" <david@kernel.org>,
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
 <6c349d10-2160-4166-8b63-3d60b42a5b69@kernel.org>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <6c349d10-2160-4166-8b63-3d60b42a5b69@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi David!

On 9/29/26 1:28 PM, David Hildenbrand (Arm) wrote:
> On 9/24/26 07:00, Sarthak Sharma wrote:
>> mremap_test currently uses a lot of fprintf() and perror()
>> calls. It also uses a variable "failures" to track the number
>> of failed table driven tests.
>>
>> Use ksft_print_msg() and ksft_perror() for diagnostics.
>> Remove the variable "failures" and let kselftest counters
>> handle the final exit status. Use ksft_finished() at
>> the end instead of manually checking if failures > 0. Replace
>>
>> if (success)
>> 	ksft_test_result_pass(...);
>> else
>> 	ksft_test_result_fail(...);
>>
>> calls with ksft_test_result(success, ...);
>>
>> Also correct the duplicated "mremap" in "mremap move within
>> range" and the spelling of "dontunmap".
>>
>> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
>> ---
> 
> [...]
> 
>>  #endif /* __NR_userfaultfd */
>>  
>> @@ -1124,7 +1096,7 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
>>  	void *new_ptr = mremap(src + SIZE_MB(1), SIZE_MB(1), SIZE_MB(1),
>>  						   MREMAP_MAYMOVE | MREMAP_FIXED, dest + SIZE_MB(1));
>>  	if (new_ptr == MAP_FAILED) {
>> -		perror("mremap");
>> +		ksft_perror("mremap");
>>  		success = 0;
>>  		goto out;
>>  	}
>> @@ -1145,59 +1117,49 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
>>  
>>  out:
>>  	if (src && munmap(src, c.region_size) == -1)
> 
> While at it ... why the comparison with -1. And why do we worry about munmap()
> failing at all? We generally ignore these errors on the exit path, as it's
> unlikely we would ever hit them, and there isn't a lot we can do.
> 
> So maybe just remove printing errors entirely?
> 
> if (src)
> 	munmap(src, c.region_size)

Yup, this check is not supposed to be on the exit path. I'll fix this.

> 
> ...
> 
>> -		perror("munmap src");
>> +		ksft_perror("munmap src");
>>  
>>  	if (dest && munmap(dest, c.region_size) == -1)
>> -		perror("munmap dest");
>> +		ksft_perror("munmap dest");
>>  
>> -	if (success)
>> -		ksft_test_result_pass("%s\n", test_name);
>> -	else
>> -		ksft_test_result_fail("%s\n", test_name);
>> +	ksft_test_result(success, "%s\n", test_name);
>>  }
> 
> [...]
> 
>>  static void usage(const char *cmd)
>>  {
>> -	fprintf(stderr,
>> -		"Usage: %s [[-t <threshold_mb>] [-p <pattern_seed>]]\n"
>> -		"-t\t only validate threshold_mb of the remapped region\n"
>> -		"  \t if 0 is supplied no threshold is used; all tests\n"
>> -		"  \t are run and remapped regions validated fully.\n"
>> -		"  \t The default threshold used is 4MB.\n"
>> -		"-p\t provide a seed to generate the random pattern for\n"
>> -		"  \t validating the remapped region.\n", cmd);
>> +	ksft_print_msg("Usage: %s [[-t <threshold_mb>] [-p <pattern_seed>]]\n", cmd);
>> +	ksft_print_msg("-t\t only validate threshold_mb of the remapped region\n");
>> +	ksft_print_msg("  \t if 0 is supplied no threshold is used; all tests\n");
>> +	ksft_print_msg("  \t are run and remapped regions validated fully.\n");
>> +	ksft_print_msg("  \t The default threshold used is 4MB.\n");
>> +	ksft_print_msg("-p\t provide a seed to generate the random pattern for\n");
>> +	ksft_print_msg("  \t validating the remapped region.\n");
>>  }
> 
> That looks odd, as we will now print this as "# ". I would have assumed that
> removing all parameters as the first patch would make things cleaner?
> 
> So as a first patch I think we should just remove the parameters entirely. They
> are unused by our infrastrcture:
> 
> 	run_vmtests.sh:CATEGORY="mremap" run_test ./mremap_test
> 
> Does anything speak against that?

Okay, I'd kept the 7th and 8th patch of the series for that. I'll make
them the first and second ones then, this will remove all this churn.

Or maybe remove all parameters altogether in the first patch itself.

> 
>>  
>>  static int parse_args(int argc, char **argv, unsigned int *threshold_mb,
>> @@ -1232,7 +1194,6 @@ static int parse_args(int argc, char **argv, unsigned int *threshold_mb,
>>  #define MAX_PERF_TEST 3
>>  int main(int argc, char **argv)
>>  {
>> -	int failures = 0;
>>  	unsigned int i;
>>  	int run_perf_tests;
>>  	unsigned int threshold_mb = VALIDATION_DEFAULT_THRESHOLD;
>> @@ -1260,7 +1221,7 @@ int main(int argc, char **argv)
>>  	pattern_seed = (unsigned int) time(&t);
>>  
>>  	if (parse_args(argc, argv, &threshold_mb, &pattern_seed) < 0)
>> -		exit(EXIT_FAILURE);
>> +		ksft_exit_fail_msg("Invalid arguments\n");
>>  
>>  	ksft_print_msg("Test configs:\n");
>>  	ksft_print_msg("threshold_mb=%u\n", threshold_mb);
>> @@ -1282,7 +1243,7 @@ int main(int argc, char **argv)
>>  	rand_addr = (char *)mmap(NULL, rand_size, PROT_READ | PROT_WRITE,
>>  				 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>>  	if (rand_addr == MAP_FAILED) {
>> -		perror("mmap");
>> +		ksft_perror("mmap");
>>  		ksft_exit_fail_msg("cannot mmap rand_addr\n");
> 
> Would be better combined like:
> 
> ksft_exit_fail_msg("cannot mmap rand_addr: %s\n", strerror(errno));
> 
> ?

Yup, or maybe with a ksft_exit_fail_perror() directly. Will change.

