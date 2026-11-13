Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608059;
	b=DFKZ3nMgRMAroC5UayLvHoEG6VcIwloZdtNE+m7vR4rUTI6WH5s9FxyFtcmpGSsolBNs
	 JsLxdCVv134tQWhGu5xm0dlxRyJE7CXVoj87O2etvD0f3E1m7qdizpXkOt37MaddIfdUq
	 UCEXW416aHN9PpfPQuHuQ5gwxp1HwF3TLlsA3LuHGfJYxM7KsExpaFKlwqWMDXZOtnnIA
	 5V0r6adK7DPJHflKtq1S4mcPmhI4upgOOzrph82b/bz2+FjkAy7R/1rIuBusicGmPEA34
	 60jRAXCbc7Zws3XQoJtl22CjNtsvBSrGx4nojzXzNFrWFR0dJCzwEuX3Qu7xszjWE8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pgq9kE5SUICsmlCxk4e9GW8xjHVaimZWvwiBTJYrn4w=;
	b=UaOUbbJhyzXgKcZCRcMGtQytOjSM3Q6ZIYosBk2ElE8c5ibJjNZnYEX3TsuW+EZAZs2P
	 Nh0NGZ/8obWVwH8OL1kHWRtxp2ma0IXwf1Dr3RcV7QLclowOBX5BhyEu1Kkx7+/38y80g
	 oM8q93GTN3yAfHcgfACaYp20KQmVwBaFftd0Vm0v28e4WWGqwtCwXd5BRTmaxcmFbdOpN
	 R4p65cGIeS9udCaRHcvHKClgPC9BuneZTOAHIASYyGaAlDSPn9U5DCdsNRDYHAa8u31xW
	 sgOiUXAexD6xGuOB3uLgOBuvrTrohqEMHXv4wPwLfphez0aOio+eiVROG2WQc4aZcAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hWpqsqsi;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BED60A261C
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 22:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48BED60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hWpqsqsi
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1792201eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 14:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794608058; x=1795212858; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgq9kE5SUICsmlCxk4e9GW8xjHVaimZWvwiBTJYrn4w=;
        b=hWpqsqsi5Ai7VfHGHkn2ypoSvjA52xdLL/+tVGmCOmpGeUZLIqhLbki3VsruNTrq3u
         Zg8eEN0fODY0o4LzDatAmU45Pmhobu/M38df8hpaaxPjwOXEaCT2HQ0MgxZJ1X9un901
         aTUU1JlNvDY6FMkQ8vFn/wJPP8zrdhvKoNVZE00dqIIDfsb8bBTajo9wOXN7eAeuUoKG
         MWG9s1NSljJW4v+a3EWb81B+yS2xNnPvdIJXLvJ0Hdue9E8vj8h5CVtFGQ7BXhXSCa/O
         YFjO2l86t7bZgMT74iKltKqoKIPcBFYhYkznd5vLUAVkVq/32Yr0ulo+K5FowxJNqOlq
         XYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608058; x=1795212858;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgq9kE5SUICsmlCxk4e9GW8xjHVaimZWvwiBTJYrn4w=;
        b=GabH6o0sQMPFOpflKAZ1akKLWIcLubJayF151O6E86dLD0R/grprsK45a3oZq88PG/
         OtkjjHaIg9F3JOrn/jvOBAG3mlC/yBroFiz0zCHKu5CpAIZyxcW0sPDqOkuH+oajkMF6
         bhHi7k+rMXXUY4t7T+4UEL98OLvoaiPw60U0NN6EZRJpLKZ5zQW2USqiPrRqRq37mp6p
         pu3MA4pPw2XZ3xHwChrozI9KnS7wo5huGZH5nuJF0wfLZImuT0EionakIGECtdCIQ0vB
         OPp6+p5kQAhvF9n6BffFcVU2mdM3dwkLgV+Di0JZk5i5X5zsQfp4ZkqYW/ikofVhXM8M
         ffRA==
X-Forwarded-Encrypted: i=1; AL+hErFFFlFubEsUkmxL6Jthow/ZYN/kFhsX4RZ6G0zJ/W3br+Hvv6wfGEibgyZx4sWngpvzoB64UVDfXMAQjyng0/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IcArdRhhT/5LNEc0tN81zyS725uR5wdnmA31zoxC730SNpaae
	U9enRW3PpiuBEV6RmqNGKt03SD5RkiTauC1rTpX6HlruNENE+fkzxLMgTnkXK7/KzyOpZqi2160
	ZXHQXW/dd9nJPBg==
X-Received: from dyay11.prod.google.com ([2002:a05:693c:62cb:b0:36f:9364:dc98])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:90b:b0:34d:755b:d60b with SMTP id 5a478bee46e88-37968b8a031mr3155013eec.34.1794608057786;
 Fri, 13 Nov 2026 14:14:17 -0800 (PST)
Date: Fri, 13 Nov 2026 14:12:49 -0800
In-Reply-To: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261113221248.3535369-15-wusamuel@google.com>
Subject: [PATCH bpf-next v3 4/9] kallsyms: Add KALLSYMS_QUERY_BY_ADDR ioctl to /proc/kallsyms
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, Samuel Wu <wusamuel@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Symbolizers such as Perfetto read all of /proc/kallsyms and keep a
sorted copy in memory to resolve addresses.

Add the KALLSYMS_QUERY_BY_ADDR ioctl. It returns the symbol that covers
an address, from the same sources and in the same order as %pS. BPF JIT
symbols are hidden when /proc/kallsyms hides them. query_flags must be
0; it is reserved for other modes.

The command uses 'f' 0x31; register 0x31 in ioctl-number.rst.

Suggested-by: Andrii Nakryiko <andrii@kernel.org>
Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 .../userspace-api/ioctl/ioctl-number.rst      |  2 +-
 include/uapi/linux/fs.h                       | 13 ++++
 kernel/kallsyms.c                             | 60 +++++++++++++++++++
 3 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index f5dbb597257a..d9b66e7a29b7 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -250,7 +250,7 @@ Code  Seq#    Include File                                             Comments
 'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                       conflict!
 'f'   10-11  linux/fs.h                                                conflict! procfs ioctls (PROCFS_IOCTL_MAGIC)
 'f'   13-27  linux/fscrypt.h
-'f'   30     linux/fs.h                                                procfs kallsyms ioctls (PROCFS_IOCTL_MAGIC)
+'f'   30-31  linux/fs.h                                                procfs kallsyms ioctls (PROCFS_IOCTL_MAGIC)
 'f'   81-8F  linux/fsverity.h
 'g'   00-0F  linux/usb/gadgetfs.h
 'g'   20-2F  linux/usb/g_printer.h
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index 987569dcdbea..c1a63c8560e2 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -676,6 +676,7 @@ struct procmap_query {
 
 /* /proc/kallsyms ioctls. -EPERM if the opener cannot see kernel addresses. */
 #define KALLSYMS_QUERY_BY_NAME	_IOC(_IOC_READ | _IOC_WRITE, PROCFS_IOCTL_MAGIC, 48, 0)
+#define KALLSYMS_QUERY_BY_ADDR	_IOC(_IOC_READ | _IOC_WRITE, PROCFS_IOCTL_MAGIC, 49, 0)
 
 enum kallsyms_query_flags {
 	/* Match query_name as a prefix. */
@@ -717,6 +718,18 @@ struct kallsyms_query_by_name {
 	__u64 sym_struct_size;	/* in - sizeof(struct kallsyms_query_sym) */
 };
 
+/*
+ * Find the /proc/kallsyms entry that covers query_addr, or return -ENOENT.
+ * ftrace trampolines and kprobe pages are not resolved yet.
+ */
+struct kallsyms_query_by_addr {
+	__u64 size;		/* in - sizeof(struct kallsyms_query_by_addr) */
+	__u64 query_flags;	/* in - must be 0 */
+	__u64 query_addr;	/* in - kernel address */
+	__u64 sym;		/* in - user ptr to struct kallsyms_query_sym */
+	__u64 sym_struct_size;	/* in - sizeof(struct kallsyms_query_sym) */
+};
+
 /*
  * Shutdown the filesystem.
  */
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 29a9da04d8a3..6d7032cd3fd6 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -1223,6 +1223,64 @@ static int do_kallsyms_query_by_name(struct kallsyms_query_by_name __user *uarg)
 					 &bufs->m);
 }
 
+/*
+ * Look up symbol from addr. Copy the module name under RCU, and hide BPF JIT
+ * symbols as /proc/kallsyms hides them.
+ */
+static int kallsyms_find_addr(unsigned long addr, struct kallsyms_sym_match *m)
+{
+	unsigned long offset;
+	char *modname;
+
+	guard(rcu)();
+	if (!kallsyms_lookup_buildid(addr, &m->size, &offset, &modname, NULL,
+				     m->name))
+		return -ENOENT;
+
+	/* Outside vmlinux, only BPF JIT symbols have no module name. */
+	if (!modname && !is_ksym_addr(addr)) {
+		if (!bpf_jit_kallsyms_enabled())
+			return -ENOENT;
+		modname = "bpf";
+	}
+
+	m->addr = addr - offset;
+	strscpy(m->modname, modname ?: "", MODULE_NAME_LEN);
+	return 0;
+}
+
+static int do_kallsyms_query_by_addr(struct kallsyms_query_by_addr __user *uarg)
+{
+	struct kallsyms_query_by_addr karg;
+	struct kallsyms_query_sym ksym;
+	struct kallsyms_sym_match m;
+	int err;
+
+	err = kallsyms_copy_query_from_user(&karg, sizeof(karg),
+					    offsetofend(struct kallsyms_query_by_addr,
+							sym_struct_size),
+					    uarg);
+	if (err)
+		return err;
+
+	if (karg.query_flags)
+		return -EINVAL;
+
+	err = kallsyms_copy_sym_from_user(&ksym, karg.sym, karg.sym_struct_size);
+	if (err)
+		return err;
+
+	if (karg.query_addr > ULONG_MAX)
+		return -ENOENT;
+
+	err = kallsyms_find_addr(karg.query_addr, &m);
+	if (err)
+		return err;
+
+	return kallsyms_copy_sym_to_user(karg.sym, karg.sym_struct_size, &ksym,
+					 &m);
+}
+
 static long kallsyms_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	struct seq_file *m = file->private_data;
@@ -1232,6 +1290,8 @@ static long kallsyms_ioctl(struct file *file, unsigned int cmd, unsigned long ar
 	switch (cmd) {
 	case KALLSYMS_QUERY_BY_NAME:
 		return iter->show_value ? do_kallsyms_query_by_name(uarg) : -EPERM;
+	case KALLSYMS_QUERY_BY_ADDR:
+		return iter->show_value ? do_kallsyms_query_by_addr(uarg) : -EPERM;
 	default:
 		return -ENOIOCTLCMD;
 	}
-- 
2.56.0.679.gc527c65306-goog

