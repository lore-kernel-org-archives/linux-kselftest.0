Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF27158DCF
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Feb 2026 20:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772310622; cv=none; b=mCnL9E06C5M554N5ayztU5RKp+uQ4ZOro33tXzVaEdwHDTWAvy3549GpUMikkCc6JCvJq580IMmHx+VdHB5A5e5/vaZ1WiU4umnDotq0YmfIdurJ7ykJKpiD28z1yn5sMVMvbrCL9WBKtnEIreVPf0R39/t7iR6kf+5h0Jko3vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772310622; c=relaxed/simple;
	bh=4074zt5bpOL7TolVuAmUfn+0Hry0Ban+kCkioaWnFBU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=NPJ5EEXr2RPg1z1mwnWc75IUaaV++PA/DXeGMq+Ye/Lsatmd47uXn2p8JUZMlnRrISpuhMHHMkNqCtwr8Ju07wEggaJ/YDOqL0hyXUcVnzGmanicVIU2iVvYJ3hIfBYbf3H2d3xwax3BelGk1XiPw3HzRbQk7ha3SXdJ+hjas3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BP6YHsWi; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BP6YHsWi"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79860421382so28886867b3.0
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Feb 2026 12:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772310619; x=1772915419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4/PHgdImLU0t3MEoKpGi0JejsOQalQw+IM1APjX0G8=;
        b=BP6YHsWiFXhzch2YEk91ocxwBJT/kwZCsQonTbjsDFaF4yWirHFh8LmCPydmnWNCTh
         j4Zfkrg9nMDZAEh2AN0nZ/TBP3KEMMEIeXGU97Rjba005ofhAqENWfHHvPc9mDVbFXYe
         jmFamEhw/Dfy/+pBmLNNk41gXz9vMtrsNfaieaTXJ86SoAhcjY87y4rOvmHCTzW85LWc
         76ibhA2i/o7sL5HPeX8JPSf3l1nHyAHF/fa/xV1FMIG3aMfMxeGv0dSVlxhTCwaLumxZ
         rSwYTpFoGXKSIauLz2AlwwuOD307i/F9joUzTJwW9njlQha9f3pn+2mJ206Ozn9LIPLh
         ijlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772310619; x=1772915419;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P4/PHgdImLU0t3MEoKpGi0JejsOQalQw+IM1APjX0G8=;
        b=iLOFnsPdSBse1bk7Rt/7kftxHurUimN7iM/pLTE/ZECSPs6dPZ7eDScdKCN1bHjvmj
         WQpVw0HUdv9ey4tEuHe0HFaJ+t5IfTlBnOXz48mYVCAAOPPlc+/IVD6AQhBM+PHXDQHP
         1KBDfW2I0YEpBmIaOm7DxaBW6/3Lywbt9Y4yU4Q43utCFe3JwwywLJFlr7SxLqD6MkZp
         dDWSpoz6UvQgf16QEfiDO1jcyBymQDUzj1b5KgVKAMlEOaF4PvW5pFmpnjmKBUvTfHZ9
         vkirJctXGOeFtlHPXYpNKu4r+YsL55xm/4526AGh0ps2KJOa44CWl0iIXRLjjtHNCrjh
         mQkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA2ZPCf1kVWnsoNk2Cb+Jg/u+6jzq+UUI7pZsaMi9PDgdDXuNLmFaDzg5ybPL/ecZWwrZKq5a59Xlan7+h3Yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTbdEL9NviCF76gCrrXWlLheDlLMnb62Y8bb5eK6GPNVRI9J3f
	C3hmct/usLUxCJyUphnNlnuTT9HpBf45mpy9NlXhA+52fWFg+Ih2vOir
X-Gm-Gg: ATEYQzxP9IfJyiBOQ95pCG/YSlbmEFeJ5aU9gQ99nsdfzmTLPhIGU1X6Un5Tj6SXzZa
	m7yxC9TjQyFdGd3Rn3vqrZXU1E1c4/FwgEK0M4OpjRWoaxb4H/QNa2dK5yLIweM6TOpSk+KKE57
	tgEcHd2MLcYvkfKDPBMRUTJwn+aSKqyu4c0HcJerXnZAo7SfUMNzVRUdILSrZ9YOB/iHaiNUsu/
	EAjC+TZBYnNPVSBozObJ74zYAwDLmVNtYGV9FZ4TgiJnAovyAgQC5s1gfLnvXOPVsPuMt77pEQu
	Ffl7RJ/JGZzKxvLyVnrpqMHw4qkuXjYd6b0ZEXleb1ZqiC5jvYAtZFOuawhvUWsaMCiA5sbbMQH
	givw72S1vwa3+XR0g+ph/QCwlyagp1wJ1Ir55TAuasngPwL3G110dEVI/r14pPvnFePwiR0G4TE
	tGY3g5VQA7Cwq0QoO8/cxQy70a9VqyzOvkEBzwacwit5AKMorgwRApuEafYdi7MNFcCt2qrFmtW
	CJJ6kDoEw==
X-Received: by 2002:a05:690c:f06:b0:798:3051:2f06 with SMTP id 00721157ae682-7988561d674mr73559807b3.53.1772310619559;
        Sat, 28 Feb 2026 12:30:19 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-79876ac7505sm34314707b3.14.2026.02.28.12.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 12:30:18 -0800 (PST)
Date: Sat, 28 Feb 2026 15:30:18 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Kiran Kella <kiran.kella@broadcom.com>, 
 willemb@google.com, 
 davem@davemloft.net, 
 edumazet@google.com, 
 daniel.zahka@gmail.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 shuah@kernel.org, 
 linux-kselftest@vger.kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 jayakrishnan.udayavarma@broadcom.com, 
 ajit.khaparde@broadcom.com, 
 akhilesh.samineni@broadcom.com
Message-ID: <willemdebruijn.kernel.c17952a3eaa4@gmail.com>
In-Reply-To: <20260228121034.48c2d282@kernel.org>
References: <20260226184654.3180648-1-kiran.kella@broadcom.com>
 <20260226184654.3180648-2-kiran.kella@broadcom.com>
 <20260228100449.19f6ef13@kernel.org>
 <willemdebruijn.kernel.1c3d7105f1c48@gmail.com>
 <20260228121034.48c2d282@kernel.org>
Subject: Re: [net-next, v3 1/2] psp: Support for transmit on logical device
 when the underlying transport device supports PSP.
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> On Sat, 28 Feb 2026 14:46:28 -0500 Willem de Bruijn wrote:
> > Jakub Kicinski wrote:
> > > On Thu, 26 Feb 2026 10:46:53 -0800 Kiran Kella wrote:  
> > > > This is achieved by propagating the psp_dev from the lower device
> > > > to the upper devices in the device stack via a netdevice notifier.
> > > > The lowest device owns the psp_dev pointer while the upper devices
> > > > just borrow the pointer. When the lower device is unlinked, the
> > > > borrowed pointer is cleared in the upper device.
> > > > Assumption being that psp_dev is set on the lowest device before
> > > > any upper devices are stacked on that lowest device.  
> > > 
> > > As I mentioned in the other thread I'd like to establish some clear
> > > expectation on where psd propagates automatically and where it doesn't.
> > > I don't want to see a stream of patches that say "fix propagating PSP
> > > onto X upper". And conversely report saying "PSP got propagated but
> > > it doesn't actually work" (macvlan in bridge mode etc).
> > > 
> > > Hence my preference was to require the user who created the device
> > > to propagate PSP. Willem, WDYT?  
> > 
> > Can you give a bit more detail what you have in mind?
> > 
> > An explicit user (netlink) API to associate a psp_dev with a
> > net_device?
> 
> Yes:
> https://lore.kernel.org/all/20260224002410.1553838-7-weibunny@fb.com/

I see. Yes, fair to ask for an explicit sensible policy.

It would be nice if PSP could transparently be enabled on upper
devices, similar to dev->features.

But this quickly runs into practical questions like when and how can a
bonding device with multiple independent lower devices support PSP?

dev->features also has type specific carve-outs for upper types, such
as vlan_features and hw_enc_features. We probably don't want to
introduce the same for PSP.
