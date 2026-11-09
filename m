Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259475;
	b=wDaYnnAsF36GgTqJDqoA3p7YnZ95KlZIn+D8FgUhdWlsERWDaf8Hh7nPk+w3XBmCNkSN
	 9yt0+Fmg0BmoC2Bwgw+i2kOBKri3kveDugg6IwKUNd/mAigLP3CvKvxOs/91UrFnXKr6j
	 gvAHvuGdk/KWYCKwkS4/RX/+rJDJFHt+9WsfGS8+Ow41ZeQZUR4Vh6e25Zmn5ti85jjSD
	 cEyoG+g5shIeUbBUUz89etJNJ7eifDNYDh3liOlxNXi1g341RXMfOtrP2+mZ34fkMkdPr
	 8GblgfLCciCcwIqv0itCk/z1DkoIlGHTQg2sC6nB4Kgv91bYFNXzwpTnlEhZJezl6hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259475;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=VwNIMHVC1qCxujO6tLJJkfLjDqI44HVPYAXEO2T1aqU=;
	b=hgb3oHsymC/9NvYznaT5Eg9CrUGRe84/cYUDldC9CxIeok8ZAR2NojGL+v0pBhr5GKxh
	 FimDd+jaS8MvEpAyA2eZDbKXQR+Twb7+4mOyVNuprTq++QjP+BQqpxU7E5SwGGXBMgFPq
	 49IBn9gBS2WE67aB8AULSeHEmMWY3JYWro2+fK2NJxRzYQ4e80bfd/0ZCgPD/FCFPTmr8
	 JBsOP4/XBRoB8cplRV6C9LaoZyqWRWN2cpXKhc/F1/d72ULqfgXlvPwSidVbrXVoTdl0a
	 QqukZRuEE3WZq0e96PmHr9fhUN+Eh0F1Jw6ZwDbkb6j6Pyz8OBgkEZpqfPHROKfI3fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=ojkFtnXk;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FB9606A31C;
	Mon,  9 Nov 2026 21:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67FB9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=ojkFtnXk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=VwNIMHVC1qCxujO6tLJJkfLjDqI44HVPYAXEO2T1aqU=; t=1794259473; x=2109619473; 
	b=ojkFtnXkhCXJ72z3JXSsOAMN8ZI1qCrMk2fK//lClOf0rCVlCdoil5Qk+9ojd95rgQ7lgDZiqvk
	rvCy8xB74NBxjydkaoW7Y9NPBwfEAn5Jag1MzKxKmdEYVeqhxXRqAfOrlUSQUf8yJEswBu7e36gKf
	HkVX5yc8+Ub6//G72gLmgm7eXNlkchgdPwfnpAjoOZH7CcQfvLrvyapBmWnAClz4ubR3fYbLkX7lA
	LPRhq/ggxaqN5g/1FpRhR0Dz0HNrDHbORNZVsvfY+RKOoakerzKWueecaNu+wftn8GczfrNEQhF7g
	YBKxVg5/HWVFshrCy3ow2Ru8ckOPEScQnC1g==;
Received: from [177.172.122.137] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xQWqi-007kQb-B5; Mon, 09 Nov 2026 22:24:20 +0100
Message-ID: <80f6613a-9a25-40f9-a6af-64581ca800ce@igalia.com>
Date: Mon, 9 Nov 2026 18:24:26 -0300
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
Subject: Re: [PATCH] selftests/futex: Skip futex_requeue_pi on unprivileged
 thread creation
To: =?UTF-8?B?UsOpbmljaCBCb24gxIZpcmnEhw==?= <renich@evalinux.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Wake Liu <wakel@google.com>, Shuah Khan <shuah@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>
References: <20261104150546.1041422-1-renich@evalinux.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20261104150546.1041422-1-renich@evalinux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for the patch!

Em 04/11/2026 12:05, Rénich Bon Ćirić escreveu:
> The futex_requeue_pi and futex_requeue_pi_signal_restart selftests
> create threads with the SCHED_FIFO real-time scheduling policy to
> exercise Priority Inheritance futex requeue operations.
> 
> When executed without root privileges or in environments lacking the
> CAP_SYS_NICE capability, pthread_create() fails with EPERM. Currently,
> create_rt_thread() asserts that ret == 0, causing all 24 parameterized
> variants in futex_requeue_pi and futex_requeue_pi_signal_restart to fail
> unconditionally. Missing execution permissions should be reported as
> a skip rather than a hard test failure.
> 
> Handle EPERM from pthread_create() in create_rt_thread() by invoking
> SKIP() and returning -EPERM. Update callers to check the return value
> and exit early so the test harness records the test as skipped.
> Privileged test execution with CAP_SYS_NICE or root remains unaffected
> and continues to run all test assertions.
> 
> Fixes: b7d837c2d49e ("selftests/futex: Migrate futex_requeue_pi to harness")
> Fixes: 7fe733f11215 ("selftests/futex: Migrate futex_requeue_pi_signal_restart to harness")
> Signed-off-by: Rénich Bon Ćirić <renich@evalinux.com>

Reviewed-by: André Almeida <andrealmeid@igalia.com>
