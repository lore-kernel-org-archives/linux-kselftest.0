Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274614;
	b=rqM0G5cVz8OZKblHrJgfozYT8YhHhhy3OeeNsg7Y6l0kHtFJ3vHTOOaD/oRslbxvGJ6O
	 oJIEbfL6DSUSKARA20tsiS3Tc/7gzQZ4XQNyFxclU/+3xxfTp7GJ5nXJp8qj/2iz5qVPa
	 N7Yc68PHGU/Bq6NkVtZOEy8fzi+gYT+TUvRObGeFuMc5qZ6DYCXgSpDc3mFK60WnDGJmW
	 /wt7WHCmmPrk1AocgG8YFCsmyJGvlW6q+s+ODbNIkDkkHfF+LIFycmnqdUYzFStXbtn2g
	 2HNqGlaEAzovH1GLH4ExDUX/YhvJLg6CPeTcLxF4tkXUIliJjDmfrnAcM3PHex0I7yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8rCHi1GBk0hKG09zgHxal2DvzYlGptJwEeRT1dMlA18=;
	b=vvG2EzsCG4/qP+6TzURY33EQiOr4Aprn5LC+KaxBSqf5USHm2idE6NkkK5vuoyRGWnpf
	 MzU3b0MaEiEOO2py6m5pvt/dMUJ5vVVIdUqG0/E8rdq8Tnuo880NslLdKp4F44EtiQBLU
	 +MuV+ebxG5dwGgb9QiMOPjUuN8cA5oWQaqKG+WDJXoDHRWMj1hJQ+zZXFPqWHc+CM3Fb3
	 +hWjOXzbhubQaolI1Bp7dQMU3nNBqHHsJQJsItX/2Ve7NIli+5MSbwDLC/unQugm4NB4q
	 WaP/RYUdWYGBhxt8b6YNPLh40pWAJ4v0mVkhF+ScjEKSlaA+WbKTwEUWALOkoT23wgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gUJ0RV4d;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FBF606A325
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 11:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6FBF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gUJ0RV4d
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3ae1dca6bc0so850931a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 04:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793274613; x=1793879413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8rCHi1GBk0hKG09zgHxal2DvzYlGptJwEeRT1dMlA18=;
        b=gUJ0RV4dgIBToo1qW98D++224tus3S518xbUzyql5DwL91K8UrUpdUl0Wmjqd6C3pd
         jts83nNFs9yfOSPf4xkulncibm4GcFlnUR4IFG9YxUFsOgpeGKzW0jd3HL/uGQn9X+2+
         nmeA8ILdXhbVvmZJgLsgyYjIvHSB+UO1QI2+E0MOZueBCDgjwWT+z6XRS/gUKYCIlZ//
         pM2M+17quUYgqzVoVuYEXHVew2zK/y9mov4gH96vXT6+YcbX8KzGANLT+K9bhPInVRzZ
         9Etmi3FL9IueIUOUfBY2FBf9G2XA49YpFaVFERXUtr4Iho32Ae3Ye3xunG2rTN5ZtYo1
         Wf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274613; x=1793879413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8rCHi1GBk0hKG09zgHxal2DvzYlGptJwEeRT1dMlA18=;
        b=sLLyBOMrXM1O7G+9PqVdwJ8TaK1XrqkON8/dByPDGKVpwRj8EJx+iKqFicaB3doBop
         8NmQlgEILVVsE+0+cVIdl0DOnn1soFY4Xw0LeYDpOzoRj/zhPvNy4hPGzJ0VrPKdzdNo
         ucK6W3wwqZzuu8bx+WxxonJ/kdJ/Azvrtl0sA/+ayUkY4GZeQkY3cVpAkVz6Vw8D88TY
         4D1BPgdYb1sbxewkbYJb462GnKYZ9MVVE9zHate08ecWhY7K1SgcpB4wqDgvYdf91MFq
         2rXZ+qfHuYdmoTEhoUB7eaAz2IJdtVHlUhr2F12+z3sVrPVI95+jirov38Tr6EsFVrZG
         RJsQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7OjyLOP45Zs8Uw2y3TvhUtfKwsD/Z3c5x9p2gN8RPbeIYQKkbIX5qJCvUz+WAraMjd4ZLhKMDzTBRQKHShC8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWC7qp0pidA+xDryJYolTIBha1EFeGOTAlXVuLDpkdq/1G1UAn
	JjylWs2l8MBOzGirdxr74ZJhoe2b/KWEmrXOCiCccIFMWcS3Bt4VfWhj9Xz03Qd2TVo=
X-Gm-Gg: AYBFou0aS2/6c0WW0tFxKBzKVFsSo9kflpQUwGz1N8U1RCFQq5GLGHJygM3uMDeBSnB
	DeSUoioHRCpjTiFgaR7GyGLLB2B0b8haTi1D818nvnnZFLCexhcbGH/Rh477AVY51b+zMRha1C6
	mYAGSyP9tjpX692lRibOSAPrOxXrzTskK4bL/8UNrHoLEI0xfoLgiBgXo03Zq1+x1JiJEwB+OHj
	G6qJ8N7/hhTI7oweScV0u8/J7AxQgRZ+K/tv21hI8WUV1bRPS3L3/KZbEAZh2+EJgQ+0yU/1QL/
	McJCCynmrnlj/h/qa/L/IXTqpTaz7tYtUCm6oEMSKM2/2xvq+WX6ZQnhDx8AdfXrb6FgOLdjjSo
	nHVKE0uQCi3u/1fMimaJX88FcBan6ZdHIvbvjvLODIgKEAEtzEmCksGtP8br9p8nTPgPaDWPM32
	hrA3EcIjDnqU/T2CCwYdcq7ePux2DFLRrU+LaDgwEK6Yv8Xp6mNKfo+nAzazSwbomuTT/iEjDBH
	/jt9bUQ3wO9LTLO+EJOoR4gXsbYxlfl2hVYsu6Rzl6eOnpNso6a/BtpaMHLwI70iDXrBVxAqPP/
	r/UErpClfTixkhNBk75LF6VTyByAFtUirkBNlmnf3D+Arjp4cdPX4iWGrvS5vHhyisII1Fyxq3D
	nw4Ti8i8=
X-Received: by 2002:a17:90b:3f8c:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3ae5835d8a6mr4169699a91.59.1793274610195;
        Thu, 29 Oct 2026 04:50:10 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d64c0bsm4151053a91.1.2026.10.29.04.49.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 04:50:09 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup.patel@oss.qualcomm.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	yuanzhu@bytedance.com,
	yang.yicong@picoheart.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v12 09/11] MAINTAINERS: add RISC-V SSE maintainers and file coverage
Date: Thu, 29 Oct 2026 19:49:51 +0800
Message-ID: <20261029114953.27453-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the RISC-V SSE maintainers and cover the architecture entry,
firmware driver, PMU documentation and selftests in a separate patch,
as requested by Himanshu Chauhan. Also add coverage for RISC-V firmware
drivers and the architecture selftests.

Link: https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 MAINTAINERS | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90..f275e9d4847 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23506,6 +23506,7 @@ C:	irc://irc.libera.chat/riscv
 P:	Documentation/arch/riscv/patch-acceptance.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 F:	arch/riscv/
+F:	tools/testing/selftests/riscv/
 N:	riscv
 K:	riscv
 
@@ -23518,6 +23519,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
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
 M:	Daire McNamara <daire.mcnamara@microchip.com>
@@ -23573,6 +23581,7 @@ M:	Atish Patra <atish.patra@linux.dev>
 R:	Anup Patel <anup@brainfault.org>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	Documentation/arch/riscv/pmu-sse.rst
 F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
@@ -23612,6 +23621,19 @@ F:	arch/riscv/boot/dts/spacemit/
 N:	spacemit
 K:	spacemit
 
+RISC-V SUPERVISOR SOFTWARE EVENTS
+M:	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
+M:	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
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
 M:	Drew Fustini <dfustini@oss.tenstorrent.com>
 M:	Joel Stanley <jms@oss.tenstorrent.com>
-- 
2.50.1 (Apple Git-155)

