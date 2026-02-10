Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D423F38B7AE
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 18:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770749604; cv=none; b=kr2rqATL4ShxFi2dlUul4P2A15vyG4JXvwNsmPG11MtCDCJTVtah7CeWNBpU2ulU3neuD5LcJJD8DeG+7/Rhat5ZvJcIo3oD2Ac5NulLfcddDu/+logFJXL1BTT2/NdGZR9wPIqMLo7c0W38yr9X9lfmZ9o1JOFsQhB6YCLSoXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770749604; c=relaxed/simple;
	bh=ykjrQDv3pQtbl1gvs1znR3inIiH9de5tevEToQRU/qg=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YDjpiQ/NU81Ib/NwSKH2NWqycYZRkJ2WTXC76agLI0eCczO6UabIsR8f9epfMf4q7DxW0B9kNyr3xtvzWIXVoaN1IT6RV10Nzma+aRRmW8CU/YP1KdVoGkGiySzxu2XH+UrszQPgjrpeJvyCpffs/Xr01or/HC+Bdm2PvW/EgXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O3FggLN/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jFQMHz2G; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O3FggLN/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jFQMHz2G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770749601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s/eGIcJVf8/JKYHo3YPe7ZsYm/3Cem/DaAGFEvHE21M=;
	b=O3FggLN/FlHv7Y/TmWb66Yb3ZM7DIsRDTzIjLml7ucZzCdd+HErVP+GwBAlYLqyHoFVlwP
	Q40HlQYv7GNQEIfRWgV2SjPO6NZnHrU+sZ8/E9BXZAT0W7Ywg8K8LfIPRYE039I+LRMJAe
	SQaJX+qUCrDiMJCbNc+525CdPGe0mtQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-O0jKyx92NLKSWO4DYx26OQ-1; Tue, 10 Feb 2026 13:53:20 -0500
X-MC-Unique: O0jKyx92NLKSWO4DYx26OQ-1
X-Mimecast-MFC-AGG-ID: O0jKyx92NLKSWO4DYx26OQ_1770749600
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52f89b415so305864685a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 10:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770749600; x=1771354400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s/eGIcJVf8/JKYHo3YPe7ZsYm/3Cem/DaAGFEvHE21M=;
        b=jFQMHz2GUrsjBuK1ipUhybqZs6rCwpdqdhteoUOqJKQ8B2Eq0hXcmG6jab1RQ7iPKr
         bnwoKyvCyzsBWk3s/t30mCMvI97S04BVCn7eQGEIhbqckqxU/pOTXcCZLiJme8qKO4VX
         GC2YxHFvOJGoK6jWzg2Qn87wqkDosMT1B/XhnWpeD4e+BTAgNxxpIXeQffOIGGw2WdwA
         CPy06gGNFm23eNEyZmEodOa6M79uNupWQjGpKoc8bkYW2bzOr1e9HYstz7IA+oH4bU80
         Wavvulgt7BUIp1uzSKLJSvNgUNXpvtaKEp9TYsaGb9qJj4NS+ZJyh6exDYwH+Qv87fZ8
         Gzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770749600; x=1771354400;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s/eGIcJVf8/JKYHo3YPe7ZsYm/3Cem/DaAGFEvHE21M=;
        b=G02LdApq757OW0joV23NO2L3dNCO+9P3plQ4gf2kp/ZIPEOmEEBi0Nk+XZHMySA2MD
         XNqEtITqU4UtoH0ootzqRSa/jNayMhS4FMPYJ3W3NEy+yykABCxYgOrWgWVng2BwhqrB
         k6k7xebog9wzJjbKcIbutvhT4Nad29R6lZ6F15yDnzUq1e9yCA34/MDGbqRuG09ufs73
         DkXYB1JnuboJ65sgrLTtURaPzh7xhps4IowaK78jI5bbU9+XOKu5ecnpkj9HgYnBVtpw
         QCfDKuGD+KjWyUALhUMLCc2r99FnlYzKxK08pRvflSm4K5yVInIgu2GMBhi9R8wIFW93
         veaw==
X-Forwarded-Encrypted: i=1; AJvYcCUXyQqN6ghoVuX9efKWUerJ6psw7slvI775jwG/Wan40k7pe67cUZstAKhStkazmOpANkxyFLw1nAiOWQO4d0s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw79GABz+SX72MY3pN8shXo+Y4EuCG4e5uGNc/VDsQ5NOsbPQj4
	OQRu3aDJ5g6atBcVWo3Fzw+GzRFYIgRf7h5mXiHPJwRIaU4BT36qQdQ4zRS70M3Mk6HlfP5dF3z
	bfN4/m6+Ogk+KSwDikhgv+Tei1SQ7iCSCEGzhtAFiyQ+lIoSo6daSIqLKhzOkM+vb6Zxwxw==
X-Gm-Gg: AZuq6aLMxhmItmbLLmgifVa2xwrFDxESe+vXzcMYRQoUa/yZBTEu20Ol8Q0HJPpUMs7
	wEqHtG22G3O90BN6n4pb7shAYZxbXDna6Q+s7Dz8XCnHaEt+bArSTNkSaMJE4QAiD0IskiCvWvj
	UuT61W2cEbM5CuWH7wiaNS0AtlkFSEk66N/lsXbDnnUuUJcu1T+FOMz7UGvGlgzICcUW5svWfOP
	xclhG68m4biCMJLkkSHpx+TjOQ/xGKHuVvox4XR4SL4sbXxMkI+vL5BP5qOU7BNRnQAVJl+8j8J
	kCFPqhxA8GteB03o5kOaH9ls34QVas0q0DZEsKqlTCwn6kOJByZgpHwDcJQpeNzE4XavfpAovIT
	NlssZW4v1liObGRZSc0jt0pSWOz2HklGn/pirgI8I+MqNXiV3gWmpYGZPhjfK0kG+KT4b
X-Received: by 2002:a05:620a:bc2:b0:8b2:e922:5297 with SMTP id af79cd13be357-8caf0489e71mr2229207685a.21.1770749600098;
        Tue, 10 Feb 2026 10:53:20 -0800 (PST)
X-Received: by 2002:a05:620a:bc2:b0:8b2:e922:5297 with SMTP id af79cd13be357-8caf0489e71mr2229204685a.21.1770749599658;
        Tue, 10 Feb 2026 10:53:19 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf7aefb75sm1088129685a.22.2026.02.10.10.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 10:53:19 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <2f4abe26-19f9-4550-ac0e-16c41d18c7fb@redhat.com>
Date: Tue, 10 Feb 2026 13:53:17 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/for-next v4 2/4] cgroup/cpuset: Defer
 housekeeping_update() calls from CPU hotplug to workqueue
To: Frederic Weisbecker <frederic@kernel.org>, Waiman Long <llong@redhat.com>
Cc: Chen Ridong <chenridong@huaweicloud.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>,
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260206203712.1989610-1-longman@redhat.com>
 <20260206203712.1989610-3-longman@redhat.com>
 <aYZrJaIIbTX4E-nO@pavilion.home>
 <d1e4b070-9438-4152-847e-ef6ff6aa7820@redhat.com>
 <aYtSyCb1EioSuDep@localhost.localdomain>
Content-Language: en-US
In-Reply-To: <aYtSyCb1EioSuDep@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/10/26 10:46 AM, Frederic Weisbecker wrote:
> Le Sat, Feb 07, 2026 at 09:00:45PM -0500, Waiman Long a écrit :
>> On 2/6/26 5:28 PM, Frederic Weisbecker wrote:
>>> Le Fri, Feb 06, 2026 at 03:37:10PM -0500, Waiman Long a écrit :
>>>> The update_isolation_cpumasks() function can be called either directly
>>>> from regular cpuset control file write with cpuset_full_lock() called
>>>> or via the CPU hotplug path with cpus_write_lock and cpuset_mutex held.
>>>>
>>>> As we are going to enable dynamic update to the nozh_full housekeeping
>>>> cpumask (HK_TYPE_KERNEL_NOISE) soon with the help of CPU hotplug,
>>>> allowing the CPU hotplug path to call into housekeeping_update() directly
>>>> from update_isolation_cpumasks() will likely cause deadlock. So we
>>> Why do we need to call housekeeping_update() from hotplug? I would
>>> expect it to be called only when cpuset control file are written since
>>> housekeeping cpumask don't deal with online CPUs but with possible
>>> CPUs.
>> It needs to call housekeeping_update() only in the special case where there
>> is only one active CPU in an isolated partition and that CPU goes offline.
>> In this case, the partition becomes disabled that causes change in the
>> isolated CPUs. I know this special case shouldn't happen in real world, but
>> I do have test case to test that.
> But why is that needed? This isn't changing the mask of domain isolated CPUs.
> Only their onlineness. I mean timers, workqueue, kthreads all have their
> hotplug callbacks able to deal with that already.

The current behavior is to remove the CPUs from the cpuset.cpus.isolated 
when an isolated partition is invalidated. It doesn't currently 
differentiate if that is from hotplug or by writing to the cpuset 
control files. I am planning to handle handle hotplug differently so 
that it won't need to change cpuset.cpus.isolated.

>
>> Theoretically, we can add code to handle this special case to keep this
>> offline isolated CPU in a special pool without changing isolated_cpus and
>> hence  HK_TYPE_DOMAIN cpumask. In this way, we shouldn't need to call
>> housekeeping_update() from CPU hotplug. I will probably do that as CPU
>> hotplug will be used when we make HK_TYPE_KERNEL_NOISE cpumask dynamic in
>> the near future.
> That doesn't look necessary.

Yes, I think we can use the existing infrastructure to handle it without 
the need to add a special pool.

Cheers,
Longman

