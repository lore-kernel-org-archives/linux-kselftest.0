Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1342E3C343C
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 07:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787125655; cv=none; b=nO7XFfHsgb4GJvUWwcZmuI6fm1xSPomLpbSfirOxc+Yq9MgQqBlTjSZDHqjf0Jz1xbvEWMyLLs4xB2Q3jkQw4VF46I80c/jYZJPPcfi9LZYnmqyhMDphwZfImyhKiQk3xbjYVthseOabc1VvCJWEjx8M/Sn870w8igSSKI7+QJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787125655; c=relaxed/simple;
	bh=mH70SGDQEUYRC4bGuNd2bC5s+eoBqF4ZRPpvz/uTY0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ABTlGfBHSXQxodIUnXJBMU+hzn3ULdIF82H2dRGohzwO30NYC0Pbm6T7bRFq2OEzyKFHyzsUE3ROb7InIYD13YqmS14K0h3Y2oZwV7xZ1iFkmJr0pNa0caWwi+42iOsf8GUkyI5IbH3wiccKbYaly+oDL7bapN4s87ijG2+lPlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vh1E658H; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vh1E658H"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e08baf860so858506a91.2
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 00:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787125653; x=1787730453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EM9mPI9yixDIV/dQKvKcahELWkdUTMep2I+eKhwYYKU=;
        b=Vh1E658HXj4fob5N6BlhS1othFvhOdnJKBC5vcdYOD4kSpYlFOxcfpIwmba3ipR0qP
         OAQvzucJkHFA1vjWeRGXLWwYZpQFsmOI+fg3p6MFQj0RITqRW4/BKieqZHrYy0JpUaqQ
         QmHCk/JBUx6C6uElZeDnPEGHaclsq9foSZoHbL3IqewC55l3ArW8sifgy2xbecWs0jTi
         waEqFW9MqNXWEI2Ew/AqOKS+mXyJh9dD5cwwy+lvgd7LovBSksIeG/61eKmgZeHx9b1z
         5DqS07+ZL0xXNPeST5828ur+VEjKWOxYiAefx3lIOMswXhS/DXoRHvfkBN+BO1wo7tVH
         /4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787125653; x=1787730453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EM9mPI9yixDIV/dQKvKcahELWkdUTMep2I+eKhwYYKU=;
        b=oi22dyk/QUWSeEMGWwjiChK7jmVm1MkFAAbIbSTIGIG3M/OS8gM1FipmPakQt+fUeM
         7fdu72c8gww+UGz0xpZLZ77Tf0TIE2uWDD1yh0IRf9s5mSmbwRGJliF46x4vUQwspLoh
         PskcCg1WCPd9Ht7AXsG+/Zs5Sro3GN6TLiOD6L2cai0AXUVUNW57QWTqbksJQ3l88H7+
         Uur7k/M/anff/BgAxNCGEDnr5poYGV4BHqy/j7t9bASAkdslGmGgq8Kmw5z5NzvFOOVU
         pByY0CLqGMw12afZBU5pc4mEkoEcAMjLN1O1OYPGPMK1DnPTmfHhrbOosgrfDkQ1jQ3s
         bkuw==
X-Forwarded-Encrypted: i=1; AHgh+RrTzWLf4e33ipsx63Co1b2QzeB2peKQWiGSXtLMfGM+Xa1VlxLozA3im0ORQeTxTRENIhP7mtZoZU1TcpBKD20=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNL/OIrC0RTAYU5Dj2eHlfwdkXTI0wYbkiOMEE21qht2dXeeHP
	qk20YyhLB5NkOfHY0tRzdgXce6o3/vimCXJMgyprzrO6755ePn03eUtL
X-Gm-Gg: AR+sD123t7MhwTFen0AwV+kAkPeDtU3QHm0qzMkLpZAxr2C3ySz42UlVsZNwGVFgbG1
	vUx1EHvo5HdtnFBLht5AemsKaHU29W6ZpXXBz6riD5OUfZrQezyZfkHVG94cP9gPrMWF3bVXklE
	XQwYJ5kTRFlKNmOoNNGmgZ16kPIK6ZpvM8Jv18/k+x0nXLw5IgeRRJJc+VeqsSq4GudxU5aAQAT
	wkASXZZtFHAlDVCi/QZsyOxPcWZLSHDPsJWZBuro4PZe0FDWaJUg+Nbo1jvjsK1Qly07q/3DcWQ
	iM8D1KMqWzIjiZ4YWqxIJo3XZtjZJccfMj0aGAMj/wNV3V+rYsJ6iYQBOKupZaAllbkIeRxPOnJ
	a+HrLDidrOvuVtY6PFwbB+s8Tg6GybsNs85JpKBM5hl3TexI9Qijf1axruyeCiRD8rA9gXPog3M
	Y+eAyWK7i7zcHF5lYq/qM9b3OBuPbwJX5AzflMTREM9B9sh10yQKSQ0U3PO+hD0NIEIFrD2hZ2P
	exzsP81Q/wjM+h/E8+PMw==
X-Received: by 2002:a17:90b:5250:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-3958125375amr5603472a91.14.1787125653369;
        Wed, 19 Aug 2026 00:47:33 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad3dd15sm3927299c88.2.2026.08.19.00.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 00:47:33 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hemanth Selam <hemanth.selam@gmail.com>
Subject: [PATCH v2] selftests/mm: remove the local PKEY_UNRESTRICTED fallback
Date: Wed, 19 Aug 2026 13:17:17 +0530
Message-ID: <20260819074717.1345749-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260818114945.1312987-1-hemanth.selam@gmail.com>
References: <20260818114945.1312987-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pkey-helpers.h defines PKEY_UNRESTRICTED itself when the macro is not
already known, a stopgap from when the generic definition was still
under review.  It has been merged since, commit 6d61527d931b ("mm/pkey:
Add PKEY_UNRESTRICTED macro"), so the guard is never taken and the FIXME
can be honoured.

The definition comes from tools/include/uapi/asm-generic/mman-common.h
via TOOLS_INCLUDES, which commit e076eaca5906 ("selftests: break the
dependency upon local header files") added so that the mm selftests
build without "make headers".  It is reached through the
<asm-generic/mman.h> that the system <asm/mman.h> includes.  Building
the pkey tests with KHDR_INCLUDES pointing at an empty directory
confirms that; emptying TOOLS_INCLUDES as well is what makes the macro
go missing.

No functional change intended.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
Changes in v2:
 - Drop the incorrect claim that the mm selftests are built against the
   headers of the kernel source and would fail without "make headers".
   They are not, as Lorenzo pointed out; describe where the definition
   really comes from instead.
 - Leave tools/testing/selftests/powerpc/include/pkeys.h alone, as
   discussed with David on v1.  Unlike the mm one it is an unconditional
   #undef/#define next to other powerpc specific overrides, and that
   header only includes <sys/mman.h>, which does not provide
   PKEY_UNRESTRICTED with or without TOOLS_INCLUDES, so its definition
   is load bearing.

The full include path, for reference:

  pkey-helpers.h
    -> <linux/mman.h>           tools/include/uapi/linux/mman.h
      -> <asm/mman.h>           /usr/include/asm/mman.h
                                (tools/include/uapi/asm/mman.h does not exist)
        -> <asm-generic/mman.h> tools/include/uapi/asm-generic/mman.h
          -> <asm-generic/mman-common-tools.h>
            -> <asm-generic/mman-common.h>      PKEY_UNRESTRICTED

With KHDR_INCLUDES pointing at an empty directory the tests still build,
and cpp -dD reports the macro coming from
tools/include/uapi/asm-generic/mman-common.h.  Emptying TOOLS_INCLUDES
as well gives:

  pkey-helpers.h:188:30: error: 'PKEY_UNRESTRICTED' undeclared

pkey_sighandler_tests and mseal_test are byte identical before and
after; protection_keys differs only in the __LINE__ values that
pkey-helpers.h embeds into its debug output.

v1: https://lore.kernel.org/all/20260818114945.1312987-1-hemanth.selam@gmail.com/
 tools/testing/selftests/mm/pkey-helpers.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tools/testing/selftests/mm/pkey-helpers.h b/tools/testing/selftests/mm/pkey-helpers.h
index 2c377f4e9df1..626c2e1655dc 100644
--- a/tools/testing/selftests/mm/pkey-helpers.h
+++ b/tools/testing/selftests/mm/pkey-helpers.h
@@ -112,13 +112,6 @@ void record_pkey_malloc(void *ptr, long size, int prot);
 #define PKEY_MASK	(PKEY_DISABLE_ACCESS | PKEY_DISABLE_WRITE)
 #endif
 
-/*
- * FIXME: Remove once the generic PKEY_UNRESTRICTED definition is merged.
- */
-#ifndef PKEY_UNRESTRICTED
-#define PKEY_UNRESTRICTED 0x0
-#endif
-
 #ifndef set_pkey_bits
 static inline u64 set_pkey_bits(u64 reg, int pkey, u64 flags)
 {
-- 
2.43.7

