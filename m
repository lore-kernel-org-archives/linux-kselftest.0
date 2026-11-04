Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826545;
	b=zBkFUpbdPdDrr3+nEX9SmaPp+EfcGoP/UdxJlYUmGNhD8MARvfAb2nVP1g+WmBFHZob+
	 qkhZWvhWLO9Alw2lmv7iwzZ5i1vUsZ182Yi2ofR0+JoPlXeWnCm8J418V8YH+0C78J77r
	 i5VUEDkIh9ejpnLSL+EOVNB+mU4SZ7fDKpNibbmaqaKaOv9xPG/RcxNvCHGszuTIiGp6V
	 Xi8kUFsJruInnqTrtavkrloVMylApLQ1e8RepUdlUBStWdLeb26EU6EFpeWyoqjpOMw4c
	 BQnCOxwqxU1AkQtkB3GTYPeGojor4Ozp5WxE0O/sM4+wcOfNGlCmqU+Rd3tU/KGLejQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+BAJiaHT9SMjEKcOpf7f607KYh+We/BKby4YKSOmSes=;
	b=g8BKZrSyyaWIrZlOTLChFPzv6P5At365k/wvmwib6Huuv7Widca5VJlX//d08U69kwEG
	 Wy56zH5MvyEZ1AFOWD9NXE1Yk38qrBGulGvKafUV/sBiIOzWgZr2qzF53fS4VLVseS5FQ
	 GbL9CL5EMQrRBp6+X4paypLAJoLvJAlVEdKKr+KuaktgGSyAbJf6MBJRTJnnGlHSG7dQZ
	 C3kg0VF4E+4HXHo8k427Abbx5l3UPzGCtVL/GKaXFKswXy7ZDjLkvdAsGAwZ7f16KQ+uX
	 ChM7nffiD/2VOGqxXqLoPppKzRofjG1sBEv3FzqBX93LYE/9El/Fb2YHQe2h3i64dXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7fUPbcN;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3DE609507B
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A3DE609507B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7fUPbcN
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48bbb06e746so755114f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826544; x=1794431344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+BAJiaHT9SMjEKcOpf7f607KYh+We/BKby4YKSOmSes=;
        b=H7fUPbcNiBtA9vwbtM3wZKPmxv7HQZ9VU0ZRU1v1mVB441glYnt1BQC/BjaOrJqUvY
         XrMhTpnk5PhH88y57oP9KaCi25Hdx8QcZ7ocyObi78xLA1mzMB3vWCM0PFHY/tSxSJAj
         rKKY/GQ1DoFUzku0ALQDKkAfn3GaiS5DTvDydQmqebSVlZlu7UAMo/BNfta4GniKSDND
         1vIilRJMDtCPLZuf+thkbCkHi1z+90tugs1Sh+oZkndLI/XQtl/rH/3Ha9WqZiCqMsXn
         uxEDU58Lbj7j29GgXnKut8IwanKlnKD+ocY+lyLKxZ0tdNj0pbvHw/xV2OQSqk6y7OhB
         Z2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826544; x=1794431344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+BAJiaHT9SMjEKcOpf7f607KYh+We/BKby4YKSOmSes=;
        b=dYYGn/em/FXyi/oYbjRN1SxZr0+EgQmvO6i+e4PF8Grow66T553I9AQMYYCrISiEIw
         nBw6x7BxUdxGh7oXxMBId1M6OwUR0PrUmr9uFbD6PMMaGvn8OC/1Pmm3JKHzZcebtGAY
         i81KlpTrb7gK2kQAmAHfbC49NStzuJBpq8f0ibEzr4IQWtLKguur/jXT7B5DB2OJY2Bc
         PyoMZu1fYzoZqBBruzH1QNTST+e9mfcxQxh9bkSKE1zW6toSx7qaI1u1jrKm4dLN70W3
         PBkduy4Pv9EIKWx7qYiJPpLdZK4sTBbO663MY1SZLcPbzacPkxKzkBbl/sCt1bpWQBWb
         R25g==
X-Forwarded-Encrypted: i=1; AKwUvBwdqK0q1r1VV5NT9/rnlLhsA/o62GgiyDZhc1ZD9O2CdhIss7fUGDGjwCZ3poSo4fqgWkgxhYZTzaMtxujBq2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GPTh+wYCM/q6dJAVIL3BHrU8nYVjRtpE09RTS2Dv7cm0PzLjJ
	YCMwIJHiikUOQxb7tH9oVsfS3AuWYooR4f9/LbGK8GwVuhJG/KHP8j1f
X-Gm-Gg: AYBFou3APw18pPnfy2Oi2VH64C/2pLIMzR1p9PjjfwS5k/M5PsBHqei42IWgukHEvmH
	RdeFm8kkgbW68Kl4YlERj+cMkBqE+vSXBeitAOjwvAqRoLmNvOoz4TTWOVkycNYqVvqE1oftuu1
	79IxFpn2K91Q3b4pY+NNK4UWtvVHdx+raxRBGuhA/cinlahbcUzlPOE4yZSeRaKO+9JFXecK+PK
	qLhlHkJE2UcQ9nAvZT4GM1+NlRgR7GcHCBNXoHB0+Ba6ngv4uwWKc+hHQ8VvGwscu7HGdpDlRXp
	Ra+0yAtu9lVD2M2cBIZw29vxH7cp15Xi/MxMqUIrwcMz2xXZeoip68v0fDUGncvzAH0d+tEmPyJ
	HECuJCZDq2lL7TcQT1zeezgKAZRA7K7HCZX9eHCKV1HLS9lnWfVFWk7ktic1LdH+mosRe8UxJRe
	FS+gpTM7OfJN/FV+zLKOM5ZX3zoILkVE4WLN4y1m4nm7VeQDVmShOcxIG2r85VmJg3JepcCnB2+
	ASb087ANGwLMxnJ7857YDzCbVsM3Qb5y3wBghaXASvqIbq2lWgPElo85lIPEKQcPz1773ZDRfOC
	91UChD7dvO1bpUAjqYSjiMTQsSf5BCa04HowVQ9DFphZCLokNiE8eA==
X-Received: by 2002:a05:6000:420d:b0:48e:7508:bc12 with SMTP id ffacd0b85a97d-48e7508bda2mr36374736f8f.10.1793826544040;
        Wed, 04 Nov 2026 13:09:04 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed08343dsm5986455f8f.30.2026.11.04.13.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:03 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:52 +0100
Subject: [PATCH v2 06/27] selftests/landlock: Fix the reported clock tick
 rate in fs_bench
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-6-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

Since time is measured using times(2), ticks per second are obtained
using sysconf(_SC_CLK_TCK) instead of CLOCKS_PER_SEC.  (c.f. times(2)
man page)

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_bench.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/landlock/fs_bench.c b/tools/testing/selftests/landlock/fs_bench.c
index 78d1efcb2d20..05082562d272 100644
--- a/tools/testing/selftests/landlock/fs_bench.c
+++ b/tools/testing/selftests/landlock/fs_bench.c
@@ -32,7 +32,6 @@
 #include <sys/prctl.h>
 #include <sys/stat.h>
 #include <sys/times.h>
-#include <time.h>
 #include <unistd.h>
 
 #include "wrappers.h"
@@ -206,7 +205,7 @@ int main(int argc, char *argv[])
 	       end_time.tms_stime - start_time.tms_stime);
 	printf("User  : %ld clocks\n",
 	       end_time.tms_utime - start_time.tms_utime);
-	printf("Clocks per second: %ld\n", CLOCKS_PER_SEC);
+	printf("Clocks per second: %ld\n", sysconf(_SC_CLK_TCK));
 
 	close(curr);
 

-- 
2.56.0

