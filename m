Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA78309DDF
	for <linux-kselftest@vger.kernel.org>; Thu,  7 May 2026 20:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186082; cv=none; b=bqCWo+d/GjNGc7vY0tvBV65MKH52brd1xrJA4g8aoUxzDI7NnxMN8eyWl1KkYeNLlyOqLUggzHLAHRyc9xHlHxdtcVjw/YIBUCbACTNkQ7tOZJefY1/R3yq4/g815SDlT0Kt7TTX6xSgd+ItqZ1KxEQDzU9W93JLNFqU7v7G9dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186082; c=relaxed/simple;
	bh=GOjFoV94awk7GYninYEq+I3DCtzIDlhYvlgo8SkP+9g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xk2WjWIevOMcD6we4yCOpN3CMqleAOMcy3CjEuFTQYsg9pRNbt7jbHO/w8B086PLPWjKvi/cMDssBC2Mdk5FfoH2G3oS8t2ctqGqcUZN+DI2JvwdyYZmmZl9da92zEnRTJiGl2UXq5EB3S44Eo+PtWqc7RKZpG3X7A+Db7h6eI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tajob9xV; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tajob9xV"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3650a4eb60dso1376056a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 13:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778186078; x=1778790878; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FwdqijLGyLJ4WnaXvFgo9eGiQSeu4QsrqPYNc8/yMrg=;
        b=tajob9xVfPFL86EwxlEO750zGY7hMqGTd/afqrE8mEFrX5t36IYKECis3SyRIiYVav
         QviJZw19i5rLVA/fIRA4ID0cUz0IEbcD01GNLfrUN+BZ0Jeh+Gwld2B/KQIux+cf3o6L
         PETZ2OO6/QzSW8DMNtSx+v9xmSFf6Q7wavQUU2jxO7bZF2Kaw5qUivcXshkRNb3VmDb4
         rB5g1yCwBX0JVDPMpXVQ4Sxlsu9jDh7nGby2GZfjPnESmRF30Hs0Kya0teaLCo880J5x
         9a9Rbtz/I3/AufpCw7CcC8jAWmo8jHSo9Np5XpU/djGXzleBj8knrnY5No1BeHdCO1do
         Qc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778186078; x=1778790878;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwdqijLGyLJ4WnaXvFgo9eGiQSeu4QsrqPYNc8/yMrg=;
        b=rzwCEVBIhxoH0x+80RIMA4phQj0FkoyYj/u4gIukyOoh7r8LbcY5lVrkjdXHewp8Qt
         cltw5UVUg4vczxoachcmNkHB47q+wzvDBuR94ATV2jsvmqi3oIUbCuE9XtunlHwnO3vm
         qu8ceYxtXHEQ5BQ14UBr7H9kM/2I3ynyFheeShjJnQCt9HkY93OZorsjypCZjhybGJMd
         LPHD1DgRda8IbtFbibySxD6N7f9bTCYMXt8knHN+24Xh7c+W79C7a+97OtlOc16lHaOl
         Hl+47C4o1fdeNnUNlehR1d6JMSuzd1zvk2rL+Fcpz+0ABqWUTbfxQFBKXio+8t79bZly
         hSag==
X-Forwarded-Encrypted: i=1; AFNElJ/zv/zRU8SB1gpoLpVkh4PgwlrzdLFhMJdEmMhHg43V0YTlFzKxhH/gCFeHypcXW/0wLkt9pKUZOG8hcZ7B/Qc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHtEZe18Bybpuakf5bTUqO87XjzAmftKe0h9omfu0NyvJd2ITy
	S/ApUtvkHEqtt1IO7WQBNQWs1YYPwCCnxqGj2qOKUpe0o4ZKqZrQSWsCiufEolM+E8SQQ7qlOJ4
	yv9aWzicFwNgg2n/RBRboQx/CtQ==
X-Received: from pgac15.prod.google.com ([2002:a05:6a02:294f:b0:c79:5ec2:4a68])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:431e:b0:39f:54fb:e465 with SMTP id adf61e73a8af0-3aa5acd7603mr9313570637.50.1778186077180;
 Thu, 07 May 2026 13:34:37 -0700 (PDT)
Date: Thu,  7 May 2026 13:34:24 -0700
In-Reply-To: <cover.1778185936.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <cover.1778185936.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <b9de3cc382f0cda398ee928467147979adf9b06c.1778185936.git.ackerleytng@google.com>
Subject: [POC PATCH 3/5] KVM: selftests: Make guest_code_xsave more friendly
From: Ackerley Tng <ackerleytng@google.com>
To: devnull+ackerleytng.google.com@kernel.org
Cc: ackerleytng@google.com, aik@amd.com, akpm@linux-foundation.org, 
	andrew.jones@linux.dev, aneesh.kumar@kernel.org, axelrasmussen@google.com, 
	baohua@kernel.org, bhe@redhat.com, binbin.wu@linux.intel.com, bp@alien8.de, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, chrisl@kernel.org, 
	corbet@lwn.net, dave.hansen@linux.intel.com, david@kernel.org, 
	forkloop@google.com, hpa@zytor.com, ira.weiny@intel.com, jgg@ziepe.ca, 
	jmattson@google.com, jthoughton@google.com, kas@kernel.org, 
	kasong@tencent.com, kvm@vger.kernel.org, liam@infradead.org, 
	linux-coco@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	mathieu.desnoyers@efficios.com, mhiramat@kernel.org, michael.roth@amd.com, 
	mingo@redhat.com, nphamcs@gmail.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, pratyush@kernel.org, qi.zheng@linux.dev, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shakeel.butt@linux.dev, 
	shikemeng@huaweicloud.com, shivankg@amd.com, shuah@kernel.org, 
	skhan@linuxfoundation.org, steven.price@arm.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vannapurve@google.com, vbabka@kernel.org, 
	weixugc@google.com, willy@infradead.org, wyihan@google.com, x86@kernel.org, 
	yan.y.zhao@intel.com, youngjun.park@lge.com, yuanchu@google.com
Content-Type: text/plain; charset="UTF-8"

The original implementation of guest_code_xsave makes a jmp to
guest_sev_es_code in inline assembly. When code that uses guest_sev_es_code
is removed, guest_sev_es_code will be optimized out, leading to a linking
error since guest_code_xsave still tries to jmp to guest_sev_es_code.

Rewrite guest_code_xsave() to instead make a call, in C, to
guest_sev_es_code(), so that usage of guest_sev_es_code() is made known to
the compiler.

This rewriting also gives a name to the xsave inline assembly, improving
readability.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../selftests/kvm/x86/sev_smoke_test.c        | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/sev_smoke_test.c b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
index 1a49ee3915864..8b859adf4cf6f 100644
--- a/tools/testing/selftests/kvm/x86/sev_smoke_test.c
+++ b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
@@ -80,13 +80,23 @@ static void guest_sev_code(void)
 	GUEST_DONE();
 }
 
-/* Stash state passed via VMSA before any compiled code runs.  */
-extern void guest_code_xsave(void);
-asm("guest_code_xsave:\n"
-    "mov $" __stringify(XFEATURE_MASK_X87_AVX) ", %eax\n"
-    "xor %edx, %edx\n"
-    "xsave (%rdi)\n"
-    "jmp guest_sev_es_code");
+static void xsave_all_registers(void *addr)
+{
+	__asm__ __volatile__(
+		"mov $" __stringify(XFEATURE_MASK_X87_AVX) ", %eax\n"
+		"xor %edx, %edx\n"
+		"xsave (%0)"
+		:
+		: "r"(addr)
+		: "eax", "edx", "memory"
+	 );
+}
+
+static void guest_code_xsave(void *vmsa_gva)
+{
+	xsave_all_registers(vmsa_gva);
+	guest_sev_es_code();
+}
 
 static void compare_xsave(u8 *from_host, u8 *from_guest)
 {
-- 
2.54.0.563.g4f69b47b94-goog

