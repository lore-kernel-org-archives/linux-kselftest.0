Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6723AB498
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 22:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721397; cv=none; b=SJWRmmb6kpbkDRv9VzgcOG6GohYdfTlrWk+SdX26uVclX1zY2TksAno/Q0Pyw1dvvCZA8M0RqzTbRVLzbA+xI8KJVQFl4qzwRmPQxj9gN4FBgR2/Iz+TBPj1HnKXHa2luYJ3GE3a3MuOPJn9CSVUHcE5QO60f5tmHAOVa3oQHiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721397; c=relaxed/simple;
	bh=2ub4nWDm0UVYQYyGDF1toKijPevZATTh6AvmX5L9lCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RpaVCR7C834vCVWegvIu/c9MODAhZIA/T9j2Bw08jvyu5FZTpkFNZ5ZHGqOyjRIEWnSrYchewp2zazW0YrGwWfRWg8frpzAc7SonXSDpdGjl1IUNLpYoTbd/HHwcImmuNOZo6AJsvSi2MPfZALTPFaE8Xple3NzoB/fyDbFLdeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VHkrpIcs; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VHkrpIcs"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c19bad03so12028445e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 15:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783721394; x=1784326194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0QBgcMLklUoQmlz1/UnBhglC0ubS7JdAEvyzC3RRRc=;
        b=VHkrpIcscChXkRbOjLQtWOBEA2Pg00onM8yH9ckR8koab6lEZfyPkBpuZTD3QXuLfw
         q6YuSYLCvDv9lV36dChmmnY9N8KQwhtGcNsdOwM0dtKXKNMbm1LAffeBXlUZxA0dsEIm
         8hH/QMZm7VdHcplZZMXf3T63qgVSZ8qrz1ai8RJWBBOvsp2u5psIZn0eRJNpChQjYOw+
         PLUMtrE546ttRAomPImmvD82iwFBxuQyB7bcsmIVOX3a2Y7IrRvaHCn0K8OWpgRkZyc2
         K3H3yZnSAnhONaUxp0KcvgFqOMd5inGDqmleiVuL2AAYzT1fPNa5+E3h7qJoa3myh0X9
         h6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783721394; x=1784326194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n0QBgcMLklUoQmlz1/UnBhglC0ubS7JdAEvyzC3RRRc=;
        b=Dhf+0w3KE7cHciI5yanPC6IZga6A673I8V9k3dXwtDy51Wu4zygEGAN22x5zbYwEe/
         EFR9Eqmdk+Iy+93xSRok7vm+NhVUV2oU+a5YrSzjrXiQSxpKc5OFIm9Q3dhtEJPhOTh/
         /Z7tQjitCSNSYtLRYQxMvBucRtFYXaVRdA774Dfr3Wf8ShndRpazXSxMyzrWWYPDlEIE
         3WDByyGCXZP62lFlVuBk7z+A3GOrJiilwrHqHF1vitwpGLslyArZx7TC3GV1iTjRQI2J
         s/2hCfkfCzQS/sP2iyCQCPMSZNYk+cyx4yE9TOauLOXftBCefG+0wsnAcEAmVH/N03od
         V1iw==
X-Forwarded-Encrypted: i=1; AHgh+RqV6Vdetaq68yMu0hHZPhGJD6JAkq8DPg4gGl6U2G4B3hxrFbJYZemMOXvbuHgSqx1/BiNZBZNeWXf0VsQH3xE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCJ+HXfAzDRoZ9gXRP1GT5CO/5rR4SkzuMj52DGZSxLBey0Bz4
	8G6aWzjdVVR3Tpd4c1EQbXPUS781NWbP5IxjQ/HfBbT4lLo2hr9dKEMmlD5IHW+A0gqGSTZfA8P
	PWCGbOX8=
X-Gm-Gg: AfdE7cmrIsXNPXFbDqClH6NsiEhiw5MxBA9kVLYqipGVVeWkkmE4pmRGlJIHr+C2aYe
	smbdQTZIzGHoF+dzBLnsggy6gbt8hkZceLgG4akRpWMPJMbcxLMyIYZRc0vONj3YIg+K/DFel+8
	08bY2gPSd5KutRRIGyDiwgHNPkZvXQPA7/TKSW+8kIaEPu4b30ewGvJlUqNkspBCojJI3C+2FwG
	ukZifKbr3olPedlUd4K0ZDkaK3ZQl9qk637MEVTQ+5uP8c1qZj+IgVOzwuDrpJ/BtBGMcSjuomV
	nZO/6XzMfexNCYkWaGlRmlLlo6Ip+7NfAnsUwlntPpCJ4UrCPc5f58t+caCb81HStA6zM0JWhQt
	Dk+EDc4UzQjopIoqYd3w8WUwo2p2su1GB5EMw7hofsllSGCbhLKQAKD4E5HZrZoIDXKch4xOrGj
	SRPw==
X-Received: by 2002:a05:600c:6287:b0:490:d354:bcf4 with SMTP id 5b1f17b1804b1-493f882e125mr5064455e9.27.1783721393697;
        Fri, 10 Jul 2026 15:09:53 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:157e:cc5f:6c4b:db0a:5d2a])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e7795988dsm42915837b3.26.2026.07.10.15.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 15:09:53 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 10 Jul 2026 19:09:38 -0300
Subject: [PATCH 2/4] selftests/bpf: Install resolve_btfids.test.o.BTF where
 the test expects it
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260710-selftests-bpf_fixes-v1-2-aa24dfd6f4f9@suse.com>
References: <20260710-selftests-bpf_fixes-v1-0-aa24dfd6f4f9@suse.com>
In-Reply-To: <20260710-selftests-bpf_fixes-v1-0-aa24dfd6f4f9@suse.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Christian Brauner <brauner@kernel.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1783721384; l=1976;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=2ub4nWDm0UVYQYyGDF1toKijPevZATTh6AvmX5L9lCU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOBhfC+l8ie8j9ab6J7tqHpnUdPRaXL4guicfZGuv6jrHoPEPsthfAwD1PR1pH5vNhyESzDS8ov
 YdJ/SpwAvxAw=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

prog_tests/resolve_btfids.c looks for "resolve_btfids.test.o.BTF" relative
to the running test_progs binary. resolve_btfids always writes
<obj.path>.BTF next to the object it processes, so building
resolve_btfids.test.o also produces resolve_btfids.test.o.BTF in the build
output directory as a side effect.

INSTALL_RULE never carries it over: it is not part of TEST_FILES,
TEST_GEN_FILES or TRUNNER_EXTRA_FILES, and it is not copied by the *.bpf.o
rsync used for TEST_INST_SUBDIRS. After "make install", every flavor of
test_progs, including the default one, fails with "Failed to load BTF from
resolve_btfids.test.o.BTF", even though the file built fine and BTF ID
resolution itself works correctly.

Install it next to the rest of the per-flavor build output, using an
explicit rsync in INSTALL_RULE like the one already used for bpftool.

Fixes: 522397d05e7d ("resolve_btfids: Change in-place update with raw binary output")
Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 47911c9b4977..7260d672acf7 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -1057,10 +1057,11 @@ override define INSTALL_RULE
 	$(DEFAULT_INSTALL_RULE)
 	@mkdir -p $(INSTALL_PATH)/tools/sbin
 	@rsync -a $(if $(PERMISSIVE),--ignore-missing-args) $(TRUNNER_BPFTOOL) $(INSTALL_PATH)/tools/sbin/
+	@rsync -a $(if $(PERMISSIVE),--ignore-missing-args) $(OUTPUT)/resolve_btfids.test.o.BTF $(INSTALL_PATH)/
 	@for DIR in $(TEST_INST_SUBDIRS); do				  \
 		mkdir -p $(INSTALL_PATH)/$$DIR;				  \
 		rsync -a $(if $(PERMISSIVE),--ignore-missing-args)	  \
-			$(OUTPUT)/$$DIR/*.bpf.o				  \
+			$(OUTPUT)/$$DIR/*.bpf.o $(OUTPUT)/$$DIR/resolve_btfids.test.o.BTF \
 			$(INSTALL_PATH)/$$DIR;				  \
 	done
 endef

-- 
2.54.0

