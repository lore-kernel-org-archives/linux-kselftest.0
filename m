Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984DA78F2F
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 16:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787674662; cv=none; b=CRrEADbOLK40YifT49vu1vYu036SXwgOhwaOPzdnVhFp5XfY6EwbYlFyyUJxAdrOUY4r+k+pVSroaTFuKGOr+HASuAfFXfk9b6gL88dNkzOJpJFwFBDvFTXqavowIvBM58GLWrGoCeawxxX/nzigRLx+LHOImI9im4LTw6Cs/x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787674662; c=relaxed/simple;
	bh=9OPqxgBu15Idq5/Ok/0spEv15fcFq2gn1247wFrxgNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LmL95/moj2wUrXdE0KIyzNJRLRLfdBxLbrGpDGwCB+RKatPtcTahum2Q/HTG9ydpOrar1vscNOjk/6xFVibJ5cIiqYD5dPIMQxDYW2F625Fm0wuQcbQxFUFNcM7q7Ljcnw8Nq/COsZiwfbM0br+mu3x5t7sFEVh41zqhFhLBfIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYPOFoWS; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYPOFoWS"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d5cad1a6baso256905ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 09:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787674660; x=1788279460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pnKpvcq+eFIIrOJcljhlMUuTfIvczUf3J7EXGDw1e2A=;
        b=SYPOFoWSq0xM4Y7Jc2CxtO5IjZ9IEuUYcblZBbPGdrXSCIQibQVBGuN9d3UXm/Awxd
         +Fnf0Hi1N8uXqbNOJs7iqYrInVm0l5wEvqLn5GFdlIs7SrmCQ0CnzdHvG+F+0Op3izfF
         ou61FX/dA0lQOpY5MrtrOS+r2NTWy8Nx5WOjwr1lZDFf85b24M64uI61a24kOP1mfRQB
         yMPmN1DQS4EWEtPQfo4T5YQLkYnrfWK5o78YYTevyymVn4nsxlczta4eWqqYpQRXvCc/
         WmEEG5VX54NSiUEjZw27PQGSSccpKuayVKZrTVQEI9z2gJOLe9saBqJ6YfXujlTF6y8U
         ZcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787674660; x=1788279460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pnKpvcq+eFIIrOJcljhlMUuTfIvczUf3J7EXGDw1e2A=;
        b=YckacqRCOvKS4CbazIkEZeG2f5tEx4vrq9eX8+24qwyUyBqhZtWuEFVb6W5Lh5LNen
         UPLlc7k69QlQCcnwBHDzZmHfkKav/IMpjFdC5bJuCD0IVZKC15tERr2gqtPxw+hs0wil
         im3nZcFlCgQEnSjgJaHcZHL+LtJHj5xyxc9uH2hwttBtb2MudlWcMBhZ/kOGBS88qGm9
         WC8OmjZk8Xyr1YO4C7SLKMIYoEdf9SMBZDF0RBFeNgjvolM7L6eX2QC88fXGQKEVuaku
         yQv47CRjd6rPTr9U7uDbYRo+veCa5I9PbckhZS+R6kW3bnEjIkXGkI7jHYdlqlKYTfd0
         lRuw==
X-Forwarded-Encrypted: i=1; AHgh+RpOEHjmKYJL6BMbeGGB1pKT2x8XP6cr3JAni6qHecDcqNxMiJ5OjMIEuOhQpvMVg2iKacj2i+hIcdVZhyt4eKY=@vger.kernel.org
X-Gm-Message-State: AFuF++ktNnGlcno/vks3clx5PF5SHzMtXeF4UQBWH0PGxQad4TM+iZ1l
	7RO0XwGG4gUM6znA+ZOmCAwwXMyidcx3zqDA21EdHlJwS2nQO7xsf0CL
X-Gm-Gg: AR+sD11sztZyQgYUVFhW/lATUuONiCZ0TLxFpELxUUTbthn6Y81IddUd5v15WiV7VXR
	pXvJE4eXoJ/vQHCQBy/5E9o5Rsz/tei6VilFiUxtbxBjwXNadM1y52tmeREDeD5Lwc3JLLCdevY
	gM/vln+JxgHR7EriIK6DIcB3iIIuGdieyoHtxkzdtS3MbMayAaZjkBufdjiWZkPmNwcwDuyk+OH
	AK0n6gL8eh2I0ZP/JfjgF/xD5F/s6WUeT+TtceUkwct8bGobfLZDHBKyHjiZzk72XP9x8qjN4Sp
	FY4diLqf8rBChybR3vlvBJELvcMnf9NdSSrUheM2AQruqs6uqj+z6nT6CHg4fdSZ8b+HVAna78T
	Kvd09Qfqj47iIUvn6pqgaTYpnHYPI1KcSchk9zUJwhHcyvaNC/FCvhOp8UHQFSVhfNB9yldW0r9
	wa1Y/raZ8B3eYKcw39y9kpe6mUqrEWQVYqbYTgAlfHKGr8nOFvjsOiIYeCddax9wP3o70YcL+F0
	JEjgY2zse8=
X-Received: by 2002:a17:90b:5291:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-3966d45a53dmr525079a91.6.1787674659810;
        Tue, 25 Aug 2026 09:17:39 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3282afb407bsm8786745eec.30.2026.08.25.09.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 09:17:39 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	shuah@kernel.org
Cc: ljs@kernel.org,
	yury.khrustalev@arm.com,
	kevin.brodsky@arm.com,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] selftests/mm: remove the local PKEY_UNRESTRICTED fallback
Date: Tue, 25 Aug 2026 21:47:15 +0530
Message-ID: <20260825161715.2807297-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
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

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
Changes in v3:
 - Add the Assisted-by tag Lorenzo asked for; an AI assistant was used
   while tracing the include path and preparing the patch.  The builds
   and the cpp output quoted below were run and checked by me.
 - Pick up the acks from David and Lorenzo.
 - Sent as a new mail rather than in reply to v2, as both asked.

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
                                (-isystem puts it ahead of the system one)
          -> <asm-generic/mman-common-tools.h>
            -> <asm-generic/mman-common.h>      PKEY_UNRESTRICTED

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

