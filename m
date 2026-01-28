Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DE12737E0
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 18:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769623746; cv=none; b=NcmV95wVVIS3fplvywj7+nvPfdz54y3irafggGYqSvazpp2+YKbKy8L7jgL2SHKFbM+akp5SD5D0wS3NSRRekNRFE/UJeh7uHktwNyzSWfJQuQuR4WIr2RglEiPr1LYyokXymFllNQHpzFm2XpBASzIr93rkyXLslb+HmK5NEe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769623746; c=relaxed/simple;
	bh=sW3ixsa60Tf5yvJXIL5waBKWtOoqnKLO8YAirrnYPuE=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=S9kvt71DZvDUXITzoy5V2G+tcqduhGIXyPBJvSXKKjqCEI/+q304O4unLIrJrJAPNeXveH5uvL0E6EV+zbayZ/5qWE0A8+gd5aZUqV5/1hWoSkq8Acc1LIt0Fz6aMO5xjDLGs5KhThcOxuTBCJ84X7NpI6Miavs1bafPqw2w4zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iT7PZ8+D; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OXWNtN48; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iT7PZ8+D";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OXWNtN48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769623743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F3/5uXj60lotisugWj0ukNSuH4F0JCr6j6Yw3wfib9s=;
	b=iT7PZ8+D6tpngAijy8cdue1HrXcT8owzXAjsFilhzP78HONU20/OLmxz2rVAi8qWjO5Dcs
	oSpJ7c+MXkvwDXl2hw+rwW6+qBQD+kD2IeYCH2LSsawSq9xeFKYgEm53WygH1ATfadutB6
	zGjkmzMxqn/eiLUebWGEiUpA2YVVrpY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-DZMxn1hJPRixsgYlUlMFhA-1; Wed, 28 Jan 2026 13:09:02 -0500
X-MC-Unique: DZMxn1hJPRixsgYlUlMFhA-1
X-Mimecast-MFC-AGG-ID: DZMxn1hJPRixsgYlUlMFhA_1769623741
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-894727de401so6722346d6.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 10:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769623741; x=1770228541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F3/5uXj60lotisugWj0ukNSuH4F0JCr6j6Yw3wfib9s=;
        b=OXWNtN480YxEMwJosTJQ70xMNIKuwXw1KKL4dLvOUljJpJkxUDToCvYbwKiOVv7GdS
         OtRuUvzN5UpOYa3yT24ggm2UkPJXfYqSTACKqwtA6AAxk1RJkZqzCS8RUN2shUDFVo7Q
         fe1no8rft91K33zpWmgRqzHuKuaEp9eYCpLrx72fl5IigQVXrbyA09/I8czEMeG4QkEY
         MsLZGo8x1dc9Syn2ze6lVzVAlw4T2jX4sjeZ5j8Y7AmNOgXFCDKNs3FDY4t8SnJkJuVg
         Uo1ukcIggITgyGzTgTiN0UiJC/td7DagHqWZvkAMBFv2ONoCdSKDtznVURA9QfDMTmxk
         cIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769623741; x=1770228541;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F3/5uXj60lotisugWj0ukNSuH4F0JCr6j6Yw3wfib9s=;
        b=B4MnWK0p4G1SeeRGf4nudS5gIUFJ/jU2R0I7OFiC0pe+qc9iKRj9TJL1bZgXJuTo2/
         iLsPXMU6w9sdjfayYW2jdCGeNA5Q46WPuqYP7goNWF8G/VSvS6o05gtcPep8lVYx1Dse
         BwdLXOfG3XbHv9GjmKdeKkN7xH7g3AhdzOiG4hKk0RtUWo+rOc0k+rC1FkRftw6hLJLG
         RG3Q0yn6EqteW+dM1F1mhG3OtSs9gbpaLjler8ar62haayuzaO2Pg/YJbk0yRYu3S7q2
         na1LMeH8zAHQC0fO7b6WvHfqQuwqpRLaEObKrdrW0YHMMT1yYm9xZ0x/K//3/ckYluUw
         oA6g==
X-Forwarded-Encrypted: i=1; AJvYcCWfAxvFNfrtk+F8cmklcJXZBJ8z1AFVN22cjHW/EkLm+/WnQc4izSsAsPbedf8GRCZG6Ots2I0jV31GRacDPOY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6ier+PEQX1IEivf128Dxwe4K3zIoNDSESktyNttexLuuzQPfH
	Al6NTKA7IPymKpdAj7SX+1FRrGsekWMNeLQokpL2G9ACmQtRteQpYsI2W3adlICX4Rxiy9vsPQ5
	Oud3/GwVYADcNOBvbX0IOrGLvfNf4hMY711hM2wbJKUyPhFW86yPCPByIrjulwgb2zfygBg==
X-Gm-Gg: AZuq6aJ68EpT340/ux+oPk8LJM78humDQL8rjm87Vm+TSLywDejh7Wq/JT6216vesEx
	ehggcOzKcIz/OI7kyvkvMPdDPi5qvIoFbCvbGgtO+GG7PqaDkQpAbbfPxoECqa5Qv3t/Zl2c3Dn
	kiiabnG8Ogzu4vhlIZ4g+lxrGDeOG/Jj5njwQCYHBpta6kMIdANPwYqB/wZCWh76eW/oi1oZ4xz
	XggSX7H/fOxlWYMj7hSpVIa4iCoX2bkxRLmOfrUdYsDGl4oGcpueLZl14dLWyokUWklVqAcmi3f
	ohU48pA99hK6CiWJwZclzznta5uEle3l3dwvXi5WGzXwIdQfOPR9xFTyTCQCZKtqbmZx4CT0GPp
	/aMnRbciXU6FQKOhK/GOZf4HSFmnz/pXLqbdj/7U1P+7jztkxHeadcTH3
X-Received: by 2002:a05:6214:27c1:b0:894:66ec:fac0 with SMTP id 6a1803df08f44-894dfaa2095mr5501716d6.10.1769623741580;
        Wed, 28 Jan 2026 10:09:01 -0800 (PST)
X-Received: by 2002:a05:6214:27c1:b0:894:66ec:fac0 with SMTP id 6a1803df08f44-894dfaa2095mr5501166d6.10.1769623741206;
        Wed, 28 Jan 2026 10:09:01 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d3ea25sm237092385a.36.2026.01.28.10.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 10:09:00 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <494c63e6-4887-4bee-989d-8a9efda7f2c7@redhat.com>
Date: Wed, 28 Jan 2026 13:08:58 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/for-next 1/2] cgroup/cpuset: Defer housekeeping_update()
 call from CPU hotplug to task_work
To: Tejun Heo <tj@kernel.org>
Cc: Chen Ridong <chenridong@huaweicloud.com>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>,
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260128044251.1229702-1-longman@redhat.com>
 <20260128044251.1229702-2-longman@redhat.com>
 <aXpLEcOFhuGYGPY-@slm.duckdns.org>
Content-Language: en-US
In-Reply-To: <aXpLEcOFhuGYGPY-@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/28/26 12:44 PM, Tejun Heo wrote:
> On Tue, Jan 27, 2026 at 11:42:50PM -0500, Waiman Long wrote:
>> +static void isolation_task_work_fn(struct callback_head *cb)
>> +{
>> +	cpuset_full_lock();
>> +	__update_isolation_cpumasks(true);
>> +	cpuset_full_lock();
>                      ^
>                      unlock?
>
> Thanks.
>
Sorry about that, will fix it. That change was removed in the 2nd patch. 
That is why the series still worked as expected.

Thanks,
Longman

