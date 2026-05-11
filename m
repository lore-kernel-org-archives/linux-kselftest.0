Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A810537F8A8
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 20:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530336; cv=none; b=C4QHwTs4CzGt2OPHDSF+cpUrzVyYvC8ucKgv9t4fVhEl0xXmCgt1pyTBgtpnmOBF0A631W/Tymfd/lcqvMgcA+ddl+PFsp+ZNE0z1qFgvpIsiLHpSeFg9LYEhbMnhTvx89J4o0TjJauaJn8tpvSySmlW59vCdk9U969bnyBAvvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530336; c=relaxed/simple;
	bh=1N3+X2GvNR6/Bj2sgdy/OpG/E7PUnJF9awsdbGJRl84=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=lZ7itPlS7bbGdf1/jBP7xh3Si7cmdatmigGfEYydnKRjHTTbiD/t/gkP85EseOwyprMSe6QKrKW4Z3PXoiZCoPN7NVj2VnsGVR3hvNEUEnXrlMFqTbm1jXkrxarfMMnlCtE7cur++o6nI+FyafcfOe0eRuGlxlp9NfzLqzvY2cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B46hcsdM; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B46hcsdM"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2bc6899bfb1so30247265ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 13:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778530335; x=1779135135; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ka8U5haOpEFwauxy1frySuDpQ99OWYRzbH7jJ3dWd/A=;
        b=B46hcsdMhAhtbl8mu4eb0vyletj3trzdgaDfk90UGWTbI4CV3crpDGW7DxpzctEJOm
         kQ+Sffm/myCKroQzY/Mn3diVF28tNsPBTSIQ52bco4CvY+GqiOFEc+QOjqrE8uyslFuq
         Zgv3R6OZ9L+P6GuuVuIaL+1bMptA8VVmZnj/i2qd1AkBbcNxD0cUIlSvjL43lVMiUG1G
         z5ybytAIZKDnU6YQOaIRTkfNvofBBKsqSlqCGlcAIINpmEU0XUqOwZ2cb/oiaTcte+dx
         ZaB93SzIQ8pcGt4uO08y1ZuXa8PUlYHucofWirlKSIgejoF2EO2mui9CNkLkE5rBwYvP
         Wvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778530335; x=1779135135;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ka8U5haOpEFwauxy1frySuDpQ99OWYRzbH7jJ3dWd/A=;
        b=Yj6l832j4ZGH8QhwZ4NurNrqseawBR48VBoOWr5hrJ2tRHWaRYnP6OBRhTyAh8bQoB
         QwbsBJVTMLRMP3KUnE2jw//hYaaGwJoLi+Ic5XqRoXPhrgd4RI4AaM5501XD4v+ZcTrd
         Zk2YI4dXx4oW+296+6gGzDJuvVfm6ZkziwQGtBNrE+CbdAJDPYzggVZS/HYSMwd+kunU
         fu9aiaS5gfsQ44YDTIyTPAyMZQaiYVMfwsXs7zwNn05WwB/wHJHJP+mJBd8TZO+Zspf6
         MSEjn2kDC3NvRIB5UhY8MRX3N6acLFugNmgmuXnwGACbZpGUbtLSKZw+pXSubNz6+gVy
         Va1g==
X-Forwarded-Encrypted: i=1; AFNElJ9704ZdPgh4SbuXxC8hb8aHm3vpSL8OtsDUvhvaUjsCx4yJxdR2WPWehW9c6IUYb81lsxYIIacMA1+gujNjZwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkWCQqSD15rhAwefuynF+LISRsrHS6yfqtYoyzTZa0qtqpZZI2
	NxnVLxZ49y8RbTq7pdD4KVkiCuB/4yD6e1pYNSmoSzmbae3lk8Re6MlHEHEC/ceMuO4TZJl6ZHI
	2wac5YWedpQ==
X-Received: from plhu6.prod.google.com ([2002:a17:903:1246:b0:2b0:4da9:9b34])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3e25:b0:2ae:6259:5aff
 with SMTP id d9443c01a7336-2bd010f3bcfmr1073205ad.6.1778530334794; Mon, 11
 May 2026 13:12:14 -0700 (PDT)
Date: Mon, 11 May 2026 13:11:53 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260511201155.1488670-1-vipinsh@google.com>
Subject: [PATCH 0/2] Make liveupdate selftests util as a library
From: Vipin Sharma <vipinsh@google.com>
To: pasha.tatashin@soleen.com, rppt@kernel.org, pratyush@kernel.org
Cc: shuah@kernel.org, dmatlack@google.com, skhawaja@google.com, 
	tarunsahu@google.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

This patch series refactors the liveupdate selftests util. It exposes
liveupdate util code as a library which can be used by other selftests
like VFIO and IOMMU.

In this series there are no users of this change but it is being used in
VFIO liveupdate series and iommu.
  https://lore.kernel.org/kvm/20260323235817.1960573-15-dmatlack@google.com/
  https://lore.kernel.org/linux-iommu/20260427175633.1978233-17-skhawaja@google.com/

I think it is better to move the patches out and propose as a
separate series for inclusion liveupdate repo. That way we can decouple
multiple downstream dependencies and then it can be used by VFIO, IOMMU,
and KVM (guest_memfd preservation) separately.

Vipin Sharma (2):
  selftests/liveupdate: Move luo_test_utils.* into a reusable library
  selftests/liveupdate: Add helpers to preserve/retrieve FDs

 tools/testing/selftests/liveupdate/.gitignore |  1 +
 tools/testing/selftests/liveupdate/Makefile   | 14 ++----
 .../include/libliveupdate.h}                  | 11 +++--
 .../selftests/liveupdate/lib/libliveupdate.mk | 20 +++++++++
 .../{luo_test_utils.c => lib/liveupdate.c}    | 43 ++++++++++++++-----
 .../selftests/liveupdate/luo_kexec_simple.c   |  2 +-
 .../selftests/liveupdate/luo_multi_session.c  |  2 +-
 7 files changed, 67 insertions(+), 26 deletions(-)
 rename tools/testing/selftests/liveupdate/{luo_test_utils.h => lib/include/libliveupdate.h} (80%)
 create mode 100644 tools/testing/selftests/liveupdate/lib/libliveupdate.mk
 rename tools/testing/selftests/liveupdate/{luo_test_utils.c => lib/liveupdate.c} (91%)


base-commit: 5d6919055dec134de3c40167a490f33c74c12581
-- 
2.54.0.563.g4f69b47b94-goog

