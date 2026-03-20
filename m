Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED0E3EB807
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 18:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774031387; cv=none; b=GpsY9ZqniQouakimmbDvs6NeA2Nnt2w9Z8d+i6rJ0qIdZmTSDzUypVif8mTYDZi/Gvigk/pMdkjxfnBR6DYTkjYEVjtzf/8g88wmoKIoyQAxFqV3Wu+Qi5Z1UZWEtvSM85IVU+pAmBUpEOkHlM9pCnClsfpAzrGp/PFg5XQcP48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774031387; c=relaxed/simple;
	bh=fIPCaFmjfpw2azVfZkKjNT2Lgi+aX/SG7M/IYgDoSp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XLtbqcGkGqoLSHDjsUhEotUoP0fOjGgU/xxtmZwTQUlCIR+/56enU6LZdZgfoQ4O6j96ucrAnznAQy/UGy0bsdJ6fETgCGqIXy5lAZqjiXhiYHY6r9Yukm86OQFnO9UswOsZUZLAe+oj4Y+LHZYPp4RO6de3cSg78vcwwTm3W9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=arJIf6eq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="arJIf6eq"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so8019285e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 11:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774031384; x=1774636184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=diCQB3Da2J9cXVPunYylAvPBplkDRKpPt7iOeuLiYGA=;
        b=arJIf6eqCnO/r87fVq0j9nlZDoKsdrAz9QC/CqBZAEULQA4nwJrq5rzuplfa4p6+Vs
         92skbfQJEg0My3hyckqGEXye5foIYdQ4WHgrT4tolcgLJ8utjfftaNzHbVyaQpBgv7V7
         A+eqHDd7K08F9F5IPhSiuiG5W3gQX7Nm4Hgp+SidQokce8FYCSfzEruIqyB9n6EIPM64
         gaHLm6etiVZBS/G5QXmneYq4kRtZg8Ugo2AJClNn1j5ws//Z3Y0bh9w9f1r2pyseWcwo
         FrOb2YA7kKxvkePYI6E9jJ+j1nxM4e7ybAxnqalxUQooEZckSbQ+awFxqhWXV9Z+hrIV
         SdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774031384; x=1774636184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=diCQB3Da2J9cXVPunYylAvPBplkDRKpPt7iOeuLiYGA=;
        b=ZHc7LHPalkLA3/WJzvRfuh32QICP2pTG7+hTIw8uUOBCDJnD5enOzjOD6/uDog8ab0
         l+YoJ3A+pBlf3aYPbAj2GOwCDtHUFXW+L5rrjFQ+CU6iK9vQUwfaz0gbP7nn+exV057Y
         IlzhwonDGadlbTMRP/rshAdoqoqd7U5OinPdJs5WQgXrzSCWRT2dfMjoUEfC+Q5HryF6
         Vt1YWFDwnyxx5GJ8IjGUbIbnfB14T7Vku5Qfn/3xE7wKvrf84BO1GDOMeYTh37cL+pjj
         1k6wY3+z0uDQ0ykXCAhpnCgiuy3JjBIWHBtQv4bzHObTfFFKiu4yzHb6uWIt03pQZAbS
         WAtQ==
X-Gm-Message-State: AOJu0Yz5dddi1VSCntCav4c0XCh+EybdIOq3iY803BZcmy6U69pouM2R
	lw/DF0z2rKZBM2KAWm/A50uLJgGMIqpVYjVb47o9phU2cWJa4WB69/gvd8GXXI4GpM783u9/BKs
	KHSm0
X-Gm-Gg: ATEYQzynJ8Bj+xY2QL+Lv1QsO+RRs+CAZ7Au+fwZ29KBMOZbxnG+HMKOPLv/4onbDsG
	Jt0EY74DZfcjFs796vepnyRI0KPJTAsyhzHI/w9u9sWOBez3l0fuj8aypr97MAO7tY4pCuPYbTU
	p3EjIxl4u+nJcJ9+7AxBZx3B+pfc0G6NvO6Rj+RQvwZTefZI+ehU6sq+67/tshSD5ekcmmMw1eV
	exSpdAZ7NVoDiL5J9T9msRee/A40eh3vOBf/OlLr2B1Cx6DZh1bZlssecu9TII/ulJrb9/QBybI
	Ioo3FZ1T/PliZ6aZZDMfGS5oLxr4qa1RHASxpjS4zj0vUboYSETxNmUh/9GQL04ZPRu/uMJq38f
	rvfUzjWd9pDoSchO8BYGNr48RiKY36Ilckr17ZeYcNa3fSHy9RcV3CQs7JapOXwokQzgaYsSBXA
	ZKhYNOMdgn4NV86sjpkN11
X-Received: by 2002:a05:600c:3b07:b0:485:419c:4eab with SMTP id 5b1f17b1804b1-486fedab40emr59943485e9.6.1774031384438;
        Fri, 20 Mar 2026 11:29:44 -0700 (PDT)
Received: from localhost ([189.99.238.44])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a905c1484sm19999477b3.49.2026.03.20.11.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:29:43 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 20 Mar 2026 15:29:21 -0300
Subject: [PATCH 6/6] kbuild: remove kselftest output in mrproper
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-selftests-fixes-v1-6-79144f76be01@suse.com>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
In-Reply-To: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
To: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774031363; l=854;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=fIPCaFmjfpw2azVfZkKjNT2Lgi+aX/SG7M/IYgDoSp4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGpT78RbMs8QRjkbbReWVytimj1Elin+rBO2xOPmR2QCJdX9njQMibxOJAJYfg7SAueZrkdT3z8
 /nQc1c9IfeAM=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Selftests built with O= store generated files by default under
$(objtree)/kselftest. Those files are not removed by mrproper today, so
stale generated artifacts can survive across builds and be reused
unexpectedly.

Add kselftest to MRPROPER_FILES, so that the default kselftest output
directory as part of mrproper target.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index c9b7bee102e8..91e6ec790a0f 100644
--- a/Makefile
+++ b/Makefile
@@ -1662,6 +1662,7 @@ MRPROPER_FILES += include/config include/generated          \
 		  debian snap tar-install PKGBUILD pacman \
 		  .config .config.old .version \
 		  Module.symvers \
+		  kselftest \
 		  certs/signing_key.pem \
 		  certs/x509.genkey \
 		  vmlinux-gdb.py \

-- 
2.53.0

