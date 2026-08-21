Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4063DCD9C
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 19:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787339378; cv=none; b=qc+QbxQWoGDR8wSof+YbyqyN2zGHLRoiC0f4p4DhtAdkLOyESiBzbzboQxRg37UeyiFps76sgAF/zyx8G/HcGJ8I6Tp9oqjQPGjPC8JjkcRuAUo07cVue9550LXrS0O0Mo3koXpvvYCWnpc02qewFWB5ELvX3WZFcj2LWYTQVPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787339378; c=relaxed/simple;
	bh=m4AbHNYOybKycCffk+1NRelRi+xxrvqfKKYJ+6qV4UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9T8ydLmxuNqNy/lcArbzGty3foRvKhgDqviSzQP50QAWJUJiPXLVbmXIn5QA17NVFky/4Fs/OeL1saCiBEKHTByx1JLSOhJSbFobcDHdqiWjvkBIHxJJ+EOMGHtTVKMpnDD8AowHbEKhgvHWROiuHsPD2m6+dziI28Ss/6x0Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJ6Z36jb; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJ6Z36jb"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15d47266baso162358966b.3
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 12:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787339375; x=1787944175; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m4AbHNYOybKycCffk+1NRelRi+xxrvqfKKYJ+6qV4UY=;
        b=BJ6Z36jbhziPKplfMzcvHV7AU56iF45AqbBsSpea8A7keRYxV5No/hpR9MIhModTvl
         czh0CB0pHUnn/hITfDLi0hpREthtEr+rd7joZnZbMvcvf5B+bS6OJPq1JJlyY4L6jXCY
         ifKWAtTcCeUlfKQHf6Q28G77DHY4x6uiAFzeF1sQM2c+m0bNlvyXYAOyK8Ycu7zHb7nz
         rsW76UkZFj1QSXCzHm6Dmvx4Pqq1yJ78eVeRuGtSrXv3u33eLMqCfrme+UDXkwngXcYc
         TmXoJAr5355T+vs+rspd/oDdWMcMAxsZQkeK+xGQCM+XOwzKyrhYg3WhEl75rJ8EesKN
         6KTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787339375; x=1787944175;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m4AbHNYOybKycCffk+1NRelRi+xxrvqfKKYJ+6qV4UY=;
        b=pami+i8zXNEdmGfeEWo12z+LTWsno1NO/51kui+b7xA2ZMXpWifYomo41/FKDShSw1
         Ex9CR4TnsmiVexAPTXv90lBk4KPEAgVedRAGJrTGN+kNgjp6HPC37wVvgPiimKA8nKWV
         bUag7/5sMjgsJTsZYAsVMERhqYN64+aj/th1cXJpH+oldY836izBZNbYGUsHTdff7I7f
         fxOcy236rDTKaE7FtuEmNYIGm+wDVVTC3M3+XI7BhjmnjxAqHMMidcCCO7hUTmIsY5QI
         Vc8QDk8BIO9JojQFcl/+0W4IcMOxUuwD4ew41sAH8cIZZQRKK0NYBmDEMwErP9i6Ia+7
         WdWA==
X-Forwarded-Encrypted: i=1; AHgh+RoJeeOURE2UoPb75cBR0snMQbblgP0bk+KnZbc2pvdl5qfTXlne+kPxOEHALGtufc36Jh3tbFUcwkNe4vJn4Ls=@vger.kernel.org
X-Gm-Message-State: AFuF++nTLndJsP7KaGYzRSspDOzwfymLdq8KhNVOR2xzF7nUskHghvQa
	fTUm25Bg9CB3Evh/vXMQ3ryKZASEylHtqqeyqjkZJsJrMA3BTDoiCN5X
X-Gm-Gg: AR+sD13S68tKwD8PbUSmolsLcOJ9Y1ASYN/2OomyRRg4Qu+LmKCegAfmy3uTmv0l1G6
	H1E9i8TnOl9jFNPcSlCB7p3cXU2v0+0bcQzxuIHb4LG8imPm7OnedC0h8nSnXiWA4roehmwWEJO
	UMiIHb1nuvcq/SSsJSomaLDuysrFXaTm824OGaiU9LAk3VOSLu5U6K+HWegUVB1J/Y+hztRiOUY
	/PrsIKmsCpNkwLqj43DNkQAnJLNiBBFy1RTD4fU2SlA8/rZIuwwgjSxLXM3wZujlKaNj+2UJoU4
	E1NArh5DxIEhwOCeBZU1kn+Qk5oNY/zRB4oDjiNTwDJ6P0R4xPjs1y9FI/vtfhepXRzUr7CCe2X
	yVoDX4yn91RKE/p80/TmmLMLlLmh1PDxAhYehHAnIWOHc4lcLW0VdkPCToBVI5MqKFP9o+ibUhM
	Z9rcBOSMXxjP2OqLhfiv2QvJdnAGFneIOzcgQ3sxx2jsh8Ek2kA+B45aGguTthtNTx5yjV3ywcz
	HsKQUDnGWk6inPEs6C2adzsSEC1Zyvscl6AARK+AkySDZO1PDjMl9/VJSGYA6CUWANC1ZO9z9Js
	1khn+f9XFm+toELxgIOIz3lvtY2h/YBPDVuq27GDHrYShTmWYM6nZaRPpy5ZytZuyX/72oL465X
	92w==
X-Received: by 2002:a17:907:97d5:b0:c20:21be:ea75 with SMTP id a640c23a62f3a-c246a33ea8bmr796814866b.8.1787339375197;
        Fri, 21 Aug 2026 12:09:35 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-a103-bf01-4ca5-89c5-9aa3-9754.310.pool.telefonica.de. [2a02:3100:a103:bf01:4ca5:89c5:9aa3:9754])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e2ab2sm584196866b.7.2026.08.21.12.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 12:09:34 -0700 (PDT)
Date: Fri, 21 Aug 2026 21:09:32 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Eric Auger <eric.auger@redhat.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 3/5] KVM: arm64: vgic-v3: Unregister redistributors
 before freeing regions
Message-ID: <aoiiHw4hBHB7C5uL@gmail.com>
References: <20260819224229.82948-1-kmehltretter@gmail.com>
 <20260819224229.82948-4-kmehltretter@gmail.com>
 <874igpp3qm.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874igpp3qm.wl-maz@kernel.org>

On Thu, Aug 20, 2026 at 09:58:57AM +0100, Marc Zyngier wrote:
> The other bit of interest is in __kvm_vgic_vcpu_destroy(), and its
> conditional removal of the RD iodevs. Can't we just get rid of this
> whole block altogether now that we have a saner failing path?

I tested removing that block.
It reintroduces the use-after-free fixed by ae8f8b376102
(“KVM: arm64: Unregister redistributor for failed vCPU creation”).

Karl
