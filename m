Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBF925B0A4
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 13:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455000; cv=pass; b=QNrOcRRb2EcALgt81rDFy+3VpExWxWc2c72J1hYt19Nugf/W1oiEn3iGx6F9AY+UVFadW/gnyW26jjN8/1D7ePn8h+ji30DpzjauAkgvO6jnxfVL14OAl82Dug8mLdM5ap2op/1nTE7DnN08NC04sRu8OTWJ+jOb918dEouW1ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455000; c=relaxed/simple;
	bh=ViAzSCEVPyGnpT0l74viYf9vMOKI+hAiW8VZA/P9qQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ThDdfRIV1FBT7y83ddt6gSE8UmlXn36ns0Ew74RIvQ/h69Aj63xnwHgSYegi7lKu1Pr/heajGuZ6nyueib1KmpLQgM+ytJheHoIzjkv7HcaBb3vRmhtvcSVEgIW5ssrXy1pcax0LvxZo6l93qvO4JpO4FGcdcj8RD3s4H1en1T0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/DyzGM6; arc=pass smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/DyzGM6"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-49612ef3209so114041b6e.3
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 06:29:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786454998; cv=none;
        d=google.com; s=arc-20260327;
        b=SP+xfE/nxSeD8DYt+Zw7hf0swr68g7BrDsMMs3fMgGqXU23Ess3gn3VQ22eM4rOlA0
         8nQPbbPrqhm4Z7PBwkkRkY1+kJMsFJMSrUcR3lp3ge0D0uU9Un3gsxYoyzMgBAoBoqgo
         jWCWTwMBnl+jfswiPbRXAsG/QQ2kXf/6JyqCmpZJqRtZfdbduAtrI9lbVxmTQfB+/Ig0
         fPd+qvMfjqpkcKM9z4FOd3iW19T3Q1t1zbcmYEH7PUfWOw2/D+Vd0YuiwVOYOOXzWgGy
         jOrJzIp8zWBhwQTMgxYJEsCYwiPURyrO51mmWAzvwhSLrhjdQZ1xrBo2Zc9SxCFUgWyW
         r73A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ViAzSCEVPyGnpT0l74viYf9vMOKI+hAiW8VZA/P9qQc=;
        fh=ztot/t+sXP8nyp3jLee5rnvaOaRo1KBMDBYHZWmGCvg=;
        b=V7E6gMkqctFs7TKyg42rno0I9VoVEaVM3KlqAMDDOKCuohJDeXCcsyDmREDF8HfR9A
         Z7KhPyM6oesMN5lGWERnXRvghAjKbRLvUHmPzpeud876By4DyuGucb8aPn4qvLLZV5sg
         IpdEDWs+w1E3GUmmaBx/Wxmq+M3aJtqS0kGF/5QsP25zdm7W5NkUiYb7GJfu5oXX0s1a
         rFaMsLpFsFllJCy48DsWdGZCYXxNwEs7nAeFH5rqFLqtGU3zhENq+D5BXhzrY2wbz6xz
         Oa+e4p0MSyWLZrjCo99IT4+ajUCaavsd4dOzn4spq2Vpm1Lc5VzwOP5g966/DFuQIDQr
         340g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786454998; x=1787059798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ViAzSCEVPyGnpT0l74viYf9vMOKI+hAiW8VZA/P9qQc=;
        b=a/DyzGM66u2p3eH4EJsgui4wVDoclDvEwc37wnwGiA4i8D7sPQGOF7nzNB8WyMsnjY
         +sHz6O4zqqRDMbD32B+1PM78Dq8/5hLy7mcgLdB7H8FQHD/8LRwjKHQ7bgWtWBsrfs0r
         ovpO2kljAGtjMqsOgQUJkkLNTuADOJofMOzgQ2gebXQvbTZi9vt28E4H3VbQdVFXUFIU
         xwij4w02SRWFLqzP+jCOLSYULWEzm+y6xUOIhleHJXd7D2/fp27VI/UnEhmOywLp+eox
         CiXpy4cT9GX8vov/kw7KEqGARsTTmlXQ1lLvWBkhI7Tm5Y/geYblswhxwX8PffpUMnGt
         RE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786454998; x=1787059798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ViAzSCEVPyGnpT0l74viYf9vMOKI+hAiW8VZA/P9qQc=;
        b=KDmFyGv2Y6VqOxv2A0nITFR+wCYccPuRiucUtZ+7N+DJpWWGRpvDp/KKJmz4XM0CUX
         tHur/KQmXnZf3HGs0s+R84nsHUP1mIKZTPJW0SjPBFcLhliWnvaO9I2bBnKnXxDR2CHc
         1VjkW1JDOzwmPnkXC33iIGuI4SL8uMrN7E6tCRlLDp9vsFgjGap8WSmTNu4F0cmDUczS
         u1YCLFdFqr03h14fRS/d6NZXMPjh/qoNVIQaVGbdNXF1spKpk7XaxnRzZ60Qoecp4ONQ
         dXmj5l4F0TX1gd6xzXUR2AK5ZekMPS/ASV/1szCjv/p7/7rj+4BQDrRlLgjtASWKpxWL
         +orQ==
X-Forwarded-Encrypted: i=1; AHgh+RoeL25chrnACd6Lpm5ghMy3hSDOTNI4Hg5rNx/wcNzVg7EfpMxOHYgf4BubNKgtt7Tb77Pc1p13+aJr63CuEYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiYLxBd6PkeHEXMIE/0Y6WqinEs10sZ87bSvpdImnhbIvMWqKS
	GHJnXd6I3Vir5WsbOch2o0w+E5ugolQNTMdh3VCIOiLyzMvGqZJchvtDIkhnqcB3xV7H9QOm22O
	m8wPSr93tWXnmNEyT1Mbvj/SOnlkCqoI=
X-Gm-Gg: AR+sD136dkWpR7Agz9LMjiQjiS3JoOM3dsQ227519kNk0bfi3eol5K5Wmj942HLyIc0
	oalcZ9FlNis4Vl3ExnbkaGyPUYjHQW0LM5H4Lmd42zUUY1k04CrqccoznEYnJDiTMemNw6W8G/z
	qUz9O8uoY83NRb7Ld6UkW8tUN9Q/bVjZ/A5qQmyRqj4Fk881qmKUR66ajitTI5ve6crGJxpeE3w
	tBT6Hz1yX1ECk758cjrdgZPbv9ihHXZgAK9oMT+4YBKKKbSvhMVZNj4FMKUuIyJVICuaq0aUyJf
	o9ZKEcw9VFgaMN60igRa/j/CHox9BPhai1JPRe3O4S+yZez4bEat6yPd7tbOGPlJ4wTjvfE=
X-Received: by 2002:a05:6808:14d0:b0:4a4:866:c1c5 with SMTP id
 5614622812f47-4b1fd7e4969mr1277655b6e.2.1786454998187; Tue, 11 Aug 2026
 06:29:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-netcons-userdata-rcu-v3-0-f65557f769ce@debian.org> <20260810-netcons-userdata-rcu-v3-2-f65557f769ce@debian.org>
In-Reply-To: <20260810-netcons-userdata-rcu-v3-2-f65557f769ce@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Tue, 11 Aug 2026 14:29:46 +0100
X-Gm-Features: AUfX_mz0vefpeaC2fQ95LgAql-KWU00OZpOsox7mA5epPek9asPJpJDhvdzWgoQ
Message-ID: <CAGSyskXtFf1nQXtu=ndA0BsP9yHjv0mJQneqLopZJr2uPWMzEA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] selftests: netconsole: add a userdata
 torture test
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, asantostc@gmail.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 10:36=E2=80=AFAM Breno Leitao <leitao@debian.org> w=
rote:
>
> The userdata payload is rebuilt and republished on every configfs write,
> including while the target is enabled and messages are being sent.
>
> Add netcons_userdata.sh that runs random tests with userdata.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
