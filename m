Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA5F3F99E5
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 09:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725488; cv=none; b=CWedrUZXcJtEaFm0CFajmcZDD+4ujzO2UONwJOkMrecHGR2elR0usTuiPkSa/u4gVm+KjFqpybRr+eVKufUz47hQimmW+l5XLhqnC9CSmc/+2HPj6/a0ZAk3rrJaOzrdnUv2ZT1DGXKIJqNsPZeF+pkRn6WAI04OkU8WO7aSecQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725488; c=relaxed/simple;
	bh=De/vsgMdYMrS2AQ+tqlj4O6nnOPDD/rmfoCD54wdRA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vGpVuR416p6Hmzh6tJOQjVgaaYPGsqW2WhpCBwB0GZZU8nkqMEJeW8powz1HxsEAYSxZF7gX3u/LPHUyENgiHLQ2AuQ8mHO5Ames8RlVmpAUgP7WRdDGF9El4V2Zjfk+IJ2zqTvfEm3E6G0iIs8tL0Kr7JV2kiZYxZnWxKGzzVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHtxuCkv; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHtxuCkv"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8478fe07f0fso361910b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 02:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782725487; x=1783330287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1R5ufUL1JYVLa5BSDpNGTaM8Nbmty7gpJMGe0EiBf8U=;
        b=fHtxuCkvQcap/WSSlWhlNfXE6l44L0gOk2Tbz1uuHZOfZtHAd3O43/+M0Q2XgHDX9H
         I96UuyB3WqLBX7/OwrYWl1UuGQ3277CWpRruYDzjfR35PIGc7XmhmtARJO8Fvai2z31R
         uRU5ZjzdNEtyLCXmA6+sn+WgDOrgsB+7TfbpKZ4KwhjBQC/OqrFTTz6eciX+uSOTf0kU
         MnA4GZigWWceRrULQjhOJf23kQL97gQ1dcwjw5g3HDsjJtfg7Qln9iF3ZBWXWg/uzce6
         Vlv5BjorWdSz8fqXNiAn83ys3Xb5QtvmSrYCXyCkgQ3jUT3MB9nptOAHMKSiOJQqqSkn
         3jYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725487; x=1783330287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1R5ufUL1JYVLa5BSDpNGTaM8Nbmty7gpJMGe0EiBf8U=;
        b=Es4k6+wuYkVdg4HRhGDGUz3hwfusFS27kJdJO/Q+3U1PZgIM41WyFwsunHvTcdFRUD
         rAxmu7nYNzsNkxmEIqyZ9PlBJ9eaSypikIGPXtnUoTeDER6hEN5CpgfF6NDV+aivCFPI
         euy4MzISJ2KQR2M4Bof4nA3qGENvYp5w/NDMXKwrCRBLFIw8AXqbNR/jLYlQoeVUa7cd
         WC2n8DgU2gEqgEZp8+zG+b1jKRi/HZW0GNBeMizlkRVK7NB6hVAGntEBrEKTeAKXWlFz
         2OLwyHndL259FFwrMntXUq7Nhcs0CfNoItzO7WAN6vyxKpIPEw9qCnAdJ/VtCXhVzkz5
         sqMg==
X-Forwarded-Encrypted: i=1; AHgh+Ror9fv2JmBF3Rd3Db4q6S+e3t9xTRxC3ZDnoQQW7McAtpqyLyNKiZzw7TKNEBOZhk7KBRywLdRvkb0V6hIMQwg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdeYKVLfTKEWbT4V6iBgkBQeCVSOtWtRUTWG4PC2yleaaYZKVw
	/cvDD3RvdnF23VTlnKV4Yj2GkOegC2EguK8lPcjPlple6Td7kRlZjU7S
X-Gm-Gg: AfdE7cm9DUA64oIdqLVU8peg+AhGooyIFv2iqZi4LaZJ88rjO9Whp7Q8JMxCkYgYCuz
	ZDLxiqQxIzwBMt/R58qmHLcq9ewNwgSUwGKJV7awufohFuuASs4fw9aVXowbnh3icWOKOM9c9pj
	tEDXHD2p3HGl2j/IR0lCJ7z/06rm4qsoUoY3n3XDQU7OqQbGLyroMfAhIlnM5UxxpkHqLMRSGUw
	e4boIFgaj15kOcUMuRyalXxr3UcOvIqmNxVs6R3b0vgyT5Er+BkcB/0pKiPqoAwtCzB6bCfgKow
	ix5NLuKzumQAvsPxI2Kvfn8Te80ilnqgKEKkla1XxR/kQRBZRsSKyInXiaWdVbLE3iW4ucDl5Yq
	7v6DeiPwpkNElop2XqdkCioEsGt38GDw74wulLO7QDrN13mk1Nj4mIXhrhrdFia5bjb3Z3Cg5BW
	UDqc5Kg+uMAqDka10=
X-Received: by 2002:a05:6a00:90a8:b0:847:926c:5837 with SMTP id d2e1a72fcca58-847926c5c7emr899938b3a.11.1782725486620;
        Mon, 29 Jun 2026 02:31:26 -0700 (PDT)
Received: from martin ([2405:9800:b862:14dc:12ff:e0ff:fecd:7ddc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3feb769sm11591198b3a.17.2026.06.29.02.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:31:26 -0700 (PDT)
From: Martin Weiss <martin.githubacc@gmail.com>
X-Google-Original-From: Martin Weiss <Martin.weiss2410@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Martin Weiss <Martin.weiss2410@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 3/4] selftests: powerpc: fix spelling mistake
Date: Mon, 29 Jun 2026 16:30:53 +0700
Message-ID: <20260629093056.591498-3-Martin.weiss2410@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629093056.591498-1-Martin.weiss2410@gmail.com>
References: <20260629093056.591498-1-Martin.weiss2410@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Weiss <Martin.weiss2410@gmail.com>
---
 tools/testing/selftests/powerpc/tm/tm-tar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm-tar.c b/tools/testing/selftests/powerpc/tm/tm-tar.c
index f2a9137f3c1e..ea420caa3961 100644
--- a/tools/testing/selftests/powerpc/tm/tm-tar.c
+++ b/tools/testing/selftests/powerpc/tm/tm-tar.c
@@ -50,7 +50,7 @@ int test_tar(void)
 			"bne	2b;"
 			"tend.;"
 
-			/* Transaction sucess! TAR should be 3 */
+			/* Transaction success! TAR should be 3 */
 			"mfspr  7, %[tar];"
 			"ori	%[res], 7, 4;"  // res = 3|4 = 7
 			"b	4f;"
-- 
2.54.0

