Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA21386C20
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 03:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786418752; cv=none; b=nYLtuhHAhBHxGFcYYXS7vvm2pWNuQGCT7xoxxtyPVKjvSJB0qgKiW0EBZlpto0rPHukXH/gQBcMdajpIoGsQzuWQO8Pm6/nTKCDBfuewcqZvpkXZ0D3fMr6uGUI4iHbYNQLsOz5zMBIsDVRfSORJEHgipUt9EDtm4S6+tDAtw9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786418752; c=relaxed/simple;
	bh=kECOHwHKQgh4B5VkySFLF0/IRGMolKmIBslP/P0gRqY=;
	h=Subject:Date:References:From:Mime-Version:Cc:In-Reply-To:
	 Content-Type:Message-Id:To; b=AW2Cu2zd2mAq+bRdT0q2wqsGCoynMHSzfGYR9jGXQrfE8bMmxYsM/xFCFMLLIOjwPN+DmporEYWL8KogqzZTKzqcLpVh1puIoBgBJUeAVtevR/CRDwv/Vjkzjw00g21knUMJopS6j9NCng2Tcod4RwZqBXwVY8LRwrxRydKmML8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=e80+QHnb; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="e80+QHnb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1786418740; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=qPR1rYC4fKK5DIdoWCF2oZpyWzNVREt+yryVJfl8CQQ=;
 b=e80+QHnbx8eOflKgcY0jDFPReN+Q1CkFZVdGrEeaAH8gqMPN+JkpiyYtrLbiAbMSg7L0T8
 sAZB+VHAA/G1JGpY6aBoQ55SPbu6RGM33HHPnvuPChiz7OMiCu/VlVYD7gyCfbSA4kXBBW
 4h72K2prsKKOBUiD8lJxI13evV1Vo4Bgjfk0xVdp19innxgtPWhVp5sadKJiNTX9wZ2+W7
 gJXDB9zSpr5bwP8/pb6zdmS2/hYYzagOt8yrVyaDyGlUou6GcBoytZNMAoyV7X81GZxOvg
 g1tHVRTysFc9/Kb6+CxBxpuKomNAFoeVuCvujxcpyumvfmJdgXMa+dwc+jBUrg==
Subject: Re: [PATCH 2/2] selftests/cgroup: Preserve CPU hotplug write errors
Date: Tue, 11 Aug 2026 11:25:22 +0800
References: <20260809082111.3827531-1-qirui.001@bytedance.com> <20260809082111.3827531-3-qirui.001@bytedance.com> <1ddd2e4a-ef12-4e9d-b589-28ddb4f46fb3@redhat.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Cc: "Ridong Chen" <ridong.chen@linux.dev>, 
	"Johannes Weiner" <hannes@cmpxchg.org>, 
	=?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	"Shuah Khan" <shuah@kernel.org>, <cgroups@vger.kernel.org>, 
	<linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Lms-Return-Path: <lba+26a7a9632+bd6603+vger.kernel.org+qirui.001@bytedance.com>
In-Reply-To: <1ddd2e4a-ef12-4e9d-b589-28ddb4f46fb3@redhat.com>
User-Agent: Mozilla Thunderbird
Content-Type: text/plain; charset=UTF-8
Message-Id: <45c558ac-8397-46a7-b3c9-755f272be685@bytedance.com>
Content-Transfer-Encoding: 7bit
To: "Waiman Long" <longman@redhat.com>, "Tejun Heo" <tj@kernel.org>

On 8/10/26 10:53 PM, Waiman Long wrote:
> On 8/9/26 4:21 AM, Rui Qi wrote:
>> The cpuset partition root state selftest checks several CPU hotplug
>> transitions. If writing to a CPU online file fails, the helper still
>> runs pause afterwards and returns the status of pause instead of the
>> failed write.
>>
>> This hides the real hotplug failure and can make later checks run
>> against expectations for a transition that never happened. Move the
>> write before the bookkeeping and return when it fails, so callers can
>> observe the hotplug error and the test does not record a CPU as offline
>> unless the offline operation actually succeeded.
>>
>> Fixes: a8c52eba880a ("kselftest/cgroup: Add cpuset v2 partition root state test")
>> Signed-off-by: Rui Qi <qirui.001@bytedance.com>
> 
> I am aware that on x86-64, cpu0/online may not exist. Other than that, 
> under what condition will the write fail as only root is allowed to run 
> the script?
> 
> Cheers,
> Longman

Hi Longman,

Right, the failure I wanted to preserve is not the normal permission
case. Running as root only gets us past the sysfs file permission check;
the write can still fail in the CPU hotplug path.

For example, cpu_down() can return -EBUSY when trying to offline the last
online CPU, when CPU hotplug is temporarily disabled, or when offlining
would leave no housekeeping CPU. cpu_up() can also fail if the CPU is not
possible/present, if hotplug is disabled, or if the CPU is not bootable
under the current SMT control state. Arch or registered cpuhp callbacks
may also reject the transition and return an error.

The current helper hides all of those cases because it does the write and
then calls pause(), so the function returns the status of pause rather
than the failed sysfs write. It also updates OFFLINE_CPUS before knowing
whether the offline request succeeded. So this change is mainly to avoid
continuing the test with bookkeeping that says a CPU was offlined when the
kernel actually rejected the hotplug operation.


Thanks,
Rui

> 
>> ---
>>   tools/testing/selftests/cgroup/test_cpuset_prs.sh | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
>> index 16c38eb11e63..a2f7208633bc 100755
>> --- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
>> +++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
>> @@ -412,6 +412,7 @@ write_cpu_online()
>>   	CPU=${1%=*}
>>   	VAL=${1#*=}
>>   	CPUFILE=//sys/devices/system/cpu/cpu${CPU}/online
>> +	echo $VAL > $CPUFILE || return 1
>>   	if [[ $VAL -eq 0 ]]
>>   	then
>>   		OFFLINE_CPUS="$OFFLINE_CPUS $CPU"
>> @@ -421,7 +422,6 @@ write_cpu_online()
>>   					sort | uniq -u)
>>   		}
>>   	fi
>> -	echo $VAL > $CPUFILE
>>   	pause 0.05
>>   }
>>   
>> @@ -493,6 +493,7 @@ set_ctrl_state()
>>   			eval $COMM $REDIRECT
>>   			;;
>>   		    O*) VAL=${CMD#?}
>> +			COMM="write_cpu_online $VAL"
>>   			write_cpu_online $VAL
>>   			;;
>>   		    T*) COMM="echo 0 > $TFILE"
