Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795488442;
	b=LqwVCUfnaNZ59xbgJnDs2mTmXEaJX3hIDR413KYH5E/c14BeBlyZgEiQ0Pyf5uGLOFTB
	 2xxW2+ePJOKWaLFKbUpwuZm7jugclNtVq8J1RpzQY6BcUZdh4Wa0wj68x7UuPeHmTk+qg
	 kf8gEqAWVxTCEecmuGXkMDVrF3aj/0yURxWyGo4D0LoTdRibmNtjqtQrkA4DmQfsox+4V
	 F0Lt9TiVy3pZul4mMjrqW/XVDHdQ9lZcncxzyOBzM8T2RhlOFtApvMbCR5B/z3IcB/mVo
	 giEKOJfH5exxo6RmoTFlD80bH8gKaYItIRWf84CWDoDu0eulkdWTQkGMtIcLcL8hStA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795488442;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=4Ak85eFE9JxCR3zMmp1Y1erF3ON9qQ7ryAUtMmLoOyI=;
	b=TZv77kT7uFXLG712DANEAmNbH4jBNhFbGn0Jx/PY6aFZKxkK5plJ83FW72TDC/eT1Jm/
	 foX37ZsbD6QN5cno0u8zUICgvURJWX+5fmJ6b+jeQLggO55mgDjWtA3xEJe/TNFcAacYR
	 cgs/6NRP8wRfPDHauNoPWAkT/I66JdALMXkWS3Wa56FdcJsRRKVo/xIoAX0lNbnsnLgqB
	 5grvYLxLISCUsvqZXnu+MKrKYcOcTMfnN1LfGtWsnxLL98V6C3R7KJbCWC55YM7uOt9bZ
	 +eP8lsz9ttgLBlPQSMod1KP5cYlxgqX3935Iingf+0nQrSeBM+fZG7mscZbGakR+gYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="bxNEDSI/";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08B4606A322
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 02:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F08B4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bxNEDSI/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795488441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Ak85eFE9JxCR3zMmp1Y1erF3ON9qQ7ryAUtMmLoOyI=;
	b=bxNEDSI/tsvFPUN8OOz9wMpSpRThQkz4wWjwwOdK2N+lFBlNDBQUFgUvZbnvL/RWoRV5Oh
	e8QZhLfhS2V/puL59+Li661eJAZwtg14+UDCBxNeDdq2VXx1I+lDnL1tQ388kKfBv22FS8
	xgebY99l5H2fMSxdDeInWa7ajAGlRE0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-263-X0zwz4szNye-pJzbouK3Pw-1; Tue,
 24 Nov 2026 02:47:17 +0000
X-MC-Unique: X0zwz4szNye-pJzbouK3Pw-1
X-Mimecast-MFC-AGG-ID: X0zwz4szNye-pJzbouK3Pw_1795488434
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B741618002E2;
	Tue, 24 Nov 2026 02:47:12 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 37B94588;
	Tue, 24 Nov 2026 02:47:08 +0000 (UTC)
Message-ID: <407316d0-24b6-44a3-b4c7-90a4b3695fae@redhat.com>
Date: Mon, 23 Nov 2026 21:47:07 -0500
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
Subject: Re: [PATCH-next v2 1/3] tick/sched: Make tick_nohz_full_mask and
 HK_TYPE_KERNEL_NOISE cpumask consistent
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ridong Chen <ridong.chen@linux.dev>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Thomas Gleixner <tglx@kernel.org>, cgroups@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Guopeng Zhang <guopeng.zhang@linux.dev>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
References: <20261123041209.382726-1-longman@redhat.com>
 <20261123041209.382726-2-longman@redhat.com> <awSvBOgM9WSj-1hH@pavilion.home>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <awSvBOgM9WSj-1hH@pavilion.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 11/23/26 4:24 PM, Frederic Weisbecker wrote:
> Le Sun, Nov 22, 2026 at 11:12:07PM -0500, Waiman Long a écrit :
>> When the nohz_full boot parameter is first set, the cpu list parameter is
>> passed directly to tick_nohz_full_setup() to set up tick_nohz_full_mask
>> cpumask. Then the HK_TYPE_KERNEL_NOISE cpumask will be set up as the
>> inverse of given cpu list parameter. Some of the timer code and RCU
>> uses tick_nohz_full_mask directly while other timer code, scheduler
>> and other subsystems use the HK_TYPE_KERNEL_NOISE cpumask.
>>
>> With CONFIG_PM_SLEEP_SMP && !CONFIG_PM_SLEEP_SMP_NONZERO_CPU config
>> options, the boot CPU will be cleared from tick_nohz_full_mask if set
>> while the corresponding HK_TYPE_KERNEL_NOISE cpumask isn't touched.
>> The nohz_full entry in kernel-parameters.txt does state that the boot
>> CPU will be forced outside the range to maintain the timekeeping. So it
>> makes sense that the HK_TYPE_KERNEL_NOISE should be modified accordingly.
>>
>> Fix this inconsistency problem by adding a new cpumask_set_cpu() init
>> function to be called by tick_nohz_init() when the boot CPU is cleared
>> from tick_nohz_full_mask.
>>
>> PM_SLEEP_SMP_NONZERO_CPU depends on ARCH_SUSPEND_NONZERO_CPU which can
>> only be set for the PowerPC architecture. Moreover CONFIG_PM_SLEEP_SMP is
>> on by default, it means most kernels will not allow CPU 0 to be set in
>> the tick_nohz_full_mask and hence should be set in HK_TYPE_KERNEL_NOISE
>> cpumask.
>>
>> Fixes: 6f1982fedd59 ("sched/isolation: Handle the nohz_full= parameter")
>> Signed-off-by: Waiman Long <longman@redhat.com>
> Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
>
> If you like, it would be nice to remove tick_nohz_full_mask and rely on
> the housekeeping mask instead.

That will be a bigger change. It can be done later on. For this fix 
commit, I want to make it simpler.

BTW, sashiko had also noted that when arch_irq_work_has_interrupt() 
returns false, tick_nohz_full_mask will be cleared and 
tick_nohz_full_running will be set back to false in tick_nohz_init(). I 
am not quite sure on the best way to handle this. Should we just 
disallow nohz_full to be set when !arch_irq_work_has_interrupt() or 
should we allow tick_nohz_full_mask and HK_TYPE_KERNEL_NOISE cpumask to 
diverge? What do you think?

Cheers,
Longman

