Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFED843C7D0;
	Wed, 14 Oct 2026 20:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008100; cv=none; b=pmVr5HX5ShYbV0HFz+JsS4/GWQLjYM14vbPG5PLY3rpAbQdsYc8z/PN8ZL9nQrN+jzyS64F29Z9KB7Ja0MUvkdmjtWOepEXvGppy24u8Mx0FW+lbMQpb9AIvmPHYQSA3PMk0D9OfBEkvJ92PaRLFZqgCIk8OzLE776N8giPwioA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008100; c=relaxed/simple;
	bh=PomOeAZ7Yogn0MCCe9ihbSz9f17vEZjkkPSjLCXz5dA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WofGvzLG6c9mGCKBCUccaf+ddefRi6RhYRKf+hMmIcOYSGgRoHjOnhi8JWYW/e6I/pqfLoyw4AJcd2tTU0c+5p+W9OcSa6qzpt5PLrEjoKh9fsuMJtlxMPsOGrL9J0pT36NDkCkoLgovzLSKI2+iZwx0olvj5DUuzYMD/P7XpCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxvqOx1t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxvqOx1t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C436B1F000C4;
	Wed, 14 Oct 2026 20:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008097;
	bh=iLkP8vnDUW9ZlMok4Q2CsS89E/vjvuztRiGD0DVNLnY=;
	h=From:To:Cc:Subject:Date;
	b=fxvqOx1tZxtbBA12TqYuhlWyLcwaf5KCmkqlxau4XUntk+36D2inS+Co/m4/4VOSv
	 ZG4mNZz4BZfsF2YP9/5phOWSEpmiuSd7TrkFKu6Y0qU7ytUezwd8kmzJFlauMUoHZY
	 HX61ECIgh2egtKL7V1cwHhS/KPb5sRRBmwf3qfdA4OmN8mjmnKheUpcaYoFD4Yym9c
	 Mm3w4oAhXAVqWHu4wa5l/AK1gxvOpsMwNjCKDmWdn94K6wniSAHouwSLGFmcLlxfde
	 1JA+wWaB0ITkFGjPwLN3tOCOGqgagzKSloDPIdMc5/4fLBxtwmmiBNAVB2Jo3QZsq/
	 dd9HecXI7/bPw==
From: Sasha Levin <sashal@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Farid Zakaria <farid.m.zakaria@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/exec: report the skipped binfmt_misc_bpf test on stderr
Date: Wed, 14 Oct 2026 16:01:35 -0400
Message-ID: <20261014200135.1364053-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The exec Makefile announces that binfmt_misc_bpf is skipped with
$(info), which writes to standard output whenever the Makefile is
parsed. The selftests install target appends the standard output of
"make -s emit_tests" to kselftest-list.txt, so on systems without the
BPF toolchain the runlist gains a line that is not a test entry:

  exec selftests: skipping binfmt_misc_bpf, needs clang, bpftool, ...

run_kselftest.sh and CI systems that parse the runlist then treat it as
a malformed test entry.

Use $(warning) so that the notice still appears in build logs but goes
to standard error.

Fixes: 277d787feb2e ("selftests/exec: add binfmt_misc bpf-backed handler test")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/exec/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/exec/Makefile b/tools/testing/selftests/exec/Makefile
index 2220ed345e920..91decfa8ff2c1 100644
--- a/tools/testing/selftests/exec/Makefile
+++ b/tools/testing/selftests/exec/Makefile
@@ -67,7 +67,7 @@ TEST_GEN_FILES += bpf_interp.bpf.o nix_origin.bpf.o transparent.bpf.o
 TEST_GEN_FILES += loader.bpf.o interp_bind.bpf.o
 TEST_GEN_FILES += binfmt_bpf_interp binfmt_bpf_app binfmt_bind_interp
 else
-$(info exec selftests: skipping binfmt_misc_bpf, needs clang, bpftool, vmlinux BTF and libbpf)
+$(warning exec selftests: skipping binfmt_misc_bpf, needs clang, bpftool, vmlinux BTF and libbpf)
 endif
 
 EXTRA_CLEAN := $(OUTPUT)/subdir.moved $(OUTPUT)/execveat.moved $(OUTPUT)/xxxxx*	\

base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
-- 
2.53.0

