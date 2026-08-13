Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE41373BFE
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 07:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786607601; cv=none; b=FaHHQtbGK3xLkQubwBvv6dgunxwBYyIXdPnw/ASI1wcduFFzLbeExeU0ENw462XDNChUwWB+toabs2DFf3TXBv7IczHYtJ9zeEiUemJks1Vb/08BbneQkjIm+ylQtv07REKWk2c0Tu4iM0P7oMCxLrgRYbOG0VSOMUPfdEkuXvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786607601; c=relaxed/simple;
	bh=kSs42p5+JAB41qqa8oV9gI7CfpDfzHzHMtsTL8IgUI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aA9J/RZAjFM9ULKHyDKKrHg35C4+1VR5H4TmS/BTZqXWFeMVwmhPA9yN9gmpTdYmrjFuvuwhPB0EEo+8HnzI7QgJeHkgXbpYWgnhoouWrdxxwFnWRzv78z/YiNpen+lmiT4Elf/uGEhFQw9TrC8Y7qhYDzzvQmVeazVb0djQBT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZkUWl1FA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZkUWl1FA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786607598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y6pxUhHWKW2XA72SzK1YWEsEcU5+kupBKwLLr8AET8E=;
	b=ZkUWl1FAhL6oleHSskDZ2VypJuFuMxi/1gYWryCnqPqfCKApJ6HUws84JpjhoQEGcFszIK
	EGOTSEl3no7iO8JcE7s6ZX+FDJCVplRT50IyQB1qS1uMTY1Dpd+d2+XXl6xVxcdszSuSCK
	gLbAGX5YPcsmyyGsbbPuV+xydwJ0AIo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-9-QZAkCEzDNv2G84GlJwbu8g-1; Thu,
 13 Aug 2026 03:53:14 -0400
X-MC-Unique: QZAkCEzDNv2G84GlJwbu8g-1
X-Mimecast-MFC-AGG-ID: QZAkCEzDNv2G84GlJwbu8g_1786607592
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DD0861955BD0;
	Thu, 13 Aug 2026 07:53:11 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 92CD91977033;
	Thu, 13 Aug 2026 07:53:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] kselftest/riscv: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Thu, 13 Aug 2026 09:53:04 +0200
Message-ID: <20260813075304.75988-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

From: Thomas Huth <thuth@redhat.com>

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tools/testing/selftests/riscv/cfi/cfi_rv_test.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/cfi/cfi_rv_test.h b/tools/testing/selftests/riscv/cfi/cfi_rv_test.h
index 1c8043f2b778b..184df6903d01c 100644
--- a/tools/testing/selftests/riscv/cfi/cfi_rv_test.h
+++ b/tools/testing/selftests/riscv/cfi/cfi_rv_test.h
@@ -56,7 +56,7 @@
 
 #define CSR_SSP 0x011
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define __ASM_STR(x)    x
 #else
 #define __ASM_STR(x)    #x
-- 
2.55.0

