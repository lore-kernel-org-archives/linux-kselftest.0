Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608088;
	b=DntyMTPh2yF0IbQY5V59xrgp7QQ7miguZZxu25zNuYKG9K2YPx28+et4rgx2n0kTWFiS
	 Snoaq6z/2pdaLKkgP9G4GiuGjhPG3UHzT0DoQM4LIxg9yh9J4qAMWP+M9yYEM6mwdVVyC
	 Qgoyz1YOpdZ84lAbbVEqGb6B1+rq5doI0QN0DEcAnUCTfN5BscM0exp2GEC7I9zZ+ctdY
	 6C++1ZMti6HILu1hVF2c91K5vmw3k4Er4Daat/wSkuFZKViEklv8gbjiQBTgF4eeAg+PB
	 klrPFFFlVPquPyN5we3CCxLzXaQQcKiM03l2tHRXqChX2ZFzevHtG76V7A7joCrQZ4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ggQ4FFC8Bi0XuOsjCC8PKsr9I1n0o4RHBwZ93v/svPs=;
	b=zmE/1k1UfHzj0htE3T0juPJ1rWaLl3y8RdaX4gZbqKVUPGNAcxOfRcEGdUCTEB+3MXdt
	 w1GpKgpdskA0gZBurzJTy539adSWmKeHHMdJwLgI6Ypd5vn+aOonNF7oYw01Sh1RK2A4M
	 5sORssoJZafsPK9/Dp98c9eJVFdl+/t877xgTPA67OpuYzPgTD1L7sJ0YG54NVOIF7NJu
	 5/4FX8ZuKlmDEP4HmBV7LZhs23JHESTsrNqbV1tq+KwmNerz1z9ofE7mKsG1b8FJS70/U
	 p55Vw3QTE+Zv3z4sxE8zRBZzwAo015RzN3tVikVF61xDNm4DBdaxMg7AOdmcocCBCbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="F0h/yyOj";
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3D260A5BDE
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 22:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F3D260A5BDE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F0h/yyOj
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so741574c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 14:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794608087; x=1795212887; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ggQ4FFC8Bi0XuOsjCC8PKsr9I1n0o4RHBwZ93v/svPs=;
        b=F0h/yyOjK9Z89u9J7XgnC5+HYvJukeUSvtRdGdXRYSd6FxItb0m1DCbjnB/F8XGPiH
         u0Mx0HpIawZ/cpcc/qnj3KgRo6EAPV6vOXXLFYrKpg11VGzUbKeGpr+4CsbKgKd2Ax9v
         +1zrwsDOILL2dwtp+1vvlgb337Ta7aiDugkCNuzIGsYnXD5XDmv5t4wuwiCajtILk88n
         LNrHiI4lH+GNFBraZ8z0cwAcBVqjXaoqhujdEUYZisLVg2gj7H76h8O6jAixSP+D0tvv
         W+59YnqWcvMgH6qBfwQxFVFP3Epi+pArc1N0NAkUQSfQ64jH56UgbBzEPYYpE6uwDJii
         ASLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608087; x=1795212887;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ggQ4FFC8Bi0XuOsjCC8PKsr9I1n0o4RHBwZ93v/svPs=;
        b=GCVnQItrm5DN2Cm7kBQTFlygZAB6hZa6fjSAUY+3ED3GND2oInJp0YWMaRc+i3DpPC
         13QhD+1fszbetMQ33BmDnp2lyUjvseAj1997g1u4N8fF3tDrmWJPi28aZ1KUXqfy7Coc
         xSFd8rq8ypOHwUDhcwknxgiRvPVwnG/oeV//I6HGUwYkyCU0ZTEpDPqkqYjB0DUEEoe2
         3Bt7kLnPy8Sy4sppFqsgzJ98DBi2EoHtHerpYn/p1UpTLTBUQg846rnbyRP2LUPSPHhr
         oyhQFrRq8kLInec08lU5pu+BtSS/9oW4Gbfgfi6j9n2XMr/Gb9MAm0d/7RogxiltMABG
         2/wg==
X-Forwarded-Encrypted: i=1; AL+hErFuEyEXSuqMKHy7Vxw9tll8zbrS3b7oaXMy6+Qt79exzbF9Cf5Kx6roye//aYorXbd41HUN7mI5pAVNpnCehNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z84bdKPcVQrNEU+mCc8ffdmv8TLuAR9vHX0Elk743CKAi7zLKWz
	pdqQcFxUxVs8fJ7xp3VARPxJvEdD+sqd+gkrRblG0HtsVO9+bIfAd9DF1SdeNhXRk/WkF6XUfBH
	6eRr0PlTye9+8WQ==
X-Received: from dlbph19.prod.google.com ([2002:a05:7022:3713:b0:195:8b4e:20b7])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:b905:b0:1a9:d04f:1b55 with SMTP id a92af1059eb24-1b50311e3efmr3121638c88.26.1794608087024;
 Fri, 13 Nov 2026 14:14:47 -0800 (PST)
Date: Fri, 13 Nov 2026 14:12:54 -0800
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
Message-ID: <20261113221248.3535369-20-wusamuel@google.com>
Subject: [PATCH bpf-next v3 9/9] selftests/bpf: Test typeless module ksym resolution
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

The module ksym tests use typed ksyms, which libbpf resolves through
BTF. Add a weak typeless module ksym to the ksyms test, to cover the
module path of KALLSYMS_QUERY_BY_NAME.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 tools/testing/selftests/bpf/prog_tests/ksyms.c | 9 +++++++++
 tools/testing/selftests/bpf/progs/test_ksyms.c | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/ksyms.c b/tools/testing/selftests/bpf/prog_tests/ksyms.c
index dc7aab532fb1..801d38560473 100644
--- a/tools/testing/selftests/bpf/prog_tests/ksyms.c
+++ b/tools/testing/selftests/bpf/prog_tests/ksyms.c
@@ -11,6 +11,7 @@ void test_ksyms(void)
 	struct test_ksyms *skel;
 	struct test_ksyms__data *data;
 	__u64 link_fops_addr, per_cpu_start_addr;
+	__u64 testmod_ksym_addr = 0;
 	struct stat st;
 	__u64 btf_size;
 	int err;
@@ -27,6 +28,12 @@ void test_ksyms(void)
 	if (!ASSERT_NEQ(err, -ENOENT, "__per_cpu_start: ksym_find"))
 		return;
 
+	if (env.has_testmod &&
+	    !ASSERT_OK(kallsyms_find("bpf_testmod_ksym_percpu",
+				     &testmod_ksym_addr),
+		       "bpf_testmod_ksym_percpu: kallsyms_find"))
+		return;
+
 	if (!ASSERT_OK(stat(btf_path, &st), "stat_btf"))
 		return;
 	btf_size = st.st_size;
@@ -47,6 +54,8 @@ void test_ksyms(void)
 	ASSERT_EQ(data->out__bpf_link_fops1, 0, "bpf_link_fops1");
 	ASSERT_EQ(data->out__btf_size, btf_size, "btf_size");
 	ASSERT_EQ(data->out__per_cpu_start, per_cpu_start_addr, "__per_cpu_start");
+	ASSERT_EQ(data->out__bpf_testmod_ksym_percpu, testmod_ksym_addr,
+		  "bpf_testmod_ksym_percpu");
 
 cleanup:
 	test_ksyms__destroy(skel);
diff --git a/tools/testing/selftests/bpf/progs/test_ksyms.c b/tools/testing/selftests/bpf/progs/test_ksyms.c
index 6c9cbb5a3bdf..0506bb574c4a 100644
--- a/tools/testing/selftests/bpf/progs/test_ksyms.c
+++ b/tools/testing/selftests/bpf/progs/test_ksyms.c
@@ -9,6 +9,7 @@ __u64 out__bpf_link_fops = -1;
 __u64 out__bpf_link_fops1 = -1;
 __u64 out__btf_size = -1;
 __u64 out__per_cpu_start = -1;
+__u64 out__bpf_testmod_ksym_percpu = -1;
 
 extern const void bpf_link_fops __ksym;
 extern const void __start_BTF __ksym;
@@ -16,6 +17,8 @@ extern const void __stop_BTF __ksym;
 extern const void __per_cpu_start __ksym;
 /* non-existing symbol, weak, default to zero */
 extern const void bpf_link_fops1 __ksym __weak;
+/* module symbol, weak, zero if bpf_testmod is not loaded */
+extern const void bpf_testmod_ksym_percpu __ksym __weak;
 
 SEC("raw_tp/sys_enter")
 int handler(const void *ctx)
@@ -25,6 +28,7 @@ int handler(const void *ctx)
 	out__per_cpu_start = (__u64)&__per_cpu_start;
 
 	out__bpf_link_fops1 = (__u64)&bpf_link_fops1;
+	out__bpf_testmod_ksym_percpu = (__u64)&bpf_testmod_ksym_percpu;
 
 	return 0;
 }
-- 
2.56.0.679.gc527c65306-goog

