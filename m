Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792714646;
	b=cKRsU7cSbyxTvDCZ+Hx069NzArC/9iHJMW1sLN8GCmfyHyAtd4WvU3FX5XxckX2dDjeY
	 xegVJHkHp0z6rzhAwt5z5OjWz7XS+QhEeyswXgb2JD8SCjNHl5kMDdBOqTShy5JvsuWWb
	 v7zSFCF/AJZd1rN5Axxum5sZ1cR1ezrvdygmKOevXBn4rt7VRo0usScl+karcjr2//x4k
	 9SuY7RTxs+FtAoRfNMApCLDILUnj2elrUIMtr7SbywfQE6FK8tLISNp58F4GEzI5mGuuj
	 AZUH0b+IuZmMqYgCE+KHZO2bQOiTi3r7TwzfuJob7+ySaCKye5c2Adz+LerHfqVRhYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=oBYxcbD5svbaTalp54IT3TgPIj7U31fwSGEAMAykp6g=;
	b=v8fx8ZtP3EfVambSpK+pSRsgl7b5FbHvpatv7REO06emFpjlJc0sE9WxII3dfaIfgokK
	 eQFjp7VSfeRABDHY3l+qz3DjbmKtpG/ZQBrOo9uHRjsIeSe8jNSOmaGK9dMK9T09xMlV9
	 c9RwQL1F5wCmrfa3t9d/BsS+Flzg8GlkmEObvvfkRvndV/yQH7NB3/asEulYMkgBb1BiN
	 6b95sJu0ziHYsPCTGsQnsaj7Q6oPjWZYoqED8Bsmm/Rzg41mJKu3Zf8J/s6l5RBQpjW9o
	 levw/D23eg6CEh7cKlrLWhE7KBH3qD2sKeJevUKjuQyQ13DkxJ/EGq60rLophWo2TGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Uzdjs9XQ;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DE0606A31D
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 00:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79DE0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Uzdjs9XQ
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso477428eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 17:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792714646; x=1793319446; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBYxcbD5svbaTalp54IT3TgPIj7U31fwSGEAMAykp6g=;
        b=Uzdjs9XQVOgnkMzwfBYWvjzVPffgDZiQPHuB7ca4I04DBEfMxl+SZG2cJaTPfFOhwN
         t+g5y1oKjg1juaBKzo9njVVZJwP1DJtyBkRQhBQXvBsLQXvF6LgBncxC7JQJr0vDXhqi
         CP+7nNAOsooUIFkJ0iptaqUyOkBz2hNfRdjSz3rpEsqCnLeLg8kxvKWrxsIoAJdogkmB
         YPBpTk4CFBJKy6jXMT3L+7yw5RplJVA6nAlT+WJPWHicaHslH4es3yLeBG+O8C+XiPme
         h0pgfg4n0lRqt+1SwqQjKxolYOTGP0Wh3MRm5Hl8ntmbsGJ7Tz94WD2BVli+bR96kugY
         DEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792714646; x=1793319446;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oBYxcbD5svbaTalp54IT3TgPIj7U31fwSGEAMAykp6g=;
        b=zK+dclsquY6YufKJ3veCN+ayDSb+Z7uFKJ8q9OhoTIzzy+LVPxtXXGDqlDs6B5CLB4
         fpFeAGlHtviBEF0w3GYz1IK1vBDCdRI41nRNsNE0wJf4p07ap5RtI4HyHRTqXYBXZnPJ
         tDrJlC4lKJ5xS6DSc+JpLnQQ1Cx4KUgax9Y7unS6TrwtvRCdALwopb6JUVyi+mzWFfnu
         rlpw1xhTvd+kbizGT+VamT6wkdTjHXIoV/bwXKzmM1RVjkGRxee+OFiamN+RQNRY511k
         oqikxWH9U0UuPWdl6s8jtjvTXo/9JcKxGLjiODsxtFEp/MlTFjgD4yloPc1vtaVt1Snq
         kw+A==
X-Forwarded-Encrypted: i=1; AKwUvBzGjlA0IRm1KJKnoFvU9LBcaqfdMGTFODZJnwdJ2pPVFpshe+qlxsZ4Ugl+t4affkl0z/dcMf8EM4Bq0VIgae0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6fSRwydGp1avOM/6xO9g7od795JG83PaceqbP7ksm9rluy2Cc
	C2SYERImKYGzhFasrJXFf23qRcE4pG8MwmyYlHJc8cbMCEIITOs7mCxeE1XMSjmjKCRkQ/ZlpYr
	EgvAMTIfm8c/PVA==
X-Received: from dlbps4.prod.google.com ([2002:a05:7023:884:b0:191:327b:5758])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:4184:b0:16c:ff3a:d72e with SMTP id a92af1059eb24-195c6b29320mr1346079c88.20.1792714645130;
 Thu, 22 Oct 2026 17:17:25 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:16:03 -0700
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
Message-ID: <20261023001603.560210-10-wusamuel@google.com>
Subject: [PATCH bpf-next v2 2/6] tools: Copy KALLSYMS_QUERY definitions to linux/fs.h
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

Copy the KALLSYMS_QUERY ioctl definitions from include/uapi/linux/fs.h
to tools/include/uapi/linux/fs.h for libbpf and the proc and bpf
selftests. Only the new definitions are copied; other differences
between the two headers are left alone.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 tools/include/uapi/linux/fs.h | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tools/include/uapi/linux/fs.h b/tools/include/uapi/linux/fs.h
index f0a26309b6d5..d224516e6d6e 100644
--- a/tools/include/uapi/linux/fs.h
+++ b/tools/include/uapi/linux/fs.h
@@ -567,4 +567,45 @@ struct procmap_query {
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
 #endif /* _UAPI_LINUX_FS_H */
-- 
2.56.0.257.gf7497c7d27-goog

