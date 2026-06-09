Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF938385D84
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 11:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003915; cv=none; b=iuVri0bSQfQEI6cvFx6j2x7sYR4rocAoEkcqi9WjqHNOd1xWeHV1cDZnBc7S7MnXcbSbKAjV5m1z1y5lL4O3wKO/OX9VlCB7h0onXOsszF9imzxLsHd8vQsCJ6bE7OIDaMXCPR3j0u11/LfvYnSOn0+lM9AOizv4N7W0ei+5PxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003915; c=relaxed/simple;
	bh=35AGFm1UCN7LWvbWypSmoba5so4PsJxaREEzADK1J3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TQ4ORRciAMjdzEw30z9VAOY7/poJcrz906fPrPLCCU5f/8q7GApRqWAPp/iAdnjw3AxgOmxUhw26w73NYdz4Qy8HDSS4EzmXqmY8hsbOEGUWJKH67lvf++AOT3ucd4R0oj4teieKvHx5AcWkfVEfYqsgs1Fyln/D+AajY3qB+yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ka8dkaBg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=o2zJnl8O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ka8dkaBg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="o2zJnl8O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781003912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=35AGFm1UCN7LWvbWypSmoba5so4PsJxaREEzADK1J3Q=;
	b=Ka8dkaBgteuAQcUxhBjbpqLxj3jK5dn8KhOU75WF+E9aAk5zhtmg3w7wf1APE+C3iMo3Ys
	E05oLwgS+mMkaQbn6jh3DJbRvM5Yl721Msk3ZCpM2kwUX321K1HjLimwbKD4eSQApcgMGK
	BM3x4oGFawUgDrUf2XlIOoXg+tVWWWY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-uPL4Y0iBOX6tlrxVvAnCeg-1; Tue, 09 Jun 2026 07:18:31 -0400
X-MC-Unique: uPL4Y0iBOX6tlrxVvAnCeg-1
X-Mimecast-MFC-AGG-ID: uPL4Y0iBOX6tlrxVvAnCeg_1781003910
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-bf381078ac8so10951466b.3
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 04:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781003910; x=1781608710; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=35AGFm1UCN7LWvbWypSmoba5so4PsJxaREEzADK1J3Q=;
        b=o2zJnl8Oimhc9e2hjfLlyTXNauT1o6qv8PIm9SnRXW1yq6tiG3NhHekPmK1nlNxIZX
         TohMhEVM7bOUg4NiRf4v8eP+4DQk1e7hJehKzDUyrn6qeuC499FPMRTNmqLeiPUmqS06
         GoWlFV3TzDG+OTfwURIlcUN2FiXdU0agIta3tQR4VIlZkYik4vLKiJINDJeD7FKgIuIh
         ftGYN5OoPWlmAsW1N+a0r+1TUqOSJ416q18CxdwZkpH7LX/ENsLe2mR3/Q8d4jwWYbAa
         a+Wx+oK84Sekd5KRvBt4V70u8cqtHkBxYrCuWkNOAzlSePjlTN/XH89d9aTjbOanXyon
         NDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781003910; x=1781608710;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35AGFm1UCN7LWvbWypSmoba5so4PsJxaREEzADK1J3Q=;
        b=DIpFpyLJqNUKAKVYV8jwn2Y+erMQof30ZVQRSHJwxagucbYoOTurqpzuq0vvGqSrr7
         W52UpzDhumAnuudPKza390YUY5IXms9th0IwZFfNww1I+l91KFMRb/4CkP58/U5cDPeZ
         cJpdIqPOh5HjO7QztwiPihlTFMGVv4pxnEVLPCnRiUpa3/ZRXB6RZ0Pd7ENBWjqHsdLn
         6tl80XWKauVb8kSJglNe1HW8l/CWfJdYaiiZN+g6RDCAqXRMxreY9Q0YGmvwzWyEkoCT
         Kx45j8bmR3ANHI6oLWYJLnCJDErh8+q+plfqhe1WgO9nEzHXOsesNIxwI0CEzABQPqnB
         qLcg==
X-Forwarded-Encrypted: i=1; AFNElJ/819oXpOvOQi9XBaZJCxnagfjl8fTY8QSbP3GYNk0DxsOysFfKdY0em1K2MVdgYv/tLlW4p9E4fldjFYWLZyo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9qBu924HocPokB3sgHVoB6BfBsbHW1UbRix9JrCX9W20UJo9G
	5gp3cqAlpLRQ8fRNBpNaNAY+jH7aiFYFdJYDrH2aofldiKS/HVmFZXgnA550eJTlXVxIfwMwah2
	gTgwEUvJuw44ZaCEZkzyW+JmFGVijM2ki2Vfm+bbKEJ5lWekG9V3gIrZkTkPnxZ7ZV1/bKw==
X-Gm-Gg: Acq92OERCihMeF9Sz6OSBirkVv8MYNbWaKyOv08vawL65NByvUSvlrpjLpf9NZJ/9b5
	NRWslL8NRfsRjvKyMqtKlir2krxQ6bKlaExzDo2f97FVBacQqgEwdFwvz9cQFrl48TxBhXkZsCS
	O1j6glsch/s//x4NfhfeUKXIC/Gfpa97ZeHUrNeyJAXIYzsIHsLxd+KgI1Q0q0XBLUo32PeoKie
	bHYQaWPsxYl8rfy/mBBYaX6bVfwqNvMYzHNS8/AJs2uManX+hLKc4ECWRVk0I/cZLTJ1JSda63t
	hcNUOhIJIecbHl/krycQoqsir5i6kOz/eewj/JzPe3g1F23SHKQT7it/YMHDkTF5xxVQEaAG2Xq
	HP7aeCJDWAnNNr4/4H8PyzILWgL/oOq4UREB5E49LbsAWhqrrxsEELEblBQYqFvacQ8V1Prb1DA
	EmQLq8
X-Received: by 2002:a17:907:96a2:b0:bee:9d02:6e6f with SMTP id a640c23a62f3a-bf37135dc59mr932737266b.9.1781003910069;
        Tue, 09 Jun 2026 04:18:30 -0700 (PDT)
X-Received: by 2002:a17:907:96a2:b0:bee:9d02:6e6f with SMTP id a640c23a62f3a-bf37135dc59mr932733666b.9.1781003909377;
        Tue, 09 Jun 2026 04:18:29 -0700 (PDT)
Received: from [172.16.2.95] (5920ab7b.static.cust.trined.nl. [89.32.171.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553fd86csm1033289466b.46.2026.06.09.04.18.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2026 04:18:28 -0700 (PDT)
From: Eelco Chaudron <echaudro@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Minxi Hou <houminxi@gmail.com>, netdev@vger.kernel.org,
 aconole@redhat.com, davem@davemloft.net, edumazet@google.com,
 horms@kernel.org, i.maximets@ovn.org, kuba@kernel.org, shuah@kernel.org,
 dev@openvswitch.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v4] selftests/net/openvswitch: guard command
 substitutions against empty output
Date: Tue, 09 Jun 2026 13:18:27 +0200
X-Mailer: MailMate (2.0r6292)
Message-ID: <E25A2A83-F499-4F3D-87C8-9E604AA1DD02@redhat.com>
In-Reply-To: <f4643f4f-8db9-4621-bc53-34992820ce19@redhat.com>
References: <20260604163016.3929371-1-houminxi@gmail.com>
 <f4643f4f-8db9-4621-bc53-34992820ce19@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain



On 9 Jun 2026, at 12:58, Paolo Abeni wrote:

> On 6/4/26 6:30 PM, Minxi Hou wrote:
>> When ip-link output is unavailable, when the upcall daemon log has not
>> been written yet, or when pahole does not know the OVS drop subsystem
>> ID, the affected command substitutions silently produce empty strings.
>> The caller then passes empty sha= or pid= arguments to ovs_add_flow,
>> or matches against wrong drop reason codes, all without a diagnostic.
>>
>> Add [ -z ] guards immediately after each assignment. For test_arp_ping,
>> also align the MAC extraction to use awk '/link\/ether/' as in
>> test_pop_vlan. The drop_reason guard returns ksft_skip because an
>> absent subsystem ID is an environment issue, not a test failure.
>>
>> Signed-off-by: Minxi Hou <houminxi@gmail.com>
>
> Whoops, I unintentionally replied to an old revision; same point, I
> think this is net-next material.
>
> @ovs crew: WDYT?

+1 on net-next.

