Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04733AA4F2
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 09:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725881; cv=none; b=s4O+Cs3rff9vFbDBnoB0z0h+wB0c0gjV67HaxIxGQuhTPUo9CE7rQiaSpxnj1EAEXnt4XLnguCE5NrHkiMyFSLKAvA/wqkew2KY0XFaYXhecDLp3HWI7jbnMuVbnSBYwihl3a1e0gJxUOlogTQw8huPLV+T7Zi+PrHgPliQgNvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725881; c=relaxed/simple;
	bh=EwaLLf5jOk2+IkPFrBBMcFB3CuCjf2P4D7wJT+f52xA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q6lGfR1QymcNkF60F7wqtOVcUynmdZtGh2MIDprXMNsgoweITS+6b+VJYeKmNSktH6EA4ZgidGEp/KQSelRQazULz/kFeoOdYKZV7mAyEi9cS/OTBaeQwheRDB4PDj4MkXxW+iIM/gY4NCW0xCkKhts21R3QK2hQGQp8DjMuXtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buwHRC5U; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buwHRC5U"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2adbfab4501so3125185ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 02:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775725878; x=1776330678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JOwXxXxMUC6OWtWELmNSlvZ5InMUhdFGYBRE1vTG+dk=;
        b=buwHRC5UbXNhn4ekMRpjCIGPNbdlddIKbnOyA30j7feCZjUtJpAMo2Sz1hgiws+x3Y
         A7lpA0pQvEi81e9sZusV9JJZ0PWEMtJelALEWDQXHModRewxPQDaob0GHxEX4M57EiD7
         7mhzFxrnyR2qO3HBmM45Gfsh5XJjFI/MtqCa4q2HBTIkvJPSFg/bTPAZpwIe9Nh4VG46
         mXdNe8w2ylw43QYP+NOz0iIRatTxSTDQ7LnOyC2hKtrYz2SthF7aNVjEcK+9Sg74PgGs
         egpugyasmPlhIp1e0mBHzRj/pNje46SOSCZwrdSv15uiMF/WTmaJJVKeX6xgrQEncsKM
         Hkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725878; x=1776330678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOwXxXxMUC6OWtWELmNSlvZ5InMUhdFGYBRE1vTG+dk=;
        b=rIlXR8bjehcgecsW+u6i+Uz9Azo18nY89/D/HeG/A0dNp+VoFb2CU9DPjqhVNtoxSe
         paENG/aJN55a2lYZ+n8EKYa42iLAp2Gwe5eHPZVaLnd9N7KN5yVXw3FEx44naWge0qdp
         1mQpmYp2pMX31tJfNfnvGcwCl5zo5neE1Jit+jnzltuicF+cXPesgwHH8Ij6xxf5kgaB
         vtB7zzIhydf1TcfZv30tmKCa5zEznRIw7fb26M+hd869C10jI01u30pu3YUixaM0rMjC
         mz4Q893PxR1eIK2JnEsl4CJ8hZ4cliYUILSd+V0QR2pV8wK+eZWQlRds/pVMz6sVhuUd
         gxYg==
X-Forwarded-Encrypted: i=1; AJvYcCWyKJCbq/ISRByI+hyvjFrWJPakqR0QmoCAEhzNy7QMJzaNxKUidI8R9yWT3sm46iC2nGwSxElCq7MObNxqqI0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhj3OCsI0gVwKbtmOAGLz/6ThBU6jvtF3iwinhlFO1AWKC3r78
	c6PwGNBh1T80h/lr28G25V99ckUOvSJUNtXYEGMsE7e5XuR5TVHRWyDw
X-Gm-Gg: AeBDietnhnfjak1U+SCDa8jdhSEcIMaf+M3Yk4Fpr+MikmctFQM43t6p7optOfT9KQa
	FbwnjC7ACSTAVs8xpRiHVWZsuUMjs2sKawl0gNUq8xEx89TqCvrjwzqZIZZAba5yxkiWKMO2dVR
	DghqAzhdZxoH9t77VxKykQh3mkLo/E4Ki56iIRzEeqAsgsYzBZ2QwJJGqh3/I1j5nS4IlxENVfS
	CyY2v+uxuLBvtd/3ONUDlXrvJcKArBTZTUXsps4nLhhCv+dK+EsQH49N26/wtUy14x8p0WKiZvG
	OAIz0aEOzEJ/nEiJ2BOAfYDVME1lpJdruMILYgWHKM+M9axufVCcjSsv5JJWrZBMbOTVv0P3g8Y
	U56LX1hwfylZ/omOhjRf24ryQx7iX2LSCna850BBcYFIuuRxHHnSwbK2YDDyrwN2R9I6CrSv+RP
	k9ShWUrVwSfKyOn2xO+EtLog==
X-Received: by 2002:a17:903:38c7:b0:2b2:67ca:5fff with SMTP id d9443c01a7336-2b2c73c64f3mr29638575ad.28.1775725878037;
        Thu, 09 Apr 2026 02:11:18 -0700 (PDT)
Received: from laptop ([2406:5900:1154:b176:214:1c7e:a705:3905])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749a2e42sm213540125ad.56.2026.04.09.02.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:11:17 -0700 (PDT)
From: Woojin Ji <random6.xyz@gmail.com>
To: bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	shuah@kernel.org,
	Woojin Ji <random6.xyz@gmail.com>
Subject: [PATCH] selftests/bpf: fix const qualifier in fexit_bpf2bpf test
Date: Thu,  9 Apr 2026 18:11:01 +0900
Message-ID: <20260409091101.364091-1-random6.xyz@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

prog_name is an array of const char * strings, so strstr() returns a
pointer into const data.

Store the result in a const char * to avoid discarding the const
qualifier.

With GCC 15 this triggers -Werror=discarded-qualifiers and breaks
the build of tools/testing/selftests/bpf.

Signed-off-by: Woojin Ji <random6.xyz@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c b/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
index f29fc789c14b..d8225da4c1af 100644
--- a/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
+++ b/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
@@ -111,7 +111,7 @@ static void test_fexit_bpf2bpf_common(const char *obj_file,
 		struct bpf_link_info link_info;
 		struct bpf_program *pos;
 		const char *pos_sec_name;
-		char *tgt_name;
+		const char *tgt_name;
 		__s32 btf_id;
 
 		tgt_name = strstr(prog_name[i], "/");
-- 
2.53.0

