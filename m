Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A943783C6
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 04:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756742; cv=none; b=bUIxb4WWnBGvcOYcoqDMv1U2y3tUTrdWgpqaQnFB1oj+pgPKW/GjQ35Cl5BIBMHVO/f/Hvi0w+sRPg/4VKzOFbR634ggpzRo7il6dxY3vtkipSjt8c48GbFSdcTWu9BKoY6tenlncOZ1cyGMjIObTuuSVH1jEq5omTrF+Gwr3GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756742; c=relaxed/simple;
	bh=b8QwpXwKpqlGy4J/qnd27hacUm4HMPsBNRolM6UVwpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m/2ytH1me3gmhDPsjrbbQiHal/V6bYLy4UoFVn+2G6RnwtfSXpl42AAB3Edv3o/SwQv4nQvKS8Ck544Ul8C7yx0eTB/szexV1+MKmWjsoTSLtd3FXqbYZ3U1USkWqoMwvIIAq9hMqpYJfbvHULwNFxyqHVcaQq8oHKDGoLs3IhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVVDHC1t; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVVDHC1t"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2978099a91.0
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 21:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756740; x=1789361540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dj5/gWxeDk47uSELqCVU9KzfoSY5+X/l8m45uFaTtlw=;
        b=XVVDHC1tq9a5zf3TUqTAtZ0WR08egxuW40W470oprYor8Cd+8dYtkeNzquH63zqWo2
         8/GslNBXIufdaAb5JtbAe+vFq98GbsHNyjlSgr/fLwxeI7tcDo+gHfp/MuK5HasU+lXT
         OyY9JGaKtDA//XBRcTpgH7SXu+6P8Vz+zmZR734dC9uMdD50As7MSrM35J17xV+I294H
         DfmmI+pDEcS+JJSn+dela7+7IhVMbM1qbu9GlKMeoy9EBBPjTddb0Kqrrq0qS7nljU91
         0/YRfutE4cIAEYaMrbkj5kvSQuiKwS24RmZIaaWanqMwE7CzJnutQkv4FJ2k/FIe+nsa
         oEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756740; x=1789361540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dj5/gWxeDk47uSELqCVU9KzfoSY5+X/l8m45uFaTtlw=;
        b=qg2TysdTl+kUcMbx1as9eyjMMMJpl3uuPT4ITYnLZtMYTzrsF+PZYyUuhlF3QCRT1V
         /XxF5HQtZy5BVT5vvSvRJV+N9vsCC/5x6iVQl82asr18Wz6BNJ7yFHmOiPn+io8eByTP
         IZF4y9xu+YMLsb1HYS78c855mOpGZX7VEQxwWsrmnEaO6xp1h+K7iJZCyLwOUaxInJyW
         qXtj2EESnhlGMhz/sZmsA8GY/qZmzLJqC6mzbIXPnMpVk0sgPR0nJxkAnob5ERrtK0sw
         Icy/6ELkjKjb/N5W3cqR0bFRYET1E4Jq0hjUUafhu+aGZl/rCIJ6Ti8TAoL3atQysMIs
         Lh/A==
X-Forwarded-Encrypted: i=1; AKwUvBwkEivz2q+GpcAUwxiMQE52zYnoDSEm90ZoFuUc+fSLm1jhjBjO0JhssufGUrN/R76NPKBBlt+kcq/Q2e0DsQ4=@vger.kernel.org
X-Gm-Message-State: AFuF++lsTY4+GyH3jyQUqv4LhLdEdgflK0c6Rx/bA4meqmlUY85wdaRE
	sbEu8BHC44kIBiNvneqOk3GuE3e1/cdVzB8h0nzWVQDrq/LXQUh34Gqo
X-Gm-Gg: AYBFou3tP6Hr3xP+otQuxOqMgkmcMz6gNJQNJwr4R+rLoQQ1Do5CHYRLA5WT13vc5kq
	VR9ZByUejOL7FD8/Tfbyw2P22EEGgWJiRzlyOTR8RKgtIxr4F6adUias9VfKjFHfFUB8lcSxwib
	Ce/LL1KHsTz4ZeWue1Z2jXTv1lHII3/kpVAta4HykFhHcgtUq7lqbeJKpEN79Nku+5ZKEmHJKzd
	b5emXsJymJYWIvGOg6Uz0TLOKNP9kw6HfNxiH1EHAXNZ5ivkDDYk2iwBJJsKRmDV1MCVP82qBhR
	eQg3MD/F3c/EpKpfhMihJokh9rMfnstOwW4IwB5wB46Lr2tXqMfxHFoJaaOd6NEKjWJpUI7RLfi
	ZV4Y7kNXuIbu8hJbPdM2rja41LzSxuuZrAup049Y8wwknAlggXxgZ0RQqlTrQ+rqyl9rlpminbP
	LuCITUYHVHesp3IUuntV+MMqrnInKc7gizWjonGMsWVpglxzFoUjgL7PxpccoZsqOxr1SEv9Di7
	fD78xdVDe2cyQ==
X-Received: by 2002:a17:90b:1b44:b0:398:ba96:1afd with SMTP id 98e67ed59e1d1-39b2613249fmr28234165a91.8.1788756740085;
        Sun, 06 Sep 2026 21:52:20 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm21979675c88.14.2026.09.06.21.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:52:19 -0700 (PDT)
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
Subject: [PATCH v2 4/7] selftests/bpf: fix typos in comments
Date: Mon,  7 Sep 2026 10:21:32 +0530
Message-ID: <20260907045135.13317-5-hemanth.selam@gmail.com>
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

The subject prefix changed since v1, from "selftests: bpf:" to
"selftests/bpf:", to match the rest of the history in this directory.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c       | 2 +-
 tools/testing/selftests/bpf/prog_tests/task_local_data.h     | 2 +-
 tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c | 2 +-
 tools/testing/selftests/bpf/progs/verifier_var_off.c         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c b/tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c
index 1b25d5c5f8fb..8b96fb861368 100644
--- a/tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c
+++ b/tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c
@@ -13,7 +13,7 @@
  * IPv6 header with a Segment Routing Header, with segments :
  *	fd00::1 -> fd00::2 -> fd00::3 -> fd00::4
  *
- * 3 fd00::/16 IPv6 addresses are binded to seg6local End.BPF actions :
+ * 3 fd00::/16 IPv6 addresses are bound to seg6local End.BPF actions :
  * - fd00::1 : add a TLV, change the flags and apply a End.X action to fc42::1
  * - fd00::2 : remove the TLV, change the flags, add a tag
  * - fd00::3 : apply an End.T action to fd00::4, through routing table 117
diff --git a/tools/testing/selftests/bpf/prog_tests/task_local_data.h b/tools/testing/selftests/bpf/prog_tests/task_local_data.h
index 8ae4fb2027f7..9f2971fc7cd5 100644
--- a/tools/testing/selftests/bpf/prog_tests/task_local_data.h
+++ b/tools/testing/selftests/bpf/prog_tests/task_local_data.h
@@ -243,7 +243,7 @@ static tld_key_t __tld_create_key(const char *name, size_t size, bool dyn_data)
 		}
 
 		/*
-		 * TLD_DEFINE_KEY() is given memory upto a page while at most
+		 * TLD_DEFINE_KEY() is given memory up to a page while at most
 		 * TLD_DYN_DATA_SIZE is allocated for tld_create_key()
 		 */
 		if (dyn_data) {
diff --git a/tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c b/tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c
index 624078abf3de..d7e30ee576c9 100644
--- a/tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c
+++ b/tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c
@@ -7,7 +7,7 @@
 
 SEC("freplace/btf_unreliable_kprobe")
 /* context type is what BPF verifier expects for kprobe context, but target
- * program has `stuct whatever *ctx` argument, so freplace operation will be
+ * program has `struct whatever *ctx` argument, so freplace operation will be
  * rejected with the following message:
  *
  * arg0 replace_btf_unreliable_kprobe(struct pt_regs *) doesn't match btf_unreliable_kprobe(struct whatever *)
diff --git a/tools/testing/selftests/bpf/progs/verifier_var_off.c b/tools/testing/selftests/bpf/progs/verifier_var_off.c
index a63e33675091..227dea0da3a0 100644
--- a/tools/testing/selftests/bpf/progs/verifier_var_off.c
+++ b/tools/testing/selftests/bpf/progs/verifier_var_off.c
@@ -225,7 +225,7 @@ __naked void stack_write_priv_vs_unpriv(void)
 }
 
 /* Similar to the previous test, but this time also perform a read from the
- * address written to with a variable offet. The read is allowed, showing that,
+ * address written to with a variable offset. The read is allowed, showing that,
  * after a variable-offset write, a privileged program can read the slots that
  * were in the range of that write (even if the verifier doesn't actually know if
  * the slot being read was really written to or not.
