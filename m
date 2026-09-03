Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EC64AD4C5
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441643; cv=none; b=hDznq/Tjaywx26V/wU2PUouIihXIEuN3oDZXJJbvomKYhFRIOhL5PU1XQ2ZYVKjpKJ1A65EAUSDrQOt3WZlbJcRgum9TgxqoVYL0/wxWK+oPNNLN4PVEe5H9SEm5NMvu85prbXhSVf9Rq4XECQqrHI1LoketSQ6LsB/zTz1SCC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441643; c=relaxed/simple;
	bh=QsXLGCKPGHsqeuuksVi+d85aa1e7GXd7VarnEp1TSdk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dh2aWbnPyIrs6ezfXaEgPoIoEXuFKQlCNZoVFXXQ2zRNjs6wyPAYW5g0JQQ4svJCajJpyVMtS2PXu9m45BPQ42eHbQtxlp1rBoMEgyqMqyM9QQMV9topycbGCxrQaTUHmbEBYp6O9c4AADxK5q4mquXGZCf+LgcGjKzIihjqDJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZ2CIFbh; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZ2CIFbh"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d53197d8b5so21613455ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 03 Sep 2026 06:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788441625; x=1789046425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QsXLGCKPGHsqeuuksVi+d85aa1e7GXd7VarnEp1TSdk=;
        b=CZ2CIFbhR50yg6dwaPIuUAQjIhs04P1O3IOQKqgIFjKXHmt0JBPZWwqvXoPONtlYcC
         YlM4R83ZJ1/m+itGIG++82I2cXUaXI+OekmPXXTdQnSLBWg+GztVzPqMWx/NqecsvfEg
         Q1cep53BqWnQJTYf15wU9rf3PhHstVivCK0QwV2X2UeCXMl0K4v6hREGsr3jSjJtmlPJ
         fxZM0sDCC8dPvFtoPxHysgEDWV9jOEwzIr/1Sus18AXki58MUuT1mc9KS7S+PqLpanhD
         gN+RDQDjuNZlUn/fvxTwnBYdD6T1QyZCZTKNk95OrL3eVHkxdsSbDUae3ZEJ5GfixP2V
         y4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441625; x=1789046425;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsXLGCKPGHsqeuuksVi+d85aa1e7GXd7VarnEp1TSdk=;
        b=RAIh8Ga9t3zZmEFIzI+15HklSox81LxIUWEyWAXQeh5I2Ppn8aiU0/OLm5zk6RM91M
         EHs1AMQIF2pNxFJDKnBAMiq5ItJpUN1r5KJ93zRjIzLs8PKjsLMB9ftiV7QY6E20UlFk
         Oypt12nXZZyFbcvw9EmpSTCraFfLSwSESXRjjvmue6Jf7jKkGNw4faKWYwKw5tZeWKg+
         jsCWoY2z64r36KOcNyZc8zRf9TKRZc4RDpOOjVv1PcvZdjGM/nysYmhiaLcugh+xoZ/9
         xtxEpNBa4yaovkD2+F5vfYffrlY7wGIBwZjaHJg4vHkduc0d/tl38RQGYlzUPZ9Tcp++
         zPtw==
X-Forwarded-Encrypted: i=1; AKwUvByW//bFAtyjKdxpzaQnoCkOyQx3CC1qtQ+b3ejLJ+ETLTeNWRBTBmfV9SVbIV3WFGQcKWyPgEnCoPb1QvbGZi8=@vger.kernel.org
X-Gm-Message-State: AFuF++kRB0k1Gab+f2cCngngl8ozATZ9NiZOH0F9h4Ny6yEdTMCKFPd+
	JRIanfvZ3OxNUdEzSBUbKkIR9CK+ukO3MRCUsE11kpSNXyYVT4/QfIwX
X-Gm-Gg: AYBFou3jKnbtS3n1tVTBqRrcPJ7ry7U2/HZQIZPx9uxPUzJ0a2tOqUzvZNch2rqyKae
	gfasvBuLrXfrh2h/RlLUBbHW/kR8sedwY+nZZdKIQ7XkgfgJKJfwPcZNuFWdULWh03GtC3lMO5d
	D0ajGIgtEHfTRNtN2FtTf6QTj/5ddDc14QdVFCNN1sSPtK0UNleTuN8t4rL3flp1Q2wT6D3QDwZ
	+UnJW1hqJ893+LRVm/piwnTrIIJhSRGNOoWIrzhGEaGWZYkregiCw/GEMAXqR1lQ+NCoR/5bkE7
	Njgr1XiKO1nUOPSgaIdP8x9YQO7ytqkjdYxZqIe0Gy2V0ncsHdcuc7uoTOugSwU1nM1nPum8N+g
	LyzxO0xPIICO4/IFwp94/tnPrBarl9P/L82YcQMdBG3ixmMBSzWYj0La2vAzd1UQPRTCDgQ2VmC
	5iym7Aqzdo/WEjkx0mcFvLeT7ytBSfbOMFOTVbNHIPeW3M2YEvZoixiBAjZlhqT3eyOcmQQc+oq
	Ba/yIFljNCzXEs=
X-Received: by 2002:a17:90b:4407:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39aee219427mr17916381a91.18.1788441624461;
        Thu, 03 Sep 2026 06:20:24 -0700 (PDT)
Received: from localhost.localdomain ([2408:8607:1b00:8:d43b:6dcd:a4e9:1d79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae902354asm2702545a91.2.2026.09.03.06.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:20:23 -0700 (PDT)
From: Pengfei Li <ljdlns1987@gmail.com>
X-Google-Original-From: Pengfei Li <lipengfei28@xiaomi.com>
To: sashiko-bot@kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v5 1/3] trace: add lock-free stackmap for stack trace deduplication
Date: Thu,  3 Sep 2026 21:19:46 +0800
Message-Id: <20260903131946.239190-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902065744.DFA1E1F000E9@smtp.kernel.org>
References: <20260902064242.28606-1-lipengfei28@xiaomi.com> <20260902064242.28606-2-lipengfei28@xiaomi.com> <20260902065744.DFA1E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026 06:57:44 +0000 sashiko-bot@kernel.org wrote:
> Is there a missing check here? It looks like ftrace_stackmap_reset() omits
> the tracing state verification entirely

> Should tracing_reset_all_cpus() be called before this memset?

Both observations are correct about the mismatch, but the code is the
side that is right. The stale part is the commit message.

The intended semantics, following Steven's feedback on the v4 thread
(https://lore.kernel.org/all/20260821235129.078dd489@fedora/), is
map-only reset: reset may run while tracing is active, and it does not
clear the ring buffer. So neither the tracer_tracing_is_on() check nor
the tracing_reset_all_cpus() call belongs in ftrace_stackmap_reset()
anymore. The v5 commit message still described the older, stricter
design that had already been dropped from the code.

On the resolution question: a trace can indeed still contain
<stack_id N> records after a reset. Such an id either no longer
resolves, or resolves to an unrelated stack once the slot is reused.
That is misleading userspace output rather than kernel corruption -
reset frees nothing and only clears storage the map still owns. The
guidance is to read the trace out before resetting if existing ids
must stay meaningful.

Fixed in v6: the commit message now describes map-only reset, and both
the kernel-doc and Documentation/trace/ftrace-stackmap.rst spell out
the id-reuse consequence.

Pengfei
