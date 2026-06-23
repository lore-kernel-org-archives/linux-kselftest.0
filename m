Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73E33D413C
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 14:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226378; cv=none; b=pyL28+fhq1VgdBpY+pXyNQvnfhhjTqv2oR2QzpH3UFe/Wj07jJiucGHNHifXmiPsNM/D85LjNnU0blXo6j2vhel68gwdjdwku98KsS5K5Dwy6lWSHtdC0OGg0JQ4YngD4QDuPQWSSi+J7c8TrfKnZcz9EjNa1JqoDQ/nW9GcUd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226378; c=relaxed/simple;
	bh=x+iONerpNVaZ5i74SwJKTGWOqU2Ah/gR4DrqCeIUHZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XkFk6D81r7V3MnDkplZt/ye8lfKR6nJaK82IIA6TsW76yriw/0/X5k8Gh24VPqXAPOFu5CC+9ENd2l0jgEKHUKPjxC2X+grZd4mvM7I5GV8UQIxTcr+k2/YrbfpItqB4fVeUuEunyPCLBWnQgpItTy8gUuaUbXUujG+uGi+uCs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p8/E/L9b; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p8/E/L9b"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-37cae11ba85so13679a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 07:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782226377; x=1782831177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AeJlYzH+Z0sCek8zGKSy/7esmMSr6MOi3Ac8XXBZWsY=;
        b=p8/E/L9byXg3DZlS4shWEd3X62sf/HuKxoLaAs++8mIHtsWkcKnQU/fqTuCxKkS1Yy
         UJJGKZBYgBq/N4u2h01aOn+WCrXTOIFLaoAOVbBlB/zf/FhA7uOwLcq/VpugqXqW5jUe
         e5Jc2FARSdGo7CnuX9VBaASu9orl/D5i+PEXlMp2BpyuD527ieLu+pIKBEalmL2NKGLi
         akDs1t4/bxF/RVmgnec8oNuCK2j6BuwVF3GUjyIq2GJ0+9XjSAGC0u2KLCn6OC+/VE0t
         fLw9Qcr6NLfBkkEmmvYMUqXaAxxHyOmEQ3JdoxkQbOlzP87Z/73MqRq6DSrhzQYA0+hT
         wqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226377; x=1782831177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeJlYzH+Z0sCek8zGKSy/7esmMSr6MOi3Ac8XXBZWsY=;
        b=UmqOHsXt+TQtad8oB5wTC+mkbZVpLZQ+DaChrhtH2z5MUwIFqScanEtSujeyIK8+6I
         PbCHX8tPty3yEyUrTwCgS++NKN57u67IUBbcNp0YKGP5l3uHLPdzTgmW1WReGRPRkw6m
         RG1e/OuI6CJdrfnMzsmUz/07gRDq6RKWTrq6Q0Gb8nq/znNvKC5rXo3gK/snttW0u4Kw
         zIeA8w6497jFfe7gw8kQqy74oPj5EO3owEE3yH1bP6Hy+t5Rw5Xi7r6jlmaLqyK7FJ77
         ZEuTG4sbYlT1Q2uI7whLMJbn4KRr0mciHTr4KL/IdBHcty/9mQeQXQ6IIiAbzmNcmKUx
         dJLA==
X-Forwarded-Encrypted: i=1; AHgh+RoZjy7gevJ3v7Fqnk8vjhAwjceiHYt2mIAiFMHePJov1upnVyu/i4UodkUqgRvwpJqnjIVoU2FFHjglPO6DEcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRQJhjmDFgzOgpzFebCktufGqZGs6hF3FgROZ8C+CLQSWOr2CQ
	AjgU20SXhp04gc52fA6YaxXxEwTFZhX3K/arbS6zeZAq3H/s6l49duwfzCgkwqYVhmYytrcfWw=
	=
X-Gm-Gg: AfdE7ckRi71q5Nt2/o0Gd3alPMfzyo9xzP8hM8nqXGFnGRLtfKpjb4bzj5eLw1gmHtU
	xqPCFxosU5oFzBzieP8PkWFwEyKUtcox3N27pfkPKWA140scSpfE8SpIQ0Cw8sBHUr7RZQCKRTU
	pgKlonq3xaFKMlTWeWiP3ZfyVGZV/xP4o2UycSbESAmxwCbMm2XGNoAPCc7bRy4TCXJsrPhyb+y
	8CkEsAhNVjZqyb1k48Gkjgj44jond5KHGPtWfM5XrDuN8h5yuAxN9tAYFxi2dbNPkMlG/EKuw45
	W6tViu68NoexfLqeuW1kmyRXWcLQV9opmtTYQCVEqoJeh00PzJGDtYsET3vyc+oZeT7PnPYHAVb
	dtb3IQ1JfMwxd2eNhBkNYtsDxFRUc/kfhEtR3xV0jN7LVKSwoOyCZD9coI7EcoSK9+/cuUINqHs
	PqNSvuBopZLzGhcE49/R8tioad
X-Received: by 2002:a17:90b:3ece:b0:36d:635b:85a0 with SMTP id 98e67ed59e1d1-37d15fbff00mr22298281a91.3.1782226376807;
        Tue, 23 Jun 2026 07:52:56 -0700 (PDT)
Received: from localhost.localdomain ([66.235.111.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8cfbsm108727065ad.45.2026.06.23.07.52.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 23 Jun 2026 07:52:55 -0700 (PDT)
From: TAO Ye <taoye602602@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAO Ye <taoye602602@gmail.com>
Subject: [PATCH] selftests/powerpc: Add SPDX-License-Identifier to count_stcx_fail.c
Date: Tue, 23 Jun 2026 22:52:37 +0800
Message-ID: <20260623145237.32583-1-taoye602602@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

count_stcx_fail.c still carries only the original free-text license
notice ("Licensed under GPLv2.") and has no SPDX-License-Identifier
tag.

Replace the free-text notice with the equivalent SPDX identifier
GPL-2.0-only, matching the sibling files. The copyright notice is
retained and no license change is intended.

Signed-off-by: TAO Ye <taoye602602@gmail.com>
---
 tools/testing/selftests/powerpc/pmu/count_stcx_fail.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/pmu/count_stcx_fail.c b/tools/testing/selftests/powerpc/pmu/count_stcx_fail.c
index d8dd9a9c6c1b..51a7565c6435 100644
--- a/tools/testing/selftests/powerpc/pmu/count_stcx_fail.c
+++ b/tools/testing/selftests/powerpc/pmu/count_stcx_fail.c
@@ -1,6 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright 2013, Michael Ellerman, IBM Corp.
- * Licensed under GPLv2.
  */
 
 #define _GNU_SOURCE

base-commit: 4708cac0e22cfd217f48f7cec3c35e5922efcccd
-- 
2.50.1 (Apple Git-155)

