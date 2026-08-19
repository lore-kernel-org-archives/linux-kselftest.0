Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67293DDDB1
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 22:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787179382; cv=none; b=OLUPyfCJTCDjg3h7YwcXp9pTLDU5FEsKUaaZbIbO/uPv41+t+fqyn/bweMPpXpPnc9DPXxQUEVbxB/paWrnvkNV0pP0ptIgKixcPFL4n1eOe4FrWZerYsxZo/psnPghArNmcllp9vO45ywkS82zVrpGY2lFgfodCkOxLW38Ileo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787179382; c=relaxed/simple;
	bh=TBv4jWE24nFMwbwZRdR3u9uJWahJa5hxuvryb+jc+e8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cvUQQ+S7sHjxXWj89+Fn2dU62VfeoVnTiBjap0aQWUzqcjoqiTsAna4MA6Tn7HmdtX1vuUZpNuFQ8oLb+9o5rTkNCcrKwH7BJjsrDtznRhmzBrIYX558pQCJDrTUHxDMFVr/xSna+YEf4d49ADWgsid5RSK6fwasrtQVw3bIN9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MymcRbzy; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MymcRbzy"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47362928f65so1461320f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 15:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787179377; x=1787784177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vhLrSGY9svoYEa5H9hIeWUA3Z0wbe2vysdY+foWNbO8=;
        b=MymcRbzyCI9qU5cS+KQodr96iPszMfIwjMEtwHevceflmQzNARRkl0BQtuZyvfXyJi
         EYAaN362VjwkpytwHe581RA9LpPSI29/NMPpa9hoNHNKdSIg+VuQgT6FSDV4hgAB9nje
         9zp6FEp8dMNMl+/Y7Rfuuhke8mINnRAH6NigNS625u/zPZZTfEo+DqNDXBSTWLlT8H+e
         zlp1KMav5uC/unz0nEfVJbb6bX9knAiilENtOq2Xjt86xEClNDDHoNafMmNO5dpbx0Be
         KRx0aQ1uw8pLlNfhj/TsOfiYnQAGwrOKLILlmSN/Pj9ecKaycXBSA00GKR6gIJaAAJOK
         /gdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787179377; x=1787784177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhLrSGY9svoYEa5H9hIeWUA3Z0wbe2vysdY+foWNbO8=;
        b=Zn3wtfcidJTbMveD4A+24NUV2vcEZ3yTxNn5IwWayy9JocnMMw+D1YXVrUuO8gCVV/
         y51KKu5zAWI4rQvWRmmZ26ho+BlxRH+Oi6xoM6r897OQRly0r1Oh2HiTBW4WyJNg2koy
         ypk9PmNvnKNMUed78YuJa4QSMoE8DX6FvMewp1EzrYI6q9YHtx6R2IOew5UEaaNpbRoF
         ig3z3JCgA8oyfgfGPwKiufjucc7umEI2fx7cW9NYXQdy8blsOEy3nQqR565gUsrN1X99
         iTdphQgfJ53Zp0GfEOYGr1ybOYuwv4KB8R97BPvneKn+IGJN5Uk3httMFWftKU+Z2PZ/
         EwwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqhJYerP5skhs2AELxik4n1V+S+6Yo5+G1XXVXhEoFlpXMaq8XmUD5nAzFyW26bFI/kHxhM0Kiupyf0c3VsV4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kT1/6Xvdx80CQLfi09lkkZjKc97+W/QZaG76X+RMpShCCvu/Eo
	Uwdnr/04hb94nl7XxF44VoDt0Ca0JaQv3BjnFQvSlsiy1Y3GiXQtzewc
X-Gm-Gg: AR+sD10Gq//jfD68X444pNPSk5XQ+W0uqHmLshXXIIBO2IwpDVO8k+Aau2h2dYKY2mY
	GVnvjGPpgeaDa/Dbab+tvjpc3PUwPngcI+Z4xXwCWZRhJulV/Z7adj6K96HZ1sCB5p0MCDIRCLT
	9hPz/SrNm6kEaTU4bRYWcKykfdhoSac1pawOLshE2dUcx6RhgF6ZaAYBhGuJ33fLiTsaQvxMHTG
	pdeAEdIzFRyl2Rezx1YTT7JVHWEwve+oTbWM8Q3Onmv86n7ug4lK+FzJVcjZDj2MW2OPQ5wzENI
	wC9AwXL47s7tditlRIhkQbbdV9KJGRa2JdOuXeb1p639rTMQCDhhzPJzfMJvk9/B9V59IP21Oyy
	wLA6Hrba/ZLCSfl+vyIEduWFwMuCT+dv412Ad1SBS5k+WM/rpzm+QNSovZpz+fKvrpIjm0cK77Z
	qdTsVlSIMxuuwuvdzpriLCqMoLdz6SATtfi+CH+IeTZ+UUzoMeTgYWfVdywOxziAIiQuzACNwaF
	+BzOB5AqUFLZZZ3A91WNNwnr1Ji3BHelpcDqKJ+QwS/0/6Mae6uyMsuZNZ4j42z1HQkkJQLsPJH
	Apyn9KYxpb5RaYajgrbEjgqAnY+2Jzv7IPVYpKQZgbVJrWMOC+6ZjVapxsQF1KDYiHOF
X-Received: by 2002:a05:6000:41de:b0:482:a36c:a5e1 with SMTP id ffacd0b85a97d-482b1e875b8mr15751227f8f.1.1787179376510;
        Wed, 19 Aug 2026 15:42:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ae9e-1d01-58d3-443d-4fa6-01cd.310.pool.telefonica.de. [2a02:3100:ae9e:1d01:58d3:443d:4fa6:1cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1450e61sm8553317f8f.13.2026.08.19.15.42.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Aug 2026 15:42:55 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Eric Auger <eric.auger@redhat.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 0/5] KVM: arm64: fix VGICv3 redistributor rollback
Date: Thu, 20 Aug 2026 00:42:24 +0200
Message-Id: <20260819224229.82948-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A failed REDIST_REGION write can unregister redistributor iodevs while
leaving their cached vCPU assignments and free_index values intact. A retry
then skips those assignments and succeeds with redistributors missing from
the MMIO bus.

Patches 1 and 2 fix VGICv3 redistributor failure handling. Patch 3 cleans
up redistributor teardown. Patches 4 and 5 extend the KVM selftest
infrastructure and add regression coverage.

Patch 1 reserves the current vCPU's region slot before registering its
iodev and releases the assignment if registration fails. This keeps
free_index consistent with the cached assignments.

Patch 2 uses the same cleanup during redistributor unregistration, allowing
the existing rollback to reset the vCPUs processed before the failure.

Patch 3 unregisters redistributors before freeing their regions and removes
the region destructor's now-redundant vCPU scan. It is not required by the
first two patches.

Patch 4 lets the common VGIC setup helper select the guest entry point.

Patch 5 adds a regression test that rejects an overlapping region, retries
at a valid address, and then accesses all four redistributors. It exercises
the failed region update fixed by patch 2. The MMIO bus registration
failure handled by patch 1 is not fault-injected.

Testing: built the patched kernel and selftest in an arm64 Linux Docker
container with GCC 13.3.0. The selftest passed under QEMU 11.0.2 TCG with
-machine virt,virtualization=on,gic-version=3 and -cpu max. The same
selftest against the exact unpatched base failed with:

  Unexpected MMIO exit at 0x8030008

---
Changes since RFC:
- Reset all redistributor assignments after a failed region update.
- Split MMIO bus registration failure, region rollback, and teardown
  cleanup into separate patches.
- Split the selftest infrastructure change from the regression test and
  check all four redistributors after retry.
- Rebase onto the current kvmarm/next.

Previous version:
RFC: https://lore.kernel.org/r/cover.1786344511.git.kmehltretter@gmail.com

Karl Mehltretter (5):
  KVM: arm64: vgic-v3: Undo assignment on iodev registration failure
  KVM: arm64: vgic-v3: Reset assignments after failed region setup
  KVM: arm64: vgic-v3: Unregister redistributors before freeing regions
  KVM: arm64: selftests: Pass guest code to vm_gic_create_with_vcpus()
  KVM: arm64: selftests: Test VGICv3 redistributor region retry

 arch/arm64/kvm/vgic/vgic-init.c               |  11 +-
 arch/arm64/kvm/vgic/vgic-mmio-v3.c            |  33 ++---
 tools/testing/selftests/kvm/arm64/vgic_init.c | 117 ++++++++++++++++--
 3 files changed, 134 insertions(+), 27 deletions(-)


base-commit: 57e7cf13ac26bf1a3dba6cfa601f7b2481811575
-- 
2.39.5 (Apple Git-154)
