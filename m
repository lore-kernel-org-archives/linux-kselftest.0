Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4CE4078CA
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 05:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787290750; cv=none; b=ewSpNOJl2A81gSwhQTl//wiJ1ec3+jNKsOJo454JLlLlkwvZhf/4XzYekxJk6TfvZc9JbCsJ70Gr0D90A7kwOh4ooqvt1MdHs/Nls3Ex6tyyapXZlffcAqaRAUx5v2iErHbSUY/SivEm7ipoNtPbim8y3Tse7HOEZ85DVdQmk7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787290750; c=relaxed/simple;
	bh=SY/Dah/zPU60yX+nRvB9MxhPWEeufU0az5LJrtnHOBs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BLNeNYxxDuqn/w7IJDLbI2eWjvoSVH8A6siVgI8wnqLwtGOlajzZwOWHzNa+L64pU63Fk86uOV7Rg6omZ2PYa8+pFbWvbfXQGy9oDv4gvkpXgoWnw0I64ThbipclxXnZq1QBmp5SaHakoGc8/f2jJ/rYvNsSRPCvt/YL66OgBIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+b5ns36; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+b5ns36"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cacf197759so9264145ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 22:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787290748; x=1787895548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SY/Dah/zPU60yX+nRvB9MxhPWEeufU0az5LJrtnHOBs=;
        b=h+b5ns36evMtx3bzknDRV867KsCgfFWIK6nr8+64cJNmxOxDfHop9CH3OtG/1acAbt
         YKt6yItiUeOqn+nK0Q/WiB7p8FtZTfGyTyay4R8QBr+wS29YrCWEIRC7qtkqOTtgAFz1
         p1uuUpjQ/fZ/WIQdjrOrqtllWXNHnTwcAKqeeWHKcvM9sG/81QRxsbVftObhsKJz+poP
         qoKg6+ceesHRNCOAlqjO2R3mwmY/433A/A8eaKGMD9QpnKgUP8tjkwTx+jt+tVVQspfR
         C8mn6tiDJj+jmaOylANISSXsVNduYkx5cKWC68MTrc19B6X9LJLxxPmIKdjylb4E9nxf
         lgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787290748; x=1787895548;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SY/Dah/zPU60yX+nRvB9MxhPWEeufU0az5LJrtnHOBs=;
        b=KIj74CT+gL6qCYBhuh8EVf2NJ29K9g2pMceBkegS3jFpdmaKleMGZpT5nT9sRLwiGn
         K7fAWDGbSqkdtgc4T8ae8zwGwp4YCTYMF/CK91t+FnFBAHtHiBqn5QwYzw6q4LoMMaak
         3AdDPviHk2nrD1ZlqQz81cWBeUfxVJpU24q9WNEseJrdng8jMlNb33Z30hssCTejVgNL
         V1VyoMTjskWV00dSqizTouuatz7iCJtdYJDUcIqG/uFRncWFV4kBWEqMNyqfkkoQD33q
         hgcT04S6IY036BHQm4nqMcUDKC0AzgxIHGB+yHkYbfjRyt6Hea7hsGgjkEChfU8qbKtg
         DTrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rre0Tsl6wkd1dEyKqUBLy8OTmjd1NKxVi2Mtzax0kqcEjNWdzW02Y6PsLHCIiIAtxtkpyZ3AQTB0hFme1MeP1g=@vger.kernel.org
X-Gm-Message-State: AFuF++nIqEFlsaR11NU7G+K67FZeZWW1iL+aX8fGY51l2usJDRfBUlXI
	kfpFfl3KY2uuLTQ8u4liPca/zNuaRIwSABhKzcLCciQfcVS8N2aLwxm8
X-Gm-Gg: AR+sD10Q2iwFOdFfnP+DCtrELRPnuZmYnxR7ItoHdKjsstzyo/8zCGJLtV3HrmefpdR
	SISLnh0Q6PdbAG5X8y12SrzdLCbg7Qq+J8OkvFPWT6eCjWM6dWrfwdxHMmDOvmyF1iO+rDIe2Wf
	1V3UROsh3kYSU8YDsPBY2Hdnp31iuQgWFme5feiqO3wx2BnwDeuEPt+RwW9IJ6jmR5n21soJa7S
	TnB5r5lc+ob+5fsZ1+vMhSNpXoNxm2HkLzweTrzIfyH/Hsl5TFH8h/8ZcufXaDSk+n9JnaVKf7l
	LzcQgoO+V++X3Hri2sx8UKygIndma29Xd1JHiOn3hcBTchrqhbjJG8Na4zeC278ujpBn9rB9NmV
	xal+Dzkm3QP5wIsvVW8qiS43mnupB5A3xG2cs96vDi3bsOXMdDL/2kE7e99agftw5gjP5eUqVlJ
	CvMbFMWQzQKt7ZGBVtqK2FZ9B6CLy2Ec4tX1/NZaz0ke6JClWB+bHHP9WkVipl3vFP/1FtM0U41
	6O4/UrPkxfv
X-Received: by 2002:a17:903:19cd:b0:2ca:a03a:29b2 with SMTP id d9443c01a7336-2d64affe4b4mr81817655ad.8.1787290748155;
        Thu, 20 Aug 2026 22:39:08 -0700 (PDT)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef7a0easm26708338eec.12.2026.08.20.22.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:39:07 -0700 (PDT)
From: Gokul K <gokul02k@gmail.com>
To: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH] KVM: selftests: Fix the bounds of the SEV debug dst buffer check
Date: Fri, 21 Aug 2026 11:08:08 +0530
Message-ID: <20260821053808.1216172@gmail.com>
In-Reply-To: <20260808061934.400892-1-gokul02k@gmail.com>
References: <20260808061934.400892-1-gokul02k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: reply.sh

Gentle ping.

This one is independent of the other two selftests patches I have in flight,
so it can be applied or dropped on its own.

Happy to respin if anything needs changing.

