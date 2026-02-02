Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7532BE026
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 20:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770064388; cv=none; b=rYZK3zYbkpcck2REQWRB260VERiM8IUPrAdxHNTeVP4pJyYaLylE4p6IYlE/HdrnuSCNDOUXJSFCqY4g+RGGENrHSkosS7Ulbjbkaau5mMr8Db+pocnRpvJoKt2PnWMcyIVz1FHW5UCq6YMUhhzp0zSny+th0TQbVkKnwomkUuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770064388; c=relaxed/simple;
	bh=bLSXIEyqATMhnbXgJDjHNJpKuxrFMC8eHMTi1SFlvBE=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FgT86doczOI3ObySpmTP8A773VGf1MYN6LXgfWdOSa5ZH2c7VeLw6YHfU5oQdArCEKxLoO8wVfjXz06b4VXyhmQl0Iby5wh0L8+qiDMSjEewg7QhShxI0D+EFz03ksasTucG9e3VnHK+ygegHko2/FBWxlh9krYPnR6XnKAmI4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I3sUnkm5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iZu33w+4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I3sUnkm5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iZu33w+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770064340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q5gJYhxcAhJt/c1o8miiRcgCbdII4JGSN+/YgCren9w=;
	b=I3sUnkm50X9rugwANIKeuJeZkcV0hNh395AK1gkgMQOLS8s69mowsOEmINxcPZcjsM028p
	KZUulvQmQFWbDnBlvdL3nlOWydMRyTropXuHHaATCJz/Ih9caAU8sLtAdxWrZaVRkYzHo3
	2M1xhAgZ7PzjQIJPG8mXxoCDPUClhFg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-Edm5--PdMTOaVHFL1upESw-1; Mon, 02 Feb 2026 15:32:07 -0500
X-MC-Unique: Edm5--PdMTOaVHFL1upESw-1
X-Mimecast-MFC-AGG-ID: Edm5--PdMTOaVHFL1upESw_1770064326
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-502a4aca949so246395911cf.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 12:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770064325; x=1770669125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q5gJYhxcAhJt/c1o8miiRcgCbdII4JGSN+/YgCren9w=;
        b=iZu33w+4xgflLk4Tt7YMJSCINvf7U6M+5luNmZY5G3jONKv2UESHXZseOXLu7k3B3S
         p8jy3+wo6Kow08VYwQW/L84qt5O7kCswrj2PTHXX7q6lYTmiEnuUnwclVf4wrnRdcCug
         J1iq7RBUhLNSLfm0ppDh5/hHX/qsBq5PuaPxRrFvjMtW/2D54p+xDB2LvqDW7rDJhwGV
         i8ot8EX829GuOY1uwj/BmRffjnxyulEppTHv7qys6Jx6MN6K+OOz1XIxs8ZFpdYW4KKk
         s2z+794iEg02TL0jgfjc0tTSm0F9sEaWErIRErvQ4/6j3Ko6fa/8hE8CMWWn4EsXNSiq
         q3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770064325; x=1770669125;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q5gJYhxcAhJt/c1o8miiRcgCbdII4JGSN+/YgCren9w=;
        b=ZURDbHqS8iq4qtKPMXtWZR+IFBLVyKjV3z4AsLgoIMTD122/qW6ptO0BdTCadTzi8q
         cIuBrfyprixmFMV4VBIq7Rgl25LCbhWE1R32NrcjjGY2QJ2aZptNcSD20pG6g8mTZ288
         T7xNg8MIDHBOAhYygDjWxPOXG1GunAynfm5iaGA1eh15eGB5ICdzUEBF/TiR+KPMBHwD
         wdrQvafs2A/Kx4hEckDhiQS+uxpweKDyCPw4pYg1rq385vyTQ/uKlyKIcKrecpU8OuqA
         O7EgcZpjNg0ic5YyKAYJYhjL82AMH5AinvuHTnhKI4iNQYu5xMS5C3up/pctCDAQTLrO
         4mRw==
X-Forwarded-Encrypted: i=1; AJvYcCX4WLIe7FvlRADvKIxJq2/KV34f/R19F+Toldhsn6TWo55NuzTvQNBgRTxsnT7uKarl8Y2NPPbaD7BGCGQvFxM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7hayvmkzarALUAN09BcSy8dbATh0cmGrBwx0aKrQHYpilVAiC
	IU03O1lGqV2eBGHjbU7dWwr2dkGxwUfYk7KfigV4GlySYUVJO7Vc0Vigyhj4mcS3RtKd5Vjq+ws
	2g1TnmA8y3+3p44GBHnup6NgpuDL/8o1Yfz8j6maLKggcCb2dkqbBDkXfLvrmqxy/8fJRN2QTAU
	awQA==
X-Gm-Gg: AZuq6aLgYvY+OEAT8cqfDT0hLus+98+sVku2SXBoZLMI3W3gnhy88uSQbFbLAwSsI7b
	E1sl2SRIOXOEFBtalKgxJ3laPujqpkTm6dlEpyP0uabuUT/fHxMoeDU6h8pMCj1hoTNEjAs7jSl
	xam5n8FL+YFragzIhIzCl619zalDKzJIv66CvOLdPONz+m2OifXH0OW4dqEgLafchuO2vQAZ0Ng
	rZYWts9xNSAY5rhteE2M+6XLb0bhm0BmD1rdJ4K7bTVFRnxsq7GQ2+A3U3yiaoh1mtJDN0W1qi+
	vQ0sDJD+AccoHLDXIQANlImQqMO2yO5aJkwGBYIelTh/SfMYnCe9buBe+XG+J2c2zE8ZscbC5BZ
	Q8vEOUOxPUFl8R6Lq7ey8N9kE5P7uKiwSXynqFBtFFKLJ9ucdmTajS8+D
X-Received: by 2002:a05:622a:d0:b0:4f7:a0da:ab0c with SMTP id d75a77b69052e-505d21c8451mr169362521cf.28.1770064325427;
        Mon, 02 Feb 2026 12:32:05 -0800 (PST)
X-Received: by 2002:a05:622a:d0:b0:4f7:a0da:ab0c with SMTP id d75a77b69052e-505d21c8451mr169362141cf.28.1770064324960;
        Mon, 02 Feb 2026 12:32:04 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50337bbbf8csm114527921cf.28.2026.02.02.12.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 12:32:04 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <a503d890-0c83-4741-b622-88798016787c@redhat.com>
Date: Mon, 2 Feb 2026 15:32:03 -0500
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/for-next v3 2/3] cgroup/cpuset: Defer
 housekeeping_update() calls from CPU hotplug to workqueue
To: Peter Zijlstra <peterz@infradead.org>
Cc: Chen Ridong <chenridong@huaweicloud.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>,
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260202201144.1669260-1-longman@redhat.com>
 <20260202201144.1669260-3-longman@redhat.com>
 <20260202201844.GJ1395266@noisy.programming.kicks-ass.net>
Content-Language: en-US
In-Reply-To: <20260202201844.GJ1395266@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/2/26 3:18 PM, Peter Zijlstra wrote:
> On Mon, Feb 02, 2026 at 03:11:43PM -0500, Waiman Long wrote:
>
>> @@ -1310,14 +1321,34 @@ static bool prstate_housekeeping_conflict(int prstate, struct cpumask *new_cpus)
>>    */
>>   static void update_isolation_cpumasks(void)
>>   {
>> -	int ret;
>> +	static DECLARE_WORK(isolcpus_work, isolcpus_workfn);
>>   
>>   	if (!isolated_cpus_updating)
>>   		return;
>>   
>> -	ret = housekeeping_update(isolated_cpus);
>> -	WARN_ON_ONCE(ret < 0);
>> +	/*
>> +	 * This function can be reached either directly from regular cpuset
>> +	 * control file write or via CPU hotplug. In the latter case, it is
>> +	 * the per-cpu kthread that calls cpuset_handle_hotplug() on behalf
>> +	 * of the task that initiates CPU shutdown or bringup.
>> +	 *
>> +	 * To have better flexibility and prevent the possibility of deadlock
>> +	 * when calling from CPU hotplug, we defer the housekeeping_update()
>> +	 * call to after the current cpuset critical section has finished.
>> +	 * This is done via workqueue.
>> +	 */
>> +	if (current->flags & PF_KTHREAD) {
> 		/* Serializes the static isolcpus_workfn. */
> 		lockdep_assert_held(&cpuset_mutex);

Do we require synchronization between the the queue_work() call and the 
execution of the work function? I thought it is not needed, but I may be 
wrong.

Thanks,
Longman

