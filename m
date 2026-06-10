Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7816F37AA8C
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 23:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781132957; cv=none; b=jEPnRXiwDqJ/6MxHHrB19Sk9VPlFChQqF535Y5Mi+dWfoiw3kL0ZbtLImGgrpHdiR8Q05YIhExa1ItaebEOEtNHoFCiXtysetHxoUUju585Mmax0cmUBAas1NTq2/BgjoFkfeyM5gN4pfokVgvwHniKaJghnivY210GRnpwYKoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781132957; c=relaxed/simple;
	bh=BbbQk74+BAoNF8Z1QGyOTQn+LQCphJ5SQcn8jFHugTM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Lk7ePl5x3nazojmXSyltHPwrL+XYS9iLKeU6dde7Wka6AK8tEmU3TZhBPPYd0uOhWN+cGfbXArkLzgHH2Gkq5ffwF4AU78wHdpG2QH5l1PGKB2pfW/7ZAEmuEJkVNL9Nl67vLwxIRs3MC48Ln2TjGC8opQXDR+FSuNuMCUd7pnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dOc5VKMH; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dOc5VKMH"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c85c530ddebso4202492a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 16:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781132955; x=1781737755; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qgxCeC9McEsciJ0T1f+tqXHTQbKhGp3GAyJ6ti0WxAo=;
        b=dOc5VKMHYMwAa+5ihqMnxUcKGmHhy3h4nR2hxQ6N4nkcLk/MQXXDmdcg6CSmTyHNO1
         2DLesB0zNtFRENpDOyP5fVxK85BEYknI1PBBgtgtfZ1obTR9ZGNK7EMIoSMcn2z5y2fd
         v5aZQArS6IyqWgpuF4FEYU7C0U47K4UQoRunLfVrDHCa4ge8zrfBtuvbby2TEKPFjBkV
         RsiQR0rmfM116Nh8fi5LKM6SyaCeZmk5AT+JhGKEltdL5wg9sZhc3HEZY3RHu99lgP6T
         oLN74lr7sA2uCnznyZjQphvZ1Ly4Mi65aDopjrJBdT3GmPO4Jm4+hIFV3QhVB1L77HkQ
         +NGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132955; x=1781737755;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qgxCeC9McEsciJ0T1f+tqXHTQbKhGp3GAyJ6ti0WxAo=;
        b=preHjrXHPrfIeWqKOUW0Z46gy0/o81tN6o4FkbBG3qBzq3w7fOgFBz9oTsLzxxU012
         kv41BBGKeUqzCehhktn4K3ULd40+9OBZ2WeQ1WRCt5ZB6j7qbOrR7FQiki6KfNECVQQI
         MCoYU4u2ZGxScOtVmgb31ZZVpUpWSAjuKra3I5e8nzKl6U0dNtIiwzMSm/OniCO3v2BS
         Z+eP/AJcGAOuijdnOXaR//ddaI1mH0MdsalAOt8sRkUkGBK+Mx7BTH0zcVjrx5NyCuDZ
         TEldbAUV7J8KkghbpY4p7piPaeNO4PqvgB1pbFJttUzen6r64Czs7c9/rhOvEZ4dY1i6
         v89g==
X-Forwarded-Encrypted: i=1; AFNElJ/awTsEuAik9mRQeDLKd+sGuzprxegpnMP+KWJIbh98mbCIdu5iuGKzpmDgkMUx7PN37OfLHHxija5c6WxZoi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YziJ6DmbcA5Bwkxmp5/BEZCEZxz012vNJ24bfge6gXDxDMaO68q
	EsGeeUOydzUpFd2sR20h6NzE0neV/HbxrsoSXQcSMOpWFgl5NPApkq5Jy87ad2uCzEuM50ZBq8Y
	Fnfp+HllOmg==
X-Received: from pgj67.prod.google.com ([2002:a63:946:0:b0:c82:74df:99cb])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2cf:b0:3b4:71c1:ab29
 with SMTP id adf61e73a8af0-3b4ccd75193mr31490492637.16.1781132954530; Wed, 10
 Jun 2026 16:09:14 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:09:06 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260610230909.876546-1-vipinsh@google.com>
Subject: [PATCH v2 0/2] Make liveupdate selftests library
From: Vipin Sharma <vipinsh@google.com>
To: pasha.tatashin@soleen.com, rppt@kernel.org, pratyush@kernel.org
Cc: tarunsahu@google.com, skhawaja@google.com, shuah@kernel.org, 
	dmatlack@google.com, linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Hello,


This is v2 series of refactoring liveupdate selftests as a library. It
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

v2:
 - Addressed Sashiko feedback regarding folder creation.
   https://sashiko.dev/#/patchset/20260511201155.1488670-1-vipinsh%40google.com
 - Update liveupdate.c test to use ioctl wrappers in library

v1: https://lore.kernel.org/all/20260511201155.1488670-1-vipinsh@google.com/
Vipin Sharma (2):
  selftests/liveupdate: Move luo_test_utils.* into a reusable library
  selftests/liveupdate: Add helpers to preserve/retrieve FDs

 tools/testing/selftests/liveupdate/.gitignore |  1 +
 tools/testing/selftests/liveupdate/Makefile   | 14 ++----
 .../include/libliveupdate.h}                  | 10 +++--
 .../selftests/liveupdate/lib/libliveupdate.mk | 20 +++++++++
 .../{luo_test_utils.c => lib/liveupdate.c}    | 43 ++++++++++++++-----
 .../testing/selftests/liveupdate/liveupdate.c | 40 ++++++-----------
 .../selftests/liveupdate/luo_kexec_simple.c   |  2 +-
 .../selftests/liveupdate/luo_multi_session.c  |  2 +-
 .../selftests/liveupdate/luo_stress_files.c   |  2 +-
 .../liveupdate/luo_stress_sessions.c          |  2 +-
 10 files changed, 81 insertions(+), 55 deletions(-)
 rename tools/testing/selftests/liveupdate/{luo_test_utils.h => lib/include/libliveupdate.h} (80%)
 create mode 100644 tools/testing/selftests/liveupdate/lib/libliveupdate.mk
 rename tools/testing/selftests/liveupdate/{luo_test_utils.c => lib/liveupdate.c} (91%)


base-commit: 3a358c78093f98a70d84c934b7054f636bc846f2
-- 
2.54.0.1099.g489fc7bff1-goog

