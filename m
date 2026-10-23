Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.208
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792719702;
	b=mqbTAQwgOXfTqtkHYRqNvNcbbvehsWnoHewzQwdEoAZ59MVUR5erSFhNTsDpVd3TVpb3
	 TEqsNKEH/h+eT5IxqEpDiatyVM1EShJrlSftZjOy2cGzsQeHzHV5XMZr5Gtn3xUAUMpQ+
	 DfyDiNJsocgCE1h5J8Ybxp2OIXffTxoMN5YCLCizxaIKuSc9/Alri5jerEvIvvFfwGDop
	 jTv/emNB1De4sqLUSYZyBFHHmFuxxiHDfIHll8dDKiU0u0uG2aWePr/U/7E2foXnnJdR6
	 cdXZxqQULG+bBVPQ1uhZgrUi9rKerRuzKPpiHTnMkdxnjxVX5ZhPocB/BtPKPDqQdFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792719702;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=hP0KBA+rRy4x64wgKIjta1bZFthYN4mc2kQX0835edk=;
	b=MUAabH2E2AxU8sJNDxkOIG2k3aIointWdqOrG73VW9MDmY5XyJlJax+g+t8jcyCLJ+yF
	 CmZMNMLEr42SlPjCO+Ag1TJ3zonyaXmOLaYDKiAcl9OJcjtpYOy93Ik4mkV6Yyq10Ik4h
	 wkNbV2O2xqw72hEwXv+LVn7MFDfLqIf9AoykIeyX2+qsLXi5Duj1kVef+9zcb0o9mqu+/
	 u15xBwPAV+E4/JcKPtaSJEOyX16oOvLXyOEaVyJyXx5pNDPrbmz+Bsgw5RJ2fOvELLgmf
	 VyOwiekfUNH0rfbX4ttH2qkf152Own7uQj7jBZEF73paMCHXYiPKJqmdNzczL8Pze/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EhemhwrO;
	arc=none smtp.remote-ip=91.218.175.208
Received: from mta0.migadu.com (out-208.mta0.migadu.com [91.218.175.208])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BBC606A31B
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 01:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17BBC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EhemhwrO
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rWDElumkBOPy1a7EM5B02mSy46xW2Va/g+rFO2mrpTs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792719694; v=1; x=1793324494;
 b=EhemhwrOhTkpoHWeuqBav1b7ftCriTsbdky1jPosmDelsFpT67HCR+3FC8Be5Nk6f1jEbOVk
 ex3JvDhz5qqPWbx2RxNj7at0SIDPuJehpLXB6483oIWC95KaFZhY4mef+Nv2EHhkkzQArSwJwS1
 iOq/1g6wXq358//exoCEPx+Q=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f7e72994e1a7a8cb;
	Fri, 23 Oct 2026 01:41:33 +0000
X-Mizu-Trace-ID: f7e72994e1a7a8cb
X-Migadu-Flow: FLOW_OUT
Message-ID: <0f191ffa-450a-4b0d-b2b6-7d29149d7f13@linux.dev>
Date: Fri, 23 Oct 2026 09:41:29 +0800
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
Subject: Re: [PATCH-next 2/6] cgroup/cpuset: Properly compute effective xcpus
 in update_parent_effective_cpumask()
To: Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261022031643.1351877-1-longman@redhat.com>
 <20261022031643.1351877-3-longman@redhat.com>
 <c65208d9-aba6-4e9a-affa-4f7cd8794a0c@linux.dev>
 <00130aa2-2f85-4c4f-8283-acfa6df7cae5@redhat.com>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <00130aa2-2f85-4c4f-8283-acfa6df7cae5@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/22 22:47, Waiman Long 写道:
> On 10/22/26 9:45 AM, Guopeng Zhang wrote:
>> Hi Longman,
>>
>> 在 2026/10/22 11:16, Waiman Long 写道:
>>> Since the introduction of cpuset.cpus.exclusive in commit
>>> e2ffe502ba45 ("cgroup/cpuset: Add cpuset.cpus.exclusive for v2"), a
>>> compute_effective_exclusive_cpumask() helper which is later renamed to
>>> compute_excpus() is added to compute the effective xcpus of a partition
>>> root. However update_parent_effective_cpumask() is not updated in all
>>> proper places to use the new helper to check if a given cpuset should
>>> remain a valid partition root. This can cause a cpuset to incorrectly
>>> remain a valid partition root even if no effective xcpus is left.
>>>
>>> Fix that problem by using compute_excpus() to compute the effective xcpus
>>> into delmask in all cases except partcmd_disable and partcmd_invalidate
>>> and use it for tasks_nocpu_error() check as well as checking its
>>> emptiness. This enables us to catch invalid partition root more
>>> accurately in update_parent_effective_cpumask().
>>>
>> I re-tested the repro from the link below on top of this series
>> (applied on cgroup/for-7.4-fixes), and it still fails:
>>
>>    https://lore.kernel.org/all/20261010075947.333549-3-guopeng.zhang@linux.dev/
>>
>>    cd /sys/fs/cgroup
>>    echo +cpuset > cgroup.subtree_control
>>    mkdir A
>>    echo 0-7 > A/cpuset.cpus
>>    echo 0-7 > A/cpuset.cpus.exclusive
>>    echo root > A/cpuset.cpus.partition
>>    cat A/cpuset.cpus.partition
>>    echo 1 > A/cpuset.cpus.exclusive
>>    cat A/cpuset.cpus.partition
>>
>> The last command still shows "root invalid (Parent unable to distribute
>> cpu downstream)".
>>
>> In this case compute_excpus() returns the stale user mask unchanged.
>> user_xcpus() is gone from update_parent_effective_cpumask(), but the
>> dependency just moved one level down: the new code calls
>> compute_excpus(cs, tmp->delmask), and its first line is
>>
>>    cpumask_and(excpus, user_xcpus(cs), parent->effective_xcpus)
>>
>> Here user_xcpus(cs) is cs->exclusive_cpus, which still holds the old
>> 0-7 when compute_excpus() runs: update_exclusive_cpumask() publishes
>> cs->exclusive_cpus only after partition_cpus_change(). Nothing corrects
>> it either - the sibling trim is skipped as exclusive_cpus is non-empty,
>> and for a direct child of the root cpuset the intersection with
>> parent->effective_xcpus is a no-op. So the stale 0-7 mask still reaches
>> tasks_nocpu_error() and PERR_NOCPUS is set again. Please point it out
>> if I got the analysis wrong.
>>
>> I have rebased my fix on top of this series and the partition recovers
>> correctly with it applied. Should the fix be folded into this patch,
>> or is there a better way to fix it? Happy to hear your thoughts.
> OK, I will look into that again.
>>
>> Also, is the test case below worth adding here as well? Note that it
>> fails until the fix is in:
>>
>>      # An invalid local partition that took all the CPUs from its
>>      # populated parent should recover after its cpuset.cpus.exclusive
>>      # list is changed to a valid one.
>>      "C0-7:X0-7:P1  .      .      .     X1      .      .      .     0 A1:1|XA1:1 A1:P1 ."
> 
> This test case assumes that there are only 8 CPUs in the test system which may not be true in many cases. We need test case that will work no matter the system it is running on.
> 
You are right, I wasn't thinking clearly and missed that rule.

Thanks,
Guopeng

