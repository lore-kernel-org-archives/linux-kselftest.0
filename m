Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793996423;
	b=bFo8ZM3V+IiXokl8ceQH5pZ/Vo+kQmqow+LLxNa+ROSnza47lkWGTQtudQVFPdS4N6PX
	 TJUH9W5md8DOHu5AvFBpuFsceUGFRUtUB3qaTy6tTe9ugp0ofRGDAsuYkotWG+O1zLb3Q
	 6tLC8y2a6UW6PLtH+uDnpAEVl+z4qglhKp3P0DZMi0V5RwE3mPC8xjc6ydklD8zOvGsaa
	 Bi4shOb08zGqBADRC97nykwU8V8tH6IO5okc4NR/K7ealXDmU7DQ1O3UqjmXiDAQYbji/
	 eLbJaZ7f3ajH1TiPLy/mbAmnx8Gdsd9ajZBGbrJenx2C8WpB/FgAfBxoQpwYqjp6F/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=YfQOM+3yZTei+Ooz1YE9OkOVcf05BkF1CaiX8rMXFmc=;
	b=EL7VVtgLhsVyYLXJfdaKpT6A/lOIIi8Zf5DwyvBhu4wUxG/b4SNFqdJYspH33N8w2VQr
	 yOOeLKiiTtM5jbxH3B8hv0KNG/BnotP7LAXPzTFwg0teAFc3QRfwWAL4mTnBbdTHravCv
	 M6MxCmVidIPn5QDU7S/Cond7Z4cekPbEPTa6QQmeZMtw9FvVSKGlrgCBNn3vIgOJYjasX
	 9J/RzaVHpUUnQqVTk1fociWnIU6eyjJxHyytY0LUaJFOxnY9NSXktUMxEgIDJK91UKKdl
	 UNfVoyfEC0zs2O1SnLODFW71jiqajNyj31pWQ9DLdcThu63FNiT2LvBnQOwtIMnqDjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qN9y1mA1;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C2A606D81A
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 20:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C2A606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qN9y1mA1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a08903566dso24722b3a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 12:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793996417; x=1794601217; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YfQOM+3yZTei+Ooz1YE9OkOVcf05BkF1CaiX8rMXFmc=;
        b=qN9y1mA15Y6AtsUV5niq8H1hH3LKM0ifZb9qB6TPirQ5m7uJyyLYYYHuFaU9TRNgnp
         txjU4pw0H8iYnjCmd46LQi63lPvs5mykCWNloMB1ulQkuO3BAYLW5oh3nZAWDwAFxH/U
         4OJIN+WFbns52pRqOsP4z1An3zRVj3QkQQwkmBVDOhl0kzrrP0o+wEVbEZMl9ehuLazp
         kTPYhb691x1jUmTL6kKwBH6+ni+Uib7RVTpMgxiNeFgOUc9fhoLqLRNSUDNt2Rg4roqq
         3cfVpvLEcQ9A8MoLpP9TTFQ6qkA87pnPCvQdaVC9c8EtH2kjrrMaSGP2OuFf0Ic5QXRs
         ikQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793996417; x=1794601217;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfQOM+3yZTei+Ooz1YE9OkOVcf05BkF1CaiX8rMXFmc=;
        b=igPH6QJTqrTBnUQ1JnXiWZWDrw73h13W2gtCSPaRxPLshOj2KESGhsR/mSBWIG2QYP
         Yfk5OzdDs+s5djdxQywHtMAxWapbeOsY1WBMgDsOL03NppNtg5JDlQBaYCiRWvHDmr/x
         OKi16L2W6Uv5yxpaMeYGe5pWlFVFm+RQM7RFDrybeQeKEdsASuzOHXo7CYGAKi+C029C
         roT9woRxiNF/GoXsK0T6Q2uXAhV6pJVCbzIdnWJblFwqcnQKvRzb1FWVdTVmKw5MD6fJ
         FkjocqTIcrSPT8ytR0vhE8j/EOOctbM4CEuuIwc4hZbZbP48bmqTLFyjLBiqM0fpAN4y
         wctA==
X-Forwarded-Encrypted: i=1; AKwUvBzPPMDk/PJ4Eg7D8mfn8EIS9YzEmFr+Am3ukJ/TnIXwEHMlTg2rCrE1xQvxHi3K1CVGBaeSfVDEcmf5cmhdHXs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/70bNO8xciA1EedqUyBWk6MCrly2LwD09iVBlbDsbJWluRPHWu
	d57D1/DnE8X7ZYk/JoVNSkt5FGJf7RYIPFrzN99Ym1+8XOaBIHZqvrGz6kvE6a7Xr3b9DcsoBGF
	qlzHRwdVtldLseTsjMg==
X-Received: from pgbcq10.prod.google.com ([2002:a05:6a02:408a:b0:cc9:f7f0:57fc])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7d9f:b0:3e2:3584:c12c with SMTP id adf61e73a8af0-3edc1c447efmr74358637.2.1793996416538;
 Fri, 06 Nov 2026 12:20:16 -0800 (PST)
Date: Fri, 06 Nov 2026 20:19:51 +0000
In-Reply-To: <20261106-lskel-struct-ops-v1-0-a4486ffc79cb@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106-lskel-struct-ops-v1-0-a4486ffc79cb@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261106-lskel-struct-ops-v1-4-a4486ffc79cb@google.com>
Subject: [PATCH RFC bpf-next 4/7] libbpf: Support BPF_PROG_TYPE_STRUCT_OPS in bpf_gen__prog_load()
From: Siddharth Nayyar <sidnayyar@google.com>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Giuliano Procida <gprocida@google.com>, 
	Neill Kapron <nkapron@google.com>, "=?utf-8?q?Thi=C3=A9baud_Weksteen?=" <tweek@google.com>, 
	Maxime Ripard <mripard@kernel.org>, Siddharth Nayyar <sidnayyar@google.com>
Content-Type: text/plain; charset="utf-8"

For BPF_PROG_TYPE_STRUCT_OPS programs in light skeletons, load_attr's
expected_attach_type and attach_btf_id hold data blob offsets populated
at runtime by bpf_gen__init_kern_struct_ops().

Emit instructions in bpf_gen__prog_load() to copy the resolved member
index into prog_load_attr.expected_attach_type and unpack the 64-bit
(btf_obj_fd << 32) | kern_type_id value from load_attr->attach_btf_id
into prog_load_attr.attach_btf_id and prog_load_attr.attach_btf_obj_fd.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
---
 tools/lib/bpf/gen_loader.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/lib/bpf/gen_loader.c b/tools/lib/bpf/gen_loader.c
index 6027a2762c35..aaa491463521 100644
--- a/tools/lib/bpf/gen_loader.c
+++ b/tools/lib/bpf/gen_loader.c
@@ -1151,6 +1151,20 @@ void bpf_gen__prog_load(struct bpf_gen *gen,
 		emit(gen, BPF_STX_MEM(BPF_W, BPF_REG_0, BPF_REG_7,
 				      offsetof(union bpf_attr, attach_btf_obj_fd)));
 	}
+	if (prog_type == BPF_PROG_TYPE_STRUCT_OPS) {
+		move_blob2blob(gen, attr_field(prog_load_attr, expected_attach_type), 4,
+			       load_attr->expected_attach_type);
+		emit2(gen, BPF_LD_IMM64_RAW_FULL(BPF_REG_1, BPF_PSEUDO_MAP_IDX_VALUE,
+						 0, 0, 0, load_attr->attach_btf_id));
+		emit(gen, BPF_LDX_MEM(BPF_DW, BPF_REG_7, BPF_REG_1, 0));
+		emit2(gen, BPF_LD_IMM64_RAW_FULL(BPF_REG_0, BPF_PSEUDO_MAP_IDX_VALUE,
+						 0, 0, 0, prog_load_attr));
+		emit(gen, BPF_STX_MEM(BPF_W, BPF_REG_0, BPF_REG_7,
+				      offsetof(union bpf_attr, attach_btf_id)));
+		emit(gen, BPF_ALU64_IMM(BPF_RSH, BPF_REG_7, 32));
+		emit(gen, BPF_STX_MEM(BPF_W, BPF_REG_0, BPF_REG_7,
+				      offsetof(union bpf_attr, attach_btf_obj_fd)));
+	}
 	emit_relos(gen, insns_off);
 	/* emit PROG_LOAD command */
 	emit_sys_bpf(gen, BPF_PROG_LOAD, prog_load_attr, attr_size);

-- 
2.56.0.455.g6c5a503b38-goog

