Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF4E4B8295
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 12:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597203; cv=pass; b=bEuuulcb9kwuMq7aIkNsZAS65ossMcWre3gHC2vrawSaQctvAeJ+fZbaZ4OshnUVBLm2+l3BWYhjvBYRrOGmGPJF6Glx+TlJOK6liwoxLHG0m9ccoXMGLvIxXAPCR8Qqvaun0iHFZ+AKNqd8ty2FxbzHxX8qPj5TgDK4i0RXXH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597203; c=relaxed/simple;
	bh=4evASwW7P7CNOZ4MoQEq5aMRMPrIibSAC6+oJk6cUto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdrlCAx7dhhYtJqCDaLCDBGxOMRFjKhM0gHWZjBgbwNYGODFaxpPdCjM8eb4VKwos5GV+SB8/aLZ3XPRxQN8lFeySeOsAkXLvZ4bvAiV/gllbi4ZYTeFzeso9Is34284Z6rkDDJ1Q7NNrewLe4iDeCyaJMFJUetoR8ZC7tDU3/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMANEXyh; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMANEXyh"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a64d20990fso26768321fa.1
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 05:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790597199; cv=none;
        d=google.com; s=arc-20260327;
        b=bBnw2VTEEO69PesdBg9KHa9jN5g4TfxAGK+iSUrqSlg2A2J6KF6rx+pw0dmbhWlQa1
         NinbBRcFcmRr0rP9CH/Hd55hCy6YQDOztITrrhu+DCmnok63AwnnZABlMD6YqJWX3ami
         tOuyudtXatYig8C8jdAQsokv7BY2DdLZgWmTxXJK4/3pJVuTolAp5Qnk8MYBIUFcFArw
         ELAqggz3RriVexOaCNhdOS1LyYsiBfoPjso8EM4cE6hRrbGXWiW+2nd8F2tOs+HzZZtn
         IiGqa0xGjDf+0nNIPyGAvyu9jLKO1ZO0/qhXUfCaku7G9f59x+ToPOdvPGS7ZQ4Xu8ma
         3mgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RUx7MhWskA2OQjWEx4q5vZ3jkVu4ih/mG02nQL70+Qw=;
        fh=T93w1ZRiFwvpCl5sLEbeVNJtDByDZIxFxEsDvX5KlUs=;
        b=MQjrbGef1CG5TKu3dJsP9gZMLvk7o+tt7dlMgRFiMlXMWpFyNq1Z+ViH2ytra/i+Kr
         Mi+Ksk+Y05peH3iqp4BF2Q7ognldfTCYWamNcBGFXVMohssXu0U9K8Z7BWkgh5ZSDqaA
         9uyzsRGsfypKW6dRGJKyejtzIaqlYXnQODnwk7LfU0+DHEvLq+uF4BwHHnoydo6VVdfl
         Gojn1LjOLLLAEOSbT75SDVX7MVtZHlJMvEwnULMeGasVJGDbVOn1oKCi4MOJAb18mrE5
         4hqjVewpf8pq/qtQ6TwB3eNaClOfvlIiQpu2FoewVKhMCg7WYohdYMuUFpOpXX3V8oIq
         Yt/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790597199; x=1791201999; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUx7MhWskA2OQjWEx4q5vZ3jkVu4ih/mG02nQL70+Qw=;
        b=iMANEXyhN8X9Fx46yLOc4dsg471HFwvd9drJzsZaLtzROzBYRSL0eRM0t6SiAgugeK
         AmnzA1dSY+NUpWCSQv1W76pQoXwTzWqGDIO4HG9Y5mhyByyhkrimn9KABwKwIvwfTIqf
         VoaveACy9JUMsgqT7mLlroF9Dnu5fDbvNrcZ7W85SuEj6kRV6rZpTXHddey6uLyjDjZa
         y2EqPbD9+gBX868s4E+WPaKsLnSCMOLIVx+6S7cfCMPvuam0viNy/Ab+Av8GLn/HMNr+
         Cgyi7rrU8SZx8tVYZNWs5FMoDFZr8AuEfpY/EOspnKXE6OpZboLGqWpYsRVRMI0F6rdg
         8Ogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790597199; x=1791201999;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RUx7MhWskA2OQjWEx4q5vZ3jkVu4ih/mG02nQL70+Qw=;
        b=f3nMQA3TmClLLX5E7MPUCCVD5jikyD26Grnx+QPIXoJJ5GerHP8KL9SoPZl4GZkcFj
         6VEVd8O5W7LxKn68mmv3HvtqUGbD5EeUMwQVCviHzWK7Cr3ieebEGsJjB4bHQtpWyTJv
         LKu0gN6WWRMJMq3VuIf93IInQTs3HJPgKmIKYiqgRbReOk8zeATOmNFOhSWrB9T4fujn
         yjPvQP7sZWhJ8tjGUP9i9HxfpI8wO5boScP3f5q352/SFqDfBmLu1/RvMjqgDVbsRbAQ
         Z1jjBpIQPFc74V6eWK2TlAxNoCUMBVsp6811k03o8xFP737K7kV/2s7bhB6gQNi4JM4D
         rlCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqUrBdoe69QbkchyV5q1Nqg2dHfTzSl8UhOki+pbFeeK/7Azv0s0XS4/9/ZbXFudVQz0O3ve8JI2OuhRCInGU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPuTFCs6lQs6KcemUGU7xCcy+sz5d53vvZIoUsk1yqc2Xhaw8p
	1Yvb+6eqZs8QkZAOcv4hwc6S0bWhVLKvIdbGn9V2LJBiJ5gXMa5VlwGJrYihiRjuOMegIwYNeEc
	q3/X+Ne1237WGPo1IfQbFSIy34VXPNuM=
X-Gm-Gg: AYBFou00u7hGN+0q1iwZ3f2MYaeEh5GC5mzceaS/brRkzPk1fTsE2BtmUw/uUvU3uo4
	2Mp4CYaVJYhlw/LRQxfrLIYepj9N694AEENbfvtEXXFGufcflY8+6H6gL0MFYVCtZqjZAYkZyrS
	rSesMyXc7XjvN+z/qxTqIdth7xab/bYOXRMqBzhXNLnj0eJUOxZ4RtfBsia2HQS7Z1SrL6sYqXA
	YswYX6JBHyxv5YbZfAhwkb30/vEKSkhS+3RfbEzKVZflhULE1X8cGQ8chab1onnjYU6nd90Y1v5
	m1yfIyQL1kD0rJpJIQe/2Gd1Y5rhFcJ78xTXnUyzjfj3oX0pprlxZvbWV6HeyEiYmP8m++0s80s
	+93ugZXy0HdbyIApX0nbi8q6mz/5vIxf29a43mJ0y2w==
X-Received: by 2002:a2e:bea3:0:b0:3a6:6590:fe9 with SMTP id
 38308e7fff4ca-3a665901989mr11898161fa.23.1790597199210; Mon, 28 Sep 2026
 05:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927002427.4519-1-sigefriedhyy@gmail.com> <20260927002427.4519-3-sigefriedhyy@gmail.com>
 <cd00e6e7-aa2d-4f98-8a79-083b64b3376a@6wind.com> <f72a5150-4c75-4d71-93a8-8b261ca9762a@6wind.com>
In-Reply-To: <f72a5150-4c75-4d71-93a8-8b261ca9762a@6wind.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Mon, 28 Sep 2026 21:06:32 +0900
X-Gm-Features: AclHuK8vcBPbo8FWQrndniQx12n1nqnhRIJrnPMscvT1DLMWqohrVqCxkvZ-fP0
Message-ID: <CA+7S2v+hDjbJV2akWHtospORWSwkPuLWeDzidUADUq9Mh-Ag_g@mail.gmail.com>
Subject: Re: [PATCH net-next v8 2/5] net: add a generation counter for dev->mc changes
To: nicolas.dichtel@6wind.com
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>, 
	Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > Renaming  struct netdev_hw_addr_list->count to _count would help to check all
> > users and highlight that modifying _count should be done with helpers.
>
> This comment stands.

Thanks for the clarification. I will use the helpers in
__hw_addr_splice() and rename count to _count in v9.
