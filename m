Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798273;
	b=b3Fzz62afgMeTIKkKWOpEfvW6TFWSHk+IU5InqwKCTxIHYUe+QXf9T9xO4JupMBRzo5E
	 jtNoGn5Rj24MyENMJcs2mmZ19XhQQPIN1kSRgT8i0gKhOZRKVpubNHRP3osiIaHVnTEOR
	 pWP2pNRbmaL1csz/u05ihVAlIvhW0D77jEHIMYHtzuJfddHsR1zbC+uuxpvTFcCrFF7nf
	 TgGCOjP2VmMzhQo0o5WcPZ3dMkNm/DAmOfLz/wK2jctxQxnjJtPBERVqskYzHWopAPu+t
	 tCM3wSRK3rejk6o6Kdb2TwBRxFumP5V/xBs+s8L++iCXHCoI2vJz6g0heFSZIl/l1pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798273;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=gjvOzc12J2sR02D1SD6105ACjek4G9ZZ21f6s6C+IuA=;
	b=icA+J6+isRB6rAgBn34YyznCLlWEVv1IQZKT94Azs8Wa4pZFkhbB5aAKohhRTlsMJe8x
	 TU3OK25UMSkYL4G8rSQtIwXIeSUB/T3DFqr58dUS/FHFWGUYYpEO6+BCZOOxsa/fzl0iI
	 HTUwvBrC+vjCOZqUWkQ2wLg7gq9onAd1DDSF9BAjhfxwV8nv1QhUo06tQCqVTkAl0yf6T
	 LICmjwFXQkD2S/i89Dg/hZqysI0rJEwZ6xZ6rejYtzJm0pMXjyBR7Ra97WTuFBcSY++Hs
	 WDmAlEs0pIFVuzcA4YvUBKYMmfqJ2HkPvTaNJ7s6DlZCW8FWljTcd5HefPRnyaRQGqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hXVNTbRS;
	arc=none smtp.remote-ip=91.218.175.210
Received: from mta0.migadu.com (out-210.mta0.migadu.com [91.218.175.210])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6549B606A898
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 03:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6549B606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hXVNTbRS
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2kSxzvz8rnLMULtMF34NYKP/UIdl2tqu/nArinaMAV8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794798270; v=1; x=1795403070;
 b=hXVNTbRSvJ5Yv2vb3g1NJ1Utmd4/yMHzivP2SbiFL4NQRwXZsEkn8qFyftbuIXgK5PyvkEmn
 hNWfF7bKfUAMYJtekHS2Bogq7bP9Oo6JliMxQNc1S3Ffbfst/GzGzhkylFvTrqkwRBi7/jttQqB
 C+N9ynck+E4yq/GLefbCURtg=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 80d53e618474a42b;
	Mon, 16 Nov 2026 03:04:29 +0000
X-Mizu-Trace-ID: 80d53e618474a42b
X-Migadu-Flow: FLOW_OUT
Message-ID: <bbb07259-a2e8-40b5-9933-eb3d5d7a4bba@linux.dev>
Date: Mon, 16 Nov 2026 11:04:19 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [PATCH bpf-next] selftests/bpf: Skip memcg_proactive_reclaim when
 data lands in shmem
To: Kurt Lin <lylin1023@gmail.com>, Hui Zhu <zhuhui@kylinos.cn>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 Emil Tsalapatis <emil@etsalapatis.com>, Barry Song <baohua@kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261113180159.602033-1-lylin1023@gmail.com>
Content-Language: en-US
From: Hui Zhu <hui.zhu@linux.dev>
In-Reply-To: <20261113180159.602033-1-lylin1023@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Kurt,

I have two suggestions below.

2026/11/14 02:01, Kurt Lin:

> workload_dir() keeps the data file off tmpfs because shmem cannot be
> reclaimed without swap. But statfs() only sees the top of a stacking
> filesystem: with /tmp on overlayfs over tmpfs, as in virtme-ng guests,
> the check passes and all 32 MiB are still charged as shmem. Whether the
> test then passes depends on unrelated page cache in the cgroup; in a
> full test_progs run it fails with:
>
>    test_memcg_proactive_reclaim:FAIL:reclaimed unexpected reclaimed: actual 0 <= expected 0
>
> Check memory.stat after writing the file and skip when most of the
> data was charged as shmem.
>
> An AI coding assistant (Claude) was used to find and analyze the
> failure and to draft the fix and this changelog.
>
> Fixes: 0f9b1e9ef584 ("selftests/bpf: Add bpf_proactive_reclaim test")
> Signed-off-by: Kurt Lin <lylin1023@gmail.com>
> ---
>
> Notes:
>      Tested in a virtme-ng guest without swap: with /tmp on overlayfs over
>      tmpfs the test now skips; on a disk-backed directory it passes.
>      
>      After writing 32 MiB, memory.stat shows shmem 32.0 MiB on overlayfs
>      /tmp and on tmpfs, and 0.0 MiB on a disk-backed filesystem.
>
>   .../bpf/prog_tests/memcg_proactive_reclaim.c  | 28 +++++++++++++++++++
>   1 file changed, 28 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c b/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
> index c22dcfabe856..c03550676041 100644
> --- a/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
> +++ b/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
> @@ -46,6 +46,28 @@ static const char *workload_dir(void)
>   	return NULL;
>   }
>   
> +/*
> + * statfs() only sees the top of a stacking filesystem. When /tmp is an
> + * overlayfs whose upper layer lives on tmpfs, as in virtme-ng guests, the
> + * check above passes but the written data still ends up as shmem. Ask the
> + * cgroup how the pages were actually charged.
> + */
> +static bool charged_as_shmem(void)
> +{
> +	static char buf[8192];
> +	unsigned long long shmem;
> +	char *p;
> +
> +	if (read_cgroup_file(CG_PATH, "memory.stat", buf, sizeof(buf)))
> +		return false;
Would it make sense to turn the silent "return false" into an explicit
assertion, e.g.:

     if (!ASSERT_OK(read_cgroup_file(CG_PATH, "memory.stat", buf,
                     sizeof(buf)), "read memory.stat"))
         return false;

My reasoning: memory.stat exists on every cgroup v2 hierarchy and the
"shmem" key is emitted unconditionally (not behind any CONFIG), and
cgroup_setup_and_join() has already succeeded by the time this runs.
So a read/parse failure here likely means something is genuinely
broken, rather than an environment limitation. With the silent
fallback, a shmem-backed dir falls through to the old confusing
"reclaimed: actual 0 <= expected 0" failure and the real cause is
never reported. The ASSERT_* macros are statement expressions, so this
works inside the bool helper: the failure is recorded with a clear
message first, and any subsequent "reclaimed" failure becomes
obviously secondary. (Skipping on the error path would be worse still
-- a genuine breakage would be counted as a pass, so I'd keep it as a
failure either way.)
> +
> +	p = strstr(buf, "\nshmem ");
> +	if (!p || sscanf(p, "\nshmem %llu", &shmem) != 1)
> +		return false;
> +
> +	return shmem >= FILE_SIZE / 2;


Small nit: a one-line comment on the threshold might help future
readers, something like "all-or-nothing: the data file is either fully
shmem (stacked tmpfs) or not shmem at all (disk-backed), so half of
FILE_SIZE is a safe midpoint". Also, printing the measured shmem value
in the SKIP message could be handy when debugging odd environments.

Best,
Hui


> +}
> +
>   void test_memcg_proactive_reclaim(void)
>   {
>   	struct memcg_proactive_reclaim *skel = NULL;
> @@ -99,6 +121,12 @@ void test_memcg_proactive_reclaim(void)
>   	if (!ASSERT_OK(fsync(data_fd), "fsync"))
>   		goto out;
>   
> +	if (charged_as_shmem()) {
> +		printf("%s:SKIP: %s is backed by shmem\n", __func__, dir);
> +		test__skip();
> +		goto out;
> +	}
> +
>   	args.cgroup_id = cgroup_id;
>   	args.size = FILE_SIZE;
>   	skel->bss->reclaimed = 0;
>
> base-commit: 0021f17128de5dc0b19f1a523f448df2440d8088
