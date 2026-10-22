Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792652932;
	b=hhLr8HXuLbII8hsn8p9sZsSM8EarCok3wYLbUruHLPznelLkhaortz8PUEoZbbZBNdtv
	 4CWIN1tr60UuKiO5siyx2VXF1dY34AChFKvdSp8Tc+mHHwUQXlgT4z/mWxa4m5EFqFpht
	 QzpDDUVU1RcA9AXFuvPSBiobWv4u93LaBVwEa07++2SrKUSz3kl/c8sQMuePe6xfr4a0n
	 nRAtSnyBRL6xby8+gzFkGiAFnb3OYoc1nx8tLB1eF+aXVs2sXvtz0ud5uz1WJNjXzBqTJ
	 VHoRjlI+Rjk63EMkcVbVkVLs+19A8HzF8/W9sko/9pO5d7IXYW8roZNpjfrfTPkQWMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792652932;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=KcS3uuJ2aUxEQ7xZoI70yenV90PwGHNj1xxTD8qG/FM=;
	b=YO/oJQVakgcBe6TSNRZWiWmPU3Aoe60yky150+3yiuPMTViYni8QSWAm5xrfdJrGPGOq
	 E6US9uLRXb2KtVDzwol80jCyM8GpJIRyP3TeGbxzPCngT1Vilim5sqAv8xbZdrNoROKqz
	 3vbPMfO6MNbE97tQpDzlRyjWSEMGjBslYbFfOsrNz8UWRQBoM+fULUAJW24qzPeat6a0J
	 9l9dTw/KIN/duN+Loczmxi+BiM1cvylUuEibEqRJN3UQoi6PRY1HcVKeT7RtJN+1LBD5b
	 L3YLYpuAIQA1autS+Ca/VWqLX8TRGUhporcIo8jT7ZGkLixHxJ6juN5YTN9veg0ahGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UGq1LVk5;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9413606A319;
	Thu, 22 Oct 2026 07:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9413606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UGq1LVk5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Kc
	S3uuJ2aUxEQ7xZoI70yenV90PwGHNj1xxTD8qG/FM=; b=UGq1LVk5QcMugP7u6v
	wY76UERXMcJFLAEozzv6QGymtxLkk/xYeycUBpNJ6cpFgzvmAl8b96BCvpKuJCg3
	IHx98UGz+5ndMI8oncDHDFDJpEza4tvYKz7VPpKabWQ3icUNolE8Poii3aWFiAFF
	KCmNT1cfYEEpfviu8wGid3O4U=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnz2ZLttlqamq+Bw--.15190S2;
	Thu, 22 Oct 2026 15:07:56 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: shuah@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] selftests: riscv: check all elements in vector register init test
Date: Thu, 22 Oct 2026 15:07:28 +0800
Message-Id: <20261022070728.35671-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:_____wDnz2ZLttlqamq+Bw--.15190S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF47tFy8XFy3Aw45JFyUGFg_yoW8AF1kp3
	yFk34YyryfWa92qa18Cr4UJr4rWa1fJrWDArn8Aw4DA3yfWas2qFyxtF1jqa47Ar4Fyrs0
	v3Z2vFyfua1DGaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbHUDUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC0QzRfWrZtkwv8QAA3m

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

The register scrubbing test attempts to read each element with
vmv.x.s and advance to the next element with vsrl.vi reg, reg, 8.
However, vsrl.vi shifts each element independently and never moves
the next element into element 0.  With SEW=8, the immediate 8 is
also truncated to 0, making the instruction a no-op.  The loop
therefore re-reads element 0 vl times, and leftover data in any
other element goes unnoticed.

Replace the shift with vslidedown.vi reg, reg, 1, which actually
moves the elements down by one.  The instruction has the same
encoding in RVV 1.0 and the T-Head vector extension 0.7.1, so it is
safe to use on both code paths of the test.

Fixes: 57d7713af93e ("selftests: riscv: Fix vector tests")
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
index 91e31f185b85..7f6fb0f93691 100644
--- a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
+++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
@@ -40,7 +40,8 @@ int main(int argc, char **argv)
 			".option push\n\t"					\
 			".option arch, +v\n\t"					\
 			"vmv.x.s %0, " __stringify(register) "\n\t"		\
-			"vsrl.vi " __stringify(register) ", " __stringify(register) ", 8\n\t" \
+			"vslidedown.vi " __stringify(register) ", " \
+				__stringify(register) ", 1\n\t" \
 			".option pop\n\t"					\
 			: "=r" (value));					\
 		if (value != 0x00) {						\
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus

