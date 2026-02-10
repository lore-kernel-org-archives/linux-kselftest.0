Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7195931B110
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770734376; cv=none; b=tQl54bG+jFkwzqjQ0lCJzEeJP8I+8+VHYOmMs3Y/4U3fx/uNfQ9FtnTTcuYjDLQjI+D4Dm3bnR9JNLFVMRsyWxFtn2HgDoIPYxhCO/QpJJ7P3d1xWjEVQjIvB6qv3LKm9jfbrSJIILrztXjoXXMTysnyhOHYG9r2Le6U8Vwwgso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770734376; c=relaxed/simple;
	bh=vQaRXm2+AQXIYLnEQ4jVzPZq4om8wNPyfHiJq2lspn4=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=u45x76sM/k0WCA+Ww6scd4i80SbJeV1oKFmXaptYX4b2ui//P6VHM1Xa0em9lcU8gBpAFb+q+fvMtAOwQ3enN108pMMnykP/m1agA+3cci81lHtU3UKByE42o7d2r24GEh8dBMzxvIap0TLT8pl8LaJewoBX14uTKwkKfLSJPeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SXCsDWVF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RhFX/Jrh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SXCsDWVF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RhFX/Jrh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770734374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uoguIq7tMxRUKFK+t5O/JiWw37kAXp4tCRjW/Z7hpYg=;
	b=SXCsDWVF6zodTbkyUy9tSYIjcaXGM/mtsyJUWzFbXJGTv3zVDJDmXZIDnNWkWfsfrHRrAG
	iqZWUN/AVZgV6VbHPPRmGc/PLj25mc1MVBF3qpxTo90pwvx3uQk4hJjwc/+OloQKwQy8E8
	lOMPzyiUeFvH8Caqj+v25TMJEWbHlzE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-4UVCEO2jMTGGH9an5BkgYg-1; Tue, 10 Feb 2026 09:39:33 -0500
X-MC-Unique: 4UVCEO2jMTGGH9an5BkgYg-1
X-Mimecast-MFC-AGG-ID: 4UVCEO2jMTGGH9an5BkgYg_1770734373
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5014ad65e3eso221098351cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 06:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770734373; x=1771339173; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uoguIq7tMxRUKFK+t5O/JiWw37kAXp4tCRjW/Z7hpYg=;
        b=RhFX/Jrh/uwhlMLD++hGfd4S1ZX8p8ZjVlJQCzf0OOMXdf4pjJVJcrGg13+40vb4Iz
         H1nSqaR61TyCMFuhqy9BVp20j9sNAMrmwZqA+8Yktyj6c0kkvoGd3ouk942jpTk5M69G
         jNX15Rm6BxV3aLqOJw5xMBRZUPpIQS4zPT9GEM3IbcyJRa3GxBj9fbT9CC4Yb2OCmkiG
         A85PjCcbZI2tymZUW1QYvkLSvFxWugzBiyVfn0hNWKh34QBD6MqMp7RAVsZAdoPegOON
         9FMkWD9cWGMisgvks181yN3B2R/EZDkUeT1Eitu9VOL7AVWDiWbj17n+Xh9m8gu9lhot
         Hwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770734373; x=1771339173;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uoguIq7tMxRUKFK+t5O/JiWw37kAXp4tCRjW/Z7hpYg=;
        b=Nt0hQBo/9fvLRr21QMs1QwWrM2XCoY81+uc4+MiFGykjeSJbwAAiegYAJ+4agqaP6D
         4XwgwC7EOqms+sVWxpEKQMxPnRBk1wfF566M2smOv3ZdAMMANBZMXaZlBvMfDY//eoxd
         J2tc/HFcUdSEZL8rLZe9LXeaciigmy5oqZm5ohbh1jWtq0MbUU7EfW/sjuQWj3UylHBT
         6RDezioV8DOey8UNoJhdACTzVzClIaApFtysj5ql605mmBF0gPW9BY693XARIQa5hxtV
         esSJsFjovvuRuEI91ODkwoW+rsGffbscrcjvJgCWqrLFa0u6b8Io/NAxHPBrC4viACty
         SBHA==
X-Forwarded-Encrypted: i=1; AJvYcCW1Dxgaa8dtETjBoYxNvHBRWx0j8iMokhjZdqeYaEUeAeFo/a/v+RfCziJHgc6bYyAnJBEUIZtS6lAvmFYyuMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDySLIoTWWpxggvioZHjo9116dx406Ft3fgfUQ71mMXkPo4DfI
	Mm/cjvY8/wmWEoUVGjtlNvBmeiHVdx32QSaGBAtUaBxbuZd5y9oih8iTXyiJ+G3IP9O7nb7nHdw
	5X/acKebaP3cxigzIdGie6MkBCvjqWXHTkdw+ZK8kshE8k2fBTyAaRi7Wci9vTBRHUkdBmg==
X-Gm-Gg: AZuq6aJl1VQ8JkOqtcTaZ6s3SmNkZMd28QZX+0AN3HguSk+Fwye596fM5eYff8MrTJU
	z/tequolg49hIFtEQ1MSyJBswiUP7HwAsQCUvFE/FIliai7BVJFvzTmhJJL4S/Oq3qRLNgzlWml
	ytn7avz0L4tmN72xBvIYGeAhTQgbg+/LhM4QIkZi49jmoW/NyjyT4T6Uhzg+oChPECBSqwQpcyx
	dlkhGB31ff+LLcYYi4j+i/RfpyEhvFZJp2e3Il5mzYYq1FCWWTQOuchQRQaJDkx4U1xoJ5DiVbZ
	dTMeqPiE2BTt2mhhShGFdmsQkiHLAqPXR47nAV7x1zjYKGD4l0yWB1OdFvniqjxiiGnw/pdaYwO
	WpuSBGscBidok1AGLjsTwMBABOiDhWyVtmhkRRpmaO1UCkc5oiR69bIssc/fkq0JLX/6b
X-Received: by 2002:ac8:5d92:0:b0:501:40b2:453d with SMTP id d75a77b69052e-50672e23c11mr29070601cf.23.1770734372859;
        Tue, 10 Feb 2026 06:39:32 -0800 (PST)
X-Received: by 2002:ac8:5d92:0:b0:501:40b2:453d with SMTP id d75a77b69052e-50672e23c11mr29070231cf.23.1770734372411;
        Tue, 10 Feb 2026 06:39:32 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392902eesm99012571cf.21.2026.02.10.06.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 06:39:31 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <b1193a25-f38d-4f4f-bee0-565fc7b7402b@redhat.com>
Date: Tue, 10 Feb 2026 09:39:30 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/for-next v4 3/4] cgroup/cpuset: Call housekeeping_update()
 without holding cpus_read_lock
To: Chen Ridong <chenridong@huaweicloud.com>, Waiman Long <llong@redhat.com>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260206203712.1989610-1-longman@redhat.com>
 <20260206203712.1989610-4-longman@redhat.com>
 <119981d3-1cf9-412b-9b4d-bc4bcb188104@huaweicloud.com>
 <67f4b01a-7b23-49c2-a8db-059316300d39@redhat.com>
 <08776cf5-054e-4137-9ce4-f193feeb2599@huaweicloud.com>
Content-Language: en-US
In-Reply-To: <08776cf5-054e-4137-9ce4-f193feeb2599@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/9/26 8:39 PM, Chen Ridong wrote:
>
> On 2026/2/10 4:20, Waiman Long wrote:
>> On 2/9/26 2:23 AM, Chen Ridong wrote:
>>> On 2026/2/7 4:37, Waiman Long wrote:
>>>> +static cpumask_var_t    isolated_hk_cpus;    /* T */
>>> Can we get this from isolation.c instead?
>>>
>>> The name probably shouldn't include 'hk', since it refers to the inverse
>>> (housekeeping CPUs) of isolated CPUs, right?
>> The housekeeping_update() will create an inverse of the pass-in isolated
>> cpumasks. As for the name, I add hk to indicate this cpumask is for passing to
>> housekeeping_update() to update housekeeping cpumask. It is not directly related
>> to the cpumasks in sched/isolation.c. Please let me know if you have  a
>> suggestion for the name.
>>
> I understand the intent. However, when reading both cpuset.c and
> sched/isolation.c, it can be confusing whether isolated_hk_cpus is an inverse
> mask, since in sched/isolation.c “hk” consistently refers to the inverse.
>
> How about isolated_cpus_applied?

Applied to what? I did add a comment to describe isolated_hk_cpus as a 
copy of isolated_cpus to be passed to housekeeping_update(). "hk" in the 
name refers to its role for being passed to that function. I can't use 
"isolated_cpus" for now as it may get modified by CPU hotplug 
concurrently. In the future, if CPU hotplug no longer modify 
isolated_cpus, I will remove isolated_hk_cpus and pass isolated_cpus 
directly to housekeeping_update(). I don't think we need to spend extra 
time bikeshedding what the right name should be.

Cheers,
Longman

