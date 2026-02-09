Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9606333453
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Feb 2026 20:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770668457; cv=none; b=gyphfhXGAZcwKAkgiv4ND10nAATXcRTLgCMN5xUntAvsHebQ1lmY8PqmnylwGs086GOXW+1eFD19q91zpo5ZkbGW+kSaMOrtfRbdC3ixCTlwm8l67aN++qs0yOPipV0Vq0lM+9uyQy+TlG1ED+p/syqKa6VzgQOjbyelg5d7qaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770668457; c=relaxed/simple;
	bh=GB/u68ld+Eyp8AH4JqN9tcHOTLiMBq6jmzErDgxOy1c=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aakCGGNmiSycf0N2Aw7lNrzUbpuvnAAMQcm00wGtFr8982aS3HEPMSKnf+PcfEoDdZczcTUAzSY8h/zFN+LHrud+QYQY2bGTjmWFA5NkY9ICSif/1F9bCC4u0WYVJcYTz6dqqY7q6QZ4iD9//7r6oyoPKkhIMyxjcaANfZrluog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dAI7xkkZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OZakpooa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dAI7xkkZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OZakpooa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770668455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EJ3P6U64D3dIwQ6JMmzaYcb4sLc7KKAd+gcH8cuFSaI=;
	b=dAI7xkkZRWS2qg3q2KCYlv0bFCCFi1ly32ssJq9ZNzyj2hwX/AJhzauwrq7BcknnzPNW03
	vFqf0sITF8O/1RCy2dp8xciZ4miqRaCaAVf18q+wzam2XKB9OP79CCErWjmHq5rCrmhbfF
	+MVOrRqToKHKHdUa0MldOUU4p2GU/70=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-wO5UmpnmOqKhAPmLqwPkqQ-1; Mon, 09 Feb 2026 15:20:54 -0500
X-MC-Unique: wO5UmpnmOqKhAPmLqwPkqQ-1
X-Mimecast-MFC-AGG-ID: wO5UmpnmOqKhAPmLqwPkqQ_1770668454
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb0595def4so991790885a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Feb 2026 12:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770668454; x=1771273254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EJ3P6U64D3dIwQ6JMmzaYcb4sLc7KKAd+gcH8cuFSaI=;
        b=OZakpooa7xNnfCsyGOM1eagBB7hiZoRR4yqFqKSLJZrPYR48Qgu8c6Cz4MJO6anRou
         phugegH4MvdlBrlBWOV0c6bJeIjgtuDHS8hvmdQXEY+/nvaHclPHBGx0L/7/wEsNShGX
         3SqlpPMEkSX83JlkPgV+qf1r9oSGGDt8Q6MbfXEuRR/5xeebTUbS5B7ZgHY2csFEehQw
         V4LUmQFMTio6FQ/okVrSMB5x17z9eZB0LcE4boM4T2F18ghqJEJThGLFVgwWlKUq1k+U
         N4MjFu7NdO3+lFGJUCUUR/E/51JefxWf3eIToKgBPT4FYP0C8KLW6gsZYcjwtoePEI20
         vlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770668454; x=1771273254;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ3P6U64D3dIwQ6JMmzaYcb4sLc7KKAd+gcH8cuFSaI=;
        b=dDaF8eDweVe6/M/1TLkS0iXoT8HljqGffY6Xl3Tp3lEuASjOo210yMoiazcCQUF9cL
         VrytrOcF3WqgezPYL7HPL7C5xfPWEgGGSKXREj5rVT6/6M1HRm98Ij3wlMZgNbdIGSKK
         VRK2qqStpcZWNL+qq+oOwZZpSpHIHSeEY9DtdpKKOEmdfVXcVuxMV4jly7NIuVIVZ9tH
         HCakB8XZkk8I4BICBAuUJngWyiqHkXpW8tVEQMskrRLEaR9Ov5PMi9zezI1WoIoG3lgg
         cmm6ki6zdwWRBNf12gpJL0prRJOy1ic4+eihzD2JS9j+x0o+S7KedIPUsPXXueOgg8H/
         n8Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXp7nhp4sPqebhvpATqXtZnyLoiVo0D0LYL2DpmQxhG+j0BSjoWPskmi6jzOF6jqnHqGg+SyH1OI9m1pjUH93s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywor/AOJW6WiQplPosBlczl9Ep6uG7YM3Zj1DYOMmJrNKAJ3eBO
	HTiw8qR9OUm857NB5ISZrhwjOqhb7ikDuBC7Uff+r8tKJRQMosUCsxCAbesvst0KayR90Wk92bd
	OGVdklL8zJZqI29ajqPYEex/Rhod3a4kTo9JJvW8s3w7XfDw2QXjOwSUOlyR+MyPkmAuJ4A==
X-Gm-Gg: AZuq6aLjzUiY7us/pcwXB8uym1yB8QJMJyC7sP1LGn7XIWJ/2k60G80A1MYdyjTxq63
	9b+pyUghOlotXJXMc1jw3kItps9jdVruS1Kg8lynag6kBaNL7FDaeR7AFRHwmEBf6AL638CkGAR
	TfVbv0Q0tb06sOqOWhJqeii54wEOMoMay5Mzx7LNRnkZMko0zPxHzjMo1khHrQ2ajSmL5EGiOTh
	0uy8VVEUVwgxjoQwc5qJIQHJlXxdg0X9zINJrekcB2FKoGLVt3UE5qmb6elfE06puS9ghl+1F0H
	ke7azOzmQq6BXmlUQq6drI95t16Sj8fzz89cO8lt0nNBtUgpfWNJ+myivh3RsbZPrE7NMlgULhk
	n7RblWHBL7kZAvE+yWaYVB9idcLf3CX4YMsZ0//crQypgoQBbrjJ8udX3
X-Received: by 2002:a05:620a:4048:b0:8cb:df8:e86a with SMTP id af79cd13be357-8cb1edb93f7mr11489785a.28.1770668453989;
        Mon, 09 Feb 2026 12:20:53 -0800 (PST)
X-Received: by 2002:a05:620a:4048:b0:8cb:df8:e86a with SMTP id af79cd13be357-8cb1edb93f7mr11485285a.28.1770668453604;
        Mon, 09 Feb 2026 12:20:53 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf77f6c16sm868811185a.10.2026.02.09.12.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 12:20:53 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <67f4b01a-7b23-49c2-a8db-059316300d39@redhat.com>
Date: Mon, 9 Feb 2026 15:20:51 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/for-next v4 3/4] cgroup/cpuset: Call housekeeping_update()
 without holding cpus_read_lock
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
References: <20260206203712.1989610-1-longman@redhat.com>
 <20260206203712.1989610-4-longman@redhat.com>
 <119981d3-1cf9-412b-9b4d-bc4bcb188104@huaweicloud.com>
Content-Language: en-US
In-Reply-To: <119981d3-1cf9-412b-9b4d-bc4bcb188104@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/9/26 2:23 AM, Chen Ridong wrote:
>
> On 2026/2/7 4:37, Waiman Long wrote:
>> +static cpumask_var_t	isolated_hk_cpus;	/* T */
> Can we get this from isolation.c instead?
>
> The name probably shouldn't include 'hk', since it refers to the inverse
> (housekeeping CPUs) of isolated CPUs, right?

The housekeeping_update() will create an inverse of the pass-in isolated 
cpumasks. As for the name, I add hk to indicate this cpumask is for 
passing to housekeeping_update() to update housekeeping cpumask. It is 
not directly related to the cpumasks in sched/isolation.c. Please let me 
know if you have  a suggestion for the name.

Cheers,
Longman

