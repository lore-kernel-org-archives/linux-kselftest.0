Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559048;
	b=Zem77lkrFb7pmqq6aBfadNjj9QZIREUyy4C17gHYiUBgEf3E8AaqL8zuTt6TwlUknIX1
	 h3blsTDkUJKlJ8r227MgxGUSMiMRa8nCwaKV5GiD7LcRgeS3CM+8qXrmM5tC2Mjb27hrZ
	 pP86y1hhSLs+abO0fxQd5Xa4mxfDjHbvgIe69F9Xr15EffhcySqmatZhFagqcxRPfck+Y
	 VA6mFzQoOQi6cgWADwrVS0X1Rh5iwo05UG3CyzvEw+UqRH1B/U4qYSktBcLRqsNNkxFYu
	 BFy7PUVkY5raFt4xgeimPJ22+FDyDGAmCJ20JUljPhSMR/+AqA+KTkVrFIOt7YB+Chw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=+eCsDnbhPqUbpA9xaS6S0ip6SewmaxOg+pnShqolIyw=;
	b=VosEwUt9QhZPJ8lSYuq/2AGBQHOB/Sz7rEq6M6NgWB9klD87ZTY4HSh8L6o1/CN+bgG7
	 XyUVCU95sCfLiSwomrOhtn88j+ryU5fgI+DBDDYyD1pPp882kFVEVmFnvXMRpnBiMRfyF
	 s9u29KhQ9JjeF9YlEcvbb1Gthjo/vdknEUOvCFpszm/7yBP5iJyZmQ1Lbote2KjR9PCZL
	 OLC4QiDeCdzvmE2CroqS5sL/g2tdkpl20v4v1TEJ4uvz7LiEyYhhmaoLFw9viP1Fb7KxM
	 hBJ3s105teDVaCF7DoETbwaJyAYhlyMARmok3SR8aviOHYv6ClwtW7yzihGKcbolJXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=SgCe+KSs;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9925060A381C
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 08:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9925060A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=SgCe+KSs
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ede7cb02daso12769205ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 00:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559047; x=1795163847; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+eCsDnbhPqUbpA9xaS6S0ip6SewmaxOg+pnShqolIyw=;
        b=SgCe+KSsRyjkOzf4OHsVlb3Hf9FWal04KpQVs268s1oTe1DFawntXydtZWS/qEKPBg
         IDuVfMnscTgBMqG0b3Wb9hVl35YjiXJtE7qxIdgZyfRnVDtmTiT1MI6nTVvsL6JVv2II
         aACYWV0ZTLjMgpNYMolodetslbD/vKtmC9+lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559047; x=1795163847;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+eCsDnbhPqUbpA9xaS6S0ip6SewmaxOg+pnShqolIyw=;
        b=ivx5ehjNNrhkGSPZJ3+BHBocb4nv3dIOJ7HgyarPE+Aj6r1T5j4hMc937DTnf5OwSk
         DMfiDxMrRL96cA/a2nmUBIFMxyAggjzl8a9u/sob7HIHzsOJeWxlD/ixHTkGJKh14OJY
         6y+MOSE0AybIsmL3tZs9ScFB9O8kC9vnx3epv9YZvaHCkWNFDEWYB7u9yph7xyViNiuT
         hbklrtPC3Du0caw8Z8Ye/9MBGXiHhk4s21kSa0xvWc1ZtUV7noW3XsVk1GGjjgUCVgDu
         e9PRH1kYqGk2baFGPsmwossrOGtjZsBbeIFkhlRv4+WGWeMx4TgL+d9g3BXRPV3kZ8yN
         vMuA==
X-Forwarded-Encrypted: i=1; AL+hErFthJB56TCCdSBzogcUeLZVsuLMWhLxdASb7IA9kCQwmzVk2sJWUT2MJBc0V2R4PvSdqgb4ma6WNg9Id+y1krY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9awBusHHBfGiJgKaXlrIYzdOPTbuFHnVA8MQtsyHj6mZnH1O8r
	vO0N+uaMqk6pYdGmOcTB+7/k9wt8d2bJ0BwUOpc7pLnVFZr4DxFB9YpIjYK22+aOSLM=
X-Gm-Gg: AYBFou2InnbF9foQjmjE4lEXLv7rTIrtlzysbh0jLyGAKQicj1BoAAfnQ33jNrziwiZ
	LhVE2P8wfXDM0OF1X0aKsBBOEm/3mYOgb74c4VCiTQwaAz+acxxegWfxPAKFglHegb3VI1fbRsX
	IHu3T0KODUM3pF6p/1wUFGRX3Fb20+8pu80M8UscALa9vKS1muwpqU0DAEYo0szU0Hwsed9l0R1
	FHTkw1BDWdXBp9BzXp8RKtC3tk44dfdHFVj4RbbSoXiNcWGhEcNo3+ZNmA3by9x2keoXxwuKyxM
	sHqV5mHeSnE+5yp44fiFluzDA3N/I0E633c/KwD5DTSjIuO2lEb6U4SThz/OD+XQKKAJMxg9baf
	dCydvuqhJM8Dsyxrs8w2hUePSzjnGOUcfUjaQqCmoIJht6BRI8yHJe894+NJs6FnehEJRHvNoy8
	YwefE1+mDbaFU8klMCL+BxD3Itww9T9dqUMMblZR8IIc9UUUgj+p2Oqh6sxKow3tuutCSsOHsNd
	67anWU/nKeNA0sT5cSJp8DnpnFsG3bRxNoJ1qT7kpcWjiCRnlXI88z0Hna4Zo3STDgBQCsNTLTY
	EaprhAKZziMZIg3iPjgnehi0GYFcPEQIuYMZY0gcquzciS5fixEWRa3/L6qSstjuNGb0dLRO/g7
	zolJmPCCVf+0ghv8zEhwVRbklFXEPvYi4Y7gtDJfnWoRSg9K2sZHRTZBXHmrCNw53UMKwSHB4BL
	rfTNs7D8Sl+1pjI33ivsxGm0B2hHvgrIRCf/wsKyW9UG+8AUFVRDilyxhFNHaa
X-Received: by 2002:a17:903:9cc:b0:2e8:3b2d:c0e1 with SMTP id d9443c01a7336-2edf224a995mr38643685ad.41.1794559047053;
        Fri, 13 Nov 2026 00:37:27 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7e48e2sm6802375ad.36.2026.11.13.00.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:26 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:24 -0800
Message-ID: <a8bc6ee26d1cf35df5b0a13e971d3726a1a51042.1794554867.git.chris@chrisdown.name>
In-Reply-To: <cover.1794554867.git.chris@chrisdown.name>
References: <cover.1794554867.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 3/3] lkdtm/bugs: Add CORRUPT_STACK_END to test the
 scheduler stack end check
To: Peter Zijlstra <peterz@infradead.org>,
    Ingo Molnar <mingo@redhat.com>,
    Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
    Vincent Guittot <vincent.guittot@linaro.org>,
    Dietmar Eggemann <dietmar.eggemann@arm.com>,
    Steven Rostedt <rostedt@goodmis.org>,
    Ben Segall <bsegall@google.com>,
    Mel Gorman <mgorman@suse.de>,
    Valentin Schneider <vschneid@redhat.com>,
    K Prateek Nayak <kprateek.nayak@amd.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Will Deacon <will@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    Randy Dunlap <rdunlap@infradead.org>,
    Arnd Bergmann <arnd@arndb.de>,
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Paul Walmsley <pjw@kernel.org>,
    Palmer Dabbelt <palmer@dabbelt.com>,
    Albert Ou <aou@eecs.berkeley.edu>,
    Alexandre Ghiti <alex@ghiti.fr>,
    linux-arm-kernel@lists.infradead.org,
    linux-riscv@lists.infradead.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

There's no existing test for the stack end check in schedule(), so add
one.

CORRUPT_STACK_END overwrites the magic at the end of the current task's
stack and then calls schedule(). That should panic when the check is
enabled. When it isn't, the test restores the magic and uses
pr_expected_config_param() to say whether that was expected.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 drivers/misc/lkdtm/bugs.c               | 21 +++++++++++++++++++++
 tools/testing/selftests/lkdtm/tests.txt |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 2761685cf4f8..a39cde7495d3 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -215,6 +215,26 @@ static noinline void lkdtm_CORRUPT_STACK_STRONG(void)
 	__lkdtm_CORRUPT_STACK((void *)&data);
 }
 
+static void lkdtm_CORRUPT_STACK_END(void)
+{
+	unsigned long *stack_end = end_of_stack(current);
+
+	if (READ_ONCE(*stack_end) != STACK_END_MAGIC) {
+		pr_err("FAIL: stack end magic is already corrupted\n");
+		return;
+	}
+
+	pr_info("Corrupting stack end magic and calling schedule() ...\n");
+	WRITE_ONCE(*stack_end, ~STACK_END_MAGIC);
+	schedule_timeout_uninterruptible(1);
+
+	/* Still alive, so let's restore the magic so nothing else trips over it. */
+	WRITE_ONCE(*stack_end, STACK_END_MAGIC);
+	pr_err("FAIL: corrupted stack end was not detected by the scheduler\n");
+	pr_expected_config_param(CONFIG_SCHED_STACK_END_CHECK,
+				 "sched_stack_end_check");
+}
+
 static pid_t stack_pid;
 static unsigned long stack_addr;
 
@@ -885,6 +905,7 @@ static struct crashtype crashtypes[] = {
 	CRASHTYPE(EXHAUST_STACK),
 	CRASHTYPE(CORRUPT_STACK),
 	CRASHTYPE(CORRUPT_STACK_STRONG),
+	CRASHTYPE(CORRUPT_STACK_END),
 	CRASHTYPE(REPORT_STACK),
 	CRASHTYPE(REPORT_STACK_CANARY),
 	CRASHTYPE(UNALIGNED_LOAD_STORE_WRITE),
diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index bec57a02913a..2d856ed77a64 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -10,6 +10,7 @@ EXCEPTION
 #EXHAUST_STACK Corrupts memory on failure
 #CORRUPT_STACK Crashes entire system on success
 #CORRUPT_STACK_STRONG Crashes entire system on success
+#CORRUPT_STACK_END Crashes entire system on success
 ARRAY_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
 FAM_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
 PTR_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
-- 
2.56.1

