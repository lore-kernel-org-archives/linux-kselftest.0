Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD7D2459DC
	for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 05:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781415595; cv=none; b=jCdN2gb5oUrduQfi3sj2TCkf8Bxjg/zpLFlBaD1GaHj9Ic7PfrdpkYJt1/Bl6rdjJQCkwN0kvYdAKgt9bT2w65pXO7YGpvTcgU7tL7SCyx7qk/8KP1RKKZq4WodjuLFxFGLtjMBJg7r3bBusAwWuoi4WRh7nq2W2pPlRg/RHe6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781415595; c=relaxed/simple;
	bh=lhowr9EjwPapIm5LZ9CUvqkGMBmfsnVS9rihubPA5e4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1HEZZbf9WKM6FQB1DfkIhWcqzulI4q7JMUWp+tTP/YLSbnOP02+tkVMO1n0vq1SOLEt43GQxGwaw/v1gLDgn41dm0TZnLaEIFllEI5BGlMbHDvXXY6GafSX2k2s4Z+MOcjtt8nxKiz+XSavU2sTqQaUWB2pJesK0uqxiaSsm6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7Y+ZSnn; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7Y+ZSnn"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8423efad617so1435519b3a.0
        for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 22:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781415594; x=1782020394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NT1UtqM2AmX11NcJjNv9n62UrLKyvxdMBYbCsYRy7Tg=;
        b=k7Y+ZSnnWZdZwA16LI1jjwiD9wmD/pD5qjRx+SZt0TGO6PL2TosKf3zQEYuBOOo3jl
         IXJ4DI3O4DDszR3h7L9hsel/+bPebrxhlHnILMSml/PubyVW7QOXg1OZ1IQjVxyYLYvL
         G+GTWiX5utKgMFP/sZdfS5XtLxR6fJRhBnqIpJ+HfwsYfQCgvlHQ73MoPZHw+4V973cM
         bQv32r09k21FrpEdUOr8k2FRrQL48VY7QkXDDHHv3/r8R+9EEDheSZEmL9oDq4sQXVAR
         0qnaR5hyIdLRgKWW9t4bFk/tV0M7f1t88wCinuopPv37POBxtYYjol63QqGanP1jEGSO
         g72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781415594; x=1782020394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NT1UtqM2AmX11NcJjNv9n62UrLKyvxdMBYbCsYRy7Tg=;
        b=coETHFdjQygwV8l68xOggzl4MtR0speChY8h2Hnq+ApINkRqH9xCIsZYT27kg7sNxJ
         ZuNvV0ExxM24sfcIOVfNYjGvqjJPnMyCu6+OMqYO3miiRUN/W10ZQXR++VpF+FFNP095
         w5o6bfDqvh1Exesy9w6nrVrR7rKpZ5eTP1tvGUquY5ikjfSJj7b7Gljq2jgXxTz6PJF0
         npa8UjT2Hom5Q+ynJ7ngBP39moMjGXEoTrRvmBD/da4t1HVtWu7X2Jh2rY0ng2Ewrpxa
         QsU1oB8kcU643isCw3Qno683JG5XXhgWp7hz1/2VCynQwk2ZktHLVZb+Kz/DBRZGN0ZU
         /Z9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+0WoEYqUiURskVzSkTc+G9FpvARNyiGx3VUIfZajFNCm9Sa3K4Eccz9vrl6ahNvXRiAPlXKoRJvhcKTRRsbvo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzib8g+P0BVJFfR2bt0tdku1DkvN9J1Cyy1VKu6TazFyKLDnZzY
	RHlZP2LzY9X699yDvxluB0ry47a2AnMrkkpqSt2aPe0FuLsW+Lqo9OK2
X-Gm-Gg: Acq92OGmoHEzCG27UZUNTgflfpsY0xJzZ1hqWLyx2M5oFWGL+4u322S/4wqmz1wK76N
	96wbXFZ+4WAullBNyqIYPYxaBhhfgMfSBRxtBS9jGqnwd3nReOTlte/VJdY2iaQynLPCq1p01Ic
	9nDU/262tDu/BTUIGzNi81yR9tuZA/eeb23iVjb3pey5L/siG+oonyqzSR60NGxZVB4KUMTKe3E
	bInwz01SxGKAFPGQe4+SvjHi5iCqfs+YqwZQvS2ASVUKzxWHbV+ViNmrfrXD1/2HSvdYyz57Gdk
	ruOeAdwO/nZhd4YsPeYuX9LfGpJdr5ezBebSV98pp2qRQSnfdpXaEjaUDGVR7Cp8Dl1HHOmQyB8
	BwsrVsyk89N6MTLBaDBK5W/a5n7IJOeLBrbM61MaW1Cs9SSx18fuiuModtSXzul4gaPbT/TVQFL
	7qfszHp0o6GV/YwcgBCG/0kikLpc/ht654t86k6qnKj2ci5BZMmYCYGtdPtG/rMi4LGlfLDHLKi
	2TkQedsnCwFcKmv
X-Received: by 2002:a05:6a00:4fcf:b0:842:5711:9a2f with SMTP id d2e1a72fcca58-8434cf4f362mr10259911b3a.36.1781415594241;
        Sat, 13 Jun 2026 22:39:54 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acffd04sm6387078b3a.26.2026.06.13.22.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 22:39:53 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH bpf 1/2] libbpf: Reject out-of-range linker relocation offsets
Date: Sun, 14 Jun 2026 14:39:26 +0900
Message-ID: <20260614053927.160566-2-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260614053927.160566-1-sammiee5311@gmail.com>
References: <20260614053927.160566-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The static linker sanity-checks relocation sections before appending them,
but for executable target sections it only verifies that r_offset is
BPF-instruction aligned.  It does not verify that the offset is inside the
relocated section.

A malformed object can therefore pass an out-of-range offset through
linker_sanity_check_elf_relos().  When the relocation is against an
STT_SECTION symbol, linker_append_elf_relos() uses the unchecked offset to
find the instruction to adjust:

  insn = dst_linked_sec->raw_data + dst_rel->r_offset;

and then reads insn->code and updates insn->imm.

This is reproducible with bpftool's static linker by crafting a BPF object
with a 16-byte executable section and a relocation in its .rel section
whose r_offset is 0x1000:

  BUG: AddressSanitizer: heap-buffer-overflow in linker_append_elf_relos
  READ of size 1
   linker_append_elf_relos
   bpf_linker_add_file
   bpf_linker__add_file
   do_object

Reject relocation offsets that are outside the relocated section before any
later use.  This mirrors the normal object loading path, which already
rejects executable relocations whose r_offset is not inside the program
section.

Fixes: faf6ed321cf6 ("libbpf: Add BPF static linker APIs")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/lib/bpf/linker.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/lib/bpf/linker.c b/tools/lib/bpf/linker.c
index 78f92c39290a..3eb23da167d2 100644
--- a/tools/lib/bpf/linker.c
+++ b/tools/lib/bpf/linker.c
@@ -1048,6 +1048,12 @@ static int linker_sanity_check_elf_relos(struct src_obj *obj, struct src_sec *se
 			return -EINVAL;
 		}
 
+		if (relo->r_offset >= link_sec->shdr->sh_size) {
+			pr_warn("ELF relo #%d in section #%zu has invalid offset %zu in %s\n",
+				i, sec->sec_idx, (size_t)relo->r_offset, obj->filename);
+			return -EINVAL;
+		}
+
 		if (link_sec->shdr->sh_flags & SHF_EXECINSTR) {
 			if (relo->r_offset % sizeof(struct bpf_insn) != 0) {
 				pr_warn("ELF relo #%d in section #%zu points to missing symbol #%zu in %s\n",
-- 
2.43.0

