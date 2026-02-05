Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B71633290A
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Feb 2026 21:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770327821; cv=none; b=ckNEuh2Lzof+51leAWwLcwHNx9cYiygY3d4tVRgOAYfJYj9gHFFkYuCrX0g0ariPaTh6pYKkuDOnZQ/dLFNybktL+Af5F6Y97C+Oge0hlyaqJg8Pn2PcVz3OWbnD8RSrONwGp8qBj2AGL26NEt633bbYJPvOXawpCHR0eSFxXyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770327821; c=relaxed/simple;
	bh=//1gJ9AADdkcXusZWlVgojFG22OU4StZISH4Uz81e5w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Vf3CQ47/sLQYoBB0SE2z7pKaM+zBW7tSQ3CKZUg5GtC91msg59xX27Pv+srjzAd9afD4vTyUcekWV7ObNrSuO+A+5y/x2naEsT3QZz25umXplV8xk9E5ljtpmv86LRw8OdZb6ZPs/43v8HAhE++AKXiimn0BKbyEd9nE7o+cvCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PQJ+eijR; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PQJ+eijR"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-353a5c295e4so1851244a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Feb 2026 13:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770327821; x=1770932621; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zeNAWI4t8RbEksTte5HEam/g+zHUdM8Hnj9AjmiEzPY=;
        b=PQJ+eijRx4H8jK6nVyGF6gJGPv8IVrMjwgn+MFAfrWOvVSYwXXsnZfiMFOfXHxw8zZ
         o1N/HLrqJTHsSjxcSRQoyW3IVvZxFLmyJcmBXTiQcxrejuXSjcCH7ByYnRqQOLFNdx0b
         VSh5CaCS4Qnxe1PwFu3528IgeyA7734s/FBMHiM0oPIPmflcyi2Nv/W6WbSzMDY2yezE
         zgKnhm6+yrHs4sNFuA7Nirv7sd+NaPCE2hU0x7dkiIt9Y41tpVw9iv4+LL6bBAeupBYh
         vT9QvAE4YYCXL2XNdVnTbsB3kBOuNNTGkJVbQzIG5AN5se4opiiDwivR3jmrNwkSlp50
         4DhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327821; x=1770932621;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zeNAWI4t8RbEksTte5HEam/g+zHUdM8Hnj9AjmiEzPY=;
        b=fGMZt+pzM7o8dxN7R8YsHKZrZlbDoGYRLnky/S+gtTd8TOmiCErcD11y0P0mcdUyTl
         gygGpQ1sXFZPUZ8tFTKbl1lRjvJFp0HC4L3uk64MtyybV6qdzMH3TFv9tYFn4ErXZQuq
         SyWOBSFtXMxZTtcsBIBXf2Xbkmeo8DDOJI9Ouf8UWYvHvmD0ATiFjJ/cXcp4NCcexTLy
         yFsYTpSwCDiix4aaawByUOOS8hrDWgD4vy6iHy6qiKcC5eQmco51LTpTdflFCLYl6u7L
         eG41vgEEV7IFTI5XR31YBgN3MXDquSg5YTXjoymC8LdFOCgvi44d4EwRyLNSs1V632am
         6bvA==
X-Forwarded-Encrypted: i=1; AJvYcCUCC7z/0YeDfNEPQkbvd3bjAfOjBJoHHl2YRtCfKqCntkmjMJhCpCe4ImEeu1ZMLWVGJuOJISjmOdYpcz/N0R4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6CBo98bZcXRaVJraL8Fk09lLXeP5zqlYzcZ+Gz1lmtUrlsm+8
	w8+DB9+ithSEQ1nFJ/f4PZRbjTVx4eGrzlQ6Y920ZUfkewGGPbnJ4YGyd9sftvcyH+qlsnRLBA3
	/7/f99EBmpRIqwg==
X-Received: from pjbqe9.prod.google.com ([2002:a17:90b:4f89:b0:352:de4e:4038])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:28cc:b0:352:dbcc:d74c with SMTP id 98e67ed59e1d1-354b30ace04mr594953a91.15.1770327820720;
 Thu, 05 Feb 2026 13:43:40 -0800 (PST)
Date: Thu,  5 Feb 2026 13:43:02 -0800
In-Reply-To: <20260205214326.1029278-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205214326.1029278-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260205214326.1029278-3-jmattson@google.com>
Subject: [PATCH v3 2/8] KVM: x86: nSVM: Cache and validate vmcb12 g_pat
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Cache g_pat from vmcb12 in svm->nested.gpat to avoid TOCTTOU issues, and
add a validity check so that when nested paging is enabled for vmcb12, an
invalid g_pat causes an immediate VMEXIT with exit code VMEXIT_INVALID, as
specified in the APM, volume 2: "Nested Paging and VMRUN/VMEXIT."

Fixes: 3d6368ef580a ("KVM: SVM: Add VMRUN handler")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/nested.c | 4 +++-
 arch/x86/kvm/svm/svm.h    | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index f72dbd10dcad..1d4ff6408b34 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1027,9 +1027,11 @@ int nested_svm_vmrun(struct kvm_vcpu *vcpu)
 
 	nested_copy_vmcb_control_to_cache(svm, &vmcb12->control);
 	nested_copy_vmcb_save_to_cache(svm, &vmcb12->save);
+	svm->nested.gpat = vmcb12->save.g_pat;
 
 	if (!nested_vmcb_check_save(vcpu) ||
-	    !nested_vmcb_check_controls(vcpu)) {
+	    !nested_vmcb_check_controls(vcpu) ||
+	    (nested_npt_enabled(svm) && !kvm_pat_valid(svm->nested.gpat))) {
 		vmcb12->control.exit_code    = SVM_EXIT_ERR;
 		vmcb12->control.exit_info_1  = 0;
 		vmcb12->control.exit_info_2  = 0;
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 986d90f2d4ca..42a4bf83b3aa 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -208,6 +208,9 @@ struct svm_nested_state {
 	 */
 	struct vmcb_save_area_cached save;
 
+	/* Cached guest PAT from vmcb12.save.g_pat */
+	u64 gpat;
+
 	bool initialized;
 
 	/*
-- 
2.53.0.rc2.204.g2597b5adb4-goog

