Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491222;
	b=xezdY0O+NO8UDb9BTaNQuZFf8QZrMiblYmK0EQkQAQdBwVw6zYAKCFO7Gy+E9jWxO1ay
	 KEj4oKceV3fSK+moWNxayPOEUdzwp2M2PFeOIoSKx+ZAuUqEtttFvIe9buzIH2yDXoCXX
	 nSgsY3vVA7ADMvS7UOvW7CdobQTn+IQei4VNo5GFPaBUfDFY/nPfEeF0uM2UqKitzZxLY
	 6GmjrojHYG0eI9bjCCwo4ujO1D0q9AAVyJ2ftnD9XK8G48ckn6QwWKXxzNAllqKDB5fdp
	 R+pv0IBgKn/Mx9pz+OkLM6lQnQ7XLPB8n60VNijGvJgvIt9BL4ZC7Jcpmrbhr4/g/ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lP3ch59NAPtwcIuspqlGBS3z7FlOBtLkp+myFltPlfI=;
	b=J6ZD2dLZZHY2ZY6r/Xa45tBXWbaeUMaCxV53UqDhaQ29kFtNEn2B6AGNYwTVB08KTy+E
	 qJUCOkSbWmD0Ap9Z7EFmu0yBMlq5km/zr0IujyPDyjvURgpWoOmjEJVPiiXDHS4CU5Psw
	 +y0fxWaIFHgUTUb8tHKvscdTsq6NAwtguWvoOIe/mTlH0aooNvrQ3j5u4X+rxxu5xNzXp
	 4Acyjcc6b+FpvFgX80H01NxBeeslKnCgHP9/1rFuLHGqp+UGjCv/9/1z3PGEsIltycYrL
	 EgVqQ+m3RHaGg1ZOSPAFCCFiaicNMn0Fypm/hhN0Qlxz5+gwpKPI4Iu4XTCgJfump5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g9qMj1DA;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869A5606A327
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 03:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 869A5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g9qMj1DA
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-3b411059cd2so914052a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 19:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795491222; x=1796096022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lP3ch59NAPtwcIuspqlGBS3z7FlOBtLkp+myFltPlfI=;
        b=g9qMj1DAfbSgv7PoH2K/ov7yLNupPTQrt80IYN2IyGMQKt/62HIN8JUH2r6VxjqVjc
         wBdYQZv0nmz7dkzwhKZ/9aJxi0tucck3CQoH9+uR5crt/CJCZ0e2HvFaxk4FRtoZ9P8M
         X+AcoYaqkNKLpD23XqRkpwtkDp1wWAIgBnfrvbbfiWoUQVKbV7YZ0AmuUCdsT1BrCxKf
         KJs7Vrmg4n3r4eaujkRyJAWqs8Ci7ZjkvEQoLhxBly9Ft7fcqRtFlAthjSyY/kGr6pwC
         ipqGX6vH3amwTQzkqmBbgZF500997lie+Cw/g+XnctUUHvOtRrqYgC55hm9xyE7eFxTl
         kkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491222; x=1796096022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lP3ch59NAPtwcIuspqlGBS3z7FlOBtLkp+myFltPlfI=;
        b=NjaWQbkkxJpSA3B5DqWLAgTdALUYTYxC2yP1zpC7YbCIvv/QJRte2lge7Qou09V6DI
         yOuAKo51iwLztmA6+mlN3SbeF4hurinjknJD8S4RtCNJSCZurtlSvj3YyNx+bCB1kRca
         EASKQ0U7ZldpApzjU6or7/2lq5lToNGurWSRo67LYGlyDoKzokHm0FFEspf78YKA0Cv+
         /TLKl6DFkj7BkFDfzra6iR0CW3z7NKSqkn0swqFFKnWPOngduyCXrpPECs3moqWwlSQ9
         f/h6TBOa3iUD2HybRylnMAdOdRIlvSZcMTqbvKwJuTNKo2VQXxF0OmPG0lGrjA/c3an3
         qIQw==
X-Forwarded-Encrypted: i=1; AL+hErFxtTTJx7gTY2NbreBVSoZXHRQ+9aEA9NQEj9tuqNoiRav6PbYT9f22wAwGMEyw9xL1c2XH3r/nuGzFpn7JAyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D7hKaIKSh24VHE3T24FK7WQmDZc/lKDoXM2fbsHvTmlIkrkIN
	5xqOalbLlkUmbDteiKy3XPWt6WKPuFwN23ytnp2Uo1BOSN29dl/pvD/QRrsMI4QEhvZPbYYo5P0
	=
X-Gm-Gg: AZFdTZcZKrTzDUgbZV6fW/Hm2Jv0t7l/n+/VXgTcdRIK0H1BaWIkNSeilTfrzVQ7JTB
	/TxtxPdpObD4PNF4OoKeMSfWF4w1pepTcmWhbNw2kAfDLgMEaRRXyvxMv+GQ4gPe60UfA/oH9aH
	Jz7QpiiCa8aApCbEppzGPdPtrmDIHKCJ3TH5WhzP8CchYK9rh6XKSN2fEifUvFOyMBfUKSROjX0
	zvL0aBQghqFwdjdOz4+fxDhd42X0LxCDNgwiAOhnwHx5UomfoDT8sayOOu0AjBo3iUEZ14tM292
	HJM77a+9Ba+/quQtEZ5IN3IoghyeYTMLGN5JQEmtDdKa1lgzB2vPL0pFOxN2KOteA44eLZOnitY
	CCfJaJqSMZjlmKYKDxOoQ2fDSRJUt15jXYQ1V51SwlJm5iGfevKvrbK3H9C5/BwrX3Oss3SXQrp
	CSJIB3eeuCwPMhHKlBGAQXRaYfjf3tbp8f5S9sKUdHJBW31erMWOKVseI7KHpRdwOnJBFHa8u9A
	0yfOQ/BpHC4WC+leAPPdeic1MUVMt4ISGHpYKCuyEsotadNWLmysgqq2avJHzch0mTO8SXhoFhM
	fX5lyWOHmvtC8AcYwQKmCzrXIjXBWyAIpRxXC0df8w==
X-Received: by 2002:a05:6a20:7489:b0:3f9:a6b6:e16b with SMTP id adf61e73a8af0-4014c94a618mr11685070637.21.1795491221907;
        Mon, 23 Nov 2026 19:33:41 -0800 (PST)
Received: from q-Legion-Y7000-IRX9.. ([223.86.210.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bff6sm6495773b3a.3.2026.11.23.19.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 19:33:41 -0800 (PST)
From: Bingyu Xian <shanbeeyoo@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@linux.dev>
Cc: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Bingyu Xian <shanbeeyoo@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] KVM: selftests: Fail explicitly when schedstat cannot be read
Date: Tue, 24 Nov 2026 11:33:27 +0800
Message-Id: <20261124033328.612894-2-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124033328.612894-1-shanbeeyoo@gmail.com>
References: <20261124033328.612894-1-shanbeeyoo@gmail.com>
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

get_run_delay() currently passes a failed fopen() result directly to
fscanf(), and substitutes MIN_RUN_DELAY_NS when parsing fails. Steal-time
checks need real scheduling delay measurements, so neither dereferencing a
null stream nor returning a fabricated constant is suitable; repeated parse
failures also cause polling loops to spin indefinitely.

Assert that opening /proc/<tid>/schedstat and parsing both fields succeed.

Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Bingyu Xian <shanbeeyoo@gmail.com>
---
 tools/testing/selftests/kvm/lib/test_util.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
index f5f7189f9..eccb03153 100644
--- a/tools/testing/selftests/kvm/lib/test_util.c
+++ b/tools/testing/selftests/kvm/lib/test_util.c
@@ -417,13 +417,14 @@ long get_run_delay(void)
 	char path[64];
 	long val[2];
 	FILE *fp;
+	int ret;
 
 	sprintf(path, "/proc/%ld/schedstat", (long)kvm_gettid());
 	fp = fopen(path, "r");
-	/* Return MIN_RUN_DELAY_NS upon failure just to be safe */
-	if (fscanf(fp, "%ld %ld ", &val[0], &val[1]) < 2)
-		val[1] = MIN_RUN_DELAY_NS;
+	TEST_ASSERT(fp, "Failed to open %s: %s", path, strerror(errno));
+	ret = fscanf(fp, "%ld %ld ", &val[0], &val[1]);
 	fclose(fp);
+	TEST_ASSERT(ret == 2, "Failed to parse run delay from %s", path);
 
 	return val[1];
 }
-- 
2.34.1

