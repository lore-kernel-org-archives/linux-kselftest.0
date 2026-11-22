Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795370338;
	b=MhCln8VOcbjzcyAY4QOD6EV1ECTw31R6JtePVrL3ZPGi5pfac1Y8lNEjRjwQkbowyVQB
	 pYcQlkoCYHnshoo2iQD5zuKPRvDokQIFgJaJUkzQUzbzzD/hohZ7zujfVEHA5+P6n7dLU
	 Nnq9GM19AED1t4jevnfq2NkWie/g/QAFmHDBK5WQMWeulPgvRTX1Li2EJ03zt1FE8xuwT
	 hC893wrQ418YxwhTZ9eG5e7S1zahYtTXDJM77x64cGfxAQ4nV6lpauoFDFFoN3p6itCH8
	 p3QeSThJaUEBKmlJM2mOQOD4I6ls26hgZgvaUXStpPPuBYVh42WtNpSxb7GGHqTgOZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795370338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=zZK6D2/szOXdu8ofxhUwHdxgVM+nnJRbws9cN9agyJ8=;
	b=n/mAnEQ84HcD5ftJ6f5+fd9Sh1xiGJ1CZj/lxOdFYt6Y6vT7aQ+z4VE+kFH2KnR6l8sU
	 0XYIWPGDNwzweQ11qaaRyLFPhQYm4eTGDd9bBYSrwc9PliytsMSpdTiwX/cSRhaG4RTgA
	 pU7SQ9/jcbpspr0dIst0TeExK6rGQ5FLdEHZ9G4hTMpsKUaWJY3RXkCkRaAUACqCZ9TCh
	 Nsr6AlN86r16g+XDU8y5XKWyaSnUhqa6R3OxAS5Nv8zElEgBZUeAOnaLZ2owAT6At1acb
	 zlVss8Dz1fPp7FkaNYy36ftTj9SthhySciKGdqKXoOpCqrTrdc/u41IbQAaA9Q4Le0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Evrk5gN8;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443FE606A320
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 17:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 443FE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Evrk5gN8
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb684859cbso1446625a12.1
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 09:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795370337; x=1795975137; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zZK6D2/szOXdu8ofxhUwHdxgVM+nnJRbws9cN9agyJ8=;
        b=Evrk5gN8YawWXQCnh7BYEJBhjbQxlbQR3Iasc4IPxKuD3KXY/poUIPR4ZeqVIVv2Aa
         gcCY6NzXbWazluS82kiS34Oxq2vyqQ3TysGFnpF1iBsYe46d84rCx2FPUgVVLgulU7/O
         D75S7EmcxiaIGwYISTF7ZNN7GVo400f5as5LOiyWi5hho+GO07FNTqSK0mK+gWRr5zaR
         CfNgrQSX2XbZjQtoPsIe0uBHnO4+Od3f/eqpKA8WJg7CjRU4oEhpuovZYjEKDMOeX8hT
         w56zb3k1SNyHkd9zCA48w9uZoonCSU+YOlzLoFPvQmoHqp4UZFKO9dvvabdDNav4IVua
         woRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795370338; x=1795975138;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zZK6D2/szOXdu8ofxhUwHdxgVM+nnJRbws9cN9agyJ8=;
        b=Ko9lC/w7jqXKEyDXJQX9cHIFNst4/Oh1C3G0kBatB/3iPfF6MxtrtJhUh/0PsZDJ+j
         osYf/chNF4u9kr10l0Cr/spu4zxf/rKEpTQ44zWsmgr9IIYZgfY93PMP0VgAEfBWEe3R
         B04Opl9cF5fXU8KvWMpV5o+HGuZo9f5cicI1UbBOlckRXlAQ8b3AlngWkK+iX6QCUXqh
         1SA34uqzNjgibgopVRgPimfTxnllvqNli+DOq7WMeU3A14vvOYqtXRjZP0/NK5I8H8+Q
         1ZJ/OCmmRJh0tHz2licqVq7ODIctiPZRcG1mbzc68ukXRCygcYYvIazAC73KsVUdVeOH
         1mSw==
X-Forwarded-Encrypted: i=1; AL+hErEAE1xn3JDCl2h99CNzUPFl7P8b1XSpZBRZwvvh68EruoPpAK2szDtK6oxgTrUqgA0TIN5k42Php3EkORJg+5A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/30XJEtn/x3t0Xpesx1yjTX3KUcd7fag+DqeN7vsEg82yXPg0J
	O7AAJv+4L2RUCdR73h4STNooBKOM8fPaDuWHRCNUXK5zSzBkNzUlPH7B
X-Gm-Gg: AZFdTZfupV2zocSGFSDI31kI+zT4DTJnf8+QuTxqTy1+5NOw1ke2vx2LAV9OidUYb4B
	7D1EY5ji1R8P8nTRUavRfcyVrgX3gwYCGGaq9HyKVlVbLZ9iWEE/eQZYxmI5bXLEUwaM2lnaGmx
	UwJJApphHzoEp8UIJCoFU+Wws4rfsX7Q+rQBRnRyFF5NBtkphqS7lcj12TTqpn7cdRXyH7Cy5CL
	0De9UAa93APqUmUcNA/Ai5Z3QlpbMi9RhQ/y8tg9Vff4FrS9EFhEN7eDLQI/9zOIApO0CH2vdSD
	vlBXxDKA4M7c3LgizFukrjWzZRON/aVTuk/MPdNQ24dhkQv1d4sHM+cxm8rSB8vaqe0AcIVY9xC
	RdhWZgx8C6BPMkNt3wodSUyKqaZxoKCpGv229E9pZ40XoTpSYv3Zugayt6BhJLg7MIDidfLRt1h
	I8sBNfW1yqofevx/SN6dvmx3WSsJ2vPHGeb7Yyafyybskp8/u32+BQvgxD3YpB1cz3+yHHv6/lI
	/5N0XbeJeTYhu3wLe+aCKX6G74wpg/zgSvBz6mn07DWqpKRPkgtNAFn+ef4MV8RNBCRIaLBcyGO
	SCam2tQojxEuw4eBFs8SZboPWUni8icWhr/cf5s312TwabFv1NvWz5N0cqFPkuNdHTHZEGxTENH
	SNVM=
X-Received: by 2002:a05:6a21:6b0d:b0:3fb:6e73:ce42 with SMTP id adf61e73a8af0-4014d56b3f9mr9114765637.74.1795370337572;
        Sun, 22 Nov 2026 09:58:57 -0800 (PST)
Received: from [192.168.18.15] (218-35-178-218.cm.dynamic.apol.com.tw. [218.35.178.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c89dsm4160040b3a.13.2026.11.22.09.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:58:56 -0800 (PST)
From: Kurt Lin <lylin1023@gmail.com>
Date: Mon, 23 Nov 2026 01:58:43 +0800
Subject: [PATCH] selftests/mm: skip hard dirty page-cache test on FUSE
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
Message-Id: <20261123-memory-failure-fuse-skip-v1-1-19dcbda6e2e8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MWwrCMBAF0K0M97sDTaoVsxXpR6ITHbQPZqgop
 XsXPAs4G1xMxZFog8lbXecJiUJDuD7ydBfWGxIhtrEPIXY8yjjbl2vW12rCdXVhf+rC5Xzqy0F
 y2x0LGsJiUvXzry/Dvv8AXhvuA2oAAAA=
X-Change-ID: 20261123-memory-failure-fuse-skip-b976b4ea035b
To: Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 Muhammad Usama Anjum <usama.anjum@arm.com>, Kurt Lin <lylin1023@gmail.com>
X-Mailer: b4 0.14.3

Like NFS, FUSE reports on close() the -EIO that MADV_HWPOISON records
in the mapping of a dirty page-cache page, as fuse_flush() calls
filemap_check_errors(). Run from a virtiofs directory, e.g. in a
virtme-ng guest, the hard dirty_pagecache variant fails on its final
close():

  memory-failure.c:389:dirty_pagecache:Expected close(fd) (-1) == 0 (0)

Skip it on FUSE, as commit e14e52a7ce02 ("selftests/mm: skip hard dirty
page-cache test on NFS") does for NFS.

An AI coding assistant (Claude) was used to find the failure, write the
fix and draft this changelog.

Fixes: d51b5076c746 ("selftests/mm: add memory failure dirty pagecache test")
Signed-off-by: Kurt Lin <lylin1023@gmail.com>
---
Tested in a virtme-ng guest, memory-failure built from mm-new with and
without this patch, hwpoison_inject loaded:

  cwd on       before                  after
  virtiofs     9 pass, 1 fail          9 pass, 1 skip
  ext4 (loop)  10 pass                 10 pass

run_vmtests.sh -t memory-failure from the virtiofs directory passes
with the patch. The soft dirty_pagecache variant keeps running on
FUSE and passes.

FUSE servers that open files with FOPEN_NOFLUSH do not report the error
on close(), so the variant could run there; it is skipped with the rest.
---
 tools/testing/selftests/mm/memory-failure.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/memory-failure.c b/tools/testing/selftests/mm/memory-failure.c
index 135a2e8069ba..72a29ec19692 100644
--- a/tools/testing/selftests/mm/memory-failure.c
+++ b/tools/testing/selftests/mm/memory-failure.c
@@ -355,11 +355,12 @@ TEST_F(memory_failure, dirty_pagecache)
 	fs_type = get_fs_type(fd);
 	/*
 	 * MADV_HARD poisoning of dirty page-cache data records an expected
-	 * -EIO in the file mapping. NFS reports this error on close(), so
-	 * skip this variant.
+	 * -EIO in the file mapping. NFS and FUSE report this error on
+	 * close(), so skip this variant.
 	 */
 	if (!fs_type || fs_type == TMPFS_MAGIC ||
-	    (fs_type == NFS_SUPER_MAGIC && variant->type == MADV_HARD)) {
+	    ((fs_type == NFS_SUPER_MAGIC || fs_type == FUSE_SUPER_MAGIC) &&
+	     variant->type == MADV_HARD)) {
 		close(fd);
 		SKIP(return, "unsupported filesystem :%x\n", fs_type);
 	}

---
base-commit: 7d1a16abe4cc5dccd21e3d6262e44433a5885d27
change-id: 20261123-memory-failure-fuse-skip-b976b4ea035b

Best regards,
-- 
Kurt Lin <lylin1023@gmail.com>

