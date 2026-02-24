Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BC123AB81
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 00:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771894522; cv=none; b=K50V6RoH2U3uqTOhSpCaD/M5b4FZDZMurAxHHzqWWNCHfLxTObeavW7YHm/vkyEuP1Bthitrw5iHXesFO7QIjhZYtNXZwBZQyIhF5DU4g4g8QTUwXOH0sZM0eR59YgBTiVeEVlAyvsoPvHWy5tJLxDYoqMpjBicJRH+EWwVP85I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771894522; c=relaxed/simple;
	bh=wugGug88ulZBP+j2+aUrsuqT4ajAwhd5CJ12zCO2pgU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YQW0Gqd1yATe546wHc5fCwnBEGkmn0KjjpE5L1uVXIhurBRke5RHXXEjpCxGzXKO+5hkc61cw/nEE13m9LA23l3PDfm9RxVOWtD0NNquoUpwH+VSpB3aKTC4FWwM3D45aD3AglWvbxcGkXXbnghCCK+Dm3xWJ6eP3bSSM5MbWpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IGsOfS0i; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IGsOfS0i"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8243fc3fe8eso17583858b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 16:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771894514; x=1772499314; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5+Hqic4J3q/Gjct4qXtXk7Fpq6XEgqzORDUOT17QFCo=;
        b=IGsOfS0iiseZTXkRyjMPuRz0yd0R4HwqPg8peUzvpNWGM4sfmbJFQirrEyxDl+yclJ
         KqZyABpMBorhvUOOYaEAXyS9UHyHDnEZQ3aKjXkgvD6wNClIVL+qxRvPQrDHL0eqLFLr
         qbP6GAfvs6yboAPk3Of4P+MJhx1ZarlBgNHV/AsvIwjLialHrN+v7bAejZmV63agcpvy
         R7T/GMM6eQ3ZtAhB2b/tvRz6oPOijmE4bmw3vNuctWp4eBsz3MLwbrnNm8wn6ILxL4MZ
         4EqRKEQDaf11prOWe1ERcz0mniE0Y+N+15cJy3ejD7Z2Vpx7aDh+yGeGsJaZ/Bar95I1
         P1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771894514; x=1772499314;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5+Hqic4J3q/Gjct4qXtXk7Fpq6XEgqzORDUOT17QFCo=;
        b=WjWT4IdOu2PyMorhk5izEtzgVjorxfwevJ0zbKAaSqxO6RiphwNU+A/ejnTelPpqDk
         F3ioXA/vyGH7o8/zZgBg/ZQHVFhXpGQAHiQ2NwinRzlu+p4visoEZUoKHm4Rmu8u7TT8
         lUdVN3Wr2nat30XuBMTaJXm3O44aL6ctAdG4rB/IHHjIfBgBP+FMh1/s1hFkofM9KUTm
         ehCGf8mUQr69ut1sUD3tq1XdU5cG6BONxV/zFC9J7btDHtaBNsEJ/AjNTEt4Osz4Ho2v
         NcCov8K1rSh4NlqLZlOHbJoFASmlWsC/GF/oprJe75tuuhk2LiQ8m+FJDQEB0HaNR0ky
         5mOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM2LUmOLfNtqSJCfyT3KNbl/ZB9YyZG+eHpPnC/NaF/cvzRW5Zqs4wjUzxFGwpMsZO9PlzrLeOY2w8w+ElX3M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy59UP+dRXfbkpCuJwuPIuKtTg05GUd+SwtgmjDes3lywBMJ8SP
	YcplUxzbvydPNxTRGcDgTuo1SF19qdlspDw895Lvuk6dPi1H+rNuxiha1RcUohFqIxjIXZm21yl
	0pqQA/DWKbe/pMA==
X-Received: from pfbfb35.prod.google.com ([2002:a05:6a00:2da3:b0:824:ba70:4416])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:92a5:b0:81f:46ce:e90 with SMTP id d2e1a72fcca58-826da910433mr9511795b3a.28.1771894514274;
 Mon, 23 Feb 2026 16:55:14 -0800 (PST)
Date: Mon, 23 Feb 2026 16:54:42 -0800
In-Reply-To: <20260224005500.1471972-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224005500.1471972-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
Message-ID: <20260224005500.1471972-5-jmattson@google.com>
Subject: [PATCH v5 04/10] KVM: x86: nSVM: Set vmcb02.g_pat correctly for
 nested NPT
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Cc: Jim Mattson <jmattson@google.com>, Yosry Ahmed <yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"

When nested NPT is enabled in vmcb12, copy the (cached and validated)
vmcb12 g_pat field to the guest PAT register. Under KVM, the guest PAT
register lives in svm->nested.save.g_pat.

When NPT is enabled, but nested NPT is disabled, copy L1's IA32_PAT MSR to
the vmcb02 g_pat field, since L2 shares the IA32_PAT MSR with L1.

When NPT is disabled, the g_pat field is ignored by hardware.

Fixes: 15038e147247 ("KVM: SVM: obey guest PAT")
Signed-off-by: Jim Mattson <jmattson@google.com>
Reviewed-by: Yosry Ahmed <yosry.ahmed@linux.dev>
---
 arch/x86/kvm/svm/nested.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 91b35adb83f8..dc8275837120 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -724,9 +724,6 @@ static void nested_vmcb02_prepare_save(struct vcpu_svm *svm)
 	struct vmcb *vmcb02 = svm->nested.vmcb02.ptr;
 	struct kvm_vcpu *vcpu = &svm->vcpu;
 
-	nested_vmcb02_compute_g_pat(svm);
-	vmcb_mark_dirty(vmcb02, VMCB_NPT);
-
 	/* Load the nested guest state */
 	if (svm->nested.vmcb12_gpa != svm->nested.last_vmcb12_gpa) {
 		new_vmcb12 = true;
@@ -757,6 +754,13 @@ static void nested_vmcb02_prepare_save(struct vcpu_svm *svm)
 		vmcb_mark_dirty(vmcb02, VMCB_CET);
 	}
 
+	if (nested_npt_enabled(svm)) {
+		if (unlikely(new_vmcb12 || vmcb12_is_dirty(control, VMCB_NPT)))
+			vmcb_set_gpat(vmcb02, svm->nested.save.g_pat);
+	} else if (npt_enabled) {
+		vmcb_set_gpat(vmcb02, vcpu->arch.pat);
+	}
+
 	kvm_set_rflags(vcpu, save->rflags | X86_EFLAGS_FIXED);
 
 	svm_set_efer(vcpu, svm->nested.save.efer);
-- 
2.53.0.371.g1d285c8824-goog

