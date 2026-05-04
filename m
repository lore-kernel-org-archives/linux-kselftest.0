Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A96572627
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 04:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777867257; cv=none; b=QrKTy9K5sz98t8UdVV/sBUNLaQEI2FfS25Qz4FUmvndDPrjklWF/MEKdtCkL903AABMZF+3NOPn0TCTsMBOiH0mStdQ1ZR8wZHkbK4N6Ntd4MrbQGiqxEqvOSMOq+UV5X+cKPuV6xctx4ZXCOREmNNVJBKXssFgiJgEFGLGDxiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777867257; c=relaxed/simple;
	bh=Lf1TLdGVOJXUigkA8oRYy3fs6i47dPPa9PnAZKcPDvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j51Gj9QRyPX1zRU2BiLR/vVIth50T3DcdnXkrhxnmLFAovMy9+jvfkMzxpELudcpj9OLs+Y1oruBgmqXq39bhy5TMoF89eC9krlGTMmeohRgwVu5RJ9Nz+KmVjOCc8jJjyde7TgyZsIc50MEj9tenh86zx55Nzq8JMAQYFGwHFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=U9qSrFnV; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="U9qSrFnV"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c565dd3a7so7997415c88.1
        for <linux-kselftest@vger.kernel.org>; Sun, 03 May 2026 21:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1777867255; x=1778472055; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IGXGWwnAcL1bVeuWF2vhaOhBAT20XCLM8BlTLJN4/sY=;
        b=U9qSrFnVoccKMTjlDHx76YtRO6qRyNjwxgX0cRaeLIDbSl3LBzQi4z6DER85g53COG
         Y8/lCwp77dpNf+jP/QOwqDVay6iFRt/XZu5UJc6zrSbTvwLvdEhcNfkXseWYRL1YM6v2
         C+qe4lXnknWpulPoI6om2ULo7brSESYUG/h8kfkk9KSBe8zTSta9D3/QIwWItiYfLUBA
         xys530NJJjJL8Psj3un16krJraM3phsF3PLDhch6wM/npPpGBmgUMAZvYLSsIWvXSCHZ
         wO4HR4YFqrjy0s9dRiFAcIZUEDPGIjs0i7df0iI0kUSPtH4uIp/7rQFzLCZ/dY565r44
         BOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777867255; x=1778472055;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGXGWwnAcL1bVeuWF2vhaOhBAT20XCLM8BlTLJN4/sY=;
        b=K19S20cDARHTLbkT0FFCkiw9vlAL/4XnAGS1kOUPy34T+/gJmuxeiBpGgI6gd5wiCM
         eJSweiDIPZ/xtWaMpi7RLjZL4z5Ji/HxZLcYMyLr3t/ZS0CVZdzGYl28lJ1DyJaMADHR
         EhdO3oyiwW10MlNOsoYRgSXM0jHJ0Md0zB1cNklwW7ZmYWsYoZm/x2ZUmBc9C1TrgPnJ
         6FsYdW4WMwzHVa8R3e+sLhwtnWL82E5uMmQqjF+4ftmg3vcj0ytU5cDRtRCQCBYPJ5Sz
         cUkMaG+kiPhntrA4+2PC0ZjvvxZawgLGhy9wRjAgRtQ78dvL2SGQSQFuWezJInOeG0su
         flAg==
X-Forwarded-Encrypted: i=1; AFNElJ82kTkIeQyqClf80L8q394wgkgGz3hpZ96+wW5t/l37V9jOjE6BbZJmDSATnpSJ1XISJ77SxPtSLn/FrzrD5h8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfSaB07RUs5XGKTHrfPaJl2U6A3Xhv/rCjqDOJjglihBYfxi6E
	P6Z10bTlqkMIF9ck6EWHEi3MRjsLihicKEJP1XsMpYKPzQXv7lTWxbfsK8R4s386DlQ=
X-Gm-Gg: AeBDies1XyS9gPkpDfnMywAGfrnRmltiZe9BP4YCwA4A1yayd6Bybds3uO4gDTiiwxw
	H8QiAn1TL0CWXQFlLQFmxKp4cu7Duxl4WmJMo63E1cKusz/V9oPde0UV+ZtWdb5uRkyUVqnB7UF
	oIXO9zcSEun2NeA6d3JHb427AW2/pnzwfcGmkwpefOMWHLytmOIpUR14dc5J2x0oQl0RiKPeflA
	S9OiKXu9pyUIES/Pwt3nuekD7WnGzxMvnnFX/INEMBqmCfhxg8aK1HXk5cANLvNkKleQvd3tUfN
	GQayF7+pfW3g88JZrzlUuv8MrrkOFz36Xs6GbP0Uwy8Dgi67i9EaQzciZ76RoHqkHfeOm6VkaA+
	Rbmjbhfw5T7Qlcw+9lHPzcTXrqCA2PBwb6F+zi3Vzky1CtQiNefDhmvzDX0XUSrshoXU7YzsK04
	Vt1Kg3qkakBL4BmraXPG3MgnWlBEhlQ4CZxLPfziNklVnQNkahB2WIWQ==
X-Received: by 2002:a05:7301:2c88:b0:2d9:7bc4:9578 with SMTP id 5a478bee46e88-2efba28ad29mr3924066eec.28.1777867255328;
        Sun, 03 May 2026 21:00:55 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f28f7ba26dsm2234848eec.10.2026.05.03.21.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 21:00:54 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Sun, 03 May 2026 21:00:53 -0700
Subject: [PATCH] KVM: riscv: selftests: add check_supported_reg() into
 get-reg-list test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260503-kvm-get_reg_list-v1-1-c16f9b572e9f@sifive.com>
X-B4-Tracking: v=1; b=H4sIAPQZ+GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwNj3eyyXN301JL4otT0+JzM4hJdgyQDE8NEI/O0JCNjJaC2gqLUtMw
 KsJHRsRB+cWlSVmpyCcgcpdpaAG7UtOd0AAAA
X-Change-ID: 20260503-kvm-get_reg_list-0b041a27fb23
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, greentime.hu@sifive.com, 
 vincent.chen@sifive.com, zong.li@sifive.com, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777867254; l=1079;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=Lf1TLdGVOJXUigkA8oRYy3fs6i47dPPa9PnAZKcPDvI=;
 b=7nvgTYMW+T1cvFZRFfiH/KnS/HC7BuQ8+FdcPWt561AW6wqKNZmoD7aVpWGYlNINN8J9EnBDm
 jS8diatltGDC0HtBVXq0RWanmKSTkPsmK9C0EPxYHOS5VJ6GKCdC5Xp
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=

Not all the registers in a sublist are supported on a platform, e.g. the
SUBLIST_SBI_FWFT list. Add the check_supported_reg() to remove the false
alarm of missing registers.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 8d6b951434eb..d7cb9b5d37df 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -28,6 +28,18 @@ enum {
 
 static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
 
+bool check_supported_reg(struct kvm_vcpu *vcpu, __u64 reg)
+{
+	int ret;
+	u64 data;
+
+	ret = __vcpu_get_reg(vcpu, reg, &data);
+	if (ret < 0)
+		return false;
+
+	return true;
+}
+
 bool filter_reg(__u64 reg)
 {
 	switch (reg & ~REG_MASK) {

---
base-commit: ddbf9c76c4020bf63a0799b00faad40caa3de6c2
change-id: 20260503-kvm-get_reg_list-0b041a27fb23

