Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792788350;
	b=CM+g+QzB3zaD/gvKl47TJ/svM6VN7rAgg+DoPn6yZuxQHlfgRmXDs63doTEwT8EP2gvm
	 ikO9Bts2CcbWO2IdjECFiIDyrNUidfqEctKeV2tmrV/6T8m/Y/izgjAxvOz6hRWsRJ3cI
	 Z5RM0/GwvOtzkLlnn1scSsucl92NQzb8Oo5y2laycbI0syjWppxqDwStxnvPkUKCM3nHS
	 JoTN4Bx2WMIw4YkF975n66Z7TiXufUcLVaRHW0HVAapKRaRcjxsV7d8nvX6SaEmkUDcPg
	 h+vRroI0M4pjcXW3EjF9P6kZ4radNlLgq38eVLeXiBNzshTRjPo2AKogKnxf3tyCzcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788350;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=bFFffzUvgnJue3yyaiYiiCh8qM+TcfI9WgeY9k8g54M=;
	b=HD9xN4ys9cPEcgAK/0E/efrXyRntLMUxA/Vxfh7k/rcY0rzAue/yFCouSr+zwlb+rJW1
	 QfdApGAXduNPiL3V+3iCq4nbmqhLhc8K+/D0PLqOOl5/Z0frXVgINtuRsombGLdQ/EJ/p
	 R6am4OqszGfE66zUn5QDX6aV6zN0kwt965furykH+qx1UHbYY5VKIDtDiU8Y6+T+22PMi
	 BSDo7+BvHjpl0RnzEGg04zaryROZX1K4rqKsZHCuVwr4LeBLRxBtfeJ4Y49X4xvOh/ejF
	 CQ6JOCdHkGgBUGwHQKFN7bDhAHG+7p0U/NJrpjZ8g4SGW6OmTS1fAWmKVlwp+m1s44w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cE+saJg2;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED41B606A322
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 20:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED41B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cE+saJg2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792788349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bFFffzUvgnJue3yyaiYiiCh8qM+TcfI9WgeY9k8g54M=;
	b=cE+saJg2EB7ra5E/CUQA3ryzmZ8hcX87ZdfQ1CkuTKdemzdlcZ2YM68hsSwXHqM5CpuQ8D
	CHb+KeNds4S18b9+bJdM/ZMdK/Ki6oB8pdopN4Nvkazy83ELcYBzrbID3z+5e4ptkgKrv4
	J9WAZ0etB4ZmN6smdhXmqgTaH3Eqjfc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-55-75Gnvlz7Pc20nvVELP8pTA-1; Fri,
 23 Oct 2026 16:45:45 -0400
X-MC-Unique: 75Gnvlz7Pc20nvVELP8pTA-1
X-Mimecast-MFC-AGG-ID: 75Gnvlz7Pc20nvVELP8pTA_1792788343
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8F2AD1800841;
	Fri, 23 Oct 2026 20:45:43 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 060071800446;
	Fri, 23 Oct 2026 20:45:41 +0000 (UTC)
Message-ID: <8c8f27eb-26af-406e-9766-537dbe9c173a@redhat.com>
Date: Fri, 23 Oct 2026 16:45:41 -0400
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
To: Guopeng Zhang <guopeng.zhang@linux.dev>,
 Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261022031643.1351877-1-longman@redhat.com>
 <20261022031643.1351877-3-longman@redhat.com>
 <c65208d9-aba6-4e9a-affa-4f7cd8794a0c@linux.dev>
 <a3caf0f6-da89-4b5c-b80f-3baf6c82a2c4@redhat.com>
 <776306f8-2200-486b-8c43-2b5fd9b5eeb5@linux.dev>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <776306f8-2200-486b-8c43-2b5fd9b5eeb5@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 10/22/26 9:53 PM, Guopeng Zhang wrote:
>
> 在 2026/10/22 23:00, Waiman Long 写道:
>> On 10/22/26 9:45 AM, Guopeng Zhang wrote:
>>> Hi Longman,
>>>
>>> 在 2026/10/22 11:16, Waiman Long 写道:
>>>> Since the introduction of cpuset.cpus.exclusive in commit
>>>> e2ffe502ba45 ("cgroup/cpuset: Add cpuset.cpus.exclusive for v2"), a
>>>> compute_effective_exclusive_cpumask() helper which is later renamed to
>>>> compute_excpus() is added to compute the effective xcpus of a partition
>>>> root. However update_parent_effective_cpumask() is not updated in all
>>>> proper places to use the new helper to check if a given cpuset should
>>>> remain a valid partition root. This can cause a cpuset to incorrectly
>>>> remain a valid partition root even if no effective xcpus is left.
>>>>
>>>> Fix that problem by using compute_excpus() to compute the effective xcpus
>>>> into delmask in all cases except partcmd_disable and partcmd_invalidate
>>>> and use it for tasks_nocpu_error() check as well as checking its
>>>> emptiness. This enables us to catch invalid partition root more
>>>> accurately in update_parent_effective_cpumask().
>>>>
>>> I re-tested the repro from the link below on top of this series
>>> (applied on cgroup/for-7.4-fixes), and it still fails:
>>>
>>>     https://lore.kernel.org/all/20261010075947.333549-3-guopeng.zhang@linux.dev/
>>>
>>>     cd /sys/fs/cgroup
>>>     echo +cpuset > cgroup.subtree_control
>>>     mkdir A
>>>     echo 0-7 > A/cpuset.cpus
>>>     echo 0-7 > A/cpuset.cpus.exclusive
>>>     echo root > A/cpuset.cpus.partition
>>>     cat A/cpuset.cpus.partition
>>>     echo 1 > A/cpuset.cpus.exclusive
>>>     cat A/cpuset.cpus.partition
>>>
>>> The last command still shows "root invalid (Parent unable to distribute
>>> cpu downstream)".
>>>
>>> In this case compute_excpus() returns the stale user mask unchanged.
>>> user_xcpus() is gone from update_parent_effective_cpumask(), but the
>>> dependency just moved one level down: the new code calls
>>> compute_excpus(cs, tmp->delmask), and its first line is
>>>
>>>     cpumask_and(excpus, user_xcpus(cs), parent->effective_xcpus)
>>>
>>> Here user_xcpus(cs) is cs->exclusive_cpus, which still holds the old
>>> 0-7 when compute_excpus() runs: update_exclusive_cpumask() publishes
>>> cs->exclusive_cpus only after partition_cpus_change(). Nothing corrects
>>> it either - the sibling trim is skipped as exclusive_cpus is non-empty,
>>> and for a direct child of the root cpuset the intersection with
>>> parent->effective_xcpus is a no-op. So the stale 0-7 mask still reaches
>>> tasks_nocpu_error() and PERR_NOCPUS is set again. Please point it out
>>> if I got the analysis wrong.
>>>
>>> I have rebased my fix on top of this series and the partition recovers
>>> correctly with it applied. Should the fix be folded into this patch,
>>> or is there a better way to fix it? Happy to hear your thoughts.
>> You are right. My patch series won't fix this particular issue. However, converting an invalid partition back to a valid one is done on a best effort basis. There is no guarantee that it will always happen. Just echo "root" to "cpuset.cpus.partition" again will make it valid again. So it is not a real bug from my point of view. It is just a nice to have feature.
>>
> Thanks for the explanation. This helps me better understand the
> intended behavior of partition recovery.

I did find the reason why your test case isn't working. I have made some 
adjustment in patch 2 which should make your test case work now with the 
v2 series.

Cheers,
Longman

