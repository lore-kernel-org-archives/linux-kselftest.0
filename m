Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0C53750D5
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 12:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315511; cv=none; b=drdI8YZPWs31xp3b+ygYmK849wUeQu9QaEpRj+l/uLdou6AjtDl1NxDMEPE3gMv1H6ctThQwQBT8SwJ7wGZAT8Y5L2nA7pPM+cftIAv5y5t1PUy//IACg/5ZosdZAcG3fPlJ7B9l6cwUioWjn1GIFPlAClKB/ek1TyuPn0Yqbdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315511; c=relaxed/simple;
	bh=gyhl2dDHOhDRfo2EoLm//e3PBy86xHd/L/qSVe14+FQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I1IA/WpHRT51vyCjCjQKITGPkl6+9PbmBId7XqFw4ZklW+MMeDTHnyk3Gop7hIO6klK+UJb1+h3YAveUVgUJLBy4K8/d43FwDtWZvqrVtiJ9rl6hfmm0URTxVbYVhosFeTyopffZa3rm59pNGAGvpCeN3mXUow20F0h4uC9w3NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tEGpYROC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tEGpYROC"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4905529b933so76651865e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 05:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780315509; x=1780920309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GsoCp+QEhPQqcC7YciJ1pPB6BZ3pQYi3CKXlL70tQeM=;
        b=tEGpYROC3b8WCnjNkq74IbPVh3VhTkKWIhG80fGP1fmEKfg+KnXM9yO1gHz3NOxfoW
         zqE7tJW3fsrnLvYSVTEAVNpbyIVfUQtL3XEXhqDT0zw+laN1w3hw+IveJ1aV2QWOMmGa
         +UU+aAMi1/G1SdLc7/uuGznVGII1V4BScfdziBygVqAsjl820SxueggGKeC+k8tKPT75
         sRSLiy+Uvqw/100ZOTUL5j0p8ccb2n/H2p+XUTK5H6xD0xeGwWCA4ahuptlQ8iDctBnN
         mx93C4H5XgdweueMnuPuczAdueT1f3o9FUTLu7DkTKCXPIzO3QM+00MWxMMKpidGoZ/J
         CHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315509; x=1780920309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GsoCp+QEhPQqcC7YciJ1pPB6BZ3pQYi3CKXlL70tQeM=;
        b=bDq+ENBWHnuGC/5iOFyT8wMaDoj1MiAY7/SKr95IXw3C/P0NFQa9BA//ivY9HLpb0U
         E8bltHoGYHhgMuU9akKeRiFTbXuZyzMTqBELybtUjZ5rfrfKizvJ6NX/14K/gx5WPw9F
         qSkbjUMMCdJWHITWGoT3rB6Iwfsu3TC/Z6U/cGmWCwN7F0pTX14ko9hR+OrZD28XZw/h
         68xIL0qX4Txg6vkKIUgDanMI3ESP5qQQKgWONoqx+5Se7eux8Qz7hTNfNeh8E6Z9Hwe4
         yMbI9kBhlNCGdjOyylt6Ha+tb7SwbG3eptlo62Q50zfKySgaoSHKe9s3FslgadM4wpcM
         OSQw==
X-Forwarded-Encrypted: i=1; AFNElJ/oCNraZplAfYkCWTdTl4Bp8cBZPN9L/fjz9AUs1iVCtHGwydNgDxhi+N9T74SNzH/2pka5xQDPiM+0cn68HdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRsMRfcFH+gJ47ZnzFy188nVzojBNu7NbUYjSDX9KXJYI342MU
	Z1AaUi2fVjzNF5FTpTWzufYc5rTRh5zGMbrJLPu/xvYCDlW0vb/ofEj3
X-Gm-Gg: Acq92OFegNZzJbG7LE0GY1kNIywBzoZcmDWIr7GF4RrWMmUfI41okVbBfs0BXg0T+ij
	TKMaH0wb0tWMjQ/nNsGK8uK3jJBpbccFqZ4g2m14VzlKBDAsR9OwXXbt9TF6DpsjyaGcCWafjDU
	SddWH2pMxqM5Odg8rRpuVwElH+yruX0MOiHPgScKy/E73lrdimV+h7v0Qc3IkdjCBMAwuf+3L66
	mDd3ZONrMDIOsnPsXLjGfla492YOL5yraLjcbGXP9mkd87ylxxBwrLs/l0xyPuFiQoUX9wYrFB4
	11avN6nX+rGLbof21pmv7iHfH1mwWWOvPR3th9LUH+ZDNKze+HEz+YHH20P/HPAtd8Aq9b0we/j
	lJWiL04Bsh4IPOdEG/YLeO+cC7zCbSJK8yVz7Aes51NcirIesJrgSklQr8fIahgJruVujkCsaRv
	+jGbAKyN5jJFEk3O3wQ41sN9FPIOJXVwyIVZ1XvZWFFw==
X-Received: by 2002:a05:600d:6443:20b0:490:a1be:6b01 with SMTP id 5b1f17b1804b1-490a2923a7cmr151516555e9.4.1780315508566;
        Mon, 01 Jun 2026 05:05:08 -0700 (PDT)
Received: from [172.16.188.153] ([213.181.114.83])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm103972805e9.9.2026.06.01.05.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:05:08 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 01 Jun 2026 12:04:50 +0000
Subject: [PATCH v3 04/24] vmlinux.lds.h: drop unused HEADERED_SECTION*
 macros
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-dd-maint-2-v3-4-4a15b241bd3c@gmail.com>
References: <20260601-dd-maint-2-v3-0-4a15b241bd3c@gmail.com>
In-Reply-To: <20260601-dd-maint-2-v3-0-4a15b241bd3c@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780315495; l=1428;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=gyhl2dDHOhDRfo2EoLm//e3PBy86xHd/L/qSVe14+FQ=;
 b=odAHg/A0RFY+meA/TW8ZCLAdsG0OHafCZnPdBgvkp1M24pCVckS1yoK9eKlBI1667V0xBIsYV
 ww1XkipaWKzA8FtpuBJ3CTxXacOCF8vQ5ShKpVOzVqZfQjDgCRGbJXP
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
2.54.0

