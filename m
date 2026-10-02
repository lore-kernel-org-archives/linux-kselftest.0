Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3822E22D785
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 00:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790900215; cv=none; b=b+SMqHx9LOFRFewSQ36pSe624WZD2WYBRf9U1yJ3cgsFoVOKFnVzaf0yjEPYTTADSNTLgONhDYgRp8kObudpxBltKcAycD4kPCM8+KWrWx0xy+HNEPS5/1KcpUzYODNQyYzMVgFLJCcVDOfSEeqcaXRfNtBfyEnPpdK31GiZ8KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790900215; c=relaxed/simple;
	bh=q+6Q4y6H48Avufnw/sWDV+vkmXuakE9O0dv+vfnCP1Q=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=t3z3sWUuID9jt64lsk20cogAZUHdOIy2Bkv8REJ1PDk1moH7H9AZDDSJHOA4G0YVG9TOuuuPYpIhoql+96vSJdsCCcJ9Q2nlZDNqmzv67JCGWFTNtFRftWqd38cD2viFRsVQcI9jOxbZPce9IU0iAxAAe3qmDxqtTltlbi0AmUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxdjpzR2; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxdjpzR2"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66c9995ca60so758506d50.1
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 17:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790900212; x=1791505012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rOgGB5KCdvmsyYEL6jVLup/+Bx353wLBXoi6WGMPE+0=;
        b=UxdjpzR2UzzLpH4PrgCMKqbUj3yzCWVRe2n+6F3CacNyaA86Y/3bRKTVQ0p8btAvFT
         eBVXKiBZT5h0gH0jMpSlRgIbxIFGcEz0IK8VknxwHCxnJPhp2UvMmqg3EIvCYCzKaacL
         OrU1LkKzuuUykcG9q0tzOKYCbg+qJ7SMyHUlBI1/t8rYAJiC5kWiabS34tlwNYH+ol2F
         BVF7XuFslARhm9WWHw2zzb7c0SROzsDcmZ/xlPSpgpZYF1lJnBaDk6dDOimPkfJPJvYy
         efKcCpVIkg7HgvX4yf6ZkgcpPFwGLzuX9SbKknJDXDhvelJIwqJENKnp5CswY49c31wy
         RQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790900212; x=1791505012;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOgGB5KCdvmsyYEL6jVLup/+Bx353wLBXoi6WGMPE+0=;
        b=h6Wp8KQFxcVC+Pyofax7dAj3+1JW/352veofrXFsgO4dGCwv1sk+ChA6m8riUKtwv6
         3IbqDHSy1yeUksg+DfkbF3CTUfbzyGP2XWtCXgDfdqK/2YYnGnGUCiamFq50RKcY8UDR
         eEb4BBcOuKdDmucbOIuWFXjymw2C3jhTJCRoVTYE6MdFWs5QIU/cX3nK6za8Tdv9riFO
         alyNliLSoZpjIpx54ONB7zwItOA0TuWImRv5O4SJ+G/6f+ycpLSPpkrw52cnv8H5e46y
         IKWwoKOdIwPRYVC3nb7nfUr6B622WSZ7H36YBx29Ga837JFJonvShOWlyCLXIQq5cCmX
         fEhQ==
X-Forwarded-Encrypted: i=1; AKwUvBykLhfSDHQ5TqdrKToPKIVhD62mPdcsFWf7SQQP6lie8qf2jaepwRymeVfegxoj4lLtIiFbuDPnKl6hWLqWsHw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9KzgicYTnJVfhqORVJ8t3OBS33y5/ZKR5Ub0FDw4IzrrX84gr
	ppZ9/ktJHSeB3u5tc77YXHof5hndxjViyy1f0zyLPUoZbcgQxCFxqp/4BlOZ5A==
X-Gm-Gg: AYBFou3+2sgNzCD5c7UYzHWDCebjkKRERyTy6tBKuu+Dvb0m7UNugArZWU9dxgL/XBI
	On/YsnUK6TfLdijivMWUlMHM7LLe2gBPJJC2HQf+DV0RX17nnDxY9zSuS0TOkUcTkY84Phq/GvH
	5G4SxEOJcCn7jyiCaVW9hUuC8lGXDcKlOgUYD8TNpv0oGYZp4n7AfEQ0FKPwnZeAWOmpMQXrSh/
	CPiUTXk1IC5Rb+BM2k7Xo9Db6jeRnqGLhNTq+Oq87CIT9Gbn+ZAEWxDX/Vm8OOl5n/zApdm6UsI
	j70O8hqpPmmiwGAs1xqGg/Hx1wn0bVrOyJ/oWvjvOljTwe26Zu2koHFU2nmzAlfrDUbI6H9o1q8
	Owd5CNAshQTns+spr6hZI4oq1yuCZO0l19nLyNJL4e1qRystX8w09KjfqSZcFqY+MLG14uC2D9S
	46ctnG+5loq+8nK+J/K3aYVTNemrMzKPjG+bMj37/aVQg3uzb4JXO+G8uVGDTkTxiEbJGkC5HsP
	GQI2QgnVtAmKiNIHZH65gtHAYobGy2JZlXuV+5yCMUn7G5PgXCn
X-Received: by 2002:a05:690e:24d1:b0:672:c99f:5f5a with SMTP id 956f58d0204a3-67691115553mr1514703d50.8.1790900212088;
        Thu, 01 Oct 2026 17:16:52 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae33ee086bsm3230397b3.46.2026.10.01.17.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 17:16:51 -0700 (PDT)
Date: Thu, 01 Oct 2026 20:16:51 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org
Message-ID: <willemdebruijn.kernel.678a05ecc978@gmail.com>
In-Reply-To: <20260930-psp-defeat-v2-1-f266e7447129@gmail.com>
References: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
 <20260930-psp-defeat-v2-1-f266e7447129@gmail.com>
Subject: Re: [PATCH net-next v2 1/4] selftests: drv-net: psp: swap closed for
 connected sockets in assoc tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Daniel Zahka wrote:
> Future work will only allow rx-assoc and tx-assoc to be performed when
> the sock is in TCP_ESTABLISHED state.
> 
> Several assoc_ tests, as well as dev_rotate_spi, test using the rx-assoc
> and tx-assoc uapi calls against sockets in TCP_CLOSE state.
> These tests don't involve sending or receiving data, nor involve looking
> up psp device by dst entry, so using a disposable disconnected socket
> was just a convenience. These can be replaced by a disposable loopback
> socket.
> 
> The loopback sockets are IPv4, where the sockets they replace were
> AF_INET6. This doesn't reduce coverage, since the assoc handlers accept
> any TCP socket and don't look at the address family.
> 
> Some users of rx-assoc and tx-assoc on closed sockets are left if they
> validate errors that are returned before the kernel will check the
> socket for TCP_ESTABLISHED.
> 
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
