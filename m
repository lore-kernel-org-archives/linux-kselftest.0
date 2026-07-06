Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1047433BBE
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 16:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783355901; cv=none; b=maLLT+h9lr8hrmfUGHaC5cqSuI048ZbVzIzIVj8gmSzVQFa1UPXpIXvJYPZkx6dwzJijp73djkZX2X0EjKzDBgUaWanxPZ8nB9YERJaaQjSFGzIkbZeS6lETOu6U+YTIe6WrEUWugpJvgu20CAtkIIUo/r8MQoBwlTvb0NoD36k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783355901; c=relaxed/simple;
	bh=UwF9jbW7z5Rcv+P0PwnoEl6y3nQ7k1YZUnxUDdgc0iQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DwEj0DJMPUuJBi9TQmNG2KJnrBuQ+K0TJTW5ysXqKkVC+ucDn+fKDBNOyb5aPxzEkakYazvJmwb3ixWoSlrpYzitC6RERzxbhr8y4BzaAlzrhybhgwjFnyOs+gy6KAMUjHDNq2lITMbYon4HnpxT7EX9iWF4vFSYlGR4e886nTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qrZJvViW; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrZJvViW"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1863941f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 09:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783355898; x=1783960698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L6fxd414zjbKl4/fM0nOf+lIyo7xTqgthi3ysLKzw9U=;
        b=qrZJvViWBIV2jt1efHYbAjBg4MRHUg+YIgIeq+0JIWno2qlCGf710mzw/UBZpg8ds2
         FRWaNsWubaKd1n4OH250FFHEL1qSWnMjxmZIhVuk48dRWfaDAIvEVa/i1eVyApzU1hrl
         cOPE2cxQc5/Ltk6cgqOTgl2d0ZQAzaCWB89VybEPXIakz6dUS7YR7JaomZPNDTSAf+V/
         1gqD1ISIhy1/wNeIdNYV4J/EoeV+kKWs0pbFbYEGKNMZiW5BVQndF2X23x6nYKcJAdWo
         UkBC5D8fqf51+Laai5lnK95H6pTheu5ik336T0bv5RqDcxpUimBavQU6cNtt13FNwF5V
         I34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783355898; x=1783960698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6fxd414zjbKl4/fM0nOf+lIyo7xTqgthi3ysLKzw9U=;
        b=pKiNGPzr2IGEsJ8e/dzmS3T5CsFdRCNjm8UOasKCe205moOsS+t6PqugzEU1wN1Zmj
         tyUace9W2vJrQ6yHa8BFb0R1FSwF5rRZIGVpwR5BwnrZb/vuZxwsDcFgfK0HrrUiEzGE
         wlS1V2v4yh03PfRQhjwFFPrKwJ8NAjPciYbFS5ogb1JtUWje93EUjfMMIPmEQWNWAhNy
         b0L9ake9eDLu4XHBTGG/9qiWriH9IVHUigk4Y2J018YyMAlB6/i6UV//IVcZfspOW5BK
         GlziYmfcwEbcWSsOHSZmXi8gcks8yk3oQW5Ir2mCLr8ETUTu41rlJFrL3Owg6mmYs3x4
         niTg==
X-Forwarded-Encrypted: i=1; AHgh+Ro3C0MF6Z4+DhIRoilb/CBmhqrYvzGwkzJJYuhq/PsQmTx2fhCVg5Be+iPiICL8SE0hmSnnX0MRJmsUMWRyLnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlk5TPKK1CqMm4UH27NC/nZUSGbRkB+ys5Az080nTXyGr4HYA7
	11HEAGZe/JiAyJvwskD96VDN9yEushWDcJz9d8mi83msbG7bS1C4O7Hj
X-Gm-Gg: AfdE7cnnCF7WksBCPIsQwzjxpsQ8/IXkn1htB9NGv8fusxvg+1r4YOxtpjeyLpSKScI
	vZRkW67DY66O87rP3/VIkzFalnudLQYccimXVZxln57tazdvkOadsAvrYRjAUDArqCh3nv/JoT/
	IismpLRNYSjIwQRvmoGAOzt0lbl/Gn/rbHLwckWAcabK2NCAvB1wVO+ywODg35u/2bMUxhXorwR
	8GXzNUr70WL2czRwiFELzuV5k3/IZXKpVNATyK1CV0WsxckPr/3F6KJ/oVs3h3PEfPkAxBkxcCu
	2QutJwRI/Qm+L7dt+pJwQUbNy8YM2EcUF8n3ND0494bppNbKbzXJbRaz0HepGUnLMV6xA8s8blg
	iSvU/cMs1egsxzVFUS/UYMDYEtuoGzev6X9p8SOdJnyigtMLMYvn2SwqykLgwDYWNpxKcjG+LpG
	mXVqpPzy2GpRvEEesfrc+m1wBw4EfV0FWDceDjs95X5oZw
X-Received: by 2002:a5d:6e44:0:b0:46a:168c:3795 with SMTP id ffacd0b85a97d-47de66763b6mr1056438f8f.16.1783355898114;
        Mon, 06 Jul 2026 09:38:18 -0700 (PDT)
Received: from hisam ([39.40.20.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039afacsm24804721f8f.19.2026.07.06.09.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:38:17 -0700 (PDT)
From: Hisam Mehboob <hisamshar@gmail.com>
To: pbonzini@redhat.com
Cc: shuah@kernel.org,
	seanjc@google.com,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aqibaf@amazon.com,
	Hisam Mehboob <hisamshar@gmail.com>
Subject: [PATCH] KVM: selftests: Use KVM's task pinning APIs in steal_time
Date: Mon,  6 Jul 2026 21:36:49 +0500
Message-ID: <20260706163649.155548-1-hisamshar@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sean Christopherson <seanjc@google.com>

Use pin_self_to_cpu() and pin_task_to_cpu() to pin the vCPU thread and
the stealer thread to pCPU0 in the steal_time test. Eliminating the usage
of pthread_attr_setaffinity_np() in particular allows building the test
against non-glibc C libraries.

Reported-by: Aqib Faruqui <aqibaf@amazon.com>
Closes: https://lore.kernel.org/all/20250829142556.72577-4-aqibaf@amazon.com/
Signed-off-by: Sean Christopherson <seanjc@google.com>
Link: https://lore.kernel.org/all/aLIroyJSWQ26wnY4@google.com/
[hisamshar@gmail.com: resend, fix changelog typos; original series was never reposted]
Signed-off-by: Hisam Mehboob <hisamshar@gmail.com>
---
 tools/testing/selftests/kvm/steal_time.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index 76fcdd1fd3cb..19a97d6a3607 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -508,9 +508,7 @@ int main(int ac, char **av)
 {
 	struct kvm_vcpu *vcpus[NR_VCPUS];
 	struct kvm_vm *vm;
-	pthread_attr_t attr;
 	pthread_t thread;
-	cpu_set_t cpuset;
 	unsigned int gpages;
 	long stolen_time;
 	long run_delay;
@@ -520,11 +518,7 @@ int main(int ac, char **av)
 	verbose = ac > 1 && (!strncmp(av[1], "-v", 3) || !strncmp(av[1], "--verbose", 10));
 
 	/* Set CPU affinity so we can force preemption of the VCPU */
-	CPU_ZERO(&cpuset);
-	CPU_SET(0, &cpuset);
-	pthread_attr_init(&attr);
-	pthread_attr_setaffinity_np(&attr, sizeof(cpu_set_t), &cpuset);
-	pthread_setaffinity_np(pthread_self(), sizeof(cpu_set_t), &cpuset);
+	pin_self_to_cpu(0);
 
 	/* Create a VM and an identity mapped memslot for the steal time structure */
 	vm = vm_create_with_vcpus(NR_VCPUS, guest_code, vcpus);
@@ -558,7 +552,9 @@ int main(int ac, char **av)
 
 		/* Steal time from the VCPU. The steal time thread has the same CPU affinity as the VCPUs. */
 		run_delay = get_run_delay();
-		pthread_create(&thread, &attr, do_steal_time, NULL);
+		pthread_create(&thread, NULL, do_steal_time, NULL);
+		pin_task_to_cpu(thread, 0);
+
 		do
 			sched_yield();
 		while (get_run_delay() - run_delay < MIN_RUN_DELAY_NS);
-- 
2.51.0

