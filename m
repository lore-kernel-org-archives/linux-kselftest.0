Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651603;
	b=qixnvNQzh8SZ759vi+kIPSeB0SmzevlXGV+flYG8S4tCfQTTS8tiA0ufkH3rQC5biVK8
	 iuuXt09shnQdcreOSsVU473n99LT1P+yd3NVEJMcfJlO8cCf/j+VZMLmV1HhjxjUTnzpo
	 3dWcc4STV2Y0pA/u65ztvNfW3iNwg4k+cnj3/mMVKnptJi1MxYMouR/UgZhKZBTnftXDr
	 eCGPWUbBYEMe3AM21AaoZ7kJCUiIsCxVFurckY+h25+txIy8qwd2iLzXc6Jxet/yjbXt7
	 qZzGcZlV4AQEm0Dvb8EqV3fAhQ66/ev72R+zIxapPmdesT4ZXvhi47PKF/qaLFv01bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6hyPiRO1YLgh5z7vpK+8rbMGtfzuaM8kNLxgiQL1q1o=;
	b=u2cfIds27Qo71G/TuWw0iuJmzsqOWQYoSQzllD9Ql7pFmVSst9lIprcRR/fppt/pwdvz
	 PrcTUqiS1aCeQunqP7KSB4a+vatXZGbBd6KMW+MpZKQfhdz7/uWMpaZBlcxt7a0BxLAFf
	 vqTOflyeaN1RUk8IW7vQNAKtvg5KCycuymnrruAFOqKyR+P4jUWhlFkYC6DmMn8OOdkU8
	 btFWTSlu7U4kBf95yX+UIBsztmbGYUWHm7aXbXnum1epu9lWuOdafGSPU2fh/tuKukFpL
	 x2LHXgQcNbTsQ5/hU4phfLkHgasNmGfB/XbRudefiEy3vFMMMRXo8DKA2XBgu+rOS7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mMySRvdX;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C509606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 06:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C509606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mMySRvdX
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e20edd106so997575f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 23:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651601; x=1793256401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hyPiRO1YLgh5z7vpK+8rbMGtfzuaM8kNLxgiQL1q1o=;
        b=mMySRvdXD81ZSX+EmqQQax9e08NSFdSVvtDJrnGftqpYE6a93r82F63dH+Tkd82jBa
         GgT4Zfv95T4LDj5VnmnNA3YjHSyHe1Dis7FTnnCqLkIFJzWQ+ssLIr/8glFXUkVq8GiC
         R31Axf1dUG3ksK5Wx3Hjsi9avVUsruDwwp7gES60syWHlxFTaW3R5tP2HEVnx1VerfaH
         t67nu3Emp5dluNDA94fEcxvq40FUhc7PGWdk81mljEP9ws44z9qurveXPhSJ4hFxh4Tp
         +ISKJsbRnJ9DK9K30cf2orP0ykx7QykPP0+pb89/nF4M+fNz6ZsX80CC9opqF8AZ4McP
         trzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651601; x=1793256401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hyPiRO1YLgh5z7vpK+8rbMGtfzuaM8kNLxgiQL1q1o=;
        b=wtGtW34C+8ygtg3E9p0fjTro8SKy5zMa8V564M1JF3zq+w8GK3f2TKIWsidonO2vrf
         Oxfe5T9VAjmSsUbmHzLf4T8z0ob9z99l627nbG1lrZw/uRYjHvqMy3941fOIg3Io3uyH
         dfoFKucz0QdznCHTzyMCAISMRUjlvE3DZNUjVY8Msj78f2rNWVwN5VPjGVSxx8pP8AnJ
         p10hpt0TVWIElO/nglsKpMbZFf+dbNbNPRrDaqP/cp8954zAwLD5zAHK04j4aOFXi8Vp
         iijDvS3iPrnI7AAhZ6HzyyzhW+wyh+VBWN0szdWRCtlOGqGXumXFMh87gxLcnjvKniSX
         pI6g==
X-Forwarded-Encrypted: i=1; AKwUvBz+LsRTbyRZ/ionQu0d1H6EudpZ+RTNoyTiVZgT0LNWsOAKXfg0slN0Gp1nb+kiex00+jjvmhKcD4jTR7VSXMk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZu2c4JJHdH5xQzbQCXgIZo0Kdgoe5RrFDaV6o+oaiTcc3Ky29
	pRrWc5XuR7Ag5P74OmejKS9a66aEwlifajnpjm3gc72OhrxrzSTEyl2R
X-Gm-Gg: AYBFou2pch0Qy3ZwfnaXeOKaUcyXHHgBok7T+ajs4RjXTRZPjBUtS8PNeuDL1uit92f
	eabuJ3Ki8pYEdKRdPH3OnYCTf7kSAEEpSevD2b42oJHBRBooIDZ1ke+xgC/NFTxDagtJvpCs07x
	Mty6tmVpfsmsoz/uyWE3a55MVfmoEBg7m2vYNKcJJoEVyoCGpU5aWZPN9ZkBKCzdoDXnc/zay7j
	ac16UniySEhawAGAeZpiZBSa6pG0wMGc41Q07VpAnJBZ34gwZ4B2peuoF+uOJE/lPgFhrv/GQ17
	QfSD/vyBiB7M1ZBKAAZFFUN6vGkDleb7kJrr1og9mcu1kF1/OuUB1LugBPb4KaHlwNUgGH8M555
	YM//+WhePH1/wNk1dXOCiJnRvZiMIlgN1BHtXGtS2YI3OoitiRBMW6zV651ATnF3yR7DHyHPw6E
	ZyE7nqj5GxlG8N6Tiv/MicKfUVKx4VGXonK/7Gon+Y+OeW7Id/v+7YHsUJw9r9qoa+84gLysAKP
	40PBnVSG3QmkdjabBZteEUB/mb9fi7f7HZn6uL/1Qcb4QAW9Bebn2HDDDn6eeiFSJTqz0BfBRky
	EyfwfACb9eVi+Y0BxDQ4nAGiMgXAIsiCvusy5KYE5+0L64IM03COkslHEIElgBecWF3fgbpAsmc
	W41hzD+yIa3401MDAdUb+aNZJAtD3O5QD8FsTdRetF/rnucY6UJnuORrDtpPtvo8e
X-Received: by 2002:a5d:64e4:0:b0:48b:118e:7454 with SMTP id ffacd0b85a97d-48e264bd971mr9315929f8f.31.1792651600585;
        Wed, 21 Oct 2026 23:46:40 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm10215624f8f.22.2026.10.21.23.46.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 23:46:39 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] KVM: arm64: Preserve level IRQ re-pending
Date: Thu, 22 Oct 2026 08:46:25 +0200
Message-Id: <20261022064628.4206-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A guest can set a level interrupt pending again while handling it. The
GIC records Active and Pending and delivers the interrupt after
deactivation. KVM instead drops the second pending state for both the
GICv2 and GICv3 backends.

The VGIC keeps software pending state outside the LR because commit
67b5b673ad4d stopped placing Pending and Active together for level
interrupts. When the LR is folded, KVM cannot distinguish the pending
state used to populate the LR from a later ISPENDR write. This series
records the later write and preserves it across deactivation. The last
patch adds a two-vCPU GICv3 selftest.

The awkward case, and the reason for the RFC, is a write from another
vCPU while the interrupt remains in an LR. KVM cannot know whether the
write preceded or followed the guest ack. This series preserves the
write. A pre-ack write can therefore cause one extra delivery, while a
post-ack write is no longer lost.

The exact alternative is to stop and synchronize the target vCPU
before applying such a write, as the active-state accessors do. Is the
conservative replay acceptable here, or should ISPENDR pay that
synchronization cost?

The issue was reproduced with Zephyr, NuttX and RT-Thread guests. On a
Raspberry Pi 400 host with a GIC-400, each GICv2 guest handled the SPI
once before the fix and twice afterwards. A direct GIC-400 register
test also delivered the interrupt twice. With a QEMU TCG GICv3 host
running KVM, the new selftest failed before the fix and passed
afterwards. Existing vgic_irq and kvm-unit-tests GIC cases passed on
both versions. Those runtime tests used 8623551a424d.

The series applies without conflicts to kvmarm/next at dd0bc00e3e92.
The modified VGIC objects pass an arm64 GCC 14 W=1 build there, and the
selftest builds natively on arm64. GICv5 does not use the LR path
changed here. I have not tested a mapped physical interrupt or VFIO.

Karl Mehltretter (3):
  KVM: arm64: vgic-v2: Don't drop pending writes to active level IRQs
  KVM: arm64: vgic-v3: Don't drop pending writes to active level IRQs
  KVM: selftests: arm64: Test pending writes to active level IRQs

 arch/arm64/kvm/vgic/vgic-mmio.c              |   9 ++
 arch/arm64/kvm/vgic/vgic-v2.c                |  13 ++-
 arch/arm64/kvm/vgic/vgic-v3.c                |  13 ++-
 include/kvm/arm_vgic.h                       |   1 +
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 101 +++++++++++++++++++
 5 files changed, 131 insertions(+), 6 deletions(-)


base-commit: dd0bc00e3e9201fd49b62ff9cc07890c89003afe
-- 
2.39.5 (Apple Git-154)

