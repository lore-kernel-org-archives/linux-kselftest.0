Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EE541F360
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 12:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240706; cv=none; b=dUHCGxeKsgqgoPFGg1tvEtX0Kgp+s88BGrZ2LTviOxasyCEGaFFY7+dpdeCXbvHPKGdK/vgJDL40IyJ6LGL/P+oL7Pr5HiTJSysYuqQxaSimHy2XwGnZktgN4NXEsbGd+Zcz/aIOHrWeVTJlvdyA0qa/TUBZrQ+Yj4fWDiq7iHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240706; c=relaxed/simple;
	bh=AkM7QJa0UrXPuPGuYE60hJYzttXPkaZSTzOr1esbiW8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jxrT4ExDaN1fXBsOs3pGaO4lFUZrJhERQrRPu1AvqwVbjnvirJAgrFk3+/n7Tgv9jWtiL78z8zXO7nrJQfIjUbkA1f2FmUvTuherqbAt6scMmm6U0c6ScVPvLLRmp3Llf7ZLduhe+XWCGz0aWoX0QmqLugAQDdT/RI0xJgg7AXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NvxW6+YY; arc=none smtp.client-ip=209.85.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NvxW6+YY"
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-69e984607e7so4085566a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 05:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785240702; x=1785845502; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gVnIMBasyGsCgYKzJa454oI7ZPXv6Y6JMFDgs68eV4E=;
        b=NvxW6+YYXQqImpbFbZd7n/9zdM7zM+jE9w1orpdxiFPsr9Vux+TXBgKJrIHj9J57Dd
         z1LUzLkdiAwPgZLj7Mzp9NOe6RjNyEU1t06T0aWDTCh8GpGw2EAl9ZV7dlZAimviW1RM
         /0Rz8e3Sg/MIMXys3pXvDhrT42I3VLqaFEafXRd2uV+L/keYL4s2Ncg+TZCvySl1Ma5h
         xnCPFrlUmmCP5yVrqMkZXMreUoK+C61/0o5wrkoBVkcrT3m0wNhzE01+KTStVLlDwt4d
         GfVuGJoiTBhovaBeCZ/ALwM2WWaYK2XbEH3z8u5HTwFdyuiDk7TV+sf1HcT6rtDqFCKq
         N4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240702; x=1785845502;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gVnIMBasyGsCgYKzJa454oI7ZPXv6Y6JMFDgs68eV4E=;
        b=LQJdkca32uOYYf2Ojo7IE+L2n2TEpKbz8h3ru+l5GoryVqWxoXkAvNOFSqRZ23xo+2
         MGc3u6VtPgqhFsomSYT+1XghX94/2YN+Jp5FnXHC2WhFgtHEsixYSbsXeKqzwhqXTD+L
         VYp8/8bWUDWxMbHEh4AzeXshqLya2htUIsPgQkasD8zWSVz74+cRmb+oDDFn+1Aobz7T
         Bhd2MaqvqFXNuNAAe8pvOwKTUaCwjHH0OkzmxSPFgTcNSAjmszJRkKDrqgEzu+q1jnjH
         PqtNO7NI+n+uSy4m5pZ6MMHq2Q/qU+1WAS9ewROJRpM5e+IaN8vZY1CKNqdbUiBYNmKy
         dOPw==
X-Gm-Message-State: AOJu0YwkBeTR0qJ4oNZslY2stt5U1MNWsII6+f91zfbU4bBAYVqCxyQ5
	hPm6hqtITNX+u0CmxlI8OUr+SLE3StUraKIWeq5CoWpczXlFwEE7QI/kbieaBhaqUhHtz4Q180s
	hrAKt2rSa75qDl2bbbw==
X-Received: from edfy21.prod.google.com ([2002:a05:6402:a3d5:b0:698:3510:43a])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2b93:b0:69f:d5a9:c957 with SMTP id 4fb4d7f45d1cf-6a034a765a3mr1074401a12.35.1785240701982;
 Tue, 28 Jul 2026 05:11:41 -0700 (PDT)
Date: Tue, 28 Jul 2026 12:11:28 +0000
In-Reply-To: <20260728121138.1103610-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728121138.1103610-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260728121138.1103610-2-tarunsahu@google.com>
Subject: [PATCH v4 01/11] liveupdate: Add LIVEUPDATE_GUEST_MEMFD config option
From: Tarun Sahu <tarunsahu@google.com>
To: ackerleytng@google.com, fuad.tabba@linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, seanjc@google.com, dmatlack@google.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, david@redhat.com, 
	Tarun Sahu <tarunsahu@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, sagis@google.com, Paolo Bonzini <pbonzini@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: linux-kselftest@vger.kernel.org, andre.przywara@arm.com, 
	michael.roth@amd.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	will@kernel.org, vannapurve@google.com, maz@kernel.org, fvdl@google.com, 
	kvm@vger.kernel.org, oliver.upton@linux.dev, kvmarm@lists.linux.dev, 
	alexandru.elisei@arm.com, skhawaja@google.com, aneesh.kumar@kernel.org, 
	linux-doc@vger.kernel.org, David Hildenbrand <david@kernel.org>, yan.y.zhao@intel.com, 
	kexec@lists.infradead.org, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

Introduce the LIVEUPDATE_GUEST_MEMFD Kconfig option. This option
enables live update support for KVM guest_memfd files, enabling
guest_memfd-backed memory preservation across kernel upgrades.

Currently this support only guest_memfd files that are full-shared
(INIT_SHARED and no support for private_mem).

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 kernel/liveupdate/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
index c13af38ba23a..2490f9a9b838 100644
--- a/kernel/liveupdate/Kconfig
+++ b/kernel/liveupdate/Kconfig
@@ -86,4 +86,19 @@ config LIVEUPDATE_MEMFD
 
 	  If unsure, say N.
 
+config LIVEUPDATE_GUEST_MEMFD
+	bool "Live update support for guest_memfd"
+	depends on LIVEUPDATE
+	depends on KVM_GUEST_MEMFD
+	default LIVEUPDATE
+	help
+	  Enable live update support for KVM guest_memfd files. This allows
+	  preserving VM Memory backed by guest_memfd file across kernel live
+	  updates.
+
+	  This can only be used for the guest_memfd that are fully-shared
+	  and pre-faulted.
+
+	  If unsure, say N.
+
 endmenu
-- 
2.55.0.229.g6434b31f56-goog

