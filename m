Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E072B32D443
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 01:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769737172; cv=none; b=pSGaPIaC3dd3EItS965mcWwEIEnc3c7OTuw1LGrZtLgSdJHN67uxAvWvM73pA4njW0cFfjyQ5IrzjPnpklvTQOIEGomlGF6BtYlS/H+fGU8ghOq0hrN0gE2AMiToo6gqKMqGOu1hDwLDbW0CFyUFs48RTvPaJiqq55PPYkTDoFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769737172; c=relaxed/simple;
	bh=wdrxh6fAU9PLk/GqfeQNSeG4evn0JGL+pWgjOkSe0ao=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KFKpvMw3IdFBfnEFccZu23nu/1R7c9u7h6qDe9RPW7VYRu6eIADiWMbPyuuw4wNuEd0jNuWXORz3yWOBKSXp/IzJIl4K+LsY8gWBSv3mEf7/jHsX/kT7zXqYrGKCJHtTD7++eycjDDDqJAk8U8LqXM//zKxaBdItB13/qyvyxdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Eo2zQLFW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=szet0zew; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Eo2zQLFW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="szet0zew"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769737170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NaA0XM1BuGEr30lghRFkS4AIRI2kuTOe/L3KaghInyo=;
	b=Eo2zQLFW0IrYePeKbgLodL7vKqX96F6rfssCTRnuXcWUdAJl6WWzl49mS4YCRZ3i1fEGQt
	tPGExvai7TwqTFawvoyOn1p/f4FY4B3n6eWs09ekSvQGWI1I8EsDFN8uhZRtBpC5nhpSvo
	DzlNMCW5IcTI0kPPAwqc6Eehy6XY9JY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-nDT6jB0cNJm8agf4qL2XnA-1; Thu, 29 Jan 2026 20:39:28 -0500
X-MC-Unique: nDT6jB0cNJm8agf4qL2XnA-1
X-Mimecast-MFC-AGG-ID: nDT6jB0cNJm8agf4qL2XnA_1769737168
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb9f029f31so477710285a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 17:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769737168; x=1770341968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NaA0XM1BuGEr30lghRFkS4AIRI2kuTOe/L3KaghInyo=;
        b=szet0zew0O24ee5MOrTxNz8/fpYQSlSQLn1fE2aqxU/gT8mJjmVT7FkAUHKuTxGJhx
         1qZOmEhsXfxaulZWwGf8ETGjxMQvcNONzYd68j/7kFBhPGxaSWlrp4uuXeO66359/+4S
         e3F02Nwe5LGftT+Qj5fPYF8WkF2/DBljmEJTutONjEUiRJFg9N+1tYpz244qAKbJsw1m
         6CR2gdEJV3s+/qzhwT4bCICrdTXjE5mqPFHKV0YniYdf+3+6b/8lqWjNidCfv5K9sPbf
         yRsthn/oFbc9oHvfC5By6WlfiJBGun1oVxZm2tNwWeZz4OWwe7md1DcJKfmGLfRUidkQ
         IaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769737168; x=1770341968;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NaA0XM1BuGEr30lghRFkS4AIRI2kuTOe/L3KaghInyo=;
        b=MaKl8aXfLHcVKcgL69/0jCwLhY2mCA/EOfqN2Etdk/3XJd50owbZrUoUtPAZOrTvhr
         bnfizq/O4qjX4W92ZP4pPeBLpbYYFQbMVQ99A9Pl/WWq0jmK58IzKh5EI9+KmVhL1lad
         siqzfnNWSvkIaw4EWtDtnP649BcNtGNcYXJH4srszCYpB2rcmH1QfPFJtjzTU+GTA+C5
         PU1jj186tMzg1M32kMA2XS8XIPMLIwItZ44DHM5BpPX5MYScFmdLZ17l6lEAp/zQTwcT
         J98naKphn+5kvUEuxMSFiznm0siJ4ximHQJ98fGwMx8oHxUR0JAYJwsfBAJR9r9ljTpb
         jAow==
X-Forwarded-Encrypted: i=1; AJvYcCXsZLnBTEVnzyUPxaWh7TK8mCUNjXl452bCgXTrGP8swnLxJJ11ao3i6qORZFes+RPH3BcmjjSSMM0LqG/CFR4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu3dLulUNtu76Z5FeWViUoXEN6WycN7xYQlrrJ8n4GIBbouBJl
	uIKR3QjZWS2hTQqnrj1744w0beKRFN9wjhS7ePTjBw128REwf0TXV/CrGUK9K6kQAAB96lwyzfS
	88+7gU35H3TyEaFA0wxhcu6XcIhEoIAJ/HqWVBXKy67biG4welUgb42FvAgEPC29aoM12eQ==
X-Gm-Gg: AZuq6aL01GZcyh8o/2Prmy4WdG4ZRuI6iLjLPnW7wYLdwz/roO3UTQ2wFkTqz9mp9hn
	uIO48RERr45NuK0PXFYk7frJ7zersjKT2orGAc3MszDYIvqU6iRQJGxky+GGw3amvWyTI6pKWRA
	bF+kvqEVQU6DfMl7rQRqhbVwL/klT/AvMa7Lw5DWk00vO/m2wuH17BnhcjST7jHMGG/e7Pq9ACU
	rGeJpmiOiHwo+xhvcf6/5sld+8efUlMJcanZPhnvykjbp0H0oRMI6lW55s8dEk9FKKI6/HxD4kN
	qvGWBWxJZ90DtHZBirlVFCRVNq0sJqj9NlvugpUx4DaOD7Gk9ViGGQX7FYriL/sxn5gl4E//ibO
	hXrPA1+2M1t9PPxmzNm2ziO9pzSb4QNYfB8PASfrEjyETEyukiJGJVol2
X-Received: by 2002:a05:620a:170c:b0:8b2:2066:ffca with SMTP id af79cd13be357-8c9eb367818mr204895285a.82.1769737168088;
        Thu, 29 Jan 2026 17:39:28 -0800 (PST)
X-Received: by 2002:a05:620a:170c:b0:8b2:2066:ffca with SMTP id af79cd13be357-8c9eb367818mr204893485a.82.1769737167757;
        Thu, 29 Jan 2026 17:39:27 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d375ce71sm49112516d6.45.2026.01.29.17.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 17:39:27 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <6b89aa68-9b12-45f8-bb2b-29e0de67d107@redhat.com>
Date: Thu, 29 Jan 2026 20:39:26 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/for-next 1/2] cgroup/cpuset: Defer housekeeping_update()
 call from CPU hotplug to task_work
To: Chen Ridong <chenridong@huaweicloud.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260128044251.1229702-1-longman@redhat.com>
 <20260128044251.1229702-2-longman@redhat.com>
 <ccca8790-2bf9-46db-b355-ce8695ea7093@huaweicloud.com>
 <4d192246-d795-4f65-825f-5e4a413cae32@huaweicloud.com>
 <2ac13ef1-1fb1-44a9-9bb1-a82338bc27f0@redhat.com>
Content-Language: en-US
In-Reply-To: <2ac13ef1-1fb1-44a9-9bb1-a82338bc27f0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/29/26 8:37 PM, Waiman Long wrote:
>> The hotplug path just calls asyn_update_isolation_cpumasks(), 
>> cpuset_full_locked
>> and isolation_task_work_queued can be removed.
>>
> Thanks for the suggestions. I will adopt some of them. BTW, I am 
> switching to use workqueue instead of the task_work as the latter is 
> suitable in this use case.

Sorry, I mean "the latter is NOT suitable in this use case."

Cheers,
Longman

