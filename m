Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39113CC9E9
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 21:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788818080; cv=none; b=ApLYo/oirONDynB03iS6+D4+/4hZZZOiSe2zlZ7qCRU3JrCHqZfI6s9vjGjQyAUyqdeseyiYBVt8LG0PvFJSDo/d+jbn1+cfAHdTXbDZOprz6Yv16wVy9OTSxSPx/sHsYhhTGrIioFAXWCFuY1pd1ou34SE/syFJQ2Kn7gnrrH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788818080; c=relaxed/simple;
	bh=ATzllCN+dDw5CaRunDgFMLiOohABpMDjBm9gAA2JbL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GD9bEkpCHJsSKrdxTy4ulXWq5GPxt+8E+GNW8DEmhABOjoeScYGuJlzdaFh3zWfEPdJzNEUBH5GLYAEv3InkA877m6dd7GQk9ziv1seuNcXnYa/yXRkzmpihVKl2QNC1y2OodUTyQyqOv2x+WDU7TuI8W8Re5q+UWQSqnwbKQbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=kRu5icKf; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="kRu5icKf"
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 34EA23F1F4
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 21:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788818074;
	bh=fRpckaKOwl0Kgs7K/gM2OB7RO7urUAj94CqnshB8/I4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=kRu5icKfUEUcmvwaKio7cmGGXWebNI9AbOdiVcfdEc3UeR4Hvbq/QCmhfLjI5J3Y1
	 7BhNDcg4dLCwQzoIVntelMxGictKU1hIg2ouclc1olE3y168lrQPy78R8faOl7kB00
	 y9MIS8bM6prt+jJBpChPHCQBDA3XzyIM2KefFXmXJcoUQ+xvIDf/3smoyEDItINtxT
	 DEjecywl0Y7ijg0gi59NlebztCgnbEP9RF6QhnDx7M/fvLhnKm+zsfatzIEhuuXshi
	 xh2dTgg5tPmA3/7tOb/be78LMtGonA+UKSDSJCLV+s+5UCjgPAEBQJ+iZit5d0kN24
	 mDTr9bwUs0c/aPOyTFj3CfRvAZd/scZbW6OT/w3qccAgiRo0FtrOtyAF11Oa0Pmrlq
	 Q+1rPhoKxmePEZPSt1p4MuiQ987Rj0hcP391N3DITApRl83kJs0kb9EseUWFbkyDhC
	 3unbhfNJsPmfOoNR/mlQDvmc3xdCdnIjZ/IksvMRAQyRDpd3xbPK8IWEOpUBK3wQ14
	 As0NXAWoc7Ic+DwqLokvCsr8Jop8NI2yUK4IVgFyh069MW5P4WvRsQXIO2RcC2V5PJ
	 VBkzNbhV/lvX0ERDXWzWYYfIUpU5x59anBAdn1jTbUfG2mHuUjDvIkGpDfpuKUpTjt
	 aCmfwM/rneWl3aRbec9rhkjI=
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-857f88e7b3fso34078877b3.3
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 14:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788818073; x=1789422873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fRpckaKOwl0Kgs7K/gM2OB7RO7urUAj94CqnshB8/I4=;
        b=imoa6xyx7mS8cKTFgt3J/xwHBoYHOwI3iR3cb0KOXclXeOPW3ydIKAMnOKUN30ZQ7C
         QBGvGVyqIg3WQYzLsBOh94VksIEKsEEZCGBTp14rs5JoBu+WAv7hRbNRqKosL/cyNqBd
         sf7Ed+xW7v52tVYiWqr8ILZZDlrhEWjlO2thVmdCoD7FmsU6Glixwcx6fLByysEG272T
         99usnrczIwagoFZnuQjHf8eiIW0jopmfd2UWIeJI6X4/B8gOXrVJDVtbTS+MohMo7rJJ
         47gjKtUn6uKA7tuKy2wtIVaBVD6F0C5uvWv+j57Cjh59mhlSSMjhw9C8hxc7z5+wJGnf
         unmg==
X-Forwarded-Encrypted: i=1; AKwUvBz0GP6mxVwVO6/MAKwUCwRbs+jUx3MUqwrqaNZkzlhwKVsdaBD3Ix0ljNRbz1NyyDMkPK1TIo11Tr0xhmHY0uA=@vger.kernel.org
X-Gm-Message-State: AFuF++n7q7WFfehAfB3QODGZJxo6M5Z7Td5KzFQ9Zpe4gjQQvzJJaVvG
	JEzQRVbQlEm9Ny9H1+bUGN1eq29wqCQzIe7JUL+l4sLQnOoM8OgrLiaVXjrX13avTjT8x5mb1te
	0/oc6EkdYxhtxAHViEU11STwGd1b8vq6lDbGT6O8jou/ODQoI+3d5GiCrqlVzqkEXFM81fTRIiP
	y7ThpNLfvHrQ==
X-Gm-Gg: AYBFou3RGLNhJmHCmV5uGZDS2xBbY2i9+H0hE6SoduT0jEPVd/r9E5uWYriw6so8BIW
	fC26RKVsFxx5qTzKRietS4bFJyyVhgqwiO9LTvkKwQDnR2a5HcF4TPDBiwGuPoMkGLn51k/Qiwh
	fE8zWA0CsfxAbGp5sG/JhR3n7cgZyASn8wVk4XBn1BVpLXtmc8iqTetefPigffla1hmK6riCsQJ
	WY43zaFy2gvAvsNWQlFNAnRUDF39anr7wHxxdvStQBP2U/v0sVuTLGMAKQJsMvoQkVSeTb2xdCc
	fn80lxdZtscdMIoPrZyXAfLYANnQ7qxTnlfzbxxqmdQJpB1pIHnErpjPHF8JGkV7uYVbmUPWQ+d
	6/2t1DRsows8uibaiBXV6ePCyEsOkrynvF8k6Naj4Nw==
X-Received: by 2002:a05:690e:2581:b0:66f:8797:8721 with SMTP id 956f58d0204a3-66fb591c4b0mr6436212d50.10.1788818072939;
        Mon, 07 Sep 2026 14:54:32 -0700 (PDT)
X-Received: by 2002:a05:690e:2581:b0:66f:8797:8721 with SMTP id 956f58d0204a3-66fb591c4b0mr6436205d50.10.1788818072556;
        Mon, 07 Sep 2026 14:54:32 -0700 (PDT)
Received: from Q58-sff ([2a00:5884:1118:0:ed91:74de:df2:6b36])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb47a8b8fsm8977708d50.2.2026.09.07.14.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:54:31 -0700 (PDT)
From: Thibault Ferrante <thibault.ferrante@canonical.com>
To: linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com
Cc: mpe@ellerman.id.au,
	npiggin@gmail.com,
	shuah@kernel.org,
	chleroy@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/powerpc/tm: Fix tcheck() reading uninitialised CR value
Date: Mon,  7 Sep 2026 23:54:20 +0200
Message-ID: <20260907215420.1258678-1-thibault.ferrante@canonical.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tcheck() is used to check the current transaction state (active,
suspended, doomed) via the "tcheck" instruction, which writes its
result into CR field 0. The inline asm declared a GPR output operand
for this result but never actually moved the CR into it.

Every caller (tcheck_doomed(), tcheck_active(), tcheck_suspended(),
tcheck_transactional()) has effectively been testing bits of an unrelated,
arbitrary register value since this helper was introduced.
The "& 4" mask discards the TDOOMED and TS_lsb (suspended) bits before
they ever reach the callers, so tcheck_doomed() and tcheck_suspended()
can never return true, and tcheck_transactional() degrades to being
equivalent to tcheck_active().

Fix tcheck() to actually move CR into the output register with mfcr,
and widen the mask from "& 4" to "& 0xf" so the full CR0 nibble
(TDOOMED | TS_msb | TS_lsb | reserved) is preserved for the callers.

This bug has been present since tcheck() was introduced.

Link: https://bugs.launchpad.net/bugs/2107442
Fixes: 8e03bd4e70b6 ("selftests/powerpc: Add TM tcheck helpers in C")
Signed-off-by: Thibault Ferrante <thibault.ferrante@canonical.com>
---
 tools/testing/selftests/powerpc/tm/tm.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm.h b/tools/testing/selftests/powerpc/tm/tm.h
index c03c6e778876..6024ce4ba6ff 100644
--- a/tools/testing/selftests/powerpc/tm/tm.h
+++ b/tools/testing/selftests/powerpc/tm/tm.h
@@ -105,8 +105,12 @@ static inline bool failure_is_nesting(void)
 static inline int tcheck(void)
 {
 	long cr;
-	asm volatile ("tcheck 0" : "=r"(cr) : : "cr0");
-	return (cr >> 28) & 4;
+	asm volatile("tcheck 0;"
+		     "mfcr %0;"
+		     : "=r"(cr)
+		     :
+		     : "cr0");
+	return (cr >> 28) & 0xf;
 }
 
 static inline bool tcheck_doomed(void)
-- 
2.55.0

