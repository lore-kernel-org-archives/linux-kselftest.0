Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84693B2FC0
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 20:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667445; cv=none; b=K0zIdTlTL4fHHw60UepNnPFMIwR1RRQJuLHIK9L9F0TDhiB4XUbVM+tnCLklG5+NwZ5iSTufuTmvlE0OOZMN3gScMUmxuhyd+RPN9FUfso3iXaE+2UuHvPpnC9khvokb/1fm5IOMXzrKQh968SRKfECBCaxWrvsDwGG4oUtkkLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667445; c=relaxed/simple;
	bh=QueupzyxzXlW98TDU/wAHIfrNHSSKLlUADfdJDWgXvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U5hnWlZJpraSfbYVv6hfDiAzX38pCC85XvcerL7L5jr1E1m4RmuuQsxwk6UiLHhvDq+Lb0eR7k4jrHdF/WnXBIvI2fHt+nXvxCB3uIMfODVM1qqULROwvna38B61KkKvFV3Ovum7VG2tbCdrAJwatRqHHYv7V0K1MefiPp4r/fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+y8pcdo; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+y8pcdo"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e6b5737bb2so9194677a34.1
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 13:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784667441; x=1785272241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0XBRpGfG4W3fZchgQTQabu+BeyUteD2r7DyZgoEWDq0=;
        b=D+y8pcdoeUfz6CwJ+3Geb2NMYwGBbxW6/wGY4zF1eXzc3ueIDtLXI82uO/invNXnwI
         GDo1TaQj0sG7lupcu9yNKNk+9jTNsxGS3iYwCfTFrhCcrFM038yQA0CqM/UF+dXJHLie
         RTP9vSL22V5jnkaaK4/c9u+QHUEEdF2dbmSx02IECbFCTOqMOhYUyxpFUjUsZ9Z4b8zJ
         mh9u3J3f4IXqhO1SUhG+VoRnWMZSAjiWP4fimXmYjgM2oC7lhDbV4QYBs61SJvr/JqMR
         7lln+soxvTe336OL0r1/sj5o+UiYHym92phtX2Ytwwi7Cs69Zr9BhNAEjYOqKEmHCYec
         Bnbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784667441; x=1785272241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0XBRpGfG4W3fZchgQTQabu+BeyUteD2r7DyZgoEWDq0=;
        b=Dz1ajmst6v8tXZFG9XJ6poDZbw0JKvsruc+7TiVO07VnNke2VIrvlUHwy2aVFo5UKN
         msrh3Kuls15wGqHzIZNS1RLDgX3JULOyPeUNy8n+6ZFxvz0AhgFv2+e8jbS9Lmeq0XVC
         1N3X80JjALippDaSUI0iJKczWOuVlQ2aL2hsjL3WEjexUAB86Q1Qd0RMY15gYVATR1sb
         LWHnEYyIVOj4qnvc2U1NHsACEj1e0g7JUoKOYytLU/iR5yMpQTeXysVo8C7QbZ5Jll+M
         l12bCbTaqvW5sbER1kBxcAFLZziHzmykHObt+/B/Myj3ANqeZyqFfreGoHzFBiCgC7Vb
         3J3Q==
X-Forwarded-Encrypted: i=1; AHgh+RoAcIX6/8aeUjtbe1whzQ0TT7E0Eagg9eLt3Zv2+nvXS66VuxqcY0lwToAFNBUThzQE277cGBzk4EyVBOLbWrw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8TjouAFM7/A79ZX5wd8J8kGuqxTJB9mA//WaLnLyc9yMs+IOT
	OcPZfX3M8zPLtl61Dk0ykUNjIZSZaiuuMebjh3P4OKYYF7Uu9v5tjDV3
X-Gm-Gg: AfdE7ck3Dkui3hbs7nIPOE4sRoK39ZUWcNJi3ypYjDwIcHXXzGQEkwdIfVSneS1E0Qi
	z2HeJFk9dt38MmZPQHgf/QqhaRyA/GD4HxwSXltbSDGUaoIrQ1Ja7fk/8CLuuHpD69SBIBUuPtL
	MvaHUE3JgCiy51lX7mPKUfsxdqaoDta/FE1jNQtNRupPCoswAP2wpjzEkiGipmjDiVxWFIL7ksK
	eEWBwFqdOCqBZjxIk4A8R4FT8GZc6wabpU+JTCT+iE5BgwrAX3YWpCwchgHkmHNJFoMuWEwU8hx
	SPVibJhJJCsSSYjwOIUsaxRhnn0ecG3rGv5uKOAjOU5NOrfQnXTVvt+lOmjDnu4SJseRLqLg0IF
	yFNOrjFx1PmsvTo2QDqaw7JB+6mbsEJ+K2poQ9otxRELFym+oFLtU16hJPj5KpG7TIJf3d5VZ7Z
	EbCIPJ1NOtZ+73X6BVWo2V78wTosXZ7Gr+g1JBbIYTx6YfvyiWdlAPAAME7RZMYe4fKSzunL9pA
	Sd7QmQT4ysRz9Cz/tZtUh+A6A==
X-Received: by 2002:a05:6830:3689:b0:7e6:ef1d:4aeb with SMTP id 46e09a7af769-7eda0963cdbmr11822176a34.15.1784667441080;
        Tue, 21 Jul 2026 13:57:21 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7edaf94a494sm11134501a34.13.2026.07.21.13.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:57:20 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 21 Jul 2026 14:56:57 -0600
Subject: [PATCH v7 08/29] vmlinux.lds.h: Fix ALIGN(8) omission causing NULL
 ptr on i386
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dd-maint-2-v7-8-010fbe73b311@gmail.com>
References: <20260721-dd-maint-2-v7-0-010fbe73b311@gmail.com>
In-Reply-To: <20260721-dd-maint-2-v7-0-010fbe73b311@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, Simona Vetter <simona@ffwll.ch>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784667429; l=6221;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=QueupzyxzXlW98TDU/wAHIfrNHSSKLlUADfdJDWgXvs=;
 b=LZbkb5hHcr7V3mq2sVbS9E7bVp09btWtQ7rZTDYqWGa8qUIX3GsENRhHmntWuVM9DGdNT3tIw
 U82R91npT66DgLRjo7UA13EaYVXbh9X/91ntdakzuAa1lg504+BJbvZ
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Almost all uses of the BOUNDED_SECTION macros are ALIGN(8), either
explicitly, or by being below an aligned section containing x*8 byte
objects.  The noteworthy exception is BOUNDED_SECTION(__dyndbg), which
immediately follows BOUNDED_SECTION(__dyndbg_classes).

On i386, struct _ddebug_classmap is 28 bytes, so without an explicit
ALIGN(8) in the macro, the following __dyndbg section gets misaligned,
causing a NULL ptr deref in dynamic_debug_init().

So fix this with an explicit ALIGN(8) in the existing BOUNDED_SECTION
macros, and introduce _ALIGNED variants to handle the cases with an
explicit . = ALIGN(x)

Also add explicit alignments for: EXCEPTION_TABLE, ORC_UNWIND_TABLE,
TRACEDATA, INIT_SETUP, and NOTES.

update BOUNDED_SECTION uses inside . = ALIGN(x) stanzas to use
_ALIGNED variants, but keep the outer ALIGNs so the symbols between
them are not "re-aligned".

In particular, scripts/sorttable.c does not tolerate sloppy padding.

At the top of ORC_UNWIND_TABLE, add . = ALIGN(4) to match the struct
orc_header __align() call in the code:

commit b9f174c811e3 ("x86/unwind/orc: Add ELF section with ORC version identifier")

Suggested-by: Louis Chauvet <louis.chauvet@bootlin.com>  # _ALIGNED variants.
Link: https://lore.kernel.org/lkml/177402491426.6181.12855763650074831089.b4-review@b4/
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v3:

sashiko complained about NOTES and .BTF_ids.
gemini asserts that NOTES are natively 4-byte aligned, add comment repeating it.
.BTF_ids doesnt use BOUNDED_BY, since start/end isnt needed;
sashiko evidently got confused by immediately preceding usage.

v2:

sashiko picked up 2 cases, added to the explicit list above
https://sashiko.dev/#/patchset/20260515-asm-generic-1-v3-0-680b273666d4%40gmail.com
---
 include/asm-generic/bounded_sections.lds.h | 17 ++++++++++++++---
 include/asm-generic/vmlinux.lds.h          | 18 ++++++++++--------
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/include/asm-generic/bounded_sections.lds.h b/include/asm-generic/bounded_sections.lds.h
index 268cdc34389b..8ff3e3420f60 100644
--- a/include/asm-generic/bounded_sections.lds.h
+++ b/include/asm-generic/bounded_sections.lds.h
@@ -3,19 +3,30 @@
 #ifndef _ASM_GENERIC_BOUNDED_SECTIONS_H
 #define _ASM_GENERIC_BOUNDED_SECTIONS_H
 
-#define BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
+#define BOUNDED_SECTION_PRE_LABEL_ALIGNED(_sec_, _label_, _BEGIN_, _END_, _ALIGNED_) \
+	. = ALIGN(_ALIGNED_);						\
 	_BEGIN_##_label_ = .;						\
 	KEEP(*(_sec_))							\
 	_END_##_label_ = .;
 
-#define BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
+#define BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
+	BOUNDED_SECTION_PRE_LABEL_ALIGNED(_sec_, _label_, _BEGIN_, _END_, 8)
+
+#define BOUNDED_SECTION_POST_LABEL_ALIGNED(_sec_, _label_, _BEGIN_, _END_, _ALIGNED_) \
+	. = ALIGN(_ALIGNED_);						\
 	_label_##_BEGIN_ = .;						\
 	KEEP(*(_sec_))							\
 	_label_##_END_ = .;
 
+#define BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
+	BOUNDED_SECTION_POST_LABEL_ALIGNED(_sec_, _label_, _BEGIN_, _END_, 8)
+
 #define BOUNDED_SECTION_BY(_sec_, _label_)				\
 	BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop)
 
-#define BOUNDED_SECTION(_sec)	 BOUNDED_SECTION_BY(_sec, _sec)
+#define BOUNDED_SECTION_BY_ALIGNED(_sec_, _label_, _ALIGNED_)		\
+	BOUNDED_SECTION_PRE_LABEL_ALIGNED(_sec_, _label_, __start, __stop, _ALIGNED_)
+
+#define BOUNDED_SECTION(_sec)   BOUNDED_SECTION_BY(_sec, _sec)
 
 #endif /* _ASM_GENERIC_BOUNDED_SECTIONS_H */
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index f5ddf31b7f26..f29fc079e37e 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -640,7 +640,7 @@
 #define EXCEPTION_TABLE(align)						\
 	. = ALIGN(align);						\
 	__ex_table : AT(ADDR(__ex_table) - LOAD_OFFSET) {		\
-		BOUNDED_SECTION_BY(__ex_table, ___ex_table)		\
+		BOUNDED_SECTION_BY_ALIGNED(__ex_table, ___ex_table, align) \
 	}
 
 /*
@@ -650,7 +650,7 @@
 #define BTF								\
 	. = ALIGN(PAGE_SIZE);						\
 	.BTF : AT(ADDR(.BTF) - LOAD_OFFSET) {				\
-		BOUNDED_SECTION_BY(.BTF, _BTF)				\
+		BOUNDED_SECTION_BY_ALIGNED(.BTF, _BTF, PAGE_SIZE)	\
 	}								\
 	. = ALIGN(PAGE_SIZE);						\
 	.BTF_ids : AT(ADDR(.BTF_ids) - LOAD_OFFSET) {			\
@@ -832,16 +832,17 @@
 
 #ifdef CONFIG_UNWINDER_ORC
 #define ORC_UNWIND_TABLE						\
+	. = ALIGN(4);							\
 	.orc_header : AT(ADDR(.orc_header) - LOAD_OFFSET) {		\
-		BOUNDED_SECTION_BY(.orc_header, _orc_header)		\
+		BOUNDED_SECTION_BY_ALIGNED(.orc_header, _orc_header, 4)	\
 	}								\
 	. = ALIGN(4);							\
 	.orc_unwind_ip : AT(ADDR(.orc_unwind_ip) - LOAD_OFFSET) {	\
-		BOUNDED_SECTION_BY(.orc_unwind_ip, _orc_unwind_ip)	\
+		BOUNDED_SECTION_BY_ALIGNED(.orc_unwind_ip, _orc_unwind_ip, 4)\
 	}								\
 	. = ALIGN(2);							\
 	.orc_unwind : AT(ADDR(.orc_unwind) - LOAD_OFFSET) {		\
-		BOUNDED_SECTION_BY(.orc_unwind, _orc_unwind)		\
+		BOUNDED_SECTION_BY_ALIGNED(.orc_unwind, _orc_unwind, 2)	\
 	}								\
 	text_size = _etext - _stext;					\
 	. = ALIGN(4);							\
@@ -869,7 +870,7 @@
 #define TRACEDATA							\
 	. = ALIGN(4);							\
 	.tracedata : AT(ADDR(.tracedata) - LOAD_OFFSET) {		\
-		BOUNDED_SECTION_POST_LABEL(.tracedata, __tracedata, _start, _end) \
+		BOUNDED_SECTION_POST_LABEL_ALIGNED(.tracedata, __tracedata, _start, _end, 4) \
 	}
 #else
 #define TRACEDATA
@@ -898,13 +899,14 @@
 		*(.note.gnu.property)					\
 	}								\
 	.notes : AT(ADDR(.notes) - LOAD_OFFSET) {			\
-		BOUNDED_SECTION_BY(.note.*, _notes)			\
+		/* *(.note.*) are natively 4-byte aligned */		\
+		BOUNDED_SECTION_BY_ALIGNED(.note.*, _notes, 4)		\
 	} NOTES_HEADERS							\
 	NOTES_HEADERS_RESTORE
 
 #define INIT_SETUP(initsetup_align)					\
 		. = ALIGN(initsetup_align);				\
-		BOUNDED_SECTION_POST_LABEL(.init.setup, __setup, _start, _end)
+		BOUNDED_SECTION_POST_LABEL_ALIGNED(.init.setup, __setup, _start, _end, initsetup_align)
 
 #define INIT_CALLS_LEVEL(level)						\
 		__initcall##level##_start = .;				\

-- 
2.55.0

