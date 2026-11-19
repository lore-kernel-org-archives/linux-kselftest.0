Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090227;
	b=KmurF1MfwHFZjP2BzruC4J3PiWYv9AWcUKeqK4KOvuQWYWBiMd2dxVS4vLlxmmqWz1+1
	 eBn+gmiLeVWU2Je6p7+WiJPvbAZVlYWxzrAl2uleoID5N0dI3kyPCdfmOflHxbufW7YWw
	 Y9QKz+a9TLMm9/+KRqMRV98ovl3EoF+VFOCipn5TM7A8yuDXOQ1kke7yUsrZOiHfRvptq
	 2kZnZFg1aJO+JATVLfhyFFOkIyQpWWP6qg342f4fKvFfCDkgd0xixHzg8AG4URsEluqDE
	 cWgh7XnmUBh+R3DQ06ZHIrPDGo1DR5XJk/bNnFwboYU1H9UtUR80BCzg2+lDyFxvkxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AYLDQ+yf8AHdWNChzIaxivscwK5yCyOEEBVUQLHdUIE=;
	b=WdoM2/NpqKMGeswf+fsSJWdCSv1IqSllv8flEvhnAcmMq7JuONDI02bl4Nq6e8UKGei7
	 hFuY1shsHnMBsPxoYmd4yXHjbMBhZ7k/ckil6fmdUusggPXK3aJb6KsQBdJzJjssjg+1F
	 EwqNmW/6pgq2uL5ICjQVgnxUkEars9J2hm8DkTWlT0AiqbjlIU21GO3EqTmvIpFFpmE3g
	 geEd/IkGSGE4qOpFJsY48y2pmtJ/SZZ/fp23QGUE80J1woNL5Ir3W4F9xY2+sAhT0IpbY
	 QCQHuK1XKAeExQoSqU59vnkPV4H0zMkiBFN+uxcfPOToIQwq5K7/6vO49/9q6xxL7JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=VEqxmkSK;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E500606A320
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 12:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E500606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=VEqxmkSK
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-372bdb942dbso2918952eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 04:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795090226; x=1795695026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AYLDQ+yf8AHdWNChzIaxivscwK5yCyOEEBVUQLHdUIE=;
        b=VEqxmkSK4eWCu5l3irtVT/zW/JOHulXWxYT/po655TWF4gILDkLFKPv1BcgYrtWYq6
         NhYw6ZaLojKoN6hFsfSQjvERRHoVsJlZGzxtgS+UYf5mQzAC+zQ3wNRFk55Q2XT2sBao
         IqNO3k6dyAlfY4caVvumv02B3IzsNSuYAvym6mjWRJyFBTL6oamVCfgCauoMR2UPq/kx
         eEfy8I1Ucb1AYI2eI0Gg3yNN/LggBvxf2TO24r6Ca5d2oRXT4eecvoXQSJhkQJQyyTQY
         +8cvCYlNzWcCPfmy3eij9uBFElf10BM3WsNrVilBe33rC9y/MnA4Mop+61oSqy6EXuQ5
         17qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090226; x=1795695026;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYLDQ+yf8AHdWNChzIaxivscwK5yCyOEEBVUQLHdUIE=;
        b=LzIcf+Ez2SGKEqQnJqcLyKUeQ0fXdsGgsNZiPeapBYQ1lYiHTx0mxzopKYk3/RTiUr
         P113VKOAjJeYKhzam5vtGk+5W/BUSXD4CR4O3+c9ni9mKcNxird/WtB30GdTzIwJh7eG
         +cxCyRLbgYVDd8Bf19GtvIPvte185NQUjuTeQbUWWUxkeqN3psquh+GrVWw/bW9q4lqB
         IvTk9nXBppXjI9PAYnlqeFVyI8LAUJeH4A2e25V9/FnYKCa5obKYoL6ESDeEWDeC8+DH
         urBRt28Py9L/cK7gZpWiWi4TzYGR2/DgHDROQCtWRA0gwGV9efsJKJiwgHgXRGSzIgy6
         BLig==
X-Forwarded-Encrypted: i=1; AL+hErF56uX6UXnQ9yePGlVpojKrFr+Cm9wA3akaOlNwHGwc84i3lbVBA+uD1flgsDDiyWcjOygAfIo3yeVQXW2AcD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qhCGt6EWcZkS9H6XNTzTQBRuGp+vflkkxIAcjImX22Ftng0id
	aBjXRhaBype4BdjwWmBoZBJt+CdPAiRy1rIDtDt7p+TXcxe7+rbgwNxNfdP3IUBeyI4=
X-Gm-Gg: AZFdTZfkg09jC8S3RhcEHAl9vfeuN3A99DaZAH55Re38C2+ua12RjpnyfHdR3Q7nzMU
	xTY4fvDm+d1r/+98XKxuQxsMpFifkCVgwX3LdGLbP4i+C6QyNajIWbIBWKm0zDdcvaEV5sOt5yR
	92kgBoYBxeyeV3kqmzh/NV4x16JdlNKbBE2h/gTMdq/xhvJYhijQMoFlV5N9p3JVlYDD/GtyvJ9
	Dpz/uedmVh/89dBk6LYi0pzl6w9xVCoG4RkOuMZBm7UkDsFwha/s0qrneFIIc0nDv7+sQxgazlb
	4ZOXF0cj+0QC2Zzpj3sbWA4+M8f1Wic+bVan5HNooYt1Uxez6vKP6A2UY24st25v27Hrpv0xaG1
	nbM4lFfvxKoQdUfCc0RmqZ11g6HS2kn2Uu5pGtFid1Ox1KWKv7hlsly169LzGUBFl46Ei7PMa/G
	RwXNOCj1vohjZziziG+IoRnZ4wa9PaHUYhlSlvsOGUW6qfAvBYX/WWJkpkXcd7vhcWPOrqVavV1
	wzjYhJHByr5/35aTDmzjWgEtq9yTytptfWKFhIFxUZrEt8do/ua9z4R4x+4T/RH5FRjrf9w5iMi
	/5UzmsFhD8bgjrHfIf4B2sC7/wA1Q7RSGz6oSmMv0om56Gz0zaWFxEi9Z1CW9Q0Jdug9rZsqO9d
	SSDzYNSLYvUuEMogFQlHG8XCRWuTc
X-Received: by 2002:a05:7300:3e86:b0:36e:3ebb:7ef3 with SMTP id 5a478bee46e88-38282bb5c41mr4863247eec.39.1795090226193;
        Thu, 19 Nov 2026 04:10:26 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17604650eec.26.2026.11.19.04.10.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 04:10:25 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	himanshu.chauhan@oss.qualcomm.com,
	conor@kernel.org,
	anup.patel@oss.qualcomm.com
Cc: clement.leger@linux.dev,
	cuiyunhui@bytedance.com,
	atish.patra@linux.dev,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	will@kernel.org,
	tglx@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	shuah@kernel.org,
	yuanzhu@bytedance.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangzhanpeng.jasper@bytedance.com
Subject: [PATCH v13 09/11] MAINTAINERS: add RISC-V SSE maintainers and file coverage
Date: Thu, 19 Nov 2026 20:08:33 +0800
Message-ID: <20261119120824.13969-22-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
References: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

List Zhanpeng Zhang, Himanshu Chauhan and Clément Léger as co-maintainers
for RISC-V Supervisor Software Events, with Yunhui Cui as reviewer.
Cover the architecture entry, firmware driver, PMU documentation and
selftests in a separate patch, as requested by Himanshu. Also add
coverage for RISC-V firmware drivers and the architecture selftests.

Link: https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 MAINTAINERS | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..c2d283895ef4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24060,6 +24060,7 @@ C:	irc://irc.libera.chat/riscv
 P:	Documentation/arch/riscv/patch-acceptance.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 F:	arch/riscv/
+F:	tools/testing/selftests/riscv/
 N:	riscv
 K:	riscv
 
@@ -24072,6 +24073,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
 F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
 F:	drivers/iommu/riscv/
 
+RISC-V FIRMWARE DRIVERS
+M:	Conor Dooley <conor@kernel.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
+F:	drivers/firmware/riscv/
+
 RISC-V MICROCHIP SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 R:	Valentina Fernandez <valentina.fernandezalanis@microchip.com>
@@ -24128,6 +24136,7 @@ M:	Atish Patra <atish.patra@linux.dev>
 R:	Anup Patel <anup@brainfault.org>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	Documentation/arch/riscv/pmu-sse.rst
 F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
@@ -24176,6 +24185,20 @@ F:	arch/riscv/boot/dts/spacemit/
 N:	spacemit
 K:	spacemit
 
+RISC-V SUPERVISOR SOFTWARE EVENTS
+M:	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
+M:	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
+M:	Clément Léger <clement.leger@linux.dev>
+R:	Yunhui Cui <cuiyunhui@bytedance.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	arch/riscv/include/asm/sse.h
+F:	arch/riscv/kernel/sbi_sse.c
+F:	arch/riscv/kernel/sbi_sse_entry.S
+F:	drivers/firmware/riscv/riscv_sbi_sse.c
+F:	include/linux/riscv_sbi_sse.h
+F:	tools/testing/selftests/riscv/sse/
+
 RISC-V TENSTORRENT SoC SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
 M:	Joel Stanley <jms@oss.tenstorrent.com>
-- 
2.50.1 (Apple Git-155)

