Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6E94F55AE
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 20:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790369708; cv=none; b=cw3RL1dMn3iDPOL+0jqMUa8HNaWcxDfz1Yn2a0JIQFiWDyE/Jh00QAeb7ZlLYPwjf0z73eilfFGKw4ctguk3KE4RgDa8TXtKrC3AmNKIYAkZkzLKbT+HpmfOASEAuB0xBIOOLqbIhtu90xJvPTqWvWxzpk7iFkZl5G63t37xJac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790369708; c=relaxed/simple;
	bh=b3FYJR2ie2Yh+fvliYbwgtIZejyG6PAXcYAhpQNpCW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qlm7P9lhTFTrWHbSehAaht34IOpHTkz1cEgYLA+yEOXcKKoR/iFHSJlnQz9CUmhv5XA2ANtQ6PI1OEQCzizG+bP0ahHo83HxpnU8kVy45R+dH61KGy54bCAd5e0mu4FU81pOcCLYZBBw3L1OCu5i3hQ24JWv1cReVYnPGrKz0ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMiZCj4D; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMiZCj4D"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6bda350b708so482301eaf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 13:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790369706; x=1790974506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uVkDm7b8tGoVPxZCZvIvITNn9vMbTScXbMyBf75jcE8=;
        b=MMiZCj4DnZXv1jqGT8uxvcgvqjdxJ3VoatG4nyw4pHlctlUuFDWna1VVu1W0V00HDg
         KI9jQoYk5QFum9YXtcW0KYMIR5jGNCpT2qqiEfQbnTGIjRQAvyvjFRGEkPOGZcUzfOuo
         lE+lO0aVaHrM8Cc9brqDMm4F34Ul+MTW7EoVCb9+HWMFxiVfqqomR666DL0ymALGy4dO
         dYM+tEGLxgXJZDp90eOaeT2Aa5RjBgxRRVjqE6jwEqGfYiRDf8WR8NIjTE6PiuskK12U
         47sssX8V+5D3uzL9Ey4cxdXZjMJk+cTaxPg8Bbnr5KQTDBQKTw8eZJiiWQPS8rNQxmy8
         Ir9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790369706; x=1790974506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVkDm7b8tGoVPxZCZvIvITNn9vMbTScXbMyBf75jcE8=;
        b=wcs7q45M17CoqHCbnAVY0EMaZuZyPUKuxusnTFpdeBagLCvqr00MC/SMyIPaJ/Qh8f
         PzPMHMjj92mJHNW4HB3LZ2MycJ5RaLIaur7sfA6o1mRzdqr+gJZAXRSN4QM0FWUlZFgM
         YL9FZbfRV06EbYgliEgLLfPeTfUWHctZ5ztmsCzxcGHA/Vr6eYP1VeJMlfSzi7azxNuY
         sKIczt3fG2cp7Ig3JIXscf0Z7fUwEhnKTjrVEm8yGJ9h0LlWBqj3jtckTiyOkKA4VWlz
         A4HRNDJ9Qfvh2gPEW+Jm2kYC3XuloeJsU3DiuOBzLTm8NTG6vg9fvCYWaiSrUSJqFkvY
         /8mA==
X-Forwarded-Encrypted: i=1; AKwUvBxLCvdNffLnuj+JiAB+fYONJDhlWYFRoy50wKVnaJZXbsRTXGdA5CucmuzOruPu2mCSOfukR5CqXjy01KoOSVc=@vger.kernel.org
X-Gm-Message-State: AFuF++nKotIRw/g6eZkChntq/cxHdH/jFFuOYbxl/5ah5uEOfDgFMdbZ
	xvO6QidVBaOle7v9i0VBqQzh1iEzqELPBupsDYs/G1bJUysus33rW629
X-Gm-Gg: AYBFou3hVsgP8zWtrVgOtUEejQfKN8rhS+UFuHIOLE0kerMCnARvelddjr7g+YIs566
	hfMFuWGgmDhY5D/Ek1InWCpJIoszMUO5tWIHGaGzrlTzmJmS6y7erZDcHTG3hzjs66UAg3C6Nre
	HUBTt1dS+CYmY0ijiB/uppOiLtyEpIlzviuig1K+V1DUAt2LQA85TbaQF1HLIiHcWAK1LLQA0yF
	JMaf/zxJTBTcqZ3I6peJDeDEsrn6MwV0C4xuWkYRbvns5m+Dy+UXBph/farWvW7c0XePdVMTas5
	bchuvz1KxwcZtrrZUejT8uMUVtGWfp9dfU7S861RevC+uuyCNqq0CRR0Axc5+hNb6zFkpIkCIXl
	1oyixU+bkMHhRuioQ2O9Fm2aMXbPIXk/soOrDpIpBQM+QwfCt0wkdEanwDMSaTSmEtdE8c9WZ/G
	kOwuo3dqLiJPU9eOA8QaOZ8EHSNHrTEZz1h2f6ft5OoQNISsEj5UtkcM8sm9rLFEVFkq0TJHrec
	ArloWSiZNTPEIZbelU2R6he94DLSDDx6RXL5F0l
X-Received: by 2002:a05:6820:179b:b0:6c9:e0a0:af1b with SMTP id 006d021491bc7-6d5b869be64mr3111117eaf.27.1790369705603;
        Fri, 25 Sep 2026 13:55:05 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-493367b617fsm3034952fac.18.2026.09.25.13.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:55:04 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH] kselftest/filelock: plan for the five ofdlocks tests
Date: Fri, 25 Sep 2026 15:55:02 -0500
Message-ID: <20260925205502.115327-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ofdlocks reports five results but plans for four, so even when they
all pass it ends with

  # Planned tests != run tests (4 != 5)

and exits with KSFT_FAIL, which run_kselftest.sh reports as a failure.

Fixes: 33d5b13098fb ("kselftest/filelock: report each test in oftlocks separately")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested on x86_64 with the kselftest build of ofdlocks:
    
    - Arch host (gcc 16.2, 7.2.6 kernel): before, all 5 pass but it exits 1
      with "Planned tests != run tests (4 != 5)"; after, 5/5 and exit 0.
    - Debian trixie guest (gcc 14.2, next-20260925): test 4 fails before and
      after this patch, because it memcmp()s two struct flock whose padding
      was never initialized (bytes 28-29 differ). Zhou Yuhang's "selftests:
      filelock: Initialize the flock to zero" [1] fixes that, and with both
      patches all 5 pass there too.
    
    [1] https://lore.kernel.org/all/?q=s%3A%22filelock%3A+Initialize+the+flock+to+zero%22

 tools/testing/selftests/filelock/ofdlocks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filelock/ofdlocks.c b/tools/testing/selftests/filelock/ofdlocks.c
index 68bac28b234b..0ab484cb075b 100644
--- a/tools/testing/selftests/filelock/ofdlocks.c
+++ b/tools/testing/selftests/filelock/ofdlocks.c
@@ -40,7 +40,7 @@ int main(void)
 	int fd2 = open("/tmp/aa", O_RDONLY);
 
 	ksft_print_header();
-	ksft_set_plan(4);
+	ksft_set_plan(5);
 
 	unlink("/tmp/aa");
 	assert(fd != -1);

base-commit: aa98230e410f0ed212b6788c46b1e4d49e0ff7ca
-- 
2.55.0

