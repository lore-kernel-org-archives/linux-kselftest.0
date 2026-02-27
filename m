Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF383375C2;
	Fri, 27 Feb 2026 06:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174764; cv=none; b=oprASzosOV6GVsNt458a2j9N3MKqEfdgg30k5D/L6h/OCcWfZErQcaBpUtB/OBzRCUBLVRiFZ8X/ZGmEKoDsMajPFZChzjnmB3w0y6RU4Qs72jBtq8SG2lbktbThKnYYZo8EtWljcSPfxXvfrK5gdsUSnF8rDHNjifuT9eK6c6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174764; c=relaxed/simple;
	bh=U+t8Mi7k+VBsSnk9ZpACgCqoKeOG5zfWruqbCgkLLqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJpKbJxEbPLWy4gmJ3I0OBZLKRttTFuLqp99p08nQUX/XfExKviXsBxruZwtubQkawqZZSLWouf27gX/iwKEAflDVpJ1ZhXjfFqWw9cTrsZwwM8llNGt5FvOpizMoZCCVvCswk1N5lpd27LQoJe9dT4qTEbrYgGCjK+Mqixxo1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XXto6hJU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XMSAwZn7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XXto6hJU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XMSAwZn7"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=95XbjX6n9fcYSFAHJRgRE0KDt27uVwK1J51Urtrslhk=;
	b=XXto6hJUcESoh4QsH5pMLrzVD5N1KdgdrAZsQFauXqR4byi1yBuUJwDg7fM6YVGWfk5SeM
	B4dDp2AXqS1a5EWEWWNUTIawwZ1M2oH0mpltx4gtrTuG7bf+Ryj4+RXiLuObcY+qiL6o0g
	bOMds6R8NT+UMFcxuz7krRURAZ3chJnGGBZRAUrmjvZh9MiBdy6Hnv0DFeGlSZWJvT9gpe
	JesFN1itxiTZEN5zUlJFcepKVB4idlcXpVpLIR2UMZIV4hQLDQOHYKhCWijktYSA13pK/U
	KkaOXvPX3/jXAVVBNwh/a5Kufnr8yPkzdib0tf1hJY7tFeJmU0JZm3f80mES/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=95XbjX6n9fcYSFAHJRgRE0KDt27uVwK1J51Urtrslhk=;
	b=XMSAwZn7U1uM003Va4OKoVpHxvThC2SVxfF89GNPFxH+WHl3m83ba6/4hdvys42Dz4Ej2I
	PJMT8VHiJwF5X1CA==
Date: Fri, 27 Feb 2026 07:45:57 +0100
Subject: [PATCH v2 2/6] selftests: vDSO: vdso_test_gettimeofday: Remove
 nolibc checks
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-selftest-cleanups-v2-2-d84830fa8beb@linutronix.de>
References: <20260227-vdso-selftest-cleanups-v2-0-d84830fa8beb@linutronix.de>
In-Reply-To: <20260227-vdso-selftest-cleanups-v2-0-d84830fa8beb@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174759; l=719;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=U+t8Mi7k+VBsSnk9ZpACgCqoKeOG5zfWruqbCgkLLqw=;
 b=Oqf+JKSXj7UNEP6xqO+waQAaEKEcK/go65rEPfuRO5VxwRCkfKVdrPZKJkkYtEVyCxvOCw6GS
 081WWKRc2+1C4gbUJHMVWWDEA2z/FX0UB66767K1gFKciG6mS2J1W0G
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

nolibc now provides these headers, making the check unnecessary.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/vDSO/vdso_test_gettimeofday.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c b/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
index 912edadad92c..990b29e0e272 100644
--- a/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
+++ b/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
@@ -11,10 +11,8 @@
  */
 
 #include <stdio.h>
-#ifndef NOLIBC
 #include <sys/auxv.h>
 #include <sys/time.h>
-#endif
 
 #include "kselftest.h"
 #include "parse_vdso.h"

-- 
2.53.0

