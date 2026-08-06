Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F11546DFF2
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 15:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786028501; cv=pass; b=jyv+/0XsmL12ONQfXrfc50PYOfsn6g26ROeopL2rFaFJa/GIdhUFRWbDGf6H3VbogLAvZ4YJhA00QhMphMx8DZwqp0xkxU/JmNiqNo3kEZFXsSGBq3qh2diEU08STMJBBuOFP/tA5YsngmqXTOGdYmFG8XQk7zlg2KS3wUmnp7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786028501; c=relaxed/simple;
	bh=oOSqs1sW548/Cuc3dzU3OrV/5YuvuK8xDWGm4itDq7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DiNMz/4TlmjvKffui+eM+ocywQ1ap+xBgf/UOqPWoy7IGnkd0Sd4xyARqYeFwquL21EcQnRCSgzmeGEr8GM1yz3TuGX/uq3xXTWNfogV+Vr7cDIai4tpXBWg9iCc5+r8b3+dmFHqGYrALk56I0KYIwl5XXKelvYFdU50MXmXwmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WnYyKuW7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DLpcgRqE; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WnYyKuW7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DLpcgRqE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786028499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oOSqs1sW548/Cuc3dzU3OrV/5YuvuK8xDWGm4itDq7U=;
	b=WnYyKuW7Won9WhyGwPpbDWqhDJA68ceV3x3jmhsOms8gGVO3KQtvfj+ISpdiaO0eBe4MdL
	7u/sFwAqR5aiOv7beaMk/H1OPFZQ2AOdHEhSnZTnF0eS7PKCL87LplCTIKubSAKOsa2uNQ
	NnJR5Nqf4NfXDTMysvat+ezuaMp7c+0=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-m0Xi8augP0CbdnNMNQ1KyQ-1; Thu, 06 Aug 2026 11:01:37 -0400
X-MC-Unique: m0Xi8augP0CbdnNMNQ1KyQ-1
X-Mimecast-MFC-AGG-ID: m0Xi8augP0CbdnNMNQ1KyQ_1786028495
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so2347650a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 08:01:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786028495; cv=none;
        d=google.com; s=arc-20260327;
        b=efzGmm1wwNXgawjcYrK2Iuun6MhoXo6/gZfPXOBlMBbNOXmy3S31V0Z11ufx6Ux5Al
         Ll/UlMEHTQoY4eMnfpj0P69vu/kTCDpwmxix9aRsn7lNOM2gJYdI9GdKOUHKWtmoPHG5
         qiJsjyuAyEYGrPMA/wRU2SPbs5Qj985+e60Fvue07qzMHsiacpDfnOvUbxJ4XJoDtA8B
         9rp4ba0nDxnZrXxJ/QkFKX9N59gWKC6mptP3hbNcouCQ8OCTXdKd2zE5ZnzSPdKiaBgM
         RnCXylbPyIbAIpMLoy8dCk/6Z6XyWpha1V0o/qUX/erS+0zIftlG5zjcARrW1L6zn9GC
         rKoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oOSqs1sW548/Cuc3dzU3OrV/5YuvuK8xDWGm4itDq7U=;
        fh=nn/Pj+7oVuFQe7me//chWovIdtMV9a5vH3S6y9ro1Jo=;
        b=qKT1r3seNnruWei1iR56jKtdbTa58eBlD/5EwA8kvF848duae8snH5LRYwe2EqfmmN
         iaMp3NLIvbYyvZGXW15OY889yJ8+mLISGQq5g4zxK5IDSWiPjW5/8cF2KhK8pPunrtSD
         5mMolpA3FnTCwCmQMspEfQ0k4T7jTc196Djqprne3gagxnpvnixVEcdg6xA6PSzkmgTH
         R+CG1XyXd8UWjoDKAYQN/ap6ZY9EAa2nCIBx6Uma857HyUrlIUzHF6Z39z+jrIYldOpu
         GiODcNg1QtzIGllh63hMl0nWrp2oSzjseMi398EegmeCwOVMFtpiAn/jwsFLDNI9qZLd
         CxJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786028495; x=1786633295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oOSqs1sW548/Cuc3dzU3OrV/5YuvuK8xDWGm4itDq7U=;
        b=DLpcgRqEturwBgFCU+HzWCub20IiyfMCHmud6ogHm3g+g1XROrZFP+bdKP2mvZpZhA
         f+lVuU7DsUUCN9vne/c9qmBQ+SeGnbkFNhjI2VocXzjRQqrymWsG8yfhiubnQ0ZLfyPf
         qqHm9mOhHGn37PRSwM1zleFmTP5km1+Tb4NJRi330H4BYNY0C1kfZoTIIe35f6aB/lcW
         BrmiBR/6gsy0kMKsaF7vABfYe+byVFPHAOjZqLZBme8ubNAKgPwgOkSWeibvhL7ZFBul
         r626d3FLtrUa58VQin9f6KZO8SmVOxSOPsvLIiBv/kcUxD3Ji2kE8p7DDv1GvVArnfdg
         UqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786028495; x=1786633295;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOSqs1sW548/Cuc3dzU3OrV/5YuvuK8xDWGm4itDq7U=;
        b=lYCJgpLQetH312dTn7KlMa94hGXNLsO9HKDY4w05slhooSQeuaBIe2mGkxqbfjABDt
         U7G4wMYXv32FmU5+ziXOyqw4Mx0s/lYfOslC7hMBdLrK/41fiVUzCqlqErDUouknDMLN
         zFCEDEodzkGS2oxOup4RlaM0c84ZS1f5EL1Riqnj/erUyPB0WOAxXYKo3N5J+oYMgWbY
         XGv4yzgeAFqhgc1cnNJ51eini6ZhUJ99BwJIT5FDnKgLxJNmsH+VGn1DwhFh5vNy84wm
         iDoLCdfPtyxo4csnA3l677azV/aPTqr4VdZ6pTOLFyqbhPdyj1VJH0goydSypQO4YqC3
         F/ig==
X-Forwarded-Encrypted: i=1; AHgh+RqMDl8/uvqwjXnXvPViPp+08wP7qOiI3Sve1grMryZKVUv7Y07LdOfNwkmH1PKXxPVOzuR+JeXSz67obE2QP9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN4AskCjr0NnVVfMtivZw1z6vhL/Xqx5RnSmzFPiRAhI2mKJIf
	gCrNRPFeOwxYTIw9BVsIMQ+/F5JmjVYM/uuCRiVdI4FVdj7K3T5XnPf/+UKT8Yi15bWAurf2Fij
	NCh6qe8xV+6XKBnhtAi7g2/JVw7n/kcG+8A1+W9/JWnweEHB46lBjrwV1mXkvfgisYViHE+kXyN
	e19h8pCFYeK9DjAfR12d12mnAryqk2XQzJ0vd2RbOmBxL7
X-Gm-Gg: AR+sD12u7mxPiqJGn33f+xJrH21PrOrbnKIKnVedKRsZ1/6JbojCzKUttm7imJfyGjM
	a3K4n16Ozr2N9JVMWSswrDRBkl40W4IsI+GwAnKx+Ovy6BCHHbd7H3pgXtGptG2uaJH3GVs8Jr3
	bKHM8kTVaa3WM9oQP8XnV3bKMPqPVrWSFaropd3xfpSFFdHeQ2dMdpROUyju2QcYFGLcBdCf+zJ
	r5CigIbllFTarsxDCXfw7iYuu0Jd2ocuiprtYl0uYh+Ky4=
X-Received: by 2002:a05:6a21:4d8e:b0:3c3:875d:705e with SMTP id adf61e73a8af0-3cb85ef8469mr19361324637.19.1786028494738;
        Thu, 06 Aug 2026 08:01:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d8e:b0:3c3:875d:705e with SMTP id
 adf61e73a8af0-3cb85ef8469mr19361176637.19.1786028494022; Thu, 06 Aug 2026
 08:01:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731145914.4014912-1-bgrech@redhat.com> <20260804220108.1630366-1-bgrech@redhat.com>
 <20260806133051.GD51943@horms.kernel.org>
In-Reply-To: <20260806133051.GD51943@horms.kernel.org>
From: Brian Grech <bgrech@redhat.com>
Date: Thu, 6 Aug 2026 10:01:17 -0500
X-Gm-Features: AUfX_mwvYsIaD9uGBwjuzJQqIERzpiGCm3Z5i_KTeNOSR0wl2Rs3bglM_fQNHC4
Message-ID: <CAA835F6Too3TDsPPjHBnYEM6ntxV+aJ8J=JPK-MSz_Hf6YERkA@mail.gmail.com>
Subject: Re: [PATCH] selftests/net: fin_ack_lat: fix latency threshold typo
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org, 
	edumazet@google.com, pabeni@redhat.com, kuba@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

Thank you, yes I can fixup the message and resubmit.


On Thu, Aug 6, 2026 at 8:31=E2=80=AFAM Simon Horman <horms@kernel.org> wrot=
e:
>
> On Tue, Aug 04, 2026 at 05:01:08PM -0500, Brian Grech wrote:
> > The FIN-ACK latency threshold was written as 100000 (100ms) instead
> > of the intended 1000000 (1 second). Connections completing between
> > 100ms and 1 second were incorrectly flagged as high-latency outliers
> > and printed as failures on loaded systems.
> >
> > Add the missing zero to restore the intended 1 second threshold.
> >
> > Signed-off-by: Brian Grech <bgrech@redhat.com>
> > ---
> > v2: Added missing maintainer CCs
>
> Hi Brian,
>
> It might be nice to include some information on why 1s is intended.
> But I don't think that is strictly necessary.
>
> Also, if this is a fix to be backported (I am unsure) then
> it should have a Fixes tag and be targeted at the net branch.
>
> The above notwithstanding, this looks good to me.
>
> Reviewed-by: Simon Horman <horms@kernel.org>
>


--=20

-Brian

