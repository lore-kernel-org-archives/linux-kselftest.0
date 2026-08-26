Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792A336B920
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 05:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787720671; cv=none; b=WxILmatyiky3w9Jkr/AH1jbXe1HAWUZu4in76Dxb4Ps83ytQ6dAPfHGe6QzSnFX9CI4E/91S/bJGueSZPa3pTSPG8Uz1rhY2oFMaOTC/cHpzEWeCF5cfURkqt7E2MOms5PS9mtHrSC/vYJ+L3gSC2tyktFiVyMDtMll24bkh0CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787720671; c=relaxed/simple;
	bh=rvaXmdHMmazdIGdj9z6pAUEbbACnQf+fE97k972YqEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WyjA2/yT8azVNS/engGtX3gaU2Nc22eMn1euqsTIzomDAS9l07I8+8UiTA5RxEukiePSGFOZIC+WMgT5jF9vDEZ7lliRpYJWZwgvaOiv9auuuxsB8oNR7U+zQ6aXPzRaPv5MKntelqY0GlrnHVXQRhhenoRtndIEv1Rxq096Cmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrSWjBIy; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrSWjBIy"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caed617615so6386625ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 22:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787720670; x=1788325470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oYv02gmUGksQgXi/r1LBaBHVUhBN+GFoofiyVDib5Ko=;
        b=SrSWjBIy5h4L5Jkm8ypZnEPVFvqCsHuAiqdqUekhTK/bOMLNZ88HhhRysV0FDz9KPT
         jlY+X6N1I3Lwh7HuwA/Rz5LwYj/82K9aIhcpb+ij8H5DGNndP1ERkjgLg/6HStY5HcuS
         GqtcXn+cPHmZ30wpySYxZhQ82TO2AuvCYs0n1Wqr1aTHCKcyrJA/445o++lIj90PsVLQ
         4LIQHkg6keHFi15sBPaE9iUNV6BshLLXrOMM33REv5HQB1uncRXdUsKViwPvvsZLTPfs
         eVTecGwSTld9HkEyvSxF72/G/Ec8V867ZhQY4FkrjG9VE2skD93cy2me+2PJwc1nj+Y2
         cZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787720670; x=1788325470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oYv02gmUGksQgXi/r1LBaBHVUhBN+GFoofiyVDib5Ko=;
        b=PYYm1db9LtH+efrddDWrwntklZZ44ussu8Xkz3ovTEhUsVMG8cqBmUj741Nh3awO8K
         y3rwCJL4uPZUCZldaWwf6enZpe8Jsn2Rxonh/7Si5uVvXPYaqDdO5OF3VI0kL/3FIqFh
         ybXiYAst4OQKcpVLTGhLrmMXiZcGc4Q5y7kAYHqkWydYiE5xf//jowCFwn8p+n4Z6+f8
         DSi+6sWQY7sEKunplT6wEljAO9lH9zKhw9+j3aPTMCSheme63jyP4ps38W1rTGZMa6Wd
         kPrOAuMb3q1fHEZbhuAX0HZN+7ijU6dxJ8msXI9lV3MUG7jBJ5xtT2IFnqm0zGevDLka
         mmaA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0w7JXR8revoMYXUbjQMHhfBFoSoYmg/MvR+agnauB/UTgOwnfPm+LhqIKM891SFFXtO3aEAyaJY+dZOWjZj0=@vger.kernel.org
X-Gm-Message-State: AFuF++mnOhkI7B5U69e+nR/2NYt69po8RwCUnXmQHr7bJO/YQCvzw8YG
	5p1yjJZeO+1gSdHQIcHtKeFyqZ1R3epvBnb9bAI491IC+Bs0GBrsme9q
X-Gm-Gg: AR+sD12KL/Y7iqdSPZonXNBlHhyBLt4IHKGRt0W+A/QeEvzCZYPj+HsR+1ggHGttJkX
	UFokCUKzC33ytwL5Qapav5FlEnjtqVk014L1UMJbUXkrI12LJlFzGNF7F5XK9qmmgmSIsVPcFz6
	XYoR91ZKqo5YToSAdvNaVb80Ehx5i7ggLkGWwhHdxpvsQ0iWKYftWIv4RSJpTSOg1wUclpzKFCt
	OGZ6NEmtbZy+8fguOn8DrYR343Jp7TAwTz0wUejU6fbew1XRQAnaHMH8KC5EViP+2O7/8UUmZ2U
	olaThqSmxblgECOyJtZdURx7HzUjGYCYHgnv5vwRT+N3qYIVWQ7dVlKJL4CcLMw3MoGnkDAzmZE
	yVXJIyFlU/i2avFFu2K95EPKL6FK//J/jNLitCxXlJ6JGPXgyEEDauN+gVgiIOh1yI/+J2ZDb9X
	ai7/PqabLfnCtxoXcgyQcXt+03WD9Hx07RBL0TjYEIj5PWUGeDnXoxmlxW7Jitq8kVCnvpeR9/J
	Jb31JZqLKbQ7LgVWT50fg==
X-Received: by 2002:a17:903:2341:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2d707c1020emr60536615ad.14.1787720669824;
        Tue, 25 Aug 2026 22:04:29 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283da25c09sm6844956eec.31.2026.08.25.22.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 22:04:29 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] KVM: selftests: SEV: Sanity check the launch measurement
Date: Wed, 26 Aug 2026 10:34:06 +0530
Message-ID: <20260826050406.2836603-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260811040858.1984593-2-hemanth.selam@gmail.com>
References: <20260811040858.1984593-1-hemanth.selam@gmail.com> <20260811040858.1984593-2-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gentle ping on this one, no rush - I realise this landed in the quiet part
of the cycle.

The TODO it addresses is still present in sev_smoke_test.c:

  /* TODO: Validate the measurement is as expected. */

and the patch still applies cleanly to kvm-x86/next.

Happy to rebase or rework it if you would rather see it done differently,
and equally happy to drop it if you decided against this approach.

Thanks,
Hemanth
