Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13A5332ECB
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Feb 2026 21:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770327822; cv=none; b=cTT/BfqH3EGYHAoNvTxbsqK1rvu7N9XTKEok7XC+CvT0usK922G1iIyStUdlnNzYBhFReFCO9YmargJB5mcqjanpG+0OFnCyiv6GqmJiZCpp1fUS3AqlfLcueC6pJWSTturZqXFFv4rCKFwFB5g87aantiEBU+74bTjvFqFVAYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770327822; c=relaxed/simple;
	bh=/RX4mCH35HZdkO8HyVbrveLVnRTbZa+1vh8oTPb28F8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L5Abs/VIWGXBoeJ6d73CbUcjutO9jZS9WT6smlfoUUHe7GWdfcuZlryQ74pPk0B0VZntPS5OI8Dfw9rjxQS09Nx2DecePRKiEG9CSmxYknNCHTP0RqFVMH7ozbhH8XfgWU2xPVQpqmwWU/gW8Sqz/EWSXvhz9o57GpKc29RRSHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PzElm3RG; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PzElm3RG"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c56848e6f53so819657a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Feb 2026 13:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770327822; x=1770932622; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vzh3iLHAfWUF+ni0XgKYTYRZaX8q/MuSJjdjzVEy2HI=;
        b=PzElm3RGGIe7FaErGMIOiEXp6nZ4slLg/mnY4AHOYO2jEy4jlgRBXsBT3q6U3NQOzb
         y19GgpPmv9R93CFzhmpTmhYMvCVhRQx/FudrcbRX3a2WfR3rb763RWntTlC562t1TXNQ
         Yf9R3fbj94z4Lgi6ROTAW+jB0lXeshvyKmx9jGpJj3lluKskZX8tCm14HGiKYTJNYnCu
         uYLHL4UCoWkBD+q76gXuua3C9f7uwHkgiKcmCe4vDudOxjDvK8uphtA4+irSNpMsYOdd
         /G7rGOZ8gcpMcsoXjxTt/UGNlm1zApNTwX/ac6XUg5o/7CuK29hqAuk2FX4OClKYXK/l
         bcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770327822; x=1770932622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vzh3iLHAfWUF+ni0XgKYTYRZaX8q/MuSJjdjzVEy2HI=;
        b=FmMR9YGbKFrS9D+YZj+dKcmUYrczse3ODzEfUcG8K7Ku2EJfmwyhdzr5TC0aiyDr5X
         eKlVoqdBk7QkNcPZ+Zi8rXRoMrBmV3/MbfUR5eg4DmOkxjU0ZdS2KWYfxlxaRBQh7Wfc
         t9QBwHzub5Dya2DmAh6hA4ZLg2xDIFqAh3cDl4kkC9GOmxxwr2umaGzlLPv7WT3wWkmk
         aJLwk9HCIiOyvAtepC7LhLnYDxVxnQFBpGNeNK1P2nZxNgNFxYR0metqkDGFfIrP8yAl
         2uUIDcTGsTwiMg+h4LrqVNeA0LApg7FtTrD0LoiCP+6UQB9OACB0PcIZ1g6E07i8fnzj
         Y/pg==
X-Forwarded-Encrypted: i=1; AJvYcCWCBbSOJbon1nG27r5Zzmqozr2xREsRATbWo1lLaLfuif+xb0IMYoDvxnZ7TPh8rfCE+TWRovkyGDfWeZWEOJo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4vGfGlzckxanZjgJAg+39V5EmdkYCsYk6wBl8c+gyBgpYRv3j
	6blUUSwAEDbZuEwDVx2nn/Rl+Lhcm+agI/qFx9bon+laJK6huaRhVp4i4vvIlFo+h7uKRHxBd4h
	J+P+xGQ4hCdY9aA==
X-Received: from pjq16.prod.google.com ([2002:a17:90b:5610:b0:34c:2778:11c5])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:517:b0:38b:eeb9:cbb5 with SMTP id adf61e73a8af0-393af0da032mr246446637.39.1770327822187;
 Thu, 05 Feb 2026 13:43:42 -0800 (PST)
Date: Thu,  5 Feb 2026 13:43:03 -0800
In-Reply-To: <20260205214326.1029278-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205214326.1029278-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260205214326.1029278-4-jmattson@google.com>
Subject: [PATCH v3 3/8] KVM: x86: nSVM: Set vmcb02.g_pat correctly for nested NPT
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

When nested NPT is enabled in vmcb12, copy the (cached and validated)
vmcb12 g_pat field to the guest PAT register. Under KVM, the guest PAT
register lives in the vmcb02 g_pat field.

When NPT is enabled, but nested NPT is disabled, copy L1's IA32_PAT MSR to
the vmcb02 g_pat field, since L2 shares the IA32_PAT MSR with L1.

When NPT is disabled, the vmcb02 g_pat field is ignored by hardware.

Fixes: 15038e147247 ("KVM: SVM: obey guest PAT")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/nested.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 1d4ff6408b34..1ff2ede96094 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -646,9 +646,6 @@ static void nested_vmcb02_prepare_save(struct vcpu_svm *svm, struct vmcb *vmcb12
 	struct vmcb *vmcb02 = svm->nested.vmcb02.ptr;
 	struct kvm_vcpu *vcpu = &svm->vcpu;
 
-	nested_vmcb02_compute_g_pat(svm);
-	vmcb_mark_dirty(vmcb02, VMCB_NPT);
-
 	/* Load the nested guest state */
 	if (svm->nested.vmcb12_gpa != svm->nested.last_vmcb12_gpa) {
 		new_vmcb12 = true;
@@ -656,6 +653,19 @@ static void nested_vmcb02_prepare_save(struct vcpu_svm *svm, struct vmcb *vmcb12
 		svm->nested.force_msr_bitmap_recalc = true;
 	}
 
+	if (npt_enabled) {
+		if (nested_npt_enabled(svm)) {
+			if (unlikely(new_vmcb12 ||
+				     vmcb_is_dirty(vmcb12, VMCB_NPT))) {
+				vmcb02->save.g_pat = svm->nested.gpat;
+				vmcb_mark_dirty(vmcb02, VMCB_NPT);
+			}
+		} else {
+			vmcb02->save.g_pat = vcpu->arch.pat;
+			vmcb_mark_dirty(vmcb02, VMCB_NPT);
+		}
+	}
+
 	if (unlikely(new_vmcb12 || vmcb_is_dirty(vmcb12, VMCB_SEG))) {
 		vmcb02->save.es = vmcb12->save.es;
 		vmcb02->save.cs = vmcb12->save.cs;
-- 
2.53.0.rc2.204.g2597b5adb4-goog

