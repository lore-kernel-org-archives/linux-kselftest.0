Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292694;
	b=JBZ+VBGMrse2n42YQa6YgG3VwgQZ1yvcvZNTQ6BLl7O5EBs9RSUCewGOO2MLks8zWi+6
	 QuA9/iZtrWFPkDIxK+pGyGUl1QvlVVkHuqOMW2J4zfCVVWkjb9lc2zx6YgMsEZBiDDbds
	 Zm2cZunBsePZDLIU/LqgOCXHIOZWUjTm5WmQv5aHconcSJsPaUl8V8+NBnMrQ4XPo9KnT
	 2iWb5cKaNHuW7+RHuJ7Jfyl/VcvAj0qr8qiO/2ldMhO4+WQS7xNkNSbteBArbPbs6wYlC
	 wNcFNT3BtnE/JoiG676qEH7tLSHE4vlUBSRGySuDeOyySn9cyfavQbU6ZdWvBJGm5/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292694;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=uQfJDAzqv74OQj9PgNOrl2GZBw4mpbzbCmwJl/TcAx8=;
	b=ouL/xgig8dYixi1ssf2mySvz/B7if2ro757BmEG3zuqtC2e686Bd4aHT80hJdw+Ab1eX
	 VGZAdqVEqM/NIEbhynl02xXTP0CHRBp9xntSCU1ARnjUR+7nxznlA1XXE6JIxp80fouws
	 TElNOR5+1Y9w8dkjL14sD7u5w+aN4yXYUS0py8jVoeTN90NhR5LboSeZT6WAGuzboqBBQ
	 OMXyIIYJ5RTb2BjPkBWfoAhws3i99AJV8oKCWcHRK86QjJmS2EUPfRvVMDKftXJhzT0OM
	 TbXLr5iqYiwDlfQbcyoUpiRG+1rMtNWgmjtLXmp4O31Osh/2NxeI/psZq5NaP+HUbsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="q6j/KNAO";
	arc=none smtp.remote-ip=95.215.58.173
Received: from mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D37606A325
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 06:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13D37606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=q6j/KNAO
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1MH47SrJNKyrBlImZVUKfskfdpHDxxkHzS/Ye+6eADU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794292691; v=1; x=1794897491;
 b=q6j/KNAOpCDbT4nm7weTjZHADonNjBKLBCX5P7Od22VxLV6IfVe5/HqDFMdLyWe/Fb0yWvxm
 H+eyIHPZLFwpyfMMh6AoxXkvahHdL9PJUNRC10zOGZAwzplOYXJTO378nlsSAExW1ZqwW4o9juD
 zNxvUVGXDT8FCRm20FkwBNPE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2597cb3cd0548d62;
	Tue, 10 Nov 2026 06:38:10 +0000
X-Mizu-Trace-ID: 2597cb3cd0548d62
X-Migadu-Flow: FLOW_OUT
Message-ID: <4d46e469-e3b8-4ea6-a85d-b2aa3d750210@linux.dev>
Date: Tue, 10 Nov 2026 14:38:03 +0800
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
To: Ridong Chen <ridong.chen@linux.dev>, Waiman Long <longman@redhat.com>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: Chen Ridong <chenridong@huawei.com>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>, Guopeng Zhang <zhangguopeng@kylinos.cn>,
 Ridong Chen <chenridong@xiaomi.com>
References: <20261107120100.3587595-1-ridong.chen@linux.dev>
 <20261107120100.3587595-4-ridong.chen@linux.dev>
 <c2ab6077-750e-48cb-bfd0-18882c807de5@linux.dev>
 <d7fef280-a076-42c6-a6c6-cf355bbbc29f@linux.dev>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <d7fef280-a076-42c6-a6c6-cf355bbbc29f@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/11/10 14:24, Ridong Chen 写道:
> 
> 
> On 11/9/2026 11:20 PM, Guopeng Zhang wrote:
>>
>>
>> 在 2026/11/7 20:00, Ridong Chen 写道:
>>> From: Ridong Chen <chenridong@xiaomi.com>
>>>
>>> partition_xcpus_del() only updates isolated_cpus when the partition that
>>> gives back the CPUs has a different state than its parent. CPUs that were
>>> further distributed to descendant isolated partitions are not taken into
>>> account, so isolated_cpus_release() has to be called afterwards in
>>> several places to walk up the ancestors and fix isolated_cpus.
>>>
>>> Make partition_xcpus_del() always set the isolation state of the given
>>> back CPUs to the state of the parent that receives them. As the
>>> effective_xcpus of a partition covers the CPUs distributed to its
>>> descendants, the isolation state of those CPUs is settled at the same
>>> time. Boot-time isolated CPUs are still preserved by isolated_cpu_update().
>>>
>>> compute_partition_effective_cpumask() invalidates a child partition
>>> without going through partition_xcpus_del(), so do the same there: the
>>> CPUs of the invalidated child take the isolation state of its parent.
>>>
>>> As the parent may be shrunk and its effective_xcpus not updated yet,
>>> only do so for the CPUs the parent still owns. This is to keep the
>>> isolation state correct for now, the in-place invalidation here will be
>>> removed later in the partition rework.
>>>
>>> isolated_cpus_update() assumes the old and new states are different,
>>> which no longer holds now that partition_xcpus_del() proceeds regardless
>>> of the states. Drop its @old_prs argument and the WARN_ON_ONCE() so that
>>> it simply sets the isolation state of the given CPUs, and use it
>>> everywhere. The state check in partition_xcpus_add() is dropped as well,
>>> as setting the state is a no-op when the states are the same.
>>>
>>> isolated_cpus_release() is no longer needed and is removed.
>>>
>>
>> Hi Ridong,
>>
>> Would it be worth briefly mentioning in the commit message that this patch also fixes the issue described here?
>>
>> https://lore.kernel.org/all/20261105130344.664336-4-guopeng.zhang@linux.dev/
>>
> Thanks, Guopeng.
> 
> As I replied to Longman, I will add it.
> 

Sorry, I just realized that my comment duplicated Longman's. I had some email connectivity issues and only just received the review emails.

Thanks for the clarification!

Cheers,
Guopeng
