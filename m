Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793238778;
	b=bEZOTzAaq9pmGuOEYBDerInplwhvUe4hC0YAK7Aw9L6WVCeiMJmT+Hl36ur7FB18ETX2
	 HFoIbF8lxIkDzkgnLNhSZ1fXNpZ6A1LoDUySFMeNsQDUvm0POABS83DB1N0ENP27/ehRc
	 EmjnHxdBxlISqdN9IZggO98t0g54rZarGT75d6VJuxqvkqSIhBUMfbNUDW5z84tTRLjLo
	 /JhcQ6DKGbbo4DNQK0ls5g+iAPWOillkuUI3N9qXuFy/+/ywnYrKFDkgGDmsEn8Jm3ik3
	 XQHma9+Oo+2WlWG09JZ9f3Yn4IrgvTpGmJUpKgSTFMZNv/8jljtaPWfme16NB45tZSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238778;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=VS3KrUAsZqGFDdQ1zZWj5siDrI6dINzVkvHLgIOwcqQ=;
	b=i7Oarw9gO/p24U11tHSpglDK2yt1S6F5hmFye+Nf2GjJRwQbKkmA74sjlL2KWcutqNMS
	 d7HQvPO6M8KCXYoI2e+Durb0va8MmCzD7eChwXjueCusNz4ry9BmN9yH7WHLAnZdfnGrM
	 yTwAMLKuFN2AqSxyWz+KFuIyWI+Pp0/JEkyc/05KKM1pE3RS0AxC/opUqz7Xq5GD6M0+y
	 YLjaEN8jMszlzhiS6hEAS/u+WksqRKTjB+aYI8L3n+1EAHUl2OsQ4uV3vGLW+t0XebDqP
	 UNz8JC4AHPlGy2KBjM5WEErmWUlCkUQZtBag9rcDSMm1Y/0FU7NClm2fheVi+XncITQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=I6mBccfK;
	arc=none smtp.remote-ip=91.218.175.46
Received: from mta0.migadu.com (out-46.mta0.migadu.com [91.218.175.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CE5606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 01:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6CE5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=I6mBccfK
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=L5Q6rCoHvu1FDzBsQtgKrDF+QPXj/u5Q9tsLLNU5L+Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793238776; v=1; x=1793843576;
 b=I6mBccfKKKY8NPjFyfsHE6zdDeDSuhASqL1OBCfxshXBGCTV+SmHrmX2fIKrHgDdTFS1IxL9
 n1IaKO4MxlXimXduqZz8Ls/ILCXKFWD9lBLoKHvCQdUuxJHrMjxSlVKkH+OdBsE3mt2bAkqUmMq
 WrUfXl80Qvj+7c2eQrh/tVXc=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e06e74143ea9c3fb;
	Thu, 29 Oct 2026 01:52:55 +0000
X-Mizu-Trace-ID: e06e74143ea9c3fb
X-Migadu-Flow: FLOW_OUT
Message-ID: <ed6fecb4-38e9-4a73-8c1a-7bdd80175a69@linux.dev>
Date: Thu, 29 Oct 2026 09:52:51 +0800
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
Subject: Re: [PATCH] cgroup/cpuset: Fix missing effective_xcpus accounting of
 child partitions
To: Waiman Long <longman@redhat.com>
Cc: ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org,
 mkoutny@suse.com, shuah@kernel.org, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Guopeng Zhang <zhangguopeng@kylinos.cn>
References: <20261027123837.100909-1-guopeng.zhang@linux.dev>
 <c00f13e5-d048-4d5d-98ea-984ea7ebc13b@redhat.com>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <c00f13e5-d048-4d5d-98ea-984ea7ebc13b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/28 23:30, Waiman Long 写道:
> On 10/27/26 8:38 AM, Guopeng Zhang wrote:
>> From: Guopeng Zhang <zhangguopeng@kylinos.cn>
>>
>> When a partition root expands its exclusive CPUs, a valid child
>> partition will be able to claim more CPUs from its parent. As
>> update_cpumasks_hier() always updates a cpuset before its descendants,
>> the parent has already been committed when the child partition is
>> reached. Its effective_cpus is computed with the child's old
>> effective_xcpus subtracted and no further adjustment is made
>> after the child commits its new effective_xcpus.
>>
>> The additional CPUs are thus granted to both the parent and the child
>> partitions. generate_sched_domains() then emits the warning below
>> about the overlapping sched domains:
>>
>>    WARNING: kernel/cgroup/cpuset.c:919 at rebuild_sched_domains_locked+0x1ec/0x2e0, CPU#21: bash/1225
>>
>> Fix that by taking the CPUs newly added to a valid child partition
>> away from its parent at the commit point of update_cpumasks_hier()
>> right before the new effective_xcpus is committed. The tasks in the
>> parent cpuset as well as its other children will be updated if its
>> effective_cpus is changed.
>>
>> A new test case is added to test_cpuset_prs.sh to test this patch.
>>
>> Fixes: e2ffe502ba45 ("cgroup/cpuset: Add cpuset.cpus.exclusive for v2")
>> Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
> 
> Thanks for reporting this bug. Yes, the current code doesn't handle expansion of parent effective_xcpus correctly. I would prefer to handle it inside update_parent_effective_cpumask() and try to minimize partition related changes in update_cpumasks_hier(). I have posted an alternative patch for your review. Let me know how you think about it.
> 
Thanks for the alternative patch.

Well, I am still learning how you approach this whole series of
problems.

One more thing I found yesterday: neither the current code nor my
patch runs the housekeeping check when a valid child partition gains
CPUs from its parent, e.g. when its parent expands the exclusive
CPUs. With nohz_full, an isolated child partition can take over the
last housekeeping CPU. I verified this on a nohz_full=1-7 boot.

I handled it roughly like the diff below. Please take a look and see
if it is worth handling together in this series.

@@ -2142,12 +2142,28 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 				deleting = !cpumask_empty(tmp->delmask);
 			else
 				part_error = PERR_NOTEXCL;
+		} else if (cpumask_andnot(tmp->addmask, tmp->delmask,
+					  cs->effective_xcpus) &&
+			   prstate_housekeeping_conflict(cs->partition_root_state,
+							parent_prs,
+							tmp->delmask, NULL)) {
+			/*
+			 * A valid partition may be able to claim more CPUs
+			 * from its parent, e.g. when its parent expands the
+			 * exclusive CPUs. The newly computed effective xcpus
+			 * may not have been housekeeping checked before.
+			 */
+			part_error = PERR_HKEEPING;
+			adding = cpumask_and(tmp->addmask,
+				       cs->effective_xcpus,
+				       parent->effective_xcpus);
 		}

I have something urgent at hand today, so I will get to your patch a
bit later and run it through the test cases I have, including the
isolated_cpus accounting case I mentioned in my previous reply.

Thanks,
Guopeng

