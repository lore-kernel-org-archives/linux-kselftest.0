Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9C7C4332F
	for <linux-kselftest@archiver.kernel.org>; Fri,  9 Dec 2022 01:54:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbiLIByW (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 8 Dec 2022 20:54:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbiLIBx4 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 8 Dec 2022 20:53:56 -0500
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [IPv6:2001:41d0:1004:224b::ad])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A27AFCEE
        for <linux-kselftest@vger.kernel.org>; Thu,  8 Dec 2022 17:53:45 -0800 (PST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Oliver Upton <oliver.upton@linux.dev>
To:     Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        Ricardo Koller <ricarkol@google.com>,
        Sean Christopherson <seanjc@google.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] KVM: selftests: Allocate ucall pool from MEM_REGION_DATA
Date:   Fri,  9 Dec 2022 01:53:05 +0000
Message-Id: <20221209015307.1781352-7-oliver.upton@linux.dev>
In-Reply-To: <20221209015307.1781352-1-oliver.upton@linux.dev>
References: <20221209015307.1781352-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

MEM_REGION_TEST_DATA is meant to hold data explicitly used by a
selftest, not implicit allocations due to the selftests infrastructure.
Allocate the ucall pool from MEM_REGION_DATA much like the rest of the
selftests library allocations.

Reviewed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 tools/testing/selftests/kvm/lib/ucall_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/ucall_common.c b/tools/testing/selftests/kvm/lib/ucall_common.c
index 820ce6c82829..0cc0971ce60e 100644
--- a/tools/testing/selftests/kvm/lib/ucall_common.c
+++ b/tools/testing/selftests/kvm/lib/ucall_common.c
@@ -22,7 +22,7 @@ void ucall_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
 	vm_vaddr_t vaddr;
 	int i;
 
-	vaddr = vm_vaddr_alloc(vm, sizeof(*hdr), KVM_UTIL_MIN_VADDR);
+	vaddr = __vm_vaddr_alloc(vm, sizeof(*hdr), KVM_UTIL_MIN_VADDR, MEM_REGION_DATA);
 	hdr = (struct ucall_header *)addr_gva2hva(vm, vaddr);
 	memset(hdr, 0, sizeof(*hdr));
 
-- 
2.39.0.rc1.256.g54fd8350bd-goog

