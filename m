Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFADA3E49D4
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 22:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787179385; cv=none; b=YeQf/wf57ju8GaVpShspYjqse0oruF+RmZat/4oucMzg0STeCaZHRxoJfRQsAyjwcPvQixKbD2gDUIWnIASqGON3K5xmvsJ/Jdq6Bb1wwc6omouoPIihPFT6Iu3U+7LIiNX8Gugc7+bdPZ4CKGmUQL25SutMXOsZBwXdFKtLQjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787179385; c=relaxed/simple;
	bh=QtGuQD6Y9WhA9fpXpeTIYaXrx/WTjnsW3HXx6vlkPTo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rs3RnThGi72RsmCtDKZDv3+NpM2pOzV/oD24wc4nybsWOIRa54vntQkph2krpKYTs8SLMAcGG34/33cjuJqmvTJ8c/JM8SDxRx0+EzFW47x8RAY8h37sZiEswxgaIn1l7Ak9BbxFSa8prah5DP8Ezd9/mm7EiO+jbn58yAbw5Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Am3jUH3Q; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Am3jUH3Q"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso643860f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 15:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787179380; x=1787784180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=spw3TDdOtLdIsF7CwDxVZdY48WpWL2JF0u4UNC1DfkY=;
        b=Am3jUH3Q7uX+XXOvvOpJzN6Ns7bzhlhjo7G0CR4+5JhsgXdIdkrBQonQEwO5UAzHGX
         5GO91JIC8KmHVPTOaK3dJscLj3UlAo/HFuUpr0qSxjGwfJvNwic0FbTc63JsCRozLri+
         TamJiPy3qkH7UaWNdkO8fXzwfyrBT3Y7eX2C2Lvp0csvN8utyDgjeNEh5iFdE3+18T7J
         V5w6A3/HiXUgEWkDzkU2VjJx3MmhvdVI7wzCs/usNXeGinZmcOujhMUn3XlFC7n/cvxl
         sO3JbGUnJLJpo+bsg0IFLsxNhNh0MPfkn8SL7q0obM/K3jTyQXfBkVl5RKxhZEjkVaB9
         K1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787179380; x=1787784180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=spw3TDdOtLdIsF7CwDxVZdY48WpWL2JF0u4UNC1DfkY=;
        b=jNlh81rbud+D5rAl4O5E9hCMIR2iqNamHiTDzSItoEBXZ2slArKlw1cGbp8yiytsyr
         X79xfBhHVsKXWE1rH4wHiQWJoG1AoVccD38qrFToTad9w/CiyPSx0bmIk82nnFQQ5Idz
         TAKknaadAsSl6c0s7jrNnUG7NNJObuflQiFfzcGsGPs0NSd81Id8YQqiaPmrv5Ek8dpC
         Re3oYysEGw6TWiyt9+fbwT+cpOGLTVpvd12cL0CFtQm+ZcGSTbGk9rd2e0CqfFRYEfbs
         ztzb8iLRrPhAMNGU8CJy+0xcXW3T0LVnRHUdpzcnXl4V0G/BlJ4MjtscnDcFb3nQD8ZL
         Ge4A==
X-Forwarded-Encrypted: i=1; AHgh+RowXpXV121LB5l9Iwse6ds2TCetoQSaUa08/mlr0jgCqnCqDmy2WdlyC/yUyaAYsv3yTjfcOttf83XHvyPw7xY=@vger.kernel.org
X-Gm-Message-State: AFuF++mWVZg6nPOYtGMBVvN4rosik9eFGmaNS6MGfijxjqPYiwDmv7QG
	X2oYuSwXCHnBm62HQ3p08fSKoABka828uArq78XSg7Z3wKEq+ThfF8LW
X-Gm-Gg: AR+sD13kPEyxtr/mMSq/BANScp6aV0e7Nid0lfdmSfkcSzlIxxzRd0qZIiRy9IZUVAn
	z/bXmpOOD9cvhEdJEBGyE8sKu3Lvjtai1au/Jv+1ZldmQb2JEH7XjshUtE+B0TeUnNMlq91NizV
	R3KxraNxEBGmkwfIyYyqbG/PosChPMR6dzA4NWnvZw8HaAg0rTumlBwq8THAavmBiztjC5Rq74L
	4m1NnsRifOG6JL8OcjGBg/iFFi5a97O0uStqO41WhIGrz0MzMH7YVWDkHD+m0mtkL8p9BpWnBIu
	YJC7FXr04zQPo+LTKRbLPQIxfFqmm9HejUQq1WizNIZGRMd31TELW3mifH2a14rYl7EScUWhfw1
	5IptZ/7JRpUUHDXRSK5vT+SGr35S2o7Wk47irCAYfDq5cEcKqWd1ZHUZYs0mZos3V7DZgJQfL/0
	szdkvLAhq+0zDqNJYkgoyxt6w0f5/MjQx4LcNMaB+z1mroXnf3XeLLPCbVZOWPlL8qgnNomS6DM
	yJatfNakBpikNhpOV+noZ6Wev9NDdqa3EQh23VhKVMlivpIQwuWLxHn43c6QCCFYJkKto8iqB7j
	hsyHdoaDUOZnohDHHarZ/xB7iLawWfamfWJXTvMquikH9uaepS7wf75Ljrd2zLyMRD0=
X-Received: by 2002:a05:6000:27cc:20b0:482:bb55:8bdc with SMTP id ffacd0b85a97d-482bb558d7fmr23879f8f.1.1787179380523;
        Wed, 19 Aug 2026 15:43:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ae9e-1d01-58d3-443d-4fa6-01cd.310.pool.telefonica.de. [2a02:3100:ae9e:1d01:58d3:443d:4fa6:1cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1450e61sm8553317f8f.13.2026.08.19.15.42.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Aug 2026 15:43:00 -0700 (PDT)
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
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/5] KVM: arm64: vgic-v3: Undo assignment on iodev registration failure
Date: Thu, 20 Aug 2026 00:42:25 +0200
Message-Id: <20260819224229.82948-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260819224229.82948-1-kmehltretter@gmail.com>
References: <20260819224229.82948-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vgic_register_redist_iodev() assigns a redistributor region and base
address to the vCPU before adding its iodev to the MMIO bus. However, the
region's free_index is advanced only after registration succeeds.

If kvm_io_bus_register_dev() fails, the vCPU retains the assignment while
free_index still identifies the same slot as free. A later registration can
therefore reuse a slot that remains assigned to the vCPU.

Advance free_index when assigning the slot. On registration failure, return
the slot and clear rdreg and base_addr.

Fixes: dbd9733ab674 ("KVM: arm/arm64: Replace the single rdist region by a list")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 5913a20d8301..c75caadbd1d3 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -766,6 +766,18 @@ unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *dev)
 	return SZ_64K;
 }
 
+static void vgic_unassign_redist_iodev(struct kvm_vcpu *vcpu)
+{
+	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
+
+	guard(mutex)(&vcpu->kvm->arch.config_lock);
+	if (vgic_cpu->rdreg) {
+		vgic_cpu->rdreg->free_index--;
+		vgic_cpu->rdreg = NULL;
+	}
+	vgic_cpu->rd_iodev.base_addr = VGIC_ADDR_UNDEF;
+}
+
 /**
  * vgic_register_redist_iodev - register a single redist iodev
  * @vcpu:    The VCPU to which the redistributor belongs
@@ -818,16 +830,17 @@ int vgic_register_redist_iodev(struct kvm_vcpu *vcpu)
 	rd_dev->nr_regions = ARRAY_SIZE(vgic_v3_rd_registers);
 	rd_dev->redist_vcpu = vcpu;
 
+	/* Protected by slots_lock */
+	rdreg->free_index++;
+
 	mutex_unlock(&kvm->arch.config_lock);
 
 	ret = kvm_io_bus_register_dev(kvm, KVM_MMIO_BUS, rd_base,
 				      2 * SZ_64K, &rd_dev->dev);
 	if (ret)
-		return ret;
+		vgic_unassign_redist_iodev(vcpu);
 
-	/* Protected by slots_lock */
-	rdreg->free_index++;
-	return 0;
+	return ret;
 
 out_unlock:
 	mutex_unlock(&kvm->arch.config_lock);
-- 
2.39.5 (Apple Git-154)
