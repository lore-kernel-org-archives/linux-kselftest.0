Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795669953;
	b=P9CP94eHMkR0CbO9TLpoG3tFEXTTYh6Y3mVMzKYMmfmlV9l1rXQ5gfjdpUFPb0bojW9o
	 6tpc6sGIYzehKg0R5HdW4XQhDhuYdg57A90qatI6S/Uu9UXHST7r2o3jPrHPzH2/Oz76S
	 0Q9BK+MLIphbj/gjDQ3bebdRcFMk64Da0a9ao9lm9uu1Tr/DkOkvR3FBC6+M5Uq32P0XE
	 bBFOjo4Cr1U+j61zO7uQw5YlHgYv6jOb+0o25iJcXLZanfUVPEmtAt9ozMqqRr7Jmh/XV
	 a9hmnrlwv5Ej3zKnjh+2bHlT5heG538fgvt1888LhlveKgcnocvPRNMRvb2xPms0xxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=7THm2pFNLKmeMdeigx24KlsxpB9NcHHzxJozSi1ZjvE=;
	b=BHqETG4bKTC6jb7m7SpmNsrb+d5IKozyjdGVsOhHHZEG2lfQQtZiQI9vV9ufjMR75PKd
	 pV2aN/KyXVcAl1KlLB+xHiCBiK0tlo+fY6mb/DaqUHk6xkbuEfLfa+2YjzdufwbhaJzzl
	 HVcfufl7AibUPYIZYxEfhxtqA0xhTdIt8y2ABS9GCvmccWMI0lom37S99Z+4z2SBk9cFi
	 LQcj55gllbPVb9VVrVzDkwxTELtcC4g+V4vDLbLnusINq/o+KVbK2oCMfr/KG6US1r8Qx
	 Tju51kFTeS2eimWPkzY5R8rHceWUa0jTmac1n6yrVGlDOKyl9PUyu47ty3LTQHxXvhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WYFFmg8Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30938606A327
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 05:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30938606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WYFFmg8Z
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67daffde88dso3892814d50.2
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 21:12:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795669951; cv=none;
        d=google.com; s=arc-20260327;
        b=H+F6CBC+qTTeBiHTo2TAvmgPFVjNwbNmp1CRnh2hRiYuQB/thJwFzHuRWnI9ZZGpsL
         dVpy2yi79ySYIFNxmY1+XW4B+uxHdO6sUBYGzV/LDYOdJtve9wSTTJ8Mn67w+TOZfEfw
         uyYSDps3KQmPPreWtOkBonfTM09arTLQ+udHZJ40TlDgkMBcTXqQyl/DInSrQNT0tXJT
         8PHPzA/a4FLOienCc3R+8+J5blCUazBIoi3LV2J5wgedGJzXtETHJEq4UhpErmuZ6i0z
         sCYnpHNQSc1V2PbS31/Of9xXh0sYsjbMZ3Qd8Bpw5A8WVrL2YmByC+SBE2xqbTd7aCoF
         EsJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7THm2pFNLKmeMdeigx24KlsxpB9NcHHzxJozSi1ZjvE=;
        fh=BOUCsESbdE9KsYtDCwYFmlHTp0ukV6vDP25fBtzzaXs=;
        b=atHXrrxggNSXkzZFDNYVR7YWKT2x6HlN9oJaRvlTk2NYmRb5XQsIDrQIEZob0h5PJq
         7KpBCoESUP21QQX+bDuT6QkC+JaQwB+RS4lt1QWZzPCWiipnN3Wlmg27zU2jDnskB4EJ
         C+AUO79esLgZjyG3QYDvCv2b5ZtgYi7yFTP+zHwRfaVRudTU3M34zOiGfBeznmImTwAz
         pdy/s+M7IIpoD/s+VYySixHobdfTlUZ1+mjpMktrSCpchvmKfNqQcHUhWOtXlvMhtaY6
         6tVn/ike3iGCY+Ldz+9SzWWkPr+oaV0hpyvw3MdSy6Whrqik59LBEh841vCn1UtLBCDN
         Ptig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669951; x=1796274751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7THm2pFNLKmeMdeigx24KlsxpB9NcHHzxJozSi1ZjvE=;
        b=WYFFmg8ZlPKwh9PoCjEwmnqFmtfe9er9CSLFhbY4GJGreiTN8/N3BhYZHc0MyRr3KH
         E5CHeBm/mBFy7BuaPfaKQBoMcWs+d3Sv/rH/nxcu01ghMhyZOC6G9FzROsKoWAhZ7hSK
         OwWhTrzbY3fz0dfHOGe3uAQQ5WPOsVEbCJcxSrT69vOZ5PGImtNFE5aqvbcv7EnxMINX
         A2bwWSJvdYDwyaDjzsCY7SzYZNKdV8eUwkUJZbHsGbKPxNFAfY5iBIN0HkdzPKhshds7
         +rS7BlDmYj9jZANwCBKKWhkGqTmFaWRk1N94UOBbKfpZs5r4VOcekvNx1UUNPESsRDwv
         +WAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669951; x=1796274751;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7THm2pFNLKmeMdeigx24KlsxpB9NcHHzxJozSi1ZjvE=;
        b=yREmDq74QBvmymV5CU6rfZNL70ALcAw5ix6WyPSSJauapBApUGpk2mfcHI8i7i0VuS
         CBm3dlhcU3jf+UNd4TNC35uyd8qBPpQD1+4RoolrifhHQPYi8+JH0s+EQsepky9K+4x3
         EbITOet1AnpTBMrSXuNoB8KQdaxs3hVAkFXNl+r7ohPAszIdVdCZqx+GzRbqBlZrJy1Z
         +va4S1fes/9muBDy/6Ras+/jXDQemW+nnSXXlMD9bPBdoJe2yFyo8ztsgid5D2tLACTI
         cZ1ZAFSgirPr9a6gob3XfB8jKUO9fcX2Ce/JFKjkY8aG5jYNBRVGRqg6PS4gjjOwKOvB
         PzGQ==
X-Gm-Message-State: APuU4Z98Tci4dFZDnp/ZM1FJ6Gc2te3icRBjivDbzLcY4AMuHA/uFEyb
	/dGrz+LOHi8n5ercaV7YhNSbZqpIWzWSlnG835nRBF6DR9AuqgQEw5Wvy+g4sdSxTrMxpSKo9g1
	hJj9fCDEBTuK6vntQyk8Nk+zGpHdc8qEAMGqDhZM=
X-Gm-Gg: AZFdTZd9BZGKGnSUnZWB+dXdT3wEvlk9FVVnLv0LXGokn9q97/rSLMJt1+htZ+R0I+C
	XElwDPovjaBByXmdREac9JAjgI8UCeWNLekT19kox9ggINz7k4H8KcVIBoplOUpB7ngHa5+98zQ
	H7vvJtu1xraduqqj+4WJiMFk135xBgGG1Nu/FTiUPuDMXarjjXWxo2Ft1yU94uMPKJde9bgmE78
	nwzPgRHBQkBC7xTWrxpdCZCjEOG4q1svrYm7OGObYo7ivPBIt4GbnJCZA/NiqK0yaesu+rhL5ex
	rRdHzmOsYN+t49QJgSNoU1xsBvIhUJlyVzrd0ckSXdRBkyuW309WUHD5lJeWtbpGoaq5GKfmNvH
	HH28ANTW5MP+645f3hebLSfCIO9xm29pEH6tEPWT31GScixn2GLz/aHIXb/KS7h68VFv3f3M=
X-Received: by 2002:a05:690e:1686:b0:67b:bf6b:d9d7 with SMTP id
 956f58d0204a3-67df452af7fmr7339938d50.153.1795669951183; Wed, 25 Nov 2026
 21:12:31 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101194814.188536-1-asiyee994@gmail.com> <CAK77STANn3cS4-=mw59_G31_kFLyVp51N==K9RcikqrYzd4ELA@mail.gmail.com>
 <CAK77STD6wa_ovKONEm1DJy==q5ivEi+1wn8q4ELgyHRufgHSOw@mail.gmail.com>
In-Reply-To: <CAK77STD6wa_ovKONEm1DJy==q5ivEi+1wn8q4ELgyHRufgHSOw@mail.gmail.com>
From: =?UTF-8?B?QXNpeWUgU2FyxLF5xLFsZMSxeg==?= <asiyee994@gmail.com>
Date: Thu, 26 Nov 2026 08:12:18 +0300
X-Gm-Features: Aa3M54pSUAOzKZf6wbB3JHZS9mE1129F6tSVA1J00l6mLMutM_myMCE1DD8SuzU
Message-ID: <CAK77STDz24cPvWxePG6sZehu7ib7R9VEOLsLcVgX3JY7n_tOrw@mail.gmail.com>
Subject: Re: [PATCH] selftests/ipc: Use IPC_STAT to get queue information
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

Just a gentle ping on this patch.

Thanks,
Muhammed

Asiye Sar=C4=B1y=C4=B1ld=C4=B1z <asiyee994@gmail.com>, 26 Kas 2026 Per, 08:=
03
tarihinde =C5=9Funu yazd=C4=B1:
>
> Hi Shuah,
>
> Just a gentle ping on this patch.
>
> Thanks,
> Muhammed
>
> 15 Kas 2026 Paz 09:05 tarihinde Asiye Sar=C4=B1y=C4=B1ld=C4=B1z <asiyee99=
4@gmail.com> =C5=9Funu yazd=C4=B1:
>>
>> Hi Shuah,
>>
>> Just a gentle ping on this patch.
>>
>> Thanks,
>> Muhammed
>>
>> Muhammed Sariyildiz <asiyee994@gmail.com>, 1 Kas 2026 Paz, 22:48
>> tarihinde =C5=9Funu yazd=C4=B1:
>> >
>> > dump_queue() finds the message queue's stats by brute-forcing kernel
>> > indexes 0..255 with MSG_STAT and comparing the returned identifier wit=
h
>> > msgque->msq_id. This misses queues whose index is 256 or larger, and i=
f
>> > no match is found the loop ends and the code goes on using a stale
>> > or uninitialized struct msqid_ds.
>> >
>> > The identifier is already known, so query it directly with IPC_STAT.
>> > This removes the loop and reports a failure if the queue cannot be
>> > queried.
>> >
>> > Signed-off-by: Muhammed Sariyildiz <asiyee994@gmail.com>
>> > ---
>> >  tools/testing/selftests/ipc/msgque.c | 18 +++++-------------
>> >  1 file changed, 5 insertions(+), 13 deletions(-)
>> >
>> > diff --git a/tools/testing/selftests/ipc/msgque.c b/tools/testing/self=
tests/ipc/msgque.c
>> > index 4b4c1ab..f4168c7 100644
>> > --- a/tools/testing/selftests/ipc/msgque.c
>> > +++ b/tools/testing/selftests/ipc/msgque.c
>> > @@ -130,21 +130,13 @@ err:
>> >  int dump_queue(struct msgque_data *msgque)
>> >  {
>> >         struct msqid_ds ds;
>> > -       int kern_id;
>> >         int i, ret;
>> >
>> > -       for (kern_id =3D 0; kern_id < 256; kern_id++) {
>> > -               ret =3D msgctl(kern_id, MSG_STAT, &ds);
>> > -               if (ret < 0) {
>> > -                       if (errno =3D=3D EINVAL)
>> > -                               continue;
>> > -                       ksft_test_result_fail("Failed to get stats for=
 IPC queue with id %d\n",
>> > -                                       kern_id);
>> > -                       return -errno;
>> > -               }
>> > -
>> > -               if (ret =3D=3D msgque->msq_id)
>> > -                       break;
>> > +       ret =3D msgctl(msgque->msq_id, IPC_STAT, &ds);
>> > +       if (ret < 0) {
>> > +               ksft_test_result_fail("Failed to get stats for IPC que=
ue with id %d\n",
>> > +                                     msgque->msq_id);
>> > +               return -errno;
>> >         }
>> >
>> >         msgque->messages =3D malloc(sizeof(struct msg1) * ds.msg_qnum)=
;
>> > --
>> > 2.47.3
>> >
