Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5E738F92F
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 03:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789010493; cv=pass; b=YkCO1PqTHT98mWGOJgufjwlxv8sCKmqyOsTj9ZrHmTHHVMrFaJJs71D+cErzDlNrY21TUn3uAfk4QNRSDRR9aYs8JPW4/UgofXRYQ24T67RceFbcp5poBi7Z0xRpUqTXiDYpbrXhnCnWb0weLZAubNv4Zi6vrTZON0SwootJWfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789010493; c=relaxed/simple;
	bh=d9sO9YfjOMtfhkKI218+Hml8pdw2xki6+3ssCBL+UVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+67bBndrpOg9CYlN7HoQxyI6OzqtnJgKPlmNhcgDswSNuPKt0wEQRzGICF9FQgPMtb6ec8tVAmbVXk1HTUBT4KRZE1XSUH1WfdZdD8/sNo7AfljnLC8e9t4vWyNuHQPuA5qxy8zEX13zD0H6UPcj61tve9VrXXFiRO+0+3j8lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWQ7MXUq; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWQ7MXUq"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b76515c0d7so408859e87.0
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 20:21:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789010489; cv=none;
        d=google.com; s=arc-20260327;
        b=Af9A1OcdEghXe4CbzWqQvvCQaMPx735OK+I9Wu2TbOm7W/ZU2AaYyurg32+9F8ptdx
         +Ge3u7cWxpB6aC+3CVlomAmjcDoahyIbZUchQLAW7+odjyP5DW8w+aYGzMAEYPZ/reTS
         V5ON6yovDLDie5KDUwzVXKdp2ClgCRmeA/pZNc9bcUYCRpzrZkeWUg+DgUpsGWyL19qZ
         x2EsW7SVVRV/lryMPhTVTX5FeLGa7aXMgzX7gQi6ezYjEUv/dw7HwF+wU7RcViQQCWMk
         fzGN0EboKDkUxMMWUwmN0DShohuVm1FE2IUdb0QPtAI8D57cbOzpING1pyM0A6X/edGU
         8DRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d9sO9YfjOMtfhkKI218+Hml8pdw2xki6+3ssCBL+UVU=;
        fh=ABIVTfr+NjAV+XpLsISu1mE9HuAz7abLa9GAw3t3ZsM=;
        b=pe/fes9kY59bwi25LPMS9UmnHG+zaWjI1mz0IXSsD61y4YwIF8HC0HCIYZvnKM/Lmw
         ko0tXmhaxb5y0Cyyr+Qy9wfmA7X+SnmfUbxKSF4A6c7UzD5prNB6WjG30b4TZlLgBtgj
         UraKPlzQOsN4L9T3tQOb6j7NewfBDr19vXdOMYB679Md/nkhgjfqsD0lQ5x9lnGSp/AX
         paDGQiTgR/oHTqiTe3DuFXJvRgKIcWulgU4eEen4AmrCOd8R7puS6DUvpsPwxq66yRM0
         c5vBJejMD3egVvBxJ4PvvN6jxPON+vRUUeqMiYThj5KSFy70UGgT7h/6BT/GhQCoTL/0
         8QYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789010489; x=1789615289; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9sO9YfjOMtfhkKI218+Hml8pdw2xki6+3ssCBL+UVU=;
        b=SWQ7MXUq8hWauQt3woccc8fdoH1ixQ2nrXNn/BjQWP80zEtOoB9H2o/2oAUCncxq6z
         +LYl5JKPujjfKOuRZ76JqFLukjKgbmksJ4vp5iXC2OUDcfmVXMl34PjJjnRXYewANJ1y
         PI5zLMp7k/PYQQMUluPqoy0KRqVRVxysSr5PUDc67xGZ9FPPAn3hU1B4KXC2G2rP+DVe
         jyzdov7KQg7afQKPXinC06msaYTylYaeiTuKa0i19qf0lKpD/sctOmNCz2brzq+u9bLy
         kFhBAROKwzpc3v5aogPct0eS8UDOyWnomU4AhnHctSIwZq7y6+0THzTK15vwZzN1lisP
         UnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789010489; x=1789615289;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d9sO9YfjOMtfhkKI218+Hml8pdw2xki6+3ssCBL+UVU=;
        b=W+4yjwi9RbVOcr7pbBxgEzqECebsEizemnEqYpzI8g15TMjZ4hefz3yC0GgRp188wi
         lMPebBG4/R9d8NY0mqsd1MLo6Sx+6BFfWX4okJGPVYEOl3JWYd1Tk2vH4pOV4JPHOXpw
         ZRlkQhEoVpmGVIHrvKc7APhvqQds1grD/tkxYkEOZfbyit/1XtWVOJwb6ST4iXQIdtx3
         q6WM1i/PTQwbpeIR36bxy5MuV9qT5S41wEySGznFn4HzRNFQCZB7Lt4OxRN3bns0eGKM
         m2ZLs/hzA0C5GFzi//CSYLqxdOrc/pBPcEeHlzTGCBm+8IjGHWfh3ZApm6O1ozUhetmV
         cHuA==
X-Forwarded-Encrypted: i=1; AKwUvBy918FIT/+ACj9sPHAZB0pmrM22XNzzgBBB2v5TDzHfOLRdzzFDdCKnxOdYOzfrod2k8SWSVv6GADECoA6xduw=@vger.kernel.org
X-Gm-Message-State: AFuF++lZXhjSsA1cxJ4RK6RbAILdWDOvmFBYflO6M929AlKSHVkMip2E
	3R1eHtzPCejrz4mH9V/IMRoKnT4nzGjEN2Kh0ZintWZGmGva2uYTda4aMfUHTDAc0HyXHQNeznT
	VZxCWRBXK+H4YgYJRegUZnv3tsJ7u4sA=
X-Gm-Gg: AYBFou3bj/mmWtEl5LFzPLPuwoZv+9k/7PKgEOVAWqvC7JqWcxsLA+tbtrIGxm9S3nY
	TV5sV0MU6Mrnd7Vq4XRsu7o913e/CJlYxRrUICIfM9SqfwgdZ3AeF+izAx/Wpm5e3aaaybyctov
	DkzMZvWI/TQEpDqAT64sWYbMbqJc9uGxjq/dRM/7UDRlhorP5ebM5Y9OtEDicnwYFqhOPWu9g7Q
	SbpPkVzP0vbTBjuOBZPrdhOb2ZE3oRACVT0rqyTuisItPKSYo5quD4iSEkSLPtYoNDNi05OZIvY
	pupn1Iyjo0uU6WEuEJldzI3znlfdmwpMMbPltkB0MVGFYUgGWm9Afkcem4NC1IbV7pqSkR7jsYX
	+uEZH2lebVVSGeFYh4gUdWsfiYGtqi3PZU95NiHTnYA==
X-Received: by 2002:a05:6512:1307:b0:5b5:e3b0:231 with SMTP id
 2adb3069b0e04-5b89a2fad8dmr399549e87.13.1789010488773; Wed, 09 Sep 2026
 20:21:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909013401.14408-2-sigefriedhyy@gmail.com> <178900489222.219967.5701707176821161509@kernel.org>
In-Reply-To: <178900489222.219967.5701707176821161509@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Thu, 10 Sep 2026 12:21:16 +0900
X-Gm-Features: AcwNN1V7GyyXN-MLzIxbdYaXEdpcN2buyxt9nexIpKd7w-_caM0SlF_aUp8xaeU
Message-ID: <CA+7S2v+kkzOxwp_o7eJ6e8gCGhqvN7ua52jsBNsCM1hMW79VNA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/3] rtnetlink: add AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com, 
	edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com, 
	sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Could the changelog drop or reword that claim?

Okay, I'll drop the claim in v4.

> This isn't a bug introduced by this patch, but can this copy expose
uninitialized bytes from ha->addr?

Not related to this patch, will send a follow up.

> Can this positional resume cursor silently skip dev->mc entries?

In theory yes, but this follows the existing dumps: there is no
generation counter for dev->mc, and in_dev_dump_ifmcaddr() has the
same window. I'd rather keep it consistent than add a counter just
for this one. If the issue is really worth fixing, I will send a
follow up to fix both places.
