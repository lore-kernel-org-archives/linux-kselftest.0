Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012351;
	b=hV4RGqLLtdHmqrkzPdHT5y998u84IFg0UyONs3zTNoj1blW6EKLJghvGBBSMxOJsqw7x
	 xBEg8R4iM5JXnkjq0IhjBewSZnKr+uWOkwmJyHtk2yjmYeGy4OP0/12NM7AY6GlU2R6j+
	 VRcSipYdZnwDTBpideaH2wzhfpeX3FvmE/HKTYF+0O12h8mKRt0WA0kQSLwERKA6sQCuJ
	 mjJbdy08etsw2/9QgrH5I/RXgYzlCzptsscVl6CPdZmJgPapiz1wb8dIBDWbKE5i/C0s+
	 nQ0L+ynwkdC3vY6Erdja5sj3Ns2UQkFq4sjxn0uqzTzW1jqKtZ+EaLGolm8j3ce7R0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012351;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IYa7d2S4FNA7B3qml35ZrjkyJZWT7YLdzwOJhQFTPJw=;
	b=JPM25KLkDuJf02BDTTPVo99gUh0j3I8qMrSyLJpTweZlsX9r8WV4f2lcL0J4GRt40PCw
	 qHcQcRyViL+vwPfDS8nwv22Fu/dOpEEYfJiSxEYhjFjDsDEUQGMBOG2pkNZR3p57eihKD
	 WdHEoV1Zzs1PYKQ0u8DTtPdG2VlquOAkhN6h6j3Vuw//28Ymlz0AKG2p8PYdQpyaYOShq
	 /0kcdIYGzzL1BZf3ZBcoZ1J0EmvQd3A9B3UNWVBbqqJgnbze+rGmCKkFDEY9BJ1TAiqSc
	 lG2CH1PiB/My4UT/oxruLtqt590VM9dd+idK5t2KvjbCOXXGeHynoE1tYBR/eQeNScw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xh8aO3IH;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jhchfRR+;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6EC606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 14:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E6EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xh8aO3IH;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jhchfRR+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795012349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IYa7d2S4FNA7B3qml35ZrjkyJZWT7YLdzwOJhQFTPJw=;
	b=Xh8aO3IHmGovAn1+3wH/UUw4Ugd/Vt9DaHg7cYgsvqScUGGNgXYHYOihAuruY482zMtI1z
	URTDlDg986sHukFd+o4B3jO6YCN8Sw1AIJOrDK08cG/XDcaHvkK1eC8D+IBIoRrhVCDhav
	krbRccIGhKttFjbA6xv5JIxEmNoezis=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-QHiLSNpDOHq3pqh636s4tg-1; Wed, 18 Nov 2026 09:32:28 -0500
X-MC-Unique: QHiLSNpDOHq3pqh636s4tg-1
X-Mimecast-MFC-AGG-ID: QHiLSNpDOHq3pqh636s4tg_1795012347
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a70b42bab0so8405095e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 06:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795012347; x=1795617147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IYa7d2S4FNA7B3qml35ZrjkyJZWT7YLdzwOJhQFTPJw=;
        b=jhchfRR+9STjT4RdQylP7KrJi5iKHkLKKg+LqCVbi+6LvYc/vlbXKwv+BbYq9IyMB5
         5IuuHmdsLkM2rw2y6UhKtLVj1wJeVgZIliUYnnFwyBooZl3lPlPjle9k6c9PjiB350TR
         ZdRR0OcSgvgiZaML0rzx4h8rU2XLsXvGAbf5Cm8NLa5+SdGfDzvkgg3NiYc/r8MBs1bt
         Y3knU0pXRvWk37uIGmeS3wbA/XMgLSH1UBvdcZsRGN5EhvpLsA4ZZEQcoZXnNl4n2zQQ
         /rWcyjyE018M2KmjNVvvymzL+Nls+cOtEIEDk09i8PkO6LBq6ANB/M00NGOAjbvSleoI
         iXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795012347; x=1795617147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYa7d2S4FNA7B3qml35ZrjkyJZWT7YLdzwOJhQFTPJw=;
        b=HISldPuVsEs9rYhOeXG+pFF7K0i6erkH791xOQA0f3yaK1iMFV9XSvdA3pLpmg3oEE
         1OBEIhY5097yD+zwgiq/vsLtMXn86o488B3S67yLvPyLWG9YBLV/+eWZre6ecKFuTXoh
         e1t0kT1Ybtc9H8Ty3/pwGjdGKnGbv6Ss3mUDgqEBn3MUCnu+EkPBY7yMPizNjPxLmGS9
         OE8WFLg/BCwtEogpLqTwHU5xoV5FrAxAgRUWgtuUdS8/K8s/ny7uzJzIh+tl51KOu/RG
         AIRRrnAoaPEUC9Om7ESTCm7GTmlRG65bjuZjuwb0CP2m+US8hMKWRf/hRb3Kz2aJ/14w
         21Bw==
X-Forwarded-Encrypted: i=1; AL+hErGO1AJev2pqTVogpqRm1tLunJrC9zG6qkHJrlg565+g/t57fL3LP5AC19+KcgbjIDP5LJUBUMf177jA6Cfh+GI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gQfiNGhxnUEZ7pIV7W26E+rCu8uh1hKetN0nk1ByoKH6jc6nI
	zVtf3iKYZRbe8hzBgM7YaNg5z474+JQQWniRk4eTJLWTlkizgRXI8WiiZQZxx+XdgDglYuzOPBn
	f4S2A9srtX3XA6kSyuZcOHQ9ybeU8nFgDI2Y9SOV4Indg/j4vN5z8LxvB995i2QqfZ87pkQ==
X-Gm-Gg: AYBFou2gLyrp0pn8+B3uGkvdDCVHRbunooUObhK5E1jc1fQqigZ/4/Z1581glFHPlBn
	Xi6uLOyalpo39+9FpWeHTXbnRXN4eFSnzVUBDVktpUCS10qsa+Ax7X5kBG+2PmhHqF+4cWE+HMc
	RFpBv905r9ALa5Uhcq6JKtevLNsxtYZEPWtrzsFF5nAwVUb47lTrfPpOohyh4/IezcRBFnQDL4h
	o7pjGhuM69bbd9/EQEAQ9VnTWIXiTNt1D4TM2J4NRp0lOSz1+/NSe/p71YQkh/xjwFxbkCxyt3r
	g33BBHFL1l+XjTMLOPCjdVkrtrspGwV+T5AK9aXE+wFXwrU7HsIikCdzyG3Xn4b0/IIE7PsjrSd
	fihYsSx58xAXb1bsjOn3JAGXZvnO48PMRyJO3StYGt5X7JhrOQAbDrrTa0erBUujnmgKhUV9yrF
	CX8qg=
X-Received: by 2002:a05:600c:6290:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb7d6cd48cmr55544835e9.1.1795012346831;
        Wed, 18 Nov 2026 06:32:26 -0800 (PST)
X-Received: by 2002:a05:600c:6290:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb7d6cd48cmr55544025e9.1.1795012346150;
        Wed, 18 Nov 2026 06:32:26 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2aad96sm58360485e9.6.2026.11.18.06.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:32:25 -0800 (PST)
Date: Wed, 18 Nov 2026 15:32:23 +0100
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
Subject: Re: [PATCH v7 08/40] sched/deadline: Do not replenish a boost from
 cleared parameters
Message-ID: <av2295tJMdwRp3wK@jlelli-thinkpadt14gen4.remote.csb>
References: <cover.1794922146.git.mathieu.desnoyers@efficios.com>
 <cefacab5f1c0e7617f17e050af4ef5f6db01700a.1794922146.git.mathieu.desnoyers@efficios.com>
 <av2k8JlLvUcBBOhn@jlelli-thinkpadt14gen4.remote.csb>
 <ddd215ff-d6de-4dea-b12a-80948a9b5ea6@efficios.com>
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
In-Reply-To: <ddd215ff-d6de-4dea-b12a-80948a9b5ea6@efficios.com>

On 18/11/26 08:44, Mathieu Desnoyers wrote:
> On 18/11/26 14:15, Juri Lelli wrote:
> > The above paragraph is a bit hard to decipher. :)
> >
> > Maybe something like the below?
> 
> Yes, thanks. The next version takes your text as is.
> 
> > Also for other changelogs, I am not sure this kind of info adds much, as
> > I fear it will be hard to track down in history anyway.
> 
> Agreed. The next version drops the sentences that name the review that
> found a bug, in all the changelogs. The credits to people stay.

Hummm, now that you say it, crediting Sashiko for findings might be
worthwhile (for usefulness statistics etc), though.

