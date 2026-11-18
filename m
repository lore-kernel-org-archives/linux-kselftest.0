Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019893;
	b=oq5keM2GG2nsHnoL0HtS3TSel/y1r/sPQxNBBXDn17S+vBIY+nsrGEu+Nv8SRXA+26MD
	 DXTyHerhzYki0OD82BE+HHvVvMxozR65yJlf7jMaairNBi5oi+UyUSLIeRkhffEW7VXou
	 +Y2VISnTATfy6wdQWyiKZFDFGYqu+M6el3pxck/8kUbM+L8jMYRxo9v2EWeKjVNZKzGWQ
	 u5wgCNC6y1w3AjsPjTYE1v56yanac8t7GHQjXrg5xgPRXFAkpmXp5oECr2o1JeSvvuiYs
	 49PF43/yneYL44HXMoAbRESD2cMsutyuUQB/mokVdrS56YrxOXZ5b3fgxZ03SCIJbnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019893;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=V7mJeiSJCVTjraIciJJrP4E+euyuUY8Iim8ikHfaISQ=;
	b=IAOl/JgdjLQf/F3LNY9z8TeMJucO5hjkhKWPRT/1K1/lK99pBsiLWghjosNGMjN9pSjp
	 mXP/b2hZo2JriakfpsAT5hLwd+7Lz4U+OyXDtK1TMEwlccZvxde3CUQbkHe6asUx6EiXw
	 BbVofZ3UkAMgZ0epsVnZXxK4I83v3MaO0v9jNJ8kwqQlCxH8Nsn2UIoCyIeNR75iaUC8g
	 dlT2ZzErd5SiViLjRDOubyVN2FON1NT6ln4XPxQyTdJrfqIAG+LHrLXdWQLMY3nUlP0J9
	 BXxc4lC5sZoTOzNf9JNMEwbgASw87/snp86Rz5+7K4hwTKKvIK5T8NGepf5Y1DxKs7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uK7X0Dfo;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xPoOYmXL;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F88606A32A;
	Wed, 18 Nov 2026 16:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23F88606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uK7X0Dfo;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xPoOYmXL
Date: Wed, 18 Nov 2026 17:38:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795019889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V7mJeiSJCVTjraIciJJrP4E+euyuUY8Iim8ikHfaISQ=;
	b=uK7X0DfoIne69g0yXQMBSJNgig84GmBBKama+JLaaIgkazJp4dm7/JhP9xlkk/EJkg6Kxk
	uTdLoXMhELgIzbvQIvq1MqK2XRP9hqqJM+3p0KvuPyx//hnV/jjPrhVivmyKDWzKVh0EuO
	C53YdqQSxGuFeE4eMegPyfCPckZS3M8NB7GrdOgBZbtQdzFEsTZqehRxJjiWw3MPhHxrdA
	YyAzOR2mMVZpe3hgXacPfGVHQJn1uFTNxbAqoEMheYzL1D2Tekn1g0mUz1L/7ZFBhtNE6d
	jYBfTdk/WzeKpJQ8usQrFm2odvYdCflhH1MYhvvDGhL1OsNDo5RYMlokrvDeew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795019889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V7mJeiSJCVTjraIciJJrP4E+euyuUY8Iim8ikHfaISQ=;
	b=xPoOYmXLPL31H1HUpE17x11g4ZXHh1c+tvwXldjILuUsoFXpNOMA66/hVut9Cb8dzQKDmT
	ZgYgAMbg/EqS0cAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, tglx@kernel.org, mingo@redhat.com,
	linux-kernel@vger.kernel.org, will@kernel.org, boqun@kernel.org,
	longman@redhat.com, rostedt@goodmis.org, clrkwllms@kernel.org,
	dvhart@infradead.org, dave@stgolabs.net, andrealmeid@igalia.com,
	shuah@kernel.org, juri.lelli@redhat.com,
	linux-rt-devel@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 5/5] locking/ww_mutex/test: Time an ABBA with both
 owners running
Message-ID: <20261118163807.75hxTxGn@linutronix.de>
References: <20261108141347.1525532-1-mathieu.desnoyers@efficios.com>
 <20261108141347.1525532-6-mathieu.desnoyers@efficios.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261108141347.1525532-6-mathieu.desnoyers@efficios.com>

On 2026-11-08 09:13:47 [-0500], Mathieu Desnoyers wrote:
> In the ABBA cases of test-ww_mutex, an owner never keeps running while
> the other context blocks on it. With PREEMPT_RT, a ww_mutex waiter
> spins while its owner runs. The wound that resolves an ABBA reaches the
> waiter through a wakeup.
>=20
> Add a wound-wait case where both contexts keep running. Each one runs
> on its own CPU at SCHED_FIFO. The younger context holds B and blocks on
> A. The older context holds A, then blocks on B, which wounds the
> younger one. The older context must get B within 10ms on average, over
> 10 rounds.
>=20
> On v7.4-rc1 with PREEMPT_RT, the case fails every time. The two
> contexts spin on each other until the fair server preempts them, after
> 950ms by default. With "locking/rtmutex: Stop spinning on the owner
> when the waiter is woken", earlier in this series, the older context
> gets B in microseconds. Without PREEMPT_RT, the case passes with or
> without that fix.

This is the ww_mutex equivalent of the futex case on PREEMPT_RT. I got
lightly distracted by the -35/-EDEADLK error it always returns.
Something that we might have since v5.16-rc1=E2=80=A6

Anyway.=20
Since both (ww-mutex and futex) use the same code I am tempted to say
that one test case might be enough.

But in case we want this,
Tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>


Sebastian
