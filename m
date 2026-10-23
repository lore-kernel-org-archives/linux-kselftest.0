Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792714657;
	b=NGaumkd/1lCjLiezw8ZBYNrd5AYAOPEKjsva+ARSivaqkQRtmlFzVEPBSKz4SJAPPyHX
	 vCakv5NrKHP94UCbxxYi1yj5zs/DwKD5Lv3clVXAToM+jU2H4855im7HlMAQd4dxAPkPP
	 N3cJvfPz3wcEDi7XNfmmJ+RwZHydOBWu7h5TJSKHRhDtzorfk/2aXtKfbBPDnZ7pilg0V
	 JA7F+JChemDK/vYgESJj45H/a/4ljONhvXKpE7zBOWHLl0UeLKrjZK+11DICNvFO+mCDn
	 45ot/KFA0cDhRDLoRFdGv6c9zQ98+MEmr+PJZhfszW3vzFKIgwWwtlycAgm/JAy1n4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=FGFVdcUD4uteaXAQypaWTmH+/zCVpgMAi79JFzYNdNI=;
	b=vpXqUrcmk27fRcWkxke0BSxZPxsw1Q/uHsr6/76xmomaNb75O7fSUFdvaHrpmvym62M7
	 7vkl13VILw1o4wLdu3dVHBgjyH/2EjnC2x20S1Wh2p1RbLbkZ/pcVLkNOCEQMqap7VklY
	 uIMjmga4ETCS6Hu8TMq/9jCn5zsoVwccpbvQ1r5NmOaUKpSrREoQMjsFiK7pO/4JAU5PL
	 itat4cQTf6izgz4H8nsn1S0LDuu/v3U7RXcRy/5+5XduZEWaflToCWKwndfkJ91Arz2A1
	 OH0BJymnt4fqyIx/tLdb3H3Mh/chce7vEHzZAkn9rFLEHeltcqrcCIgkQR6URiZWu2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sqYqHqN8;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58F6606A326
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 00:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A58F6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sqYqHqN8
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so808284eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 17:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792714651; x=1793319451; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGFVdcUD4uteaXAQypaWTmH+/zCVpgMAi79JFzYNdNI=;
        b=sqYqHqN8b2C9rJCdSIP5pixpXsTX2920yN1d7s2o/SmV4SPD2hmw6YaJEz3yDvYtKA
         iSPMoTZBdLnSRU20QVbyo97PcqwC3mfoFnT6y6ewBev7vqiAKdtisl9PYS3ylTJbV8Nd
         SF/3YFB7sPEcIuuiBBK6CPmB8u4BmtVrr/3ql6+jzgDSDSbJMsfS7KMwL2mHf/3+JFpR
         m/PeyE/0IrROwKBm7BMII7pz1si4KeVS0wby68xzfFfXqmcqa49Lcxe1UQPEw2GHzsfn
         b1Pnyv5Zi57Jh1uZqx5b8M+FhLwsFGdHA8X/oDvRvpdEuRU8NcdDjTxNVNGg8QkCjZD1
         b1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792714651; x=1793319451;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGFVdcUD4uteaXAQypaWTmH+/zCVpgMAi79JFzYNdNI=;
        b=CJbyj1msE6qr6GZ7Po/f0rqTjlbsVZB3N1nMsnvUcDLPEN1Holq3Ko3GPpKZPYMloe
         6kigx4ytKlZfceiUYqLbKFX5OVS/gsMJ78Tgu1lW+CuCAP+D7HL61PYu7W8cHczWZiBk
         i0JnlPd1kyTKPDA6FaRXoNV61d5kiZkaMBl23UX68eCKC1jsqrW/eTZVLJK/owlphcYr
         HbVYFEL05WGg31H2OKLzsXIXF02CceJW+3DAiHkQoHFbouk1tgAZD68EJ4TRl6sifwoa
         HhEcIPzMUl2wh9dVqjBDZOz0+5iUhgb/5mwSzRw5AwchHuMAs7iBM+O15rYvhs3vSN1x
         m78A==
X-Forwarded-Encrypted: i=1; AKwUvByAtnOqEMBlkB0ifDzZWFng9Bv3VjZsKEEa/4TYoc41OATMNa+yjPUvgmfG9E9f/pjPGOqBSv5poLK6rgUxnQc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9XabMT6YI5LRrP7XVzp42j7MaZSpvjLCyYmnpFqfX5+73Bv/+
	VmlkWCnOuBr5UkaUAZsFoAkhNuRYiR0oW3ejbNBDwH/mnz/OpAX2SUcvIeon8wDDRSS6yhovByi
	vDeHts7eihEtOVw==
X-Received: from dycuf12.prod.google.com ([2002:a05:7300:10c:b0:35a:6ed3:3ee9])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:83c3:10b0:367:185e:867a with SMTP id 5a478bee46e88-369d98e5b8cmr933601eec.38.1792714650260;
 Thu, 22 Oct 2026 17:17:30 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:16:04 -0700
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
Message-ID: <20261023001603.560210-11-wusamuel@google.com>
Subject: [PATCH bpf-next v2 3/6] docs/procfs: Document KALLSYMS_QUERY ioctl on /proc/kallsyms
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

Document the existence of the KALLSYMS_QUERY ioctl() in the section
describing the /proc/kallsyms file. Refer the user to the UAPI header
for low-level details of this programmatic interface. Add a "kallsyms"
row to the /proc file table.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 Documentation/filesystems/proc.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index c102b62023cd..a0e2fe14a01a 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -761,6 +761,7 @@ files are there, and which are missing.
  ioports      I/O port usage
  irq 	      Masks for irq to cpu affinity			(2.4)(smp?)
  isapnp       ISA PnP (Plug&Play) Info				(2.4)
+ kallsyms     Kernel symbol table with dynamic queries (see text)
  kcore        Kernel core image (can be ELF or A.OUT(deprecated in 2.4))
  kmsg         Kernel messages
  ksyms        Kernel symbol table
@@ -1368,6 +1369,20 @@ Provides counts of softirq handlers serviced since boot time, for each CPU.
     HRTIMER:         0          0          0          0
 	RCU:      1678       1769       2178       2250
 
+
+kallsyms
+~~~~~~~~
+
+The /proc/kallsyms file lists all symbols in vmlinux and loaded modules.
+
+In addition to sequential text reading, /proc/kallsyms provides an ioctl()-based
+API (`KALLSYMS_QUERY`) for querying specific symbols and addresses. This
+interface is binary and is meant for efficient extraction of data without
+parsing the entire text file. `struct kallsyms_query`, defined in the
+linux/fs.h UAPI header, serves as the input/output argument to the
+`KALLSYMS_QUERY` ioctl() command. See comments in the linux/fs.h UAPI header
+for details on query semantics, supported flags, and return values.
+
 1.3 Networking info in /proc/net
 --------------------------------
 
-- 
2.56.0.257.gf7497c7d27-goog

