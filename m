Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794971629;
	b=F+RSnFoYHq4JsiYlvaMsvuptBJXNTXouxo6hmnrtKk3td2RSzR+t5sRgym5YhM2i8oiq
	 LlYRFu4ELXTmL/zInlcA6I81rhkwdurd/31k9WQcWjgmy40zxujwrmCg4+uIDkOTP9g5/
	 KZdyuLViy1Q3aDFKZznNewWeUTSFgTB0Ou8hWtV4AKSS6+tcI2Kftmdk0lUhD6uy5MaO0
	 kqXFJCoQswXT18G0onTe0S8Bb1S1iBM4Ag3wTcx1PWF7OJhQaRR7NGNj215gAYv7owPB4
	 CdsPZ+WG+bvNtvyrNuk/NwvzlUmmGLJQSINbeax6XXcte3mw82nsNkozq8W0oomxtcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=L5q8BDBgXiYmhDXOEbr+29YbxI48AJAxwCUhEtoaisY=;
	b=SwuT7a2p2oLifnZzqErnSMF7eFtwOWPzK4jLbZQz66sKpPH9BaqRYUXsnfBte5BqNiOA
	 acOGDLf6yelEeXKRb3bBVVbeAHGR5bknbu14fCHA4MGF67rcSW3oCJhOcTuyoaVit3qLV
	 ustW5SbPCEJw3FTkAeMxd4f8OZzjSwFr43VFqRFGHLruoHNpeziDMbndcy/V6nI070cQM
	 h1zGKHuqJ3xzIpxRxzFnJo1YlAMcXcMecPAUlwc8/N7rfCMzFa4CFlccxQnlUyc/2dI9J
	 rs2D5Xq4xljbm5tKCHQleUTfFuhiBFdA7SHp/7H5RxSYP01SEZ8sZpbqVbCNyeJDzHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b="ITt71/Vt";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68059606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 03:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68059606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=ITt71/Vt
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-380c28f9e35so1799305eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 19:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794971628; x=1795576428; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L5q8BDBgXiYmhDXOEbr+29YbxI48AJAxwCUhEtoaisY=;
        b=ITt71/VtYXs2f4BSgR5Dtn+faV0S1+BtDtvJWHCs+1n4Q8SuEQozbHI4CmfFgWOtD1
         65UUxinPoVlP7tesqQp5ih/1ZmKMHY4HbQPUcw6wTZE1ZCbeY4HU1B5NKnKdI1sodF7y
         VCa8N0VHXfq1KO2vAFfyxfgba55BHA2T6tmxllfKT45EENxow6jbTU/5nE6bi9G8TSAV
         04h/oDFzquQIT8VSqEB6Ugt/NJUFsjpIy87Bjj8ghNnPDWH8e/6x0Sh7pIyDoirbUfJO
         IpRoaSEvuYQKNRKRMfJ46POR10fwoJ0c1la1OlXirSJtBRi0hTYzSGO3mqm9SGcVAJvm
         M+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794971628; x=1795576428;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L5q8BDBgXiYmhDXOEbr+29YbxI48AJAxwCUhEtoaisY=;
        b=m6n7sEybpU3xLTScyj5Ok2I2vGcglZAC0Sixo9jzSVjPIRSSG1Fz3q6kARWXIDxS4u
         aP7yjtpuADI7jJspu+uciiVPcO4qf84kg9dujUZvU/HOEgU7AsbHic3fjBpNJWhy+EmG
         lIFSvMQJLfF+wv2eyxW4H5fAn54PiAzgERGTuzNWGPODSi5sZVLC5J3Qdq1Tng+kW+54
         dxvD2UDy7UZG0RiUcrPbbMz1Om8iLqUBvCd/0hrE91qs7C4AQHIXKa59ddhNlsTWD8Ek
         Zw6egp6XyTUeXOLiwDfrWyZAxnSxqDyfoZciEfFZhEQtxsmmG8CnS/o3L7AO5eHdX1rM
         J1KA==
X-Forwarded-Encrypted: i=1; AL+hErG2CREytaWKqgFpYd5cj1mxTLS+Pj2XXDkVX4j3J1Y+VjTeZgIE5Ist7dmmdbWsRy2PrPfop27IX8iKWz8z0QY=@vger.kernel.org
X-Gm-Message-State: APuU4Z92sXfFYpSws7JXLf3M+lzHE6xLSUwC5Mc4Vq+g8ptDJPJ+/x/O
	4zD0b9tk8/+mu35fJraKterW5mVnXHd9YL3jeE/kkPsMxVuAJ13hNacPAUB5ByoYZJo=
X-Gm-Gg: AYBFou1obR8yBknUtwZeJVecBUfhpD924im9b3aW5PLEU93aJy+93n68PgVKTaUatam
	L234vNYTv/JxhCb7SES28u/Y+fJxmyUmdw/jyAVhT+htb7oUgYRcntuouJ+i6Pq8yivE0h2WE2Z
	N3wFBh+zk1SfUTw6yDkk5eZ9mFrRKNTc8bANNLITnJJQ/te2jpQt8mqA51msIKE2gDg61FEGF3g
	4N8qQxi840V8VkwaQjTzmfAA72lL7151bH9XESiv9s1u/rT7CE7ka56tTtpzmorBWg/82DrS2ml
	/L/2elVDCrHvNi5BhBAedSfsd67hkU6F0bDoQkH3/Bs2H6nX4fQPsAXgXhyeIt+ySyXIbuqr+C/
	n+hlVf52mLgHl3aU/GGh4nb2iq8URrQswUsVxPRq1WsGbeXHzJ4ZV9rSlCDvnEJ9SjF8Cg7El6e
	5IX1Kg017Pz8drlrf/lOqR46ZrkqsWgGsMQQXkm7qgbJziRPAvtB+a3U0joj84AwmueLqnRgR+a
	fJLwL5HKAwfEp2CX2KIBTTNj/DlxKafjaQ7okAGs4e9qi+s3C9Nm7y4LH9njtxJqXpSzoZb2mKL
	7R+cdEgFmm8LnPn3Gz/1fdQY7BjVkvW4rLL8PAWn5jqwoA==
X-Received: by 2002:a05:7022:2204:b0:192:a481:361 with SMTP id a92af1059eb24-1b543bab9b0mr1720933c88.7.1794971628351;
        Tue, 17 Nov 2026 19:13:48 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784017sm2512908c88.4.2026.11.17.19.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:13:47 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH v2 0/2] riscv: Add support for vector misaligned load/store
Date: Tue, 17 Nov 2026 19:13:43 -0800
Message-Id: <20261117-riscv-vector-misaligned-v2-0-0163d9430ca1@sifive.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOcX/WoC/3WNQQ6CMBBFr0Jm7ZgWoYgr72FYQBlgjIDpaKMhv
 bsF3bp8yf/vLSDkmAROyQKOPAvPU4R0l4Ad6qkn5DYypCo1WqsSHYv16Mk+ZocjS33jfqIW86w
 oDt1R2do0EN93Rx2/NvOl+rI8m2v8rbp1MbBEx3tLe73ufhVt/la8RoXGZm3slCpvirNwx572d
 h6hCiF8ANj4Q9DRAAAA
X-Change-ID: 20261109-riscv-vector-misaligned-54773f80ca6b
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Nylon Chen <nylon.chen@sifive.com>, 
 Yeting Kuo <yeting.kuo@sifive.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794971627; l=1965;
 i=nylon.chen@sifive.com; s=20260310; h=from:subject:message-id;
 bh=iXjcMyTOvfzIys2nrg1v5syp2opavv2ux8AuD7rDQMY=;
 b=R9MJURmXB4LQYZF+c4AKnz8C4a4tCB4yhpBjsH8VhlBxJ8bVtVRL8eHfhYW8kdF9RJ8s+9jgC
 gl58oWhLj6DD/WSeVrVu6pmPO8j/MeUjSvHljgwi9hsgwmcrqxheWrK
X-Developer-Key: i=nylon.chen@sifive.com; a=ed25519;
 pk=+xtFLLbXfGd50d5UhR9oBzLTh+JLft7T60t3u7YMZPI=

This series adds emulation support for misaligned RISC-V vector
load/store instructions, which may currently fault/trap without being
handled on hardware that does not provide misaligned vector memory
access support.

Patch 1 implements the trap handler, with emulators for vector
load/store covering unit-stride, strided, indexed (ordered and
unordered), segment, whole-register, and fault-only-first forms, for
both user and kernel mode traps.

Patch 2 adds a kselftest exercising these code paths across the
various vector instruction forms and element widths.

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
Changes in v2:
- Fix riscv-allnoconfig build failure reported by the kernel test
  robot: build traps_v_misaligned.o under CONFIG_RISCV_VECTOR_MISALIGNED
  instead of CONFIG_RISCV_MISALIGNED, since the former already depends
  on CONFIG_RISCV_ISA_V, which declares the kernel_vector_begin()/
  kernel_vector_end()/riscv_v_enable()/riscv_v_disable() helpers the
  file uses.
- Link to v1: https://patch.msgid.link/20261116-riscv-vector-misaligned-v1-0-6c4d0ca905b7@sifive.com

---
Nylon Chen (2):
      riscv: traps: Add support for vector misalignment handler
      selftests/riscv: Add vector misaligned load/store tests

 arch/riscv/include/asm/vector.h                    |   4 +
 arch/riscv/kernel/Makefile                         |   1 +
 arch/riscv/kernel/traps_misaligned.c               |  39 +-
 arch/riscv/kernel/traps_v_misaligned.c             | 902 +++++++++++++++++++++
 tools/testing/selftests/riscv/vector/Makefile      |   5 +-
 .../testing/selftests/riscv/vector/v_misaligned.c  | 169 ++++
 .../testing/selftests/riscv/vector/v_misaligned.h  | 530 ++++++++++++
 7 files changed, 1647 insertions(+), 3 deletions(-)
---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261109-riscv-vector-misaligned-54773f80ca6b

Best regards,
--  
Nylon Chen <nylon.chen@sifive.com>

