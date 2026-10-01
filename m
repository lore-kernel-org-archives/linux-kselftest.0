Received: from mail-oi2-f6.google.com (mail-oi2-f6.google.com [74.125.231.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8239367B9C
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 06:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.198
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790834432; cv=pass; b=dOmP3LvGNnJcZ77N57Ri6ekm0uHfvg25VMS+sSNm29AZbPQRs2Zz+t+k4C5oTPhz3v1JXv8TNY1U7c4wPeF5Kd9V0aLG7nyVs7tQV2PsnfA2Q9r7bD+dsLKBIcTm2EXgNUWABtcupss9laBU7LOnG0rucyYokPlaBcgPGpN6hUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790834432; c=relaxed/simple;
	bh=Ea5L+NfGwGW15gGuIzQxh+b2WvHUSCGvR5hc6itnj1I=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=jUY/pygYnt9ZwSKtpTVfbfmLlf6RpClSBlEV424huC15ARWF/Az5EgKZqvcSXsa6MMRYK4YvV3BWFwPtXUP0Mvn2dyBxCZekgHLo8mHdYecIn5pbtKVG0/gDfw/nTVEtaBuTD/4z459k0basnfPmFLLPPEqrAhakOAo0PBS2AEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgiLHK6P; arc=pass smtp.client-ip=74.125.231.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgiLHK6P"
Received: by mail-oi2-f6.google.com with SMTP id 5614622812f47-4b374c2cf2cso962136b6e.1
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 23:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790834428; cv=none;
        d=google.com; s=arc-20260327;
        b=rAiim/eOKtkx4PXkO0Naes5od+KeLWY76IE4gAXXDb1Yjj6jK7worvdZrFIPEEuxfq
         6DPJ00ByLm6Vh5ewgylWLv3lRBVYDCQLlv3NEwKdlMbsEf6M/JMvCliHWXyJT4ChHmd4
         jUYQQE12hig+6EnmpElhKmI+CBwEWJDTBf3VNsPBMcYPU60fDJx7UGJ/DF/UV5hnhyCr
         0LsAXrDd+1MH59ta9QdlcDCTI0R7s2n6GlC9MEqDQdZduTccCbpZ/08wyodfIyO2Hxzr
         By+75dY3N4egfgJsMB79c3DgT7tUjIqdDtiQJmWRhm2pg3Yp+j1WgxoqC2QW7sIZQkKl
         Jm9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=86MBDdoN8+nPFAYYb3eyEgckb6tHnNUv3pn1Zb+pPE8=;
        fh=Bi9+1vRKJgkU8iCfmeAq+q6oY22N78AuDa13Xs8v3f8=;
        b=SV0awrqdlMyfyV8R4byny3NZZQaGBM2+0/MJU9vZUnTFAI6BeNnEcb+A0Dl8+puKZ/
         tiyMgn2M91Zkm8LomkMpsQx0HwQvarjSszsR7nmUwZeeE/mDRMlZclFBZ8a1HHM0hZV0
         jFnAzFT3i5wNIJlRYTfJLFf/7h6i9d4T7xja6Uiz3VqWk/EePEAM9sfO5iNV8CXRDtuz
         xr/8RT+ZC229l2NabPWMvZRVDJRt2PoGWhmG+nttKUX1bJ//LqkjRoW4AwNq6kM+PrJS
         809Kc2FCfu2i1GCvazVF7IpxFCUbDvvfNi32sHOp5gzvikI50bFx/K/34myxp1DYNnFe
         gtsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790834428; x=1791439228; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=86MBDdoN8+nPFAYYb3eyEgckb6tHnNUv3pn1Zb+pPE8=;
        b=UgiLHK6PhxSzQIvNG0AKz//Yr+Gj+umBXHHfkF832o28gIeZ1X8LELmmcH/MEaP8RB
         +CmeL9009CelREWGS0fgOwiUzlBxhV8/QpNKXDeP9to5rj64JyQOizkRfxmyZyuSDJnJ
         ZS302YC+MqJIJ56QL8Z2d7XWYFZ8iKlWKUACUtlYWPDkXV9GdumaWCnztIUoCVFer/hw
         8PbS/ffFZjCESBHUs94CW5DNyl4HmEtOnoJdbxdMvkXy4DS1RPRHFiEYafnZqF/eA0Sc
         ekcPfxcy+0oVGf25q7bh2ciJpJsJsmCv79K6gssJ4PqDcUp4v1yTePVZaKKPLT90VF4E
         X2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790834428; x=1791439228;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=86MBDdoN8+nPFAYYb3eyEgckb6tHnNUv3pn1Zb+pPE8=;
        b=whongUAOmLArqY0QpO77/1ZVSs3peWsQ+pCKbBRaKD7KmtQRFkC1TF5AmI1+oNCLEy
         v0oWrZ2bqWtDOsE6pLi0dl9xtHpPkQU7pk7U3E44Pkr6pZ+Lk61IT8lDw5gLOn4zYebo
         avrAK7GCrdLH1PGCve4zCiPhEJtcOAEJhU6tiGuXDbZxoxe8GfQ3y6NqnDTw2uCM+/z7
         uOsMLyRzHpAa05VtmjtpZ1kGIsISzLIDf4fWfymFyyS2r2enbvGkSA9RcyiZKLd/Cb4/
         EUBO3M8LSk4sdGtOQDLK4rBqt/63J+h/EO/Mxpwthb5YzaGATKeCzddKxNbqqqZOm9Ch
         AQYw==
X-Forwarded-Encrypted: i=1; AKwUvBxJ5e868FTHhx9Nnaz8sLar05ODka56XjRxiSocxUBLxKvh4cBlxpJyJW7BZDfDAjqq01SraWHmuhkHfL+pBpk=@vger.kernel.org
X-Gm-Message-State: AFuF++kWpajSJse7vc+pS9CSUTE2+2Wf8IMJfqwNb3yod9CIVonRMRCz
	AWSnGZEWUZIRCqme6K2hm5VzXhLCGvcsWsa4rV3rNe2Q4xoaw1LpukYgbMcsLGkTjIROHjzVlmW
	5M/x/lbIjIQNfaV4If2jMn4KhtMUt3naapOIuanIsA4k0o4o=
X-Gm-Gg: AYBFou1iGjN6+bEl4k4ZUiym5bxuNzUMEhs8230rMIFo5ltZ4GfHuaKFVg3l/X6TL9g
	ExXGjAtUsjPQig0jjyax/A6sjRZDLBOcSfBp6kU2X1T1hcRJwf9X9BtRPKt3FF7zaAJZIWXufug
	lz40pcMkzb4RMlSUNlZALhv0bHnJ279vaWmLajsBmIEayLI2MQDGmdBKdEJCsuxDtvYcAjxfUtF
	jGkacBr7U4cKTK3nCAnIaNLVlhRwDt3MiQIfs0EIMxtECk2G79J6m+RZHLeiO8vJV188iTcHb5n
	mvIn0GATr4Clr/k+u5vzSny92QcdGrJt7+CS+MKlAqOSTsnXgmNwtoy6y8+SkbU9QIJCSj3ZvY5
	EBJlp5g3Nug==
X-Received: by 2002:a05:6808:c2d2:b0:4d6:93e2:5bc7 with SMTP id
 5614622812f47-4f1b937789bmr4169206b6e.67.1790834428301; Wed, 30 Sep 2026
 23:00:28 -0700 (PDT)
Received: from 578479312649 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 30 Sep 2026 23:00:27 -0700
Received: from 578479312649 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 30 Sep 2026 23:00:27 -0700
From: Aveline Noir <jm5905938@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Sep 2026 23:00:27 -0700
X-Gm-Features: AclHuK-fk3VgJqHBfeBrKPt-2j6Rf7JJ_J_9SFI-Q-5BndDxw9L61bmuFQdGI00
Message-ID: <CANOyQmFzsssM_BXHUDrV+UuVD5SZMBmSkg3UQnmw9Ns1PV7GCQ@mail.gmail.com>
Subject: [PATCH] selftests/mm: mrelease_test: fix retry limit
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Shuah Khan <shuah@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, Christian Brauner <brauner@kernel.org>, 
	Muhammad Usama Anjum <usama.anjum@arm.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

mrelease_test doubles the child allocation when process_mrelease()
returns ESRCH.

When size is already MAX_SIZE_MB, the current <= check still allows
another retry, causing the allocation to grow from 1024 MB to 2048 MB.

Use < instead of <= so the largest allocation attempted remains
MAX_SIZE_MB.

LLM used in discovering bug. Changes were made and reviewed manually.

Fixes: 33776141b812 ("selftests: vm: add process_mrelease tests")
Assisted-by: LLM
Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
 tools/testing/selftests/mm/mrelease_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/mrelease_test.c
b/tools/testing/selftests/mm/mrelease_test.c
index 64e8d00ae944..a5124c9e9f43 100644
--- a/tools/testing/selftests/mm/mrelease_test.c
+++ b/tools/testing/selftests/mm/mrelease_test.c
@@ -157,7 +157,7 @@ int main(void)
 		 * Retry until we succeed or reach MAX_SIZE_MB.
 		 */
 		if (errno == ESRCH) {
-			retry = (size <= MAX_SIZE_MB);
+			retry = (size < MAX_SIZE_MB);
 		} else {
 			waitpid(pid, NULL, 0);
 			ksft_exit_fail_msg("process_mrelease: %s\n", strerror(errno));
-- 
2.55.0
