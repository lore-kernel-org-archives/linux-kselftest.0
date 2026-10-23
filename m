Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792720219;
	b=sinP4pSls++v+7IryYfhPEfwYSYSruRX1pzjUCnEdLeujwpfsb0qPiSVei8n3NShwk+b
	 6puz4WNoxXQ/fYuddh1ZiJox9289M6+qZDqAifH4dj9IYMvgd+vwXxwngtlZ4aZhYY8C/
	 jK9hqfTRkcbMkz1LdDSPOm9o5mNWyHIPbJjhSUc711lOlIvQvzAL4IFu9cZpXjfQYSbvr
	 tC9cXqJRqjC1owNC7lGOR6i1NINGQSwb4W/sqSwntYcTvfDkAhfg2XoC+kdZTkSrbLQr/
	 W6hKD/gCR+aKjGaFrnFyHwyJGAo7lAiyqqn+UpxaM/EK+4iCmLGafOwUCw34Wbq1DQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792720219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=X468p48PfOB0WmzJ6kNGiEZKtoooeWVaYKhSdbR2LN8=;
	b=L3ajE6/VnmI3M19FoZsbM9mZOntnRbTJGxvki1H6ir+kCdpMyHXNgm8aXJtnz11EZJyE
	 wdm04L3F3NEhrycZFe8CjnEKCnEwSlbHgZjmwXdzZUdcwoED9ZhDcv3nrE6oTyqFIIyhS
	 wqbf2149vhB+huPRIzJ/v/ZUyMUij1n0A4eR6JapNMfMBgSBJqt5S7x7LQNyBjq277MQ7
	 hXZSHm2Q8jV+OkonJG3RN1/O1jU9JEbaxYpdx12Vxi1Cyiz7RLfc02IdmKiqDaRxnJG8b
	 O1mkKPW9hCHJzJ7k+3aGKjxdhCjpS9oSJFzAwFlBwL5RYDa4HRnA7DziuAUYXURNtig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rp8a0nB0;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6741A606A31D
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 01:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6741A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rp8a0nB0
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-368581df789so369543eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 18:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792720218; x=1793325018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X468p48PfOB0WmzJ6kNGiEZKtoooeWVaYKhSdbR2LN8=;
        b=Rp8a0nB0sJ+TJDR4hlmpgIpdVyGie5oBwLC0PFdydmMtqnyLfTvFup4nWx4OJIpd2D
         /0nqKXWsIu5jqq4imY11lyfjYev/8OExuK7Q/OxHuhOu+pzzZpTTeTiYx/F49RMSUzmt
         GccSr96gdC2DqGPOsPztHQgBSqn1ACJig8rztK0kgxx6Gea9Ck+5Xlj61UOtcZIedsp9
         2K8Mmg1SrottEj+86QdTk9X5iO+xMAXf8q0Rsd1uy/ZXcFhOOPsyHifwcG2ONoxKcfEW
         CpkDdF+5YUGAXHkpwXQORt34Ay1acS1LK0wiHEEbMpZhAYUW7HX3YNCtZr6OkoJjolGz
         H5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792720218; x=1793325018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X468p48PfOB0WmzJ6kNGiEZKtoooeWVaYKhSdbR2LN8=;
        b=lacEuAxGc0pxLWaugCwCrna7eNNOfsV3rHWfRnZ+VR731pZwtXxuKz+0sRarkq8xsT
         QrfgeNpNoyFpCzoz1BGq1qg5zlUHCQxCxZ1ZWoeTqdj7+ysnYxQ6Iaa/RFPMnBGadJpO
         gDZJZ6924pAakNHIZyvDwjLimqKiNYC2+vfHqufTtwmhGB0MHnS+tMKF++yoaGgoYIZn
         KEOSICU/ehijXqs1lNWoeOjZ4CKNhKw7U33K6ZBNDLDxeKjFjns0aBQUGqzVig0NBGI4
         u3XljzrnKI/kkGxqZgpZKatZSBlHAaczzWgBOHXSx6tFZL96G9axHxkDqb+6ZMQMVNDa
         A+9Q==
X-Forwarded-Encrypted: i=1; AKwUvBz9+RdWaSDtJNCb/x1vLm9sVuV1W8zUCy7zTCCdCsTCO5PRgHE72s3gM6L/eqmgpuehKBqAaVnWJoyctEY32/Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVmuJTrad/bI925llGe4/129gkON8fI3+VcnGAziLIDeBo1T4i
	AMNpSqy3LIBLpmyGrNs1u+nw6+U4llIileRr7Vli+CzPbTiyOztznkj7
X-Gm-Gg: AYBFou3TE24AgIZPzsfAXVthNMQf0z/HQ4ZRg5XIXspURQ5rp/rUfNSes+k/iDUtSIT
	UY8mZ/LvEcZbnU4UlNmjeNC92mCQX8SJMWYlgoHWAUNTb7/VOLROk/qQNCB7dSCi5dqxh+9R9HU
	Qq8gTHYeHd/5Bx6XDfm32DGAmJO5O8wAFXmWfYT2+P/Vz8vbHIKErH6nWKZg5H64SdwrGv6PNPD
	gXlvwnSNNWIlJQAKXKYHZtTtR6hlIFYqatNrIZxl8KqabFt7aKyw1U8B4jGof26UJhgpflJUILM
	Xy5oPBVs3tWnc/liz76xOyPLn09RccZFVnV4+PNZb7TI9SvjsE08KpGfmasVX5uuVBffinSQqkC
	ap2VIBWWXQbxShjVC9su5DjWlhEPOAgQJz05DMVqNP0AHmVo6TM5W++/ghMUXVQQuth4UHv9h9L
	yuovlp05LmLr3Yhgg+6tDL+AhaE7pVcp8E/HNTStgfVV2bOncrW7L8eCI4QYpdBXwQlBgR5OVF+
	yRqvnjIBh+H9MlHnaedmldKIeGVpkmc4De5MbzyWdMdSuuBQiM=
X-Received: by 2002:a05:693c:69c3:b0:368:2c6d:ddfe with SMTP id 5a478bee46e88-368afd86765mr4796119eec.9.1792720218428;
        Thu, 22 Oct 2026 18:50:18 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c0e60dsm1971091eec.2.2026.10.22.18.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 18:50:18 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 23 Oct 2026 09:49:49 +0800
Subject: [PATCH v2 2/2] kasan/test: cover load_unaligned_zeropad()
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-bug-word-at-a-time-zeropad-kasan-v2-2-be0ecfbae847@gmail.com>
References: <20261023-bug-word-at-a-time-zeropad-kasan-v2-0-be0ecfbae847@gmail.com>
In-Reply-To: <20261023-bug-word-at-a-time-zeropad-kasan-v2-0-be0ecfbae847@gmail.com>
To: Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

On architectures with CONFIG_DCACHE_WORD_ACCESS, load_unaligned_zeropad()
does the word loads of the dcache name compare and of path name
hashing.

None of the KASAN test cases reads memory through it, so nothing
noticed that KASAN did not check these loads at all.

Add a case that reads a freed object through load_unaligned_zeropad()
and expects a report. Skip it with hardware tag-based KASAN, since
arm64 turns tag checking off for this load:

  kasan_load_unaligned_zeropad, x86_64, generic KASAN
  without "word-at-a-time: check the first byte in
  load_unaligned_zeropad()"                                 FAILED
  with it                                                   PASSED

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
---
 mm/kasan/kasan_test_c.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
index b9e167ed5be32..c791512f6fc49 100644
--- a/mm/kasan/kasan_test_c.c
+++ b/mm/kasan/kasan_test_c.c
@@ -28,6 +28,9 @@
 #include <trace/events/printk.h>
 
 #include <asm/page.h>
+#ifdef CONFIG_DCACHE_WORD_ACCESS
+#include <asm/word-at-a-time.h>
+#endif
 
 #include "kasan.h"
 
@@ -1673,6 +1676,26 @@ static void kasan_memcmp(struct kunit *test)
 	kfree(ptr);
 }
 
+static void kasan_load_unaligned_zeropad(struct kunit *test)
+{
+#ifdef CONFIG_DCACHE_WORD_ACCESS
+	char *ptr;
+
+	/* The tag check is turned off for this load on arm64 with MTE. */
+	KASAN_TEST_NEEDS_CONFIG_OFF(test, CONFIG_KASAN_HW_TAGS);
+
+	ptr = kmalloc(64, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
+	kfree(ptr);
+
+	OPTIMIZER_HIDE_VAR(ptr);
+	KUNIT_EXPECT_KASAN_FAIL_READ(test,
+		kasan_int_result = load_unaligned_zeropad(ptr));
+#else
+	kunit_skip(test, "Test requires CONFIG_DCACHE_WORD_ACCESS=y");
+#endif
+}
+
 static void kasan_strings(struct kunit *test)
 {
 	char *ptr;
@@ -2264,6 +2287,7 @@ static struct kunit_case kasan_kunit_test_cases[] = {
 	KUNIT_CASE(kasan_alloca_oob_right),
 	KUNIT_CASE(kasan_memchr),
 	KUNIT_CASE(kasan_memcmp),
+	KUNIT_CASE(kasan_load_unaligned_zeropad),
 	KUNIT_CASE(kasan_strings),
 	KUNIT_CASE(kasan_bitops_generic),
 	KUNIT_CASE(kasan_bitops_tags),

-- 
2.43.0

