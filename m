Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0703C9EE5
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 20:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579527; cv=none; b=b/uk7dPH/7RWvT7AS/YSgHXQ54wWS0ZeyQNIw2FORuPxjT+hBE2Er0HBBUkrv8qi8brwMS1KJm3cdRk+duzLQzN10maX8LIs7UkT0ZmUrd3+F5xegiUmuwTRO3KAA5HQebE/pqwMxU+Ss9NjRtxgmj7EvodQsiJHU50glRW2eEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579527; c=relaxed/simple;
	bh=M6t9sVNu0+vMRFHDNupl1agOdFvX3PfAHNxguX4HeGA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FXL6Xz7kngdewOaunbSoLkoD1qTBym19ZkqOvqnFHLZM1EgBpuHeDwqIlTZJM4xNLDNvdWTm2ZG1J1nS04109HYd4pViK3YhjPPsfzbXIQI2RWnDAjfZTUmqCCDIDcq0A8CSPtN0BM/tjVWyO255a0ijIG0q/QEpZC+SCeGhPaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ehwOMOTE; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ehwOMOTE"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so13566770a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 13:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784579526; x=1785184326; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jJ5vvKCyidYv3tyHVDhakK14swOU/I7OHGnSl6Url7Y=;
        b=ehwOMOTEk1XPq+CCcgIeBRY+lqc46Z5dh49FkOiKKjoBd22piM2XGDG5aHVtZAsSeQ
         rQqPexPIuL4XS6+0xBYaIejAB2/EtsEAW0UD6KmHn4KQtHPdwrP8WJ6n6eb3O1WVBnou
         9DIaJNhJqtx71rcOzczABbni/UXUkqKzDeybDkl23TwOx+pYE60aDVvJkRgL26YKrLII
         0q3fuJMpdgPrkTyD2To1JGidjyXJwOB6lAbN7hLyI94q0u/KOp16xA9HIK4uflBH168c
         Rat2/DNfimZDnoNehZu2PXMBwZNiHSWesl0qgQE8u7Hq+3uwdZe0UKesA7gAyYoo+Qvp
         Z4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784579526; x=1785184326;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJ5vvKCyidYv3tyHVDhakK14swOU/I7OHGnSl6Url7Y=;
        b=atQO4tcQQPuqLj/tjV5g3Qx8dnB9Dga20mg1JvFPjIbwTeiFCszvKJ7RkOF/3a8WWL
         TWCgWZ5s/CS4D+q7FY/JZtTdCH1/5ZTkNwPYeQaeoz5pC85KB477GGuWBsqEqzePw58Y
         qIJbIIMwn4KNmnQe29+HHRRG6oYqiI8wRl5SialLGuebuhVnfGVRyrZMXPXKkUMi5TmD
         b2pcJdTdq/qfYqmgAI2H1sltUegaEyI916Scv1q5Gpe413b+U69S43FDom+sA6GK3aZW
         95IGDoypEPnFo++BqZ3g8a/FgKzyd3PU2hVL0KnsfrGk5vx2Yy5lQ0BepvwvvOZAj3Td
         CiQQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0XuQvWZMRfFD4paB0LihgZi8z+i0V1CaU3EnGrt61Y3ZYkGZNaL9zanNzT/1d87A2vFLR+6gZAljGzONJ7Vk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0uGvvjTQtz/gEKyZsv3gCkyKABlqi9c1lZhtyhiWqWT6/8DfY
	Vls7fUaHg9sGLqLoOl3v0il3N1YRxi42MNs4GuSqBCF6XIA4hbPOukH8qGl2ykCVkYX2v4MI7xP
	MjRrYFSqKKA==
X-Received: from pjrx20.prod.google.com ([2002:a17:90a:bc94:b0:38e:42f5:d097])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1844:b0:381:cef1:11b0
 with SMTP id 98e67ed59e1d1-38e4b55af0emr16557704a91.33.1784579525644; Mon, 20
 Jul 2026 13:32:05 -0700 (PDT)
Date: Mon, 20 Jul 2026 13:32:00 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720203202.1964557-1-vipinsh@google.com>
Subject: [PATCH v4 0/2] Make liveupdate selftests library
From: Vipin Sharma <vipinsh@google.com>
To: pasha.tatashin@soleen.com, rppt@kernel.org, pratyush@kernel.org
Cc: tarunsahu@google.com, skhawaja@google.com, shuah@kernel.org, 
	dmatlack@google.com, linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

This is v4 series of refactoring liveupdate selftests as a library. It
exposes common liveupdate ioctls as a library which can be used by other
selftests like VFIO and IOMMU.

Currently, there are no users of this change but it is being used in
VFIO and iommu liveupdate series.

  VFIO: https://lore.kernel.org/kvm/20260714151505.3466855-1-vipinsh@google.com/
  IOMMU: https://lore.kernel.org/linux-iommu/20260614233728.2212104-1-skhawaja@google.com/

I think it is better to move the patches out from the above series and
propose them as a separate series for inclusion in liveupdate repo. That
way we can decouple multiple downstream dependencies and then it can be
used by VFIO, IOMMU, and KVM (guest_memfd preservation) separately.

v4:
 - Rebased on latest liveupdate git repo.
 - Update luo util path in newly added vm_tesh.sh script.

v3: https://lore.kernel.org/kexec/20260612214512.464146-1-vipinsh@google.com
 - Renamed liveupdate.c in the library to lu_utils.c
 - Reordered patches, first abstract out ioctls to utils file then
   create libary.
 - Using stricter check for ioctls.
 - Reordered header include, also, keeping c lib headers as a separate
   block.

v2: https://lore.kernel.org/kexec/20260610230909.876546-1-vipinsh@google.com/
 - Addressed Sashiko feedback regarding folder creation.
   https://sashiko.dev/#/patchset/20260511201155.1488670-1-vipinsh%40google.com
 - Update liveupdate.c test to use ioctl wrappers in library

v1: https://lore.kernel.org/all/20260511201155.1488670-1-vipinsh@google.com/

Vipin Sharma (2):
  selftests/liveupdate: Use luo_test_utils.c for liveupdate ioctl APIs
  selftests/liveupdate: Move luo_test_utils.* into a reusable library

 tools/testing/selftests/liveupdate/.gitignore |   1 +
 tools/testing/selftests/liveupdate/Makefile   |  14 +--
 .../include/libliveupdate.h}                  |  11 +-
 .../selftests/liveupdate/lib/libliveupdate.mk |  20 ++++
 .../{luo_test_utils.c => lib/lu_utils.c}      |  63 +++++++++--
 .../testing/selftests/liveupdate/liveupdate.c | 106 +++++-------------
 .../selftests/liveupdate/luo_kexec_simple.c   |   2 +-
 .../selftests/liveupdate/luo_multi_session.c  |   2 +-
 .../selftests/liveupdate/luo_stress_files.c   |   3 +-
 .../liveupdate/luo_stress_sessions.c          |   3 +-
 tools/testing/selftests/liveupdate/vmtest.sh  |   4 +-
 11 files changed, 122 insertions(+), 107 deletions(-)
 rename tools/testing/selftests/liveupdate/{luo_test_utils.h => lib/include/libliveupdate.h} (77%)
 create mode 100644 tools/testing/selftests/liveupdate/lib/libliveupdate.mk
 rename tools/testing/selftests/liveupdate/{luo_test_utils.c => lib/lu_utils.c} (83%)


base-commit: e9089cc16239725330e8e8a5748face3b8e995b7
-- 
2.55.0.229.g6434b31f56-goog

