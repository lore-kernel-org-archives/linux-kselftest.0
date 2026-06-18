Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBE0343D8A
	for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 19:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781811640; cv=none; b=X1NjmAVXHAIVrhjs0oY1NvN4eS82eBmpZ8toErzXlcRWfnzgJiqzS3NYTrsGWcDkatOkmpTDnzqcnCEtoaEEuBL266gMhpgb4pNtMx1TQdN/RNXlMZbt/UgYezY7+6eUNNpeyWFDLdDoXlbcIAytyhgNSHbxKohtMsFTU5o+DBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781811640; c=relaxed/simple;
	bh=n960G0WbEysoBhnGymCrWI4l0mKCoKXRtjKJSRfDpR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VO0l/6sQs7Pr5fJmUt+JJVY3/JQJ6N5QXnHlhvhIxJBh0TzArkzMuw22GJfsD+/uZKSCeQmcJDIWRiZayDvrU22qEKVJwGnMvFjI5NvgKgRbcKq11gnCZ/gEi7v8B8F3IjGGsnLkAse8a6yWY245aAp1gs/W4ft2+U/fByA5gGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+Kl8zUP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+Kl8zUP"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso9204615e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 12:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781811638; x=1782416438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mytEw3yWgPCxxwojWD6Q0wm+6CDWu7pQ8oL/Dn+vGsM=;
        b=T+Kl8zUPPXAQSW6PMcrhpLqQtV9SNi6WfrXn/WkS8v8NYoxSCWp0J/el5Ldr0JW9ml
         x6V12Bb7oaaMc4IEBHA3LuDDIdPA6d7DuEOyyk10wuTgIfxE5Q+DRdOBSN/m3eMwJdhV
         BTRVDReohYjndUN+2XTFQIBDE1RzX+nA/9JCvxowTVdc5a/bCreBr/YwzPSSHhTfbQR/
         +Q4eOhaJiOp5D2Er/2ve+npCx7uihGVTQIA/IPbeXmtnp8pmo+LJUvOZ+GbIkgearIJa
         YySwPqwCR8ZL2+cPI2qyWPmyxf4jZMyY5sO9O/Stq8r/UOTYuBAX68u6HmgFCwaLMDrj
         xPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781811638; x=1782416438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mytEw3yWgPCxxwojWD6Q0wm+6CDWu7pQ8oL/Dn+vGsM=;
        b=OrUmsNaY8It/m8q+4ek1OWyuwKoQXBCX2yyXPbJnRTbgGJZMl9jGxZvprTFxeN9Vd/
         k7mDTwWjUU9cJlnfNdnKIiekTmgiR4H2fl8xE/oyGG+HH00xHs3Xkd3N9NGthaU7Vm89
         0LraRDxobXfR/CiXIjcFxf5N+Q6GE6xg0CUn7QW1XrCEXubqaoFaDzfloxeRZIeB2CNn
         /fGGItW7+wyo1GIHud1PmWMVjou4vjvQkD3ONYcqWiLEesTYMBewHCL+8Er1FPV39m+8
         uDXrmMrH6rAFRgQPyWPQ4SJ26L+ggGClNcti+f2q68LdXuV0Gp6M4ttaBIfOpzSZ5eR1
         SM3g==
X-Forwarded-Encrypted: i=1; AFNElJ+IKagpx3CDJgk7tQr9vahnVqfDEfaUONvrmllu7IceicKyRLLObQmArNzVKABJrBK6CCwLGzsobO9tlhOVnlw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo+VksEHfZmTKxu2T9Zvy5eLii1v2FL6UnB5K9vBm49VyBXJTG
	1hr2JSsedLAV6z+wP9DXoc+6FESu6mTc98uoucBakxe88WrFyKDq275ZYbAdhYuOT5w=
X-Gm-Gg: AfdE7cnEZ/+GIJi/BtRS3jx2UnV+jyIroGqg5a/YmlQGHj5AYRssDE53z4U4GyPmZ3u
	zwP314iMV9goXDHUJFPu55p6HtwYWbOW0DEnAGl+OEXJZQZYbidaXJVMs3s8JkuRxn+Bi/6h/7L
	9LDoxozblw3xSJIDDNiVd02rK2trjNlRpXU3wY9G3mxHg+gUWLnGh3e+SB2D0RQhKycIxABfdBo
	T4eRGsGYiPBoo3fmSY8d2TxkLuDLGEbDgf/WumXZ+4uRpVNsgUEbK6rTY1DZ1lAXej06qdOMS5l
	65tSBASCONCXzz2ABaQvY1EGBIMWKIXmA3JtIQT7XjKINdw6gkWYptPpJSKx/M1icKj59xgnMER
	dt+a+gL+bDJASXwzHNE0qprzJhv4tJUowvFtyqpKfwTwzps7Nj3C4VvZtyDd0nb4wNqX1dZXCZf
	nF/iPm8WPBtG3/5TV6MaAP5VHGBUT2fR4lZQG/dhLyoMc=
X-Received: by 2002:a05:600c:8288:b0:492:404a:9605 with SMTP id 5b1f17b1804b1-49240e7fb51mr5194705e9.17.1781811637821;
        Thu, 18 Jun 2026 12:40:37 -0700 (PDT)
Received: from hisam ([39.40.61.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240f054e3sm3590535e9.2.2026.06.18.12.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 12:40:37 -0700 (PDT)
From: Hisam Mehboob <hisamshar@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Shuah Khan <shuah@kernel.org>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hisam Mehboob <hisamshar@gmail.com>
Subject: [PATCH] selftests/rseq: Replace glibc-specific __GNUC_PREREQ with  portable check
Date: Fri, 19 Jun 2026 00:37:25 +0500
Message-ID: <20260618193724.589113-2-hisamshar@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building the rseq selftests against musl libc fails because musl's
<features.h> does not provide the glibc-specific __GNUC_PREREQ macro:

  error: missing binary operator before token '('

Replace __GNUC_PREREQ(11, 1) with an equivalent check using __GNUC__
and __GNUC_MINOR__ directly.  This pattern is portable across all C
library implementations and is already used elsewhere in the tools/
tree (e.g., tools/include/linux/string.h).

This also allows removing the #include <features.h>, which was only
needed for __GNUC_PREREQ.

Fixes: 886ddfba933f ("selftests/rseq: Introduce thread pointer getters")
Signed-off-by: Hisam Mehboob <hisamshar@gmail.com>
---
 tools/testing/selftests/rseq/rseq-x86-thread-pointer.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/testing/selftests/rseq/rseq-x86-thread-pointer.h b/tools/testing/selftests/rseq/rseq-x86-thread-pointer.h
index d3133587d996..5a29d6bec51f 100644
--- a/tools/testing/selftests/rseq/rseq-x86-thread-pointer.h
+++ b/tools/testing/selftests/rseq/rseq-x86-thread-pointer.h
@@ -8,13 +8,11 @@
 #ifndef _RSEQ_X86_THREAD_POINTER
 #define _RSEQ_X86_THREAD_POINTER
 
-#include <features.h>
-
 #ifdef __cplusplus
 extern "C" {
 #endif
 
-#if __GNUC_PREREQ (11, 1)
+#if __GNUC__ > 11 || (__GNUC__ == 11 && __GNUC_MINOR__ >= 1)
 static inline void *rseq_thread_pointer(void)
 {
 	return __builtin_thread_pointer();
-- 
2.51.0

