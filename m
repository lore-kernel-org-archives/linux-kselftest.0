Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6E0347BC4
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 08:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776845102; cv=none; b=KWZYflnwZKBcNa8KrblvSLMAsBiw5/2gX0y88rQ9GLeLimPkZrnJ/39dPdh1PSgShx4s99LP/Hkrzq1W4VDW078zpLrGzj1dNaySzsUaSvSAe31UtlQ3nn1zijXVfHN/VKWy9gyxXzISXzpD+Qf1C8flt53glQ2ED+8vQJonlm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776845102; c=relaxed/simple;
	bh=bkqmz1ZhsEhdlRVPXHrl/jgc4xYDIpBCMijytr4ar40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H8x2syjviU7d8PRnGuigYegIaH51t+nCk7zczj3eRIBjfCMFQP/V8uc1t2iQMTSIKCke2w3JA1+hO8yI4ElK26LQfndA7+3/SLncCx8z2qMY4JgWxj6SaEQsupnO/qtGe6C5K+lKiO4NXuD/L3IotP032g1c02X/6dP1U1gt+Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpBoyxml; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpBoyxml"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so3543594a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776845099; x=1777449899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DItXGjCrmn7d94S2RI3cNWwTTtEvovQ6aSZWbg/Gdoc=;
        b=RpBoyxmlaxeNW44LoUOwy4kbg65ELv7+BxxezR392T8pbC7WlvRrxSmYsj01y+Ms2v
         JUmusXBcqGUDUY2T5b9f6u31sQm8nZf9+Sx6XClvvxw2GvDpYAHC3kbwBNlKVrynnA7s
         zMRKzd/Vcu7aEObUWJrGSwCKesghITuWbG8TGcbUmFzxc9Bcn2WZ5j/78KbmnY0AdAxP
         rnfQ7NHxc107Vkb6pdvgCPu9cB+G+PD9dMoZkzaijZmjfUDIbVoEjSDePtqVVuPiSH3/
         qm3K3Ow4PCwRg4d5jI1F2F0O3YSYTV58o4JjOtQYx0dRxZ+oA4HYX2aCGRkiYUn1IRrg
         P+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776845099; x=1777449899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DItXGjCrmn7d94S2RI3cNWwTTtEvovQ6aSZWbg/Gdoc=;
        b=BYagYUkvL9iw9GvS2D5Eh8Qh/AneomkYqzb/pDJuyyFQ+8J8vt9cSexUMMl9UTdfLP
         E6xFdSVH0spkwXKYGA3r2E3GL8wWZAg4p3syEgwBUshTJdnFGbOPh2IfJ7eKON6uIcqA
         W8JyIhQUFRPkcVq80MFx7ukfyt1wi9Mn9jZkjL/enxLYjBQPZ+S2XJIXKL+lNMAfeWYx
         eDGD2r7wFUiqhPJKpWUAujfQRGKrwbMnsoqw5XJ7AF9gVicdQ14SumFq8tuyl2irtVuB
         YawWAr+89EXkSU77YAoSzbVt6zHD8UbVPMrD1K7x/c9NjIawNqe7GwFHv8Jc8s0cQjQ7
         oLeQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DRGoay68gL2VELafu6VJCo+0kIlliX6Y+TMwJWNsr2vP+Pf+hnntIro+xyp7jG91h9yekrauxNT8m+WvbZZk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6gzNMINczxsHNz24fnDGC442lLtqpD9qtH522xnl2qMpLrCYO
	sQ/u+3eNCOJGS5bYR9vBAWNCLMSq9qWvmLobXXSvVaQ6IdK7bXMk+m8=
X-Gm-Gg: AeBDiev6H4NdjcTGoNzN9zdys2V0zo5tFWicT26OzaeVQLvXe2Vl8v7BlctmBfqgo24
	s0yBIx+By7f9cwRVgHaUS3je/KKVQ/vrG1WRJ3XWmOEhMxZ/lbOSSJ8QlwVbvDzk7Qra63jj65l
	yWf7V8ceejetSh7z5nKVAJtCkt9NIvayim/NYWINVJr8v83yUjZZPRsitM1vnSzZcI5WRR9e35r
	HPoP7Rej4FBgF3E1VoS4o/tE/Cg6kBZ8ydlPbG8pug4dPGP2tXt0SKqRhHXv34ztJdiv/wLf16S
	nSK2XO/NrWSOiiPPjBm6dQnFn9jYvuOs/pbP9cRCLd5YPBp0HLWGbl8jKpi/3Rh1avh9+XaDX6F
	LSZgN2751m7rSjjRnjGjJTKJRLTG4iMWwXcm0iLVadIw2FVrlC/zDywJuy4DmgKPpWhGlay8lof
	5stakZT8gmz+txEAkve5j/Rj3BHcDz9bCf
X-Received: by 2002:a17:90b:53c3:b0:35d:a38a:a117 with SMTP id 98e67ed59e1d1-361404745f7mr22559423a91.15.1776845098695;
        Wed, 22 Apr 2026 01:04:58 -0700 (PDT)
Received: from thoundrobot ([43.154.64.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fb9b121sm8508494a91.5.2026.04.22.01.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 01:04:58 -0700 (PDT)
From: Li Wang <wangli.ahau@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] selftests/mm: clean up build output and verbosity
Date: Wed, 22 Apr 2026 16:04:44 +0800
Message-ID: <20260422080446.26020-1-wangli.ahau@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the build process for the mm selftests is unnecessarily noisy.

First, it leaks raw compiler errors during the liburing feature probe if
the headers are missing, which is confusing since the build system already
handles this gracefully with a clear warning.

Second, the specific 32-bit and 64-bit compilation targets ignore the
standard kbuild verbosity settings, always printing their full compiler
commands even during a default quiet build.

Notes:
  My email address has changed due to employment change.
  Previous Signed-off-by was with <liwang@redhat.com>.
  Resent it after -rc1, as requested by Andrew.

V3:
 - Nothing special but email change.

V2:

 - Drop 2/4, 3/4 from v1 to v2, since Andrew wasn't able to confirm the
   patch works for the rarely happening issue now, so I decided to just
   hand on the process of the parallel issue.

 - Refine the 4/4 patch only to hide compiler errors when missing liburing.

Li Wang (2):
  selftests/mm: respect build verbosity settings for 32/64-bit targets
  selftests/mm: suppress compiler error in liburing check

 tools/testing/selftests/mm/Makefile        | 9 ++++++---
 tools/testing/selftests/mm/check_config.sh | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.53.0

