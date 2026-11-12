Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794498349;
	b=okljlKnNuVbiL9OdM0BlsO49FklvxW3ZNIbkVNjo7vWXEkIY9/lZCPB4R/d3JQQ60mWG
	 91YfVaKC0HSzPQ5EhlHue1G1Kir/Np/GYsUQ0oYWo1mTuU92XGOixiXno5lBDpiMTKD1O
	 SJy+SjwylprwKV+mcIKIaxJroV3HUpAKKCcInkoNowWvPUq9LkVTVMLCqCLQKpMKRDBkC
	 S2rEBkTyCAQTNrPSWulgAPxLk9hFaici4qznSFl/c+86ldTeUztqFEAyVdTgL631gIYNI
	 n0Px1On0IjgSQ9asfkPyY2hZ8kVIU6+CnUIlZwgSRtRmQBisEXtB2G0YNFgQ7G0C1JQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kA9f5sjuaRG2vzctzCp8dttJKbGRMLmrAhhg35dIa8A=;
	b=PHcxUwzKSXUWXQhwKxD6Iai22Dq5fotWY+EmXPARspgbuv1KF2q8nlpwrNZTHztcSkBI
	 +Oozb63h611QWGU8kxngh5aOUnET5ikNZXolyUGM4YC2CE19nGTqr+XEuwrfLjI1IapvB
	 F4ZjvqNT54C7+Jmu+J5+rNMQhnb7gOpvKsR6vAho7SAinCSHIUKLZINZO11QDuK25gZF8
	 DWIBcmPCwZEaXAUNHrAj6Wn0efGQi3wamxHQAxBiPSyg3TdtaEh6UN6XcZwP3W2W3f+SA
	 FE15zi1Y+vsEsW34psBAYziD3kYvdrNCWtCkMzXwoKHmpmT/H0msccYhLzPBf+hKuaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t5IAeqLQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C4C606A323
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 15:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00C4C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t5IAeqLQ
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e47347279so2791654f8f.1
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 07:45:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794498347; cv=none;
        d=google.com; s=arc-20260327;
        b=JGt+ToSEJE7xighxRRAExFy7NatYZOel1C7NPukGPLFD7QP3QhsbiBG2h0/ujei5lZ
         0BVZB8uacu7ZaAEXivq4G48voaV4YpQXQIN94uJBXfrbqa3tvTmOrXk8AoMDGiTnjKlq
         XccJ1pBHKx+VCGdjizY3Yk1nJSHE9/z9BEhW5S0uO8qfU8iDZGomptUAN8j4q5X1Vgg8
         gN+vTB9Mg9mduO92l1XKoKU87LnANkNMmPVnKoxo/m3wM/wZCTAz0Lllana/pX3hNzzb
         MOsWbdl4ku5sjNPKZk/JhKQC8TnT9pqt88cP0qnq32AqAPm4czLuFwRtXtMEXt4zhprW
         X7eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kA9f5sjuaRG2vzctzCp8dttJKbGRMLmrAhhg35dIa8A=;
        fh=NeAkMBDYolkKebyadA25IZYMCOMWAne8x1PjrZzToWs=;
        b=KX35gJKX8/NzDlfCizmE9s9jVW+Ou0nuFBelcVr+C7G3y23a/amUlSer5yrJBrIItJ
         7xAwwonyHKeAR1+aUtstx45cMxuCF1oSCHB6XtH7JA5vAu0gDbHoZYYNizN3dC56U8Vs
         1KCnQUJmhbN9QQmXWiLwqvf7uNI9PU4Mhgh/M7JtlWXcVZlKYiDM8KAxv84dRr6xDLBI
         xgl149Ek0L9Eqhx5m3KwUNhNVaMCOPtsTWO8Zn4e3pkdFMncY2LezkwZ+gJBgN6bhCw8
         16J6lOWSYOyjGQDelRN/TaTk579aR7JyUv59EQD4C5U8uT/ueJ3xFGK2x186YE/7Fshb
         ZxuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794498347; x=1795103147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kA9f5sjuaRG2vzctzCp8dttJKbGRMLmrAhhg35dIa8A=;
        b=t5IAeqLQr9OcHYi8yhMFHhoseNHSIfksSOPQzSaawIg5iGhwqBaIMRcFuPa3Gnqs9c
         KWukp4xG7jDNeBEGoHt6R7U+ONdyuVkFP1gp1WXElW+hb/h28JMjMSdKuFkknOiz44nZ
         ybH0dhS7SYOkJ74wvVginP3x47g32Ylcswl51n2b3oU/ME6V/CkJ9Youba4Xjt5pQiXg
         /yBG9eRep4q01kfLVLJF8cTYFmXXNxJAXedGxNQvDsihb/w2j9fEgFSoPbaCxjwC+fcJ
         7vapEoboNwU+ernq4iLWgpDUl299l+KVASTIyQMUbTohCjjjvstkQuOo0kgw4Wcp+WF0
         xEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498347; x=1795103147;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kA9f5sjuaRG2vzctzCp8dttJKbGRMLmrAhhg35dIa8A=;
        b=VWRvRhA1rYcN5ibwuIwpuxrJsurZ3p400UoeDBK+B4yxNh7nR5GQuiEQx3TEiqg/5B
         tIrwtFCJbhkOR3ZAfQbtXMZp7EF1F/6oUWFEovmYCszf+9xOcqTuLlo9cgGCzN2A2lyD
         uwhkUCran9WWxD5Mfk9gonTed8P4S5y7Gvq21EiEnNGmdnoOBi8Gn1pMNb8iUwgdLfut
         mSQOSGuUAPEzddufHmFPgVAM/alpfIABbK25mfFZW1qxl/OKIq9nQtJp658CqU/eZceR
         EB2BbC7PNRRnEivn6+VacCw/aFHjjt35a1A4323FgZKoBn/twfVTy753s+QAvxZmza3H
         ytsQ==
X-Forwarded-Encrypted: i=1; AL+hErHzGUOsZu7yC4OFjbL7NvWiQmxphS27blf7OhhZB5PuGILqtKDS+2zr/89qO263Z6hl7oFhgaTSIHYWAVmF7k4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dxGTRSUUX4O7Zpp/6wYpWh15cH9ElxS42cNCiMXWzKr3bAg8B
	J6sZQyovigq4ZSL0/ADmvU4X3H/0ktu1reFwS5nQGOtekl8lwX+naXeK0G354g0CAZu4zpZ0ZFL
	FzYSZy1Fck9G05Qy8szl21rTF1tNpwUA=
X-Gm-Gg: AYBFou1aMbljJZ89mufgSK+NFe26G8z2EI+7RMBj3v4iaAA4nCLkuf53awx1Kcj3YdV
	BdnfnJn//DHR9IyiinV9UK8XGPWwr7YgvMf5nTvZHs2oPLWrgJn5pLgq3bPvbTxMTcoJ/kloa+N
	a62PTskwKcC1g2SIYwu5n0XdN9vjPm+eUg7bf/sEpCkNO7cwM5DCMQ1yQJS44xHB7Y5O21kgmLf
	tP1vU3LBsHeBUWQuUzgLSln6cM6TPPW//62jRpyIUUKrnVcHw/gNt3ymNeKKSS87n0aW2k0CyLm
	wrDw/y9xdpZHV1bdz7+bJdvn7gSpgPoOeN3ZacXWgDAzhMfbAQyLW/W489QE/FNlxXXtYDMr5W3
	7I4nql4mtIcbeErY8Zrhj5Prmbt+ffutgByWgEIcs0DeeVDNxzaIq5Me9sF1gdbLFGFnwBx1xex
	4SNhYjwUGimYJ+KvK8EkmcsrG3Lpi8zGAel94TxSI+Z7HnGyRzsXNO
X-Received: by 2002:a05:6000:2308:b0:48c:5304:5e50 with SMTP id
 ffacd0b85a97d-499c0781a7bmr11850028f8f.0.1794498347231; Thu, 12 Nov 2026
 07:45:47 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-zswap-zero-limit-v1-1-19f33081b09e@perfloop.ai>
 <CAO9r8zP1o+L-akRDJx80bgGj8bf9rdN09t5upPfkduSmNKwpKQ@mail.gmail.com> <CAEEBa3VA2vycMaRCe4K-qnO3SGCuvAqhECmjmk6PQC3xxERiLw@mail.gmail.com>
In-Reply-To: <CAEEBa3VA2vycMaRCe4K-qnO3SGCuvAqhECmjmk6PQC3xxERiLw@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 12 Nov 2026 08:45:35 -0700
X-Gm-Features: AclHuK9YTgclXVDvcKdpOmhHB6JA7-MrKBIZCLI9W7C--1NSD0gtJgLIGYRP7cw
Message-ID: <CAKEwX=NVox_NYML-5Gg6W_gDt-j6gquk3sba9hmbvz-U+t=ehA@mail.gmail.com>
Subject: Re: [PATCH] mm: zswap: honor zero cgroup limits after successful reclaim
To: =?UTF-8?Q?Tom=C3=A1s_Senart?= <ts@perfloop.ai>
Cc: yosry@kernel.org, akpm@linux-foundation.org, hannes@cmpxchg.org, 
	roman.gushchin@linux.dev, tj@kernel.org, chengming.zhou@linux.dev, 
	mkoutny@suse.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	mhocko@kernel.org, shakeel.butt@linux.dev, muchun.song@linux.dev, 
	cerasuolodomenico@gmail.com, linux-kselftest@vger.kernel.org, 
	shuah@kernel.org, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 5:55=E2=80=AFPM Tom=C3=A1s Senart <ts@perfloop.ai> =
wrote:
>
> On Thu, Nov 12, 2026 at 12:28 AM Yosry Ahmed <yosry@kernel.org> wrote:
> > Why is that a problem? Setting memory.zswap.max to 0 while the cgroup
> > has active swapping processes is naturally racy. The limit can be set
> > to 0 right after we check it again anyway?
>
> Agreed on the race, this doesn't try to fix it.
>
> The case here is different: with the limit already at 0, every store
> writes back an old entry and then stores the new page anyway, until
> the pool drains. It's bounded, so if it's not worth a special case,
> happy to drop it.

Yeah I don't think zswap.max =3D 0 is special here. We can violate the
limit by changing zswap.max to a value lower than zswap.current. In
future zswap_store() attempt, we will let it proceed if it shrinks at
least one page.

The hope is that in the long run, the violation is bounded and
self-correcting, because the number of objects in zswap will decrease
or remain unchanged after every zswap_store() call.
