Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2752934BA28
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 14:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728912; cv=none; b=PrVoscOo8ubYJLXDlnmPmobRVTK+OV1cRSKdexUmwbc0AdEugBMAyMoHPADP1jZqiul2m5chyqG+PcUiyTgBpknxNwPcWj81jv08e61Y1+TKFjcXMzwFVVAptkYSF3rWVdQz7fXUq+oK8P9FikonvaJQ7dNFqpcEND2z/l0ZRm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728912; c=relaxed/simple;
	bh=IRZyJ0fopRXhrBse54glb0AttLyv2hlC/a2Ga8rTfYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KYEQ4dztpguhwmw3gy4LPFpmH4PCpmyqm6KUClvOFLzrsl7qty4Y+hkHFkQFxhmNx/RkxCW6QjUHLHtJFRFvOJtYkoGb/1W0ggxjMDXZu1GItyu6ffpzsVif8RxOI/R9t8y9uKcWN2pKcZ7OP1csAZ/L4TU43253BNTs+RWWoOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3sftEMj; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3sftEMj"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca957432c7fso8594992a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 07:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784728910; x=1785333710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhfzR90Z74WPj2CRcWlLERVPxsI4JJvonp11/p/J06I=;
        b=j3sftEMjDErU7K1hmqXQ/B46+/mjgK1pkoWsJzKs9C172+hE12VEYlEnuYrCWzdu0t
         lOEHoFs4cdetOUHAAiYuKPbK2DciZ3szo7BzBoWeA/f+MLf2ohT9KHYcupXalw7eJ2/k
         zAUyKQOwIaNotYLp9oBNjfTYr+SAEYHyXDavWXq9qvOL5d5c3vD4iyi+9VGVe1Wkxr3U
         31Oi+Oal15u1/8bXZjAEDzIVX3CEW0QWDoJXMT3k2d22MBeovtpJlhVpJVlWfKPpMqWf
         hsaIIO+nZrQ2SZ931mY2bl70o5P1IyaVZBUY4uf0V2lQpBPZtCZxfOo7CvoDnV4sXM60
         op2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728910; x=1785333710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lhfzR90Z74WPj2CRcWlLERVPxsI4JJvonp11/p/J06I=;
        b=SfzekJUB20jljx3ES4QbvCJKBJXtu/lQIsIIkBy7TmQJpmz/t2WbqiCnCjKSgMcGoA
         T8UgtO7fszsbYNgsO2DIuHZr6sV8PuYKlFXIldvPzQBO6gJ9Wx+rzdmGzx4Q0N8LNpmq
         hnwMfVwe+0Oomge9wdcHsQzPo7dFyE7kMZWIma2x604cVa/kt9kE+bd3pdvHEhTn5uce
         lezoDq/1mGFIIpAs8HVo35h0ug0O8gTNB1mwu/rv17Xs35NTesOedNVpwn1hYt/khvfT
         n7XkKrHT26G6Is0/kXaPiBqILLDOlAVEoNuSdkekh4HlaMoBm1pzNN6zWqpYj+VcQkPF
         eEtw==
X-Forwarded-Encrypted: i=1; AHgh+RraHA6XvRn71Ltw1z54O1l4Bo0ENh5ofbzGJtZ0JZDJMD5IwTmjPBQ1G2Zj6yc/ywmmdo7yGDnq3MAYl7ljGwY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1EhKyXWYZVmEzawnkDc7zt90OCw7X/3aBINU8aJhbePV0T+eC
	OB0NExAciWU5i8A6PEGoxhYYHa7QVDUwr+joFdEDkPavMjeyBR9VKB85
X-Gm-Gg: AR+sD109hhx1Wb7+O1sJ8fHgVmHgIfP6Ylih9lBoOacepKb9dIo/5lNOa+Ha4WFsnGA
	siNZlIXHcZoO8IyGlTsl8jQD4riH+lkK41Y73Vu19DsLz0fTu9fcxpnfZibZqZPxLumMwRr3Kv2
	TCfB01/0q42rk+QSTq42LLVJ8xm9pIcSUOfvCYZBJP7H46Rl/KyuDPQVvysBpjbOnXTXInCxXiP
	YL5GyER/OCtMHMM32GvgNkaenZhxi3n873exlrHzyJtO/ShQbNuJFxfjJc0J46ufZX99cx9jaOy
	9FQfiXcONoWnLgJ4Mapvb6KxhmekQevXNQCzj6MQCaUi8LlmuFViv2RrRwh0luzjmLMA+EVkb++
	D6DuoDeCafMU2Qr8Md5N7XhnoNjZ/qrcRy7xARn+4P5c2Ktux7lAGuVHr5c6T84cFwpJl3wlf9w
	TkNZq15L0BvHQJSuP3rBr9DO/1yhaCv/9mGCkfs8bqar/vxxo=
X-Received: by 2002:a05:6a21:62c4:b0:3c0:b3f7:e5e5 with SMTP id adf61e73a8af0-3c3ad65cc12mr24097620637.25.1784728910120;
        Wed, 22 Jul 2026 07:01:50 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:40b2:277d::3ef:c9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a1fsm1242281a12.26.2026.07.22.07.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:01:49 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org,
	pulehui@huawei.com
Cc: alex@ghiti.fr,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	puranjay@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next v3 6/6] riscv, bpf: Remove BPF exceptions from denylist
Date: Wed, 22 Jul 2026 19:30:13 +0530
Message-ID: <20260722140015.1982158-7-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722140015.1982158-1-varunrmallya@gmail.com>
References: <20260722140015.1982158-1-varunrmallya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes BPF exceptions from riscv64 denylist on
BPF selftests since support for exceptions has been added now.
Also, since the file is empty, delete the file.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
---
 tools/testing/selftests/bpf/DENYLIST.riscv64 | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 tools/testing/selftests/bpf/DENYLIST.riscv64

diff --git a/tools/testing/selftests/bpf/DENYLIST.riscv64 b/tools/testing/selftests/bpf/DENYLIST.riscv64
deleted file mode 100644
index ca1beae7fe8f..000000000000
--- a/tools/testing/selftests/bpf/DENYLIST.riscv64
+++ /dev/null
@@ -1,2 +0,0 @@
-# riscv64 deny list for BPF CI and local vmtest
-exceptions					# JIT does not support exceptions
-- 
2.55.0

