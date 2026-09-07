Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3115448C412
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 12:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782518; cv=none; b=okJHFQieK4KPvZYE3/BhZc+roFVhNkAJJhT9JYzrLeSTH2OSwR2U/SuhFxDEaarfJjPPzshhBxc+8A32aUC008odQqMKKWi06MoMtJRaItvMUtOjzniN5YpF+GrEJEY6xpsay7BbcZSVxTCHynl3x0pCLUBHscSV0x6Ixtq5o2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782518; c=relaxed/simple;
	bh=kuRqLYU/bVAolAtuT0lNsNPBb3H44v+1z9+WGNYvrCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kw4OCSJKxktmdnGkCSE9mDN9YUepq4Uc8wXs/6BuwyMFz6hzJjBypsws6qWtTvP9Dg98dr5j/Odb6O2PpuAf0H/uTTQ25Q9+MGWawUDqOVjELigjkW2HYgPjpEScdhJ/SoSDBXsqZweOxzS8IiX0veRLpt+qQCGTYHWKTt57xTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llQq4rCN; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llQq4rCN"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d9db539a54so27274775ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 05:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782516; x=1789387316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSdhcylG8upaYgz/wmJd+JoSvai0ylGkPowyAHHfN0o=;
        b=llQq4rCNDIie0aaplpZeITjsw35VfD5OpFuAUrvDpjn+9fQNpLR8BLGukiX0GUqtpX
         W5NgF6LTOVNHb2hcAwLOtRsN3/CDPjMxRlVPacxMFhyL24GquF4EHoE0BoL2dac164/y
         UCjnF7EJptkI1as7n2b4vE5tfvc7LM16CptR9FbRcfElRWMANipKFCod6kA6J/+X1X4O
         jxYp7syG4fxmIXhyyJpZoA52dQQxuQZ0Lsy8mIf2JgVf8Qmi1eKlwDif4XdixQ1GjjWs
         /H9vB6agHHoFHXfjQBeLccQtOLlirEta9/fD9zceKkatvAeMl3F7fI8Sy039AkqXUpcr
         wAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782516; x=1789387316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iSdhcylG8upaYgz/wmJd+JoSvai0ylGkPowyAHHfN0o=;
        b=mo8TXkYBciv3IC5wBysnwqmkykgihvSgkwyZEbbJtbU4cEequyJbieYwt1FA/Pw5OL
         xjkcXl5CubtFIoSDWvS0j2fdFRLrWxWJfnEdgeSUbUBnIVaNz029CTCeI2QiaMHGG6dc
         Vonwn5SqC4gJwyWZLpeZ/Wqjho2Z5vC/jsXLWxar3wtNOGAzMX1kLYQW3S3lo2erVtW6
         Xcm2v3FfAVZyczzTQ+h7kgwsqobTegdn845Xcil35g/V9xJJ560x0UbqHFDutBB0PFTe
         2qcnnGtdoQdaQWF02fWEsSCD/qkEqQRDIkOvQLyjSfWKWwHr9KpB8LJOCxWq12yZuxLg
         3gsw==
X-Forwarded-Encrypted: i=1; AKwUvBzG/pn3f4rxU81PC56YYg8i5Fz4/e8/KOKtqI30kC6i/yVInMCxBs4QFifHmg2Caz06Zu6AcahJTJ65a9Uo124=@vger.kernel.org
X-Gm-Message-State: AFuF++leJBs7wuLrII/WNLtIS7SEsWY3BprEVzBP0bQb3qKjwqerScvc
	QkEOtec0TYVc89OzR1B/SitYfqZhGKR25inOXqvUTquQ4hBpoCymiCnd
X-Gm-Gg: AYBFou16Ns7BtKkLAwn4TtDc0KtElxeg7UMClTJOi4RQMgpZxQ6/szwIXs+AxOZVO3+
	54wOpo8eBtEN67lgiF881hzhVQKgK5GtG1KK9tCni1qBVjUA7hQ2PjZXbTu7KuQ4L87OSu+j8gb
	sNhQW3G4G3VbEkY9LmBg0V3DW5HUe+PjRupbQy3AjEH1sVrIY+qIB8iIzLAFu7YwBnoYGO+pbq8
	3Qc/GowYiFMhtXTPS73x/hurSIqNoUFb/Mup3Y5XvhOWzw9X3I+/WIxtG71zRG1PWzl0j78UjcD
	PpefvwL18B+ByKM+H9J0Mg9LwXiZJBEFlMJBCkMOEpBA03V7Ful9qXWT5NYPSn6DBwLl32xANz3
	KU5Vq7v3bw3CTjG6fnb04K4jT4MFbz4LkY+0Z+KSIfVX9lTHjWZ547ZlzZexbVmFNegWOgz6htp
	c+NmcU7J3OQUeQUuAp4FGOpBIKSDSiihXwZJ6dL5Gj9YlLSpZzgjlgoWJTkVeFI1YVDkbQr3cQG
	3ETCdVHqi9iUw==
X-Received: by 2002:a17:903:3810:b0:2d6:3c22:99bf with SMTP id d9443c01a7336-2db124afcefmr348302995ad.9.1788782516134;
        Mon, 07 Sep 2026 05:01:56 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm31244462eec.1.2026.09.07.05.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:01:55 -0700 (PDT)
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
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH bpf-next v3 7/7] selftests/bpf: fix repeated words in comments
Date: Mon,  7 Sep 2026 17:30:43 +0530
Message-ID: <20260907120043.36894-8-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907120043.36894-1-hemanth.selam@gmail.com>
References: <20260907120043.36894-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop repeated words in comments, reported by scripts/checkpatch.pl.  Only
touches comments, no code changes.

The subject prefix changed since v1, from "selftests: bpf:" to
"selftests/bpf:", to match the rest of the history in this directory.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/bpf/libarena/src/asan.bpf.c | 2 +-
 tools/testing/selftests/bpf/progs/iters.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/libarena/src/asan.bpf.c b/tools/testing/selftests/bpf/libarena/src/asan.bpf.c
index de656b69d13a..fb50ee4ad097 100644
--- a/tools/testing/selftests/bpf/libarena/src/asan.bpf.c
+++ b/tools/testing/selftests/bpf/libarena/src/asan.bpf.c
@@ -204,7 +204,7 @@ static __always_inline bool check_asan_args(s8 __arena *addr, size_t size,
 		goto confirmed_valid;
 
 	/*
-	 * Wraparound is possible for values close to the the edge of the
+	 * Wraparound is possible for values close to the edge of the
 	 * 4GiB boundary of the arena (last valid address is 1UL << 32 - 1).
 	 *
 	 *
diff --git a/tools/testing/selftests/bpf/progs/iters.c b/tools/testing/selftests/bpf/progs/iters.c
index c6699159dacd..e44a979270ea 100644
--- a/tools/testing/selftests/bpf/progs/iters.c
+++ b/tools/testing/selftests/bpf/progs/iters.c
@@ -1511,7 +1511,7 @@ __naked int checkpoint_states_deletion(void)
 	 * would get equal to one of the explored states and thus loop
 	 * exploration would be finished (at-least for a specific path).
 	 * Verifier evicts explored states with high miss to hit ratio
-	 * to to avoid comparing current state with too many explored
+	 * to avoid comparing current state with too many explored
 	 * states per instruction.
 	 * This test is designed to "stress test" eviction policy defined using formula:
 	 *
-- 
2.48.1

