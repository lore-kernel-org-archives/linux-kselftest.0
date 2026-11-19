Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082131;
	b=gJUaCRF8U3sE+XDDGt73tsRS2lCRPKYQkUmdLiVaK+kZhXXx91eiGAVubRTxBgUBFbzq
	 1v5tUBCU8xOa7V9Mpk3YGoY6+nR6UTQ+QA50aafLflOKU+OH7YZvYtGxP53szog5mqgTB
	 IDc9JHbRA3UBraVcYt1cx/5oIZtbRoizA8Vjlzx4R2rORQp01OY9o7YEDIWozWNszETrL
	 DE09lBop2bR78lLoQ4J802tW8ky1CtbeuMH5PzyP6tCIHR1T4xlIiu6XFnIYtiLrteNPT
	 +xIiveh+bmj9m1C3tHwoDMQ24v8sKBBXlCbqCTB5XfXyWVul5q7ZFD1Vvj/nYZVS5kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082131;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=AxSC+w8x0YAa+WYP18l1ZPv/YFow1+6R8vR4hxYt+Bw=;
	b=XFZitNFn0zJIvAM1G0CH0PF6TTfCju/pUK+QyjSXOjk8CSpMP4KOm6yFOf5m9QCBRn50
	 FtMoVTbdXIQmJzmnI20Tn00TPyIvpxSpwdv3djTLPB71udiJkCFHKX9KTy9zlRzOl8l7C
	 3XVtYJma2939agyNMvEezBUksjpRlNUp1TQoCa4pSku1ukIZJu4JPYM5Af6DF1R+CnW8B
	 jwAx/zyjYrvxUi57XRKC35ftCvgCQ+ftUTgYCNURk02xyNsn+kyBtpWqcTU+VF2Ofugjy
	 SPL8Vk/XB47xNFk82QRTpNLvmCkquNDzGcbgVn6AKXgir+9TF7dWY4s9LLretRAO89A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tKQ+e8VU;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249DA606A335;
	Thu, 19 Nov 2026 09:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 249DA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tKQ+e8VU
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28F5B1575;
	Thu, 19 Nov 2026 01:55:26 -0800 (PST)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C47B63F882;
	Thu, 19 Nov 2026 01:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795082129; bh=XnvXsUW1gUuUzwBbY6mC1a/ISYdUqQlfMdRPPyf+7Wg=;
	h=From:Subject:Date:To:Cc:From;
	b=tKQ+e8VUbuWgfkDx6ru6jIval1/jR7JAZfOJiuTz3yv2IWpBPoD4au4HjJGxxC5a8
	 69u0NrknPInh9hz4V1RjaMChsSc/K1sm3uMMnkEQuN6fA4CjEet2cQUzJa79sROpqJ
	 N9+dW3kYN6Pg8AW/FwDR9crF8i7Igj0xOsJGpjwo=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Subject: [PATCH v2 0/2] Add test for atomic uaccess with permission overlay
Date: Thu, 19 Nov 2026 09:54:36 +0000
Message-Id: <20261119-poe_futex-v2-0-244c7a01f788@arm.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02N0QqCMBRAf0Xuc4vtUmv21H+ExDbvcoFONhVD/
 PecEfR44HDOAomipwTXYoFIk08+dBvgoQDb6O5JzNcbA3KU/Iyc9YEebhxoZmSNsogXqcoTbH4
 fyfl5b92rL6fRvMgOOZCNxqchxPc+m0T2fl3x150E40zUGpU0ypUGbzq2RxtaqNZ1/QBf+LZFs
 gAAAA==
X-Change-ID: 20260520-poe_futex-ecb8c2276894
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
 Linu Cherian <linu.cherian@arm.com>, Mark Brown <broonie@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795082127; l=2982;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=XnvXsUW1gUuUzwBbY6mC1a/ISYdUqQlfMdRPPyf+7Wg=;
 b=KzXi28O/LORXd1ZnBo5RRf+ai10+nAvgWThW6Ufdj9lweOHQhENbuK3911HITCreWAAeySeji
 XkqMNd4OCKmAOczY1/RA/G79vqnZ3jPnCv4e7kPzm0FhWlRrCLV1MjF
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=

POE is not currently enabled at EL1, but my series [1] protecting
page tables does exactly that, and it has revealed an interesting
issue.

Regular uaccess uses unprivileged loads/stores, which have overlays
applied and are checked against the user's POR_EL0 as intended (same
restrictions as when accessing memory from userspace). In some
cases, such as atomic operations when FEAT_LSUI isn't available, we
need to use privileged L/S with PAN disabled instead; overlays are
not applied in that case.

Once POE is enabled at EL1, we have to ensure that overlays are
still not applied to these accesses. Otherwise, they will be checked
against POR_EL1, which is completely invalid as kernel
pkeys/POIndices are unrelated to user pkeys.

If PIE is used, then we have to ensure that user memory types do not
have overlays applied in POR_EL1, as Sashiko reported [2] on an
earlier version of my series protecting page tables. Patch 1 tries
to preempt such errors by adding a comment. If PIE isn't available,
then... we're out of luck, as Sashiko reported later on [3]: we
cannot prevent overlays from being applied to user memory. We'll
most likely have to require PIE at least when POE is enabled at
EL1.

To avoid accidents in the future, patch 2 adds a kselftest to ensure
that atomic futex uaccess (which uses privileged loads/stores unless
FEAT_LSUI is available) does work on memory mapped with a
non-default pkey. 

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

[1] https://lore.kernel.org/r/20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com
[2] https://sashiko.dev/#/patchset/20260505-kpkeys-v7-0-20c0bdd97197%40arm.com?part=3
[3] https://lore.kernel.org/r/sashiko-outbox-207324@kernel.org

---
v1..v2:

* Reworded the cover letter and the commit message of patch 2 in
  light of Sashiko's new findings (when PIE isn't available).
* Rebased on v7.4-rc3

v1: https://lore.kernel.org/all/20260521-poe_futex-v1-0-1da286b8f9b2@arm.com/

---
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Linu Cherian <linu.cherian@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org

---
Kevin Brodsky (2):
      arm64: mm: Add note about overlays in PIE_EL1
      kselftest/arm64: Add test for atomic futex uaccess with POE

 arch/arm64/include/asm/pgtable-prot.h         |  7 +++
 tools/testing/selftests/arm64/Makefile        |  2 +-
 tools/testing/selftests/arm64/poe/.gitignore  |  2 +
 tools/testing/selftests/arm64/poe/Makefile    |  6 +++
 tools/testing/selftests/arm64/poe/poe_futex.c | 62 +++++++++++++++++++++++++++
 5 files changed, 78 insertions(+), 1 deletion(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20260520-poe_futex-ecb8c2276894

