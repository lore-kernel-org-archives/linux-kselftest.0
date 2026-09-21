Received: from mta1.migadu.com (out-253.mta1.migadu.com [95.215.58.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EE93E451B
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985441; cv=none; b=f2v2zSHC97RTBFFs+iH5eMDLW3VA5IoQZ4kiFfI9es2DGPfiN9xr9x6aLJ3VV0dyPVI6AYayXELo/lLbua31JTTUcuBuQf2xUC0e9sonDiFcLBwahCTyzXAEHkwWbycy8BHjpcFXpEqtTse37J9S3VuzlDWkGRzZhJnjNT4hCUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985441; c=relaxed/simple;
	bh=0wCiBy6TA7ljCdnc/O5BU8FZQMg+0QDVGtb0Tw4ehTY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JAtC7Pk+7KlqPlNcVKJIWFGO7souG0MV2Ejc3tRxcGphs7k9iKxuKJelU1hi7SWd29gOmkL/UUN51Mccr6Ke2+ADkAu9fu2RAJsXuOQirQFTnJBk/a+K7V7E067kh+bLgzWCP3fjZkJUZJ/s/jEyUa2HPvTFgg0239BtA2afyVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=krvkOpOO; arc=none smtp.client-ip=95.215.58.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="krvkOpOO"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0wCiBy6TA7ljCdnc/O5BU8FZQMg+0QDVGtb0Tw4ehTY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789985436; v=1; x=1790590236;
 b=krvkOpOOg5Dih9DSA+TzV4al2eT4hzotQwWf6/3EEffKy0lmE8Ynlm+lxRZbS3UhwafT+86Y
 II57njlEek+KraNmC6EULSM1MrXzXUAQ9859RZKzB32I7VGAe32jDI+e+pOTiBn5KaJoaSHex48
 8J5MAXRtFhDMZaIzIEgmCwcs=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ded491277fcd8d98;
	Mon, 21 Sep 2026 10:10:36 +0000
X-Mizu-Trace-ID: ded491277fcd8d98
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 1/2] KVM: arm64: Sync HCR_EL2.VSE back to the host vCPU under pKVM
Date: Mon, 21 Sep 2026 11:10:29 +0100
Message-Id: <20260921101030.1231605-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260921101030.1231605-1-fuad.tabba@linux.dev>
References: <20260921101030.1231605-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

flush_hyp_vcpu() copies HCR_EL2.VSE from the host vCPU into the hyp
vCPU on every entry, and nothing copies it back. Once the guest takes
the vSError the hyp vCPU's copy clears with the hardware bit while the
host's stays set, so the next entry pends the same SError again,
KVM_GET_VCPU_EVENTS keeps reporting it, and kvm_arch_vcpu_runnable()
never lets the vCPU block in WFI.

Reflect VSE back on every exit, which the flush-side comment already
promises.

Fixes: 734dc8c01c838 ("KVM: arm64: Implement lazy vCPU state sync for non-protected guests")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 9a3b92e626adb..b6bfe502bcd04 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -276,6 +276,10 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	host_vcpu->arch.iflags		= hyp_vcpu->vcpu.arch.iflags;
 
+	/* Cleared by hardware once the guest takes the vSError. */
+	host_vcpu->arch.hcr_el2 &= ~HCR_VSE;
+	host_vcpu->arch.hcr_el2 |= hyp_vcpu->vcpu.arch.hcr_el2 & HCR_VSE;
+
 	sync_hyp_vgic_state(hyp_vcpu);
 }
 
-- 
2.39.5

