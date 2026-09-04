Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016F14A4822
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 10:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519498; cv=none; b=uSINlKa5A53OUHZlZo4FMiss8plnNr452KoSKQ2QNifcs9E+srO7iuA3iB0J2pmVnMZYuJnnBshX85MS2VasTDMX6G0Lc3XgrQOU0cnvjxgFeUAnRnh3ZUZxs9RisqkcgccmpjQz1yuPGsrABCS0xC36XOfeQNYN9sWvkAYuTjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519498; c=relaxed/simple;
	bh=bF1FDXBCoi2buFVFtpiMnptMDkjG/+2sPnHh7nDEKC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZAed54R2QIB9bWDxWMYnoO9PNhkBGIUXNQtu+p2UwB2MSmuIWVqDjieSkfqAx9l1Xy1CqudE//99DyBlpXM0Y2Qsgvo4qRf0AuJRbBm5oCc6wOfKcQyX5OtzfhyXtQe2VGf4lYztYb5DGpjYMMQ3rYbL1FBeTRZiMk52cIVKS7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5tdviy4; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5tdviy4"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so1026640a12.2
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 03:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519492; x=1789124292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZPcTYs8oAkeVV0FRL9AgbrivmoqvTTcMbkSKOhNgpI=;
        b=h5tdviy4bzm5fISj0+ZiOro2sK25mS4Iid8ac14IOyqiw6e5tQ9cx7BiXzNpF2AeaU
         mv99Ctpqv8eN1EL0Q4V6PcIlqMlzC4kav6F8p1rEyt08f/+47awt+HMOdU5GgkjW090d
         Q3Qp7+kYozRAOWCC1J4t5LQdmtDGeGBfj81gtsQpngsVqQIyLFVnWE7DcLvQMlsK0oYP
         b0O/dp5Xsm9Ga6jYLSrkEs3/Pqen9Sz44GpdzGkc/GIXeuVMdI6M3NM4Q+S/3r9M3T7f
         3shF1DURGGSC71WxiQnOWyhgFshMKPccq0plmuiNeZacgTOXw4SwvfhiUO+AG3NhasOH
         KA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519492; x=1789124292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZPcTYs8oAkeVV0FRL9AgbrivmoqvTTcMbkSKOhNgpI=;
        b=THsM0gWVVoN4fL6+VFBTJ3EoFyh8fXqkHILzdcvpiEtuWM8I7G69bBrGgXrIqpgLcA
         jB5zEoZig9WR8Oe1uuweBSYU3iBu8Teikp5hmGQ4rH1TIe6U+58VvqYO52MaJzXf9Vpj
         izxFR0jN/yThJ8RaKpGyUB0aDaojeicNrizcGZZPFe7EhJcRrM1Z1Tw60C+HZrtahfoE
         UIP0K8SmhF3sezTWLjqBdWrbk2SM35DjlzhoMZrph/bzHflocilDVgadjJw4HhkVWE8X
         hSNFqD3YawkxBw1vtrL3F/G0L2OjMNLSQHIhO3N9ml2jAXDyJoJIMNwQuNWThzNy0nMV
         0AOA==
X-Forwarded-Encrypted: i=1; AKwUvBxVE5BQBVrgDf/PNsbcYUEE2HnJWtpuwezzjCz4MpUa9jO3MJsfQRk8SMHt2DDWE3GofEgkz37HvW0VgvdMlhg=@vger.kernel.org
X-Gm-Message-State: AFuF++myaEVjE6AwTpXUG2sSI9yKstHfhNz0V1VNIVzDNi2L2JbonuuN
	lXT29sTZZZ69lQxu9J9VRKQcM0wMSy47SV8dtWRNLxr3IeMuJoLn3Io7
X-Gm-Gg: AYBFou1vDXjd28fJEPFG65tzN2hPWJx1gk/BNIyRZMKCpUakWcug9LWAtkx57vSOr9X
	yQlt+qICFAVk/61lhc+qaSs5/dXKbZmDAFxRSm8vT6A7LT5Qg1u4uYAOgG7uETZzg3/5Zjcr1Ps
	43ZtgpIJbZCSqP15eAi0zCnKIhmfRiCegDoXTzpGrql/yP05XomZBywTOkrD8qYUfoQpfIY/yOz
	03GZv4mS3rTWSOM4weFKlMzo++1DfNb8RadNiKkMF9UF3vWK/kt5mf/iEzeb//hJBJ7PN4KANWM
	Q3C/SBi8WhHBgit6S2AFTQihDguVM5JDNhdPk87nhhH1lm06hJCbRgSsgRwyxmbD+hpYntpGcVe
	6WcPIHqb2icO45voufvDANm1GkgAIlfn7cT3vQIfz4rZjqdqMl7Hy0F76rZ5gNtH+TkoTCbR4Yq
	U5uKhG98o2LHGYktAK7vKdurzdoVB2982CkJGZ615usWLsmtre6jiyqP9QIEs6ustAd2/LInfeL
	9fW9zDMwvjrPu64CBbLufFU+RhGrqgeiNOMxA==
X-Received: by 2002:a05:6a21:3a44:b0:3cc:8344:1213 with SMTP id adf61e73a8af0-3da39e68250mr7668073637.8.1788519492320;
        Fri, 04 Sep 2026 03:58:12 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm5523091eec.18.2026.09.04.03.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:58:11 -0700 (PDT)
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
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 4/7] selftests: bpf: fix typos in comments
Date: Fri,  4 Sep 2026 16:27:34 +0530
Message-ID: <20260904105743.39799-5-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904105743.39799-1-hemanth.selam@gmail.com>
References: <20260904105743.39799-1-hemanth.selam@gmail.com>
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

