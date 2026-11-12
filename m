Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467033;
	b=dY6fHS0tZxCEd7EPaszYmykhR/h54cT0fu7X2i+RWumCPMzvPqtYaga53ohjxxIHulCX
	 8Tt0Zo3dd0nGbLvX8UhXhs4eNQ+88sPeS1mudmtX1QzdBK0T+7s1s6upMlFBeaOQgLErc
	 EjEHQyzaatTpHFhoRimitgXgXfvOJE24cgjSSqxZysswaYxMUph4g+LjeX9XY6YA1vwE7
	 VoD4Ie3EdpZVMVOZimK0zN9GzRl0bJCOELXPUBgy7LXH/AhF1QBwT0YAEC+JMW0xCoZrO
	 ERjJicRDXOJLJa7BoRLWXgTZbsNFGWQmNDBr7xotAgk5P2sKIfJthfRYBN3nC7a68Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467033;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MzKSTO8LvpR1kk43PP3scsPYLloAVo4g9q+JhIcdw+g=;
	b=MO58bNKxzZH0Yc3Msn35fnQuX+ERFnNgQfD/X6aez9UYiGBIeAKckJFxwIeoEYfsvawJ
	 2XGv5fGhV4/cba2V4yvXvqUv7d8Alt3Di89fLQJrsnUAR3ETtbvk+jV+AER5lUjogMLr5
	 ARYimowNyRF4m3RxRLnRXAxeJSH26tW0eU6uVbYl5VWHtZCPcvaqP1NVMBCF8ErelMXG8
	 DzbH6dH2w1pwH1ju5CyH3c9XJMKKJF8WB8nzpcdXout3EBNzYjPu+BAwebiNZibWtwo9b
	 XkUFZlHQ5bwO8WLRQWGE30WICM5gL8GFmBb4/pXLAm9eQBgyv+HJ9t0/hi+bWWV3plA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KXnndV94;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qV7AOgop;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07154606A323
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 07:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07154606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KXnndV94;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qV7AOgop
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794467031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MzKSTO8LvpR1kk43PP3scsPYLloAVo4g9q+JhIcdw+g=;
	b=KXnndV94lsS5jzoxsmJ0+qwT1elkz9szhhh+DTdmZ3ihCwlurHlDWaEVUn8KX2IQVlTtr2
	88M3y3BUKrKwDK6ycDQ+4YS+3aioKaa7i+nnNBsUfsn0P/Yam7F45Km98R0f75p+qrSZYQ
	E0E4naxAr1pPm8VfV9lu1VYVJE+fZc8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-wREXCR5YOmm6Jmv2BxlKbA-1; Thu, 12 Nov 2026 02:03:50 -0500
X-MC-Unique: wREXCR5YOmm6Jmv2BxlKbA-1
X-Mimecast-MFC-AGG-ID: wREXCR5YOmm6Jmv2BxlKbA_1794467030
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so30224765e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 23:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794467029; x=1795071829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MzKSTO8LvpR1kk43PP3scsPYLloAVo4g9q+JhIcdw+g=;
        b=qV7AOgop0W01vPhiKpcbR1iniUM5nKXxDo0iqseOsfEa7Vdop3uUtjikrlcz9SfGhX
         swRduSSzYFGPA6SA1t0n/QbHVPGxqpAkLR364JdwWI2FHto12oirN84ozqFqFMq20r1F
         WUyGD/gKFIKiGOgs8EB7mvjygEmIB6oYqrdDeV6MTrTONcrBiyutaMcXH9UZPOTY+izo
         bdNJUrD04e5vd9Ifm+3QURW2XY1Q0PG5n3UAVMkxJDF3iaDVeuxNhWZcsf/3oDmoYqfu
         VTbWQJzjrzM8tI5fxMlDn45A68wJutyg/8IB6/YQC8CI8F4D7IsPPkKg4DmE7om/b3Tw
         eJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467029; x=1795071829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MzKSTO8LvpR1kk43PP3scsPYLloAVo4g9q+JhIcdw+g=;
        b=M39yYGdjUZdWZTOV25zElLanRxwGBsXCmoVaHTU3x3shprN0Q1Le6xp0U1eLLPmg5K
         BQED24aoqrncdUVT9ISdg9bxhhggyMvsqcP7QWkDwAtYO/fSyyHQwjkuAJfEYlu6I87q
         4ChWmpOEtn2Vc2BAcLPk8J3hWo6DsV/x/2ggr7dScq5Duh+1Je49YQ84X7cAOrOxwNey
         /0lAIqPoreEDHuXlTExejguLobVEuLdCcj+TosPTjC1ymcoHijIKybJhDgDWRn4ibL8c
         bEGyzvFyJZIfQbe3U7Z1DouhDg+2bf8qeoX/CrFThU2WgTtK7CCYnNPQN9lhFikavIDU
         PEmw==
X-Forwarded-Encrypted: i=1; AL+hErFXRK1LrufDfavEzEnWDMooH0qvFabtye9h3J6zWKDAKNi3xuIeTtxDJt8F4C7NyeE7NvTmqXmoOXvj0p1N3Nc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bbt0wcU1cZ2jNjKKHrwq8uQkoNL5j7J1nasltagwdXheD5NgU
	dbptzdkWbsvvVJv3naf6rwHCMelZ4x9RuW2KjGf9jo06CS0M6G3je3J5ZkbTnhVuqJ8ZjJXJ5H3
	U587rteU8srdjuLd1lCD4EQ7q7mFp6msxqeS3v5yrOoQu3t/eqFmnvDZMpESzLClFN8vJDQ==
X-Gm-Gg: AYBFou2L30TyScgHBFi0fHR9MgGqF+XkIsfg5wFBBqWTDbi7Nf+QGwFsc7ekVtHQ1/3
	BdXqRmP9k0xxXhGE/4ZBmPgXbNC8q7oWl97TgZ13mHNmaM0ZYAxqpEiZVUAq0Gx6+5qkXGkuqjN
	9y5meOhxyBxQr6KbsiuFoOtlNdr7zTlDRHLATT0xvHlJ5jdUezGthC+B+SP6rc0b5RfwWd9E73x
	hINgh9f1HqGen+95WtMuWnCDJvrVwACrSwwJ39VX3JAy6DuAzQaOU1pTWS3sGN0D1ZJ2JA2Ilh5
	pJQyUaueOczGuTLjxtsNCkASltdkuhvMoA/G+zEBPgXpe8ZBBzt4afnKcYbJwycBO6blYB3RAOO
	OFBZXihla4CDPXqL/URrwJUQXRNf5BhVyS4rHVtfrhYFTCSS5T2eaudWL6FJ3QKgnDnu5Umkn1L
	3njXQ=
X-Received: by 2002:a05:600c:46c5:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4ba093ab88emr83497805e9.32.1794467029449;
        Wed, 11 Nov 2026 23:03:49 -0800 (PST)
X-Received: by 2002:a05:600c:46c5:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4ba093ab88emr83497045e9.32.1794467028991;
        Wed, 11 Nov 2026 23:03:48 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a495csm14952955f8f.55.2026.11.11.23.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:03:48 -0800 (PST)
Date: Thu, 12 Nov 2026 08:03:45 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, will@kernel.org,
	boqun@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org, longman@redhat.com,
	ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org,
	mkoutny@suse.com, shuah@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 18/29] sched/deadline: Move a task's bandwidth only
 where room was made
Message-ID: <avVk0UU8IRGoo77v@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-19-mathieu.desnoyers@efficios.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108185406.1549770-19-mathieu.desnoyers@efficios.com>

Hello,

On 08/11/26 13:53, Mathieu Desnoyers wrote:
> Commit 7f51412a415d ("sched/deadline: Fix bandwidth check/update when
> migrating tasks between exclusive cpusets") moves a deadline task's
> bandwidth in two halves. cpuset_can_attach() reserves it in the
> destination root domain. set_cpus_allowed_dl() then frees it in the
> source, when the task's affinity changes. Its comment relies on the
> first half: "We already made space for us in the destination domain".
> 
> But set_cpus_allowed_dl() runs on every change of affinity. It frees
> the bandwidth whenever the new mask leaves the task's root domain, with
> or without a reservation. sched_setaffinity() gets there too, if the
> task's cpuset spans two root domains. With admission control on,
> __sched_setaffinity() refuses such a mask. With sched_rt_runtime_us
> at -1, nothing refuses it. The bandwidth then moves with no room made,
> and no root domain counts it any more. The destination would underflow
> when the task leaves.
> 
> Fix this by flagging the affinity changes that come with a reservation,
> as SCA_DL_BW_RESERVED. cpuset_attach_task() sets it, through the new
> set_cpus_allowed_bw_reserved(). set_cpus_allowed_dl() moves the
> bandwidth only with the flag. Without it, the bandwidth stays where it
> is counted, until the next rebuild of the accounting counts it anew.
> 
> The attach still flags a task that became a deadline task after
> cpuset_can_attach(), with nothing reserved for it. "cgroup/cpuset: Give
> back the bandwidth an attach did not move" fixes that.
> 
> Fixes: 7f51412a415d ("sched/deadline: Fix bandwidth check/update when migrating tasks between exclusive cpusets")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

...

> @@ -2957,6 +2957,8 @@ extern struct task_struct *pick_task_idle(struct rq *rq, struct rq_flags *rf);
>  #define SCA_MIGRATE_DISABLE	0x02
>  #define SCA_MIGRATE_ENABLE	0x04
>  #define SCA_USER		0x08
> +/* The caller made room for the deadline bandwidth in the new root domain. */
> +#define SCA_DL_BW_RESERVED	0x20

Why not 0x10?

Also, nit, the comment looks off compared to the other flags w/o
comments. But maybe they just need to gain comments (I keep forgetting
what SCA stands for - Set CPUs Allowed, maybe? :).

Thanks,
Juri

