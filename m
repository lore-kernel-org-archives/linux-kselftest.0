Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA9C3CC7F1
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 12:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366881; cv=none; b=bqdx0kFbRjefEN+6KsQtklfq1uuRBMQubOGWlscPa+av0MZiQ3B26C1yCIUh2fma2+jRdXHo3YX/9s8Pk7WECz3j2e2qaxZphOBwOPSNXqN9MYempdMIpFeVeBUYx2gLegyIwjDiowwSy6c5WhrNPLMIjrbVgHEJXE1umxqywmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366881; c=relaxed/simple;
	bh=OIWPqSThIXz6QkyOoowPul59qYNL9Vt4QmCBHLMe8Bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbfNfXI+pf3cCgUHP2RhXnPSIyBHYJgqR0t33r/G1f5JnvOhu1Wu9MYbTVjJ4HfO7QrY8m2a7t49DmtC7Y5vqa0Foi+K2GcakG7DEaC6q0whWUCX/KAQYFBrUgK5ebTgcl82gI58fzEdQvdSOssbt3gZjXzqCrj4RexwjIMUapI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=eHS9VtRx; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="eHS9VtRx"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44b729aa7c5so562224f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 05:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1779366878; x=1779971678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=72FTf+nx/w2/qV444w6muOfwzxuqRZsZ1yO2xcnGaH0=;
        b=eHS9VtRxQjbIJMPk0UjdgnoQNVhhrzW524WirNDZSwfAv9oxif9cHdDK4jn+lma3b5
         6tz/lDpoDX2z8Yymp1TZXZr4zOp+OfHXOM9R7/X0UShtkY8ou86nT/oJLRfVFFL1dd2H
         TeCmC08Gi0o7+VXyX316W3b2JJyFPq96TC5+yRlnbXaJ5CJA45XslObLY3/x41XR4PEr
         9xFWoro8JTvvQt7mNKaWLVibaaxOfPrZjYD4m6QkEyav2nRNoR6rOwGJ4WtYhNVk5hWQ
         PJiiarvtmOfGqsDzaWVi1iqzETK5KbvihPeNOWY9HLVx59zS1avRv7QBc1gxJ78TTnTJ
         c9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779366878; x=1779971678;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72FTf+nx/w2/qV444w6muOfwzxuqRZsZ1yO2xcnGaH0=;
        b=kjsnAnaIbrcSkf+RubP7Nu9LT/2oThVWHf9XaCkJEEdIwJZytUmj26GKv+5l2i7z7t
         X1j8ziVUr1lapp3vWU+vRibrhnN7bErubW7MfwudjUWIv1B9xDwLE0P8ZDfrmkbIpuDp
         GxsmNiS7H0vhKCzEcVU1fV/OjC3DSKm4OuQbOEyAIGwZhfvkiV3iZvCgn1t5JfkfbQ0v
         6p5N8KcuQrcNxtRiuxWOoUppeVKwSkhXhNqV3JoPa2bgyNHxCh541Y54OIcPXZS20wEi
         2bJUJNPJbEfMCgat0J4u9CM6Y6kW0XZOBE+q2Ixyi17NRvT5JMQfFEw1GwEDoBLU3A0r
         40RQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qzTwQSU8Q3+/0C4qlIezK8QO95n8awX0KoFaDHQS5GeyhOprkJAXQTa10ougpHvypNeHodskAxLV6DNH0h1k=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd2k5CEcQP0qZNfNNmXFJrECcieSdazVg6sLLgUWC2kvLJo2if
	TF02+VByPq6qIzFKvDwVjORtWZOqJQfot300lGzZzJ3LqjKcq4SUvHjhG/4NfvOPi7k=
X-Gm-Gg: Acq92OH8gccQInbLKusWN7XOWfD4jfw4O2KXKBRddNbCpOKhhkB5SFWNVdQiPbjPha6
	lOy/SvVwgASKliRSxHWrUAPOAa4ZXw7kK5nxYC19E8uzMlsN4jio2DxJIlfVenPM5oQIDScnzIE
	hyGuT0BptzStvOXLPkQj1qnVhARBNsaAVCvPNgWV9s0n0b0btakp8qgxyAR+O6hB3duPyrUCwWK
	t1Hh+oARHvf+vlSpe0c0YypedZegbpsu4UnXrtrnZi8foC5uRNUFSstGQbemJ9AMUWMixIeIGQJ
	CD3Y9oQi4W8GTWS1jbZRUSsuOiu7b3cyC+N4GUbFiYUZpumIte149g9kKPMiwCz7db2YxzzaV77
	ufH2yfNFSMbmRPD/mVwOZWG8m+82RTXJl2Ui9b2sXnaLPGVY8iHknWGwoabcauBmPK1+KzPUBL0
	F3mwU3rOCjuDLvgmBdjsE+iQONhK5QOy5Bn/c5DlTzawrmFsdTjXnSZTg+iGpAwpvJtRbLf8bRJ
	Ia0
X-Received: by 2002:a05:6000:1861:b0:45e:8c3e:8591 with SMTP id ffacd0b85a97d-45ea34836d4mr2228063f8f.0.1779366877751;
        Thu, 21 May 2026 05:34:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa92f622sm2840823f8f.24.2026.05.21.05.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 05:34:37 -0700 (PDT)
Message-ID: <0a77c5c1-8680-447e-b9aa-c73600b107ae@6wind.com>
Date: Thu, 21 May 2026 14:34:36 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net v2 1/4] net: netlink: fix sending unassigned nsid
 after assigned one
To: Ilya Maximets <i.maximets@ovn.org>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>, Kees Cook <kees@kernel.org>,
 Adrian Moreno <amorenoz@redhat.com>, Jiri Benc <jbenc@redhat.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Matteo Perin <matteo.perin@canonical.com>
References: <20260520172317.175168-1-i.maximets@ovn.org>
 <20260520172317.175168-2-i.maximets@ovn.org>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260520172317.175168-2-i.maximets@ovn.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 20/05/2026 à 19:22, Ilya Maximets a écrit :
> If the current skb is not shared, it is re-used directly for all the
> sockets subscribed to the notification.  If we have remote all-nsid
> socket receiving a message first, then the 'nsid_is_set' will be
> set to 'true'.  If the nsid is NOT_ASSIGNED for the next socket in
> the list, the 'nsid_is_set' will remain 'true' and the negative value
> is be delivered to the user space.  All subsequent nsid values will be
> delivered as well, since there is no code path that sets the flag
> back to 'false'.
> 
> Fix that by always dropping the flag to 'false' first.
> 
> Fixes: 7212462fa6fd ("netlink: don't send unknown nsid")
> Signed-off-by: Ilya Maximets <i.maximets@ovn.org>

Acked-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
