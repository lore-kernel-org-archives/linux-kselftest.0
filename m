Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23E73F788E
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 17:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774459085; cv=pass; b=gXDxNAKLyn6c/z+BPznEp9a3ukSTsQkfQ8UrXvB/wZxiBgxcfMejNqh0Eh9eWoILL3sJ0YP8bHn/8XiNVOli/Nc/TSZvcwhEkp0NN+ibs9Ji8Y2xpbAsIwrb2PLqZLUFUAiklBvdCYGbg5NJPq2riN83/SduTsXTsH005rr8ueI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774459085; c=relaxed/simple;
	bh=QKaRPYMdlNzJVsqj6JYa0b5bId1rUEMfyl8IBcSL9bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTMyy7WVRn/dN9Syz0ngDwCZpbFD7YX+YL2l18yewKkvvheZE/q7GnDbLwTvR7qcxs4B13ekw06g3GIh+NWWI3YI7NWHv85A1Lhu01IWpVeLI8peR82iT0F9Yya87QmR/WyDadu75A8AVNLJ4NZhrMAJ/ZtDNwYKaxr5GW2lMsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yez4qwMa; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yez4qwMa"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12a74039dc6so68844c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 10:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774459083; cv=none;
        d=google.com; s=arc-20240605;
        b=QJq4rEP1gXIdxjUCbTtVplaSk0HUqcSNuyajSFXv7LDo476rixZui0E6V0rLjS0/LV
         nXa+CVnhSH/IjCJMSiz8U1AvFAVdf6/OyTXeun0F+X5gZNRqm+FegBbFTLZjQa0KpCsH
         DMWrZ86JokW/ZFjZJ1m3NFjEL81z8mipovEzZV3nzi64TLkjyo4BLbILiuShZtDt3+mL
         MXFqoTIXnLQBnfvZSvNF5y2H3pMtw7lMxxOohRx87lWN11Qf3c+ykFh3HMD85bvlqI9N
         cl1NOT11uL/Tm0D35ZiysZEBhyhYptXiNagUNuY4Tgi8aSVW9AwkRVMWm8P/WU/43aAH
         5eDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QKaRPYMdlNzJVsqj6JYa0b5bId1rUEMfyl8IBcSL9bU=;
        fh=9hp2hDmO1WwkhNBwDYJNFak1uW+Km0UxbYpj09w4+FU=;
        b=QKfZ8LB0tEi8HZUzEUVFLcApMadRGBIK62lit1V4CucPK/9vvbkArYsIZyCg9gdvUc
         mudXOkn0kTuZYEzi1wY9u/TXvOZqnqfQsfktwAUU1SYp4N64iVGRNLpVPzbSD7xAt/h3
         7io0P6OwwZuTrzvE/dhndivn1h8Otlt5UTCDzMAscSKdRypFUVEffv8OckTtpmzXCnrz
         tUQGjQ7t7x68kwku2orTj4yPTs54vc6i7rb4IRrBjrLClS81L+R8DvvcjNYbNxatWIoV
         pGu3tUrK4brsGkGcz2pP5C8hPbjyvFZrB7bQ15+NdDf1WSpl5WxqFK9r7FzwmNUqjcz8
         qe4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774459083; x=1775063883; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QKaRPYMdlNzJVsqj6JYa0b5bId1rUEMfyl8IBcSL9bU=;
        b=Yez4qwMarx0dKOqNDJ/+pZvuCs5vGMYy4fiYvcvSE9XygkZvkYhMPfRg5VXvGH7UyS
         NXPKNr0qM+JyJlF1Qkr2qfpJz8QFq7LYYSvEuPt+9FMKZESOV4G1S8FtJS++cA/O1/qf
         VfrT6ohWUQN2QleQG+Tt/tGa4pN7nHOdzbyLMFpZ6tvwHIUBBrjCzORlncxIsByLY84A
         uCXkX8nF13Z1c3QRbNRHZO5+BVqT9uzjD9xoJw8PEB4t6CqGgfHI6IEIvJAZFQy59+0W
         nL/uiNi3wEFpWrvmRSSVxKPPTPlIhkwyAv33R77upqoY0ZBe8bit5f5ocKui12QWCMJT
         X/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774459083; x=1775063883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKaRPYMdlNzJVsqj6JYa0b5bId1rUEMfyl8IBcSL9bU=;
        b=dJl42vc9+CDDaoB883g8qZLtUhU38Nfd17RfyOPNUatQ5lKsUo11wBbg4tN/mOPrKq
         s/e8EG0cOCG6nvWoHMVToRRrOSbXLQJuGJqwUssmndr5pUqsOt0PRnzqL426TNcwO5yu
         JPnDyXhcIkNap4hYsP837vqBqhqHkWwXZCvG9kQRPajnR6cUIxPYuS3GIGUHDv4WwMYq
         5tnnT5gOmue8hY7iVcZE4L6mWX+d+D9g/Z654KhFHoppLFWCEd4Ar5qoTjjBiTT7jy2F
         lV5tEqnNRAIyD2RMSEMiHrScCZBgkEJkhklPnTAtZaG/YvIHwm9A4RVbhTy4HaCP1OFn
         5heA==
X-Forwarded-Encrypted: i=1; AJvYcCWkQHGLRWGtmyYflR+sjRGcifV8yXYpB62tiGtzSwVYd8QTRyO7J3ibQrNpkJ6qbWgBSvi1ev+Qsq0mMhmmDxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ23TlT3z5jpJFUdojOa2g3NUT9JIFy4fsTs9mJZ/0qe8qakO0
	rjDZrBO80n/xX6A47xZnyqte1IajTJAloIC949+V4khivxnRWt6M8BuU9CsDN6OpY9y3OB6etUI
	PUfqoKijMWdbAnQZu/1SKLCDvjq5qAsM=
X-Gm-Gg: ATEYQzwn98xRHfhooa0MOFJnwsD5+SpMUeszKQxsHiNuEmbtEw2l9mT7x7rR3eTVqNZ
	EXtJtoSHzjRw2BZ1YkpeuEBjwUKaZQZaP14PalyA3ycvagP2E3ZZBIwBcTO6UJsw1azbGsT8iMK
	cHZXfH0YaJJDJYzdGVPZyf13JqRifoCUo4sZFI+hj2RpR+Q8LXK5Fn+V82bn5Cfp+R78CkwTs8W
	Qzs9wOIXYJmWeZolLJLJHIx3fzz/MEpug4Xr/l42/FHs+st51mWSikThtVE/JGw5Ob1obtVZcl1
	X41b15/UrAlq3483htN7UsdUh/Azc//1zVqWJ4A4
X-Received: by 2002:a05:7022:620:b0:128:d39a:b141 with SMTP id
 a92af1059eb24-12a96e71260mr1904933c88.17.1774459082953; Wed, 25 Mar 2026
 10:18:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324205301.1361608-1-atwellwea@gmail.com> <acOVlten_N_5evGX@gandalf.schnuecks.de>
 <CANn89iLJJ3EF2-qe4AWJN0teh05x0PPJjOAfB0uG9rNZuJUZUg@mail.gmail.com>
In-Reply-To: <CANn89iLJJ3EF2-qe4AWJN0teh05x0PPJjOAfB0uG9rNZuJUZUg@mail.gmail.com>
From: Wesley Atwell <atwellwea@gmail.com>
Date: Wed, 25 Mar 2026 11:17:52 -0600
X-Gm-Features: AaiRm50q0NC-_83d6Ruz-7T1f7PQXCUqvxlSqVnVeyorauR8lF6UhfNAetRcvxk
Message-ID: <CAN=sVvztL+bc2So8F9x50yQypyLEmEm5bWHzkXOOgdPFLG0MNg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/3] tcp: fix scaled no-shrink rwnd
 quantization slack
To: Eric Dumazet <edumazet@google.com>
Cc: Simon Baatz <gmbnomis@gmail.com>, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I still think 2/3 is a legitimate fix. To clarify, I was not trying to
claim that 84 is some magic number in the abstract, and I agree the
packetdrill is artificial.

My point was only that, in the constructed case, the old code can
preserve a scaled window that is larger than the currently backed
receive space, while 2/3 keeps the stored window representable in
scaled units.
That said, I am probably missing the reason why that is not a problem
according to the feedback you all have given.

So I am going to drop it here.

To be clear this has nothing to do with social engineering, just was
trying to fix something that doesn't need fixed I suppose.

Thanks,
Wesley Atwell
