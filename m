Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811552;
	b=GExFMR3zMqLYPS9FiGQH8P1wKoqVh4I8yLY+QTa6bUT5AhPPi7xck/YwW/8C4ZDH+dZn
	 So/vlT+/b4ObM3C27+QMh0BwRtrNzeWeOwZMM9BTtLfVP3c1Ld7aVhk8T/hKrGLqn9ABx
	 dbR/9PYfE5Gscl6qKPYUwAdVdmdE2P+SVbkiIvXWBYuxc1kpQ5lhP9H4exGUcQ5yD0k+4
	 NuxhPF56Vc8pLiZQCwfcxAR3HSEIoilxK0rfvV5mb3vEo/4jTOke7JDg6apDe7AlgNR68
	 t4iVMSyRZFOk9G2QGQl4cfGHgCC3JgsAUrclgkExf9LzWyAoq/sxv6qf0eyRNvxdvEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/LC+6R33q10vqghO7crsZlwQEV9fByooirEbdHEQuEw=;
	b=GIha+aRkqT3lh04duJq8wejqIXq/mVJ8xsn/H2e/ZiYkeXKMG9XE2UJ+pzG58DI3oMsm
	 Al8ZjObB38zeuODI4IoiL5X8xlDHP4eNO3guv5KcctfR5AajQ8HIGKGaufK6S94O5dBA1
	 CCMesrqSAzCwbUGoj1NJZPBO4QnPrwXAfYhWHdFKesiyUU65k8C3yBSSWZyCSubz/GMLd
	 ZgW9Hd1M2+SkPURZlLlisvFnot5qRsY4LzfjUQ6G2b4naf2hS11uUvc/yKLxlI1tU3rrQ
	 vvHLCzMKeOQFSlyJyVtBYIxECFjx3SGV9+mnRToOxNFZV3t9OQZLZVoTG4QzIxPEQEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y31TZXeY;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E96A606A330
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E96A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y31TZXeY
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so1768313eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811550; x=1794416350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/LC+6R33q10vqghO7crsZlwQEV9fByooirEbdHEQuEw=;
        b=Y31TZXeYrMNub6CD2yl7wXzZNwbZWHH3eZPG51i7cMvXQr32hmTchJqFckujdmLaR8
         jO2Ybm5+xBQyyCmBfBHUjRxLSITYvm9VfhBZYZctszoMyWT4bemxe4sss/bovxPT2dJs
         k+J4IpNPEe0CddeXVyA/Y7b552MrHB98y/tpmtR8JuVo0QGTEi8v62P+yHXrxe8Qf5FA
         77OjQ6RMgvgZGAeX6Z8tBsU8YO6c7QSqAvOBWbc/pFX2uzgT01/mTcE/PcARiYWsSBj7
         CUZYZ7MlzON05EWeaepGCCOYVGQQlBPbEz6X6AJW+QtO6e0nH21GIU5VM6lSbedpHUeR
         fmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811550; x=1794416350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/LC+6R33q10vqghO7crsZlwQEV9fByooirEbdHEQuEw=;
        b=fqGT4/r75u12mwrBnFdogwAKUAXIknNNHKmHH6iz8VUqhOZ/Z5MOG0em7HHUG1s/cW
         kIslHZsFlqOoSgNnAoGLKNRC+UA1iMTwNJnKkK/LamL0Vhf+quP+bwMvJpb8juoEtFdl
         Jubf+QKPoNzRwHNgnnhqDM1qUWQSKAS/fRpQu6G7y1vw3RHZpuQ1m9DcMqm6MK7sPy2B
         tkTbIIqcXnlMcX94R9p2/AMgZITf3f7AHSJr5Qq7nyGIviKGtQGvLtbLAPRKjroGcu5E
         quhLEMUUud1iCWVAEIxEus/F9VgzmD4+G7ZjcZYVSjgXy3o7ttu7gM0hwyYTPqNwNsqX
         NGhg==
X-Forwarded-Encrypted: i=1; AKwUvBwlDyFiGsocF6gIIwNB12R9AUCf4TgMSuD60EpXBQ/nn+hIYTOH28yjxbK5Pm6OKTuAvbimu8Pf7FL0A/tbcpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bM8jmV7QZ40h+WeGOWReRPw5Co4cDCXo/mPLMOApgcg7oxyNh
	BFTs6XiJxo+QyWyFV1rLFCKkRuMZY93zQs1gRl7EgIiQBAXu9bTjR5lq
X-Gm-Gg: AYBFou08xSrj4K6JNw04BagEYRPKR2ZmzBdrzMVuQFIR69IxJumQ+OsmDVL1ye+6DuL
	8Dz4soNO5mP6s/5nxKbQ5o6hBz5xD/G6UfI1PDiOgDNQtdIgR/xi3Ss3YdJACCNXhBwXVST+o3W
	eUnef+0OAN7HL/4uew0sG+pD2VshV1CTn2v/OtF4ObpRWiharBKodwrRmYWjJLwQFcPhr/Rjtpm
	yHcPV353gfxJNgFgC6bX/mK4g/Kc+9LvCayZZS9SYKHlZarSuTDsBrQg7U7WVldwaxUZEAT9NPw
	yGOPJmjy8tjhoZ6X1ZdeVZd2qGXTgoOd4STKEYuJ1oThjlW0TIGczpobG6UyHG+f1cHoJFDhwoE
	OpWAkTKW/kufmX24E+h2WWt+CCqpbhN3+3PBpvYfeVtZ48N2k5iW9RXjNqh9gybloMxd3xNChVP
	bTT2bCb+SR+V+u8OjgiUS28vzdI+rcGm9dikn8pMVHWxp7a7cAkQLfCHn0gn4l3Zn4JsXWm99VX
	xy8TgwZ4q//zU1uMYz6+GYRsfg8tRLJve1SSBV6lHXc8A9ASW5biPzZo59ZWAw2VMbGC94Ww0rw
	TRyudZ3hDFZyoXz0MQ46ENuh3WPc5/sRbUegRuA=
X-Received: by 2002:a05:693c:8945:20b0:36a:2999:ea9b with SMTP id 5a478bee46e88-36a423c346fmr24991222eec.23.1793811549996;
        Wed, 04 Nov 2026 08:59:09 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:59:09 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 25/28] hazptr: Select TRACING for HAZPTR_TORTURE_TEST to enable tracepoint
Date: Thu,  5 Nov 2026 00:54:43 +0800
Message-ID: <20261104165504.2430480-26-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

The hazptr torture test registers the hazptr_waiter_enqueue
tracepoint for its hot-address scenario; select TRACING so
that the register_trace_*() API is available.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/Kconfig.debug | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/rcu/Kconfig.debug b/kernel/rcu/Kconfig.debug
index b500e96ea1c1..8fc6434a05d1 100644
--- a/kernel/rcu/Kconfig.debug
+++ b/kernel/rcu/Kconfig.debug
@@ -27,6 +27,7 @@ config RCU_SCALE_TEST
 	tristate "performance tests for RCU"
 	depends on DEBUG_KERNEL
 	select TORTURE_TEST
+	select TRACING
 	default n
 	help
 	  This option provides a kernel module that runs performance
@@ -42,6 +43,7 @@ config RCU_TORTURE_TEST
 	tristate "torture tests for RCU"
 	depends on DEBUG_KERNEL
 	select TORTURE_TEST
+	select TRACING
 	default n
 	help
 	  This option provides a kernel module that runs torture tests
@@ -102,6 +104,7 @@ config RCU_REF_SCALE_TEST
 	tristate "Scalability tests for read-side synchronization (RCU and others)"
 	depends on DEBUG_KERNEL
 	select TORTURE_TEST
+	select TRACING
 	default n
 	help
 	  This option provides a kernel module that runs performance tests
@@ -117,6 +120,7 @@ config HAZPTR_TORTURE_TEST
 	tristate "Torture tests for hazard pointers"
 	depends on DEBUG_KERNEL
 	select TORTURE_TEST
+	select TRACING
 	default n
 	help
 	  This option provides in-kernel hazard-pointer stress tests.
-- 
2.43.0

