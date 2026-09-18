Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ABA4E9C17
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731418; cv=none; b=REEGwKj2axDYPtn/2vqA2GTBcHUbQHUG9KFzpHoVs8oKQyjB6N7Jgkkj08wOjk+V9kDB3zuElW/G5Kg6UGkV3SHSFcl5PnbXclGshtsgmFP6V5zsHxYy53siMbOh5XoUpZgX/AvFEyYpeSHbn5Pzc9ICKpat0W0E2xg6/TbW0eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731418; c=relaxed/simple;
	bh=cq67vtValCzXKP0JnfJpqL0gle41URPMyyjjif4LXCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOuRK7YvNJ1UBiwgblY25d+r0jD6UEXho2lr3fpR0oOa64PX3ymmDc/x+BxaxRYlD8ou+UzZg1a1EakMJu/C8x7mRKaX4L1EDKlDCeos5CtMxDPlArLdq+Ob02nhshdBuehori2Y/84iIjPexUvVmkqc2fZ3fi0ULbfkWztc9i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQ8RKtrl; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQ8RKtrl"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39d654f02baso566948a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 04:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731416; x=1790336216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=goutfUAx32FOvBhVFBRbSGLDzTqpTfwkEkewd8WhIgc=;
        b=RQ8RKtrlE8SFat42bMZAUWGArEK4BPtD6Ull91/gtwSEc8wChuXAUiFZngIwNANVv8
         TCdBjPiLzIvxLFRv2FyWAx4elhmImb07GwkFyfqPR8FLvYFZ1v3eQNkW+ZlP5R8F6Jw5
         +aCaiRmyJpYnupshMEOWg3kZI+y2yvjfMg/YNuEwyfNaDV0FBkp7SNurulWffJ39i6Zv
         mWnMdYcrZ0SS7UZ7h+6DCGsM9TmsAuYAc7w0eYcAmFRewA0lXgYAPq079O3NLHpBYMmW
         VekDJHMQx/JlPvde0Pw/zVwdaekAj3vPAMWot6NWgmSFrKw2dxZ+OsARB8fHGgAakHpD
         qVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731416; x=1790336216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=goutfUAx32FOvBhVFBRbSGLDzTqpTfwkEkewd8WhIgc=;
        b=U0uVSk5kWjtYpxMzzAfq4XnG0y2KNtIj6ijEYaRTwSTvYdVajQt2tvYEXsqZnIsjiN
         PMdnktpcy3leM62zmkj3039mPVzygU6vz2UPhAf4VyVK04Tl3ov/BgaUS5EoPFPIoTyY
         Jr6qsr3gEtgumKr5H+3EV2w0b12M37jttHK16wzkf7cxeFNPxacXN9KgLdgPlH+hl4on
         quh85coq2mNE6y8QnJMBA0CzVcYCGRzrXPamH9lDM7DI3cuSbPErobstKGkET8Mri5Fo
         P3WLBSvkUkG22MzYRe2zN+Z8oBhSEJczYrQ8KwRD0aOHswjkY16+vEQy7pTc30Sobvr2
         61Cw==
X-Forwarded-Encrypted: i=1; AKwUvBzYsXDbzRg0P+0iDODceX+gXfqG+CVCK7QYFpRFCLN6zdRzTvFg25s1Mp6wvVxdR4YQ6iD/yNNSH74fubT1DPM=@vger.kernel.org
X-Gm-Message-State: AFuF++ldu1cBtij3YHRoCAj6mW5HxpVrf3bMWUqUAQkKmBtk2MzFesfS
	dKQjBIGulKOxEgxqHIRwdV8CJyues8KPa6GWgBYR+VJGRPmvrxxXHKyJsknFM+Sz
X-Gm-Gg: AYBFou0SJENHXkz9UEMKLJVZdlO3Oslb26oXOIpE51Fc+Ea4lY+nuamdhLTkPbe48Ry
	Wh7EVDNEQ+YRHPyVo7JUaj+O2zakFNpQvMoX/DGqd6SOX1iC5ctko+pCmOSvcyLQ15GQz2u54qU
	W+QxeF/2PKtScvs021WVAIvpqX9oQWdl+9K42R8AL70bDFZIf0a1a3dYquGxCFL9vMTQ1Yr94CP
	W2u/kP1g1GL50F8y2wlj7dHMaG0CSOmDCnyiagejKdEVXMNT8x9fvRHWKkgmV9tXEf+d69mvqTB
	W/dpE/Rhg+GyKknYK0TR6BBWoehjhlCinVHdSj7f9tqbBDyIUgAoUi4CDEDnG1K8Ds1Rk3G1Vhc
	QAWFGJAhYWmLGo07qC4j5RksfthgqVvBdUF2vI6j94BIjSx5hCTvzziTCk8XkxpVAcDADzJG0EA
	vm9iaojq443htYdBmu/LqCdbPJ4f5UVM4pFKXic/6rZQQXGwyoM3I2nmAaij2qyJkq8Nbr4lfG7
	39t5vRgZK37
X-Received: by 2002:a17:90b:2c8c:b0:39e:433:23b5 with SMTP id 98e67ed59e1d1-39e54aa1442mr5549176a91.5.1789731415773;
        Fri, 18 Sep 2026 04:36:55 -0700 (PDT)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2890b915sm3735097eec.30.2026.09.18.04.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:36:55 -0700 (PDT)
From: Gokul K <gokul02k@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] KVM: selftests: Delete the declaration of vcpu_set_cpuid_maxphyaddr()
Date: Fri, 18 Sep 2026 17:06:30 +0530
Message-ID: <20260918113631.634233-3-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260918113631.634233-1-gokul02k@gmail.com>
References: <20260918113631.634233-1-gokul02k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vcpu_set_cpuid_maxphyaddr() is declared in include/x86/processor.h and
defined nowhere.  The declaration is the only mention of the name in
tools/testing/selftests, so nothing has ever been able to call it.

No Fixes: tag: a prototype for a function that does not exist cannot
have regressed anything, and there is nothing to backport.

No functional change intended.

Signed-off-by: Gokul K <gokul02k@gmail.com>
---
 tools/testing/selftests/kvm/include/x86/processor.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 7579e692bc2b..ffe95ce1ad49 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1180,7 +1180,6 @@ static inline void vcpu_set_cpuid(struct kvm_vcpu *vcpu)
 void vcpu_set_cpuid_property(struct kvm_vcpu *vcpu,
 			     struct kvm_x86_cpu_property property,
 			     u32 value);
-void vcpu_set_cpuid_maxphyaddr(struct kvm_vcpu *vcpu, u8 maxphyaddr);
 
 void vcpu_clear_cpuid_entry(struct kvm_vcpu *vcpu, u32 function);
 
-- 
2.54.0


