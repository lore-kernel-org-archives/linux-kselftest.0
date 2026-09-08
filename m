Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A36377ABC
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 05:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846581; cv=none; b=t7VWdItwoDJfN9yJ7sebpv19hZSBF11GTkpPoB7I1+r9Y2fmGRoLhk1gtcBok5YbNGKGfZKzbz05gQoDXE3eXsW/Do3BlkpWvHlhQoNYP45WqCwA54soj6TcuEq/MaAMJBzikJDa2/MQZNVOu0MrKcPlgEMgyAsZTcfNwiRpC0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846581; c=relaxed/simple;
	bh=7dtk/PimTN1tTIbaXYo8FFQym9q4FLwW3xCtKGUgfWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rfp2iclMVrV+3odsr/jZiWF0t3kOURPwe4Li6qLLKGsuVWasmEMySFDxEN3QQr8nb1n2a/bJ7Wq7PG4Nm7jDMDDy1KyeyLavxxC0k5zNVq2RzIiGsDu6aNSU2/CxGnJy8f/50Gehb7+r6VYwtwdvyXB/70isx33jkGU8oQcvh+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMnOkJX9; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMnOkJX9"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso3098877b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 22:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788846579; x=1789451379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rfDPZXNcg+Nl7/Ylu6hp6siIi0FsvzwquJx1kpnnIKw=;
        b=lMnOkJX9c3QdL8afTy+nAfzrTOju1Y9hRl99tWhSI85PpwkaxaRnvOWRSYL3cMgl10
         2Mif+CVjUxRKZgTYuNZgW3/cMJU8OpgWxA9swu5acdSpDsGZOI8jCZEo8eJNJEhduIN/
         +w2AAYcgEZOG05Nr7Jb953Yt4AbcZdYqOLfqwsoocoIU8wHtF9dH0UcykCvsvatXdilB
         AJRkwe9newBMz4I9vEwIoAfn6cIvcUo+qE97qtP4mUWZyLMP7rJRyaW0DcGSfrBHJZc8
         Bai5sYINhfh/Qi5zRXLzImmGTWy7qTWlME9hbpub5xQNgGNBhtXroC/8KaZZF/AkUM8s
         sYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788846579; x=1789451379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rfDPZXNcg+Nl7/Ylu6hp6siIi0FsvzwquJx1kpnnIKw=;
        b=o1OL1XLA/fKz5XdMRsYErTQ8gMiHMvVnIH+MhpAxZfn6vfCJ7QfRM36/CBmqyngDqD
         1J2W7f8zlWy3Z/52WzHtjH2+O46C1JkcuI6FbPmgo6SP4ND67kRjFohSD79/Fe9NP3oy
         /mbqj4wBzjGaPKkvliR19LQ0S2YRYFoacXI5DJaR8+JyMwJtKMa1jSAc3or5f9tCZPyJ
         8VKtodpIC9fjQM3NP8ob+7M9XYH1fs/SjwA/owsZWOlRLCWcB2V8zZtn2lwVrJHLvhdb
         OQhJDKBjwVYdL2vL5ENY1aGHFbSONFfX+yTnasiKqIkBF+n2DN1TpOcUyNoC0IDTRYp/
         zInQ==
X-Forwarded-Encrypted: i=1; AKwUvBwC9lbKFltcVIs0dsoQaJs+c1k2bcFyCzMXE8WCt//fySB+1Sh2PMJbNKIj14ewtuaEoYrYj7AJ73MH6qw5ymU=@vger.kernel.org
X-Gm-Message-State: AFuF++k8JB1Swzf9rCdc42oVa9nkbv7deG55h10DHr4/bEN09fA/M3Wj
	JA/fBS1vuKDma3R/Aiwr0xHdlBCoNSbNDJ3e0omGKZIXktB0YKb4LpIx
X-Gm-Gg: AYBFou3KZiDqAZOvF9Qgic3N5LLc9Saag6jzYuFfWAfaUOvhyuSmji1oiyDSvXnv9LF
	2JUJYbEEDMPsaC7cssDa/4tDB9l8gypPl+KTzFCUfo8QovGeyG5kmS3LOXo/EuWp/kKxR7Rw6OG
	/NfB0K7+aCnf/iwy08wTOvQKy+IIavaJIOviQrkbG4AG5h5LxcBE2bdSb+aRFl7gRS6Zl1DOkFM
	z3dPk/TMczFZE/anzm1DF+mismBAVCE3Xmu9Gv02rAjwjPC3u82SuBI+dSwHaRJWOoeCLvWYRjq
	7LWgc0fMTRyo1TE6axde4Lm9spxUxPvCpb7ReZIfuyRa89ZF5/leZAoSGSWhC++YVGjzyslgXi/
	ggJ2SKq6b0IKxjPf+V9Rlt5R8iWCc6AkkFlfWUZpC9ZrczNr6S9i/dqCRY6wG8/tLrRoPuXAbcD
	1fBK/eBn8h9xQWjAbR7qNNWVqJP/5gK22/4PtLjuiNlsck9gQ5oiN7+yvBx0EOrvaS3fhw7xoBv
	Cj8Lw/NQj6GTA==
X-Received: by 2002:a05:6a21:7748:b0:3da:6bdd:2c74 with SMTP id adf61e73a8af0-3da6bdd6cfcmr22673394637.10.1788846578979;
        Mon, 07 Sep 2026 22:49:38 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-334fbd5e6f6sm25690109eec.23.2026.09.07.22.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:49:38 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 4/7] selftests/bpf: fix typos in comments
Date: Tue,  8 Sep 2026 11:18:50 +0530
Message-ID: <20260908054853.13820-5-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908054853.13820-1-hemanth.selam@gmail.com>
References: <20260908054853.13820-1-hemanth.selam@gmail.com>
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
-- 
2.48.1

