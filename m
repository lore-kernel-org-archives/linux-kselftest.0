Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496F8346FCA
	for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 18:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154144; cv=none; b=TY8waaQ3q2IsnP0dkPRvoe1Er7T6YLXmLSqMnxXYHQrJ2oNgNqWzSVGssababhtiEdNwZQtFEg1Rv5dKVfDZRpybAbnFPmd23I/bTM0zXqyC8Xc7MZTrvEP0GwDHmeaoFDOh8z0+eUnQ78o7+tjQflzWpv/lvUR4VPey9rltcxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154144; c=relaxed/simple;
	bh=/ll0ethd+Y+ejhMqnBHdeN5CKETZ/XI2FbZX/MXGx/Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MV8krJGNNvz/buwxBmZpqjFpeUvySDOCmDSfSM0O4ux+1FZaomM3Gwv0AxdSm/CdKRgIahsBaDdoVGwFzz1bbfC+asF7JiQTvgidxfhE3y/unAtqBneebr/gv7B8l0UqRufkyuGXEY8cFKrXaG+KCDRURwgNyxj0BhTpcncs3P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lWnEmNUW; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lWnEmNUW"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-695e7929975so4590504a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 11:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782154142; x=1782758942; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3NnqtfMpo6SzkdI4Y/HSdjjWo3N5TymmoO6c1c+A8Gw=;
        b=lWnEmNUWgiAJuCJ2psJandvmHOGoljVXEmEv3OYvw0DxJprLApw1qjEYX09tdZRrhX
         oUJ24G+STJzQ9IKjsXcX/JbP35nXiyq/igPt8ZrYY5xjK4T083/Z+uU+vArbD1e4ZLPj
         kqjjLTD+pIZQb6fvbRiI5DGMRhxL3gdvAqu5KsHpFhdJhbttdal2xMNMccXTK+Nnj6Aa
         IhplV7KRdWlu3elvPgyiz8fBwedc83mISwlZ5/YoGlSHiXgSqv0BSQxym96tDcSjObay
         /gm3KfITuRGwTY7SKcyHQqN7FKS9SINMc1GvgOfUrGvdTnCACxEiaWQ15STUAeh7CJev
         mQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154142; x=1782758942;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3NnqtfMpo6SzkdI4Y/HSdjjWo3N5TymmoO6c1c+A8Gw=;
        b=JkTX7ShamGQRkC5aon3g1VUBpdKRrAQ0GDo08TA+M3OfNfxuV5K2g9nZoRTrOpl7iL
         Uq/DXVGiThxowSo+yrLKbJSt2O1mIyogvlGit66Zi801JZRxaeP9VMiyka72vsMbNovq
         zUTuozkCz4m+6UK6s4QGhZCOPyGuhGN2pAeroz2l3ZheNfargXRDKjDfvyoJkiM7rqdG
         iHIw2nXkMU7FcyGXESMfaIYbP55oZbDSDvWE3gT+/6lkpZ9MYPYfNUGBfwOrEltH6rt3
         hzig12NUYtw771vPrAj4VmrtHrYHc0c+D2dwyIV7vmc4QE+Gv8u9+WLeQGL4UP6VDrd0
         wy+g==
X-Forwarded-Encrypted: i=1; AFNElJ925zp9If5iPv7IuouZAO0y3RICUO6fD8RZQFZEssJWustkrepCNJJQA1IcJgUXRidlDQ95AD9+nnG+IeDmvxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFH+gh7GcK/2pVrF/z7E5rawmVdnmww+KoVYtX+M5mM6IH2axy
	fbEHjiZVOaUWQTTza6KB40Qq6wU+Olpz2VUyeTKPoVMgUR+R9FdaP9Q5xCR3AWgVY4uxmD8ySbw
	a/MyhKQDxfyAh2Dtq3g==
X-Received: from edh3.prod.google.com ([2002:a05:6402:5043:b0:697:8dab:813a])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3548:b0:695:837d:529f with SMTP id 4fb4d7f45d1cf-696e5221662mr7941415a12.20.1782154141503;
 Mon, 22 Jun 2026 11:49:01 -0700 (PDT)
Date: Mon, 22 Jun 2026 18:48:43 +0000
In-Reply-To: <20260622184851.2309827-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260622184851.2309827-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <20260622184851.2309827-2-tarunsahu@google.com>
Subject: [PATCH v3 1/9] liveupdate: Add LIVEUPDATE_GUEST_MEMFD config option
From: Tarun Sahu <tarunsahu@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Mike Rapoport <rppt@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Tarun Sahu <tarunsahu@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: kvm@vger.kernel.org, linux-mm@kvack.org, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Introduce the LIVEUPDATE_GUEST_MEMFD Kconfig option. This option
enables live update support for KVM guest_memfd files, enabling
guest_memfd-backed memory preservation across kernel upgrades.

Currently this support only guest_memfd files that are full-shared
and pre-faulted.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 kernel/liveupdate/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
index c13af38..2490f9a 100644
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
2.55.0.rc0.786.g65d90a0328-goog

