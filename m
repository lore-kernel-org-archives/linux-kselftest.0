Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181702FBE1F
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 00:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569105; cv=pass; b=t6Pf3wE8JZ1UzZXAqFNczIHoF3YUKlja17Uu4e3yyBDO/ciCA8UI1fck+y+jPvOGIvymEb380mWT4A7RqD+0/292DUpwVxsnT5mqP8H4KGqpNRiHyo/8xS/n/49csHiGVoQq2fiuCB9qUWXueUdGF3lTg9tJik5LlxO0ui9ieBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569105; c=relaxed/simple;
	bh=DW6wbmUxstvUjLcrpQZmIK9RqXPWAOU7XHIXv6Rvtno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tgVmjqNud6OmOZkpcSAgbVdk5Ri3wf7YBQf+rCKKOQXDn59LyABP/+H6rV2KnoMuskH7Y63Me6tsdGTx4E87S7cjfEVjLbFyIyhYFD3nOpM6E4430lCevAOlfxbcUPAJH4v2BQuPfsw0sWs1yW2jC0R1J3oGIYXDRMOXGwMov98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OyI9fs46; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OyI9fs46"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fd8d88so2668a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 17:45:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788569102; cv=none;
        d=google.com; s=arc-20260327;
        b=PoKxj8i4Y3Wg6yPO+OjnDomT+yFMjPcpz0mQ3+uLjliaTyZyvX3XuZZv5fgAgddIeh
         RYbhawNsxDUxpJZTBbXQ3PVH+VUgUeYcTnyV16+KvMGD992IbQsPu6pphlNIYt5rckCt
         OprHgLhMX5L9qd6RUbHRWjUUetZtC0rNGkdkujeishRAuLYQDI6zkepr904VarU5+6Gh
         227io7LHOHgKWuZp/xXd0bj55pkYZUfEAl9Ci+O9waOImOCkYenaHZua1whECOujPOIw
         dzTc+cMBmhvX2xjPiDZU0NPxb2nW4KSMYmKY529Z6c1dWIsuYfeZldUgSZlH7OYd3u0p
         RvxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P0qdXiSaaoLWSkRGl4kXPpi2MGKhx4sNOFo2eMkbT7Q=;
        fh=gqe4TIO97ZvA87yZvKqrutT8Iwygx8xTf6UmgHCtk3M=;
        b=sQxAEaU0Qrac7g8elQitz4kWLLGZixFvRJMTtUZPJiPZ3JpTaAo5IKG05FGfhrZdmZ
         a8xVbAequfwIsAhIX66Is3g0nYySXiDng0Vtgosgiv8R/2Xs6JhahIxMvtzmb7EDgadT
         7Rvs0Sw9GojMTv/manohoNkpPXgm0QmjA4sJJhpH2mADn6zwZJ33e4F9zcqlqI2hu/lZ
         3/HwJGHF+ntGvbSRnSwsHSkwcayBCldZ1bzuaDf419Uwj3zA9ABzwwoK3N639l6S7sXP
         lqzzQ0QiWSajA9xolOuxOGirJ6xeGB82ZscpianRPmRpOM6m44M/C3DxgQmcuGlzmJnl
         W9dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788569102; x=1789173902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P0qdXiSaaoLWSkRGl4kXPpi2MGKhx4sNOFo2eMkbT7Q=;
        b=OyI9fs46s9KMNJD7zN0urJ2M2pLl4IzvJarbo0V33R8l8ylqpl+3wEZEfwkXElkoz4
         21yBThMXt8LoGu3v2xbogXWB9+B+xIUmd8M/qipodHejCfYlyS8hdfd62LlEOOk+xqSg
         ly5l3fjwbyDs8MRaKow1+6UyH/NQ72+RU31PfGmrCT41jPfib50DlRzDqjW5Gn2067sa
         w8paSdpGcdO9f1XEM18/kNr+aGlRQOm04nKJar490EwIxSOa2dFCDem/CHTj7Vs6hISm
         EMtPPDpVU2jexo2y48QtYW0/C9aJ81cO9p3gTrvVpLoFx7ILMVH35lVkRYv9HbJlrs6k
         BkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788569102; x=1789173902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0qdXiSaaoLWSkRGl4kXPpi2MGKhx4sNOFo2eMkbT7Q=;
        b=sEKzPhse1GQWxTLwoni9wGbi2ReQDm+lt0Z8h3t0dFMwqKaK74MfIXD/i3EnJ7X1ol
         zu4VB9/Ys9EhcMCpxH0RLJKjNDuZUkbMKrfe7A6KtMHSiXLBET1Q6vXUKxhEpIt2cNiv
         dQEdn4UU2BBywoyY5jKS7cNLoxrv/ZI60GFjQ0WbZwKsmx71bqj48t/feqFwQs1eUVc7
         lDxzH+Vl+via3aKpr1T4+ZMTywa7ntu0SSer/A6PQvirJvS0B17MgxImRhJluPfn4c2l
         fdue0DQvyKyZF85ClVlfk0rb1N3kKt1E1fUuhKA0eUCN8KyjX/fehRPq+2OWxTlZqlNg
         KNgg==
X-Forwarded-Encrypted: i=1; AKwUvBydVQ1fzhkMVDqfUOBMMR9rh5WD2A4OKWp1wpNX0slRqDUgzU3QBKXYSBFqfodJfyBY/mVVrbhTqcx5wYtbtBo=@vger.kernel.org
X-Gm-Message-State: AFuF++kjXTUGqGv8m5TmfNckp64xjAJl1CC1+3Kk6p017GKW0B47W1O/
	epj7mO86bHy3CrFrJhiwQsROSARL2ph3H0k2v5em2LnIpAsBYa7m2EaCBif21a55Gu9oNjdlUsa
	qxP5jyz+U1/A8KWq0ibuumdEt/UmDehiQcxwyoorU
X-Gm-Gg: AYBFou1yTDrn7ecOq0QRXkNFpVDX9w1eUlKl4QXvguulS5YuHXUUHcaLSMGOjS679gG
	+1Q6Z6TGC95kt4kxGRVm3RRJ8kQj19IreVMY+YGRUACYrdUREthubuUtoRImNI7gXXem/QaTUw2
	w3f3Xl2u6FlZ+DZNAvnA83OYou7D1DlD9108WxLgvTGik9PvreKZ048bhtjAlsRvqId4U2KcScl
	wHvueR2Gt2Znab9l2iiJDunmTQhEB+zTOD2oCeHouhTYmMQyVe9fChWSYICawYG+MWUA8OOIBxn
	9iQmT1Psf0oD3M/pyjRYYNVQdrLUwZqQKbG8zL5+xy7OGJ1GgL1dqfE=
X-Received: by 2002:a05:6402:1a4c:b0:6a6:9d10:f52b with SMTP id
 4fb4d7f45d1cf-6a7f682636amr13303a12.12.1788569101906; Fri, 04 Sep 2026
 17:45:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824123954.315112-1-zhang_wei@open-hieco.net> <20260824123954.315112-8-zhang_wei@open-hieco.net>
In-Reply-To: <20260824123954.315112-8-zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 4 Sep 2026 17:44:47 -0700
X-Gm-Features: AcwNN1UZwSKJ9MC3qwJwI8ljAn8Hu3imGZF6CsHrJI6l7M3IeDffrx60t7WpNbE
Message-ID: <CALMp9eSTK_m4XMyBk2U10dhQo-ve+M8CmToVyFcS40o7RoSX7A@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] KVM: nSVM: Advertise DecodeAssists to L1
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 5:40=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> Advertise DecodeAssists to L1 now that KVM virtualizes the
> guest-visible DecodeAssist state in VMCB12: EXITINFO1 decode data for
> MOV CR/DR, INTn, and INVLPG exits, plus instruction bytes for nested
> page faults and intercepted #PF exits.  INVLPGA's linear address remains
> available directly from the saved guest rAX, as required by the APM.
>
> Expose the feature only when supported by hardware, as KVM still relies
> on hardware DecodeAssists for VM-Exits that are reflected directly from
> L2.
>
> With DecodeAssists exposed, QEMU configurations that require the feature
> (e.g. "-cpu ...,+decodeassists,...,enforce") are no longer rejected.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>

Once the implementation issues are addressed...

Reviewed-by: Jim Mattson <jmattson@google.com>
