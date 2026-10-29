Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305712;
	b=eO179aXKBM1aTLPQXryoePjENP+ISJhydg8z7/cll6FuAMutJgiwuZxSNwayYQiYJUHy
	 ZZH2Py6dGmbPpBiDmFOyIBggYuHeyY34ZfhQq58YSaJ7etzq9wuXNAqgIbIf0+kLwLp0h
	 U0irAR2aDYyZ03UB0S1RqvlVD0jBtK5qiCsKSSvZnACNzgjmtqnACtZlS9o12Z+L5jzmN
	 EFGfWQsQ42JsKKybBwK0NGsYNAiH2n3eVrHCA0kxOWMX0TjzoomWFLGhTEIffreHyBYTW
	 Tl23eqjtDrk0BgJSAf3hHClWfvq+24aTqO4ffLznpw8UMjGAlj7j9K4XWhFqW3c1NZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=cZzrCOWTd2fbBwQmagh5NJOE4ckRSGpMrV8yJJh7s5c=;
	b=5Aw63EiwP6m+EGdXW3E9ZYVE6u8XujZSQ1+1Cgg1HYUi8Xhj3JhfNqiTcsL41TZK6jnw
	 jn6RS+R/Crmr9WvcoTRO1vVYBk1YunYoYhe+PNZjBezUOtbw8LRpIaicolsk+Dh7sTH6g
	 7Hmku46BEEC2ypPjMzfnHPAInF0svXOlE/p6pFnDzy9ZsuiAC/ODJLXs/BioVj+eD2shg
	 Zz+l3G+wh1ZpcYBNZXhveBzHWIHYy6z5wssBzzfDvACIBnPYdkLwI7MCYIqX/d2Ao272n
	 Yng0fjzXLZWBntTfuAqbEr+2xhlTA/p8GYpqvcXgIIRnlBIbC9qnNxw/hTr1/ehPxTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GkIJG07d;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6624C606A320
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 20:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6624C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GkIJG07d
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a073778890so1836313b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793305711; x=1793910511; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZzrCOWTd2fbBwQmagh5NJOE4ckRSGpMrV8yJJh7s5c=;
        b=GkIJG07dYY2I4Zo1h+fLgM7rJMxTsUZGXOkw5/HTO/H0iP6g9a2wid0vb49fwBh5gO
         LpRm8fPajjcPl0kZuDgM8M1+q0ZcMSikTeVQU9En4l6napt4g8yCV9NvB5wN0lI+1j2y
         1tHCn4ALUZh8r4f2rQX5N99rLaRP0hkbxpj6ykZAHDDCrMsT8M16h13GwoAmfzMv9syP
         I54PGEyOiXdkZ44ciSjmB8r/LF5puRt2vDlpw59ZhEXt258i4vSIb2JzpD/sSto1KYAV
         ZswYr19Z4qrdX5aJW47j5xxB5IsKND2Tpz3X8++nf+woe9WBNkLJFxlQgshuZkURVF4f
         yTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305711; x=1793910511;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZzrCOWTd2fbBwQmagh5NJOE4ckRSGpMrV8yJJh7s5c=;
        b=yXGKWkm5FZrCii3qG+61GfRoj4RYvRsUgV+XK4CXLYNsZn77DeVt7fwwm99IXHT9W8
         R07YO+rTmtMeL42tR1gBmkVPxwZnQnLo1E5AFbYGDwJXkbsPpquhUyJRCgSxIDFVJaVg
         dmYH/6j5qfPVNpuCPFBo0dkeior0MKhrJCVOhsF1/BHVdJQMTXZdB6wxYRyRhx0L2p90
         8w5PfwSMFX3E56rYWDZYNoI5D3C1Q9PIPrt209p4BcdOT167WtT4juruzCWjpcCGPk3/
         VyaclT2z67BkBn2fhoKQ5M3CNWWAfWF6U/o/9S233iXU1qPUdr3yVWwaG4O8c7dN4ILN
         4aHw==
X-Forwarded-Encrypted: i=1; AKwUvBwQhNKx5EeGf/aa2+GY+QhH4mYakKVdmodykIkeIMyKy5Had/OhOo+ZJkKN7PBNc3UlsN0HaSxOqJlCf4uzpIo=@vger.kernel.org
X-Gm-Message-State: AFq9FYICCyWxlqrknOa7g35kEQgsYhC2DxjxL98qPJOQirm/GtExc5Zn
	iI1xELqxeEk3rJ58XvYXi9XhYYcgk91g5MHHXxoQBn73TFymD4PToOdWx9xcclsXixNNTgI2N2s
	/GA9DTEbYUNQ57g==
X-Received: from pgbx22-n1.prod.google.com ([2002:a05:6a02:63d6:10b0:cd8:5a84:95f])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:c98d:b0:3cc:45cc:c401 with SMTP id adf61e73a8af0-3e928d4684bmr325145637.13.1793305710592;
 Thu, 29 Oct 2026 13:28:30 -0700 (PDT)
Date: Thu, 29 Oct 2026 13:28:15 -0700
In-Reply-To: <20261029202817.901145-1-jmattson@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029202817.901145-1-jmattson@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029202817.901145-2-jmattson@google.com>
Subject: [PATCH 2/3] KVM: selftests: Rename svm_nested_efer_test to svm_msrs_test
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry@kernel.org>, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename svm_nested_efer_test.c to svm_msrs_test.c (matching
vmx_msrs_test.c), in preparation for testing other SVM MSRs.

No functional change intended.

Signed-off-by: Jim Mattson <jmattson@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm                        | 2 +-
 .../kvm/x86/{svm_nested_efer_test.c => svm_msrs_test.c}         | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tools/testing/selftests/kvm/x86/{svm_nested_efer_test.c => svm_msrs_test.c} (100%)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 888a7530a280..d1ddce584efe 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -122,7 +122,7 @@ TEST_GEN_PROGS_x86 += x86/state_test
 TEST_GEN_PROGS_x86 += x86/vmx_preemption_timer_test
 TEST_GEN_PROGS_x86 += x86/svm_vmcall_test
 TEST_GEN_PROGS_x86 += x86/svm_int_ctl_test
-TEST_GEN_PROGS_x86 += x86/svm_nested_efer_test
+TEST_GEN_PROGS_x86 += x86/svm_msrs_test
 TEST_GEN_PROGS_x86 += x86/svm_nested_shutdown_test
 TEST_GEN_PROGS_x86 += x86/svm_nested_soft_inject_test
 TEST_GEN_PROGS_x86 += x86/svm_nested_vmcb12_gpa
diff --git a/tools/testing/selftests/kvm/x86/svm_nested_efer_test.c b/tools/testing/selftests/kvm/x86/svm_msrs_test.c
similarity index 100%
rename from tools/testing/selftests/kvm/x86/svm_nested_efer_test.c
rename to tools/testing/selftests/kvm/x86/svm_msrs_test.c
-- 
2.56.0.317.g454f8302e1-goog

