Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82101FBEA6;
	Sun,  8 Mar 2026 02:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772937514; cv=none; b=KaI3sGorY9xORpC0mQQ+3RRmI0Vun2tbRxFdWAHsJfkKwKaP3mTYF+NkLf8ixYqwvGJq74EqSil8FZqPAn+YqeqTgRerxhiOkxwGODNwMzdcaqcVRX5OJH1lAAUK1b+344JNsx5d0cFcV4MfkSH91rV9NY45VP8/HsQyTkQzqKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772937514; c=relaxed/simple;
	bh=o2loc5+704D9gLeZUeKDWkSQBYR0+cm51p5G297Xjsg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q7ASAsJSVUCGP1RCFu+isHu+C/g8TLM1vowLv9pdm82NEEwhMaCaZWz0lD9GsNGNerzk4GIghCwVl5lDu9VPLdkFS2K942nGoR9Ybj3uaesitrCQlWuO3mO68kcjVcbcaq0mO44yHzrmcWvSBNB10CKRJd/YdjmzNRIL1q5Z3Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fric.. (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowABnht0M4axptjIICg--.61997S4;
	Sun, 08 Mar 2026 10:38:07 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH v2 2/2] RISC-V: KVM: selftests: Fix firmware counter read in sbi_pmu_test
Date: Sun,  8 Mar 2026 02:38:03 +0000
Message-Id: <20260308023803.4001232-3-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260308023803.4001232-1-xujiakai2025@iscas.ac.cn>
References: <20260308023803.4001232-1-xujiakai2025@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABnht0M4axptjIICg--.61997S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGw4ftFW7ZFWkXFWDZF1DWrg_yoW5uw15pF
	W8JFZIyryrtFnFyFy3Aw1DWr1UXan3Zay8GrW7Gryjyr4UZryfXrsIgF9Fyan8CFZ5W343
	uw1Iga1rCF4DJaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
	nxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4
	CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I
	1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOzV1UUUUU
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBwkACWmsPtixNQAAsg

The current sbi_pmu_test attempts to read firmware counters without
configuring them first with SBI_EXT_PMU_COUNTER_CFG_MATCH.

Previously this did not fail because KVM incorrectly allowed the read
and accessed fw_event[] with an out-of-bounds index when the counter
was unconfigured. After fixing that bug, the read now correctly returns
SBI_ERR_INVALID_PARAM, causing the selftest to fail.

Update the test to configure a firmware event before reading the
counter. Also add a negative test to ensure that attempting to read an
unconfigured firmware counter fails gracefully.

Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
 .../testing/selftests/kvm/include/riscv/sbi.h | 28 +++++++++++++++++++
 .../selftests/kvm/riscv/sbi_pmu_test.c        | 16 ++++++++++-
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/riscv/sbi.h b/tools/testing/selftests/kvm/include/riscv/sbi.h
index 046b432ae896..8c172422f386 100644
--- a/tools/testing/selftests/kvm/include/riscv/sbi.h
+++ b/tools/testing/selftests/kvm/include/riscv/sbi.h
@@ -97,6 +97,34 @@ enum sbi_pmu_hw_generic_events_t {
 	SBI_PMU_HW_GENERAL_MAX,
 };
 
+enum sbi_pmu_fw_generic_events_t {
+	SBI_PMU_FW_MISALIGNED_LOAD	= 0,
+	SBI_PMU_FW_MISALIGNED_STORE	= 1,
+	SBI_PMU_FW_ACCESS_LOAD		= 2,
+	SBI_PMU_FW_ACCESS_STORE		= 3,
+	SBI_PMU_FW_ILLEGAL_INSN		= 4,
+	SBI_PMU_FW_SET_TIMER		= 5,
+	SBI_PMU_FW_IPI_SENT		= 6,
+	SBI_PMU_FW_IPI_RCVD		= 7,
+	SBI_PMU_FW_FENCE_I_SENT		= 8,
+	SBI_PMU_FW_FENCE_I_RCVD		= 9,
+	SBI_PMU_FW_SFENCE_VMA_SENT	= 10,
+	SBI_PMU_FW_SFENCE_VMA_RCVD	= 11,
+	SBI_PMU_FW_SFENCE_VMA_ASID_SENT	= 12,
+	SBI_PMU_FW_SFENCE_VMA_ASID_RCVD	= 13,
+
+	SBI_PMU_FW_HFENCE_GVMA_SENT	= 14,
+	SBI_PMU_FW_HFENCE_GVMA_RCVD	= 15,
+	SBI_PMU_FW_HFENCE_GVMA_VMID_SENT = 16,
+	SBI_PMU_FW_HFENCE_GVMA_VMID_RCVD = 17,
+
+	SBI_PMU_FW_HFENCE_VVMA_SENT	= 18,
+	SBI_PMU_FW_HFENCE_VVMA_RCVD	= 19,
+	SBI_PMU_FW_HFENCE_VVMA_ASID_SENT = 20,
+	SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD = 21,
+	SBI_PMU_FW_MAX,
+};
+
 /* SBI PMU counter types */
 enum sbi_pmu_ctr_type {
 	SBI_PMU_CTR_TYPE_HW = 0x0,
diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 924a335d2262..9b7e28bec435 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -461,7 +461,21 @@ static void test_pmu_basic_sanity(void)
 			pmu_csr_read_num(ctrinfo.csr);
 			GUEST_ASSERT(illegal_handler_invoked);
 		} else if (ctrinfo.type == SBI_PMU_CTR_TYPE_FW) {
-			read_fw_counter(i, ctrinfo);
+			/* Read without configure should fail */
+			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
+					i, 0, 0, 0, 0, 0);
+			GUEST_ASSERT(ret.error == SBI_ERR_INVALID_PARAM);
+
+			/*
+			 * Try to configure with a common firmware event.
+			 * If configuration succeeds, verify we can read it.
+			 */
+			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH,
+					i, 1, 0, SBI_PMU_FW_ACCESS_LOAD, 0, 0);
+			if (ret.error == 0 &&
+				ret.value < RISCV_MAX_PMU_COUNTERS &&
+				(BIT(ret.value) & counter_mask_available))
+				read_fw_counter(i, ctrinfo);
 		}
 	}
 
-- 
2.34.1

