Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600235678E1
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177992; cv=pass; b=QGe2AUX6Xwm0K40AfkCwaRSMla2yOAc5Tl9icswm4CCmG3vJrf6J9vjUCjZScKLPiHZ5GqRe+L7+ZqT+PHR/6PdOy3/GnAxSsjH9wjojzXnQyxK0LxMywHqLsNDxSFOT3GPwdwF/hYsR0uofZJummRNc5LrZ7VIEa5OqionvDz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177992; c=relaxed/simple;
	bh=AdYkHfJ2zDSaBM75Wmc+UjEZmUI3CCQP3TZvEyF+sDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NXAyk7cVQsSN3TqJOYnLJHFD00WnY6mzEfK1IqDbTAMyZyRs8vA2lsyojTKFnRV/VNyvaOzRnYfVYVpoIKJySd8m7Qb4CvsIdZ/IuvLtvCb9oCKWj4aLELlGkGYeu7N3bAf8RiHOif13kQhl3tgrtcfEenO3riMhaxC6lMkBwZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d794Otf9; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d794Otf9"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b34ee88df5so139759b6e.0
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 08:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790177989; cv=none;
        d=google.com; s=arc-20260327;
        b=Zi+cX8U4vETCAedW2hk1HFiTiTAGLhYJWthwOqjIOpoWc7+6xjmRA3m8IUvEXhTshs
         dftkN/rCj36Yj7HrO9hVffYuz8UdPsilFNHJf/2pX2i23zkKrY70Rw6PogbFhuEvbOaf
         X6YGrXIBsfsnQtN45fGnBL/6zCAp8WK9sI3zC77/7UXIQYbbectFG0smJ7oT8RWbdJ7H
         R/zlc+Q8oD+EIRLz/NZcdDJYDtm3f38QrCD8lmzwHpAlpEPPLe0kfU8rcT0MfreOIf8T
         COctkp73qBn16PGm0xO6bB6ON30wqipE1qvPjHuQCT/DoZMoDthL0tQiEXgQ1ys0xp0u
         Ebrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AdYkHfJ2zDSaBM75Wmc+UjEZmUI3CCQP3TZvEyF+sDs=;
        fh=2WzVUr3ji5CDv+HkUyx3vsrDWdqrW8VyJak1YERHZ2Q=;
        b=ioUmKvWVIQwJj+Gd7resOthcS0+4KUgyRPDkbOyydWRPzIzKX0vOdZBCImg9mVod/k
         5CE22vHmVvWbZ+mFXOzHGNjy+OYiudsJisq4cWdeVlFKlC2VkAjuNQngLlLeSmfFKI8K
         XNJYj9VfWE3uOiQDdxI0ob5I6ATPlBgkG/yL05oqPADc8kZhg3aVK2dZLJsQpfh7wXW7
         iyzSjOmUl7w9gfYonUNqOQjsi73N0SIqmmfPB4hbvlIgXP1TckGGUXD9gKL7VziA0drQ
         HSHRHexaWxuudKHDqMQG3q49HOfBFRolq69OZKyy13k4BTv+HwbnvZkCnDtE0hBxxnxG
         Ejvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790177989; x=1790782789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AdYkHfJ2zDSaBM75Wmc+UjEZmUI3CCQP3TZvEyF+sDs=;
        b=d794Otf9N2nr7JynGRvuTcTvw6yB3KeB07VCCGBAknOphv9T0y6GE33VKjsGGb0SmT
         MEtlyTV6PonQ2qrBEOpVmMYtQND0dqkPprXpXw11N7PWQM/VJXgLQmewZwLxSiWa77jg
         ZsmnuQz0IpsMAP1EhDSH3FL9dWLVfIF21bUWRBtOPHhg7TfPGjjrFvW9Up3w0ggseCfK
         rILoT6FO/dp3QIKv6gaXDYu0HO193KKH37Pex+nW2ZEiwPHuob5iE4KRV69vVesmDuC1
         FUjX5SCzGGsRHz/LS3pxBMjyXqj0TMpbUY5VCkHfVQ5k/xlS2pzlR2wDySg8kJ7bG0vO
         ccFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177989; x=1790782789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdYkHfJ2zDSaBM75Wmc+UjEZmUI3CCQP3TZvEyF+sDs=;
        b=I1uPyonN5XBBsV5KPLAvvOn69625CUghd6Ema67G4EYVnLLKsKfpMMlDFJKwVkYGO+
         1WED4okpd8U4TxK6je4vgkyV+UmS/j4541NRWgZkGkSjnqbBSCoaVR4MiurSwfR/kkMc
         ze+C105V8lDeDCD5ChBi1JY0/jAvXQfHReoqeoi9Bau0fyJEpbSixFeQ7i8D+OgnUqCK
         YQwKMHRdG5H5bT+0SDs7RYc/jAYhOkwALoZ8NoNkvbmH+IRZkSx2PPYeDAVoTKXdNequ
         NEHATLh5MZS/ww7U17vqscRI0KtkJ7IyWahyxgbPbxqskOrTuSOcB5QwIOorkIwrwQf9
         oonQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWheMy9beCtQeqteZRTkZSpjM8jBkznbYHqHQwIUzEnz8bXonoc/DuxrNwhrLuRLl9N+NqtlfoMRHtxA37f6A=@vger.kernel.org
X-Gm-Message-State: AFuF++l9EWKq4ZP4YhnnwF2SabrPfm99+Bp0nOK3yU+QBnqcS3SwoAH4
	Si1tn15lxFNCNlPyIUwZ3UTPnFvXH2ujJgrzGSQ/WcvD67D2LE83GgFP9cjKunkvwhvdj2Xoanp
	H+ZB9MZFdLw/G1hKMYbQYZ29bWl5FS9Q=
X-Gm-Gg: AYBFou1JJk/LQrD9K53Y5evDpM5Y2NRo51WLQS+ik9p2HRZw087Ljkv3YcWqpta3fV1
	6a2O9/16ggo3i/kM4RMRWIvSqZxcK/T4p1RQ9atuWNEM2gX9Ls2OAFNe1OsXgJesx1La19UwITp
	7vKUuxr8r1doyak88SZl5o32P3orJX9tspx5pLSLdyHU0nO/S8+hMJn2pWAc5dy0UgoPBWuSrhx
	gu3LdnR5O9yUtC7W6JRfMCp8j9J+yQjamzZpUetrM4UCKcOTzNv2tyj7JamBf2TcbNWmp0JMtii
	TGLygj4P+o4YLYVISNs081ebSiJYxR0sU0ZDAbcrBJXVRMcUxARncPPDh6rU5TK5G9Mtbgs=
X-Received: by 2002:a05:6808:f94:b0:4c5:f237:4521 with SMTP id
 5614622812f47-4d5ba9fd270mr3658486b6e.5.1790177988984; Wed, 23 Sep 2026
 08:39:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org> <20260914-netcons_ratelimit-v3-4-8e81b789ab37@debian.org>
In-Reply-To: <20260914-netcons_ratelimit-v3-4-8e81b789ab37@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 23 Sep 2026 16:39:37 +0100
X-Gm-Features: AclHuK-4_fTyXS4Sk79rrR4cNhFbQRH-gmM6U6Ove1uzxePDNMKXgCwckYn6xmI
Message-ID: <CAGSyskX-Xuiyrmd+z1Gs-eDwns8pfA4gGQHN+XepDreYsN=dZA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 4/5] netconsole: allow configuring the rate
 limit burst through configfs
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, paulmck@kernel.org, asantostc@gmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 1:10=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> A target that sets ratelimit_interval_ms runs with the ratelimit default
> of 10 messages per interval, which is either too coarse or too generous
> depending on how chatty the target is.
>
> Expose it as ratelimit_burst through configfs.
>
> Restart the interval on write, as ratelimit_interval_ms_store() does.
> Raising the burst of a target that has already drained the bucket
> otherwise buys nothing until the interval in flight ends.
>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
