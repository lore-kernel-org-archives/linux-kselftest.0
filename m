Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.238
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214138;
	b=vnpWIvFY/bt4GI5zT0jA4+Ub4oaJ/5eXnz9RndfUEfofO//lrqlNDsuW01uVoUV+4iXm
	 lSiIBNHF0gOAiYGEcT+oWobmYqdOuWhMPY7tz5EpRQ3fqwinb/NM5zGs+mNDibp4CTeVs
	 wexMZils9K0F+f99BIFMW8GhO2SfQgDlCNeUQKWnThh0juqLsx9hlXQfysEvZxuv5kAGs
	 Rr3t+Din6xNuoeWgH+DuWUJFlJPWV7bbZORL0z9Xh0k9JUAZEqS/KLpgrdrKOg7ROQrG6
	 R41OkQ1lHAjRybv4qFWXPpCXBsCC1L/oCF5dtWCphPgY6wRBCoYZGY9yQqjICmeEQ1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214138;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9EDiuahpoC5a8fdBVjn+7UwWB1qVxtY459zTXN5uFBc=;
	b=2QV6F1yz/Tzg7INnSvprQzfXPIVM7EljUu1sX5ayyjh+zNDTac3kC3gtJMZ8UxQfkpef
	 ldcrW01RNflo6r4Hv8BWBsj2zkiznExw4GX54UOxchyk1hl42FsrR9/DojPOrO1d00oD0
	 oy1t71LVpiLCyQ9Z8FUAdufrJsxHOo7+7PhfEoo6i1LMhPQkM6+r+SOflwTgSeCQL3GvB
	 yVCzTTwMI2AdNc2V6lQ81n4eLPAyGl15S8kSHsLTxWYIXT94ssJtyKwaCEHlNeM3FqdTx
	 tiNdhvIiG4iscl7pQSq3U987yHgn4O+MbuO27apQg2MDIebgU/FKJ39zMZDLsNEkisA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aKniBgn2;
	arc=none smtp.remote-ip=91.218.175.238
Received: from mta0.migadu.com (out-238.mta0.migadu.com [91.218.175.238])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E463E606A326
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 08:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E463E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aKniBgn2
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zpKaD0TgIJfqXkuMLyaymhMm6AH9D97hWArAafrSB6U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794214136; v=1; x=1794818936;
 b=aKniBgn25IHI6/+paezktja3kzUe2XHYTbZvR+c/c7IlRhOWL6NzzF3m11fb8KQs/r5okijz
 /HUM78yf3sesqRmdI2T9Ze8vyBoxAkGO0SMDUqxoZWloB6hglXKhuB9wlHE1fyeWgZUyqlOV3x1
 R8V3eI0h2bytT8Y8YlFyZWJ8=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9a819a32ecff5883;
	Mon, 09 Nov 2026 08:48:55 +0000
X-Mizu-Trace-ID: 9a819a32ecff5883
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/19] KVM: arm64: Hide generic ptrauth from protected VMs without ptrauth
Date: Mon,  9 Nov 2026 08:48:36 +0000
Message-ID: <20261109084854.840576-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109084854.840576-1-fuad.tabba@linux.dev>
References: <20261109084854.840576-1-fuad.tabba@linux.dev>
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

A protected VM without the ptrauth vCPU features shouldn't have pointer
authentication in its ID registers. Commit 3d7ff00700d1 ("KVM: arm64:
Rework specifying restricted features for protected VMs") gated APA,
API, APA3 and GPA3 on vm_has_ptrauth(), but left GPA and GPI capped
at IMP. So generic authentication is advertised to a protected guest
without ptrauth, and PACGA UNDEFs.

Gate GPA and GPI on vm_has_ptrauth() too.

Fixes: 3d7ff00700d1 ("KVM: arm64: Rework specifying restricted features for protected VMs")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 32e82653ebf7e..e5502d5651b05 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -157,8 +157,8 @@ static const struct pvm_ftr_bits pvmid_aa64isar1[] = {
 	MAX_FEAT(ID_AA64ISAR1_EL1, JSCVT, IMP),
 	MAX_FEAT(ID_AA64ISAR1_EL1, FCMA, IMP),
 	MAX_FEAT(ID_AA64ISAR1_EL1, LRCPC, LRCPC3),
-	MAX_FEAT(ID_AA64ISAR1_EL1, GPA, IMP),
-	MAX_FEAT(ID_AA64ISAR1_EL1, GPI, IMP),
+	MAX_FEAT_FUNC(ID_AA64ISAR1_EL1, GPA, IMP, vm_has_ptrauth),
+	MAX_FEAT_FUNC(ID_AA64ISAR1_EL1, GPI, IMP, vm_has_ptrauth),
 	MAX_FEAT(ID_AA64ISAR1_EL1, FRINTTS, IMP),
 	MAX_FEAT(ID_AA64ISAR1_EL1, SB, IMP),
 	MAX_FEAT(ID_AA64ISAR1_EL1, SPECRES, COSP_RCTX),
-- 
2.47.3

