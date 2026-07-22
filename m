Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED81459AF6
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 23:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762065; cv=none; b=L7fL20OunSTI/TF7f07Z0D+PkC1KrNtJsU119yXreddI5p8Ib4umjFxE+ndNjmrKhLrPc57ysufXz291iQoNscBoPhONNPZqQyX8zXxeeE+W+0Vxgci3T6ph5SZL7zr3Yf0rSgVB0dIch03dPWGIuRQGllQhyE1tAWY2KP3DpN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762065; c=relaxed/simple;
	bh=MN5wgOlznVkl+BjeEs809JtcBQkMpu0tStRwIcnoZBo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lF7virq1IntXHiUnPrK+GaUyQm4OHliFIf+7qziK2ahRNCSLdF47nI4eLmOh095/CS2fYNNvTQ81uAitRElKDX6eq1LQvAcCK62+PSqFv55G3zK0h8KFUlbE9p5tXlndVewCrCnAfBbjV214P7dHGaI2EP8/rFCwYVj5a0B2gkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WjzhSAUw; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WjzhSAUw"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so114795a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 16:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784762062; x=1785366862; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNI6BG2rRalx1BcQoBnUKDa+4TlUreIqsReX1yE6FOI=;
        b=WjzhSAUwj4CugvxBARKuulkAurDs2RyzMe+Z+FXWLD3KT3wFr9jfyg56AAEQVYEW91
         dsBkDOUBIgw9wopVb2YgTHqi2i3SIt8VTYywy3VVjkTPqka02Or5f+HLEqaw7V7lS8d7
         V6OXasDQZKySOqdiGOAGrw7fE7pSIKUwNQH2oLzeiE4nTWILJ2AMnDcdwFINluTCVHLC
         5uiHAFE38dtTtf+q54ay4tDXuT6uLLrX0nI+e8HzmC4jf2a7yTX8nV/7k6Y9RAL5+KMX
         ahRNNqh75uhz12URuj9gpwTgorFuOktmHBighWmKZVMmvy9xLbmcGOTHXgE2oCW6bgEt
         WW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784762062; x=1785366862;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNI6BG2rRalx1BcQoBnUKDa+4TlUreIqsReX1yE6FOI=;
        b=ngUKS5p7/rSd4cCCxl59s3IPQZUHj+pb59wsMpRUw2qKNzIOBpTLPy3iZIfG9fOV8f
         uO9c8eXxtjFLRua6hFto6yQwuu8d9qTpSP45imHyzKSN5ni+dU18oSfDq169oJpktS6l
         lhNtiU5Njldbv8ntrLd2OBPXPuz9Vq9ABeJhpfwWs5ns9bsRJBbnL/K1h+sHQhrMxRDW
         hqw/W0VmKKvkESAz/nKQ9I/aWa7Uy7dCZ0xvmG+X0CfUxRjle55sDCjRMqKOg0MCv3jo
         KJ4x7mNINFtysG5pRZaoomMuKQo+fKtaNnP7wicoxg6JtGMxvJkApaX93Szrt7BhsbBS
         hF7g==
X-Forwarded-Encrypted: i=1; AHgh+RrNbVDvc2w0NBBKulo1hmKRpxx3vrfF6tvDJoFXjXgN8UVuISmzzyeSR9zceYBv1lhZzMlKjFKKXRcBYb8qYlc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa8yxZUZnkrp2FFoGeoyKpjh8TxyjEXtHvWKLMsOZXEpJTNGk1
	bqaQlsW8QZC7qMIo/lK50jRRCYHQ03aM+LBgrtPL3AO1S1hrMeiOorJJnKwY3ORm4K8sKaQfJHF
	i6/LSlw==
X-Received: from pgwa20.prod.google.com ([2002:a65:6554:0:b0:cbb:8579:3a63])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a126:b0:3b4:6a23:6ba
 with SMTP id adf61e73a8af0-3c44b006725mr571413637.26.1784762062177; Wed, 22
 Jul 2026 16:14:22 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:13:11 +0000
In-Reply-To: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784762054; l=1555;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=wrBgxcBhN/sZNPJ4zdjh5E9TZDvM2h5ZX0OmgmcUlbY=; b=pXNTGhmG23eBH63uL+CND3RgVZfyXWaFctbAQm1rlxi8q9M8bq0fBhJEGtUE8Z5gi0YpU6n+x
 X3QsHJ5xnycBbH61MAUbN2eDF74a28NFjTpw/W/gm1ZCAXb5BZVZ3dR
X-Mailer: b4 0.14.3
Message-ID: <20260722-tdx-selftests-v14-6-15ad654a50db@google.com>
Subject: [PATCH v14 06/22] tools: include: Add kbuild.h for assembly structure offsets
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Add the Kbuild macros needed to enable the filechk_offsets mechanism to
generate C header files containing structure member offset information.

Tools depending on assembly code that operate on structures have to
hardcode the offsets of structure members. The Kbuild infrastructure
can instead generate C header files with these offsets automatically,
allowing them to be included in assembly code as symbolic constants.

For example, the TDX guest boot code requires access to parameters
passed in the C structure (struct td_boot_parameters). This header
provides the macros needed to extract these offsets from C code and
expose them to assembly, ensuring the two remain synchronized.

Signed-off-by: Sagi Shahar <sagis@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
---
 tools/include/linux/kbuild.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/include/linux/kbuild.h b/tools/include/linux/kbuild.h
new file mode 100644
index 000000000000..957fd55cd159
--- /dev/null
+++ b/tools/include/linux/kbuild.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __TOOLS_LINUX_KBUILD_H
+#define __TOOLS_LINUX_KBUILD_H
+
+#define DEFINE(sym, val) \
+	asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
+
+#define OFFSET(sym, str, mem) \
+	DEFINE(sym, __builtin_offsetof(struct str, mem))
+
+#endif /* __TOOLS_LINUX_KBUILD_H */

-- 
2.55.0.229.g6434b31f56-goog

