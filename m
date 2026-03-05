Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DC336922E
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Mar 2026 23:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772754964; cv=pass; b=OxzzIm+p3G2UPO36g00cl+i3xAcMT++YdunOkj3mqhKwWmejqXgkKz+0nB51QJ/BFkhp7J4vawCEFpfPOi5kRXjWlLJXd235t1e203nWMSx5plpPrO3KKL6Au5gZyVXrdXFjpPhKNVRS7n6j6ZvTtE96W2ixVVxf9QxDcp63UpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772754964; c=relaxed/simple;
	bh=Bt3605Fsr3U1TBJSaoVz0zQG7fmg1eER/wIuM+DoS2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNVvTpnF+2lUOl170f8tdKLhrWVVOT8Y+6VRR61WOHN8+WWm8WbsMDTVl95rSkNGjuQI0Ii3v//tym6DbDFqMS23zaAW8mIiyGK2QHGuSHy1an7DFpkP6ebOMEMBuulwxFPL5rqZ7xk+0LOVSEc4xfucLmvBwh0iTU7Lkrmaeag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKrqnNph; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKrqnNph"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12739fe9a0eso477590c88.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 15:56:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772754963; cv=none;
        d=google.com; s=arc-20240605;
        b=H7ROLoyEy55fRR21PlvaOC+BNSorf4srC1l3ir6iEP1Kg53vHl9Nf3YYov5HDlbBAo
         nV06oRyTWZZUDuALk5V83ZUQi1WXABJ8Q3W7wkLHX+gSFbvn/IKr1gWIvf5J9EtL212Y
         9s/uoYXhiMToqQJbNnAnl2X7LMZjO8V+SPzrgg7V+UYxL9VpqqFlr48mDAWX9QzGTD11
         SIq4LKvONJk/kmH1aKWmB3f1qJdjQNaPMQ10VJIfjU633TQDuFJMaJOzDEUE0UEVTYKq
         b9/cE09GwWypZu8OrW6e7Fn/0XN5T3LX0AyEMbPycZ5Ok9z6r++n354j9OsjwEuNxgpa
         TwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bt3605Fsr3U1TBJSaoVz0zQG7fmg1eER/wIuM+DoS2w=;
        fh=LQGx7XhZN4lsrXA0v3GAKpCBvk2UwTHy7abY2tah8+s=;
        b=lISqLbYn6CrHhA5hG6XSDxQxtSWhDvN0ox/OzFnuR0FUHQe6wkG6p3gLx48G0DBEHd
         nj1I+ACPP9yvl5a7uVQXISHLUp9XaCSkTz3Ht0/qHoi/jF9YiLIp0t7/TzT4J7hQSVw4
         wZRCZSThDJw8fNnIP4dvZvY9gIjwwak7529fQpObfScA92GE6vYg6ySrk8GH6Mw3Rd4U
         VsWiVMopBDJcsl48gAMhPOUICajxa0cbyeWUyRnQ51ZjEuY5Jyh8ExUz6xrf7NYArZkR
         92GFygQjLyK4gHdJupb+6tKWG/rga2sotgCVdu1+kOSWbb6WWuZR1vpDtN/Ke6fvSZyh
         VkkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772754963; x=1773359763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bt3605Fsr3U1TBJSaoVz0zQG7fmg1eER/wIuM+DoS2w=;
        b=aKrqnNphyLfK77yScaE75JMfPCpW1gpFpZwfvBc/KwO6COB2CpDQZC3DGoZPVwwiO5
         xejPke2tRAX50x/jkpaVNK3gBM8igtTfyqxkzwFvTGeZekFhsqv2vPgf5YqJOn4MADen
         O129LnmVzyUEBEFlJjOp/6Z+8nuXAHhFi85Up7K8y4E+lfyL86V9Qv/zCE+1G5e+fdG8
         1804qWgz0HUMztxqcQbXlEytPa4Df+dB1DrFg+u8ctXWhVjyh4O1I5bhZWG3Q+T3cCCD
         vmhsDiQc+eMDJvaN2QKMGIV2PTs6EIDaUsNjqx9VhoOlGv6eZMzVnZQZGaCQN5j4KII3
         vkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772754963; x=1773359763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bt3605Fsr3U1TBJSaoVz0zQG7fmg1eER/wIuM+DoS2w=;
        b=Mlh9RfwAXJs4LYfeh064gpYdcgMe+q4WjtQI2fjGQIUN1MsFPiV4SAXLn/BmK9nZ+0
         HDyqogGkJS5ioR12f6nAnDNAGZpFJs+5HQylivM9P9sbawtDiV6ShkU2XaRGAsqIL9Vr
         WLeYGm6iwl1dE+R3dxBcbmWxqsNx/hf8rwl3kG91rWtoyGqXLCrYnOQGhaDG4mWl89qZ
         z5N380hSQ7iihK/KutUzLeQ3nr5hIZvBreOPrIjUdkRePpIrR+c8pgTcNxqnY9t7N4pW
         eu/OhHacHqxNdaZLTf4UiykhWmqDAC4nvGGkeC+UtdtrkQrbFzTFzCPyfnHecELZ5VTv
         3KCw==
X-Forwarded-Encrypted: i=1; AJvYcCWMxMj8PB92qXykr9HCG+j+HCpfZryO+NpGJtIHtttNfUfRoDZVbX8Pv3JkAOiK8jjs/M2+lDVPAwnD1uT5ziE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWHubvleON5q0aKMnBJgCG4GpDdwBngmzEogpLLjBmTu1UJ+rd
	tDCsR92eqwqBK5JwOAcmbrcld6XSDR5Yfzb8Tw2380fR9JW7aEQ/3GL2LuIvu6ov8yOL4e2e4DL
	7UgupMxw8sOnE52+2csST6Z/DUWOPW04=
X-Gm-Gg: ATEYQzxx4uKQzUNV4cruIMBy+Agmm0Uxv9HlSUfTWwoyXSQgGAezjvtfDJulj/OoJrs
	w5IVJzpRHaaEyFoHg5YetN4jmBqoGyQN1y0TzzwHJHJDpM2wUjjKMWBG6kgfYG0moN7l5GnieaY
	Z67B39QX47WNezrDixJVOUVr+VXEYHuTMnLKfjFHKekt3TPnMAEe1JF5ARGeJrbOoQ+Hu5lG+F7
	1NCRAw5URYqL6/KXfNlYfiUY/HwHXm0PuuaQGSrQjYJp0GzQDywzNvSJ6ArJIzu8NrXlAI/W7Rb
	+oBDnkuCcU2LOduDDQaqD7Ij1lgcS7oH6ykY9Fe4xRAqiz+rlCSQ1sOJDYC1MMhsaYa/bBMW/Sy
	wcFwaZNYBCotS7KME+uBh1kTj
X-Received: by 2002:a05:7300:af06:b0:2b7:e929:856b with SMTP id
 5a478bee46e88-2be4e0f0d27mr43522eec.5.1772754962577; Thu, 05 Mar 2026
 15:56:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com>
 <CANiq72kROq3B=EPfihKM=bvtyqYrbDV-mkFgROdPNjbC6zaBpQ@mail.gmail.com>
 <cccf55e9-e744-4581-9c14-ffa54bc90faf@davidgow.net> <CANiq72kXjytTqpYGbNqKKPBZoGFYHT-3JMb08we9kEOqiK4dmQ@mail.gmail.com>
In-Reply-To: <CANiq72kXjytTqpYGbNqKKPBZoGFYHT-3JMb08we9kEOqiK4dmQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Mar 2026 00:55:50 +0100
X-Gm-Features: AaiRm50VzeXAI15UUkXj2oOE9tivNBlF4lsRD74lRvFS5bND2OsLHuMulTuiXys
Message-ID: <CANiq72ng68YhZuEWYwZTovXn=y7Ng10QEp7rb9YED9f1SUu2wA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kunit: fix warning when !CONFIG_PRINTK
To: David Gow <david@davidgow.net>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 1:07=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Ah, good, thanks!
>
> I saw your Reviewed-by and no notification of being queued so I
> thought you expected me to pick it up.
>
> Happy to remove it, but it would be nice to get the Cc: stable@ there
> to avoid having to send it later.

Ok, I will remove it since I am not hearing anything, but I will send
a message to stable now to avoid forgetting about it later.

Cc'ing Shuah, by the way.

Thanks!

Cheers,
Miguel
