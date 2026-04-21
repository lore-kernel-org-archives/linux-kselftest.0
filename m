Received: from mail-oa1-f97.google.com (mail-oa1-f97.google.com [209.85.160.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6322F3DDDC4
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 20:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802152; cv=none; b=VLbmRkgZvKCC5vOnIgv8VhswcmShZNJRiU2PIn65dtSbQzTHiT3KvYWivI0xPjl7D/Gw56+UF3cZRrdypOdxF82Mr/zKz5H2IixbFX4694FcGd75A3685hA/cm57FOZUjhW+l3DXevT8A/V7Rz3CB4NEx2rVvoBCQIKy8v3JlRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802152; c=relaxed/simple;
	bh=I84hhzCB7BlZbfybuMejt9oRBi1g5/XrghmhSook/ps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mIucdDaPGutnUAfA6d0rjriUvDUwUSX621tlcaSwUkui+oMXPmLMBawuoLC2S7Wcai6XZuo0DGHbFac30t83Tnzeyccw4/WSkAY/hbFE0paODbP24u77VUcl3nGzAwmLHNUxmbRiXZDSLVFxiTJ/q1P8LZ072pHBidhf+5nw0R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=guWuGW4y; arc=none smtp.client-ip=209.85.160.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="guWuGW4y"
Received: by mail-oa1-f97.google.com with SMTP id 586e51a60fabf-41574fa6a87so546141fac.3
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 13:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1776802145; x=1777406945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yGFnkXYasLnwRZMKRjucMuAGGbIPRmvJkBqEc/Wzb04=;
        b=guWuGW4y4q1HidR+vJzl3U4zXxe4vr4J5mSeDCMz6cI7gOU4vBh6P1Hpm63PdJEgKH
         y+isMiihBRZgbd5bTvNyTRCPRbP24UUipC1xSsMZbqu/5Wn016KK3LbHKtJQrl52h3Hu
         6OppVImQ9SxFeDL2XhSbUTFlJux3xRXu12oY65B5g2p/0XkWy4Img/zbfCdzlL0U7/3y
         0O1nacaCisUYOgna7cWCpTm9MK0xouPSfLpcs592UKFioPWUPouneE4ws8PbS32a6V4C
         LVn21G6SJoVLOgC0WXKcKXP2jEWK9apKClNCv0vDm4J7MOBJSLIIT2v3EirwwLC4paRJ
         VPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776802145; x=1777406945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGFnkXYasLnwRZMKRjucMuAGGbIPRmvJkBqEc/Wzb04=;
        b=KSdWF5iwNe6MALnlhDZUUq7EMS3Q/ASzTf4MMTJ1y9obgU9PupUGAIKGYAWsr7FG3P
         3zsEcwHP76ehe12pulc3DUESby/OPjt8ZKMDLRXYnMEsLadj+NIeFWID93zyY70eUxa0
         yhJKFw95bfyyNCNpmfYsBbn0krGHZjY96mWVzq5MXpJ3C11ruOpZsjBbmy3ss3Ai7o69
         aJo44L2MYKAZGB5pZLNethAAecnlTtCDSyA428xIDu3yL6qJLIE+b/Il3SFKHSUJ5W1F
         TR0Ncnje0muVQb/e6eZRol2VGJsfILg8tOETF/y9GtMGKr0lNhLpauUNxWEHk2cHqE6q
         aNHw==
X-Forwarded-Encrypted: i=1; AFNElJ/fHtQpPbyJw1+yk+dFnaOpwNLfnvPx6edamaq5C9CJFAKOU0gwZduprb6NOOWnf0Ai9QSJ2qVQe9R7RD2pMlA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxsOblf8TH0D5aAiiidxazw3WAHJSyKViLahQOINjYljFI0uXt
	KdhzDa/8KAB6YpcXH/MkX7soqhdk0QP6UOESj8utwRphU3IHZGOXCKVcW+1yepdTPRKLaYVFF1u
	//EoXd0Gw1L+iDUreVGxXEYfvBXM6jKwl3ez6
X-Gm-Gg: AeBDiesclq4sDSMR5EODqF0gIUYKPg2QStqMKXiKuABWC4s0kXdzGyrHXk76/U7J8ve
	FtPWMGKn0Llm7u5tW5V1cOlAKJxM4RpSVXW2oKBI2eCrGm//st+dXR/UfSMVEueK2HM3Efb5pwR
	xpe47kWoqm++neeIfcAPOoGIXBZwnDr6gQJ39VQm9wQqRkQsAkLa9AaxwJSSc/w0ClpwxZSaKGd
	ClMYd0+5zdwSPKOsRriN7weto3HX4n/r+WD28/mG80bwKeeLYnCENlYlDsFU0SimTaS3ZA3Q++c
	Go4X3a6VC9R9KmxZEG8FRUU6PCMFfLPlfcZYIG2Pj8DouXEMIFNhlGiF7GdXff5CvT1S9b/QgpX
	xDw9KVuWzabwZtSnUBGIyvr/q2ED+Hf35QMjaOvpljO0g5pNeG6S39ajQ7ym9q7dn
X-Received: by 2002:a05:6830:921:b0:7dc:d8ab:49c0 with SMTP id 46e09a7af769-7dcd8ab4bc3mr1748317a34.3.1776802145405;
        Tue, 21 Apr 2026 13:09:05 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-69464e60a0fsm692757eaf.10.2026.04.21.13.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:09:05 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.112.29.101])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 08233340576;
	Tue, 21 Apr 2026 14:09:05 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id EC90DE41A9F; Tue, 21 Apr 2026 14:09:04 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <tom.leiming@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 0/3] selftests: ublk: integrity test cleanups
Date: Tue, 21 Apr 2026 14:08:58 -0600
Message-ID: <20260421200901.1528842-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update test_integrity_02 to allow fio-3.42 now that it's been released.
Add a modified version test_integrity_03 that uses auto integrity and
avoids the newer fio requirement.

Also clean up the callers of _cleanup passing an unnecessary argument.

Caleb Sander Mateos (3):
  selftests: ublk: remove unused argument to _cleanup
  selftests: ublk: enable test_integrity_02.sh on fio 3.42
  selftests: ublk: add ublk auto integrity test

 tools/testing/selftests/ublk/Makefile         |   1 +
 tools/testing/selftests/ublk/test_batch_01.sh |   4 +-
 tools/testing/selftests/ublk/test_batch_02.sh |   2 +-
 tools/testing/selftests/ublk/test_batch_03.sh |   2 +-
 .../testing/selftests/ublk/test_generic_02.sh |   4 +-
 .../testing/selftests/ublk/test_generic_03.sh |   2 +-
 .../testing/selftests/ublk/test_generic_06.sh |   2 +-
 .../testing/selftests/ublk/test_generic_07.sh |   2 +-
 .../testing/selftests/ublk/test_generic_08.sh |   4 +-
 .../testing/selftests/ublk/test_generic_09.sh |   2 +-
 .../testing/selftests/ublk/test_generic_10.sh |   2 +-
 .../testing/selftests/ublk/test_generic_12.sh |   4 +-
 .../testing/selftests/ublk/test_generic_13.sh |   2 +-
 .../testing/selftests/ublk/test_generic_16.sh |   4 +-
 .../testing/selftests/ublk/test_generic_17.sh |   2 +-
 .../selftests/ublk/test_integrity_02.sh       |   5 +-
 .../selftests/ublk/test_integrity_03.sh       | 103 ++++++++++++++++++
 tools/testing/selftests/ublk/test_loop_01.sh  |   2 +-
 tools/testing/selftests/ublk/test_loop_02.sh  |   2 +-
 tools/testing/selftests/ublk/test_loop_03.sh  |   2 +-
 tools/testing/selftests/ublk/test_loop_04.sh  |   2 +-
 tools/testing/selftests/ublk/test_loop_05.sh  |   2 +-
 tools/testing/selftests/ublk/test_loop_06.sh  |   2 +-
 tools/testing/selftests/ublk/test_loop_07.sh  |   2 +-
 tools/testing/selftests/ublk/test_null_01.sh  |   2 +-
 tools/testing/selftests/ublk/test_null_02.sh  |   2 +-
 tools/testing/selftests/ublk/test_null_03.sh  |   2 +-
 tools/testing/selftests/ublk/test_part_01.sh  |   4 +-
 tools/testing/selftests/ublk/test_part_02.sh  |   2 +-
 .../testing/selftests/ublk/test_recover_01.sh |   2 +-
 .../testing/selftests/ublk/test_recover_02.sh |   2 +-
 .../testing/selftests/ublk/test_recover_03.sh |   2 +-
 .../testing/selftests/ublk/test_recover_04.sh |   2 +-
 .../testing/selftests/ublk/test_shmemzc_01.sh |   2 +-
 .../testing/selftests/ublk/test_shmemzc_02.sh |   2 +-
 .../testing/selftests/ublk/test_shmemzc_03.sh |   2 +-
 .../testing/selftests/ublk/test_shmemzc_04.sh |   2 +-
 .../testing/selftests/ublk/test_stress_01.sh  |   2 +-
 .../testing/selftests/ublk/test_stress_02.sh  |   2 +-
 .../testing/selftests/ublk/test_stress_03.sh  |   2 +-
 .../testing/selftests/ublk/test_stress_04.sh  |   2 +-
 .../testing/selftests/ublk/test_stress_05.sh  |   2 +-
 .../testing/selftests/ublk/test_stress_06.sh  |   2 +-
 .../testing/selftests/ublk/test_stress_07.sh  |   2 +-
 .../testing/selftests/ublk/test_stress_08.sh  |   2 +-
 .../testing/selftests/ublk/test_stress_09.sh  |   2 +-
 .../testing/selftests/ublk/test_stripe_01.sh  |   2 +-
 .../testing/selftests/ublk/test_stripe_02.sh  |   2 +-
 .../testing/selftests/ublk/test_stripe_03.sh  |   2 +-
 .../testing/selftests/ublk/test_stripe_04.sh  |   2 +-
 .../testing/selftests/ublk/test_stripe_05.sh  |   2 +-
 .../testing/selftests/ublk/test_stripe_06.sh  |   2 +-
 52 files changed, 162 insertions(+), 57 deletions(-)
 create mode 100755 tools/testing/selftests/ublk/test_integrity_03.sh

-- 
2.45.2

