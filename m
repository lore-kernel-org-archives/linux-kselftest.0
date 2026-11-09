Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236391;
	b=wyTxmzETGzm0TkUIi/+yxeIdOhDQCOF/ZoG0yr/6jEkWGuQ3oPPRyjBH0ZKxAOrfJNMv
	 hAtl6fWY3lyCNRgpOhxTZMKIRI1zjj8pBRIgvEq+m7SW/lhUNwfVG3yHRYWCKp0AQLWMW
	 t01jEHhPo4xaVyehC3/7MGSzvVYyb4o7hk6wkTKugYEMAxWRHMNpl1YBvp7NP4EFMgYr6
	 nPYm39KbOZxTZqxvVLnidx9Q12m6MzUmshwY2fs5gPKyWoGJbg2Y4hAaWX7GIOIRmtgrJ
	 usm7j+U8iLrpojERvUzC4YBYEoUH03xlo62WiEc/WCJ48R9d/Q60BgkLJabenzbcodQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236391;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=UQoe9xSGlVbg9gi4dS/A1+AcZ2zXCs/RHnpuopsqhGg=;
	b=VqNlgmrsGhjlZibn2Zvq0mGIqEjw5Ebo2i3+SRHmNcCV1FRZFJtcTaRihlSPtzAYHHzL
	 pXj/JRUf15/cAHGrN4jhV4D45aCAvoX9r+xFnVKWtXFl2TEro78lPTPGuPLR0o/yb/WRO
	 SFymipJQCxA0b0OZhI5uH8kO4P/rZYZD2e6b0Ho37ksmUBCK1TdXu+598Luyptcqp2WN6
	 dMQp/26ZJhZTnUlni+Qs03YMAiVli2ss80uAeQ/lRG+H2F9sRn54Y73ytTRDx0pKGXMB2
	 D5pjgHpRLaX7/JPIstIoummidm+Wtk+eslFeqc6IIBACb3iWjRVJgAfe82UwwKgsD/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=juDJlG07;
	arc=none smtp.remote-ip=95.215.58.145
Received: from mta1.migadu.com (out-145.mta1.migadu.com [95.215.58.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D42606A321
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 14:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4D42606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=juDJlG07
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jjqFjMRwX/3Zyp4M1rAtDJCjdD5QdxzyEFL+8l8Kywc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794236386; v=1; x=1794841186;
 b=juDJlG070jTAPGKqfE1EBfSb1WJzhf4tCJC3gFUsDlkchnWwyVOTEjTnPjpUvmusVhXp4mW2
 JlR3n8uruelwui3+2TP+KX5E7MixU9WTdZAMs7laISH1tJKZSMBPYGJVOIyLoZ6szuPxyRggoNb
 xBhNX8Vm6vkIlQS1SmRRf9bA=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0514942bae641dc3;
	Mon, 09 Nov 2026 14:59:46 +0000
X-Mizu-Trace-ID: 0514942bae641dc3
X-Migadu-Flow: FLOW_OUT
Message-ID: <2b164c3b-7642-4c64-9c09-ab7dff5a79e5@linux.dev>
Date: Mon, 9 Nov 2026 22:59:33 +0800
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
Subject: Re: [PATCH v3 1/4] cgroup/cpuset: Reset partition data when an
 invalid partition stays invalid
To: Ridong Chen <ridong.chen@linux.dev>, Waiman Long <longman@redhat.com>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: Chen Ridong <chenridong@huawei.com>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>, Guopeng Zhang <zhangguopeng@kylinos.cn>,
 Ridong Chen <chenridong@xiaomi.com>
References: <20261107120100.3587595-1-ridong.chen@linux.dev>
 <20261107120100.3587595-2-ridong.chen@linux.dev>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20261107120100.3587595-2-ridong.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/11/7 20:00, Ridong Chen 写道:
> From: Ridong Chen <chenridong@xiaomi.com>
> 
> When cpuset.cpus or cpuset.cpus.exclusive of a partition root is
> changed, update_cpumask() and update_exclusive_cpumask() copy the new
> effective_xcpus computed for the trial cpuset into the cpuset, and call
> reset_partition_data() only if the partition was valid before and is
> invalid now:
> 
> 	if ((old_prs > 0) && !is_partition_valid(cs))
> 		reset_partition_data(cs);
> 
> An invalid partition root (old_prs < 0) that stays invalid is not
> covered. Its effective_xcpus is then left with the trial value, which
> is computed from user_xcpus() and so falls back to cpuset.cpus when
> cpuset.cpus.exclusive is cleared. As an invalid partition root does not
> own any exclusive CPUs, and rm_siblings_excl_cpus() treats a non-empty
> effective_xcpus of a sibling without cpuset.cpus.exclusive as owned,
> those CPUs can then no longer be claimed by a sibling:
> 
>   # A1: cpuset.cpus=2-3, cpuset.cpus.exclusive=2-3, root, with tasks
>   # offline CPUs 2-3 -> A1 becomes invalid
>   echo > A1/cpuset.cpus.exclusive
>   cat A1/cpuset.cpus.exclusive.effective    # 2-3, expected empty
>   echo 3 > B1/cpuset.cpus.exclusive         # -EINVAL
> 
> Reset the partition data whenever the cpuset is a partition root, valid
> or not, and ends up invalid. As effective_xcpus may be cleared by that,
> also force update_cpumasks_hier() to update the subtree, so that the
> effective_xcpus of the descendants doesn't keep the released CPUs. Add
> test cases for it.
> 
> Fixes: de9f15e21c55 ("cpuset: use parse_cpulist for setting cpus.exclusive")
> Fixes: c5866c9a007d ("cpuset: refactor CPU mask buffer parsing logic")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20261101114206.2434398-1-ridong.chen%40linux.dev?part=15
> Reviewed-by: Waiman Long <longman@redhat.com>
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> ---
>  kernel/cgroup/cpuset.c                            | 10 ++++++++--
>  tools/testing/selftests/cgroup/test_cpuset_prs.sh |  6 ++++++
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 3052413e41e7..cf38e8708ddd 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -2607,8 +2607,11 @@ static int update_cpumask(struct cpuset *cs, struct cpuset *trialcs,
>  	spin_lock_irq(&callback_lock);
>  	cpumask_copy(cs->cpus_allowed, trialcs->cpus_allowed);
>  	cpumask_copy(cs->effective_xcpus, trialcs->effective_xcpus);
> -	if ((old_prs > 0) && !is_partition_valid(cs))
> +	if (old_prs && !is_partition_valid(cs)) {
>  		reset_partition_data(cs);
> +		/* effective_xcpus may be cleared, update the subtree too */
> +		force = true;
> +	}
>  	spin_unlock_irq(&callback_lock);
>  
>  	/* effective_cpus/effective_xcpus will be updated here */
> @@ -2672,8 +2675,11 @@ static int update_exclusive_cpumask(struct cpuset *cs, struct cpuset *trialcs,
>  	spin_lock_irq(&callback_lock);
>  	cpumask_copy(cs->exclusive_cpus, trialcs->exclusive_cpus);
>  	cpumask_copy(cs->effective_xcpus, trialcs->effective_xcpus);
> -	if ((old_prs > 0) && !is_partition_valid(cs))
> +	if (old_prs && !is_partition_valid(cs)) {
>  		reset_partition_data(cs);
> +		/* effective_xcpus may be cleared, update the subtree too */
> +		force = true;
> +	}
>  	spin_unlock_irq(&callback_lock);
>  
>  	/*
> diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> index bdca6c471f87..32e1e44fa0b1 100755
> --- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> +++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> @@ -434,6 +434,12 @@ TEST_MATRIX=(
>  	# cpuset.cpus is allowed, but those extra CPUs are ignored.
>  	"  C2-3:P1   C3:P1  .      .      .     C2-4    .      .     0 A1:|A2:2-3 A1:P1|A2:P1"
>  
> +	# Clearing cpuset.cpus.exclusive of an invalid partition releases its
> +	# exclusive CPUs, including those of its descendants, so a sibling
> +	# can claim them.
> +	" CX2-3:P1    .     .     C3  T:O2=0:O3=0:X  .     .      X3   0 XA1:|XB1:3 A1:P-1"
> +	" CX2-3:P1   X3     .     C3  T:O2=0:O3=0:X  .     .      X3   0 XA1:|XA2:|XB1:3 A1:P-1"
> +
>  	# A child cannot recover until its exclusive CPUs are available again.
>  	" CX1-4:P1 CX3-4:P1 .     .     X1-2     .      .      .     0 A1:1-2|A2:1-2|XA2: A1:P1|A2:P-1"
>  	" CX1-4:P1 CX3-4:P1 .     .  X1-2:X1-4   .      .      .     0 A1:1-2|A2:3-4|XA2:3-4 A1:P1|A2:P1"
> 
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4

Reviewed-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
Tested-by: Guopeng Zhang <zhangguopeng@kylinos.cn>

Thanks,
Guopeng
