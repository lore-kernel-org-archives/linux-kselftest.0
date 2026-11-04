Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826540;
	b=PMfz3leq5xUwKp2hlheg16n5qr/OdvC1BawvbXvkXhfpph8S92zvtQbBXZeLu7zSb+hQ
	 tq6zP+6XeeB4de9HzI2n8Qsxg+KKoURMt8xPTJm3haF2GZmDgwCoDYiHjsFN4knQsxXpe
	 9JTD1N2LWjVRTMeKi9fBWU/T+JlJWq5g73T/HQZCZiHNGjh72haVJOkH+zOHqA1xbxCq3
	 okov91linVT2xDXLSrccQDOlzAVeSqGIGYZ4fGDm0OJiepidWGpfVbHsBkzjXr4DrasH+
	 b3ZwUP1WYNlIl7zLHnFC3bz4RcHoMTmWOwxGwrfdlSB8b1ggTCubIg5VTLWkpdf0ZkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eVQTW/JXU3QoFsiEVwefLqQuHI3QztXWs28WnRbhTu0=;
	b=H1qMFzYqpG0bdYH3mumI2bPUlPyRzlm3/wdBYo5CKpv+E1W0Jkwd6gpg6xYNJ6IinoSJ
	 vbg72vAPIEsjQXAC0zkt2S9E1v4qM1/5rzKalwh7iiyahqpaMWqJUsCkQWqqclJIPMHYA
	 KeRsHZzb8MD9yd1cfGMz93MxnJHBuudFJJpHcnynvcUtGycd3uRh4+O6aHfxzqymr67zp
	 Ew6siqaU2they67JnCgVIfOSXaEG1xg1lo9WkTpHi2IRC3wuhA0uEwPlJ3EZuVHBT9pFD
	 VCbtAPjHJzyIaUBsDNrS740MxjND8gSzuR/Hzj3T+iVR0Qm19tBIuGgVcvRrPvyrOFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fLSgcH4i;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75102607E710
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75102607E710
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fLSgcH4i
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so10453815e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826539; x=1794431339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVQTW/JXU3QoFsiEVwefLqQuHI3QztXWs28WnRbhTu0=;
        b=fLSgcH4i/dzvkJSRKSDMNrc6SjSUPCpo58LZ4L7HayI6Xp9uXKaWbXBFNzxdk/xC7l
         74+r684UMRnZgko5aoMtN2Ip+omTLmmoZFPmOKhHWZRjAcTyUL65zl/E6yX7suI4ayuN
         a3mCtguZb1xBJoR9OZ/FJBTc487bLDZxdUFgeddjL7dxYAj4IsPdTZ827tLQEPkTBypI
         JARrhXiSsJ2v0KK+y4KhZv679QGGdPXapFc+0h4jdISXOspNpbIrCOW/bdwqjhcRP4MT
         h4M06dT/S5UWD0LwmIwN88BpRoAt/s29QO1DQYvz/wyQPem648MgJVTyF0ZakMSMyZyd
         15tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826539; x=1794431339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVQTW/JXU3QoFsiEVwefLqQuHI3QztXWs28WnRbhTu0=;
        b=FPSUnydpnhRjI3KBBlrOJEwKfszNtZ+VfZci0hcec1cTrD1ABSzoJK3C+XQ+DqzSK+
         0P2LQEJ9iiS201q4pwApUjLgO+EvfKzxsJYJRu8phCaDDvKXvG2dNJiQy2DuwCqtOMdg
         3QxLeYijG/1J+imfZQxWkOlG7QTn8/0Bc+kjjsp5+MUPVlPX/E5+3jIWAIhT3eylUqAm
         vH6zdMlPqzIii3sfiNm+hkkiDXPbeLK2VPCcVABHbTL5NOQ2O723fJksx+GFFYAWCr5b
         vYKAwP9u0XQ5Jixkj3s7BO9Q5zOlcgWb0scn/x4m/TdobaydIPSUa2yQPHDvjQrlGlsO
         54Dg==
X-Forwarded-Encrypted: i=1; AKwUvBxW4/K2Ru5/jwVDm6Obj6n8W/F0ZOHgi1Gg8ejpdOyJ/NjKiMFWi6D7iH42EgZpiJFsYFuGZOKSWQDRBC/zrZo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gv8ateRxF2U17VE/DaqfITxcsjthd0RNX6VDK5SHZoDgoPjuu
	mV1AZOjpYaQcpgOpUpcyPMa8oVu78R2hoRoQ956ODUp6HqQUGYkVDcpv
X-Gm-Gg: AYBFou3yH4fAF8mcnn7Er2ejyt1s/RTwepmfMs83tZpyYhD1B1KrTJm+WqphvjWfKXT
	3qy981a6NZPQbKZj6DG/tAS1I83lpWJMppThTgSUQJQzu6J5guu/iPO1kGzIyJXPP4kVcqEt9Fr
	Au89tYK5W2AE0zPPNGXKqP6VDyAxiXqnqfYwGz7kkG/FTTXOzH92JPbR2XCl9r1XSb1wQirT/Fq
	im9VB07Xkrn+th5WwnLC5jDP4sFy9SphwKrpzDYWp6l7TG7nRXhRFJlKBMwuc58Q8fY0nPL0YOB
	dPq/nm2tR2pY7tijhHXJetI4FzlUxi0M3es2eWJSHzt/H9cafLRl/BVIS7A0kFcJiPhOde4YTNH
	YDVY/IMoml9/gGAySYLrCJM6VRxR69LpCNW2I+ylH/M9NPGsiRjJkeMxDJWFiLsL8Jg6Bx9t5gL
	UQOcet45tNQaXKVW0xWLzr8K2w3wwQhhDFWLi4L9Tdr+8XvhNzqt9f34IaSYcsYdg0mnZwutsVg
	zK7ilGetUIUbmE61FqSURcgyx8OF9q/+tfEUbT+qRQ4VUXF9hG/D//zSgomOJu/bmonPDDxLVhT
	se249kc8sAzk827X6rf9911b9hMX1mduPlCFQOVYf0F2hhG6dskNBZhTRctR7Fyx1p/kpdaYkmI
	=
X-Received: by 2002:a05:600c:314a:b0:4a2:fd2:985d with SMTP id 5b1f17b1804b1-4ac1775316amr367177345e9.12.1793826538751;
        Wed, 04 Nov 2026 13:08:58 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda2007esm5673249f8f.47.2026.11.04.13.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:08:58 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:49 +0100
Subject: [PATCH v2 03/27] selftests/landlock: Check the thread result in
 audit.thread
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-3-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

thread_audit_test() reports failures through its return value, but
audit.thread joins the thread with a NULL result pointer, so these
failures go unnoticed.

Check the returned value, as the other thread-based audit tests do.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/audit_test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/audit_test.c b/tools/testing/selftests/landlock/audit_test.c
index 502a0825d877..81cb31aa32ad 100644
--- a/tools/testing/selftests/landlock/audit_test.c
+++ b/tools/testing/selftests/landlock/audit_test.c
@@ -227,6 +227,7 @@ TEST_F(audit, thread)
 	__u64 allocated_dom = 2;
 	__u64 deallocated_dom = 3;
 	pthread_t thread;
+	void *thread_ret;
 	int pipe_child[2], pipe_parent[2];
 	char buffer;
 	struct thread_data child_data;
@@ -270,7 +271,8 @@ TEST_F(audit, thread)
 	/* Signals the thread to exit, which will generate a domain deallocation. */
 	ASSERT_EQ(1, write(pipe_parent[1], ".", 1));
 	EXPECT_EQ(0, close(pipe_parent[1]));
-	ASSERT_EQ(0, pthread_join(thread, NULL));
+	ASSERT_EQ(0, pthread_join(thread, &thread_ret));
+	EXPECT_EQ(NULL, thread_ret);
 
 	EXPECT_EQ(0, matches_log_domain_deallocated(
 			     self->audit_fd, 1, denial_dom, &deallocated_dom));

-- 
2.56.0

