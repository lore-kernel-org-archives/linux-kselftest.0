Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57B81D5146
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 17:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780679327; cv=none; b=JqvJksI9fBv1CeomxpFw+WdFmYVKvfM5vNAhXg4eYiC9Fr+xFoPcZRDkvwaqqZYTUm2+qET53+Nl6dNi1N3H/DZWq+3YXumO3egGnvRfbCPhyWsVs7ZIGaqfIbLzghGOqCAxdoMqisc5DaoKCAR+zet1HIa2dTXWwX1Sc9VSEs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780679327; c=relaxed/simple;
	bh=eteoMHJ7Mk3s+G+vf25Of59vs7CpFhPIpMWB+6c3DaM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Pquj8OsuGW5V/5f6I0T8MtsTkDxgNUJcUXg1z5PV/Wk2HjPJ7sCYQV9mmgR/aO2FBItciD9Kzq6iBA5IzVvbv4ftVrt6EpxC8Zf73Bs8qmrGSG83/jNrPFZ/HJgb1wMZqH0LQiVxgb+auk9HpKmUrAsfn3rHn2Jvsr52mShPOHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a8JP+Hv7; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a8JP+Hv7"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-bee29ce0889so953066b.2
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 10:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780679324; x=1781284124; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mUNSpB3dfOvSGnAPr0UW6nHYEMpqSvyWhzAeEo+qvXw=;
        b=a8JP+Hv7wqC8rK+QkdmDNjXQGiJkd8DK6fGSwo5+N7SjiSIXBRJBwJUMBEK0b0ZIno
         1T/9WwucjY89CmQ9Fr60h2pZoY2gZ1doRk8gXBSmoFQp9XOnPnVallXLT+BOTm3L/ABN
         vB2GnFW5MTMDuObbYkGhlNKUbT3RGSuIf49V5shB2dYoHtmGbBCCMBlYpaJgixoEEbvs
         9z+GFHliipo4izpEHoTeTgUdvjGN0CunXAdY5MAhITuBw9c5UYqzD5o7xC2QoObHBQU5
         9IzMvBlui9dFf6MvnncfA9l+4pykbXLdM7xbemaCZ4L69+7aK2vlzVDSR+w11BqYWVlW
         Gw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780679324; x=1781284124;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mUNSpB3dfOvSGnAPr0UW6nHYEMpqSvyWhzAeEo+qvXw=;
        b=NnDisPYtcMNqeZYTlStQzZCdgCjyhPJO7PT/++CtSD5ZoqOQAEAqIwBXmdltS7RHmj
         H8MjJ9TA7dttvpfWLHKNnD+7AHk6Xag2uWUPmovOxbar3bZ1SAB/MeIyIrRZhBVLySQw
         Im1KTzplhxDfuBlOgM0rIVXx5o+ucUTURjUOxcWSyQmQAmNIpdxyT+v4Rh+TKSOfW0NB
         R2RbC8tgoXpjG/lQAsFDtFUr35SMTBXc6lTf7x3mXfvciDt3Fqlflc8jBZkINp9aD5RR
         KdZFzwjCpb2Q4e6HYqfXRM77H6Ug6ieUQCpOmYSRipAXsGLF2mlJRi25z5sGif6HmWEG
         DmHw==
X-Gm-Message-State: AOJu0YxbZi2lcUZkL5AZPKx8VNzbErkoDhmQ4GabNtgnL7pFd72CdDBI
	QsJ5vDgdUSRJ0x3SVtS8uDADlPmFW03ThoX3nr+sG1hMej0nmXC3gz3y45ffciHfi4bkvF45mZn
	AfX/FqoGO8Y2K9i/Riw==
X-Received: from ejbzc9.prod.google.com ([2002:a17:906:9889:b0:bc1:3569:5260])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9812:b0:bec:18d5:ddec with SMTP id a640c23a62f3a-bf37311392cmr242121166b.41.1780679323496;
 Fri, 05 Jun 2026 10:08:43 -0700 (PDT)
Date: Fri,  5 Jun 2026 17:08:27 +0000
In-Reply-To: <cover.1780676742.git.tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1780676742.git.tarunsahu@google.com>
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <c17394cb12c805a7026047beda2563c7bad44a61.1780676742.git.tarunsahu@google.com>
Subject: [RFC PATCH v2 02/10] liveupdate: Add LIVEUPDATE_GUEST_MEMFD config option
From: Tarun Sahu <tarunsahu@google.com>
To: Jonathan Corbet <corbet@lwn.net>, vannapurve@google.com, 
	Tarun Sahu <tarunsahu@google.com>, fvdl@google.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Shuah Khan <skhan@linuxfoundation.org>, sagis@google.com, 
	aneesh.kumar@kernel.org, skhawaja@google.com, vipinsh@google.com, 
	ackerleytng@google.com, Pratyush Yadav <pratyush@kernel.org>, david@redhat.com, 
	dmatlack@google.com, mark.rutland@arm.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>, 
	seanjc@google.com, axelrasmussen@google.com
Cc: linux-kselftest@vger.kernel.org, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-mm@kvack.org
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
index 1a8513f16ef7..0bbc4037192e 100644
--- a/kernel/liveupdate/Kconfig
+++ b/kernel/liveupdate/Kconfig
@@ -88,4 +88,19 @@ config LIVEUPDATE_MEMFD
 
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
2.54.0.1032.g2f8565e1d1-goog

