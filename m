Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF2332573F
	for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 09:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781429200; cv=none; b=tbCsXxX1VWC9xW+AnCHyiUvxJMyRT4i3LGG9ZEK0G3/cd7cia6ikuzs1LtcrL80IWMExXXS8YrP+xSQnZquErMvXgvX+uH8JjVPEerEaG6IE1nmrHJDI54FjipJDXEM2TbQcbJpB6bjXsPy1/AS+FV3bqEKkesMlhgm9rkhuNMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781429200; c=relaxed/simple;
	bh=LnLCJeY2MCYFpNrYFIsLblszDACadKparGEugKx60O0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQ0V4FH9FZbACblks9cNOsRLXF4iilBnAEDMSgPFBzkDZ6HpQZ+NsAw5uEQl1u2cWgBP7AT1QQfHdSaRhrv+RhZY3pgIKhiA6iUtCWI/IAudN1G6P7NvcxKUDzIeJ34w7FwrRJZqbYAjnbkaXBijTWuvPnDUv03IgTBxsnWFo90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRcurbwg; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRcurbwg"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8422524cb38so935532b3a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 02:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781429195; x=1782033995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ccw1cXA8Whksjz16g6cc9ZDh3pj4I9bieIjplmkgzHA=;
        b=mRcurbwgJWKCv5G0/OViDKi+GrR6UIgneAQCS4aax8V+dqt8VJlCjA4WouQhjGP9LE
         Ztqi1ydaJF1meX2CgTLzlqsoOPajbD5frQchENflK0tSwvH3zgGbnwAqCvgwUT7nfBJr
         XVrY2T09BfuSR9KInhuW6eXusbaGIHgkNdsAp77Y+vQ7AOt+pT/rf0lwQVO9EhGzONYx
         KottUQAHAi92gMLzlF1ThfeSLPjXeNN7IaNzgKfOJuVQ0wgggWqLqkkNDGzippxHqL5e
         wx4k8l1jLRxiQ/zWY3zZyxxMM2QuL5FpePG3L1PNSizry/sAZXmuI/8DRMm/UDIs79UV
         uNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781429195; x=1782033995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ccw1cXA8Whksjz16g6cc9ZDh3pj4I9bieIjplmkgzHA=;
        b=TBC1GwW/ROTKLjvdRK8+GIAyefSARVXLBfXbwQWQKA7+SsZl5IZQp8ifnqXD/2IRyf
         Kvh2cRKPVkE4yo31rpBbQbwPT2higlZHU3U4XTZk73zhCcR4k6YRi5gtkLOE8a3HBJNX
         4EOxKxfeFT8la+X19hWOOJXSjVh3vhr5CtZVhGmEP+0TwVyVcbfZPMZSG1fDrVKCmMFL
         rErafqzNINerkmPByzJM8bEsTmVhkh50JQKUSv4owKPoGdIzVKbTquXNWqT9a13+cQwg
         D/zrv7qrJio0aB1qjQBiCpE8lMfGJVFvy7zj2fwn/dUGCOvRkuoXm8Nl5H1PFSD3bifd
         iD+w==
X-Forwarded-Encrypted: i=1; AFNElJ/Di+wIqEKxPlrmUVrDVXj2Ssf9wyN5aFIShKiXttGq5MYU45GMXy4yBzvdothunBSzst4AiNEZtl04CQ0td08=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUlklVR+UBWM8XdgNYcZ22iELg9PR+We+PFEiGybi8qtFu+ZU5
	RQH1ro6ZKYoJI/oGEMKkWU+1SnO+Evg0+6zVy6c8QWWPyr5PExYr4ilL
X-Gm-Gg: Acq92OHQIdHKzbi7QxP7os1W9HNRaMuR5FXWhD52kCZz8IWp6RfqVlZmdag33Hg/dD6
	8/v8ofDWFXTFectyQVl36eIy/DvyhbFhv9EY/uNkeZFDI6OBOSAXKXihjAk0IPhKyJSACPOZfub
	sr7gzt0JImN1tjUF7rVx1WMifKoPBnuh3zSEumcm4iIyOZzv6FbC7JdhO1WTXQH4VQM65OIhC1N
	b2hFf8E/RJq13CJiyqdyOL0PdpFhfLlYZ7saT4mAduvKOzEGkn4OhYTXXi8vcxuofjVuRT6xqMd
	dJPReMgBS87BpNRuHCgo6OHC8zz27XHTlXV7eCSyyhg0YVCrJnnr8mpkYjqvJvmBNwkxYZ987dC
	W8IeyvcL1q6bt8Wo3awPYj/+gkI4U8awbtatYpMWFuirBi93m6Z2JIKrFXub8jlQfGNvguINdkq
	A+kOQXIBEINYliOnUOsawDTRGHK/KpF8SIDVA9df+Ro400dqm/mGYefg6ZTBOazjpZXv1fMU9He
	ic2N+N8WEImysid
X-Received: by 2002:a05:6a00:4ac8:b0:842:6d5d:58dc with SMTP id d2e1a72fcca58-844e1aae931mr6540658b3a.43.1781429195189;
        Sun, 14 Jun 2026 02:26:35 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b057461sm8198423b3a.58.2026.06.14.02.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 02:26:34 -0700 (PDT)
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
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH bpf v2 2/2] selftests/bpf: Test linker rejects out-of-range relocation offset
Date: Sun, 14 Jun 2026 18:26:16 +0900
Message-ID: <20260614092616.165337-3-sammiee5311@gmail.com>
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

Add regression coverage for libbpf static linker relocation offset checks.

Build a minimal ET_REL/EM_BPF object in memory with a 16-byte executable
section and one relocation against that section. Check that a valid
relocation offset is accepted and an offset outside the relocated section
is rejected with -EINVAL.

Assisted-by: Codex:gpt-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 .../selftests/bpf/prog_tests/libbpf_linker.c  | 231 ++++++++++++++++++
 1 file changed, 231 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/libbpf_linker.c

diff --git a/tools/testing/selftests/bpf/prog_tests/libbpf_linker.c b/tools/testing/selftests/bpf/prog_tests/libbpf_linker.c
new file mode 100644
index 000000000000..a0a61b32fe2e
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/libbpf_linker.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <elf.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <unistd.h>
+
+#include <bpf/libbpf.h>
+#include <linux/bpf.h>
+#include <test_progs.h>
+
+#ifndef EM_BPF
+#define EM_BPF 247
+#endif
+
+#ifndef R_BPF_64_64
+#define R_BPF_64_64 1
+#endif
+
+enum {
+	SEC_NULL,
+	SEC_TEXT,
+	SEC_REL_TEXT,
+	SEC_SYMTAB,
+	SEC_STRTAB,
+	SEC_SHSTRTAB,
+	SEC_CNT,
+};
+
+enum {
+	SHSTR_TEXT = 1,
+	SHSTR_REL_TEXT = SHSTR_TEXT + sizeof(".text"),
+	SHSTR_SYMTAB = SHSTR_REL_TEXT + sizeof(".rel.text"),
+	SHSTR_STRTAB = SHSTR_SYMTAB + sizeof(".symtab"),
+	SHSTR_SHSTRTAB = SHSTR_STRTAB + sizeof(".strtab"),
+};
+
+struct test_elf {
+	void *buf;
+	size_t sz;
+};
+
+static size_t elf_round_up(size_t value, size_t align)
+{
+	return (value + align - 1) / align * align;
+}
+
+static unsigned char elf_byteorder(void)
+{
+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+	return ELFDATA2LSB;
+#elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+	return ELFDATA2MSB;
+#else
+#error "Unrecognized __BYTE_ORDER__"
+#endif
+}
+
+/*
+ * Build a minimal ET_REL object in memory. A normal .bpf.c source cannot
+ * produce a relocation whose offset points past the relocated section, so the
+ * test constructs the ELF directly and feeds it to bpf_linker__add_buf().
+ */
+static struct test_elf make_relo_obj(size_t relo_off)
+{
+	static const char shstrtab[] = "\0.text\0.rel.text\0.symtab\0.strtab\0.shstrtab";
+	static const char strtab[] = "\0";
+	struct bpf_insn insns[] = {
+		{
+			.code = BPF_ALU64 | BPF_MOV | BPF_K,
+			.dst_reg = BPF_REG_0,
+			.imm = 0,
+		},
+		{
+			.code = BPF_JMP | BPF_EXIT,
+		},
+	};
+	size_t off, text_off, rel_off, symtab_off, strtab_off, shstrtab_off, shdr_off;
+	struct test_elf obj = {};
+	Elf64_Shdr *shdr;
+	Elf64_Ehdr *ehdr;
+	Elf64_Sym *sym;
+	Elf64_Rel *rel;
+
+	off = sizeof(*ehdr);
+	text_off = elf_round_up(off, 8);
+	off = text_off + sizeof(insns);
+	rel_off = elf_round_up(off, 8);
+	off = rel_off + sizeof(*rel);
+	symtab_off = elf_round_up(off, 8);
+	off = symtab_off + 2 * sizeof(*sym);
+	strtab_off = off;
+	off = strtab_off + sizeof(strtab);
+	shstrtab_off = off;
+	off = shstrtab_off + sizeof(shstrtab);
+	shdr_off = elf_round_up(off, 8);
+	off = shdr_off + SEC_CNT * sizeof(*shdr);
+
+	obj.buf = calloc(1, off);
+	if (!obj.buf)
+		return obj;
+	obj.sz = off;
+
+	ehdr = obj.buf;
+	memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
+	ehdr->e_ident[EI_CLASS] = ELFCLASS64;
+	ehdr->e_ident[EI_DATA] = elf_byteorder();
+	ehdr->e_ident[EI_VERSION] = EV_CURRENT;
+	ehdr->e_type = ET_REL;
+	ehdr->e_machine = EM_BPF;
+	ehdr->e_version = EV_CURRENT;
+	ehdr->e_ehsize = sizeof(*ehdr);
+	ehdr->e_shoff = shdr_off;
+	ehdr->e_shentsize = sizeof(*shdr);
+	ehdr->e_shnum = SEC_CNT;
+	ehdr->e_shstrndx = SEC_SHSTRTAB;
+
+	memcpy(obj.buf + text_off, insns, sizeof(insns));
+
+	rel = obj.buf + rel_off;
+	rel->r_offset = relo_off;
+	rel->r_info = ELF64_R_INFO(1, R_BPF_64_64);
+
+	sym = obj.buf + symtab_off;
+	sym[1].st_info = ELF64_ST_INFO(STB_LOCAL, STT_SECTION);
+	sym[1].st_shndx = SEC_TEXT;
+
+	memcpy(obj.buf + strtab_off, strtab, sizeof(strtab));
+	memcpy(obj.buf + shstrtab_off, shstrtab, sizeof(shstrtab));
+
+	shdr = obj.buf + shdr_off;
+	shdr[SEC_TEXT] = (Elf64_Shdr) {
+		.sh_name = SHSTR_TEXT,
+		.sh_type = SHT_PROGBITS,
+		.sh_flags = SHF_ALLOC | SHF_EXECINSTR,
+		.sh_offset = text_off,
+		.sh_size = sizeof(insns),
+		.sh_addralign = 8,
+		.sh_entsize = sizeof(struct bpf_insn),
+	};
+	shdr[SEC_REL_TEXT] = (Elf64_Shdr) {
+		.sh_name = SHSTR_REL_TEXT,
+		.sh_type = SHT_REL,
+		.sh_offset = rel_off,
+		.sh_size = sizeof(*rel),
+		.sh_link = SEC_SYMTAB,
+		.sh_info = SEC_TEXT,
+		.sh_addralign = 8,
+		.sh_entsize = sizeof(*rel),
+	};
+	shdr[SEC_SYMTAB] = (Elf64_Shdr) {
+		.sh_name = SHSTR_SYMTAB,
+		.sh_type = SHT_SYMTAB,
+		.sh_offset = symtab_off,
+		.sh_size = 2 * sizeof(*sym),
+		.sh_link = SEC_STRTAB,
+		.sh_info = 2,
+		.sh_addralign = 8,
+		.sh_entsize = sizeof(*sym),
+	};
+	shdr[SEC_STRTAB] = (Elf64_Shdr) {
+		.sh_name = SHSTR_STRTAB,
+		.sh_type = SHT_STRTAB,
+		.sh_offset = strtab_off,
+		.sh_size = sizeof(strtab),
+		.sh_addralign = 1,
+	};
+	shdr[SEC_SHSTRTAB] = (Elf64_Shdr) {
+		.sh_name = SHSTR_SHSTRTAB,
+		.sh_type = SHT_STRTAB,
+		.sh_offset = shstrtab_off,
+		.sh_size = sizeof(shstrtab),
+		.sh_addralign = 1,
+	};
+
+	return obj;
+}
+
+static int link_relo_obj(size_t relo_off)
+{
+	char path[] = "/tmp/libbpf_linker_relo_XXXXXX";
+	struct test_elf obj = {};
+	struct bpf_linker *linker;
+	int err, fd;
+
+	fd = mkstemp(path);
+	if (!ASSERT_OK_FD(fd, "mkstemp"))
+		return -errno;
+	close(fd);
+
+	linker = bpf_linker__new(path, NULL);
+	if (!ASSERT_OK_PTR(linker, "linker_new")) {
+		err = libbpf_get_error(linker);
+		goto out_unlink;
+	}
+
+	obj = make_relo_obj(relo_off);
+	if (!ASSERT_OK_PTR(obj.buf, "make_relo_obj")) {
+		err = -ENOMEM;
+		goto out_free_linker;
+	}
+
+	err = bpf_linker__add_buf(linker, obj.buf, obj.sz, NULL);
+	if (!err)
+		err = bpf_linker__finalize(linker);
+
+	free(obj.buf);
+out_free_linker:
+	bpf_linker__free(linker);
+out_unlink:
+	unlink(path);
+	return err;
+}
+
+static void test_valid_relo_offset(void)
+{
+	ASSERT_OK(link_relo_obj(0), "valid_relo_offset");
+}
+
+static void test_invalid_relo_offset(void)
+{
+	ASSERT_EQ(link_relo_obj(0x1000), -EINVAL, "invalid_relo_offset");
+}
+
+void test_libbpf_linker(void)
+{
+	if (test__start_subtest("valid_relo_offset"))
+		test_valid_relo_offset();
+	if (test__start_subtest("invalid_relo_offset"))
+		test_invalid_relo_offset();
+}
-- 
2.43.0

