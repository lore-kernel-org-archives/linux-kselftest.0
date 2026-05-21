Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D2825B086
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779373542; cv=none; b=RiVkmO+QzKUyfCSXMIY4e+61nzHQs4aHlUW+l7abWbCKufa+28AQI3KN15zIxAPKVz0cwYNM4AMISPbshOPM2dNNuFHcGUS1ZT4pv2oT69C/EgkT5rGTqUcscUjLNN/GaeKC/vKsTgmdvPFQx+OT/LQ1Jw0xzzBABlrA+5M0NVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779373542; c=relaxed/simple;
	bh=+C3fO9EHQqC8yb9Ea8YRyF+2U4PtwzeiyV4Jx0pc3HA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MT0s/aNEIgKp36eSkSIUqTx9Zo+gtOqV3ARAzPMxqAFY3sAVsr8ECLgs9r03ciurtSjFBCWRyeALR9SUmHIFEDhmpj3GKbaP4iL2oebAC4LBWuhPo2ZD/5U5YeYeCTmOqbAX03VHO53Eht/mk8mzDQ2IkmCE895MkCpDhwEhByk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=IyXo3MfR; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="IyXo3MfR"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bce3350fe3eso86159966b.0
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 07:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1779373539; x=1779978339; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8fIErPlRSj4fk2dY+zUS744qFronKsaelvf6iKyKFKQ=;
        b=IyXo3MfRPtLzvEM7I5Bch8BNUC1qogTTnjTAL64Ar7313l6eEXzn35z8h7uvybRlrA
         mb1bXOkqNru2qu49NvwAzN+W3JC+4RsZ2JSgEBqZ9gbXrBg4ya2lr5/0tr/DcSgEL6/a
         Z1FdAMlqSCbksJMSweiV7CJ/H+47wPPtbNjU2fBX7sAd63dLbmBxuZqBU+NV+0hGpI6p
         IdcbA36EUy5O3sotzGGKohA0jcGT/O92j1Iuz8BjCBNC4ls6DVVHUFSZRNUK6ncQKsw8
         r8cEtqMRkVcKYlcZGmZTlB2qFQXjK1yZbB2Mtx0c6N9FqMLoSLeOujuhCEJJPQ3OCSCN
         byxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779373539; x=1779978339;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fIErPlRSj4fk2dY+zUS744qFronKsaelvf6iKyKFKQ=;
        b=IdQYXfn/EKbJyHws9odRS7TvXcQLQF1T9As+WeKEGOkVm7Q/9fpvBu89t+CiK8z+/G
         yBQpQvU6x8QpH+sSvmgnktr3OjTxsFdAYnJjyzi+xyiFU9rFIKS91NWaMAJ3tAoNWEKs
         h4FGAvlfohhTOzJZm3vjyy6oJofwQskUrB7zslcTUhtcokcTn+22jtNmckJZpGSnb4Md
         pZDspMVZ7WUqGayySu3FYg++o5AvhmufyCDEWPf6UBBG6+ZuX+MDUlTIWzru0G+SWg4X
         6rcE6CTH/LcZcpCUfKJ7/Tf9h4Y6khJECa/z5BAKFMq3pnnKub2DJb1KnJ+rjII7c78e
         eeMg==
X-Forwarded-Encrypted: i=1; AFNElJ/rn38Y7i1iwunjwVjh3IM4jwTIQlNRGI8R1GFC6klQLmttF7TotEawQjVBuUDfdrzxnrcC46F4rBs9lpHB+ms=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXq0f6NBrUIq9X/8RmhnCr3fXYrpGHHSj2WnAIzzqsMq2YhtBs
	ynAC4FHLXTImnshLrCCSvG2coabFtYYG5VyRk30aqgbZnRcgqotSTawbvYYZHnPuexc=
X-Gm-Gg: Acq92OE+Tsr1+MdUN/Eu2o6uXgfuEW2Eul62IU0+wyTvAQHBEYADTNZH9dJugAE42ut
	sDncklMj2BWLaa+r652Hw7cUSRZZh5D0ZG/NUopuQuTlZDi3yZYUmCf5wezsvwnd2ebBrVfOuWG
	6QO4LfxQImWoYwupTUVXplk/o2xYvJOWEODJi6IyjCI2Ip1gBzhDfmmfWOuqU77kKQVUvfcBWay
	mVMeuNxCSIgqlD5QwDzo62rzjDhAniLNmJp5FpC5CxDDAKjfay4sShVSf/WDAeOs8Avc3JbFsCk
	hwYnGlKcdsVhkEedCRVFczWqg73LSMqa8ECaAUzovj36YbQpXvXGnSBdoVfNSVgi3H7uukf6/Au
	4pxiY6JrpTLOPRSBvBYSl39AiF4orBV+thNzsyXGJfmihIrznZcoQC/5vJ2uRgmHUAdk0C0wySt
	FMYi8uY9hEMvmH4EQTNIKeVvOAcfnfLEu0Pntrdd1V8uQkqbXxtRjik5tLHS8M0EMpY6E+9qMFI
	bOYZPh7djvGjkY=
X-Received: by 2002:a17:907:961c:b0:bd2:a2a4:fd3a with SMTP id a640c23a62f3a-bdc1437aeddmr66262566b.7.1779373538588;
        Thu, 21 May 2026 07:25:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8aa03d4asm57107166b.47.2026.05.21.07.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 07:25:38 -0700 (PDT)
Message-ID: <9e7b7aab-dad4-4b72-87cd-822e67b27afe@6wind.com>
Date: Thu, 21 May 2026 16:25:37 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net v2 2/4] net: netlink: don't set nsid on local
 notifications
To: Jiri Benc <jbenc@redhat.com>
Cc: Ilya Maximets <i.maximets@ovn.org>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Kees Cook <kees@kernel.org>, Adrian Moreno <amorenoz@redhat.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Matteo Perin <matteo.perin@canonical.com>
References: <20260520172317.175168-1-i.maximets@ovn.org>
 <20260520172317.175168-3-i.maximets@ovn.org>
 <bd9c0751-55ea-459e-8b22-8bd24abf235c@6wind.com>
 <20260521160036.413771e9@griffin>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260521160036.413771e9@griffin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 21/05/2026 à 16:00, Jiri Benc a écrit :
> On Thu, 21 May 2026 14:36:12 +0200, Nicolas Dichtel wrote:
>> I still don't think that this is the right "fix". The app is broken. Even after
>> this patch, the bug could be easily triggered again by a third party.
>> There is nothing wrong with assigning a self-nsid. It would be a lot more robust
>> for the app to assign itself a self-nsid when it starts.
> 
> On the other hand, does the patch break anything in practice (as
> opposed to in theory)? It makes live of several apps simpler, which is
> not a bad goal.
I'm not against the patch, it just look like a workaround.
I'm trying to understand how NETLINK_LISTEN_ALL_NSID is used (in fact, why it is
used if the app doesn't "understand" NSIDs).

> 
> The only scenario where this would introduce incompatible behavior is
> an app that self-assigns a self-nsid and expects to see it. That looks
Yes, I thought about this.

> quite stretched, doesn't it?
It does.

Regards,
Nicolas.

> 
> Not that I have a strong opinion about this, though.
> 
>  Jiri
> 

