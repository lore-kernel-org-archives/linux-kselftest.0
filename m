Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B4F397B09
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 06:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786344747; cv=none; b=iZ0wvxzfzP+vTDPgic7GpZJiZsXMtrbNNTdwAxEPqM7oNoPfOslvfv1lE+EzYfsNwMYwQLFNgqXW+pT+Xa45kNP19frUibwuJIK2S/pu5bS+3woHbOwTFH/nnAt94LDEq8mugyrgcRCCXaN9+QIaowD0c3ECA4Gj552J2lhcIDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786344747; c=relaxed/simple;
	bh=sNuukcM3D83y3AGrAcmDVUJWOr4AK1wbJYGoX6MXcZE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IOJr0pQz+soQ/foAFo/AxCCNRKP+shJm2GGV50hHzqPIgSEFZQPwN9d4O1OXpKII9J70/1N44UbZV9Ry+wJViTmgNNgj5dpcJZWmw0hvVZflBDDPUrr4RVrZkyl1wb8OHlmAU+5Y9FBc6zX//fLYYbk3Y+tJZxjcemAtVALC29c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V50/Kz63; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V50/Kz63"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso9969165e9.1
        for <linux-kselftest@vger.kernel.org>; Sun, 09 Aug 2026 23:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786344744; x=1786949544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8eGCU7QsDbQICJdJbOzdpd9Veffbk4TEd4ih/oR0Bp4=;
        b=V50/Kz63TK0ROdwOYNGasFz539ZDlTcqYJrmTMVfgytWNLLsGgPE8DYzZx4IzxPGMf
         cvj4Wgm3HK2zKsKzXgtjSBbmFx7QjVgN7SauUfxYnTtFowjn+1QhrUB71GwVl1I91TEs
         JK9qcgOSM2aUwIRqXvEhqi+nSEwg9DGV4L62reYxCO+kjANt8m+YTcWvuAXj3rTMg4Q4
         rtje9h+nDIRimjS8w+lp4Z+oL3vxOSVOjYxRz25QaTWAuLkb2hhxd6+IxsrXQPDvOi5r
         1PnOwKl5wZJ1eVqP0cey18YOlmZJcHZYMPuLyVB8wKt1GaQBkpsfOp48JaFsM71lLq9t
         gu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786344744; x=1786949544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8eGCU7QsDbQICJdJbOzdpd9Veffbk4TEd4ih/oR0Bp4=;
        b=mcRWO76Z3DCUb7fFXoyeG9pRB21/3qZ3kO6NFqbw5D+roCrg9ZsKvghWdvYc2Z/1RQ
         uJWuCsP1YKRSXq343Yn+k7Ubwz+9ihdHs6dGBRtKqGUqjF/CiiXFxg7r0TIkCfQagiHS
         G0mFj+IHhuFxl2d0Fpfq6Ulu6lri3a/Kae9AQGV45Jl/BpI/MmMcmPoKMoCCWSnJscAS
         M2z1eC1M1gpabHdX2svtL83WVVPafZ9OXReBDnnW4NLfZq7J/+uyRfRJxMOthOvwxrPu
         cMONZeOmN6Aa3YrbC1TjT5Q9t/IKl+tbjjP8+vbMR5MVva+xMIaPlJBe8LgiyW286lFg
         G47g==
X-Forwarded-Encrypted: i=1; AHgh+Rr2mMp1ZwcG9rGg+NKRtxqSnQyWD4tMMWHfYb6c5R37vzYU1Tu+hIZe0U7VZdsqk5zCCEm5AuIz1HkP/Zud7sc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhhyXKuEOMO5LLj4s0jcnnvosIagWiLRiQcZgK+Sng3dLydKtz
	K6LiE0JTezFhHVJW9Aczs7VoSjYPArZKHiYnmf49GMCjm/DBN7b30T2E
X-Gm-Gg: AR+sD10XwfOeXImbpfXBWfV2OKBbaMRC/g0skjnB5DhL/SX15OI2ypAqtUFwUXZDt/E
	RvKiLEpnc2dlsHj5/YPCuff34R1n14DbeCN9DBD7Nw1Nn1VBBFSJZhdMATB71h72I/eQ92Kv9wx
	JvBYnNSvZAk5ZkmTto+NTEv9ldx/712H9TW9GVxftj/UpYqudhK/gSy6iPBijRRCBi1hGhBDvrK
	f7NASnD4OnTg+9ZR2SQbrVLNBpZV2dWhrQsjCHmAxvabRku9BI9gM/oIiqWe+c61ADkLUlue12e
	dfIY986OUIKUlZRQ6ZUx+wM3FemaXrnep3erjx7Z9CWsvD1O2rEMM3lNsayUmEcSC53ZxolPOwk
	q1qiMHRoV1QQI3l1UDSlsTxgwwi1aykrSUk99PRlw2GNF8+myu8hBh9c2pI83R0wBK17l+zJWRy
	kyhLAcht1csr4KsMvzF5GtZTgzCgkpA/WUaLeyG74VMgsFnN1Yqt0EQYVWDfC+U5lNrmovXtYHt
	pMaYzK86VYuGjitiiimkepdvxlB1xnHi80XrhfxLgrR79HrAko6PkoaS86/Is9Z4wv8RR2fG6cy
	0IA+radW97loTgPRwngGa9thuQ/BGHxhOncj9fUBPZyUdc+jDC15rHJN7xYh1j+Bbo3PPPepMj9
	pTw==
X-Received: by 2002:a05:600c:4595:b0:498:952:e276 with SMTP id 5b1f17b1804b1-4994e79e377mr389497355e9.8.1786344743398;
        Sun, 09 Aug 2026 23:52:23 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-a1e8-7401-78b1-a175-5d13-e92e.310.pool.telefonica.de. [2a02:3100:a1e8:7401:78b1:a175:5d13:e92e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995420c68fsm358800705e9.1.2026.08.09.23.52.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 09 Aug 2026 23:52:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Eric Auger <eric.auger@redhat.com>,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH 0/2] KVM: arm64: fix VGICv3 redistributor rollback
Date: Mon, 10 Aug 2026 08:52:15 +0200
Message-Id: <cover.1786344511.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A failed REDIST_REGION update can unregister redistributor iodevs
belonging to earlier regions without clearing their cached base
addresses. A corrected retry then succeeds without restoring the missing
iodevs.

Limit rollback to vCPUs assigned to the newly added region. Extend
vgic_init to access an earlier redistributor after a failed update and
retry.

Commits 8542a8f95a67, 59112e9c390b, and 0d92e4a7ffd5 progressively fixed
cleanup after a failed region update. Preserving earlier regions follows
that model.

Built with GCC 15.2.0 and tested under QEMU 10.2.1 TCG with
-machine virt,virtualization=on,gic-version=3 and -cpu max. Both runs
reached the VGICv3 tests. The patched kernel passed; the same selftest
against the unpatched base failed with:

  Unexpected MMIO exit at 0x8050008

Karl Mehltretter (2):
  KVM: arm64: vgic-v3: Roll back failed redistributor region setup
  KVM: arm64: selftests: Test VGICv3 redistributor region retry

 arch/arm64/kvm/vgic/vgic-mmio-v3.c            |  42 ++++---
 tools/testing/selftests/kvm/arm64/vgic_init.c | 115 +++++++++++++-----
 2 files changed, 112 insertions(+), 45 deletions(-)


base-commit: b9b3e33b70b71e516930117e21de3ad2a7723747
-- 
2.53.0
