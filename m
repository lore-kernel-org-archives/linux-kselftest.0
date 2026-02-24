Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71E6237A4F
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 00:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771894510; cv=none; b=fvLTI2g8JPW2w/LzQhrXLzG95iraMjm4f+SwvroZImZoR5K2I4nqQ39uxRb/+iDHI/3svsxVKsUcTMWZBdnJugKc/P9iiEV0li8qIDmbJY3QE/hT2KYMd4Kkx80LgTCQdDbG3LXnE3J3GSwAr5m53oNdjD/TCylgC2oI2CS4WAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771894510; c=relaxed/simple;
	bh=hlc3eDYC5CtCx3ysabEqZdPhL0pvMkg0uv2uuQC4boY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZdXwZ1EcETyFref0KFN2bF21gOVu2Q8WLPc8NepbQe9F/3uKSm2UZRLcC+VE5VRYDiYWKSlIvRvQJl2oEYlJC+AlRM3JMm1+Tx/2NawQ0qm9KwID1msSlih8gykI59/mCJKx4v6hMBB7g81vjlgVgBbPrDwhitxu5iks/OlfasA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4b5kv0ng; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4b5kv0ng"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ab4de9580dso406176275ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 16:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771894509; x=1772499309; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oa3pg7vK4S+HyEZf4ju0uKesK2HwwrvHmekpcG0SoGY=;
        b=4b5kv0ng7PvyzYnPE3wrKCdXMc0Ytu3i7JgrNxgHDoU6ZtimAIOWYiAoLcBM/ljiC1
         P7S/XtTU980au6E8+dgKlcLkeXDsNSJuu6zcJMOOQVq/qx0LfuRnQbn55QbkXPqzRXxL
         kyUTSNWXaEyXKwqmELHqHcjEZjc/gusUohhO5Blq9Xc1G6OvDUAHUlvrNqJfpWyBmStE
         mr4vD9Pp0XU3ni5uIYB1KqUzalhDhgVITk+fsJQs6uT1ylssCg7OxnlofwTnHCoJuA94
         ++T6M9rfkUgpJP1+Gr1iHJU6i9x67Wnc4gPVVuHsK9rQLwHAYz+OkPZquNSBfcEXIOq5
         7WxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771894509; x=1772499309;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oa3pg7vK4S+HyEZf4ju0uKesK2HwwrvHmekpcG0SoGY=;
        b=RWEGODpTwZyQERl3RS4xhltCoTxYJI6HAOd4/4MElDsyIbj0DPoJT02uySeVwtxh92
         AzujJnO61AtY5fbAo+kp4qolYCNCm1ZbV+qU3SbSbhWjoC46B08nnkizRjCgAJZXiLHc
         w88IwIs4UwUlBJPz159aHCa5ugpLFPn4SNyIc8NU8IyRMUZ6+iKSMyK8PCl2J2dbZbu9
         KdNCJAktUqMz2nrXByyKMRgFtKt80Q6Im2FdrIpyTdw+rIzgS8nJ/tZ7dxNITY7UYspD
         HXfhJc3GXT1DJ5KDxzml/hXlirFbuxD3BWIv78xuv8bM45xNBSiIuGbI+Sj9Jsz1V7IH
         aZHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp7YD/LMCkL85eWR0Ks6mLeiWqD34Ay3EXd0u6a3SHHSE5S+qFSmnVqlszicVrQC3ViZoprmabt1p7Q7ra/L8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze1SyOBbZj9qDSWfMEgKjnnwp+O6HC+gW0sWK+Dfdv0YJkjCGH
	koa/+3zk4OftSqjKEIOhZPTGhQ/gf99B0HgPdoOTNN0M0weYmw8GDeyUUrf9QOeP87jwrlDihec
	3taYYSr29MBMfTw==
X-Received: from plblb15.prod.google.com ([2002:a17:902:fa4f:b0:2a9:4c70:1b4b])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f68a:b0:2a9:62ce:1c18 with SMTP id d9443c01a7336-2ad74449b3emr95053825ad.14.1771894509056;
 Mon, 23 Feb 2026 16:55:09 -0800 (PST)
Date: Mon, 23 Feb 2026 16:54:39 -0800
In-Reply-To: <20260224005500.1471972-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224005500.1471972-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
Message-ID: <20260224005500.1471972-2-jmattson@google.com>
Subject: [PATCH v5 01/10] KVM: x86: SVM: Remove vmcb_is_dirty()
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

After commit dd26d1b5d6ed ("KVM: nSVM: Cache all used fields from VMCB12"),
vmcb_is_dirty() has no callers. Remove the function.

Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/svm.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 0bb93879abfe..8f9e6a39659c 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -434,11 +434,6 @@ static inline void vmcb_mark_dirty(struct vmcb *vmcb, int bit)
 	vmcb->control.clean &= ~(1 << bit);
 }
 
-static inline bool vmcb_is_dirty(struct vmcb *vmcb, int bit)
-{
-        return !test_bit(bit, (unsigned long *)&vmcb->control.clean);
-}
-
 static inline bool vmcb12_is_dirty(struct vmcb_ctrl_area_cached *control, int bit)
 {
 	return !test_bit(bit, (unsigned long *)&control->clean);
-- 
2.53.0.371.g1d285c8824-goog

