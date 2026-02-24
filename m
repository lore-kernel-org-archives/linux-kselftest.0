Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C8223F431
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 00:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771894515; cv=none; b=TfnbUWmzvC5FV/PcmdLZsHqvtwlHWbrXYOH+7jZXS7gBNkNqAuVv7vluT4vxlBeInBVDYlafpmeLKcd/iRdqHO8g4tHUBndFZEXroyJMv0mWnS+tP7iG59IDJHVHDiRzKWFGOKlh/8dAvbaQYAXIaBiZBUBqjE2IvlV9AD08Vv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771894515; c=relaxed/simple;
	bh=U8dRdtvZcYyWcRaAsd+lFSbNG2mMRb2eHiWi+yh8UNs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jxdfMNDHss6fg0cRYA4OAOPtUlWvo08S7g2I8LhmMlC+nj4mVbQk7enJ/ihUIQCYlgxc8oRkmwkL3aw+POumvrdCEZpE3yMcItvDcaax87d+57FRINYpedT1JapItSDggwABsyvpMxZVQjkoeSq+9x3ViCl9mxrvuvfF1cGzpdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QNgZtgH7; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QNgZtgH7"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2a7d7b87977so51874955ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 16:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771894513; x=1772499313; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kw54h9TT8085zuh20vf9SBkAnbrWrd9JjgAMyyfoHIE=;
        b=QNgZtgH7EkSsUYLrS4NcQGLDnYgYZcPKojIQlmta5GD8dlRC149fYW7zJaIVy5pQv2
         IdeRRgvO0Kklu1nd1g4Eln3IvIVoqwfdg5k9LyIL1N6H3A1iQTQij36mJWW+BEqcSJto
         J0qP6NkJqBETtPxNZn9CyjxUvzJU39s6lB9sEFaD1mtPsoIpqgrKq/YegowwL0SK0oTS
         NUH53RuuTvIxAk9Od6nzwjqXxKjWHO+1dzVObYd/DSqEAKWh7LH0gL3FzbmlUn2ExCi3
         pPLwA1vQPPnhETzmagrmDw4elMc22DkIl+++2Ohfz9CyPzMoyRFONEFkL4aIYBBcA+7/
         BpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771894513; x=1772499313;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kw54h9TT8085zuh20vf9SBkAnbrWrd9JjgAMyyfoHIE=;
        b=YY7Ud7YFw62UQqOEEVCL+Pu7qA1siZCPg/N/oG5k9OnULm9piOH6r3y+Wh1QW2gFwA
         D0ATsAup8Gx+oOsfHwH7t9GvgM0HiAc5kplKpPCaPuB/n3hPrX6mNxRLHkg5QBw47i9s
         +I7VQWdwc8YVDclKnJL3d4tz+9Yitsy+cNhIs8RJ5W0LsJON8DEWfdDy5X15rJL7QSeU
         eRoG1Vzfilh0rLH+QHHhZI2bIvgwtzRmtArL4f4aNoqNqp2XNGliPCiPC4fL40kisHUx
         ztuztt0PZu0lo9azY4M069Cztiy4YeZ7aMJKYHtmo0USV6t0i5BP0XYvlFhVzUpQQXHX
         qGqA==
X-Forwarded-Encrypted: i=1; AJvYcCVMuTWq1PJxH+5r9umYSYFQ87rA0HrFSWm38dn3I9qGMHMNiqZKmzUQdPiSr5DK7osGpBMAIczePrgsls/6R6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqETT2HEjopUi4wjNuNIIIi39wFWb6WBViHM5V7L04twzcyZJv
	LXhfoSppPqjrv8V2Z6ZEQ3UW0A41Nf9eniv4GKgzoy0JnZdXsgw8sT16gSIyQPN1oOL3DZtLUeW
	DQGew7RKzIQXlJQ==
X-Received: from pjbev14.prod.google.com ([2002:a17:90a:eace:b0:356:3104:ed7])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e544:b0:2ad:9421:6136 with SMTP id d9443c01a7336-2ad942166b9mr10617865ad.1.1771894512864;
 Mon, 23 Feb 2026 16:55:12 -0800 (PST)
Date: Mon, 23 Feb 2026 16:54:41 -0800
In-Reply-To: <20260224005500.1471972-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224005500.1471972-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
Message-ID: <20260224005500.1471972-4-jmattson@google.com>
Subject: [PATCH v5 03/10] KVM: x86: nSVM: Cache and validate vmcb12 g_pat
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Cache g_pat from vmcb12 in vmcb_save_area_cached to avoid TOCTTOU issues,
and add a validity check so that when nested paging is enabled for vmcb12,
an invalid g_pat at emulated VMRUN causes an immediate VMEXIT with exit
code VMEXIT_INVALID, as specified in the APM, volume 2: "Nested Paging and
VMRUN/VMEXIT."

Fixes: 3d6368ef580a ("KVM: SVM: Add VMRUN handler")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/nested.c | 17 +++++++++++++----
 arch/x86/kvm/svm/svm.h    |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index b72a1f3c4144..91b35adb83f8 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -426,7 +426,8 @@ static bool nested_vmcb_check_controls(struct kvm_vcpu *vcpu,
 
 /* Common checks that apply to both L1 and L2 state.  */
 static bool nested_vmcb_check_save(struct kvm_vcpu *vcpu,
-				   struct vmcb_save_area_cached *save)
+				   struct vmcb_save_area_cached *save,
+				   bool check_gpat)
 {
 	if (CC(!(save->efer & EFER_SVME)))
 		return false;
@@ -462,6 +463,9 @@ static bool nested_vmcb_check_save(struct kvm_vcpu *vcpu,
 	if (CC(!kvm_valid_efer(vcpu, save->efer)))
 		return false;
 
+	if (check_gpat && CC(!kvm_pat_valid(save->g_pat)))
+		return false;
+
 	return true;
 }
 
@@ -573,6 +577,7 @@ static void __nested_copy_vmcb_save_to_cache(struct vmcb_save_area_cached *to,
 
 	to->rax = from->rax;
 	to->cr2 = from->cr2;
+	to->g_pat = from->g_pat;
 
 	svm_copy_lbrs(to, from);
 }
@@ -1036,7 +1041,8 @@ int enter_svm_guest_mode(struct kvm_vcpu *vcpu, u64 vmcb12_gpa, bool from_vmrun)
 
 	enter_guest_mode(vcpu);
 
-	if (!nested_vmcb_check_save(vcpu, &svm->nested.save) ||
+	if (!nested_vmcb_check_save(vcpu, &svm->nested.save,
+				    nested_npt_enabled(svm)) ||
 	    !nested_vmcb_check_controls(vcpu, &svm->nested.ctl,
 					svm->vmcb01.ptr->save.cr0))
 		return -EINVAL;
@@ -2006,13 +2012,16 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 
 	/*
 	 * Validate host state saved from before VMRUN (see
-	 * nested_svm_check_permissions).
+	 * nested_svm_check_permissions). Note that the g_pat field is not
+	 * validated, because (a) it may have been clobbered by SMM before
+	 * KVM_GET_NESTED_STATE, and (b) it is not loaded at emulated
+	 * #VMEXIT.
 	 */
 	__nested_copy_vmcb_save_to_cache(&save_cached, save);
 	if (!(save->cr0 & X86_CR0_PG) ||
 	    !(save->cr0 & X86_CR0_PE) ||
 	    (save->rflags & X86_EFLAGS_VM) ||
-	    !nested_vmcb_check_save(vcpu, &save_cached))
+	    !nested_vmcb_check_save(vcpu, &save_cached, false))
 		goto out_free;
 
 
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 9850ed01e16e..a49c48459e0b 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -161,6 +161,7 @@ struct vmcb_save_area_cached {
 	u64 isst_addr;
 	u64 rax;
 	u64 cr2;
+	u64 g_pat;
 	u64 dbgctl;
 	u64 br_from;
 	u64 br_to;
-- 
2.53.0.371.g1d285c8824-goog

