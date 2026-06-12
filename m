Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7732133689A
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 21:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781300716; cv=none; b=CC2ALUiqufLTJEO33s1hY9H7L/WJpkMooHh/YcFzC1p7N2p54S9pZGG48fJDRvu2CBEldYF1uSGtQS0skgX2BrU2GdgbO3iOgC/RIplIj9A5VTZ9KpKz0sWU7ao/3mCAD0cFw8hu3BeaBsKMlGL6xaw+844goNG3URlRrbc04c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781300716; c=relaxed/simple;
	bh=OMs2kjgPWSkOSx7TTkS3TJPdpdOIdlT+5N0hVlw78oo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XykGCoInBphVgPojdbM9EwTX0vIPlw9u1VDOHoF0ewQRgW9MdL80L8xdQrDpXw5PKkR/JmWgq+ELWtPGLNStcbWoPr+7g9O6wW7C92Bxrd+LaRTAUnhpfDLQPtWDD0urjYpuYu46uCTcflER4lJ5ah1LuQtVxqUIH6dtZL9uwT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X8GMBabG; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X8GMBabG"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2bf11699875so15974025ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 14:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781300715; x=1781905515; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MRRlupCHyAFxya4oPy5FYLxigtGsiTWcayCzuznzzUI=;
        b=X8GMBabGvDhV/B9Z+931Mung9ok2ACLk89O3avwHRSwDz1xWAVcXHivQJ8V4ta6+Rp
         NtE2TpK47W5HkaoSUc+DulkJQCs5TUxrWSK/XV/IwG/05gW5InePz0oNW0bPIHS15QhF
         RtiO2Mh1t2hybA9MEr0/RZxeqKF0npaOFOzGaLHZ8C0riH2dYADXXOljY2rEATUNtHu0
         G1e7xJCCfivfA9NRYWzsFbNcvCWy4QQYabdUZxjBzBgn7GY3etOEPtTCICEZGpgD8xra
         EauoHYrjnd45OPZLLDDLziYlN1KeTeCK3preFKCMhRnktbkX8+LAO90DRPyfpXJD/HSx
         uKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781300715; x=1781905515;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MRRlupCHyAFxya4oPy5FYLxigtGsiTWcayCzuznzzUI=;
        b=GaCSbFNDyTm103Yg7UIroyq69hKtMEnJe685EFHn5B7ZieDn3uKkE/UwPk1NXY+Kom
         JWmJ1/xFJp6hREdFPLgsv+6Fjm7+xVMcBwhZD8137K+4l5FX6aOKCqZ9scsXyutIaV0X
         ARnieJ18v4PBuBWHbVRpPkFP+xtqP3UzxDgHo9LzPb+fr8FMy3BFwjr7os9/y2FNsJI/
         dOslxXaW/7HDhbdjxYsuj2EVS7nFZj+3ZKepT5DdpgM5fVYoQUBHAMJYYYRH/SBKW6Bb
         5PBNYouY6DbwpdgrjYocEV2nG+kH4tE2xhlC94Zl+Mi+XiPHmWCrCTyfeFE7cMDQXE1H
         IBFg==
X-Forwarded-Encrypted: i=1; AFNElJ8UQfyspky1pZHVAhUN/z5rEI2+d+HI/ad42p+tvltJUoIzpnVIqIdmG+IHnskwuB7I4xOJZPy7MP+GmLKxExg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl/gNcpIiarxlADwamA7s1nwhjDbqXQgMDXL8q2js1eKVzpbe0
	R2Ow+A/k10kTJ6fBzCVTuI/WHEFXW7OtP2tyK9priPQOe2/e4ers48r/uTJPJyQeUM8nK4sCpBb
	wZAf0pfEqmA==
X-Received: from plhz9.prod.google.com ([2002:a17:902:d9c9:b0:2bf:2f05:e721])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1208:b0:2bd:73f4:8e4f
 with SMTP id d9443c01a7336-2c429181b81mr37053585ad.0.1781300714535; Fri, 12
 Jun 2026 14:45:14 -0700 (PDT)
Date: Fri, 12 Jun 2026 14:45:10 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612214512.464146-1-vipinsh@google.com>
Subject: [PATCH v3 0/2] Make liveupdate selftests library
From: Vipin Sharma <vipinsh@google.com>
To: pasha.tatashin@soleen.com, rppt@kernel.org, pratyush@kernel.org
Cc: tarunsahu@google.com, skhawaja@google.com, shuah@kernel.org, 
	dmatlack@google.com, linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

This is v3 series of refactoring liveupdate selftests as a library. It
exposes common liveupdate ioctls as a library which can be used by other
selftests like VFIO and IOMMU.

Currently, there are no users of this change but it is being used in
VFIO and iommu liveupdate series.

  https://lore.kernel.org/kvm/20260323235817.1960573-15-dmatlack@google.com/
  https://lore.kernel.org/linux-iommu/20260427175633.1978233-17-skhawaja@google.com/

I think it is better to move the patches out from the above series and
propose them as a separate series for inclusion in liveupdate repo. That
way we can decouple multiple downstream dependencies and then it can be
used by VFIO, IOMMU, and KVM (guest_memfd preservation) separately.

v3:
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
 10 files changed, 120 insertions(+), 105 deletions(-)
 rename tools/testing/selftests/liveupdate/{luo_test_utils.h => lib/include/libliveupdate.h} (77%)
 create mode 100644 tools/testing/selftests/liveupdate/lib/libliveupdate.mk
 rename tools/testing/selftests/liveupdate/{luo_test_utils.c => lib/lu_utils.c} (83%)


base-commit: 3a358c78093f98a70d84c934b7054f636bc846f2
-- 
2.54.0.1136.gdb2ca164c4-goog

