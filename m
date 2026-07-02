Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C664ADD87
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Jul 2026 14:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001124; cv=none; b=YaEKV7G96PVxTDdWo7P4Hc/kYaTWJnv4Pv0LUsZ9Ev3+7kWHDd59sK6v1QJJgHyI+KoVBbv+XXFkaVHA8SbZefIjYFy0K2dZ5yQQ/GMm4BuPGIDzx/ggMLKedyZLG4mdzBRTEUYfD8q/e5YocyYCYQ6u3ykeOOiCiZn5Xb+UFUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001124; c=relaxed/simple;
	bh=qUEcJN+VNY3vPIEjLWC2mXzZSPb6dO6MrsrL3Biq2n4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ksDb5YuLadBPUboxRoOSvcf+QCKMci0eGGTMZXUNVXN1kqz//KYlmUXbyphPiw1diq4/hUYunNQcZj6rcBaI0qgpvjU8DncYv7r2tv3Uy9by33xseKQWn0dq5mdIa3NuWheVnTF3WW9Fnio+XbWYhUz9BjuWU1It9LtAsm1T/U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qc7lnDWo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MdO8/EkH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qc7lnDWo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MdO8/EkH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783001122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qUEcJN+VNY3vPIEjLWC2mXzZSPb6dO6MrsrL3Biq2n4=;
	b=Qc7lnDWoHs8A5TCWR9VajMpFgnZMQvQtoCbPf4A/DmEl2eVWFzyD5o9BqgC3bz9IF8yVc0
	uWiNjUc0yikWuZsL0XroiMkOIKLgue+WGbGOWy2R6k8RKQmxshIp1k+pHZoEqpxYp9Ye2s
	X0mp23UYGBHaT4OHiYrjDiJaOIFt/MM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-twrern-bMcqw6Nskabo8UA-1; Thu, 02 Jul 2026 10:05:21 -0400
X-MC-Unique: twrern-bMcqw6Nskabo8UA-1
X-Mimecast-MFC-AGG-ID: twrern-bMcqw6Nskabo8UA_1783001120
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-492488f8583so28063075e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Jul 2026 07:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783001120; x=1783605920; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qUEcJN+VNY3vPIEjLWC2mXzZSPb6dO6MrsrL3Biq2n4=;
        b=MdO8/EkHAqh65TeWrlq30RbQMB3zTrokN75M1dkA6wff04DB8vqOAC/cOtXFeIGn4L
         6kyxyXiB/CxtJtMD4Al9T5EEPMBzv3bLUisonPKoUyiw8k1UkcbZ10KfjpasjmIOipPn
         G8Rj3dRNKqmQ2gWrbG4ZV1eeiTQuV/tGdnonlKjgvpqjApxJeYHVLFUfjcq2PzqfXCUb
         YMy2ZOpMy6p8RIvuTb3j/q8ier8OdX6pOdXG3ydSnJfUOLTX54zC8okaXH29b2d8aL/k
         XTpEXE2Wpb3mlM5eBTB0/NOv02crJCAQCpZDMALqyMEy3P+LvIscW5SqmSQ+tu0taxTD
         ufdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783001120; x=1783605920;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qUEcJN+VNY3vPIEjLWC2mXzZSPb6dO6MrsrL3Biq2n4=;
        b=aS8UViMOH5wWR9aXqrUxcDN59fZ2qCdsXte7T6wSLYhlKuRiJoEPnPw3hDaoFLkwGE
         vYKXZoXsetUzzokLTJBdN+zK4rmTATnKw+eW6MSGB/dpRC7KEDx6LGSl2TThYiglHIJ3
         n8B81t1dBZGq8wonsvxKpgWb1rVFNYhsEaob8c+oCdXSN37gRPJHZiNq9isbCxSqBAt7
         lxGdy23KuF3lAg5WmecvotWeK/01puc4dRYWM0FOdbbh0I2I3oaI+oLXdVjN6yMCYPas
         dCWQC4EHpraEI9qJvyy7oq9xnnvxD/eOqlf11DvaXwmw519W3+rXkhzn6FYjCNqCGSKI
         6XcA==
X-Forwarded-Encrypted: i=1; AFNElJ+3izmdblrww3Z9TXt4UDqFUoDeDIBJo1qo13L13Dp9fZBM9jWMlTvbW7Wqel/UeWG22pOzIRA87OLQxCMuWAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YypRIbFSdsFEMuHMp+IJ72WjmDBOpHR45y32ef0J8p7INpQIGm8
	mcdBWRDfbJXe/zXy8hxvjA4ARu1Gm17WFyPAbOw3u0hrd8Mv5oSIyt6/Ggh+WqHxydGnpHJQRTM
	VT2/ex/QffrHUW3AmBDKsoE+Dh7+i1xFX2628Iw82BIof16ugO9FgujT7j7tjs1RMDmCrfg==
X-Gm-Gg: AfdE7ckcKDhncCwV+cm9UZ43x0ro6kmOk7GP/Vbs8T22oOCcz34v6SygY6hdAre2u2S
	g2sILqvz7LjjY/FPnDxx7eNZZgWPVgsAz11G2Rtpw/CXFYRLwdAMf5ttgYj8852oKaq9hcpaZJm
	gLZG2DtoAoKp6VGGVDJaEJCgATCgeZJDE09kSgxooyWWVNnGGH+/Pc+d9h9H8H4nJuZs0wHRfhK
	xvqUfRG1UuwFSZqpdfNsa0gF4KCaDxkWrpmRxN2pONkuUOQG1zIWNw5eufgXPqt8EXuDWsFx5z+
	wm5yoWd3KyJZLr5FvnxfQfbSAxmgL9d/ikI+OsQ4735mHKbsHikxXhqiSJaDBYfd2lpiNZ+1+Y/
	2KYNKRBeNoxUroUT+obYtJOycJqvGl3/9lFxG3MW/WGhEXNTgnLFsOV3c5dedhU+DTberiJ10Oq
	jRKTVr
X-Received: by 2002:a05:600c:34d4:b0:493:bd2f:c5fc with SMTP id 5b1f17b1804b1-493c2b3d569mr88773725e9.15.1783001120009;
        Thu, 02 Jul 2026 07:05:20 -0700 (PDT)
X-Received: by 2002:a05:600c:34d4:b0:493:bd2f:c5fc with SMTP id 5b1f17b1804b1-493c2b3d569mr88773065e9.15.1783001119554;
        Thu, 02 Jul 2026 07:05:19 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0f433sm10696573f8f.32.2026.07.02.07.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:05:17 -0700 (PDT)
Message-ID: <3a288e8df5e253fd2a9707ad08a47fe34106d648.camel@redhat.com>
Subject: Re: [PATCH v3 17/17] selftests/verification: Add selftests for
 deadline and stall monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Wen Yang <wen.yang@linux.dev>
Cc: Nam Cao <namcao@linutronix.de>, Thomas Weissschuh	
 <thomas.weissschuh@linutronix.de>, Tomas Glozar <tglozar@redhat.com>, John
 Kacur <jkacur@redhat.com>, linux-trace-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org,  Steven Rostedt <rostedt@goodmis.org>, Shuah
 Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Date: Thu, 02 Jul 2026 16:05:14 +0200
In-Reply-To: <5ca104ab-cffb-4090-9af6-06d173e8069f@linux.dev>
References: <20260625121440.116317-1-gmonaco@redhat.com>
	 <20260625121440.116317-18-gmonaco@redhat.com>
	 <5ca104ab-cffb-4090-9af6-06d173e8069f@linux.dev>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-06-29 at 00:58 +0800, Wen Yang wrote:
> > +echo nop > monitors/stall/reactors
> > +echo 0 > monitors/stall/enable
> > +
> > +echo 1000 > $THRESHOLD
>=20
> A little worried:
> If the system had a different value configured before the test ran,
> this silently changes system state for anything running after it.

Yeah that's a valid concern, I could restore the initial value, but to make=
 it
absolutely safe I should also trap and restore it even if the test exits
prematurely (e.g. on failure or signal).

It shouldn't add too much complexity.

Thanks,
Gabriele

