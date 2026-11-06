Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949316;
	b=qundATqjCM8RygDr2sHD8mXacRdvexeqNPVKasBvVoPDN/5UrFq/JDPj5b7MUZ6KdwAE
	 bRLlLTm6wO9L8qaeRWZN4lxTIT7igSv8jcSbn4Jl9nxotmdAJLZV1ExohJDBDHREyyGP8
	 +Se/rytbn1peVau3C5ZjQ/BX+cqVYpBEaS1hWIzjEeB+475MpUhA0k9WX83hxS+2c9JEo
	 RAXcaIRva+5qulgc9H7GrAiMQgmJHRBG+0Vi5inFOAHWWLJpomhRWR63ZZ4emVNyYgl9Q
	 +EYmLnn9UbIHA+8BtzG+NVcEuHhVoUVRzRO/au4pnsvd7t5FRI++SGnqfTlMdPF5gvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949316;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jJG+oWzeBiYTOj3RU2JHcsvV/qqXp37vXx+hYTPpTbg=;
	b=DdLfKrfj48exAespxHPcJNoiyTylMRbcOhKYRL3X/GJuufz8naQM69xjGBbIMfAnpBzZ
	 xRfKQhQyCf3l/UmDIMfPjNRcHf6ly9Gb5z4kwND+XWsd5waF3XGowzF+q9GfXLI01lfp4
	 4m6NLlAxC6R3CX+LC9ywqjyPxZmpJZA/C/ev3Ua3wQ52NoF+lAjtOq4DoCovZdbo+9gJo
	 +mTHq4lSoKckq8xVikLL/aiulw6cJj7+ZIPNM8lZR9RbO13k3IFrJzHKfFq79Z9CLI2Jk
	 Kwxj9j/+eRJxNv9Q+gjPMatVRlW2cSXNdUG5iet5+VVaM0uQllOANQFDzchNOie67oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=kyWtLpC+;
	arc=none smtp.remote-ip=115.124.30.118
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C745606A335;
	Fri,  6 Nov 2026 07:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C745606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=kyWtLpC+
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793949305; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=jJG+oWzeBiYTOj3RU2JHcsvV/qqXp37vXx+hYTPpTbg=;
	b=kyWtLpC++GGMYwZOyrC80s33E13MFo8+fwxj+sja6iO3A7zAzooPvb9xGOK9s7hrVyd9jHlwD7T09Bnb+LW9g97wrbFK0iYL7Tx3jyQEmZOs+i0/B7wt3zQIaH4QxZi9mBDkFuggJhZhRRjF35Bit6gGwD3NFymttSsNHYOA12s=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XEAtjN9_1793949304;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XEAtjN9_1793949304 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 15:15:05 +0800
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
Subject: [PATCH v3 2/4] riscv: Add support for kexec handover (KHO)
Date: Fri,  6 Nov 2026 15:14:57 +0800
Message-ID: <20261106071459.2003-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106071459.2003-1-cp0613@linux.alibaba.com>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com>
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

The generic handover paths are already in place on RISC-V: the outgoing
kernel publishes the handover FDT and the bootmem list in /chosen of the
DTB built by of_kexec_alloc_and_setup_fdt(), and the incoming kernel
picks both up while scanning that node. Only the architecture symbol is
missing.

Set it to 64BIT && MMU: ARCH_SUPPORTS_KEXEC_FILE is already 64BIT only,
and KEXEC_HANDOVER selects CMA, which depends on MMU.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 arch/riscv/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bde1f1885038..bffef6b903e1 100644
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

