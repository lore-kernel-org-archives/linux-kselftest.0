Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792754187;
	b=UZYrh/ZVw4VmfIxiarf4F1sBk9cZK+zK1pKnaDZvLVfexGIECxvW1kNHkvOZFWTmSje9
	 Clt3j8Nduip1m/OoJSxRXBGupnAKPFTWbnpJY6H5DwaUopfTYqB/k8eZLFZywOZ4AwQDl
	 OrgxYNOnH6wOivMlNKodusm3bnq3mQZ8MOTz6Jdtxq+4G0qCu2GBE2GtsyHcSH0gSLWNN
	 Nc5EQE4zwdZ5ABW10aMOitg8Lq9Hw1wbs9n6kztRwzb60ojlnT05pjf9W8azCrZktL1JN
	 C6Py2OEjOzjXbH/KhIIdKixuTkf/6d/NLuDwFT1w4tfU7n7Xaa15qpGkBeQTHob3m7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792754187;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PGqMJHk6LUVuJtb9sOmDDL50VOC0Sssl6rxAA31XIdA=;
	b=Y0pV6BAVOLV7DwHZJO74CTlDmuJ8TP7JcQsf0balRzwtYbWCAjXe3IcT/5h38BzGRxl5
	 xdO/TNGIw69UCcrtGTtG9fAqjOh+EoVJqV8BtxYQ3EyIEByFSSYHvSPLdmu0rmla4S+l1
	 hnZ6yvVuc3vgZT8KeOF+r3rfHeK++sH1F70IK/q8nEq14k2cmbDom8Cq5slcdINAmN30H
	 vrIOecQ8s0oClbVCmmHHJDD+hONb+XCO6yKKrITxQJEcNTclkITeUiQ0XemQJr2OCXn3/
	 mCcapUldpR3zSznvek4YVbIrF0rI9B3qWovTti3QJxAci3MAt3G6kV2OH3AfcB4jKrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=l3Zp4gkU;
	arc=none smtp.remote-ip=115.124.30.124
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF181606A31B;
	Fri, 23 Oct 2026 11:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF181606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=l3Zp4gkU
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792754183; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=PGqMJHk6LUVuJtb9sOmDDL50VOC0Sssl6rxAA31XIdA=;
	b=l3Zp4gkUxMeF3lIIPkCM/jGo5ZCCHJlORzXBc3zlZXSzIk8WuaFNHU5fYnEZHyrRHvpHPy657kgOr3cj0Dc45kIg85+jAQz97TjgWJ2pmybPVzPXU8GcrlH6Vj7DqoKah12F/wx5X6PjlguSPD66PmnGg2yWuRQYiptY3DD2ryM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XDM1n5k_1792754182;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XDM1n5k_1792754182 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 23 Oct 2026 19:16:22 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	graf@amazon.com,
	shuah@kernel.org
Cc: guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	kexec@lists.infradead.org
Subject: [PATCH 2/4] riscv: Add support for kexec handover (KHO)
Date: Fri, 23 Oct 2026 19:16:10 +0800
Message-ID: <20261023111612.2134-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023111612.2134-1-cp0613@linux.alibaba.com>
References: <20261023111612.2134-1-cp0613@linux.alibaba.com>
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

KHO is architecture independent: the outgoing kernel publishes the
handover FDT and the scratch descriptor array in the /chosen node of
the DTB it builds for the incoming kernel (kho_add_chosen(), reached
from of_kexec_alloc_and_setup_fdt()), and the incoming kernel picks
both up while scanning that node (early_init_dt_check_kho() ->
kho_populate()).

RISC-V already builds that DTB in load_extra_segments() and passes it
to the incoming kernel in a1, so only the architecture symbol is
missing.  Depend on 64BIT to match ARCH_SUPPORTS_KEXEC_FILE, and on
MMU because KEXEC_HANDOVER selects CMA, which depends on MMU.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 arch/riscv/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5874ca30f4f6..4f7d2f3f80b1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1125,6 +1125,9 @@ config ARCH_SELECTS_KEXEC_FILE
 config ARCH_SUPPORTS_KEXEC_PURGATORY
 	def_bool ARCH_SUPPORTS_KEXEC_FILE
 
+config ARCH_SUPPORTS_KEXEC_HANDOVER
+	def_bool 64BIT && MMU
+
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
-- 
2.50.1

