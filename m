Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F68F25B0B1
	for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 02:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779591552; cv=none; b=aEQk+04+OQM3DL7VV+cVr9lsWC3/oddQDWb6oHI22KTGUEYNrnGNhfZeYULI9GGhZct0Uo7HE0oyGO65Rm+axQyh7tpL1pEWtQ+3U/rGcGweoiyC2ZX7Bft+LXZa44mZdoItUDWKUnIqoRIj4gfNpKJtq/njYX35K8S5Z3E0QrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779591552; c=relaxed/simple;
	bh=UbgCFgvmWaN3PxrtD/I70PhR4vT5giki3jZ1lSQlgl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RJm+1McOemp46UVgotwbL0fu/3Cwi1Ey6XzNV0mFy3pNRQg4EF3aKE16UuP4HLucyWp+RgACze+2W9Hb036Op6+53+iRvMh7n+6Fe4jXvJdy0MiD88kQOp8FucDuaDxN5cgBjDQ2sBoycw0Fg9iCvyJePruV9kJEcJY8zIlQWWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rL99RfpL; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rL99RfpL"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bab82d75fdso42841725ad.2
        for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 19:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779591550; x=1780196350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bYwNNVyWKj7ua+gpS+KEFegejp3wiD0Ae6Di3tktjdI=;
        b=rL99RfpLUyFCIcILAomGuyLHN/+3tqWIwETNEP9f78Gcl7XtyfCu4Nnu5la0Njssyd
         o9CjCXDrJAp7HOxkMbbPMYAyD+7sX4PyGxNILxQR5fz3YNlKS8wUlP+ccBwEh2mMJJ7d
         bzjwSA6s2NfAledFfrtjuNOWHnpVbaAE0ZBWZvUDNc1L+CnXfAgZqFgHerb9MCyyhiBr
         6VLTW9PzvgN9CxCL3iRFWGe9TDondjfUpaWd76PXwny1WIJdbXdSlAs+jRR5jubtYtGo
         cp6Pw/5xIi01BDTBgNM4e1M3TNwilos50+FZJiGb+SFID6/ZPmyNF8wn5LdcSbuxLhCM
         F1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779591550; x=1780196350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYwNNVyWKj7ua+gpS+KEFegejp3wiD0Ae6Di3tktjdI=;
        b=Zozc245yOvrxNVacNyTbRoqNYuYSsUBw4tcfPw8e+W1L19DI2kDyGq/VuQrjRMcR0M
         HwusxspQYjRDPd2M2FHNXOO8JRDw0Tp4iXkA6JJbCUE9a0AUxfxfR8kDspCsheusQeUA
         yr6ZxPDhQE69m2BQdr3/IcctrHDti/mWkBLJ9IQB14dO6zBDBlSQXOakcZw68M/n1v1M
         sfIN4p1qWSdeX9fX8pvHDC47ZGM56BROoP0VFKWbWiwvEb/7w9djhWlkYVzb+PreiIa9
         U3pkqQx00Z4vTeMgH+IZDiuTOheE6ks3CLx7Yams4Yhf5ZcczK94fk4YrxjFPU3dDPUW
         +Ksg==
X-Forwarded-Encrypted: i=1; AFNElJ9rGLs8o0Q+Tgx9mqx9lNiRcxR9neiZYWtBopPTQjg2X2bjxynmZU3SVxSfZmIGXAmsqbi+iaezkFZzdxNsCaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwULFODjRf69ZrmhIUvNUa1eehElC+lDMbQEvA0E02BTuDnV4Sg
	8yryxgJmWq8scwLfCfyjjMes6VI80yMI4pMYbQjMaig3PH1slPBz5iFw
X-Gm-Gg: Acq92OEyPnbOV2/J+TEV1HqS0+AY/BAQWYFW5W/8EzIJwPJALw1tcMYnwQZ37f0avMa
	Kq/oZNK0zMpHBMlm1F37gCGwmLMr5+62f+Aj5u04GunxjfE83pij4lLTu10cXbNvnkRFFaaSN03
	Tdeea3IlfbAH/J5HRDHlUR5sq35YPTzTuibicedDiaS4bg9upDaHR2iXBIahutlwpQPaOzDNxSH
	k/i1TawiRflBZNXEY1g2VmYwdJ4oxfiTbr5Re3T+cFWoBBF/2udpjvZ0RSxvosDBZTWW+dLRhqV
	qx+WukFM73f+81/R8Jm4MaFPgMZoEyGAf/rdcButE+3w+NuV/Y8ENSBbJvIIAeiw7ny19LMHObz
	NxJAR71FvA15mRsSxo/2ZIxU9MPjIzfTaerVhUbtjz8PTz4cLpDLDXg8IEEK0jvsNF2epbZ6f3m
	DPTKAO4WhDUe+VT6Rbbh0Mrmlmh5czeYc=
X-Received: by 2002:a17:903:2450:b0:2be:3626:dd49 with SMTP id d9443c01a7336-2beb06eaa4bmr100475355ad.8.1779591550322;
        Sat, 23 May 2026 19:59:10 -0700 (PDT)
Received: from archlinux ([205.254.163.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm62212935ad.44.2026.05.23.19.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 19:59:09 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: andrii@kernel.org,
	eddyz87@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH v2] bpf: replace pop/push emptiness check with bpf_list_empty()
Date: Sun, 24 May 2026 08:28:53 +0530
Message-ID: <20260524025853.13786-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify fq_flows_is_empty() by replacing the pop/push based emptiness
check with a direct call to bpf_list_empty().
This avoids unnecessary list mutation and simplifies the code while
preserving correctness.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>

Changes since v1:
- Removed unused variable node
---
 tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c b/tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c
index 1a3233a275c7..8107f5934d2d 100644
--- a/tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c
+++ b/tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c
@@ -196,18 +196,13 @@ fq_flows_remove_front(struct bpf_list_head *head, struct bpf_spin_lock *lock,
 static bool
 fq_flows_is_empty(struct bpf_list_head *head, struct bpf_spin_lock *lock)
 {
-	struct bpf_list_node *node;
+	bool empty;
 
 	bpf_spin_lock(lock);
-	node = bpf_list_pop_front(head);
-	if (node) {
-		bpf_list_push_front(head, node);
-		bpf_spin_unlock(lock);
-		return false;
-	}
+	empty = bpf_list_empty(head);
 	bpf_spin_unlock(lock);
 
-	return true;
+	return empty;
 }
 
 /* flow->age is used to denote the state of the flow (not-detached, detached, throttled)
-- 
2.54.0

