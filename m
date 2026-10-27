Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082974;
	b=mJlNHVuRqt/ZgJVqkwUoYCc4OQTu/rzLhBuqq7ywdaxeE0Ul1tZinl6rCyFvapu7laRL
	 A5UfGMpM424a/QglxhPzQIwpkV4PLLPzfo2PtxfuMZp/NNC6Kg2LvTZMQPLQHTizciXJY
	 kItkJpxepSdjRU0yRSbimNArG7THVV4kWFWk5h+WQU1SgSYdwkC2PaHDa6o9USPOg6qXD
	 CUhOMYkhDdecUFMjQP5jVk4J2R0N62F3aR5tJ2IiHV7dwGk3ZWffk1JJ4bm+LQKOKYk1n
	 FezYmfj9ajzKQraquddDYIAHn5oxOydX6InGPRyoVm+YTRNi06xbjIQiQC5gScP10IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=/4xZBRPqWoqmG3ZLUyWqQC80cb8SEBhLFlhSnr0xrG4=;
	b=P4+J1wgNOuu+ctz6npFlDZsQq7VmhXREFZC4aikUZw+aED0fPKy45ez+t1SIjz29/nxB
	 /mj9ZhHJS2+ffg3ZeUHHxymmPGOohmc/M6SqS2KivrvEa7x4zwle/M89Mc9cIjfj6jLsQ
	 PTEItKATtMLeJSVq6M8l5VJXNS6YfDcpC4WCz2rZexwcc4f52K3KQFiCuSp7uMekcwLu4
	 jXi+GB62fRVgJqoxqCZMEGf+U3R4RvVreL87FahfHCBNWtQ+OZZUz3sszgg8j7cKoTipE
	 45zJ53HyQvPO6Ul2CGA62OjfDKwmPCe0VKi6JO1bYinn4WcGVwzlkJhgPCOQ/Mlqr2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="oXO5/xix";
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9BB606A32F
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 06:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF9BB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=oXO5/xix
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd61a2dfd7aso869331a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 23:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793082973; x=1793687773; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/4xZBRPqWoqmG3ZLUyWqQC80cb8SEBhLFlhSnr0xrG4=;
        b=oXO5/xixxcmqSABWV2HOCg/JLJ443Sgr5Ze5DRJdvGXvl3NNCkF8nt7WWQrEvx8zHL
         PatDlkNCLCw+31QgEdZMIwd7Yi4vS6qW6eWUBdf6vOxlkePJ+2iD6ScKEMZH09IFCQGU
         tIE9IL41JWC5LojEARxDT8+Qj5WWMLfz/NxgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082973; x=1793687773;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4xZBRPqWoqmG3ZLUyWqQC80cb8SEBhLFlhSnr0xrG4=;
        b=QOLc1g/BSSxCUBAP2hveJO939togPgK4g7M3/XwBC7I4yLq76D8wEXMpnngwAVegoN
         nvkKV6T+okDgiba1hFQprysMMcU7wxgERHntnGhrQn1JYi0OvDFEI4HwJPf82HFrPbDA
         El4+w651JCXlD4+zIzkKbuFUdr6yhaxBos8geh2TbnzwonnUIG1OWyfqc81a9hzeNQe9
         yM7zZg4fHooogiswpfAvmzpivU2FGU7JSJ3kCq65Mop+AJ/2k3Oi0UloeRCZHKeCUmTJ
         uuVwquo/9Sv+AdLsTeLxdzWHTzmZvfRyKpMgtZa22l/M9DcTGIFccm+2VnNKbOeLOG8F
         Q8Aw==
X-Forwarded-Encrypted: i=1; AKwUvByxt7YjiNyWYiRdaivR+BIxrez39H10LASIB+4BnSbP9XbvsGo1FZKbKvnxUoiT/jN5Jy917ZV3H2Xed9F3b28=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPJtiLyovzGSpC1HIukFquq13kRGEHYXlgjP+hKL1lUwNbwUlh
	+IAnPLrwe3ibBJqz6zTb1dqdGgGxXABppLXS0UYMicTV67cSSNMle1vxrwDq9DtKwhM=
X-Gm-Gg: AYBFou1IzBdlb10C2R3gCygJsCwndXncmdH6FvBFMnmwux7YKmHQCTza4DRl0ojVlbM
	Ff00GIGT9DHCbTR9aQmpgW1j3ANos1cxezwHLLSLcruIn9aqmEZviFlVeDwpxs8iZC8MK7+ddGO
	/m0LsYs3nyVbm+AE+mLbqasJ4iBUa81iSlra5fhcJKjEZZh3qAuaPQYH9KEyeRzY2Uz+DDShyIa
	HtWPC8Y3jDsZneozcIYzIZ3W2wlNpgZ6IGhJxoXHuS3yizn+Kc+HRg77oCXoW3QSBdoawV1rBdU
	hDgTV8ueyK+a8ysvlXx61c5UZ8tnxeMjUtCjkpYHEj6TBTYTalD2yLbMH3gTE/MkpMcmBE3BsfO
	eqppOrhFE8WWT5nbx20haZuPP+gzQq5Uq2mRmvTsJfNqVD++Lc7FTxiC7x5A8RmHDFsoyNo1KwK
	hx80HRokE48DdGZ2xHMBgzGZHFMsSyHtVQxMBDu75mYQa9VmOrhcy9bmKBQq1KwxyziZ8fwddfh
	Ml3ZPWsZxdw2yOgyKfZ0Lf5galeHuTodOzaJimfICzdMH/ac9hAHssedFTE6S7l1ioGOdDW2JzB
	YnDmX8sicup4nvrWDZpQIoxnxrMo9Vyz1sAAVEQYJgHJzmzLBHrYU2Cby2qeI6wXLSbQ21ssecL
	vGmIyELrJizn84nbAxyuiZ/0=
X-Received: by 2002:a17:90b:1c0b:b0:3ac:9e5e:d19c with SMTP id 98e67ed59e1d1-3adea8990f5mr7512458a91.17.1793082972994;
        Mon, 26 Oct 2026 23:36:12 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614daasm2254704a91.4.2026.10.26.23.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:36:12 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:36:09 +0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 1/3] sched/core: Skip the shadow stack end check when SCS is
 disabled
Message-ID: <0e607d3aa7c2c4cc1b5b8ba7b0e25ebdb55726af.1793082868.git.chris@chrisdown.name>
References: <cover.1793082868.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1793082868.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

With CONFIG_DYNAMIC_SCS, shadow call stacks are only used when the boot
CPU lacks pointer authentication. scs_release() already checks
scs_is_enabled() before it looks at the shadow stack since commit
9beccca09840 ("scs: add support for dynamic shadow call stacks"), but
schedule_debug() does not.

With CONFIG_SCHED_STACK_END_CHECK=y it therefore checks init_task's
unused shadow stack on every context switch. That is harmless right now,
but the check is redundant and costs a load from an unrelated cache line
in __schedule().

So, let's guard on scs_is_enabled(). It is a static branch, and it folds
to true when CONFIG_DYNAMIC_SCS is not set.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index d7c3b43158de..fc269fd10192 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6152,7 +6152,7 @@ static inline void schedule_debug(struct task_struct *prev, bool preempt)
 	if (task_stack_end_corrupted(prev))
 		panic("corrupted stack end detected inside scheduler\n");
 
-	if (task_scs_end_corrupted(prev))
+	if (scs_is_enabled() && task_scs_end_corrupted(prev))
 		panic("corrupted shadow stack detected inside scheduler\n");
 #endif
 
-- 
2.54.0

