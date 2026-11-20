Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179925;
	b=TCYz22IWdkBd63Chvb02GrT3aQf9nSObiXE/Pid7Z/YGA0HMyQq+Skf7vd0bzy5NjJ3Z
	 okr0mlbZJMZiYnuR9P7g8FUUqf6JtB/N+2yxJqrZLESityk3a3MGj7pg5Q7Q00ook+0CD
	 N2KMyLRG5XbHyEiy7hvwFMySB8owsdHiA9712apPJlP/hm3vqSAkVzQjjgnz7veV2AP8Q
	 KfUC/zqtd5FbIhLhICXjFwOZvff8Iu5o8TFc4PCvLEBGqEGnQf4TDCeUm/YWosIG+OJbD
	 n1iaREAkBCgyFwvRuoSaWWd887gPU93fVaMzi1oW6p6+kx17cFL8YiKAM3CejSAJekg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179925;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=P1l8hjvVS49GyIA6u6rGG13XCHYYHrZ9VUNaIusOyIk=;
	b=qDVZJCrQQ73Ri92tHwduDLU8fVqQ0Bm0WFHcFH5Qw6oovF3QcEbIpN7vCrGaQ+m1wpk4
	 Hj9dHGE/1aChNAy9XlZMhE0IfPGug8DdQwkwCrIoZy+Xch6rTBpK/KFtV2W/nS2rnSt79
	 41Fm0FQmc3h4jVi9SFlNrLVs+Rx5mE+XyFqN5fxdnO9KDhYXNCd2rGzsdNajWFB++bzdv
	 XEYDnR5c0VHqRWmLmWchTBr4q3cuOJRBgutUyYUeglSAyzTIq/iZliZofqE9a4S5XiUoJ
	 QScIMto5ablhvN/821668qEw0wi3CT2KK4JwfRB0YpYwY00iu5c2NZdzE6YcCdRtBUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OhjTY5YT;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="a7E5Q/at";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C87606A32A
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 13:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89C87606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OhjTY5YT;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=a7E5Q/at
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795179923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P1l8hjvVS49GyIA6u6rGG13XCHYYHrZ9VUNaIusOyIk=;
	b=OhjTY5YTcuoDbjWOWWYh62bB2E3Uh/h0WJ2tdy2TnyM6djSce7ywoWMkdtsKgguff975BL
	A8EUfdT6oTlpJweZR+etDaniqErkkZl7rBsBkzzMa/1iOe6hrijS6yT6m646Sq0OFF/z4Q
	tYqp7wRsS3gmSLEEFh7vWXVZSzebCLM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-j3mm_fSbN366m9quFD-Lcg-1; Fri, 20 Nov 2026 13:05:20 +0000
X-MC-Unique: j3mm_fSbN366m9quFD-Lcg-1
X-Mimecast-MFC-AGG-ID: j3mm_fSbN366m9quFD-Lcg_1795179920
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb69d84053so6738915e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 05:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795179919; x=1795784719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P1l8hjvVS49GyIA6u6rGG13XCHYYHrZ9VUNaIusOyIk=;
        b=a7E5Q/ataALL+4CgEZhd1/J5a6wtd4Qr7q0QjAm+vqgoEh1WazQWKqUvtZeABshdr5
         BZ8w0ow4XI0vd6Aws7ckDJEyccq1QNcI6suKHQHvEEyvIjtiLTuCkowo8BpJyelOWYgy
         /UOE2YHL2iWIVODyvLYMaEPe0ANXjRSe/Cfh8QFcyZY053+EzqA+hW36Ez418LE4lU2R
         GzmNt8iAVXH5KSugNbLql1JDi1189UOHJ9DiE3xrrw4i5QCQEgMmNhL+m8oPavLfal/h
         qNslfkxBK16Akwij5pxzwWlixaepoQY02h3PBfIvbW/Zcgbzk3v2zKinRBjyeev8MdbO
         pUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179919; x=1795784719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1l8hjvVS49GyIA6u6rGG13XCHYYHrZ9VUNaIusOyIk=;
        b=zsdXWClzTvVJlCUcUYSbulAwgMknVPCbqEGEsu1FGUYannNT1g4OTUWn24kqnLKrZx
         OP7vFrdXFLP9XK0iMEVTCAhAej6j2VzZyawl22BFLscLS7NGUcnq/ZsjN6aG9/ldJ5AP
         wNOq3t1FaYglj+Q3w8hhogq0lEAQsJPuoiSnlM5w8NB9fX3R3BZZsNQEiaH7qFLLcTf1
         J166KldZL7Yk7xMIfphWTEVQxyh5rYCkMUzDWUG7bESAS8iPZyxPZSs7HhMJ2cpgzNOz
         VMaDi2jNN+Zwxt3zVdlVI9VDQgc6M94CG+7+rgYV5lvcXouhFVsc4tmjbXomFDulm3St
         vjmw==
X-Forwarded-Encrypted: i=1; AL+hErF+wHwJE5qTm8x0ALBXmy8knt2rL1XyH3piFnLyLGBuqO+e81RnYb1Pk014nA+IKXep05D1VYWy+yMSVn35k6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qS2HMlfJhyu2APqu23ioSVdJgoD9Vun55TBUyO9/8sx8ZYQaS
	s5tyNudOIhvKxhflIvSqFwFpfDh24B6JGIbP75BWTGjzJDly+pQrczxOdhfVQlNn79HbMDDWa42
	bZ0XgYNwylr0lLNUWkg/nKsI8YmWGIcOnOA8Rjj8QeD7ADDQx5ZRdIWU85w94bye1D7eSkg==
X-Gm-Gg: AYBFou3RLyXkeqGNAtO32+mBLNtUaD3Ijak8g9o7txJy+csrPJw0XC13MKnvjGhs3mC
	4cI4A7n3aVB4+h/J9S3DAGVD3pr0Oe/THvJgRZkbrATce9ilPDQmljXr45smnHK07rdNhGCm3jO
	qDzXHvruQTJMfsYPzqejB/JIgDFAyDYbMySjWVeY+p72/by0ZvPCEePMoJHJctXasJM/Ra02ebw
	ArZi44mHxVA/WlCEA+emOlLFpwC0TGUN2yzl58xt5YywaT7tPkII9AeVS8jDiWNCu8wB9hkG0Ko
	T3EIv1aqdZPUMxJatnJDgTmUGE9XZDM1rlTB3VNlieu8x8eewG8nh8obwWuqxBBQ5Ndl03/NOjd
	RVN7Is9MuZXuaPF5R6ufDAZ8NBbTrsqkGf9WviSYq76bLmBpcoYhqBvatT3JVOgyUoddL52tDyO
	r2EUQ=
X-Received: by 2002:a05:600c:820c:b0:4bb:6f6a:1976 with SMTP id 5b1f17b1804b1-4bb887c2923mr64602965e9.2.1795179919571;
        Fri, 20 Nov 2026 05:05:19 -0800 (PST)
X-Received: by 2002:a05:600c:820c:b0:4bb:6f6a:1976 with SMTP id 5b1f17b1804b1-4bb887c2923mr64602195e9.2.1795179919119;
        Fri, 20 Nov 2026 05:05:19 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm85099165e9.7.2026.11.20.05.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:05:18 -0800 (PST)
Date: Fri, 20 Nov 2026 14:05:15 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	tglx@kernel.org, will@kernel.org, boqun@kernel.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	luca.abeni@santannapisa.it, mathieu.poirier@linaro.org,
	longman@redhat.com, ridong.chen@linux.dev, tj@kernel.org,
	hannes@cmpxchg.org, mkoutny@suse.com, shuah@kernel.org,
	bigeasy@linutronix.de, clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v5 00/17] sched/deadline: first bandwidth accounting
 fixes and selftests
Message-ID: <awBFi0bwFt5KoEq-@jlelli-thinkpadt14gen4.remote.csb>
References: <cover.1795115075.git.mathieu.desnoyers@efficios.com>
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
In-Reply-To: <cover.1795115075.git.mathieu.desnoyers@efficios.com>

Hello,

On 19/11/26 14:06, Mathieu Desnoyers wrote:
> Hi Ingo, Juri,
> 
> This series fixes 14 bugs of SCHED_DEADLINE. Then it shows the deadline
> bandwidth of each runqueue in sched_debug, and adds two selftests. The
> fixes come first, so that stable can take patches 1 to 14.

Thanks for the respin. v5 passes here: deadline_switch_test 5/5 and
deadline_bw_test 46/47 (move_cancelled skips), also with scx_simple
loaded (the server cases run on ext_server, hotplug_server skips). The
sched_ext selftests pass 40/40, test_cpuset_prs.sh passes, and there are
no splats with lockdep on. So you can drop "not tested with sched_ext"
from the cover.

I replied to 10 separately, with a readability nit that is not a huge
blocker.

Peter, Ingo, I have the impression this is starting to look good, what
do you think?

Thanks!
Juri

