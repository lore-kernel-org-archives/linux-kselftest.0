Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630E01C4A20
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 02:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772418911; cv=pass; b=UOzUbQZpFdQl3yrkHuapB7iZG1njNEjYp024mR6G4wayXs1yLZ/5w9wGbKcuOSo6Evgm7Jdp8W/CCJzxNMwtctDykuj2MpDNmP3yV4N8lT52zfcoNTwefy2+bDr6kyqiTautGHWEId0x+POWgpCkt8+y0LQNOWiLSDC8VSxV1Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772418911; c=relaxed/simple;
	bh=WowSggtebeQAqQmCbzVvdv14cYYhPsWFqNIFSCrkQEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oBQRAM+uZs0AM6nZPnbH3V26cOo2QCfb4BDYyy8PffqHWuP0BiGzkIaNq2/lSb0lFDRZQUEOgehI9dVSuBCP3sny8iTTZYSE2RO1oUXZtuaTnnaD3QvnDwWC2gWodpcHWmsdngFOkkcujAPycdG4qmo8uJ/wTxrqD6LReKIQd9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNT4r5xB; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNT4r5xB"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so6937938a12.1
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Mar 2026 18:35:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772418909; cv=none;
        d=google.com; s=arc-20240605;
        b=H3z94gSmOHNSIQtR8pGkD9uhcQw89D+iNBTQ6R8BglamGW3YT7/5QKH9637Bj/fI3X
         wkoRcgh56RHKjTumeNnm4rKxVF4BfsHvc1qotCtQtverywRw+cbQopYZkVFGCF48EU/z
         nfh6GdmxHNglzy8I/dMGQ8/212jeK0BFzjwFVW97Ae4uwsOT82NyG5dVAVGHdFdrnutL
         1tJ5335TJH0uyYyikyYx+2I/xWwdfwPKBHsANKeHMBXvbavcFVEkN5KIDe3AwGeOualN
         RG1uqB0ZGBFYCU8tfIKe5rva12zF15sy9kWTbUDZfL8WI1jgmbyfT2nC/X2DsVdVuGGA
         3YNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ggnEVg1p2N2TqchDyaQBPBgs+ckYr8IfKORrdMAUP+I=;
        fh=JslRmyKz4puteu7p/gNM5SCwrgynEIfIiqpyaZdv1JU=;
        b=Kwuo3IFqpzJ2bMlTEWTLVmnOwiX/trd6ssZt+JCacBr8UM2hC0YFdX3vEZvXuczYnW
         dY5qjlfZ3n0oBa1teLrY2q0ufcqhZGKJNmuuzKiDfYmP2cUCLVm71Aac3Z0Rc2Qi1n2K
         Pw1ekvjkIHmcKLXCHB9Or+xTTQYeO9/mak9gi0iLZwa1x/CO6hYoC2VNiSYjWxC88jfR
         jNtMFSEX3IIzH38/DXDZbqf4BbnW0iMgDHpxW0BUOL3XaAMUf3XXjqOuOuRLusDc61RH
         sJnNiA5QuBwa6AVTx2pyiMyloR56mTBOaZRMT+1gej4nTe9asBJVZwIp+pjGug2lphDI
         240Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772418909; x=1773023709; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ggnEVg1p2N2TqchDyaQBPBgs+ckYr8IfKORrdMAUP+I=;
        b=FNT4r5xBIVMAau559pO7V9uRXGaHmXqTS3RdO3q8ku5W0hQFLj5+tk5tIStJrmxLCw
         zcl5QykssVNRRGIgWksMdq58mepO3OGLEHDHh9cyY+KRI1rEq40QOVU/gOUdNRCKhPZ8
         v4hPqel3FIB/sl4UlB2Rfqxs2UQA5NAU9oDDDBQVytjpOq3K54l+m8a30wqUaH67JLE2
         sEH4hrEpEkGkP5hvVTw6w/5qlGs2rwarOCA8/EyGnzfrW+f4kZBSkMvrtPJ8sLD94M1H
         wwimjJMlSEOlHb21CKHUhCHVi1/VHx3rscksr8P/Ptkxz8lSMIFVDX5Ld/blMq5UPHzX
         uwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772418909; x=1773023709;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggnEVg1p2N2TqchDyaQBPBgs+ckYr8IfKORrdMAUP+I=;
        b=YxTkC41hTphhgIDgoOkyFAwOWjDeTcoJ8GpBPwCaHWosO8DidPi+3WNfGdmWgEEcgN
         gNToMScbMCU4YhtQHWxMfcn04SWPcX+FLcp4+zKq05RrX4zwT0Tr+0ottIDiZFhk2HHq
         rDKrDCZqP8YmD8FYol7mvVxNHl5/HV61lRiFuVbPMfkd0kNqOoRT43MfYB8YI+CpWkAI
         d4PdyexWdmuSSbEjuT3UwTXqsRGYZDWUVx5a3erVemBr/IHhq2Q8bFMo0LU1JiMHUPKp
         hj0xbYI2C72ERAiMnuQPK1JLP2STH/OVU+1cH2ECv7/D5zah3yLaVIgjjyP+xPRyq4Ql
         DIvg==
X-Forwarded-Encrypted: i=1; AJvYcCXIoRXq46oovK4gIa4S2JB0demRdlwcISLhDxTvRVH62Lxq6zghLpBo2t7NmZ3BtJQ8VGi+v2umRovzoDZb7QU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxulZs54VUOKF8xp0s7uPYN0Zjud7fzDT3q1ugvjmLN+IjsWNz5
	62o6jOyNXbhNbnyY7SbQsJh3M/tXAEzs3e/+qBO07FU6+/d8zqmWc1wjNJL/Pt7u+KzNr8sGJ2D
	JKne7fbYo5zUPf9L+2o2Tm5ygES0+iyU=
X-Gm-Gg: ATEYQzy9GIY4n31kCIp7nMUuDRR217KKlzXQICtbGkz5HcZ5UqEA8G76zFFQ26vQzrQ
	LacVIDcnfHE6iDYYxidPa/vtXXPPQNmOHaPug9gHGkquhJ2ZsBeGl5TmONeSWuB7WCKLofEVIO9
	y2Tk2QvuTctgydgmnHLBAtuXPEQoWIeRQKLW4axrPlvAro1QjMaUlt7F9mY5ZW1byL6wprjhoD0
	9cfM4+BbQ5v7Yt48DsHtPj57HE3lze/Feoc1ST/X+Bc0XRIkSDnC2BG6ql/cNkpp8wtFDf4W2k1
	Qmrmdg==
X-Received: by 2002:a17:907:847:b0:b88:227e:3870 with SMTP id
 a640c23a62f3a-b937636cd35mr733944666b.11.1772418908369; Sun, 01 Mar 2026
 18:35:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260301011131.4057-1-teknoraver@meta.com> <8eb8c51eeb87f178e92e68bcfffd02701845c48d.camel@perches.com>
 <CAFnufp0rQ=p2qGcpDdJB-SjW=qNOaxFRTrO1TprhKLtds96bJg@mail.gmail.com>
 <b7d028a084ddda66058504aab72032cb9beaf771.camel@perches.com>
 <CAFnufp3ufMfv8BYLNSqJWoybRMcw5FeuFThp-mRBTU9sYUb=WQ@mail.gmail.com> <e8dee2d6856b6ab4752c93f571a9ba582da070ac.camel@perches.com>
In-Reply-To: <e8dee2d6856b6ab4752c93f571a9ba582da070ac.camel@perches.com>
From: Matteo Croce <technoboy85@gmail.com>
Date: Mon, 2 Mar 2026 03:34:32 +0100
X-Gm-Features: AaiRm52ScMUM5G_LGvYeYYAEGC7PkIjrwNCUlo_U_Sve5CZCWvMO6wvgqbXnPYs
Message-ID: <CAFnufp0Fe1X13NXwDLua43BAHsRFZYKLa9FDP3pyRC4-+bb7_Q@mail.gmail.com>
Subject: Re: [PATCH v2] get_maintainer: add KUnit maintainers for KUnit test files
To: Joe Perches <joe@perches.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 2 mar 2026 alle ore 03:05 Joe Perches <joe@perches.com>
ha scritto:
>
> and I think the count of / characters matters
> but if you send a patch that applies, I'll verify.
>

I see that it's used in file_match_pattern.
Anyway I made another simpler patch, I'll send in another standalone
patch, so it won't be corrupted

> cheers,

cheers,

-- 
Matteo Croce

perl -e 'for($t=0;;$t++){print chr($t*($t>>8|$t>>13)&255)}' |aplay
