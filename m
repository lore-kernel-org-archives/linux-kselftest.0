Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693392;
	b=K5r6HZe3wY48ztn13b7PWjHMSaPZ3I9gpnXv6+D+mCmhHLSfEvqk56Bs/QuYwaExSQi0
	 E8YiGSUvHjFjFtjGivWUXkRVjP9q0QU2cnxiBICPGIjDnml5MtKAlgS7B0YF1Qf+HSHxo
	 etYcOo6O//xZFO2qaHQztrog7GijVY4hw3DjxPhJ6Kgsv49vSYYEgUkWhMrJBL0AhRDIu
	 BT4adWCJj7NE0Su/SWk8ez1PQVFUhUBov943XZLbvoC87jNXTpxMDMX65rA1JAvhI6x+y
	 TjWTO7jmkAeiK1rsWgZUM9qw/PjuZ3NnDTBWElqVGlfb/TUZaT6si13zfN7Ax11kaMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693392;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zf6qC7Z68PAfi/g1Lq1I7GPVQN/ADTRNm3/p9ryG3Ic=;
	b=yzOjXfzJLa5eQox/NPnha9snDbWJW9i4RYK0I+aFYGhp5UVFVAuc9MIbcOdFxkbGgkLs
	 eRij79W769cgdgN6caUV2lWDzox4gvzwv4wJU/odCidX4AR8Xj7o6I4CCY2SB+TVD1ndi
	 BJNVVHJ+V+2OgqK+rgjGtxdPfS8XIZ6xAToMtwnioK9sohQFpJtKPRkqDOZaSdSalgefs
	 2Yw+IWn7sRDC2ePqctBxclDYNTWlFU7aPODwtaKRn4EqW7hsYlarJ+q4o17i3NBmD5z+q
	 /d697+4mfojFlA30Ya41LSImtKFu9opST++cclxVWiOG7HNtaq96snQNa7aCr5J+QaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=BxTAX8VR;
	arc=none smtp.remote-ip=115.124.30.133
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFB4606A329;
	Tue,  3 Nov 2026 08:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFFB4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=BxTAX8VR
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793693383; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=zf6qC7Z68PAfi/g1Lq1I7GPVQN/ADTRNm3/p9ryG3Ic=;
	b=BxTAX8VRtOhWPBzgGjv2raOsIG1CdVFV/Wn+gpsAafgN4CaNxyvOygIqCVReS/hByyiLC5wojvtdu8mdCy4ogC/UGBWUTPmcLtAT8VvDT9LzY1we8ZgAOwOTlxenMPFkvdk9h5y2Z6XJ+MHGD+X5KRGeqh12RqAALHVEl+oitSE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R251e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XE27L0Y_1793693381;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XE27L0Y_1793693381 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 16:09:42 +0800
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
Subject: [PATCH v2 3/5] riscv: Add support for kexec handover (KHO)
Date: Tue,  3 Nov 2026 16:09:24 +0800
Message-ID: <20261103080926.2079-4-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103080926.2079-1-cp0613@linux.alibaba.com>
References: <20261103080926.2079-1-cp0613@linux.alibaba.com>
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
index 435da0713243..e11463a923a3 100644
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

