Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAACA40DFD5
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 00:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775003307; cv=none; b=R+pQEWScJ4fxtNd+DuPaQFaCgcAqCtTM4qPC2oiauMviuLFn43rVLnf1Vjj1+AYgm+MwnDOMqxTNbyw6de6GtLVT8P09E4fQfFpwS/YtLX4u19/pt3AKUoCWOOFUFLE9mMWUU0GBThj95G6DuJlG3SpvELk+EcU9DFhy8lzMgoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775003307; c=relaxed/simple;
	bh=Wl9nT3Slu0gQkDLZ2qg4Yy+5qnZ3izUvhAj0Tp1r6So=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KmW/ZQ3p10Pogl2mg2uauGSXPOXBzFmRo5tWCDiggVAxy+d+4jSLfIBvtuJl+mqqw9bfcTVKtzi1v4Kqp5l6/ez2nxEN81eux5PYQ+0NAF5vnqgf0WcFlVMomi4/RnzaSGF054QMyulGUzCM82GykVWQ4mT8/8jDXpQfCfdM/QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20230601.gappssmtp.com header.i=@amutable-com.20230601.gappssmtp.com header.b=c3lRmXQw; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20230601.gappssmtp.com header.i=@amutable-com.20230601.gappssmtp.com header.b="c3lRmXQw"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so148816a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 17:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20230601.gappssmtp.com; s=20230601; t=1775003304; x=1775608104; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xPpyfxqvRvwQENUgIjXbp0AKupBdomDsmgEJ79biurs=;
        b=c3lRmXQwowsp5C3+U3taIdpzj1o+D5RYzWUXN7frq5C/4pbdv4n1k3nOTpx8/xkN98
         nfEPxeNuKI8D1RfivBTD2VqbPuF9PSeN4RUc7dOEVtAKWmCoY/Bv1LpJmuKPXf9JaNUf
         ZXb+ByTcQLsHX9Dsl0eq7ZEaG3WbbTwtisxBPFdiWOxkgck1v5rSieHASjZWk/kd/XgH
         3wLjjb1TEKlo/lrBZygCzNJimj69ByEb+aNLgP9IuKVqOwHbAa0VK/nyTi40GSMblc63
         PS4ZfC9P8pyEiyV1EntcYy3vGsUpsSzJ2pVmbdkv2gB6xwU+yiDbAcf2drnBsioYGmYq
         K0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775003304; x=1775608104;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPpyfxqvRvwQENUgIjXbp0AKupBdomDsmgEJ79biurs=;
        b=bdFgkYJp9FGvc/S8ByhBUAzBh6k12DkIIJrTZfDx5wG0MCkKG4Z3WO3nd0syQ8hV3J
         a2tseAn/gcglssqPSwegsu5vmCY8j9OjiiAdTgXagfC5gnVBClQNiOfcWYI8Z0L96Ned
         pgoS18j03xZLlOpU1ETMdnvtk4fVl+8VdHZrKpKgwcgtRagbVevULaKfSDcvuwbBZjuf
         7Fb2gJa/H+PIWj1AWWRisbyQ0sWTQijI72FydXSS4dJNH8sGoruQvQq2Wnpv9u5KTZUW
         nSr/VVPqM6JorYyc9oSJl4/AWaIMpGWBStqKFZvQi6pznPC5e4hUfh0u3VJQdDUVN8iW
         DS+A==
X-Forwarded-Encrypted: i=1; AJvYcCX+OYu5DiF37Vzj9224hDmF/XGTLxYUIfGI55utl9d+jDUMJJaXHRi3bYdhSRV5dA29Dz7qkOIOKZwb+4wCB1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbF/xkiCOSDF2MqH3EsRQqYjVGm00ZqbWXCqFxHVn2Yr3BATzp
	IjUCE/yi2TxvnZX+u3W9mxk2uXzk6zcPIqhvx214aDIwe46Kwi0UlR2dZjblEAjUuK/8
X-Gm-Gg: ATEYQzyCZJmkCL3cjJW0VF4Ml2SxgGolI1rdW6s2iHjN7pas2/2Ye/Ib8AONz92XXt+
	bb/R2ZOmcc2t8pq0nCP4OZOSj+SBiHL3+5ZD1tcaDfQu6AT6JCyugefJ3C71f6Np15BQDv8kKVG
	kF3vPIcNW6ID0qCUTqCmPy+5PUn9A0zsW6cqczorb8mpR1elXO9bAkAoGCb4BV/dr19Zka8ArT6
	Z0ApFoU+vljwjtb4dqLwCkMdunD1vepgb1rWTWVIIn6eu1FJG8GzpmFOTzwxo0LHABPjgOPjGY5
	4eLc4i8MEfcGsEZXfgEcXoGDNAK6TTBUR2S5b6MloEFufMymT9NY7KQfi4CTNtgoPYF0TygT8o8
	ugid8yopeqBmhpR/NPcRW0i1MsCvrK7uL2rtXcMWdVj2mDuvbZ3K0Tb+hj6ntKbfEavxkV+JOVp
	W6mp+R72tIm/4weGbKyiV09rPw/UlOVdO+4Po9gLgOsluwFLA/rSB0B8hSXguEqTVX78dTg6Uv0
	qAmc7BwnmSI4qFn6h+LOblxFg==
X-Received: by 2002:a17:902:e947:b0:2b0:be79:e521 with SMTP id d9443c01a7336-2b25efa95bamr46558825ad.26.1775003304156;
        Tue, 31 Mar 2026 17:28:24 -0700 (PDT)
Received: from thesius.dot.cyphar.com (2403-5809-a2fc-2-a90-9fd7-aedd-d405.ip6.aussiebb.net. [2403:5809:a2fc:2:a90:9fd7:aedd:d405])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24264264fsm157057825ad.2.2026.03.31.17.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:28:23 -0700 (PDT)
From: Aleksa Sarai <aleksa@amutable.com>
Subject: [PATCH v2 0/4] selftests: openat2: migrate to kselftest harness
Date: Wed, 01 Apr 2026 11:28:01 +1100
Message-Id: <20260401-openat2-selftests-kunit-v2-0-ad153a07da0c@amutable.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJFmzGkC/3WNwQ6CMBAFf4X07Jq2CIgn/8NwqGUrG6ElbSEa0
 n+34tnjTPLmbSygJwzsUmzM40qBnM0gDwXTg7IPBOozM8llzUvRgJvRqigh4GgihhjguViKULd
 lq4wsEWXD8nr2aOi1l29d5oFCdP69H63ia3/NExd/m6sADtVZtErXWvWmuqppieo+4lG7iXUpp
 Q8AcjDEwQAAAA==
X-Change-ID: 20260317-openat2-selftests-kunit-6939af23ee27
To: Shuah Khan <shuah@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Aleksa Sarai <cyphar@cyphar.com>, Aleksa Sarai <aleksa@amutable.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1559; i=aleksa@amutable.com;
 h=from:subject:message-id; bh=Wl9nT3Slu0gQkDLZ2qg4Yy+5qnZ3izUvhAj0Tp1r6So=;
 b=owGbwMvMwCWmMf3Xpe0vXfIZT6slMWSeSVscKSFd4d/nMUn75/fVk87onTC3blpWJMW3ot/AP
 DrLU9qvYyILgxgXg6WYIss2P8/QTfMXX0n+tJINZg4rE8gQaZEGBgYGBhYGvtzEvFIjHSM9U21D
 PUMjHSMdIwYuTgGY6m93GRm+Z148efecwTmuwjIm/46IJqtr4npCVwquTpQUTZ8VHrSY4Z/VqcM
 Hnvz4K7iSaUMt12zh2XH/C71jwrYFiEpcW8J4sYYBAA==
X-Developer-Key: i=aleksa@amutable.com; a=openpgp;
 fpr=C9C370B246B09F6DBCFC744C34401015D1D2D386

These tests were written in the early days of selftests' TAP support,
the more modern kselftest harness is much easier to follow and maintain.
The actual contents of the tests are unchanged by this change.

Signed-off-by: Aleksa Sarai <aleksa@amutable.com>
---
Changes in v2:
- move openat2 tests to selftests/filesystems [Christian]
- v1: <https://lore.kernel.org/r/20260401-openat2-selftests-kunit-v1-0-5819ac6cadf5@amutable.com>

---
Aleksa Sarai (4):
      selftests: move openat2 tests to selftests/filesystems/
      selftests: openat2: move helpers to header
      selftests: openat2: switch from custom ARRAY_LEN to ARRAY_SIZE
      selftests: openat2: migrate to kselftest harness

 .../selftests/{ => filesystems}/openat2/.gitignore |   0
 .../selftests/{ => filesystems}/openat2/Makefile   |   5 +-
 .../selftests/filesystems/openat2/helpers.h        | 168 ++++++++++
 .../{ => filesystems}/openat2/openat2_test.c       | 223 ++++++-------
 .../filesystems/openat2/rename_attack_test.c       | 159 +++++++++
 .../{ => filesystems}/openat2/resolve_test.c       | 368 ++++++++++++---------
 tools/testing/selftests/openat2/helpers.c          | 109 ------
 tools/testing/selftests/openat2/helpers.h          | 108 ------
 .../testing/selftests/openat2/rename_attack_test.c | 160 ---------
 9 files changed, 631 insertions(+), 669 deletions(-)
---
base-commit: 84f524dca4b8bc9e9aca8ea1dbbd2aa3a239d998
change-id: 20260317-openat2-selftests-kunit-6939af23ee27


Kind regards,
-- 
Aleksa Sarai
https://www.cyphar.com/

