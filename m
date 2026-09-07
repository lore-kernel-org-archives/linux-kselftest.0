Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4509E371D01
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 04:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756750; cv=none; b=IslQKyI/A1Q/93jVEdXKj13DfTgd2z/j/ryrWnRXHQG424HFw+ZXA3OX00jVX7A4SYGdXhSP1LQoro49c7XvMsR1YS7Fjyx6Te4RGQY1+5fe6E0GhiCS3dOCLP/VFsgIZ6PHOxVfQL5+H0oxojj3bClMKUnQQCD4LpYTH5+t8MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756750; c=relaxed/simple;
	bh=geshVPPC/sFWfefds6yEfFfn1FmETpgHyUfVVTDRiS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ItpfnSfD29/Sm33sobCAzFdQvfys+plOBeDihFasiTE5elr9FRSknFXJrw1YLJzTSvQYfUuCrvn1EZzhwNksq0wdz78PRmI8mILQiHH1szNW55SQeQKhvke8VcXC3A5HMT8hDuepLtnWLpXtoxztt5WsRWQnwwXSAjiZwitopF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEAg3ruC; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEAg3ruC"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d8fd3b729dso25010195ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 21:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756748; x=1789361548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vm/cehq7ZbHazeTz6lyclFSjgW2pMvi5dQ4X+rlCVtE=;
        b=hEAg3ruCGRjHQz3RedAr8ltMRKlsmVWFpIrWxjUSEYxeFhJdrexG6OWbCLTDqZ6U/f
         zGK+FPF4SZ3xYNq3/QLWE5c5L0679jR+XjMmvLyLY/7VilSV1cXdLYehA2KgvBHEh5Pv
         cqpPzdJCMGKGusu03OrBLv5cBaXbNJWbtDB4sP/6OcrkcJrTJFmAECZCuTo3iiNJymu5
         aqrPo5JwNQpDpz+O/QUbY/8sILccE3zJhkSYLH8nBDg5d5CmauexfL9Iqdf46hcGi+C/
         fj1jWUb9kcSdlAbpGA/tmxcSj7BcPq0Zd5Ok3YjbaBgzw0/J7sCjfWEaTodnhuxQ5rQt
         S1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756748; x=1789361548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vm/cehq7ZbHazeTz6lyclFSjgW2pMvi5dQ4X+rlCVtE=;
        b=NDfSX/bokjQ735VgOGX9zJYARJeZcrERwf9dFhpJXLCl6HEieWbluaqybYyUoxE+Wi
         ii68bjEBKA1y+EsWhmSX324YZDd35LXV3G53S8+UV7bpIhOpDvze+0+QwoHbNGHBCpRq
         jN9+6Pap79xEfcNIe43ILsxvK0wI8+sEGsNwt5TPcb29uIMH4jguFL3jHQCmEOY+fGLp
         1yUL4muW4qdO3WD2fTonPtSuarY3IUwOascv5Dgh8vAbdFIbGhQi1IdJNXeXqbaLdLIa
         /nngUBzg9mJ6Cqc4Ek/M2sSwKUFEzuZs5nCHJ3FX9U7UJWk+MjXLEOnnQKFTp8XuGf28
         VPzw==
X-Forwarded-Encrypted: i=1; AKwUvBz3jLBeFdY8kpLCYGFASc2va88A/iCh4lGQRybutO/v+tpnoEaa5CAKM4f5soOYD/DG713UuvbCEM2NO8ExnEU=@vger.kernel.org
X-Gm-Message-State: AFuF++lkcOTJBSGtHQFv9ZP7NwngMMjlsCeVPtb0fh2x92ZiuFqaF3y3
	GE/F97MsJvG0fhhQSQbQJOuPgHK6jyDiH9jyIBEnX6ZcTLZWfjwP+ehH
X-Gm-Gg: AYBFou3G8PG9t0ZkPLWB9mCPDFMAFV3ehOK54TfEsgVVcU+LMzouanh+who9KjCf15O
	lxeVluQoQSFnHnHOe18C7jkFBPcqZNUiEaRVFONMfudDWHD/D621pAfFQ8SEdFcTJhI4mtsZwc1
	/S7Kxtpfbiy9XyBjrkeEJVFjt+90Z5Nuar69ImeZCAX3/NmQvqDKidwHl4vW8WyV63OYOUzOgbY
	XK+Cqm560e10j5UDSsAWtw+D+dns+AVxFZIlkE1tOwZ1AqSLs/Pkjy8pyljabsyB4AOErCqmWG1
	l60ZOXGT+lot/7wAbF3livsU6RlIdlUuM5s9IK7vt5R///1dicZrkWuB+qQAcG7c8dt0yWi7yn6
	GdFsmoWIhI/AWu46q3/8zZgvewJjrk8GOBk/PxwEYdSTSbYfHSLxxCz2OSFY52q0qVa8cv2nSsY
	NQU2IHNgpq09b3cfMnND0bLuLzBo0Eb/388l/L/q26bxRK+Gfy+HvIFWCf4feflLtUBSiBxb/td
	0m+Q98NIgtkHw==
X-Received: by 2002:a17:90b:4c4e:b0:399:1b64:e0d7 with SMTP id 98e67ed59e1d1-39b262aaf32mr32153720a91.19.1788756748582;
        Sun, 06 Sep 2026 21:52:28 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm21979675c88.14.2026.09.06.21.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:52:28 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Russell King <linux@armlinux.org.uk>,
	Puranjay Mohan <puranjay@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH v2 5/7] sparc: net: fix typo "evalute" in comment
Date: Mon,  7 Sep 2026 10:21:33 +0530
Message-ID: <20260907045135.13317-6-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907045135.13317-1-hemanth.selam@gmail.com>
References: <20260907045135.13317-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "evalute" to "evaluate", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/sparc/net/bpf_jit_asm_32.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/net/bpf_jit_asm_32.S b/arch/sparc/net/bpf_jit_asm_32.S
index a2e28e0464a3..81430f065ac9 100644
--- a/arch/sparc/net/bpf_jit_asm_32.S
+++ b/arch/sparc/net/bpf_jit_asm_32.S
@@ -195,7 +195,7 @@ bpf_error:
 	/* Make the JIT program return zero.  The JIT epilogue
 	 * stores away the original %o7 into r_saved_O7.  The
 	 * normal leaf function return is to use "retl" which
-	 * would evalute to "jmpl %o7 + 8, %g0" but we want to
+	 * would evaluate to "jmpl %o7 + 8, %g0" but we want to
 	 * use the saved value thus the sequence you see here.
 	 */
 	jmpl	r_saved_O7 + 8, %g0
