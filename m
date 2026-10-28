Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793163688;
	b=xYPxQIXTg3uB1XcAiu7rJqNAiHck/bUbBaRF4iOn1tJfuPuOAwCzmpTiRLjSqagspzgr
	 OA+gBhO9+qL805ZHtKIAzJT83xp7Bxd2adntDjO8ST62GWkwMBOw8B/nSRQQZJ/rYlbZ6
	 s5EzH9cwp17nHBpvk87b+egJ175IJSL+5TZfymZB3a5eVfW3U00mGo6+2Cw3XAvutF4Qo
	 vFWJhBOIEaz2L1RwkZpYe6Ldqw6qxvHpzNSQOPfobqUDBsbxEq90G7GzkVcvsdr8KN/q2
	 t3qA0n9igX4husMzqXGOcI4DVATNXXupHoZqGTL0XIHhae0ITrDcKaG97f+IIoC/cZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793163688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MsI8OZZh9dKz1v392dtfILjaERE3/nyinId1eBUI+OM=;
	b=20FZUh7+X4jfnsM4mTfpUrRGlGMRYQ8LW9b0mw8YEfW6Nc6OsK3/uS5Gccniqb8kFR9V
	 PXnVLBGBfdP1QzTtqcoiiWJ3LJOVVba+6bJJuWydhleElqrBHPJqxfNkHcVeewufoqjxd
	 UCPMTSDrJfygxqk/jtNOnXPOS4RkXYsXiALslbP2z7vCFieibzlsR6il7Hh/OLqYbnfOi
	 YTOba9KYEks55ewJ0Xy8BFfNBxuROJ6rweWnrPFeiGctQjM374MY5Du3nsK6nnhmCTM8g
	 fGfoMB2t5K4ZZEIPJbWpq625cKG7I1idhwToZYKcsKDkfq0x+iyNf32BpEce06lHzpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0YrwKb5+;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD4160A261B
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 05:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBD4160A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0YrwKb5+
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so4648615e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 22:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793163686; x=1793768486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MsI8OZZh9dKz1v392dtfILjaERE3/nyinId1eBUI+OM=;
        b=0YrwKb5+jvPDDNM7+U5lrwnlzNjBYxvjeWxJHiksh0eQmBD4YSGwJSD7epdsbzMUHV
         VLYQBWcOsXd2QguIaPDq5LO2SUKHPS5If5gH0xbgAGqerx3VN6jvYyXkBT6EOrZmaAK1
         RspwV8mGvhNGZ4ZMMu2VfNRhzA41fVOoYFST7Gka4vceEHb4gVduEGHPKUVeStk/IwiW
         Pdh+inWUtIbg9cAO8EnAOI8lsYG5/BtV212TMf7Ek9ZRxyUe/KjD5iVF38uKM0K2Sgq7
         ed+UYJ9hB9lwPeEsOyIHk5bJk1kxggD324tx50rEm5GZC40xUc152Y/yUfC23nouTQMB
         geKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793163686; x=1793768486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsI8OZZh9dKz1v392dtfILjaERE3/nyinId1eBUI+OM=;
        b=RAB4WbadH613rqH9uAj57jRhGVpIr+tG+LQEirbqV3hibdWffjRGjIg3xFcDvbYStc
         u5avGg+F36NaJzAs2fL7lNbc1/tV5wh3h1eMuWtquXSk5DSss5gk55NMEWB/i6uDGY3z
         ngUZ8Q3HBMOwIIpH8OKh9pZBVAqQkK0Kx31NaSIldksK33OzSTtICD9JSV3aBat41XKw
         j2N8bKYSR69g3mdJdGCzJwZqDNHP45cjYEHMG22dajYMQMGK7OkODxHpDcB6HwmMHpQC
         SKMmqJ5iRIfWyV8VKIVpZoCSvKRUkUqmWTY2DE4+k4L57aHqZ+D5cPLwmSSWIjcRRORV
         dnnA==
X-Forwarded-Encrypted: i=1; AKwUvBzcT/uN1Jk5ULVFzfHgC5tn2xVtjMCigWVEZsCXznvplXbnGuY2mdAiWYdN3UCjZonCJx297UBFIPdsfS6TkBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHWjFpEEr1xoJI3cF7AkLtSUHk/826PRKDwzPxn9DVTj+Ut4vb
	vQbspe9G209SZ0dcVW6nZ/LX6JlyBLGimmEJsE8HoRm1Z5wdoJ4VLa4g
X-Gm-Gg: AYBFou13uqFK+rEx1EFbENKvRydo1LvIQu37KaWWH09gkDejHPKaSLEGN08SJ2BZf8r
	M9lPIT5Acz9NPsIIF6seGk0oq/W35xZHV/jcLJBkWEO7O9VsC+AHD5NP8bWPvJumN1IdXE+4OFS
	H3c6690OVrxspbTPxL9KdSxdLKZxe8spKlaVikK4YnH+SSU23Qcrb56R2/pdDK+iYf8tz9FLuZG
	EOzFBta51DNFnhx/DsEdB0YFnVjHmT722C3TU3NSsxHXIZH8BV/c0DJx4gcRUNIOaLK+DCMeRhf
	lalJu0++QA8fRVEk8LVIGrCRhsf1m4RNDSA7dmVHSgrMI9gp+hVL+FH4DQenZrS6FjMKWlntWsz
	FUlSBiPVuNXsajs6Nbc+mg3oy3mEnBAW34FM62F7aYXmbSlv5miRcQja8JpfybAdND1iUxuAgOt
	oBl4/v9+qJHzlpOQyY+EWzIeO6LbYS/MmknIntGMGeP8xKMh85b8vTOOFftCIhm8gNus2RdnDr7
	pwNhHw5ME7c1dDNaLY4JXSSoSzK9hmj5C0cR3D2qioHi6f/oKA7RwI5azWPKhxopr5JvZWFXum2
	YkoryS+W3tSFHzv/zn4dG49KR8hgzZ9WDCj3KHzgaOMaJdOMyWtMqP8n8e+1DIhcuYJw+nUjXLM
	jfxA/Q04zJ/CqnrCccXYwi5ByQlodTcX5dfDRrmfnDzJJoUcIP8epTlZYHEj/eRADqBN/Osvof+
	71dcCZy5bPNSDROkelI5ApXGHeIqV0YWN2CAglKA==
X-Received: by 2002:a05:600c:c117:b0:4a2:cbe:beac with SMTP id 5b1f17b1804b1-4a9672f814emr15602045e9.23.1793163686125;
        Tue, 27 Oct 2026 22:01:26 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94eb8a60fsm13523365e9.3.2026.10.27.22.01.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 22:01:25 -0700 (PDT)
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
Subject: [PATCH v2 0/3] KVM: arm64: Preserve level IRQ re-pending
Date: Wed, 28 Oct 2026 06:01:10 +0100
Message-Id: <20261028050113.10046-1-kmehltretter@gmail.com>
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
state used to populate the LR from a later ISPENDR write.

Synchronize the target vCPU's LRs in vgic_mmio_write_spending() with
vgic_access_active_prepare() and vgic_access_active_finish() under
config_lock before setting pending_latch, as suggested by Oliver Upton.
When a vCPU writes its own GICR_ISPENDR0, this synchronization is a
no-op. For shared interrupts or remote redistributor writes, stopping
the guest folds any prior ack from the target vCPU's LRs before the
new pending state is recorded. In the v2 and v3 fold paths, clear
pending_latch when an LR populated for an inactive interrupt no longer
reports a pending state, and preserve a latch written while the
interrupt was active.

The last patch adds a two-vCPU GICv3 selftest covering same-vCPU and
cross-vCPU re-pending while active, as well as a cross-vCPU ISPENDR
write before the ack.

The issue was reproduced with Zephyr, NuttX and RT-Thread test harnesses
that configure an unused SPI as level-sensitive, pend it via
GICD_ISPENDR, and re-pend it once from the ISR before deactivation. On a
Raspberry Pi 400 host with a GIC-400, each GICv2 guest handled the SPI
once on the baseline and twice with the RFC fix. A native RT-Thread run
on the same GIC-400 also delivered the re-pended interrupt.

The v2 change was A/B tested with RT-Thread's direct and mailbox-pic
reproducers on Linux/KVM hosts running under QEMU TCG with GICv2 and
GICv3. The baseline lost the second event and v2 delivered it. The new
GICv3 selftest also passes in that setup. I do not have a physical GICv3
host, so the GICv3 testing is emulated.

Changes in v2:
- Synchronize target vCPU LRs in vgic_mmio_write_spending() via
  vgic_access_active_prepare() and vgic_access_active_finish() under
  config_lock instead of tracking on-LR writes with a separate
  latch_written flag (Oliver Upton).
- Extend the selftest to verify that a cross-vCPU GICD_ISPENDR write
  before the ack merges with the initial pending state without causing
  a second delivery.
- Drop RFC prefix.
- Link to v1: https://lore.kernel.org/r/20261022064628.4206-1-kmehltretter@gmail.com

Karl Mehltretter (3):
  KVM: arm64: vgic-v2: Don't drop pending writes to active level IRQs
  KVM: arm64: vgic-v3: Don't drop pending writes to active level IRQs
  KVM: selftests: arm64: Test pending writes to active level IRQs

 arch/arm64/kvm/vgic/vgic-mmio.c              |  76 +++++-----
 arch/arm64/kvm/vgic/vgic-v2.c                |  10 +-
 arch/arm64/kvm/vgic/vgic-v3.c                |  10 +-
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 140 +++++++++++++++++++
 4 files changed, 197 insertions(+), 39 deletions(-)


base-commit: dd0bc00e3e9201fd49b62ff9cc07890c89003afe
-- 
2.39.5 (Apple Git-154)

