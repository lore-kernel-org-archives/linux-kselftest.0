Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BC537474E
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 23:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405449; cv=none; b=TfJ+iyA5iwbuB85mW8JRjYXPvAK6Q0LTB0sKFdfYF7v8yNrZq7fJyJZWhwonSODGbNNg9BID8e8zB5q9Q9asjSmeUSsGPeg1i+8Dd4OOk95aRixD611cYjkkPlkwYdaJiyLsp7ClfMJxR9opah+hrUF2VyUn0isC03FAV3gz0ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405449; c=relaxed/simple;
	bh=UoU3vO2bIrWrWLGZciBGOXIHOLrMeb/5nWjFU6hbO/Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jNbD9LDVpfeLgesYDp4lsFPq8P2w4E1ThC1DQsZvm/OhuHuJiQ/pf9eAUdpdshh8NaWNGUPzxw9KPwLYgZjHau+2SLUCf0zhMJgExCbfXf6JDrKxORrlIMmnvxHHskQ/P+y+1s1+hJML85JcQuI1a9jyKoY97LRptEke8bNKClY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TfWw+g+J; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TfWw+g+J"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c82ac893940so3268385a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 16:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779405447; x=1780010247; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9SBJUSguwXkjuFZof3MzgeP84JWJq09tcbehDxmN6+o=;
        b=TfWw+g+JbsJ9bZ54vM2ek3VDAIJ0hRfrQSRrxfT9dJ96QCyStVSpPQ8gPvj9POB7Hb
         2rptiktDihWWuqogeD2+PvO+0kTL9mkDbpCD/hX3xhCmQRdXJzpY6ayYH+3utRsHxOtQ
         DEFVmPyJZ7YikvLx48wJ0ODvd9LxNKHBEnHU40+5vOlX/9Wn+sfDvNlrbuzGHZsSBkbD
         PjlAHS7Gx40wVl5QloMnBezPiIJBqQ1qh7JdJaT4U/vmFeWIt+SjPrlwJ8rtylgmPy4K
         IBy1A2QfGH6HRLRQi5FZrKEd9dLEChN+7vzPoKZxaZ2OFs2vKhWrj1DTU41TOGEnpsv1
         Lvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405447; x=1780010247;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9SBJUSguwXkjuFZof3MzgeP84JWJq09tcbehDxmN6+o=;
        b=MwGjn2Et3AC/q4uKpv/FUWukXuGJXyddF64cDA2QFWvzs09J3FakDw21OHd/YkjYb7
         Fg/pzrAMRv+/Jl0tCW60D+0qEyGjeejLBMna7NaxI96FGbIJ8bjuxexDQ7fKvWRzhPK1
         8OJqU/R8sob9mSgjMiPmbBnCxlBhjVKeEJTyS5sr2qDLfGHbvyghB/H58nAt2jwe1m6C
         uN9HIVqCVEZ+YnvLK3LMronVG9TVdS5VCObUjwGY5AhmJPZE9J71JPo6NBfT1J97ptWm
         U2IZGWAsBe0cbUP4LGxL67f3XXhdWYzPuSGJCRsXI3AwrbZg/TLSbrnOaFZopORq86DM
         xJeg==
X-Forwarded-Encrypted: i=1; AFNElJ+C03nXJDjH6lehRQ7WljJ55OFQpP/W0JIY6a2T6xAioDPV83aHsd6FzdfKPXsutZjpZyyy9cjQhAE7NTBNpxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVxVgOGMacUHBLmTRfntbUVVYAqiyoE/0oHxQCNUt9ZFpdrf4q
	Qaj+W71ZYjGZt9QdGtOnssBruJqQI3Nnk1eWJH4RsuUIh1wO/FA2515HYxN7q9wHCiR+2tIcvFj
	FmOI4aA==
X-Received: from pghw18.prod.google.com ([2002:a63:f512:0:b0:c79:5fb7:acae])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:12cd:b0:3a0:bc61:62e1
 with SMTP id adf61e73a8af0-3b328e580a0mr927322637.30.1779405447202; Thu, 21
 May 2026 16:17:27 -0700 (PDT)
Date: Thu, 21 May 2026 23:16:47 +0000
In-Reply-To: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779405439; l=1502;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=gspyrFHq1LK9qs66fQWDyiAFVJSplHon4JiLLfr1Jwk=; b=q1/LQNXPgWNW8jiLdj0PNdtABbwpED3/smBdUQCgKtemvqmXSqbYb/KFV2kIHfk8qWeAG49hT
 MO3Eh1crUamDlXg3WSBDFEAChoCqupVdeiwG2SrMIXZmb5MnKDzp6VV
X-Mailer: b4 0.14.3
Message-ID: <20260521-tdx-selftests-v13-v13-6-6983ae4c3a4d@google.com>
Subject: [PATCH  v13 06/22] tools: include: Add kbuild.h for assembly
 structure offsets
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
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
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
passed in the C structure(struct td_boot_parameters). This header
provides the macros needed to extract these offsets from C code and
expose them to assembly, ensuring the two remain synchronized.

Signed-off-by: Sagi Shahar <sagis@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
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
2.54.0.746.g67dd491aae-goog

