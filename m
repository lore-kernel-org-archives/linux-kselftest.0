Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA6C39B4A3
	for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 09:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781429194; cv=none; b=p2p1KBq7zoACGiID2PQX3bxq0mfFSNgnkv5ZQnkqMQonsGOlKN2CEe+H52prFUVlsU/XFrQjFUZAKPwXpMdjaAsCltOJEaDAWtCdcwKws8xEkqy1HndtSjgJC8KnnudMSZH48NyQ/BWqv8weItIMa5qw/4/cn9r64AUYwwN6Dm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781429194; c=relaxed/simple;
	bh=lhowr9EjwPapIm5LZ9CUvqkGMBmfsnVS9rihubPA5e4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MoKZPG+vsa7Fjp0zcG5SWkLs3GGn//xwal1LJEbv853Colqt3Qcmahdg0mD815wQRz9AqogoQiZ56fiynAm40CYJCdxF6+3XSmi7apAmLW1/BtP2ajcnIKTdQXWYJgvyRgvUFoMF1DKB2JrZucuZf3kpLUzaeSRT7yLGr0XwOuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2qrsybh; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2qrsybh"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8422f148dfcso1323660b3a.3
        for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 02:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781429191; x=1782033991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NT1UtqM2AmX11NcJjNv9n62UrLKyvxdMBYbCsYRy7Tg=;
        b=R2qrsybhpG8zS5xtDIWAsro5G+GDlQjIRuaZ9LuEoXyb1e3EzXKHCl6LDL9gegkaeq
         Z1/O6/DL56G1edjEaLOjuJOywShKh2nScTQ13ZKbfGTVj/q8xk6tpyDgDEz0VlFD1Mka
         AEitCfa0pqWyUDV2GoQ06P6yRwenUQqJDxKJEhrM6PsCRLy1dj9MdyoJ4ZmCLQNg1JP2
         r0S7Eg0SuuC94fT7pdg+730X3Bp1T/i4KIBiMA38XzIaMoBRXExDHovyQdrT/c/ZDSSu
         TX0CMuairgljLvQ9POq+wuVD6mT4Q/ZvlNGPRAQYwkA/b8qy2rTULQKSggOwh2Oq9m6O
         YRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781429191; x=1782033991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NT1UtqM2AmX11NcJjNv9n62UrLKyvxdMBYbCsYRy7Tg=;
        b=bx98cJX/Z5hBQrVCLODRjNxPfG5jX4+xM5Aby+nTgB6JcA2m9cIreaTNjahVdned0h
         9edDMUbddaC5F1exNKkxccoKJDjmi8i632Zya5YxHOKAgBj3z8eNtVy+q5Xa/hDXLNCX
         xyml6Dd+jm0bmX1Ns68hM5bFrJooNDTl6CpQcZJfXJ0h62HZatCNtnIYQVytYBj9hID1
         P9RVjTBZ10x0rUbfy/vs7sYbKt+4jbuf11/MehY7rA7D9wvlgXazpxzOFuAmYCjFExWq
         rgiEfCZ4Uy6zOZKVXVaaMlHfS9Pzvb+1S0HaRqmEIxRADWIBdNQMyWmsW82ZdanPnB4B
         n9Og==
X-Forwarded-Encrypted: i=1; AFNElJ87524iuN14ujvKvDYRqx9nlqYWxnpZeLLK54BNsyaYciD/mQZhOOeGW06wpnEHmLOeNyHxufPfPRxORef9bRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGHNmLYtNgPWTnDFg8pgwnRoNXbiIoEkofK6+dzSLftPlsF1aU
	gQYlLwS48C10EPkl7+WsAnaHfnA4uFVx+AQshjW5gO8ym12r8T+8pRHQ
X-Gm-Gg: Acq92OGQ59+jCJK/9cgnzJgx/d/PRyFiH1SH3zFTfOyKqtsde33FeQyH8qaNxgn9sLP
	8eeW/ik1nVGt02YJHeCKYnuEK6SskefMbaTev9vKylLhEUGFcNADkc2E8feb2fGRrA0tlvUpzXn
	0ssqbS9KZcSnSh1pGYC8lrlAv/sLoMMxENzJA2DrbqclDQpGtWRzhl8mqrrozfQNt4BoruhtuES
	fTdCv18QxfMaue1IRXZK2jg3uY7VTRh2bV/lGDtmOTymNkXiGUm5jh/Vo/gNkL3wMovHWC4IgyS
	PmLcTr0YBtNz5u4AtlRH6K7PpWNYQ34TxGYkf2wU5gio96RQGNuWWLahnX6aq8Q/7toAj6uJEFR
	stjfqVfcVyyYWJ1mxOEPv+bZpGTAOb0fjP8hNQFFlg7QQOz9S5WnL9ndtJh4LoQtC9gRAm9yWfc
	CBeKRXaDJ6+3d+S5+V4XBS1CYb5or98G6qxhAb/A27GPlzidZfr64FALxaI3DvHUTEs1tTVw3W6
	c9/syGA/2PPZ5c6
X-Received: by 2002:a05:6a00:3c8c:b0:842:688f:307f with SMTP id d2e1a72fcca58-8434cf0e0e6mr10983905b3a.28.1781429190897;
        Sun, 14 Jun 2026 02:26:30 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b057461sm8198423b3a.58.2026.06.14.02.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 02:26:30 -0700 (PDT)
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
Subject: [PATCH bpf v2 1/2] libbpf: Reject out-of-range linker relocation offsets
Date: Sun, 14 Jun 2026 18:26:15 +0900
Message-ID: <20260614092616.165337-2-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260614092616.165337-1-sammiee5311@gmail.com>
References: <20260614092616.165337-1-sammiee5311@gmail.com>
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

