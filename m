Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782146;
	b=silffe8ycquIhgdODyf+x7iSA5rpdUqPi2EtWNSnEeJcsYlq39/Fy5b+LOozvWjsFSXE
	 nKBq+buzfxeHppdVMm82DMrSSBdA4pA5MUesslRTjZp4DuDrqoiT3eDYkXjSwLaeBepfd
	 ljy0Mfx2RNbJGQxuuBbG51JAsI8cd5ViKxlGJDtHNv48XmaHWYFpU76vdxdVBMwDbUdRf
	 4uMd/muNguhx9qBoDKI9NkNr55xWW1et4biRqYgeusj3hwC/xTlWDYXep6oo4aPfUvBPA
	 tzFt3wB5et1EH384aiBc4cKgZuebLPulBKmQssvyvOX1tmZ+H+khUqzwi5As5ZaOPxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782146;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AfXeCeneHqNmuixn/C9DCjk2UEGT5HCCQsR07Fy0vVk=;
	b=UemGIEVm2AiCaaZ7fDnf+VKqHfH63O8b5lus1SmYlJm5qa/Z031WiAUI6y08G++dpktl
	 ASGfCpTbusyaADkFFjitfGcEMFWzpjBcyEBgg6ns91OrQHia7bMisMMgQlfVDNNUrLXBK
	 Qz5r2HFs9DhoVndaMXkpHwhQxqiF/uxzrzGfx+YickymFtyk44wF2hTmQgBsyDcqWttv7
	 X97TL8edm/y3GJ9RhZJiZKB627mXe2WynSnjTGUL/pYjgD5J6KFaWKQT9noWu0NSe+bnr
	 413xjy9oOBSHGtKJ5q63qsiemFgRwqAF1pvp7dTnSDTeVvmj6iPo2JnB8cQexz3Jf1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Em0M3UeR;
	arc=none smtp.remote-ip=91.218.175.233
Received: from mta0.migadu.com (out-233.mta0.migadu.com [91.218.175.233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EB3606A337
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 08:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9EB3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Em0M3UeR
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RoNzd28AyvTb0ibr+4xItgKDPl/EqyvaBO8VS7dD1Vo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793782144; v=1; x=1794386944;
 b=Em0M3UeRUiqmI2xQO3AQX1AGIwL2MPPAwGlOAOWn0npDGHjxDWRsJxi8mWK6g98roh4BQCwt
 6YxVuA7Nw+goPeU/kVOs9oOg+M67WANy/LV5el/xHONsp06ubrvvkD52jYQuEow0w7fcrujoC2K
 x7pHogqI/o0p9jOvaa8JhxXU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0936b15fc4cf6f51;
	Wed, 04 Nov 2026 08:49:03 +0000
X-Mizu-Trace-ID: 0936b15fc4cf6f51
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
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
Subject: [PATCH 04/16] KVM: selftests: Export the ucall pool's guest physical address
Date: Wed,  4 Nov 2026 08:48:30 +0000
Message-ID: <20261104084842.132944-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104084842.132944-1-fuad.tabba@linux.dev>
References: <20261104084842.132944-1-fuad.tabba@linux.dev>
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

A protected guest's memory is private until the guest itself shares it,
so the guest has to share the ucall pool before its first ucall. The
host can't do that for it. Only the guest's copy of ucall_pool holds the
pool's address.

Add get_ucall_pool_gpa(), which reads that copy, so that the host can
pass the address to the guest.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/include/ucall_common.h | 1 +
 tools/testing/selftests/kvm/lib/ucall_common.c     | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/ucall_common.h b/tools/testing/selftests/kvm/include/ucall_common.h
index cbdcb0a50c4f9..3a6cdf9aa0464 100644
--- a/tools/testing/selftests/kvm/include/ucall_common.h
+++ b/tools/testing/selftests/kvm/include/ucall_common.h
@@ -41,6 +41,7 @@ __printf(5, 6) void ucall_assert(u64 cmd, const char *exp,
 u64 get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc);
 void ucall_init(struct kvm_vm *vm, gpa_t mmio_gpa);
 int ucall_nr_pages_required(u64 page_size);
+gpa_t get_ucall_pool_gpa(struct kvm_vm *vm);
 
 /*
  * Perform userspace call without any associated data.  This bare call avoids
diff --git a/tools/testing/selftests/kvm/lib/ucall_common.c b/tools/testing/selftests/kvm/lib/ucall_common.c
index 029ce21f9f2fa..aa1f0f92c6d1d 100644
--- a/tools/testing/selftests/kvm/lib/ucall_common.c
+++ b/tools/testing/selftests/kvm/lib/ucall_common.c
@@ -21,10 +21,17 @@ int ucall_nr_pages_required(u64 page_size)
 
 /*
  * ucall_pool holds per-VM values (global data is duplicated by each VM), it
- * must not be accessed from host code.
+ * must not be accessed from host code. The host reads only a VM's copy.
  */
 static struct ucall_header *ucall_pool;
 
+gpa_t get_ucall_pool_gpa(struct kvm_vm *vm)
+{
+	struct ucall_header **pool = addr_gva2hva(vm, (gva_t)&ucall_pool);
+
+	return addr_gva2gpa(vm, (gva_t)*pool);
+}
+
 void ucall_init(struct kvm_vm *vm, gpa_t mmio_gpa)
 {
 	struct ucall_header *hdr;
-- 
2.47.3

