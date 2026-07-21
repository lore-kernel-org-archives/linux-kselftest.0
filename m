Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461AA43C7DA
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 20:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667443; cv=none; b=CmGG63Nu7l2jcAB83STaP16d4sUgn7PvTJwM3AngrS/Ybt+mWeo37yERSFOdWVOwckljghvlnv3NeF9c0yFCsY3XST3zIsL2n6NcmSuub0QH2DxGWnFUqxTMmBG7ZI7rsABjrivfKINppxV0LnWhDdKDM459Q6zQPj0AvKe2LNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667443; c=relaxed/simple;
	bh=R+ywodY9/HEwLU1o/08HL92DtAFTrUi2XM/5yuI7Itk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ow/5Y/Pl/VKJT/bwYaSWdzS/93DOwlPXRE+ioY4yaRG/qrZHyClFr+MqKhud+qCS4I3aI2pdgGNGtd+A39M0iYlbcsBZrkASzxe0EH8I28Ovo7ILZbcjTLrz8NeWExyCfVk39YjSdV7Ph/10wm5hjCCHmGkWDQFbwL+8mJ1NATg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQjgGC9G; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQjgGC9G"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e9ecd7216cso4058665a34.3
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 13:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784667440; x=1785272240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGwW+xKeGyj9qdYgvsjMj0TNagE0SwrpwzZecGCbsEo=;
        b=EQjgGC9GxQzekN1Zx50JpyYcOmMzib8iIfjnjkZ+LQlu2ybsiLso0sYo9X24CTuqHA
         GQnzZ4LgBkizN1OeNKdKz4jvd+s+v5xhHJDX8xRgMjh9/XPa53fONErpAUla0Fl9bsWM
         3BKX68Uw7bQ9ASixWNv0xFFkxBNnyiFfZIB8ZMJU85M+pwpsXrysFj4WpMjLME85JyCl
         QnGNv8yfYskDsAKeeK4RDHJsmnDjH4hnDJdRqGmAC+qfk+H0ZGcjt28H6RH0ebmJpwFa
         DZBHBUHC1AqvAj1RVEfoqfcvJu0zJiT1zdap0OJ4hFRY2CROYOwjKgXoIlIGZESMhqHv
         Iv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784667440; x=1785272240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGwW+xKeGyj9qdYgvsjMj0TNagE0SwrpwzZecGCbsEo=;
        b=j4hu5ZzN8A3A/Tk4upDnlRFLJcSPt2B0qcW9byQQ+QP2pYvCd+xxrgxreWNo+sucYc
         iOMEUAdyhpx7lwvrr+ikBsI9V+DXFNhV59VBtBKacuhgEoAWVUNgkalFo1ewb7HrC7XE
         XYOrOjN293SFqaq8fxoPH3Czjzkf+I0etl/cmFHMzeKfOIZFhZVu5XoUvYhrxMbu7yf7
         AjadozP+Z5Q9tLwXZDxBO5unjOSTSFmDl1xesvufSUpR6p2S8PAIwbMs4r9eaGX+nO4R
         9YQSJPwy0hWW5v+M8+R4x1C2bDiVTbSPp8xxkackinzoWrN1nXrAewhxhCSaoaWe7Ubv
         G64A==
X-Forwarded-Encrypted: i=1; AHgh+RobzPldVIOx6hQHBDRPDvOAjhyoQMJr5qKRL3n+ZzdKzFmjpUdElbGKdpM4RSxecw+adSxzoYtX8TGmCE1mQrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE5/lIro7GdVr4+9Q0cTmXFGfijysGO7p9f8ewEy94yzvPQxUC
	W9QK++SdyNwou0a4+BlLkxOmE8ccCxWXn3GQjPGd+P/+B3lIlJPKgCKK
X-Gm-Gg: AfdE7cnQWXbJx/OQUX9rna84tPHwnEjHOaGn6opbO3UDIq/Ape5LkdH45fIbk3yXyUk
	pRJUyB9e3rnQpE8EoYsKNz8woWuaamC6SIA7Hkgxt2DInqTiFds5Km1+zVh85ep89spvn7R3RjW
	pd0fIBjuWQzHs/WbjtjYM0J6JdLkNqgOtEwhPHuIab9gv0YH2yESZmnocYWCHOjwpTPUsQGgnN4
	OJ7WHzBYF12IlvON4nXGU6tM4fPhonGzonB2EsMMQJkP8H9ks874lR8GNLvjEHGM5TwiRqMISvs
	LexFsHk+S4o960auFIUSVpBKFwZk9LOyRnNrKC4dPal7mh1FN7wTtRuqMKWnswDaqIFkOowHHAX
	wwmEA4u2/3of2C2R4TiTCxJf/TnFs3CykLmSzu8l/O2W3YPQsSngqOA2eTyaNLlkiFt3pzGvoX6
	flasMAQnfmSqYFql92P5xEudOaexy/P3/UOOi53uUu7yd9ZkX4jrxKiSjY2mGnCLBAND8GDJMTr
	7GYd9Ojb9beAq/88AUjmkyeaqWNk/o25RvU
X-Received: by 2002:a05:6830:6d10:b0:7e9:b4cf:d8c5 with SMTP id 46e09a7af769-7eda4d0f61amr9756553a34.25.1784667439823;
        Tue, 21 Jul 2026 13:57:19 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7edaf94a494sm11134501a34.13.2026.07.21.13.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:57:19 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 21 Jul 2026 14:56:56 -0600
Subject: [PATCH v7 07/29] vmlinux.lds.h: drop unused HEADERED_SECTION*
 macros
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-dd-maint-2-v7-7-010fbe73b311@gmail.com>
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
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784667429; l=1428;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=R+ywodY9/HEwLU1o/08HL92DtAFTrUi2XM/5yuI7Itk=;
 b=vQYJyP8MxuOQv2u1cH/IFNbnG8o09EQeGls4zdY2WK8vQ/fxaMBvko4DFb9hGhCOlr6txKN/0
 PPhajOOjZloBRtZqJwj6BkpY4kujVHKjVnTzPFcaqBAaTzv5VgUKeh1
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

These macros are unused, no point in carrying them any more.

NB: these macros were just moved to bounded_sections.lds.h, from
vmlinux.lds.h, which is the known entity, and therefore more
meaningful in the 1-line summary, so thats what I used as the topic.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/bounded_sections.lds.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/include/asm-generic/bounded_sections.lds.h b/include/asm-generic/bounded_sections.lds.h
index 8c29293ca7fb..268cdc34389b 100644
--- a/include/asm-generic/bounded_sections.lds.h
+++ b/include/asm-generic/bounded_sections.lds.h
@@ -18,19 +18,4 @@
 
 #define BOUNDED_SECTION(_sec)	 BOUNDED_SECTION_BY(_sec, _sec)
 
-#define HEADERED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_, _HDR_) \
-	_HDR_##_label_	= .;						\
-	KEEP(*(.gnu.linkonce.##_sec_))					\
-	BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)
-
-#define HEADERED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_, _HDR_) \
-	_label_##_HDR_ = .;						\
-	KEEP(*(.gnu.linkonce.##_sec_))					\
-	BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)
-
-#define HEADERED_SECTION_BY(_sec_, _label_)				\
-	HEADERED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop)
-
-#define HEADERED_SECTION(_sec)	 HEADERED_SECTION_BY(_sec, _sec)
-
 #endif /* _ASM_GENERIC_BOUNDED_SECTIONS_H */

-- 
2.55.0

