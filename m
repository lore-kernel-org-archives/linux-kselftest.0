Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792714641;
	b=rCqNwzUza78fmGH51DzbMQbFKfMHxH1ZNJDuXGFvZYIYuSvwHjBEVxeCKvaMdkQzSKc2
	 92cj3lcxGy/W+PZoMmz4jYF4RUUF7zB923Y/f+Ddh+6dYjmrOu2E0DEtTMJ7uYeXI5U4u
	 mnuP0ZF+jLG23sT/Owuil0WdMmN6BvDaBm/qdt02VrVu0+8dv+NVYabEnFc+Oyu3lqxu7
	 zqn4VSQ7wJZHcxLk2MAd2DGOAQBTGdT5ApOg3E7tRT0Nfg3Md6nqWJoVKVpsHRHsAhlME
	 uAP7aDqKgN13wrnLyDs8PxjAPU/XI42VVa0f1RUVUktCXhjC5Zj+xrGv1d2vW6Dk4Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=0Vwewxr3dGHbxdmCY5GF/H1DQ3R3gLJWSWoXd5grtFk=;
	b=sj7cQ5S7RaiNu87tSQlRfQ5eno/MHFiruIuYn3EDbjxZ6VxV/tBtBUtHBeMRzks9F6dl
	 AZtqw9drcPIqjahnKEZzhoPYOkUaKdMD5CKWF3gwrzVsgsb4yiIi4bsDchY4bYvVSFOvv
	 eFzVmGZ0owX7kHM13w3UIyiZT1XzoBxXt5yLjki0UNvBCYEyMvLsu0WpIqS8iLs/KwmdA
	 JzRyPgSoQRubMU9StX5Gw2mh4PPSEGoZhIrp546bSRA3oEei3SJDF7yFkb5l0sCbY/HFA
	 EV5/WECYPn1EK5eDMpEUukszQs54cC+ja7170iO+bpCu+61a6dU4fYJE2xs3gpcjw9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=aY6LBym2;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3344F606A323
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 00:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3344F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=aY6LBym2
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3662e7a9299so1530846eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 17:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792714640; x=1793319440; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Vwewxr3dGHbxdmCY5GF/H1DQ3R3gLJWSWoXd5grtFk=;
        b=aY6LBym2Ig0tTWjc7tVYEgZWQMTJgAyjb9mvZDGXWgSCe25T2tf7BoW0O+CYPHrjMs
         0o4AMkdEAqzaZdBeoVqZ4jBzlD0SHR5285FjUntf7GJhfmriS1vOkFH+T1K83NIpGP/V
         ec7DVUAXxdt2T0IuZo6aoZKXsPGRhQwpkbeh+4rYdr7ozIsNZ4jpqYp3uUMN8WUdwEz9
         /pBY8KngB4nD+J/jhYmmgprtTOcm++28nRj9tWCjAXRBHTds1xrngwRvaUp0GR6fcthV
         J76Hsjqq6iAfDEIYbTVcBVTzgQE0G4qZpnam4k9KSKT8Xkx7zjQa5AP3a0OuvAF65HF9
         Zhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792714640; x=1793319440;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Vwewxr3dGHbxdmCY5GF/H1DQ3R3gLJWSWoXd5grtFk=;
        b=eUYAftb9ZgxHGUrE4ufuD1VGboXHDQYgM5AX2CA90yremj4FonBfXxJWv0EJPN1naI
         CVNm29DeoGkibfUp6tNpILvIs86sKNbOr6VOeIMAMtY8o3lgoRgDn+QrslXxRCQWeEsL
         nHETLvkx69i2tC/oiby/WwigYVdb4zW88GrQfXdeY0dH06vUQ3Ua0LkaK54cfNRJYtIa
         5wmid2r9VjjfeWzBUGFMwSGgQz4iH+q6yo6IsKzyMP0F0JgLOStxW5dcBtm9kuFFMPNB
         BZPWUj7VuH2Xdg9WfRntXjsTyY1NfV8z84Y2wVazUMEuIkW1GXgJTIdDhWjlOj09AcU2
         E7FA==
X-Forwarded-Encrypted: i=1; AKwUvBxzW8FF3JrlXF6x2fOWMJMFPXIkq5NCI99A8P9FGsmt+IVCa0Gwns4Z9XXA3dbO+iRCxteZq1CtUBXPH65LHYI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK91gmuvvkqFamW3U7I+UV/+1Kq0QDJyNm06RVlvpnCRWAexssk
	NW9+dWMquQfFEd6699KTpw9+/v9mY1tB3xnUnWOql/DK8cp+GrNxvHHxV3ydq1t0bIA5WgGpsLU
	45IKcEJJmLxN5og==
X-Received: from dlbui12.prod.google.com ([2002:a05:7022:3d0c:b0:158:5d29:90be])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:4516:10b0:17b:fed6:7449 with SMTP id a92af1059eb24-195a1b7bb65mr1180457c88.47.1792714639933;
 Thu, 22 Oct 2026 17:17:19 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:16:02 -0700
In-Reply-To: <20261023001603.560210-8-wusamuel@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023001603.560210-9-wusamuel@google.com>
Subject: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: Samuel Wu <wusamuel@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Add an extensible KALLSYMS_QUERY ioctl() interface to /proc/kallsyms
to support fast point queries without scanning the entire text file.
Exactly one query mode must be set in query_flags.

When KALLSYMS_QUERY_BY_SYMBOL is set in query_flags, KALLSYMS_QUERY
resolves a NUL-terminated symbol name in vmlinux or loaded modules and
then populates sym_addr:
- Searches vmlinux first via kallsyms_lookup_names() (binary search),
  which takes precedence over loaded modules, and falls back to
  module_kallsyms_on_each_symbol() under module_mutex for module
  symbols
- Matches names exactly, like kallsyms_lookup_name(), disregarding the
  .llvm.<hash> matching, following precedent set by commit fb6a421fb615
  ("kallsyms: Match symbols exactly with CONFIG_LTO_CLANG")
- Resolves 0x0 symbol addresses in both vmlinux and modules
- Rejects ambiguous symbols (multiple entries with the same name at
  different addresses within vmlinux, or across loaded modules) with
  -EADDRNOTAVAIL, while allowing same-address aliases

Userspace symbolizers resolve kernel addresses to symbol names with
/proc/kallsyms. This is typically done by reading the entire
/proc/kallsyms text file, and keeping a compressed sorted copy of it in
order to resolve addresses at runtime.

When KALLSYMS_QUERY_BY_ADDR is set in query_flags, KALLSYMS_QUERY
resolves one address to the symbol that contains it:
- sym_addr holds the address to resolve on input.
- sym_name_addr must point to a user buffer of sym_name_size bytes
  that receives the NUL-terminated symbol name. On output,
  sym_name_size holds the number of bytes written (including the
  terminating NUL). -ENAMETOOLONG is returned if the buffer is too
  small; a buffer of KSYM_NAME_LEN (512 at the time of writing) bytes
  is always large enough.
- Symbols are resolved via kallsyms_lookup(), the same lookup as %pS,
  covering vmlinux, loaded modules, BPF JIT images, and freed module
  init functions still tracked by ftrace.

On an 8 CPU Cuttlefish (x86-64 VM), using this patchseries to load a BPF
program with 11 typeless ksyms has ~220x speedup (157ms -> 0.7ms).

On an 8 CPU x86-64 VM with a 175k line kallsyms, there are broad
performance and memory savings for the symbolization and callstack
sampling tool, Perfetto:
- Init time: ~350x speedup (155.7ms -> 0.44ms)
- 50k symbolizations: ~12x speedup (25.2ms -> 2.2ms)
- VmRSS: -68% (15.1MB -> 4.8MB)

Suggested-by: Andrii Nakryiko <andrii@kernel.org>
Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 include/uapi/linux/fs.h |  41 +++++++++++++
 kernel/kallsyms.c       | 132 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 173 insertions(+)

diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index 34c6f219462a..b43f227dad0e 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -674,6 +674,47 @@ struct procmap_query {
 	__u64 build_id_addr;		/* in */
 };
 
+/* /proc/kallsyms ioctl */
+#define KALLSYMS_QUERY	_IOWR(PROCFS_IOCTL_MAGIC, 18, struct kallsyms_query)
+
+/* Exactly one query mode must be set in query_flags. */
+enum kallsyms_query_flags {
+	/*
+	 * Look up a symbol in vmlinux or loaded modules (vmlinux first; BPF
+	 * and ftrace symbols are not searched) by exact NUL-terminated name
+	 * at sym_name_addr and return sym_addr. sym_addr and sym_name_size
+	 * must be 0 on input.
+	 */
+	KALLSYMS_QUERY_BY_SYMBOL = 0x01,
+	/*
+	 * Look up the symbol covering sym_addr and write its NUL-terminated
+	 * name to the sym_name_addr buffer of sym_name_size bytes. The same
+	 * symbols as %pS are searched: vmlinux, loaded modules, BPF JIT
+	 * images, and freed module init functions still tracked by ftrace.
+	 * A buffer of KSYM_NAME_LEN (512 at the time of writing) bytes is
+	 * always enough. On success, sym_name_size is set to the number of
+	 * bytes written (including the terminating NUL).
+	 */
+	KALLSYMS_QUERY_BY_ADDR = 0x02,
+};
+
+/*
+ * Returns -ENOENT if no symbol matches, -EADDRNOTAVAIL if the name maps to
+ * more than one address, -ENAMETOOLONG if the name does not fit in
+ * KSYM_NAME_LEN (512 at the time of writing) or sym_name_size bytes, and
+ * -EPERM if kallsyms addresses are hidden from the opener of /proc/kallsyms
+ * (e.g. kptr_restrict).
+ */
+struct kallsyms_query {
+	__u64 size;		/* in - struct size for compatibility */
+	__u64 query_flags;	/* in - query mode (enum kallsyms_query_flags) */
+	__u64 sym_name_addr;	/* in - address of symbol name buffer */
+	__u64 sym_addr;		/* out (BY_SYMBOL) / in (BY_ADDR) */
+	__u64 sym_name_size;	/* in/out - name buffer size / bytes written */
+};
+
+#define KALLSYMS_QUERY_SIZE_VER0	40 /* sizeof first published struct */
+
 /*
  * Shutdown the filesystem.
  */
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index aec2f06858af..7caaf3e421c7 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -31,6 +31,7 @@
 #include <linux/kernel.h>
 #include <linux/bsearch.h>
 #include <linux/btf_ids.h>
+#include <linux/uaccess.h>
 
 #include "kallsyms_internal.h"
 
@@ -922,11 +923,142 @@ const char *kdb_walk_kallsyms(loff_t *pos)
 }
 #endif	/* CONFIG_KGDB_KDB */
 
+struct kallsyms_mod_find_ctx {
+	const char *name;
+	unsigned long addr;
+	bool found;
+};
+
+static int kallsyms_mod_find_cb(void *data, const char *name, unsigned long addr)
+{
+	struct kallsyms_mod_find_ctx *ctx = data;
+
+	if (strcmp(name, ctx->name) != 0)
+		return 0;
+	if (ctx->found && ctx->addr != addr)
+		return -EADDRNOTAVAIL;
+	ctx->found = true;
+	ctx->addr = addr;
+	return 0;
+}
+
+static int do_kallsyms_query(struct kallsym_iter *iter, void __user *uarg)
+{
+	char namebuf[KSYM_NAME_LEN];
+	struct kallsyms_query karg;
+	unsigned long addr;
+	unsigned int start;
+	unsigned int end;
+	unsigned int i;
+	__u64 usize;
+	long len;
+	int err;
+
+	BUILD_BUG_ON(sizeof(struct kallsyms_query) != KALLSYMS_QUERY_SIZE_VER0);
+
+	/*
+	 * The text interface shows zero addresses to openers without permission.
+	 * A zeroed point query result is useless (and an address-to-symbol query
+	 * would leak KASLR), so fail instead.
+	 */
+	if (!iter->show_value)
+		return -EPERM;
+	if (copy_from_user(&usize, uarg, sizeof(usize)))
+		return -EFAULT;
+	if (usize > PAGE_SIZE)
+		return -E2BIG;
+	if (usize < KALLSYMS_QUERY_SIZE_VER0)
+		return -EINVAL;
+
+	err = copy_struct_from_user(&karg, sizeof(karg), uarg, usize);
+	if (err)
+		return err;
+
+	switch (karg.query_flags) {
+	case KALLSYMS_QUERY_BY_SYMBOL:
+		if (karg.sym_addr || karg.sym_name_size)
+			return -EINVAL;
+
+		len = strncpy_from_user(namebuf, u64_to_user_ptr(karg.sym_name_addr),
+					sizeof(namebuf));
+		if (len < 0)
+			return len;
+		if (len == 0)
+			return -EINVAL;
+		if (len == sizeof(namebuf))
+			return -ENAMETOOLONG;
+
+		if (kallsyms_lookup_names(namebuf, &start, &end)) {
+			struct kallsyms_mod_find_ctx ctx = { .name = namebuf };
+
+			err = module_kallsyms_on_each_symbol(NULL, kallsyms_mod_find_cb, &ctx);
+			/* Check first: maps -EOPNOTSUPP (CONFIG_MODULES=n) to -ENOENT. */
+			if (!ctx.found)
+				return -ENOENT;
+			if (err)
+				return err;
+			addr = ctx.addr;
+		} else {
+			addr = kallsyms_sym_address(get_symbol_seq(start));
+			for (i = start + 1; i <= end; i++) {
+				if (kallsyms_sym_address(get_symbol_seq(i)) != addr)
+					return -EADDRNOTAVAIL;
+			}
+		}
+
+		karg.sym_addr = addr;
+		break;
+	case KALLSYMS_QUERY_BY_ADDR:
+		if (!karg.sym_name_size)
+			return -EINVAL;
+		addr = karg.sym_addr;
+		/* Reject addresses that do not fit in unsigned long (32-bit). */
+		if (addr != karg.sym_addr)
+			return -ENOENT;
+		if (!kallsyms_lookup(addr, NULL, NULL, NULL, namebuf))
+			return -ENOENT;
+
+		len = strlen(namebuf) + 1;
+		if (karg.sym_name_size < len)
+			return -ENAMETOOLONG;
+		if (copy_to_user(u64_to_user_ptr(karg.sym_name_addr), namebuf, len))
+			return -EFAULT;
+
+		karg.sym_name_size = len;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (copy_to_user(uarg, &karg, min_t(size_t, sizeof(karg), usize)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long kallsyms_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct seq_file *m = file->private_data;
+
+	switch (_IOC_NR(cmd)) {
+	case _IOC_NR(KALLSYMS_QUERY):
+		if (!extensible_ioctl_valid(cmd, KALLSYMS_QUERY, KALLSYMS_QUERY_SIZE_VER0))
+			return -ENOIOCTLCMD;
+		return do_kallsyms_query(m->private, (void __user *)arg);
+	default:
+		return -ENOIOCTLCMD;
+	}
+}
+
 static const struct proc_ops kallsyms_proc_ops = {
 	.proc_open	= kallsyms_open,
 	.proc_read	= seq_read,
 	.proc_lseek	= seq_lseek,
 	.proc_release	= seq_release_private,
+	.proc_ioctl	= kallsyms_ioctl,
+#ifdef CONFIG_COMPAT
+	.proc_compat_ioctl = compat_ptr_ioctl,
+#endif
 };
 
 static int __init kallsyms_init(void)
-- 
2.56.0.257.gf7497c7d27-goog

