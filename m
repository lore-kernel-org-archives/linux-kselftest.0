Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50EB345CB0
	for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 07:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779520503; cv=none; b=riAHNQn4OXw3Gj5aMZLhijaD6hMGtAvsCOlEH/yKFmvBJPmlR3OaHY1F6C6PsfuQ11CoNjj8E2Hz1xakGemlVwsR6hvg0h7N//L2LjU6w4gkKshtEaZYYJq8N/89CA7rGk1IWHPQNaOvfhKZ+zcOV/5n3975AIQ4XOJT1FBkTnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779520503; c=relaxed/simple;
	bh=wCFqvr2/Nq+hwAEKum5xoeXfV9V823VfJhtwsvw3xV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tkulyhFyV8dCKJ5Szut/78DGl1xoavdx+faAdKXdAyGY4hggxrZJTgaLDu/CW48GssKbjq8P9NFXlTcY5c1s5orFzdcm1MsviR4pz+ltZZ9dZsB5v+0NCSofBMFYO9aTQZxpecm7YIMGlFxLhjWbpOyuK6MyODr41zE1rIT5iW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqzdZt+3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqzdZt+3"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso69931135e9.2
        for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 00:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779520500; x=1780125300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ydDUhhJnV3YW5dvq7T8CAXgzEOqK2B2L08PLbDSdkc=;
        b=HqzdZt+3bkOKnpK6hokiM9eMZPpM61ucNP3Q97+/eCFiWJlzPiAYtJw+jgQCpQGY3o
         XZ+G3MMeAUCTVLjd/NEKgNqPCz8D0LKN5f3JG9XMpALF2wc5VgcjKPluWy/Mu4+lssVp
         4g7Hh4zK2Acx0gT3/fPb/26AigyZLrFEIpmSPec2y4VxYKRuX8CLc/gj4SHF8VL80GFF
         7aw6nMR8qBLj5Cm/UV/g4nXFHi8n+gUg3V2SF7yQ3ePJr7JNMBTmuIxzxC6BPSCII6KJ
         AUIpA1GA1eZE1V9uj2UmhIa7EZv36wpZxEEghm0rRqWrC5qcRC72VRskNPr6oXDDO+7k
         MivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779520500; x=1780125300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ydDUhhJnV3YW5dvq7T8CAXgzEOqK2B2L08PLbDSdkc=;
        b=V5tGaJ5afMEt4EbL5AJhgSjCM2zRm7OeMtx87Ph63p74cmPICxYrCbWXBM9Q4mxDjK
         q6uYknSCQ9R8qe2eSTmmyVw+Sf4t9hqQ+Uaqc+BGY+aOYu8xpj3QoemqycDiW/9DXjsT
         lziP1QxZOAHb7xNxgqfCapLYHajxHrTuVFkw3XDW58/EHwgZin4M13UKE2vE2msLBf7S
         /SBYFTdSOIlaub/cpDMkK2UsmZfClWPFsnpzkjmKL7HfZFrwshadwWVkGAPWet2wbfQ9
         gyEFzmnFz00Zj78W5xjx4BnKnPt5g8I8Ohg2unOiXmJkCXpqzm/j/jP3vdY7Oum9Rzqb
         M3iA==
X-Forwarded-Encrypted: i=1; AFNElJ+cpFLo2w1YkLuhta0C8dzhKJApDnMIIpYUJpPsL36N7wlTNQUlAFfYmojEYi49Gu1rPNHM5F1VXcdrZ1QiYPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPccqBX8JgWSRjH54tBIwAj90pmuKygJhRvcKtZ4JTC8JBiopS
	kP3P0QtC016VeSfuqinrYmZMsCzGYpGv9bztLqq9DjVxiBDhA7CGRXDU
X-Gm-Gg: Acq92OHUFE/qBjAdzaa6EMO6SpbCzyOnriBMWbDH8aklMnp3KsjdbST2+uavpJ9W7Rh
	WxjUTMbeXyeu3SqwbUHUy/4hUAr0gxmZwm61xHYsRpB6LV5cVE+Q3lvVNtDrJwHYs4gX5Lqnlth
	PaA2P3pmWymGMyqa7YIZ4mJ49Gf78fBQCfBCWuLOfYcquS7PKFtKEOpIXA5AJawmXvdvx/04KUt
	pqWd2wNQqvSOMCydgPJ457oGwaf1Yr0U92oE6aJlDK9R85GspN8VPMYttHQQ5pokf5NPZ46nv3t
	UscDYrQwRF1pS/qjs4qhyIka6O0fLsbagPVcHPR8KVizsmJSVPNflxH3KU42u3xFQo6xy+SUVtC
	A05Py+njpIXE5NCetE9UPIWhog/pkIoe8QKzFoUkKaSGSHVNsftVqiHjXwZIOgaoSZt6l0n40sA
	A/Or93c47ThluNCXkcdFmDxZ6MG5af
X-Received: by 2002:a05:600c:b99:b0:490:4ebc:b80a with SMTP id 5b1f17b1804b1-4904ebcbac7mr44759465e9.11.1779520500131;
        Sat, 23 May 2026 00:15:00 -0700 (PDT)
Received: from [192.168.0.174] ([31.96.183.250])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb76sm8639838f8f.25.2026.05.23.00.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 00:14:59 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 23 May 2026 01:14:39 -0600
Subject: [PATCH v2 06/24] vmlinux.lds.h: remove redundant ALIGN(8)
 directives
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-dd-maint-2-v2-6-b937312aa083@gmail.com>
References: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
In-Reply-To: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779520485; l=3579;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=wCFqvr2/Nq+hwAEKum5xoeXfV9V823VfJhtwsvw3xV4=;
 b=zoGZ5xFmx1pK9ySsKJrw3WCln9FRKHKrPIqcDQnSodIO8PiOl6oJ5J2QJqSz0trflcvmyv+1t
 EJUu/0EO0/hDtdNs2sQ254GFznaUfHgsbMfwGhMSB279GGneidCWrnm
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

The BOUNDED_SECTION_PRE_LABEL and BOUNDED_SECTION_POST_LABEL macros
were recently updated to inherently enforce an 8-byte alignment. This
makes the explicit '. = ALIGN(8);' statements preceding 'naked' macro
calls in vmlinux.lds.h redundant.

Remove these redundant alignment directives to clean up the file and
clarify that the macros handle their own alignment padding.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/vmlinux.lds.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 477333bdf3d3..0e4677b71d16 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -228,7 +228,6 @@
 
 #ifdef CONFIG_KPROBES
 #define KPROBE_BLACKLIST()				\
-	. = ALIGN(8);					\
 	BOUNDED_SECTION(_kprobe_blacklist)
 #else
 #define KPROBE_BLACKLIST()
@@ -244,7 +243,6 @@
 
 #ifdef CONFIG_EVENT_TRACING
 #define FTRACE_EVENTS()							\
-	. = ALIGN(8);							\
 	BOUNDED_SECTION(_ftrace_events)					\
 	BOUNDED_SECTION_BY(_ftrace_eval_map, _ftrace_eval_maps)
 #else
@@ -261,7 +259,6 @@
 
 #ifdef CONFIG_FTRACE_SYSCALLS
 #define TRACE_SYSCALLS()			\
-	. = ALIGN(8);				\
 	BOUNDED_SECTION_BY(__syscalls_metadata, _syscalls_metadata)
 #else
 #define TRACE_SYSCALLS()
@@ -276,7 +273,6 @@
 
 #ifdef CONFIG_SERIAL_EARLYCON
 #define EARLYCON_TABLE()						\
-	. = ALIGN(8);							\
 	BOUNDED_SECTION_POST_LABEL(__earlycon_table, __earlycon_table, , _end)
 #else
 #define EARLYCON_TABLE()
@@ -284,11 +280,9 @@
 
 #ifdef CONFIG_SECURITY
 #define LSM_TABLE()					\
-	. = ALIGN(8);					\
 	BOUNDED_SECTION_PRE_LABEL(.lsm_info.init, _lsm_info, __start, __end)
 
 #define EARLY_LSM_TABLE()						\
-	. = ALIGN(8);							\
 	BOUNDED_SECTION_PRE_LABEL(.early_lsm_info.init, _early_lsm_info, __start, __end)
 #else
 #define LSM_TABLE()
@@ -314,7 +308,6 @@
 
 #ifdef CONFIG_ACPI
 #define ACPI_PROBE_TABLE(name)						\
-	. = ALIGN(8);							\
 	BOUNDED_SECTION_POST_LABEL(__##name##_acpi_probe_table,		\
 				   __##name##_acpi_probe_table,, _end)
 #else
@@ -323,7 +316,6 @@
 
 #ifdef CONFIG_THERMAL
 #define THERMAL_TABLE(name)						\
-	. = ALIGN(8);							\
 	BOUNDED_SECTION_POST_LABEL(__##name##_thermal_table,		\
 				   __##name##_thermal_table,, _end)
 #else
@@ -403,12 +395,10 @@
 	__end_init_stack = .;
 
 #define JUMP_TABLE_DATA							\
-	. = ALIGN(8);							\
 	BOUNDED_SECTION_BY(__jump_table, ___jump_table)
 
 #ifdef CONFIG_HAVE_STATIC_CALL_INLINE
 #define STATIC_CALL_DATA						\
-	. = ALIGN(8);							\
 	BOUNDED_SECTION_BY(.static_call_sites, _static_call_sites)	\
 	BOUNDED_SECTION_BY(.static_call_tramp_key, _static_call_tramp_key)
 #else
@@ -453,7 +443,6 @@
 		*(.rodata) *(.rodata.*) *(.data.rel.ro*)		\
 		SCHED_DATA						\
 		RO_AFTER_INIT_DATA	/* Read only after init */	\
-		. = ALIGN(8);						\
 		BOUNDED_SECTION_BY(__tracepoints_ptrs, ___tracepoints_ptrs) \
 		*(__tracepoints_strings)/* Tracepoints: strings */	\
 	}								\
@@ -946,12 +935,10 @@
 
 /* Alignment must be consistent with (kunit_suite *) in include/kunit/test.h */
 #define KUNIT_TABLE()							\
-		. = ALIGN(8);						\
 		BOUNDED_SECTION_POST_LABEL(.kunit_test_suites, __kunit_suites, _start, _end)
 
 /* Alignment must be consistent with (kunit_suite *) in include/kunit/test.h */
 #define KUNIT_INIT_TABLE()						\
-		. = ALIGN(8);						\
 		BOUNDED_SECTION_POST_LABEL(.kunit_init_test_suites, \
 				__kunit_init_suites, _start, _end)
 

-- 
2.54.0

