Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AE7379C5D
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 03:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011009; cv=pass; b=uKmH5ILcpeq6hZgcwFjlgXm1e4I8qcNvvnUmqEcKJS21aJ+bAwS7eDl71h3gDpx2paKOXF0x86st1r3lK5URrLHpHF4UJj4urUGjFufMDHy4lzA37B4451hUENMjiH6Py66PFg6A5uQS+66rJcL+TEdSZ0O89tsJWMfczNiMJjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011009; c=relaxed/simple;
	bh=hKMQeXyU6ts+i8KLdl+j8HVFtkABo1p2PRJLujgXu6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kskK+Xm9J6HQNVXh8sw1nMicw+cCU696FXoCz9WJDN0LV57NQP6EsVbGQBRLWOkWfGcemZTAvBPX0BxqEnkV1IN+SHykL2rdcPAtAnWyeHMXPjFQ5OOE6H87jAbyUXv2LuKE9JM/T3HccWcFVm5B9Yxm0nQnVZ+eTWeJsEig1xQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rndTuQcT; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rndTuQcT"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a1f75277f3so47224181fa.0
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 20:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789011006; cv=none;
        d=google.com; s=arc-20260327;
        b=ZMDVsdqv2/pYctMEbkUoPiOE/6IYgLUhtv95RIy2u7PIHtd5bDkLZ3XhssXNi9MsH8
         xxNPkHqSYtI1ljgp0uBVXvf6+uDKIHOhpuE7l4PkPlpKRVtXbQ4Zj12KQfTKU6g1Ru5/
         Mo2wjrCorljHgni8fr1NQLCfGqVRGUhA9aHDWAdIZtUuOVB/QLUORiadml6lKD6M6Fr1
         7U1uFl1dxez+UhbcN4zhgCvEF7UqAyja1GU/btlnffXh5ztbdGZAY5PKOqETIjVywi7H
         S1yZuBI0gDhCIkf8OETJ9kf6jpTRC1lCPAp6COVFLyxpvj4qCJDRsq40ewwYgu72Fpl0
         xXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hKMQeXyU6ts+i8KLdl+j8HVFtkABo1p2PRJLujgXu6A=;
        fh=vn52B/EzaCcWF2XhsrGsBLZ3FzEHqEW+KEVLBL4VV7c=;
        b=ONSMysBr2i3zm6LeniD67A/SievTIiDodhBqVIkWQ741t5kK/hVFo+fD03sNkWSxTj
         ybOmk8COHjsJMyVdYE5QdeKOi49bJ1SH8XLb5U6qIRR/wZpUNeRLPcCgjr6/r4TqdiiN
         kTte2er9fHR4QeimPSvZIQsymiztHM68Rjw7jH1e97FNznu3I+UOZKhmKk9DAJthjwnk
         EXcYda6bwxAT+H3vxYDGBKOTm5FuIlOEJ/vm54EVzp6GjyUhKdUM3BHTmJfLqWCwjUBG
         k1JaCufGAA2lntUD+r3mq+SdJNIuXB2JHCPsiepb57WhDJGrkVZRsq1znYRwF6OVYs98
         6pEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789011006; x=1789615806; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKMQeXyU6ts+i8KLdl+j8HVFtkABo1p2PRJLujgXu6A=;
        b=rndTuQcTR3/p6AQLnvqjbub4fh024UNfav+TVU8WF0N72b2LoT1bcT9udthf0DYUJP
         6fzQDj1dDCHnGjfdCNMAn7zG3SmHZW5S9hKF1rNsvQPyNAZiJTXADvCwBQm/Lrk0Gw7D
         VpayIdwDdwXvNXpQMmqbnKjyznyR1ZdU9UfYL1pWnBAjr/BoclxOgxwUYCEiauEqKgFh
         xXB5+hPQOvZBB1ZYUIudMlqOS1B7f7hv1iaKEMofr0kvwGAn2wbfXx+oscyTJSiqrSfx
         py0TPYZ2MJ9z6A7Z7U9LxhUwshwKJYP+GWNp1wJQPol9tZiPTtmyNbuy/eLWh4vtGG5x
         LkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011006; x=1789615806;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hKMQeXyU6ts+i8KLdl+j8HVFtkABo1p2PRJLujgXu6A=;
        b=cNKDTObMV5wkTljyrtNDJ6H4V9mLqsNUHqydJrbNT7058zb1jsSpFl8Tzeke/DeEZr
         odRI4OixlzJRe8BWqOhxBITB+NAWWi6wwc1EybuyGJXck8L6pko/EmK5jPw+IH1RwMHv
         JDEg+srnHsMm/YbT8etd2N6tMTAgH7TPur68DL8qTnnnhVr23K9lHWVM9SMWBL9ISFGw
         643lcXW7XDUW55mjHwPvGFBJ56TaKVHssG+mlnjIFkUzB8ETTARHZJOxu3neLvbeyUoq
         n+JMcquQF7k5yMwZDOrKDTcfinrTOA5DjTfgujsqy7Y88R7aMQV+R+L3imlVoKZgDCgQ
         Idyw==
X-Forwarded-Encrypted: i=1; AKwUvBx5BsDDtJ2D9aTzC/tpYJSXJTyY6vp8S19xgy6LIsOXYTVC/uNJ++2AQhQWdqjoVNjjcsZ2cnm7bj0QfcTBhSk=@vger.kernel.org
X-Gm-Message-State: AFuF++myKoWy9Ftr4Lq2zZqisbvAlrcZWsZFj9yfqjUaVo6+JUQnEtBb
	EJ/QhCFfQVOUegeCuNTfshT/0NaNEA1B6gLwkm+kS6hyfZ5RvExsFenhjql9VYTd928yrL5I2kj
	MuT+nYZ5+2CYAMa0mKbOI10g/MnOy65I=
X-Gm-Gg: AYBFou19fk+qztu2a3pab9yyLCMUhuzReo551wlgQTLQTrV9MrQh4BDoHKgGgMSMxAV
	49Dw6iRiAdm5B6vEMiZ1KORJJRn2P9XngD0zkx3ipb8sOwT0Z7Q2Enue+ExWD6WAfmIiWGD2Z53
	+co5ajdpwIHEWqd1Jhzz++ojh+fKEPyr06ETp8ceG457kloXyWOmYJBAmpAPD0LxfsN7lFGTS4l
	FmwwIJw7gllt9d5a4vN64mE/0b0TQERseqkBtEOV7U6CWZ7W4p8Xz17B8LMVGVjeg3VYy6/W5++
	MqqpHJtACFbGjskIFNK0rbV+VlqWYit64WtmKBs+xirQfoV9YEQhtlLuBGawuxHcixlfPkye5js
	/Tck2IMGaPSLbdnmkC9CS/EgPhjjK44rv1Gm67S7KkA==
X-Received: by 2002:a05:6512:ba3:b0:5b0:137f:9476 with SMTP id
 2adb3069b0e04-5b616f324cfmr8459587e87.16.1789011005505; Wed, 09 Sep 2026
 20:30:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909013401.14408-3-sigefriedhyy@gmail.com> <178900489382.219967.10423938088246016510@kernel.org>
In-Reply-To: <178900489382.219967.10423938088246016510@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Thu, 10 Sep 2026 12:29:52 +0900
X-Gm-Features: AcwNN1W3iAVVXhnzuL3KuPFsuIhRBn-XyXWkWtewcmOJpG0IlXnw0mTZipXuuMo
Message-ID: <CA+7S2vKWh=ERReF73qhw3Tzz4uxJyjxded6MEvjSzkq6yP33Hw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/3] netlink: specs: rt-addr: document
 AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com, 
	edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com, 
	sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> should it also mention that an AF_UNSPEC dump does not include the
> AF_PACKET entries?

AF_UNSPEC dump returns -EOPNOTSUPP now, there is no PF_UNSPEC handler
for RTM_GETMULTICAST, so nothing is silently left out. I'll say that
ifa-family must be set in v4.
