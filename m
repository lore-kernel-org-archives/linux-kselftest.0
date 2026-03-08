Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82902BEFFF;
	Sun,  8 Mar 2026 02:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772937513; cv=none; b=HC6ixs4nmtXXVlJn9bFdM6ttENvEfQsl52U+9JusskiFx/9MH5NkxXJFCzlskYIqQCtos0vj4Xhf4NvrxRfeRrMMx/URSi5I2mOtSow+n7wo5bdJ7GZWVqCYHsro1bfJB9zHAqgwqrRX1pq2ItOUwaAX4YlAMM0/dn9yNW0KdHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772937513; c=relaxed/simple;
	bh=EpVQKr+amdFGHcTl33KTi2QxjI83B4Xn9xrYpbDZPKc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r6UrFgtg7JLps72qvaH2Phpnxv2qpVh71VyndKNWQwAuKSnWbQjwMyWEy2xqvUfzph9xyOifXVR7fCvzlvcShrdEYupEPP+eVocQK4h7NqL/RAoXXmQV8eUIPykh5enFkg8iESrq4uFrq8VqupEgCSBFVIVScdSRMYrUxLzRKGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fric.. (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowABnht0M4axptjIICg--.61997S2;
	Sun, 08 Mar 2026 10:38:05 +0800 (CST)
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
	Jiakai Xu <xujiakai2025@iscas.ac.cn>
Subject: [PATCH v2 0/2] RISC-V: KVM: Fix array out-of-bounds in firmware counter reads
Date: Sun,  8 Mar 2026 02:38:01 +0000
Message-Id: <20260308023803.4001232-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABnht0M4axptjIICg--.61997S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4fXw45Cry8Ar47tF4DXFb_yoW8Xr1rpF
	W3Ka4YkrykJrs7ta43A3ykJr15Xrs5Ca98Gry7Gr18Cr45ZryfXryDKwnxt3WrCrsYqw1j
	ya1Igas7CFy5Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOmhFUUUUU
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCQ4ACWmsPqmwfwAAsT

When a guest reads a firmware PMU counter via
SBI_EXT_PMU_COUNTER_FW_READ or SBI_EXT_PMU_COUNTER_FW_READ_HI without
first configuring it with SBI_EXT_PMU_COUNTER_CFG_MATCH, the counter's
event_idx remains SBI_PMU_EVENT_IDX_INVALID (0xFFFFFFFF).

get_event_code() extracts the lower 16 bits from event_idx, yielding
0xFFFF, which is then used to index into kvpmu->fw_event[]. Since the
fw_event array only contains RISCV_KVM_MAX_FW_CTRS entries, this results
in an out-of-bounds access that can be detected by UBSAN.

Patch 1 fixes the issue by validating the firmware event code before
accessing the fw_event array and returning -EINVAL for invalid values.

After fixing the kernel behavior, the existing KVM selftest
(sbi_pmu_test) fails because it attempts to read firmware counters
without configuring them first. Patch 2 updates the selftest to
configure a firmware event before reading the counter and adds a
negative test to ensure that reading an unconfigured firmware counter
fails gracefully.

Jiakai Xu (2):
  RISC-V: KVM: Fix array out-of-bounds in pmu_ctr_read() and
    pmu_fw_ctr_read_hi()
  RISC-V: KVM: selftests: Fix firmware counter read in sbi_pmu_test

 arch/riscv/kvm/vcpu_pmu.c                     |  4 +++
 .../testing/selftests/kvm/include/riscv/sbi.h | 28 +++++++++++++++++++
 .../selftests/kvm/riscv/sbi_pmu_test.c        | 16 ++++++++++-
 3 files changed, 47 insertions(+), 1 deletion(-)

-- 
2.34.1

