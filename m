Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F9B3DD86C
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 09:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689004; cv=none; b=kMHHknT60EJaj0jMCSr0XgAfP/Qklvj1O62b1fltklP/OUj6ECkhNcJX4AlM0SjAvp1JIECistXGDyAXY2u54C+EMjjbXk0udoya7E0mQfdCwZLW1umxmxzxnRm2MiUB7inQVpv8mjqSGlABEFW309m5BcKZbvne/IskJohBPJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689004; c=relaxed/simple;
	bh=M1i+cIvPBQBLCdORlbIdFFEY2dmcbhdAhNY2zoLxHuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NQq9BMfmazLJmp7vIjf8GfZvGTTGx7di4crdHqoXMfQ95tuzDPgetzyyjjVS+HBDjLCbV95zUcbnEP+v0/UsVaYIiNshxIPIzCIaEPVvg7oVNmr8mGgwckKWHPLesZPUeMrSmU/IE3S0o5mY9QUlKdU8GGU1UnXMBGHdfiIRWNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REL0JIaj; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REL0JIaj"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-842307472d4so2143850b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 02:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781689001; x=1782293801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCUbyKp25k6wbPFQhAin1766IMB+KALX6614QevcGxg=;
        b=REL0JIajjAQzQTNYes+S35iMwme2AT/0oNJr4eYmMaDVPusFl+D63yBeovqavbF42d
         FDRd1p7vuUCb7Ha3HzHSTcsP0tQlAQzSRZN0mBbUTy7QBszleGwE20C8wU5/dSh9XKD2
         gCkyZXUkVAiD6zvuohF8qs66pyuxpo8cJDlQ4P/aqBkLNxjktxpX2Cf+tP5t/m7KqpMA
         IWZ5i7bwhGSzqEcD7EEmOhW8Oe4qP1kQqEMQBVOMmNJOckSKbD3hNuDhm9g0NnAXIs0Q
         mrhPMjzPEDREH0QmIlvnsC+ceBFPm6CVpdGWwmuxBYaOCnsHcYmPuK2NsqF/axIuufGE
         Z6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781689001; x=1782293801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yCUbyKp25k6wbPFQhAin1766IMB+KALX6614QevcGxg=;
        b=WWfmXPaeZoOwFyAsJhAvrpj6hp2RPsg0wkRLdWH7DidIuyQitgs8nttAHFAVfBHdIP
         tcr6kZpXtDmYSNsnglAUvB7sCZCzbGuGkf/hjGHnlnHM3yA/Ed5ZKmyLOJc9Omoz4vNy
         9rmr9tdsboYi4fn9czIKqQ1/0Mou6TBQKhVGKTf6+rgLAfzhu28QtMFUAockwAka/B8Z
         IMQdhFabeKA1T70L7DrT/nTBFMKrdSUKAZiBXYO9ETI5r7Kj/a2twSnfHC8VLE32FBJW
         r2ZdgSJMWxBPmW5guqhMTnSOzfl9lvBmXv+mSTpJyjG461eeHcdzFvOzXRaIEiCt5v10
         8FFw==
X-Forwarded-Encrypted: i=1; AFNElJ+GMMN5GgCW88ujvjBDXS5vNFWANR30wyZqYF76FRXKWbDO6ZZM5EXHuXekW+ykt5x/TuoNkjlnku8YpdhaN3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmY5+SIqeCFGWgUZhCWokFUINPMVGXm44WxK15dIh2Qw76BF9S
	O6nY6sztjZRxSc3Q8Lsusp4RlwoOy+hiV8/khDuvrISgi61RKRrDRmXS
X-Gm-Gg: AfdE7cmgGc5Tmr+rVUayOhbmD83f6UzyzOgpoCZ2GhJ5Cfa6+EGgBZ3KOWa7G7Q1LL/
	EDpHkMmdtk9kEkvtwcEM/EJ2jdPP1nxDE9CL58NAwMhCbwI+WPBtCRrFFgYM3ttar9gnsLPYjWl
	xQXrRqyDaqMv/q4ykFsZUsL4AHhDL3uyGijzF7iHRi9PDX1uy09WrOLWcngiCW5fFhT76tVG0Qw
	FRPXCqer3nZkP+RgX/xyHDS1dxF/i5BZ01fmnLJbxxBdZK3eMOTeLIeykqFs/JbsH7R0581+Isb
	gadFTf+Zqy7YB5q5fstXP7Zo/0dPIO9Sh5+/UhPUd7Bx+H3C5dE2BvVamRXRvj+dRzzqvwMj9q6
	xClWmv48NfdL3QdoEMVS3YawFZo8cURA6AmZ25nHwcntMrdMPYf+DsoQFoliep3qsgMvEbiVPwV
	98g9bDwEuTI2mUQCkpAC9TK93bigf5DI08TYBIxQNMlNCyoACm2HW2
X-Received: by 2002:a05:6a00:399e:b0:835:405a:7e6f with SMTP id d2e1a72fcca58-8452444f361mr3184886b3a.14.1781689001317;
        Wed, 17 Jun 2026 02:36:41 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a304:100::206b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0226acsm15521653b3a.48.2026.06.17.02.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 02:36:40 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	toke@redhat.com,
	lorenzo@kernel.org,
	paul.chaignon@gmail.com,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH bpf v3 1/2] bpf: Fix partial copy of non-linear test_run output
Date: Wed, 17 Jun 2026 17:35:56 +0800
Message-ID: <20260617093557.63880-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617093557.63880-1-sun.jian.kdev@gmail.com>
References: <20260617093557.63880-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For non-linear test_run output, bpf_test_finish() derives the linear
data copy length from copy_size - frag_size. This only matches the
linear data length when copy_size is the full packet size.

When userspace provides a short data_out buffer, copy_size is clamped to
that buffer size. If copy_size is smaller than frag_size, the computed
length becomes negative and bpf_test_finish() returns -ENOSPC before
copying the packet prefix or updating data_size_out.

Compute the linear data length from the packet layout instead, and clamp
the linear copy length to copy_size. This preserves the expected
partial-copy semantics: return -ENOSPC, copy the packet prefix that fits
in data_out, and report the full packet length through data_size_out.

Fixes: 7855e0db150ad ("bpf: test_run: add xdp_shared_info pointer in bpf_test_finish signature")
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 net/bpf/test_run.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index 2bc04feadfab..f15c613aaa4e 100644
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -453,12 +453,8 @@ static int bpf_test_finish(const union bpf_attr *kattr,
 	}
 
 	if (data_out) {
-		int len = sinfo ? copy_size - frag_size : copy_size;
-
-		if (len < 0) {
-			err = -ENOSPC;
-			goto out;
-		}
+		u32 head_len = size - frag_size;
+		u32 len = min(copy_size, head_len);
 
 		if (copy_to_user(data_out, data, len))
 			goto out;
-- 
2.43.0

