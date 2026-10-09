Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08862318146
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 01:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510616; cv=none; b=YldI25TR7dFSTJNdRsL2ZvB3J5cfTCc23Z4Y3d76AnsRtRzvjF+QLKtdfodrgMCMSi14s0p/gIz1Va4fJ7MYcEV6ne1sYjPRX+cO18hW7915VnKT3lEwcy08x/zFUcJXY4VBDUE3YN6dBP/MjE2ew8VRBRtSJuBRUKPFvGNQC84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510616; c=relaxed/simple;
	bh=om+GUUwBH6ToUbY7jlQ4dCRdnqUsjvHMbCMe/jqcWHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=apet4qNmyE2Zs0+U4pXSuSrVmVFdqaPR2gDoK2ROlNmSEUrdocxqDIPF7rkND7wkQBwDMl3eEa7N95dZszm9XDuJbAecLefEFNH+FuRcrIgG4yiAJU1Wib5AB2GUP7hPqrEjrEDxh1hp/45N7Xp5mqxvnxBFfJ8LC8p+9E1YIJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYnRVJgf; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYnRVJgf"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15943c9c005so2965265c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 18:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791510614; x=1792115414; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lV+huXTZ0xAteNiAHITrqOnDsRbJzozwdaHfD5FZYMc=;
        b=RYnRVJgfmZjR0MfiaMShD93coy7/vpnP9Kd6hqtIK6bvlvCSltZ7cug/e8SlSzOpZO
         GyRSBH9Hy1GCJIQHRsZ13AQyK9eHmxPjW9HwD/boqfIVFo3iM3KLdnnyBK9m9xh4bURM
         vNhmWsEjRXI2sF0g2DTgtKdU77W6zhaquANGicZWQKv71DWn+WurZxMZkxDtjuRQw4si
         BbvLIPmf+whfcKdWsx1ZVA2KqI8dtGf54DjkwGoCsXUcbnkMGX+bXfqnbk+L/aIDqtom
         xbcEXhefFJmzPNMJESF7aDeRm0I8q9REJKmkPioKs3j7DHWvbtiabSGh1B2m+G6mn27q
         SArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510614; x=1792115414;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lV+huXTZ0xAteNiAHITrqOnDsRbJzozwdaHfD5FZYMc=;
        b=MYnucIsM0ZfpKRrjlEWw7tRQzRP+cD5x6lgPAA1CAZUNKJUtnrH/PCey4eLsoUJTdY
         DPWd5fiKRlnirT6NWahdYo51s5omBv5yp26AxXa0LSHUMJP3ufdwIq9jqGxq58leWHeS
         VqARsUx9p+b/B+1VN2ylrJPtRxTF0gYmRnqf1nZLOkyzwBYPz8wRJEP4venMjJZLrdUy
         9YOORFLVc7Bi03sETtsg0hn9bknzIT3IuBvIkrdIVd3IBj/mLmt3EmbsC1tMJ8sZcf+N
         3m8zQ43cnUEEEO3iWnvzz2oUooJksmwh0YrgeiiNCu2jjnLcs1lH+RXRTqyClGTl1Oly
         7SsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQkaSGkA97AUvCW1QKjhOXpkhE5jP4//PZsuA8O70lD3FLIMVYhd2vtU6N1qp6aTzPX9fsZvoBwIQgL17OApg=@vger.kernel.org
X-Gm-Message-State: AFuF++kfYmjV/eMB2nC5QQcKOLXQPrhniBhJ/ZW8GrWZ1yQTsFOzI12D
	VGclVUn/4nbFAase9tCZizH7BUEG/YTpxBr7sUeE1Bz1PyIfBLGFM2fa
X-Gm-Gg: AYBFou3OnKN9Xmmdy5VRee63P47bTlUr+41VYj9khxI3dJIBsVGkz6zpWYuPtNftS6Y
	yF8D8F+Lw2fR504pu9fPtf1FjzrN3OQ+r6sCDufqJeWSDEXs9huq7pDtdK9ErWi1Zhnv/lOSvf6
	KPRygreaT/7YHkT/xBnBVQsUBSzVFHtPIP4NommGkXnbj+gHDk4L+06IMDqeN3KgwjBzm1NV7f+
	A4z4q6LqGozYQPne17hg+qo2WgvgjgfCXwC0b1jwNDIyPCH5+r/Fua/CRM4OQsIDK/2nRT+iUX9
	MzCujx4ah+aqkvo80Wq2CTTsGB0kN21tcqbPBYqjLgk/lxyQvZLiF7f5/XVRcL1kp+mW+KQCfnX
	3zQQivhyNze0WISfPpa9CrE/WTywuTvaMgCowK9W5oXyIkHF+Ot4jkHAO4v5O7av6dObYzUq5jr
	m2YPesryotM4f0QhW6hDN2ZEVP4+H1y4lpw9w5CnjJ89uhTytb5Oa313yfDwY2kgcH5g==
X-Received: by 2002:a05:701b:4588:20b0:151:ceb3:e0f2 with SMTP id a92af1059eb24-16a64aa0fc5mr502094c88.38.1791510613961;
        Thu, 08 Oct 2026 18:50:13 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e02asm2015555eec.27.2026.10.08.18.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:50:12 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 09 Oct 2026 09:50:07 +0800
Subject: [PATCH bpf-next] selftests/bpf: Run tc_edt serially
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-selftests-bpf-tc-edt-serial-v1-1-f72e045f2465@gmail.com>
X-B4-Tracking: v=1; b=H4sIAE5IyGoC/x3M0QqDMAxA0V+RPC/QirrprwwfuppsAanSBBHEf
 7fu8cLlHKCUhRSG6oBMm6gsqYR/VBB/IX0JZSoNtas771yPSjMbqSl+VkaLSJPhjYQZ+9i1gZ+
 eX00LRVgzsex//Q33nmg3GM/zApVBAT13AAAA
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

tc_edt shapes the traffic of a TCP connection between two netns to
5Mbps with a BPF program, and checks that the rate it measures from the
userspace sender and receiver is within 2% of the target.

The measured time includes the time the sender and the receiver take to
run. When test_progs runs other tests in parallel, the sender and the
receiver compete with those for the CPUs, the transfer takes longer,
and the measured rate falls outside of the 2% margin.

Make tc_edt a serial test.

Fixes: b0f82e7ab6fb ("selftests/bpf: integrate test_tc_edt into test_progs")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/test_tc_edt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/test_tc_edt.c b/tools/testing/selftests/bpf/prog_tests/test_tc_edt.c
index 462512fb191f1..1e82d88c987a7 100644
--- a/tools/testing/selftests/bpf/prog_tests/test_tc_edt.c
+++ b/tools/testing/selftests/bpf/prog_tests/test_tc_edt.c
@@ -127,7 +127,7 @@ static void run_test(void)
 		  "rate error is lower than threshold");
 }
 
-void test_tc_edt(void)
+void serial_test_tc_edt(void)
 {
 	struct test_tc_edt *skel;
 

---
base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
change-id: 20261009-selftests-bpf-tc-edt-serial-9c65af71f845

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

