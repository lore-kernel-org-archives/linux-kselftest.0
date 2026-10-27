Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105509;
	b=MV3vucSIAb8ccDV3SFBgsZh3CAwkggX2RviGa/fX9KZEbRoRqv3+/rKG56tl7Q3aQ1eY
	 papQxtC/D+yVGocW3jWi3nzIGJGzkQnQXS7cDUnC8OqZwhQBPn+zK7o0IsgFChC5KcxYB
	 LIbhBzgGHSK3qIcQQNO9KxDgShXJt6/1cJbxDQvXAP0lRPbzl5tuxfi129Hr5jbK8uQUB
	 rZhHSszXKpkNicArlJp+MEhsKxlDyqatTlVBJldtE5F/lRO5MwTd+p3sqfopkN+BTbdqf
	 A1/OLVWzn5dLnbjWuBzH1dFIwiDvNcvWoL9YvredtYApTf1FHJ3oK0CCItQJvCEgNvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105509;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=efDeR2XSeCkmXonnhL9f+/EjSqJf0lpR8aMZHhXLKgY=;
	b=nE9B/hYTkkR1dU0n2ATLyxfSatGn8GIdpTHTinC55qbp70bwaq4dzN7/wWE7SnajBXjt
	 Ux3Xadv8CtyIsXWL591PduBiIpsWa/e3ueDSE05wf4wt8yWVp7m0dYg/D5vTM4ovhqHDN
	 /uEr4AmqCvuYXq2olWbiwT3SC+15UEcg2Tr4V7dhztAJSZs7zTvnCiF6vd9pXFfaH6DJf
	 UzZJbKpGKZN6w8M2sU5z/9M751BwmxvgG6YBVXD14x2VGTYiteO0MIaZ6mWGaDBsFXr6s
	 ZZA641Bw5Gn+t/rVY4xamrOryT9vAP1Yl09vyWDFaKZw/3ghdN7K1DizGRaYxW9+nig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hRMKpeKJ;
	arc=none smtp.remote-ip=95.215.58.38
Received: from mta1.migadu.com (out-38.mta1.migadu.com [95.215.58.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF03606A338
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 12:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AF03606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hRMKpeKJ
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SeVru1AGpGZ8MBrHreB8ar7ikkMNlrnuspWoqBYx4Rg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793105500; v=1; x=1793710300;
 b=hRMKpeKJkOB5EUYHKNhIKOzH+nw/ZLtbw1aWkCVo8AQh+uyWKGCbcfT8d+QsXQGf8pRSq1+5
 872Rj3vY0rtOFNHXOQsI4fHypVAQvPQbjqj0MxUCS351btpj+6wvdlTuqbDOnFtHxfPJQKzQ4MN
 ouPqPjpV2X2iMMwVJGaIS2Ww=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3e7d0284ffbc10b2;
	Tue, 27 Oct 2026 12:51:40 +0000
X-Mizu-Trace-ID: 3e7d0284ffbc10b2
X-Migadu-Flow: FLOW_OUT
Message-ID: <d6a083c4-2946-4a91-8e54-be28c50c816f@linux.dev>
Date: Tue, 27 Oct 2026 20:51:33 +0800
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
Cc: cui.tao@linux.dev, cgroups@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/cgroup: Don't count cgroup.threads in
 test_cgcore_proc_migration
To: Sasha Levin <sashal@kernel.org>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
References: <20261024140933.315221-1-sashal@kernel.org>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <20261024140933.315221-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sasha,

在 2026/10/24 22:09, Sasha Levin 写道:
> test_cgcore_proc_migration() moves a process with 13 extra threads to
> cg_dst and checks that they all moved by counting the lines of
> cg_dst/cgroup.threads.
> 
> test_stress.sh runs test_core while enabling and disabling cpuset in the
> root cgroup.subtree_control in a loop. Each change moves every task in
> the hierarchy to a new css_set. Reading cgroup.threads walks the
> cgroup's css_sets without holding cgroup_mutex, so when such a change
> lands in the middle of the read, threads that were already listed from
> the old css_set are listed again from the new one. The test then fails
> with "not ok 8 test_cgcore_proc_migration" although the migration
> worked.
> 
> Running the test's steps 40000 times in a 2 CPU KVM guest with the
> cpuset changes going on, 5 reads listed the 14 threads two or three
> times over (up to 36 lines), and a second read right after gave 14.
> Without the cpuset changes it did not happen in 40000 runs. With
> test_stress.sh, the test failed in 2 of 150 runs.
> 
> Check the cgroup of each thread of the process in /proc instead, which
> other migrations can't affect.
> 

Reproduced on next-20261023 under test_stress-style interference
(pinned to 2 vCPUs): without the patch the test failed once in 17161
runs, and reading cgroup.threads in a loop under the same churn showed
duplicated threads, up to 38 lines. With the patch, no failures in
18578 runs.

Reviewed-by: Tao Cui <cuitao@kylinos.cn>
Tested-by: Tao Cui <cuitao@kylinos.cn>

Thanks,
Tao

> Fixes: 1a99fcc035fb ("selftests: cgroup: Run test_core under interfering stress")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  tools/testing/selftests/cgroup/test_core.c | 36 +++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/cgroup/test_core.c b/tools/testing/selftests/cgroup/test_core.c
> index 20d2b63774c37..53592bf309fac 100644
> --- a/tools/testing/selftests/cgroup/test_core.c
> +++ b/tools/testing/selftests/cgroup/test_core.c
> @@ -9,6 +9,7 @@
>  #include <sys/stat.h>
>  #include <sys/wait.h>
>  #include <unistd.h>
> +#include <dirent.h>
>  #include <fcntl.h>
>  #include <sched.h>
>  #include <stdio.h>
> @@ -567,6 +568,39 @@ static void *dummy_thread_fn(void *arg)
>  	return (void *)(size_t)pause();
>  }
>  
> +/*
> + * Count the threads of the current process, or return -1 if any of them
> + * is not in @cgroup. Unlike reading cgroup.threads, this is not affected
> + * by other migrations happening at the same time.
> + */
> +static int count_threads_in_cgroup(const char *root, const char *cgroup)
> +{
> +	char line[PATH_MAX];
> +	struct dirent *de;
> +	int cnt = 0;
> +	DIR *dir;
> +
> +	snprintf(line, sizeof(line), CG_PATH_FORMAT, cgroup + strlen(root));
> +
> +	dir = opendir("/proc/self/task");
> +	if (!dir)
> +		return -1;
> +
> +	while ((de = readdir(dir))) {
> +		if (de->d_name[0] == '.')
> +			continue;
> +
> +		if (proc_read_strstr(atoi(de->d_name), false, "cgroup", line)) {
> +			cnt = -1;
> +			break;
> +		}
> +		cnt++;
> +	}
> +
> +	closedir(dir);
> +	return cnt;
> +}
> +
>  /*
>   * Test threadgroup migration.
>   * All threads of a process are migrated together.
> @@ -597,7 +631,7 @@ static int test_cgcore_proc_migration(const char *root)
>  	}
>  
>  	cg_enter_current(dst);
> -	if (cg_read_lc(dst, CG_THREADS_FILE) != n_threads + 1)
> +	if (count_threads_in_cgroup(root, dst) != n_threads + 1)
>  		goto cleanup;
>  
>  	ret = KSFT_PASS;

