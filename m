Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C642F2607;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773107539; cv=none; b=UZzURONuvDBTIRKw8UUxb62BuLshVjIXCpe52BXfv/+teuuTCrXNB6e2bYVGDav82UwkExLFC7hSVq2KVOhNzWUKYyC6NmKOlNgX0s87L2mSsC8pAEhJGY+D+WMHoBaaHHNn8mA8KF8U9tedSNkX2+yteblQO0VM+xVtSTB0VEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773107539; c=relaxed/simple;
	bh=nnM2zjvYkKOyj9s5ooMFB4/ffFs14ySMOoYr/6UGGu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m4p93+prUM8TWAOSFB/R1s+aW9+snPy41vZCzdNpj02rk60rfQf962TscfZoNl0BmHqrWIu9nsRdtwyB7kBDUZHRT1WghWr0ETHZurAfRizUZWxLta0+6OMEqFMupYC6M8tTU8t/d2NDCA/c0UQD5xTtadwa91VbbbtnCVLDRLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmRqzGS3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmRqzGS3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E4A6C4AF09;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773107539;
	bh=nnM2zjvYkKOyj9s5ooMFB4/ffFs14ySMOoYr/6UGGu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PmRqzGS3nVJNyRGPSH3I6kRkp2fevQtU8tdhZ7011PZxc3DDMvst1VN2ZvfpAXkdF
	 z2hbwE6uqhF8ac8S9I7JRR/V5V9UdFn385CKXvyK+6DHnhGRJZptjAwHJMgQcKrAzZ
	 jQf4/k2+EMFzGH9LRP2j0XF+A9OwjwtHwLAvgvrAX8AUgX0UMLVJsZ55VyCfipgsYR
	 6VKPYah9V1+iCX7Td+8TXlylyp0ZQfRZ6gGApuJRk+YnlpjQnXVFbdxrAwUfnU+xLM
	 XjImXn8dOA7HKXT9U3xSiWRa9fGkVbsDll/jYVaqhB75yYqU8tsKz+fPA5ZKMpOV2L
	 qgU0eUIar6MzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F93FCC9AD;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Mon, 09 Mar 2026 18:52:13 -0700
Subject: [PATCH v2 4/4] selftests: riscv: Add license to cfi selftest
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-fix_selftests-v2-4-9d5a553a531e@gmail.com>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
In-Reply-To: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
 Deepak Gupta <debug@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773107537; l=597;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=BASghyhUbPQR3TaCTFC1Bxb1DJuKTtAvjw5yHhn6X94=;
 b=Q1YWdbYniiYp8cgRpgsURgdzBnJ/OsKXk/gnzUPByK9XWSKpz0qoRkkEuNQ3SNyndKtXe33L+
 0bCI6SQLOQGBvJ5CYNkAcWBJFmsTquFN8xfgNg5XVa0/EgKdC5ItG2a
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Reply-To: thecharlesjenkins@gmail.com

From: Charlie Jenkins <thecharlesjenkins@gmail.com>

The cfi selftest was missing a license so add it.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 tools/testing/selftests/riscv/cfi/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/riscv/cfi/Makefile b/tools/testing/selftests/riscv/cfi/Makefile
index 96a4dc4b69c3..93b4738c0e2e 100644
--- a/tools/testing/selftests/riscv/cfi/Makefile
+++ b/tools/testing/selftests/riscv/cfi/Makefile
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
 CFLAGS += $(KHDR_INCLUDES)
 CFLAGS += -I$(top_srcdir)/tools/include
 

-- 
2.52.0


