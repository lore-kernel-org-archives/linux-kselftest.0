Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFD4378825
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 21:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771881079; cv=none; b=Iv2JRZ04Zl/Wwbm9bd5MZUcOimUl8SCgRystUd3I+O1RRBfOliLKD2lUg0VvtB3NfV5zpZAKIXGA52Oxni+AON7nL6Pi0bVOk9leALgq6fx5QCKYDp/ezoNE7ABNSLsc/eRiNjHUUdq7mh+njcVROW73SCUHWE67U9PxVXkp1hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771881079; c=relaxed/simple;
	bh=Oci7+8idGwL92JXFpoRCI+rH3TTmT7M0UKWqCffu+FE=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oQm3F3RiamwElLXWJqfq26k8C3pNebF+QWTp7v+0qFxMtOm++BrBhzH1ESrROWAv3G2BzWy3k+/Uo7Dpm50wBSr2Vw2DElwO/0u/Z/zasDlQPcLAy/Se8vDQc+4OvEgCVcSpU+oljyLfVy2kKsRyihsvPCLEZGeNmotf/mI7Nk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SQxjxHhQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kkByfEM9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SQxjxHhQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kkByfEM9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771881077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HXHLO9YupRsnUZVxUvtFlaS61MC9bw9nMsNVF6PIVB4=;
	b=SQxjxHhQqXgjw+KCYSyLAuQB28DWHkIZ4C128KlghHS7R/hIACrRdiUjiJBd7jlYLzYAMM
	lPRiphRn8JNkjnnqk2yp3ihg3KtNouZh4zcGiNRfRqfcqc3LB8fvA0NSkB7xQJTbIh5tUZ
	LY90fqfr9M9YKxf/kX1OkB2EBWjh7gM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-BypogbTDPJafr2MiUVV4kQ-1; Mon, 23 Feb 2026 16:11:14 -0500
X-MC-Unique: BypogbTDPJafr2MiUVV4kQ-1
X-Mimecast-MFC-AGG-ID: BypogbTDPJafr2MiUVV4kQ_1771881073
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c7166a4643so4885186085a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 13:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771881073; x=1772485873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HXHLO9YupRsnUZVxUvtFlaS61MC9bw9nMsNVF6PIVB4=;
        b=kkByfEM9EuTWvlI8RiDPtbJUN+LJ8BrvzlbBvyqys+WONb70shUnA1StjjwQWNonm1
         c+AfALhMSU3JSrgeTvdvHu4DGVM64dunWgoUXZdKOUOGgoGuYZ8psJk8WO+Ge6Tc326Z
         /GFRgVPTbfmD2uTgdAmzlf/7uSncg0T10CER+UDhmKCT2H4E+F9mtHGQHkSlRScRBn0d
         JEw0FH3AJlobypMFhPvIZ/bydpIx8l4SWrd5h8MeDCNMYkelDFgWOFpP6AKqvP8/ckjm
         WO0xK4RrD9/RPxP85b4C1rF9XlOC+4hkRXb+1RgPHjYFEMCFsbaxNHRdst/9Jq1SjLja
         O9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771881073; x=1772485873;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HXHLO9YupRsnUZVxUvtFlaS61MC9bw9nMsNVF6PIVB4=;
        b=bqeCwvLAWe8JkfivIfYptZXqUFeGj1fpjG5cqLDNMdJdwy0bXJ1C1PpM3taZEeqWLd
         OcQVCaGoBu5SQowTcH+A/ynMjL8veALkP1TuI5YFizbL/4s84gkkpMfTZIi8wXESFp6k
         RoXB208l42lYSaR4XkKeYil0DNlPogaWAQ+L0hw1t41fvhGZ0H7/zoNGeekfWWFNpuoX
         glPmXCbI31k/xmIXAib9ErSYkmOTQvUAdVbPHmmgDg9JnCPTYK6KmMNvuDDXggx6Wyuo
         g9mg66x9bEt7HbiN0I07v1fKHEoVAGCdfxnXGhFNAMxg1ho8Iy9SgOooFW2d5hp3jQ3Q
         MmPg==
X-Forwarded-Encrypted: i=1; AJvYcCVtNHRXLXnVxtYnCFGc1ZozSFgcyVqkLIS7FLqmQuH/H1Oen4BdrS5AcRZoMfx+r8mReGY6exd7dARAOl3nWPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmSY7N0wGsX5WzlCFlonNyVpXybdleJEc6iuMexI69nucx1uST
	zueeDNKp/a3gvOTbbHq/C/rQMoTZByWBBuseEsESwOBV8oKMATimTKGmTha4mFxJmogmJQau66S
	wmMG4S4cDE+4jdtPIEp9A9YNZQwEuVVfo+NeBcs5tCEtbyNm0bOk6PzsJUoQ5maZwU4YwAg==
X-Gm-Gg: AZuq6aJXbEYdlvVO90zmtZ1FPmUbmb8hAw6lFqrRw2l0OQj88itcvCSRpERkqSOYxsE
	y9Qld21qbgfoxv1WiNsmxOKDIa1BZxmtqrZ//mZliMp+aLfEU1RWy/vSh8S8SMP3nAFhQ4z2SXV
	Ipx1e64eECOr+75+UA5nEcKuksdM0sVReh/kxLYvMQIbGgUnDiZE0ZKEXDNT8RfMQ6xjer6IAmQ
	NR+C8dNfKzYYX7NbFJO6+u9oxU6nCV95sc0Kd0eDHXvxSC24q8Si4wJFDS1hEdUcpNn+o3EN1Y0
	u8nVI/lrMZkiKzBs8xWezYbXB/Wu48eQwqZ0hR+oOXtP+dqd/uApSV8olNuBq9GvV3MTW9IdNxd
	tD5DhG/2o2DnGypKF7OPgmepFuhcgtQseORfMSNQSyyythHMo+CIdMPg5xqyRnaUf2P9C
X-Received: by 2002:a05:620a:2844:b0:8c9:e8e9:9bf5 with SMTP id af79cd13be357-8cb8ca6e6efmr1258294885a.53.1771881073480;
        Mon, 23 Feb 2026 13:11:13 -0800 (PST)
X-Received: by 2002:a05:620a:2844:b0:8c9:e8e9:9bf5 with SMTP id af79cd13be357-8cb8ca6e6efmr1258290885a.53.1771881073015;
        Mon, 23 Feb 2026 13:11:13 -0800 (PST)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d0e7875sm834806885a.26.2026.02.23.13.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 13:11:12 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <3a3548ae-c5e1-4ef0-86dd-f66bcd2c6d78@redhat.com>
Date: Mon, 23 Feb 2026 16:11:09 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/8] cgroup/cpuset: Fix partition related locking
 issues
To: Tejun Heo <tj@kernel.org>
Cc: Chen Ridong <chenridong@huaweicloud.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Koutny <mkoutny@suse.com>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>,
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260221185418.29319-1-longman@redhat.com>
 <9cc7401e7137e27cd2f02625aab23330@kernel.org>
Content-Language: en-US
In-Reply-To: <9cc7401e7137e27cd2f02625aab23330@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/23/26 3:57 PM, Tejun Heo wrote:
> Hello,
>
>> Waiman Long (8):
>>    cgroup/cpuset: Fix incorrect change to effective_xcpus in partition_xcpus_del()
>>    cgroup/cpuset: Fix incorrect use of cpuset_update_tasks_cpumask() in update_cpumasks_hier()
>>    cgroup/cpuset: Clarify exclusion rules for cpuset internal variables
>>    cgroup/cpuset: Set isolated_cpus_updating only if isolated_cpus is changed
>>    kselftest/cgroup: Simplify test_cpuset_prs.sh by removing "S+" command
>>    cgroup/cpuset: Move housekeeping_update()/rebuild_sched_domains() together
>>    cgroup/cpuset: Defer housekeeping_update() calls from CPU hotplug to workqueue
>>    cgroup/cpuset: Call housekeeping_update() without holding cpus_read_lock
> Applied 1-8 to cgroup/for-7.0-fixes with the following minor fixups:
>
> - 5/8: Removed a duplicate test entry that resulted from the "S+"
>    removal (two previously-different lines becoming identical).
>
> - 8/8: Fixed typos in commit message ("essentally" -> "essentially",
>    "beforce" -> "before") and code comment ("top_cpuset_mutex" ->
>    "cpuset_top_mutex").
>
> This has gone through more than enough iterations. We can resolve further
> issues if there's any incrementally.

Thanks for fixing the errors.

Cheers,
Longman

