Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8D8322DD6
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 20:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770237957; cv=none; b=IF2ggjNXqCD/aTNKIIJYqBcMCPhYfpOlpifsZqTMLU56xFgOWqARgd5nsIU3D/M58gCRXzxupv0pvBKKPkfWSVIZNzEc2KhauoksEhv5R6eqFYD4Cc5cb+n7e/vCIg4PIxM8/n84qUPrOIb9EI194Ggj3cGFWCcNXQzDSWhl6Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770237957; c=relaxed/simple;
	bh=+ZPlCLyFbv56EWcS4ecmR/INDwI/6I9mXAdIgZj9ob8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=uxg3C7zwi/j6IV0IIkGYANTf0S1KZwkUGFQ6b3/mNH3+V7az8kIqezn0R1+dnBKZSoyev54MDr4Gtlzd2B7J09gkmyg+HKXv+iG6oCjh63BVwKxMi0dHVQHzKXALAxkjIs1fPF7Ep+Iu88u+AaGq93ggP7KNMchx+Bo2nUFuCtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PX/x6/pB; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PX/x6/pB"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-794ed669269so4945887b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 12:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770237956; x=1770842756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmhmeFhOmptzVfU8Ket2zRg/1yOdaQIeRxT7DL1GOYw=;
        b=PX/x6/pBMHut4DD9SVXKYhgECFLfzhOyMpGjAB287Bmag2kptOsbFFG7FzadD4UGB9
         v+ei0TYEOoh/VV/uTREH6QKuxD7jP+Iiy+E4P2CVxiw29qp4qogNOb/JHkYs2oiwtkxR
         BJ3iZEavABcNmrRZgM3m5SwQmHNDMzaZUYSFWOTMTCRT0WkVvPh/5iSTjJRnINqJNFXV
         C2ZflabbN/pVckd1k2p01dymvLHbV6VR3lTIjg6oSwWncRv6m9JXOlHaR+GTw2t1NxoS
         sFZUsf4EMkca9NXpOXmunug0dkluTni+yHmfAX7hZnbpVACRYTq6KzU1BWrTJWwAQ7mp
         vaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770237956; x=1770842756;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BmhmeFhOmptzVfU8Ket2zRg/1yOdaQIeRxT7DL1GOYw=;
        b=q6Hi4bpBonMwrmADfZvp8zhhMG87kDfsJOysjN3BWgi8/LS7zx97yxhNpar0AbbQSM
         C5kapQyhZk1yb83eMcEP94wT1jVxyHP76OtOD0TqF1uVpLBeSGNNrPp/FyIkzg+dT3BA
         Em11EgZtZlNIDu3GCUF6HCLAc/VnltS4OEq7cF2OrN+9+cLMYQeyM0m92IjsiCdxEE8U
         dNCTO+e17nQqTf7kJQFZMVmnWgZgwlyrntN05IMPwG75O6olpY2Y0sZVn04+5C4efxZA
         +OFl5ZqtbpnQ6X7bcU6MSrR5nScsEJD28Ixns9yCleLVjtybCUwcJ/SfSyWU+4OAFOhj
         ffXw==
X-Forwarded-Encrypted: i=1; AJvYcCUh980Sf4iN7KR0I6F/z3oZVz2UAwJQh4wjrpXiBS1Fxh9iebCakEsj/cL41SAXQOb+rK5f1lGvVQiOSHqwKm0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs/GIbVfgkN4DYOu3HiHzZYnJKZkPspbHF3zxxEtyywwQqedPE
	0tnr7V8klYe4T0SrFNZNV+I1f9ZjUNqDUkefh91iE8/j0EaVanG/fGJn
X-Gm-Gg: AZuq6aKaSRwONztfcpIr7xZeVqMDTAejqwf10fBC47GwHzpfK3nRa3A2YpvoJ2/ELZP
	1EReT7qtsdCBZakFRq1v0FBx1gXck2bmmS11ukJ7O91Co/TbuC3pRjH8rQ7H8HU/6Oo75/jemgX
	PIrdRTBIaU78WEJMVsBGLl/fQZwGhMeIrKlCeS94QLuSXFhMZ/wOYDX5LOJ8j/g/F5gcMn2V52j
	QX/aatW6wmHahM/b5nmXBVkzCHrY1IAJcbOsZCQR1h4WvX5PJsDhgvCjP/Mne1ZRxiTkNZd2Fl7
	VmDPt3WvcFDd3RtQBEfoeWRzgVlQMVSPumuL9J4Q3NM6pcJzEeMPP+DRdqBmbV3liui/at4fV4E
	9Gultv8GEMUcAhyVOQzLVj5ox9fBq8HQC4BAbJuIdG8+vUfLEm7H/fg0FTX+QSXJajXHtbfe/bv
	j+F0BEeAVxfYmpxdv3+sNDX6Eowm10muvutO44zPOGIFmrrNnLv8iLkw2oMgs=
X-Received: by 2002:a05:690c:c50d:b0:794:d9f0:2375 with SMTP id 00721157ae682-7951501ef63mr5799507b3.0.1770237956288;
        Wed, 04 Feb 2026 12:45:56 -0800 (PST)
Received: from gmail.com (21.33.48.34.bc.googleusercontent.com. [34.48.33.21])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-794fee8294csm30725247b3.2.2026.02.04.12.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 12:45:55 -0800 (PST)
Date: Wed, 04 Feb 2026 15:45:54 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Boris Pismenny <borisp@nvidia.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, 
 Leon Romanovsky <leon@kernel.org>, 
 Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Daniel Zahka <daniel.zahka@gmail.com>
Message-ID: <willemdebruijn.kernel.37bf21c78aadd@gmail.com>
In-Reply-To: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
References: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
Subject: Re: [PATCH net-next 0/9] psp: support rekeying psp protected tcp
 connections
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Daniel Zahka wrote:
> The PSP architecture spec specifies the need for rekeying connections
> in the event of a device key rotation. After a device key rotation has
> occurred, a new rx derived key needs to be generated and sent out to
> the other end of the connection sometime before the next device key
> rotation occurs.
> 
> Because PSP connections involve two different keys at each endpoint,
> one for decrypting ingress traffic, and one for encrypting egress
> traffic, there are two types of rekeying events that need to be
> supported. From the perspective of one endpoint of the connection:
> 
> 1. rx rekey: we need to allocate a new spi and decryption key on the
> current device key to provide to our peer.
> 
> 2. tx rekey: our peer has provided us with a new spi + encryption key
> pair which we should use for encrypting traffic immediately.
> 
> In the case of rx rekeying, there is a period where it makes sense to
> accept packets authenticated from either the previous or current
> spi. To deal with that we allow a socket to keep a chain of a max of
> two psp assocs at any time. If authentication state does not match the
> most recent assoc, the previous one will be tried.
> 
> In the case of tx rekeying, as soon as we install the new tx key, we
> have no use for the previous one, and it can be disposed of
> immediately.

So this defines a rekey event as an instant in time. An alternative
choice is to rekey at a specific seqno.

The difference matters only for retransmits.

Not sure there is a strong reason for either. But probably good to
state the choice explicitly.

> The only catch, is in the case where hw uses a key handle
> in tx descriptor state (as opposed to inlining the key directly). If
> this is the case, psp core needs to be sure that any of these
> unaccounted for references to key state are gone by the time it tries
> to sync a deleted key to hw.
> 
> To deal with this race condition, the series includes a driver api for
> implementing deferred tx key deletion, where the driver can signal
> back to the core when it is safe to dispose of old tx keys.
> 
> Lastly, some test cases for rekeying are included that go through key
> rotations and rekeying.

Still reading the code, first pass only.
