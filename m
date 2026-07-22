Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B9A34A794
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 14:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728876; cv=none; b=Osd7S+Jatfi0bXFHQkHClsBxHiC1CVPkIW9EGlHSgG/0JrYqIS41hY7MZ1NjaHq1dUfkgrvcTF4Ps1CqrDoI0WXOix04gh6Xm3q6R2ONrQrD/8uOPvfXEKP4PclIj968CIFfLMUu+x3vxBe3Kpv0ZrzVESy9aYeJmPXqvBLV0ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728876; c=relaxed/simple;
	bh=XvVl5mjflIv3UtJ8KZ2CpGKOS7tfRL7wakHrEfbOmYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z2tXl00DINvOlBmTtfU0KfGsAwdq3m5Lfevah6wGgEoNyDT/YRqq+9EoVd8Wu7M0X7d80DRIbcYCKOVkXiGj/oVMXmatT3RJiI1ZoyMQT40jOJtpue2vDN0BtGDZxpXhTRCPHayabbh72G8q5mQ9e2SHlV9S/eBtF5bDPmRi98I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEarH/fk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEarH/fk"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-845c92bc464so8021108b3a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 07:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784728874; x=1785333674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZEjjn0vc5h6Klfz50Xi3OPenrjoSwnSYbs/Qn95SwQM=;
        b=NEarH/fk0a/bhzHN/l+ixz/cCRwCV6iqTMYLltQPeoDh8C0E20EN0EUdeTzxmGP+uy
         /WvZ+9HZsAjVV61hkwMVqntKqEKVzqMkSMMWfqoP7lCUMmskEVwBvDzrDIqkF8+Yrb8Z
         AdrqAEKmqZO5z1L3ln3CmO+WdgFfYeusGYe55pqnuushnn2zcZIY8/O/auD/9ZF2VQoL
         1euhfHYmPW+xcw2Kx+hvs2/Izy7/LKMOO3gfTCSkuMPveQyXsWmbRT/LpbMsHpBV+iIz
         zyCxEt//W66H4KedZqEZPTnmtjfz1PyR6WUILY+Lih1pIeXlSYvr6yFQcUvFB0J2EYON
         RvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728874; x=1785333674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZEjjn0vc5h6Klfz50Xi3OPenrjoSwnSYbs/Qn95SwQM=;
        b=qoh503vYNpjCNM4tBIf1HiuW8HaWF93DO6zp5ukCZdjlkO8KptdvvPh8wpgqfE7Uwp
         useMBkUimoSoLP9y26TgkG4x5nkFKKJCCscN+4rvx/VLMwmLBD3ew3vvJoRgA+OjmulB
         X36PmAysezqYnwISxDchDeV5c2L6R7YnPrLEezZkOHtZ4vCq5NoaE0dtMyWz6wrnbvr3
         Z70Vzd79R2Z9hh8kSplPn7zh5oT4X+TuRu8JoJsO4ffQwjwhk8spq8nQUgn+e2MBQaBr
         9QTEKga/cXtn6NuJGjB2t3JgUDSQgoMfh9Nf4IZvIfZ3Djx1h3c4IEanG682+ECvWEud
         hwfA==
X-Forwarded-Encrypted: i=1; AHgh+RrV8gALO9wC7kCQvQ2sOdIDVQq3amOZoBzbk9YxEypRQWpJFdjJapx+WNor6UvLIE4p2IRykCQTh+XCRfmxvIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlSLgNdvkDH6RuL4tOUQGTwU0RVAfoOgawXjzeGhqmnkn3wbG/
	Ll7QNIXRaV6vSkEr4yFioUANWiNMI/9i7hEYTKA9903CIY86/+1Uz76jnKBR76zaGu4=
X-Gm-Gg: AR+sD13KxWSWEdc9RsGob0o4NVwEi85EA7b9GQTVi5rJ6Dz3iij7Sp1oF2AZ9U6lTjS
	JHgub0Guw/uWiUpRXy/anIJG3OPGekUf8/R4gd4EiCOHYpNzAyQYfAvaFAcacH8Y9fhC7dlCZbR
	fOjDBeD0ELhYvnHfnFejwspjCm6N7c8Hm6F6kTXGn/9E8jOPzOGbZE9Rc3gR+H8V/Twd7HoIaib
	ogJoPwmD22uCkhVub5GG/QGMR9dHA2TQHq/q3UZTUgzcSXXJgW7ztBWJ08SAUGupTQSarT0o689
	RphBEA4AwN5ykaIPdKps4X6cw+9Bxny5C6EEbLMmJawaeMyahNk5yEgCMuPnu+Uf7SKfXLlzF4n
	dhL4EoDgbFEf2DqPZPZI0Q1TGHSaJovnjHJsvLseSV6dnL6DcJZfnGgtnMIK+kr1t9o8i/QcppP
	v/A9bWRer7HVOV0jF6axb54A+9BXFEaz6oWAmeNaT8E4CKWpk=
X-Received: by 2002:a05:6a20:3ca3:b0:3c3:7ecd:72df with SMTP id adf61e73a8af0-3c3ad86ab89mr26184446637.30.1784728873939;
        Wed, 22 Jul 2026 07:01:13 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:40b2:277d::3ef:c9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a1fsm1242281a12.26.2026.07.22.07.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:01:13 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org,
	pulehui@huawei.com
Cc: alex@ghiti.fr,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	puranjay@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next v3 3/6] riscv, stacktrace: Implement arch_bpf_stack_walk() for BPF
Date: Wed, 22 Jul 2026 19:30:10 +0530
Message-ID: <20260722140015.1982158-4-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722140015.1982158-1-varunrmallya@gmail.com>
References: <20260722140015.1982158-1-varunrmallya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will be used by bpf_throw() to unwind till the program marked as
exception boundary and run the exception callback with the stack of the
main program.
This is a wrapper around walk_stackframe(), which now passes (pc, sp and
fp) to it's consume callback.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
---
 arch/riscv/kernel/stacktrace.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 30b369dd2815..c0f2393e5163 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/filter.h>
 #include <linux/kallsyms.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
@@ -104,6 +105,30 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 	}
 }
 
+struct bpf_unwind_consume_entry_data {
+	bool (*consume_entry)(void *cookie, u64 ip, u64 sp, u64 fp);
+	void *cookie;
+};
+
+static bool bpf_unwind_consume_entry(void *arg, unsigned long pc,
+				     unsigned long sp, unsigned long fp)
+{
+	struct bpf_unwind_consume_entry_data *data = arg;
+
+	return data->consume_entry(data->cookie, pc, sp, fp);
+}
+
+void notrace arch_bpf_stack_walk(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp),
+				 void *cookie)
+{
+	struct bpf_unwind_consume_entry_data data = {
+		.consume_entry = consume_fn,
+		.cookie = cookie,
+	};
+
+	walk_stackframe(current, NULL, bpf_unwind_consume_entry, &data);
+}
+
 #else /* !CONFIG_FRAME_POINTER */
 
 void notrace walk_stackframe(struct task_struct *task,
-- 
2.55.0

