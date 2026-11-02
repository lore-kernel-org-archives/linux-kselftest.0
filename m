Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793583026;
	b=RhkymmllaYj7NZaOo65jM/HbrKS/3XH9AxxQyBXM8b61isLkMizUb8A0pbhr0R7MWJUw
	 4Mf/gDhUzAIyOjDtBgXkkUDQnkmVaxWUKIjRxlQZynXwjYcm5eoWSUgIdZ5BUATcJZBMQ
	 ZQJCabxhbr+rWiQEgX8tAL6bCCWQqr0hd4dUW31TiCAz5qnr6Qo/LXkGlS7FAJwSt3ORR
	 9J6LUU9JbBi2Cy7epK0I+qwKaTiAFYV08hSAV1QzdCJUTLeHeevxNYxZjgMbLAvjLZqln
	 K/Z8EnaDeI070j6e0kYVj9ylllESWREAQSgzDpGsXUV6JBZEUdrG8V5+yVZApJHKI6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793583026;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=5SySUHGvWAaNRa+9l2Aa4RYt/iIP1exv/hf2wqHind8=;
	b=wHzA3WVkVa9QQ4g53zGsAZhVhrALrIC9bfeKfZfazrUxgoDOYJ4mCQvSiAw8T75SWx7A
	 6mI4wuHUE3tlcKb9f3MGggQ+69oPUUh0ulq5MTVaPKSScy6TwLdtREZ8b/SXKEXq2cPYs
	 ZNUmoG8sh85cipE7V4ybvWv2ArI+ZxLaDHmkEm6pHrvuGmuQrgGT9TTixukBR8QxS7o0U
	 rrKOywAwF3U4+Ou8kX3gA5lRIKXEdJjORaIIPUq00HYwpCP5iHgIhzpXYQVl3ILrbTwdV
	 KMleQ4jJ+Kz11jIiIDiGVI9mO0gbUjWyNqBPfCu/LIo+Dsz+qijiRvehPCxC/VH8ngg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NEwnskzZ;
	arc=none smtp.remote-ip=95.215.58.145
Received: from mta1.migadu.com (out-145.mta1.migadu.com [95.215.58.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BF9606A329
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 01:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3BF9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NEwnskzZ
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/4x3xaBdJewuJgQAldBK7xykAEYVDrVN8pq+tde6EgA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793583024; v=1; x=1794187824;
 b=NEwnskzZ49ec+FN0H1BzIUF/stxaseihXZaVUDfJzVkVGp89blE2iuk7XuJivCQaabvcbM1z
 bDXlM7UTBS45dv6M/HYy3Yn+IdexT+ddFAzKUY3Tup5k+6Csh6V3jPK1mQqTmhmjj9s/tywHAeX
 aCqK0iiG3gkT7vzFoGqbnXBE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 02c042eb4f586f3f;
	Mon, 02 Nov 2026 01:30:10 +0000
X-Mizu-Trace-ID: 02c042eb4f586f3f
X-Migadu-Flow: FLOW_OUT
Message-ID: <7f98f3d6-07f0-4117-92e7-91d9bb802972@linux.dev>
Date: Mon, 2 Nov 2026 09:30:05 +0800
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
Subject: Re: [PATCH v2 3/3] cgroup/cpuset: Do housekeeping check when isolated
 child with root parent may get more xcpus
To: Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261030190701.78308-1-longman@redhat.com>
 <20261030190701.78308-4-longman@redhat.com>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20261030190701.78308-4-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/31 03:07, Waiman Long 写道:
> It is reported by sashiko and Guopeng that when an isolated child with
> root parent gets more isolated CPUs from the expansion of the parent's
> effective_xcpus, it is possible that all the active housekeeping CPUs
> may be gone. So a prstate_housekeeping_conflict() should be performed
> when that happens. Add the check to make sure that we can't exhaust
> all the active housekeeping CPUs.
> 
> Test cases are added to the NOHZ_FULL_TEST_MATRIX of test_cpuset_prs.sh
> to test that.
> 
> Reported-by: Guopeng Zhang <guopeng.zhang@linux.dev>
> Link: https://lore.kernel.org/lkml/ed6fecb4-38e9-4a73-8c1a-7bdd80175a69@linux.dev
> Fixes: e2ffe502ba45 ("cgroup/cpuset: Add cpuset.cpus.exclusive for v2")
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  kernel/cgroup/cpuset.c                         | 18 +++++++++++++++---
>  .../selftests/cgroup/test_cpuset_prs.sh        | 10 ++++++++--
>  2 files changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index ed014ecb770c..6e136888fc8e 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -2119,10 +2119,22 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
>  			 * If there is an expansion of parent's effective_xcpus,
>  			 * we may take more xcpus from parent. The parent's
>  			 * effective_cpus should still have active CPUs or nocpu
> -			 * should have been set.
> +			 * should have been set. We also need to do a
> +			 * housekeeping check for an isolated child with root
> +			 * parent to make sure that it won't exhaust all the
> +			 * active housekeeping CPUs.
>  			 */
> -			deleting = cpumask_andnot(tmp->delmask, tmp->delmask,
> -						  cs->effective_xcpus);
> +			cpumask_andnot(tmp->addmask, cs->effective_xcpus, tmp->delmask);
> +			if ((parent_prs == PRS_ROOT) && (old_prs == PRS_ISOLATED) &&
> +			    prstate_housekeeping_conflict(old_prs, parent_prs,
> +							  tmp->delmask, tmp->addmask)) {
> +				adding = cpumask_and(tmp->addmask, cs->effective_xcpus,
> +						     tmp->delmask);
> +				part_error = PERR_HKEEPING;
> +			} else {
> +				deleting = cpumask_andnot(tmp->delmask, tmp->delmask,
> +							  cs->effective_xcpus);
> +			}
>  		} else if (is_partition_invalid(cs)) {
>  			struct cgroup_subsys_state *css;
>  			struct cpuset *child;
> diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> index 844efdf029cd..bdca6c471f87 100755
> --- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> +++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> @@ -137,7 +137,8 @@ LAST_PRESENT_CPU=$(cat /sys/devices/system/cpu/present | sed -e "s/.*[,-]//")
>  # If isolated CPUs have been reserved at boot time (as shown in
>  # /sys/devices/system/cpu/isolated), these isolated CPUs should be outside of
>  # CPUs 0-8 that will be used by this script for testing purpose. If not, some
> -# of the tests may fail incorrectly.
> +# of the tests may fail incorrectly. The first boot isolated CPU should be
> +# 10 or above.
>  #
>  # The current set of isolated CPUs (as shown in cpuset.cpus.isolated) should
>  # be the same as the boot value. If not, wait a bit and retry again just in
> @@ -156,7 +157,7 @@ TEST_ISOLCPUS=
>  [[ -n "$BOOT_ISOLCPUS" ]] && {
>  	FIRST_ISOLCPUS=$(echo $BOOT_ISOLCPUS | sed -e "s/[,-].*//")
>  	echo "Boot isolated CPUs: $BOOT_ISOLCPUS"
> -	[[ $FIRST_ISOLCPUS -le 8 ]] &&
> +	[[ $FIRST_ISOLCPUS -le 9 ]] &&
>  		skip_test "Boot isolated CPUs overlap CPUs to be tested"
>  }
>  
> @@ -602,6 +603,7 @@ ISOLCPUS_TEST_MATRIX=(
>  )
>  
>  # Test matrix to be run when boot time nohz_full CPUs cover all CPUs except CPUs 0-7
> +# This also means that CPU 8 is available and is a nohz_full CPU.
>  NOHZ_FULL_TEST_MATRIX=(
>  	#  old-A1 old-A2 old-A3 old-B1 new-A1 new-A2 new-A3 new-B1 fail ECPUs Pstate ISOLCPUS
>  	#  ------ ------ ------ ------ ------ ------ ------ ------ ---- ----- ------ --------
> @@ -610,6 +612,10 @@ NOHZ_FULL_TEST_MATRIX=(
>  	" C2-7:P2    .      .      .     C0-4    .      .      .     0 A1:0-4 A1:P2 0-4"
>  	" C1-7:P2 C5-7:P2   .      .       .     .      .    C0:P2   0 A1:1-4|A2:5-7|B1:0
>  								       A1:P2|A2:P2|B1:P-2 1-7"
> +	# An isolated child partition cannot grow to take over the last
> +	# housekeeping CPU when its parent expands the exclusive CPUs.
> +	" C0-8:X1-8:P1 CX0-8:P2 .  .     X0-7    .      .      .     0 A1:0-7|A2:0-7 A1:P1|A2:P-2 ."
> +	" C0-8:X0-6:P1 CX0-8:P2 .  .     X2-8    .      .      .     0 A1:|A2:2-8 A1:P1|A2:P2 2-8"
>  )
>  
>  #

Reviewed-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
Tested-by: Guopeng Zhang <zhangguopeng@kylinos.cn>

Thanks,
Guopeng
