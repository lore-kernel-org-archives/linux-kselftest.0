Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582301;
	b=0iUpzxByPKLl3esZGd8UEbJSHstdLWYcMLhxcbQz6FFUTPRQzrDtALBRoxhSCvo8be0X
	 7bHnha/wf5DTAp51yig3BjBD0fBdvy8zjXW8YNrdGxrHPaRJ9erd4Wi0xpFEuqB+RMcWe
	 mpDsrySlz9ddOPQRQ5leOmBHUxy5nmizOQbvwqSGpWIfgxixjUCsf/azTNgEQUOCWg+Vk
	 4PtfByOyF0INxUjG9WZPU+Zu7izbdXPNbM21TNYiWDCh3C8laPYsxE7WfRP4kzeYuTkq6
	 2CQEmgLmzs0W7dseBCZVv5wNfTqq+MXoZMNnSvCXcBD7DQzoStst3TWp01jwIiut8rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KemPF4UyXFCnRn0FFZM6lfFKM0OQmZfUuPBKXbcJpj4=;
	b=0Vl7IEtrAxuR8MrsQC3KeVlv6aQdQLLKJpRcPkuBDZHc/Dyqvpko0e9IylxRpT/N3Q/m
	 Mkbh4hrM7SR0a17KzTjT/22Lj3BuAzi3mM4KLkVLCRNx9xmmmPnhAKZDawdx0F7cZ3I5E
	 v/M5TRlKnWFPiqHei8S5Jty9DPcZ0lAq2snfhaYLDsIyGkWWAWisuF3KWXox+3c929cO5
	 FM+BhWLDkJK9uox1SNl5OsAfDQWeQKBNdxXA3sxxD70iiOqubAknqjOSUSkJTwmqtXmFd
	 ZaODxCc31XXAbQUrAL0nNADRyvqlQwBBwSuAPJLH8gj9DBewjiujKK3RF8Vz7pAc7hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YRzKTiO8;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582FE606A887
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 15:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 582FE606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YRzKTiO8
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49a92144733so406819f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 07:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794582300; x=1795187100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KemPF4UyXFCnRn0FFZM6lfFKM0OQmZfUuPBKXbcJpj4=;
        b=YRzKTiO8grTuhhH901jJ29obt0j4Vt+j43mhWEoTgbm1muLsCcdfRcEaCkVPj6ommm
         TzC2ro3m2xKqeVvot75B49gn6BAIu5fwOPn6dPQx5xru6EMzZoJIyhaD60IONKHoCPcb
         7uIIXD6A7rTrBEi076STClaiA50f8iR1Gn8EdaKRwK+BdqTfpy1eaKQABYeC4scIIHzs
         J02TFbKm7Rn3I+TWXFraArR9NqrdYPCKpeMQRJsAfrR6hv2GGI+o+zI6mMzQAgZpp8tj
         g1Rd1XrgKCppTBbiBEPdjuMH6qkBKMsx/4YCgdroaqU7fOldE+uJWAbdZp6o7PjcQCcu
         IqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582300; x=1795187100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KemPF4UyXFCnRn0FFZM6lfFKM0OQmZfUuPBKXbcJpj4=;
        b=whPjTt2tT+bwJTXTV/+WrV5dcbPTEFp6lcAoNhQsR8yvWYRZ07BNmxFXwH5PbFmnRC
         C4/dnj6ZFdmX09PJ+wpmN6cj+8iHb8GnK9VVrKz4Fn0plm5LbahT2nKGYBImDwGGnM+a
         9KbJDLsxnxNkBaf/xBUAD5wXNg+Qw5eAi+2PxiqZ1x3Ku5nF0ZzhkpwtP/TqsrAN98Qe
         hvuNwApljpchYkqjiCs2s35CwEBkDQMuToo6mLSWtXPLbkmjS8wBCRsua5xrYlYFYbnI
         KfoEjZuevoauyXMRwdPa4Jjw77isznSefAeeHiLldrSO/trq5kmYd4/5+J2KBn3PM5V8
         Aw7A==
X-Forwarded-Encrypted: i=1; AL+hErFxe7srZTqnq+IiXE0IP5BgwIB10lBPZLZOMayYuKzML+VqQA2Zo+qGIrdXx1F83ndYrNc2NtTJfu98xA6BO2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z990uHYm+WGAofq1Ygexbga/VgBc556FTBCWs6a2qiUNUor5yfO
	UtFmc+HjEluOBtaLfHgNOek+OjPb0Rb4FwnL9LtmApm0osc3LxId4y7t
X-Gm-Gg: AYBFou0htnFEUiQGE6LX4Gb87ukQC2QKg7C1SpHhOCNVPeQQuvHJyCDCfpI0UV7V07Y
	rc81SFhVPqYTeWBPnV6abgApMG9Z+tYBgYRBPzIFyTCXCJHSqUueRKROqCk18FmzRVIBKf8UWGP
	IyqKrmWhwyhMTJcjF2syeehowsONEzckzYWQz3WolyMdliH/oWkUOQoApjjFN72WDoFTPxnr7pQ
	f1olBtB1Fa2JB50dQFXb/pDB2lwovEcpIavKzEownJwB66qVeknpy94oPcTUnAyOgbUKrBkIn63
	AMC3zBWrloEzMmca0xRovqM2l5tPuGZhSRD8V+aE+FRdFrLBYTufZJF5LX0KoHui/asPHABH5FL
	9rmj0TmfJwyivUwDPL5QsdOpuhYak+DoblRh2kgQgiOcSJN9iYXX8LMGQgT3iMaCn1/bh/Ijzmp
	U8zVGmmx3ejwGJnLi9AF/Mc5a8aGPOMWWRdgagN4sv4IHlv+k/wZ97jpmTtrANaGEbOTDI/I2G7
	Mg74EytFRtUHplvjzm+xIZEZ/5jWAlYR0icMwtUD8rNNdoO6q117F/OUFNGapIHf+kb1NFIGCAt
	ffGPAuAIUKk4iZiBJF5erWIaIBhQmyblDqfIJC9tnzkoSlIMOflQqTB3NCMWVkbPUxSiCo30x5H
	geQ==
X-Received: by 2002:a05:6000:2486:b0:493:5d67:499 with SMTP id ffacd0b85a97d-49c712ac9edmr5552285f8f.14.1794582299355;
        Fri, 13 Nov 2026 07:04:59 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.56.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1797sm6390874f8f.11.2026.11.13.07.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:04:58 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	peterz@infradead.org,
	mingo@redhat.com,
	vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	will@kernel.org,
	boqun@kernel.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org,
	longman@redhat.com,
	ridong.chen@linux.dev,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	m.szyprowski@samsung.com,
	kayracizmeci@gmail.com,
	weihengqiuu@gmail.com,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v5 18/29] sched/deadline: Move a task's bandwidth only where room was made
Date: Fri, 13 Nov 2026 16:04:36 +0100
Message-ID: <20261113150438.9119-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d58e067d-05ae-4e4d-9d34-b0ac2741b211@efficios.com>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com> <20261108185406.1549770-19-mathieu.desnoyers@efficios.com> <avVk0UU8IRGoo77v@jlelli-thinkpadt14gen4.remote.csb> <d58e067d-05ae-4e4d-9d34-b0ac2741b211@efficios.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 13, 2026 at 08:35:03AM -0500, Mathieu Desnoyers wrote:
> Hi Juri,
>
> > > +/* The caller made room for the deadline bandwidth in the new root domain. */
> > > +#define SCA_DL_BW_RESERVED 0x20
> >
> > Why not 0x10?
>
> No reason. 0x10 is free. The planned next version uses it.

Hi Mathieu,

A heads-up, since both are under review: [1] adds SCA_DL_CHECK as
0x10, so if your next version also takes 0x10 and both get merged,
the result would build with the two flags silently sharing a bit.

Your plan in [2] to change the affinity check and the early exit also
overlaps [1], which moves dl_task_check_affinity() into
__set_cpus_allowed_ptr_locked(), right above that early exit.

I'm happy to rebase [1] on your series, or the other way around,
whichever is easier.

[1] https://lore.kernel.org/20261105164856.29698-1-parri.andrea@gmail.com/
[2] https://lore.kernel.org/94d8d7af-b04f-4c59-ae3b-e693d4457a65@efficios.com/

Thanks,
  Andrea
