Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD2444160D
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 10:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123822; cv=pass; b=sgrJWzLZvbex5i37sLSZat/Q28YD8Jx1O//0R0vsUttaLKD5x8g/A30ks5AGDn741L7XLW1oI+3NNH0D2ZtuEjsynmvbh6LOYyNAg0Yw+oke6vJXZess/4x5+g/CCCBTQ3M4Ll4kORaPsYN5dwfqfxhIVB2bbpbSGMwizGcHYX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123822; c=relaxed/simple;
	bh=4pQW45rq8ce0SljkYL8YbelDyzZQu1ML/gJZFCwHnPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qoTxxXlVhTf5AYZ25jcRjvKhfrZCjXbaajMeYTgrGADYlkAMppLyPfy01rqB3OM+/SD/596DRBZOZ3uF186I0ojWa54z9Zqyh7Df/KBkZWDbU4s9fQD/3XtM00hy4TLs15J018GZFNEiBzBcz9TL6ZGi03mUfNf0pPc1F32fJow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r02GL1gi; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r02GL1gi"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b81a2d33f7so832579e87.3
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 03:50:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789123816; cv=none;
        d=google.com; s=arc-20260327;
        b=Q4VDoQjKAshRiMn6qKalTIrO3tG0jxjUp5lY5bxOQfEdmhF3jJg/+ofSaSXOLVgtEH
         niGCCNz3Y9AYKedZL0j1+AVmq0iQv9qcgZbYI0lNxwEUCMnhvYEytBrgGKA0TqPARyea
         TcMLxL+hqjyR4uVy0oCwUbrRb2uQluTs95cmnL+ranIVTEeL96/9zPQ37f2h92soweky
         N39SR+M483be/b43P9JGCuH6cezqNIK8lPG4iHcbDzkjdXKBWRfvVpLzyNodFUTFtiOz
         77AK3FR7M9nnW2KNS8Jzm1+nwQE5fLN+rAbvvJ+2SLfaYAlttTenbxvk88YTCDyqfWG+
         K80A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4pQW45rq8ce0SljkYL8YbelDyzZQu1ML/gJZFCwHnPQ=;
        fh=SAPjakhNW1SO7G2AlOBgtb0sUFz7Warr4CAu2S7eg3U=;
        b=ootqSYXXKjOHlNVQ3s50uzb9xqISvfej8r86LmNPLWx7RIA6JY5NZUS+k999vDJy8S
         1rb+Irfhi50SPJFmFvhEFbCLgisHDXg6+XnZYvOcYa57Ta91LzefxSYs5EWg8SAIq3Bf
         pKaWRkxJy2gtKWP4Fa8yWotbrgskyYkvFKZHSiUnDPBi86Ck/nMcR8asoObKJvBkfJfH
         UkwGyucq3a/D9SkUMEuMpFK3pGHWQqB8DWKznGL7Op0OMu0e0JqJsvauMHYvwwg+/xJ0
         RpJ4hrGCnJpr5qVN5fRj5ubl91YeUe6tFVKXNKJW/UkzLUBZNFgripxdz0f3FzziVHXH
         51wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789123816; x=1789728616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4pQW45rq8ce0SljkYL8YbelDyzZQu1ML/gJZFCwHnPQ=;
        b=r02GL1gi3d79MIsNIxPtM6SHwb1mURzmrq4j+qSDDxO4qVEespU6hCNfZv8YJf23T2
         +Qbam0m1rVJDKUWE8SnGM4GMchL9FdoBpSIzlzxWQUKJlttIF0Kc6fQXkhk6S29CrkDb
         QUUFKUXeBsb8xTFZCPM/nTFRjL4MrhdJiCmhLEVZpfTWJHYCA0S9gYtC5TLDT4EMs7hQ
         uArHR8iQGxBBra7faG8koeprHsTy8jAtZcVMuJGZuv0oJzWjn7ptjLNPbFeDgRoQW+cT
         xIQJbxEX6NHnuD1lBt2uWiXf3mI8np984uavfbnqmypIQpFg5Cd3akXnCksFxPCNfiHI
         LY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789123816; x=1789728616;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4pQW45rq8ce0SljkYL8YbelDyzZQu1ML/gJZFCwHnPQ=;
        b=X3eS3y8eArATlUQUjIh3fwMqb6cdwzVgzYf89urPc/9YKEoIn3VRZUZMk9ug0IDzBZ
         VicsPaejZOrAULOGzZL2iO5R3It1UmgZAHehUL3L+1Z+18qe/yWQ5OgZkspZNkXcZGhx
         tGd8c191IYB4G2bvIIQeiDiIORixcBYN2pFTVF1q3rCLqjAg6dwi20iTBkylcZfhVzlH
         V5FW/TpyBy4dWBY7QGDX1vDY8SMLZmbt1kCui1b2gQfKwxZcgYHXp1bkX8ISY+faJOLv
         M0e9oQ5Fu807yDrApJK7cPAXxycMZhHeLVb0iQcbwFzDB/ZlWVydNw9IPXk7o94L6asB
         Y4nA==
X-Forwarded-Encrypted: i=1; AKwUvBwhty7PazXCgiYnRZaJuuPYjGs9dT/XCydFW6/SljDYx5u/1742OmSKbhSfFvNA7qGw/DFDGsc+O9nZl0UWOpE=@vger.kernel.org
X-Gm-Message-State: AFuF++mu6E6+EjI4AN2ziezKdI9pi9ltEx0/UHlH+1dwc4f8vhL8RRqy
	4+JS3P24kFbOeGa3Z68utWTSiCFIZwmoGc6P5MtERWKuT1LZH5n57ZAQf0gWV3jCMrcZEbyeOSd
	l+IdZLfbcZK0RPZNHPO1GGVOew6z5SX4=
X-Gm-Gg: AYBFou3deYkKxDYz+PMVqThT9Mai9+mCcHmhfK9julJc4AoT1LIAnlCZoheV4YZF4ev
	TrubQKeNhr/JP1KyDOfLDhORYtI7OkMnAbwrFOobbtf6ctKmH5nneomCqnjVhBwLtuCDJCTVEGx
	mNBNed9YgL2qc1C9aZ+RryfSH+bBg/5ThV/ZGVui2ojuS0pBXEqnM+AAht/VDOwVKGPC7J+ihB+
	claZNr+jHpSlGWBXRZLigBPaO3CDFZa9owfRpPc7F1KmLGCEcsYdemUzkdH0jVQRqsIyUp98Iwi
	uY0VPGOlOcpWhPbpcmeWkgTMT4IR+iHw2CGMjYqtXbHjqON4sP8LrX3p0t/TRaA6m1/hcD/S/s7
	PvIjowEnhfYWgPWeIAemcmA==
X-Received: by 2002:a05:6512:1052:b0:5b6:1a7c:59d1 with SMTP id
 2adb3069b0e04-5b8a030478cmr770802e87.43.1789123815958; Fri, 11 Sep 2026
 03:50:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909133247.113923-5-sigefriedhyy@gmail.com> <178904820373.219967.782013244688408761@kernel.org>
In-Reply-To: <178904820373.219967.782013244688408761@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Fri, 11 Sep 2026 19:50:04 +0900
X-Gm-Features: AcwNN1Ww5UgMVw4xzqsqwXvhT3lHEUGGRDbRe6Df1222qEUmMtSjFyZfIiHQZt4
Message-ID: <CA+7S2vJpy8Y7rqBYDdbW-T_2yaBrdb+Bye0wbCRAUhmrvt7NWw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 4/4] selftests: net: test AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com, 
	edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com, 
	sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 10:50=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wr=
ote:

> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260909133247.113923-1-sigefriedhyy%40gmail.com

Duplicated comment as well.
