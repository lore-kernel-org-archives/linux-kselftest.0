Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074889;
	b=ZlePRBZPSwtjaeo75ZM2Qn5ijzVp1S1P8Sw2dV3Q0btpCrEbKQyorfOLsfpAGUIrrEzZ
	 VUP6TtapwUyrzuwQbAxn1PeY1Xj59+CloGM0rWEqiG2mQXgjx5Wg3K4u11AoT6PIVwdjC
	 D3nctyTTVEqa9KgL1UHZLtxI1T1zZj7YVkfdJ27G9Ai2nwYSwMOr1uy2M8K21JT3NWNPG
	 kqzoGd9WquNSzHHVMC11ezP83HaWDTnrt/u5LjEaZSg5jmVNT3vjxNjuN/+3ADBMoDb9v
	 jkjm45qut7KA+2A0wYkdIUvDInw8+617febeS8qVVbjnY2o2sF89GsH6RXI4+44s5XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074889;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+H4AVHAkxU3vkubZcic9ja82r8a7H7wKS0//pc/pxSA=;
	b=TCkQQw1Vjc/VP6yX2o+soH+f4gFiXty9+v9H1SkFm/MPO+WTPv8Lcv/Ek/ORGorVMM6b
	 ZUCZRVs3zK5X3c9ZAZ5M4szwpf7CmGYUX8kwh6eteIsefWbh45kQ9RVkUe2kvA9X4GPN0
	 Zye0UPxusiAmtL4lTWJKh85FDnuDsPQ+gLWnqKISr7aNr9uIiGDCCI+ZhIVIAg6W4Tbrl
	 TJq4DIDb9CrmZ3f/2kgJshWhFBMKlCzdpNM1CacCR2y/XdpLxhZfmeozZYCDZaYPCHx7X
	 3nmyrWdAMkNxSKz+6cS60SiLa1QQCbK5+F2J+g7xSry7UN11KTXHhVOi8ccDn40Zv4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="PLyB/oPQ";
	arc=none smtp.remote-ip=95.215.58.239
Received: from mta1.migadu.com (out-239.mta1.migadu.com [95.215.58.239])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2877606A320
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 07:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2877606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PLyB/oPQ
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IUkhtioo34/vN9L4UPndwkkOKppLGI8BNNMRdeeG/sE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795074886; v=1; x=1795679686;
 b=PLyB/oPQ9b6eLgD2g4wfOAop/YJ3tndisoVwN/4RLy8pXxweh/I0WEEbonehvrFoMu8DNRC1
 QmzFf0xpR0hzCiex8dhBkp/VFSV+Jds55mQqkMdhHHQucBTMc5+wOqlrJQIFsKNUu0WqTR2BBGM
 WJhHlzGz+Uo8vnrW+vhg+lsg=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b22ea52e78a566f4;
	Thu, 19 Nov 2026 07:54:46 +0000
X-Mizu-Trace-ID: b22ea52e78a566f4
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so5876e87.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 23:54:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHRhpUBZpplXYrjzhkZ4ItnwXWWkQyBdd3iXjOU86h2FqcQrdwvtMUlBCyCne7S8dtAXWCVlSuUd/4JWRZB6U0=@vger.kernel.org
X-Gm-Message-State: APuU4Z++cjTaO4lUTEZLUkZ4a5rRDvzDbnt16tyoBZe1Z2jfTO9dL5Hj
	HKIsNEJBt4Ip6a1a9on9ACQWiqVFuM1QCcysRyy/ICIaTX1L8Lr/6z1L6THAkzHSC00HQimIAHd
	q35yMXaMTqOGM9qFLQqth56JF/N0Ljbre+FTdsbTB
X-Received: by 2002:a05:6512:3d20:b0:5c1:ac33:5a4a with SMTP id
 2adb3069b0e04-5c1b67303bcmr26361e87.14.1795074884909; Wed, 18 Nov 2026
 23:54:44 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117074428.7544-1-fuad.tabba@linux.dev> <20261117074428.7544-2-fuad.tabba@linux.dev>
 <avxfgWNePsGPK9mm@gremlin> <CA+EHjTzUrDxLSMEo6X66XhKtQ-=ew3zZhMdFWR6U9Ga17WLWkw@mail.gmail.com>
 <av5CBjbeidUUWiLq@seanjc-mac.roam.internal>
In-Reply-To: <av5CBjbeidUUWiLq@seanjc-mac.roam.internal>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 19 Nov 2026 07:54:08 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwdkbx=1yQNP5=-BhE=S0uaoQnO3F-83d2WbYC=j9fd6A@mail.gmail.com>
X-Gm-Features: AclHuK9mtkqv6V--RBoHl1Fg-Xb2-fd2-ZgaHzAt1DD9Kl83ENlFhqESP2uZHtY
Message-ID: <CA+EHjTwdkbx=1yQNP5=-BhE=S0uaoQnO3F-83d2WbYC=j9fd6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: Stop KVM_PRE_FAULT_MEMORY when the vCPU's
 dirty ring is full
To: Sean Christopherson <seanjc@google.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sean,

On Thu, 19 Nov 2026 at 00:25, Sean Christopherson <seanjc@google.com> wrote:
[...]
> > > Maybe worth mentioning the exit_reason thing if we keep this arch-generic?
> >
> > Sure, I'll document that userspace should complete a pending exit with
> > KVM_RUN before it pre-faults on that vCPU.
>
> If we're going to do a documentation update, I vote to keep it vague and scary,
> otherwise readers might think the exception proves the rule.  I.e. if we say
> that KVM_PRE_FAULT_MEMORY isn't supported, then userspace might think all other
> ioctls are safe, which is most definitely not the case.  E.g. something like

I'll go with that in v3.

Thanks,
/fuad
