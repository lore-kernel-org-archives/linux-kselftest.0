Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794291867;
	b=lYiLJoBbr/akowS/N0rBZZYF9q2SMMX2BfB1EXv4vmiGDEzN6Ldaf8SAtyCZaVemhiJ+
	 lfp2KB/bna+19RFknTWZCnTW5t17an3Qukixx7AIPYtdgocaP0Fz4yx5V25arnP7uwSE3
	 VeSxWDQKu9g4tnHEZM1a7wmGSeK9fcb1ACZlAhiqmzTHcxb6Quh4eE43XmCWYTsU/WSDk
	 Jlas0pRuB2euasFizMAFm6rd4EdeZ7BjL/4s5x9mD4LM3gba2RagWKuFX3XpUGpqyr9h/
	 KlF3+VpOAcFN478SYwIiWb/FRwOfOzlZcUsbkeu+uXzMJawuNYP8CmO49R4Uwq13Pzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291867;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BL+W2T/2cuMST/SB8p0zoQbSb3TF01znFaP7YILvqJQ=;
	b=R2ItP7ZPIwEkEYHl1loZTw9IwbyoGucMrX/2hgoOenB0L5h61I8KxBS+VB5j2vSNFPPP
	 jjuiAEOvt5K2HnU7L507/VOM/KkAc3nHRxoZy6/TdS2wpB8Kl52K/gvV5hBpyR1nVpyuF
	 FKmAKGjc1re3eMoPxcgqaIDXkRUYD6H/5hM10YXpdG/SIlmN5jUHY6fo+jtoVUiRdCgWZ
	 Tr7RaOkgeC9k6iVOy9xm1hwqczHCRWW0sNfhF8D3gaCJXl6sp/N4vNxVa3wm7VIq9c9VX
	 0CvAUmdkdyhBls5EoxZeBsAp/jE4uTNQzWXE82KLajRN/lvs8wubjVfwn9IIjw5/diw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u7Ozoluy;
	arc=none smtp.remote-ip=95.215.58.2
Received: from mta1.migadu.com (out-2.mta1.migadu.com [95.215.58.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3502606A321
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 06:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3502606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u7Ozoluy
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7ght3jiINuFCMHMQNMsTCNCFy1DQnY7GC46bKdA/Shk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794291855; v=1; x=1794896655;
 b=u7OzoluyaEZu/1fB41vNlYs5mPIqZG1ptnG6WIv3AEo6L3+dk6Da+n/w3jZE5PLCZXFEv+Kk
 Sv2d+NgBbKEGka+cYl5zIBinDqYPZqu8zH5FmTssDGa0X/WGxKGO0/8z79hJhy3Bn8gk7Bs5GcH
 FW0U/UlTP8VqE2Ps92rE9whs=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9578d8396b621a0b;
	Tue, 10 Nov 2026 06:24:15 +0000
X-Mizu-Trace-ID: 9578d8396b621a0b
X-Migadu-Flow: FLOW_OUT
Message-ID: <d7fef280-a076-42c6-a6c6-cf355bbbc29f@linux.dev>
Date: Tue, 10 Nov 2026 14:24:07 +0800
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
Subject: Re: [PATCH v3 3/4] cpuset: settle isolation state when CPUs are given
 back to parent
To: Guopeng Zhang <guopeng.zhang@linux.dev>, Waiman Long
 <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: Chen Ridong <chenridong@huawei.com>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>, Guopeng Zhang <zhangguopeng@kylinos.cn>,
 Ridong Chen <chenridong@xiaomi.com>
References: <20261107120100.3587595-1-ridong.chen@linux.dev>
 <20261107120100.3587595-4-ridong.chen@linux.dev>
 <c2ab6077-750e-48cb-bfd0-18882c807de5@linux.dev>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <c2ab6077-750e-48cb-bfd0-18882c807de5@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/9/2026 11:20 PM, Guopeng Zhang wrote:
> 
> 
> 在 2026/11/7 20:00, Ridong Chen 写道:
>> From: Ridong Chen <chenridong@xiaomi.com>
>>
>> partition_xcpus_del() only updates isolated_cpus when the partition that
>> gives back the CPUs has a different state than its parent. CPUs that were
>> further distributed to descendant isolated partitions are not taken into
>> account, so isolated_cpus_release() has to be called afterwards in
>> several places to walk up the ancestors and fix isolated_cpus.
>>
>> Make partition_xcpus_del() always set the isolation state of the given
>> back CPUs to the state of the parent that receives them. As the
>> effective_xcpus of a partition covers the CPUs distributed to its
>> descendants, the isolation state of those CPUs is settled at the same
>> time. Boot-time isolated CPUs are still preserved by isolated_cpu_update().
>>
>> compute_partition_effective_cpumask() invalidates a child partition
>> without going through partition_xcpus_del(), so do the same there: the
>> CPUs of the invalidated child take the isolation state of its parent.
>>
>> As the parent may be shrunk and its effective_xcpus not updated yet,
>> only do so for the CPUs the parent still owns. This is to keep the
>> isolation state correct for now, the in-place invalidation here will be
>> removed later in the partition rework.
>>
>> isolated_cpus_update() assumes the old and new states are different,
>> which no longer holds now that partition_xcpus_del() proceeds regardless
>> of the states. Drop its @old_prs argument and the WARN_ON_ONCE() so that
>> it simply sets the isolation state of the given CPUs, and use it
>> everywhere. The state check in partition_xcpus_add() is dropped as well,
>> as setting the state is a no-op when the states are the same.
>>
>> isolated_cpus_release() is no longer needed and is removed.
>>
> 
> Hi Ridong,
> 
> Would it be worth briefly mentioning in the commit message that this patch also fixes the issue described here?
> 
> https://lore.kernel.org/all/20261105130344.664336-4-guopeng.zhang@linux.dev/
> 
Thanks, Guopeng.

As I replied to Longman, I will add it.

-- 
Best regards
Ridong

