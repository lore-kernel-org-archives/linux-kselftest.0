Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6912437C108
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 11:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772106961; cv=none; b=qP2L37FmLzY3HjCEt4dCBjcoaM9zNo6SBevK7EwvYyyvg3wEJLCMZRBGr//OXoUYXRbPEBJHRmeEHX64uLgPvrQU5o1WL6yemVqCaSIxzSIYt7YuhNekCtUPhTampotxdCp+4iLYS79wPENx0Rj1vmdJGO4LVgk2wVwvkrdm5JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772106961; c=relaxed/simple;
	bh=ZEIFoitANPtwulIbNXF/2yg+hzs1jJsGnxSrJ2pHJVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nrzTaa5E4L9B29Dth8Sh9sG/6luw/fpW9KiQaiDnBnllhnZ7vmaFwxHOK95MhyozkO/YybmCnpgCwyoupX0jbvsJ13sMkQwP2xmkSsCgj18ChNRBgib67x3cSWTeYIIQKXCyFDyauJugQvbYn7X7JwiXZj62LArSOLaiE1PzBJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f54+23AY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=shpmifPT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f54+23AY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="shpmifPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772106955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMPGt0J++KNAhRXBcWxcdK49BwEppu2ya9w3VAKm/mg=;
	b=f54+23AYSfYCM3yNXvVjZAySO619oyO3/kJa4wNnybPCoDdFMV3zbbdPAzliqsSpvPO7sT
	r0sOo79IQ7q+d4wZ5wZ03Lewv1jUEl7/C2xkjLhSgIJjRDEaMiVGqnbVFrhap/0Mrzy71F
	xBwqjgW+1E/9GkusedFz9mcw0aHGmCQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-29yRYmyuMlqECSYgkcHMSw-1; Thu, 26 Feb 2026 06:55:53 -0500
X-MC-Unique: 29yRYmyuMlqECSYgkcHMSw-1
X-Mimecast-MFC-AGG-ID: 29yRYmyuMlqECSYgkcHMSw_1772106951
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-483a2db68caso5886975e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 03:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772106951; x=1772711751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sMPGt0J++KNAhRXBcWxcdK49BwEppu2ya9w3VAKm/mg=;
        b=shpmifPToUG29nZKqBKmEBVphlt6mesOyCoX4UaukpdSs2EdIOfJfJ4pPrk4foy0L4
         QQHRb9QA42FW2bzLUIenvnlnfYl6/XEUvv0oJlU1x9P5PDxLmunPr7xwrV9a2a4b3b3X
         g6Fy1x44OyG6M2FwTbJ7sXIfbVCOyjl+TQnp8pD+5trXk820yhEfs12xM+WyimYdzv6B
         jh6iY6x4w6DHv+dX2fVcdp8WTT5+9QqBtgV4J5+oPn2ABT+EAM2Ta5TkGXYQJtGWSv8a
         Yc6W63G7GCYoG8jr7poxEePsMr2lKKWg7BJ37hS6IOk6lMb41/TbT29nWLFh0WVNAdYl
         ERcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772106951; x=1772711751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMPGt0J++KNAhRXBcWxcdK49BwEppu2ya9w3VAKm/mg=;
        b=fKgaCaQ4LxbuPA9TqijJoMXJVpGWgNi0fufUvAwcWsf44yNQPdasFY+U9J26yI+Q6i
         nFyZlNFDGmkFGPQY+k9kMm0FlMu9OjctIXfePXKCwucDFP9nTlAIL0s6Psi0xfbHmJFZ
         lmQprTDv32Kn4ySSQ3xdzjPuW/uWWDfHURtXPEiNhucc+WZN5irj1rz4v2qKZZSmOu36
         l+gCf11pQqHViae69/WzqHv/1kJ9xz8it9e2lFvA5yajwL0aVctVTWQjjcfh4Hnpdb2U
         QTE2PX3eWNEDKoWSVLhcTdjhbIglCev1E6xJgVZoVOs5YSUv7r8Lckb2EcB/UGm4zEPy
         EWLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2oxzs7vhDReTL3jtm73W2usmFIR7gWzXQqj9cV6ZEUpvTp3VFwM8hTcME32edCT7PLwhx+mPpeRBsaymVmZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxteVSnAfCsA/b77AJSjNMCf5S2YpUPLVlO/O2wcZnLNmEB1XAy
	QQ9gOsgIOEXaR6unxm1LHjiZo8UkYNf9jWZa2A7am36O6/uA3Uvj5JVkw2S1RCAVwGMSaVIeZph
	MayuhjZSeAXX8d4e1acX44PO8uwiYtidfFCR0AVeY4iUfZBdGRxL4W5vOYVTqm72f5r0kiQ==
X-Gm-Gg: ATEYQzxQ+n00QVzSMWD1cjZQeZlXlzB36EN8sUsc0Y7jgJE5D5z6ViAQfzNXwHon6Xw
	Smhs/9NdYmsp/eT+ehV0Z3avhfCwF3NlWJjh2YbtlmeK0Jdse1V+pTTVEaiK5SAIeWqUkI1Oy3M
	pB6cdIpvWxRDHBggjbXocr6CTYRrMg9uqCp/PB+qlxt1a+kEJUKEV3f1TiNDYNAaWCTHBqJNw2Z
	oTim37vYsng1oyHgtp4ogdaDVxE2L8dxvrD5F0Bh2LodRi0lX+H8gq6pYYPLy+CodIendTouMXr
	egmQmjWbCXnUM6ALvMZWBdA/Nl/KQ4fdGCkkZ/mnVIzESH4ZGZo+lNuKw2XcTp0K9pk81DSflJ2
	N/cqhH9XJpD/5bsofccCFx8WeWg==
X-Received: by 2002:a05:600c:6296:b0:483:3380:ca11 with SMTP id 5b1f17b1804b1-483c3df7964mr30951275e9.33.1772106951082;
        Thu, 26 Feb 2026 03:55:51 -0800 (PST)
X-Received: by 2002:a05:600c:6296:b0:483:3380:ca11 with SMTP id 5b1f17b1804b1-483c3df7964mr30950955e9.33.1772106950671;
        Thu, 26 Feb 2026 03:55:50 -0800 (PST)
Received: from [192.168.88.32] ([212.105.149.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcb9b97sm57567165e9.7.2026.02.26.03.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 03:55:50 -0800 (PST)
Message-ID: <4f497c2f-d086-46ae-bad7-44285bc34a2a@redhat.com>
Date: Thu, 26 Feb 2026 12:55:48 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 net-next 0/3] bonding: fix 802.3ad churn machine and
 port state issues
To: Hangbin Liu <liuhangbin@gmail.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Mahesh Bandewar <maheshb@google.com>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
References: <20260114064921.57686-1-liuhangbin@gmail.com>
 <aX_6jyAQaDoqsR3G@fedora> <39c1b386-e6ee-46fc-a653-f86fa21e9e9e@redhat.com>
 <aZuzn-6vFrcoD9RW@fedora>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <aZuzn-6vFrcoD9RW@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/23/26 2:55 AM, Hangbin Liu wrote:
> I'm not sure what I should do for this patch set. Should I re-post to net-next or net?

Jakub and me discussed the topic off-list and the current agreement is
repost for  'net', with fixes tag.

Thanks for your patience.

/P

