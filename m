Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4852C30F7EA
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Jan 2026 17:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769880743; cv=pass; b=rSelOWaJrFQGicoTMxHfl3UIUUQKjLKZz7NmqAvvRbjepjxxs8DRgnUAGE5Ikz+WlsGuAqoRNwWkPJDn7oFKPBQ8N3q8cPwPN46n3FpQVKM+VT3AZCEIvdmYbAjq1kp5qBF+Vn6H9r9R4qDvLh0drZmN8uhiz5806NNaLh+k1t0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769880743; c=relaxed/simple;
	bh=AH5Mp4HVfEwP7d3SekbzrvjttHLLachc5B85p75vV1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdoqoGE5hGHi4Wj2bNh25e9gM2BYumHEsh2bQS3qrNlxF1hK66V8SRwCzoqGoDOotLv3LvuEhp6ROubFObXftYL2cEbgDJlI5AwLU6dSnipRYoDeiqoWt3MVlxHU05GCf1ZIHjK9aJPBIy0k2uYlUOqvnJseURCUblnn53tHZ0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZoH7zPjo; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZoH7zPjo"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-505d872f90fso14656401cf.3
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Jan 2026 09:32:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769880741; cv=none;
        d=google.com; s=arc-20240605;
        b=MzDcfVYgZqxz+6EGcWofEaOEU1Sxm6bWOrFl1X2K/A/MfVV13SUhLd5n9uYiDMiHC4
         V0RmNUlQ1dupY60XluB1qO2piki626ANKahbWOP4MzFpdjpQRImQcJz6hhPvm/DAuMcR
         wj9Xd5higBhDkI92ecHC3EYdYcNJgRRjEdhxO4OPQYOjP20FL6xTAyXsX5bDKihHjFY2
         JPOQmHPpeC5SENtGO/7Ih5yCT5bmh6GtBJ29Wvi1rSrtbYYacdxbknu8gT+hJ91CAJg3
         /cYh8t0DsJybIyvX2ysOAsofXBkdWFCHgnO/4vZXFLv/LvxIwnqQHKXVrbonUvxjvOOq
         Vjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FFXR4/OMDB/Hha2547tcEC7+gK55Y57dEdHNOzamh28=;
        fh=CUmjs3BmFQ9BwPpZtjetQJYBZpYZZVowNkL9lrHV/48=;
        b=g3BrhIAOMgyOb/InNBz+WDhF8BFUtWkKvlPTs2MKTJYonj6biVeIwmVCWkR4Cf1AMH
         vEPWlQt676DOUE8uU+J01MMwArDiQv8bEf4vOizsO5jI+1RT49pYG+xe6GYKfMepilCx
         ponEei50nNuK8gRTbDA2lgNITWEkmKoh+f7bO+7ES3M5ztZ5BachUumK7REPJ8DPWSgi
         8lE+NOpM4DbtaVXrxq+VTDGmejzApze/3ax7UM3iwm7/Npc1dKAWYK9Lbs2HCwyQ6/67
         Ltoim7FKOE61bLQd0mCB1SBek3Jvbi+ZqFIBg+2YAnsJGEGBOrPp3CtYGr2RZVTCfb2Z
         6NQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769880741; x=1770485541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFXR4/OMDB/Hha2547tcEC7+gK55Y57dEdHNOzamh28=;
        b=ZoH7zPjoBvg9IK/bhGX+tQtyaB+QlQHQyXyDczRnQqO2E8qAmDeodTNcW+t72hfzWT
         qUCZ5NCz4COmChQKOb3WS13r/Jow7HLtORF3VJMZlptJN79GnGiJCjuInnjvLLTFVMTr
         aNqswAm5tx8dNuySuYA7Qf6nG8Sx9ffXSS1ef4cK56oa05alM6+UC3FgB7OrQRBbviXD
         DiMHJ5mB/tyXHcRO31W1lUI0M4SPPiD0KUCBVEy9NYvAsTPphjxGqjHbPhxvKOjX9fUc
         xiLnrz24IW5kKq0LsaUI6EgKju8Pn0C7QhrOJ7LGEBMqZ2ktqAZ+bcACXMKRUOmVEJNb
         HcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769880741; x=1770485541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FFXR4/OMDB/Hha2547tcEC7+gK55Y57dEdHNOzamh28=;
        b=qDiKW/huWlLH1yMFsB8Gaw+7w2KNwoFvceuw3VBeqGVX/zlramI0oR0yKvHSgDmUjk
         tuLbtpq3pvUTd/UcF5kqpQkEhd3mWv8KrZI53E0gGMSew3oJ2LHkbnumWso7E1ZBG4Yb
         LCH4iJBBNxsHyYMk9vE+yl++YSJR5fi6pQODKouWuMTCxgOfD3o8In5fcbRWabmOgG+A
         WDfeTcqTMSyMTPKJM148nFni4vKr13/9YDijXaXsKMtRAO6umMjeOWloNt7uit6Oz3to
         e46xJnfDXgbdYso3xfmk1Qckr0v49RmbDBLzfI13Ix0GO+lH/JbrS8HBh22Z9fX4jWGD
         FDIw==
X-Forwarded-Encrypted: i=1; AJvYcCWRdlYYnzmtUQYkYSUyKPGPMGTxp8dlak9Rzvj6hqDR7fWPvO67rC3c9n3r7swGDQHO/06ON+7XQAYFNBRx9po=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAQ8LvM3DP+zHmbDx+V9xfpU4GoaPLb5ZGgTePVZCkElt4MPHm
	GMnnfCCkKreEIVliyUpzYhNInxtzwmcdETUZCErXNyvjuAgWGjgTNVrTPeBuuUHo86EBQw9hQzk
	3UtHoS6EwMWp81CbQ+MtejbXQoDvqWMYvw01RV4wq
X-Gm-Gg: AZuq6aIBS9f/V+CyQfqbpI+0xN13nvyHwqtrWHYgj1tHKkvYm8E20e30tAPaM/lwG3p
	BqYE6+FZJoGrru1APwArQVoDdMt7aWcXb8D2YuBHCBVJnk6ZXIkmHZWFX8MqO/fKTTe3O0bLeZL
	4h1gM/IzD4I6nhgKKNX7CDhHv6q4RA/xPeWABUBp4AMLbSBqmieT7BMc4R8M3jdwxgfzj1YNROx
	sXXl+bZtRoB1fYWwVQdOhHCgp1IB7nbsBhtMu1qStNcnD1xVnN5erfcJM3Q0NDt3pMyjg==
X-Received: by 2002:a05:622a:64f:b0:4ee:fe8:9348 with SMTP id
 d75a77b69052e-505d22a4946mr89976711cf.72.1769880740957; Sat, 31 Jan 2026
 09:32:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130192912.826454-1-kuba@kernel.org>
In-Reply-To: <20260130192912.826454-1-kuba@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Sat, 31 Jan 2026 18:32:09 +0100
X-Gm-Features: AZwV_QgPeezvCbcvz2jUIiYO-eyxh6cjEBmy1B5tUEpzAXkFkVVqzBMCpx9RMGM
Message-ID: <CANn89iJXjCLyPsUwEnFBz2wR1Cst=UGOJehNV87UK0Ko4uEkOQ@mail.gmail.com>
Subject: Re: [PATCH net-next] selftests: drv-net: rss: validate min RSS table size
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, pabeni@redhat.com, 
	andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org, willemb@google.com, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 8:29=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> Add a test which checks that the RSS table is at least 4x the max
> queue count supported by the device. The original RSS spec from
> Microsoft stated that the RSS indirection table should be 2 to 8
> times the CPU count, presumably assuming queue per CPU. If the
> CPU count is not a power of two, however, a power-of-2 table
> 2x larger than queue count results in a 33% traffic imbalance.
> Validate that the indirection table is at least 4x the queue
> count. This lowers the imbalance to 16% which empirically
> appears to be more acceptable to memcache-like workloads.

I think this nice observation could be captured in
Documentation/networking/scaling.rst
amending your commit ?

commit b91f2e13c972c3f2f33ecc873b0ff0ada3fa1854    docs: networking:
document multi-RSS context

Thanks !
