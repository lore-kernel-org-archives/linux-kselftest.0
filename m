Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327127;
	b=mQf8P8GfqbQIuP86SPrZbSGchmxxcXLvYQP0mn+lvBq8A99vOB4M3hr99Ny2WAc2Bcio
	 CIPrqEhQwd5s9cSxKmz9bSMj8E9gz2/AwuOb6UqP7JB1DQ0mXnVg3IaE5ohWmRLoJFSkq
	 9WC2WFXc88X3Ip+F2ic/j6G2YbKjdgRAcLAoBKSLkmMMz1VUsl9bMaOtQy+300RrM/6pE
	 0ss2WsNpgCUp7Cqu8CzUnbjtZqUzMehum7bv6rfJWwbQuQybhnEJPgDHBUdg426RiPHXD
	 5s5dQxDF5jrzYk9bzlok1V22cVFLQ5nCBYjOomcW6rPfWmLP6vid+sJKZdyFRpN74iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RSLplmlefCzlrzZekmOXD0yz8U/FyqcPjyO9JJ24e3g=;
	b=pX7zBXYoXUUeGh3pZu6Ys9p0UOrtHDEV1IRSm8RB2cVlExKoiS9Wrrn6YMD1QaJLHqCM
	 dr8usK4ugdEN3/SMe1HPaIJryC8s/xCEiwSb92Nl0ceVgRpjUidqRaqtmlwyDjTm7Dnbi
	 hTN9iC/ISlSWQqu1ma6mfOFv+4r/1yU/jja7IlHfdSsBZMSMrAhxL8qPvIZMTARaPZsyX
	 Iv76KBRckJTyf+eYtyOCnHOzjBGt30WQBDxaJgkEmF5Cng7iN5dq9tIR8hS4gLt7FcCSA
	 fbLvaflw3uQ5j0OtCsL7OMmdJrIUQjmHXse6peaK3GxPzq9KpHoiEowWJYpTFlQn9gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rT1851wK;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA36E60A2614
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA36E60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rT1851wK
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4af520023fdso3438955e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 08:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794327125; x=1794931925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSLplmlefCzlrzZekmOXD0yz8U/FyqcPjyO9JJ24e3g=;
        b=rT1851wKskl1h9ymNh8Xbol+PH9UppLA29igRFHTHd3eFBfaEobdNkisj4eq6NLoCJ
         iW6mkHMjfzEt3DomDzKW19n+/Q6ow/Qor3LjxEMpUQVg47KZ25vE0diQn5xg5ICcuBGg
         QCZOwflNYFooSOY6okpZsSNyxwaCtAmpuLswLPpSWVNNaouXHM/j0aXlqvfKdxNnIPTR
         ezfrSCPXgBm7pXfHKOgz5uEmkk5Kd8lAX7UAIdoaTt/9I4uq6xpJHAZGMb+Ep9mRqGBA
         Jthp1U5JDjizPbUn4dLi7NUU62IX7JBGG+3rkoTs+EZS+sm4XTBH6hllm1jFNqXj0xNI
         ClWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327125; x=1794931925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSLplmlefCzlrzZekmOXD0yz8U/FyqcPjyO9JJ24e3g=;
        b=TAw2axsoJDre5i+nKX1iiiv+1a5jwlHXTlyac0CNfJJTGKIFjNeKZnWV67hbUqKMb8
         WRhy/jl71njnB19D30NdzNfxw6mQJBzpGGBAm2KMQPbHTfDMbClzH7fKeRrKrdYmA3Dl
         VZmqB2f05M6VZJ/VQXhd+td9XGd8+dH1v+ZHHogc6PkivPZ1y6TD4qKLgtctONdaZgK8
         gB9+s92R96UpQ5mtny0GO5XdSh/Bg3RN7pCbYSbRqPyMb1988zEiPZv6LLF1taKgF6e8
         UvBT3FzFH1cX45OrUMefKO5N8FJkTTxKuL6S9XpaqVSJGTIdLCqqqJIvq9+bQxIAOiLQ
         /6bA==
X-Forwarded-Encrypted: i=1; AL+hErEjhskSaeL9v/dC45M/rT4RLLInNOUC3YbIoam4zQuHbwklB6J1l13GqI6OK6eV2ZjDfckp/Ip7RENfUbTxKPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fito1iC8/w3AK99ehgbzOirM3Cwn+CcP4oIUsCpvY5xhK4MOW
	cC71cJBc73wFHHzEQavCOrCwkABf7SvbOOu0KBRU5Ja+J6GxcOY/yhLK
X-Gm-Gg: AYBFou3QSuQhCzIa6Bo7sVKFK2sQsaLcN7NA1XCqm8MB1YqBye0Y7th4L7D9QuZcVMr
	qrngu5tRvFcmSffoD4vpSZKEMbZaaXefQX/CflRSk7IyJ6bQxCKxmtyOfVkkx4mQPtCeMptblUU
	Tw8VKpIvMPB9bKTVYGcwmsBW3r4ZPxqJ/6Rw0eDQet5PiRYs4rR/0a2bw5U8TLwp/0TgaKRdcbW
	5TEiL/ischj+hVeuo0UlAFJKkoCn3y0R0dO3A06e42HBdTHrlrkxrpRQqi4BLidrN1izA9i8epN
	qj2YvnA887VLkfNDfdOgQnpI7Ugcwl14TBxtwReIC/30fWDmkNejp8xMEP0EwHEaIAw0wI7nfli
	cpI9T3gAATkhVjE5tcfDH0aFroR0PVJn5vKY1Z8jHOIcSl7mSFUavSsj6BwxWjimNot5sukeRAV
	QyrRbFXsM6MATJ/C0RZ2YRV+vsB9niaxBnLe3VMZMcyanKB4cH0WHE2Jd9wOzIu3tqJX5VZNX38
	9RlGEsVRRQnJBBQwbgQ7kQeZ3hZiijeZe7PlOgDPQNLMNalasD/AjsZqNb1Xxwd/gyyTRzfGgsY
	FCLH/NfxANBUs7t1r8KFCf8Pgd5xSgRApQnOmhcNBX1PqIR3Ks2eVFTaWul6I11u03zCbL37
X-Received: by 2002:a05:600c:350f:b0:4b2:3c81:103 with SMTP id 5b1f17b1804b1-4ba0233a711mr52624085e9.2.1794327125133;
        Tue, 10 Nov 2026 08:12:05 -0800 (PST)
Received: from localhost.localdomain ([95.183.147.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0235ef62sm46727135e9.2.2026.11.10.08.12.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 08:12:04 -0800 (PST)
From: =?UTF-8?q?Bilal=20Yaz=C4=B1c=C4=B1o=C4=9Flu?= <ahmetbilalyazicioglu@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mohsin Bashir <hmohsin@meta.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] selftests: drv-net: ring_reconfig: handle devices without channel config
Date: Tue, 10 Nov 2026 19:12:02 +0300
Message-ID: <20261110161202.77549-1-ahmetbilalyazicioglu@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179432444472.994134.2763803571159924115@kernel.org>
References: <20261106150509.30458-2-ahmetbilalyazicioglu@gmail.com> <179432444472.994134.2763803571159924115@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 10 Nov 2026, netdev-bot+sashiko@kernel.org wrote:
> This catches EOPNOTSUPP from channels_get, but what about drivers that
> implement get_channels but not set_channels?
[...]
> Could the channels_set call get the same handling, i.e. log with
> ksft_pr() and return on EOPNOTSUPP before registering the defer?

Good catch, that's a real gap. ethnl_set_channels_validate() rejects
the change with -EOPNOTSUPP when there is no set_channels, and a few
drivers only implement get_channels (vmxnet3, r8169, enic, octeon_ep
and others), so ringparam() still fails on them.

The upcoming v2 handles it the way you suggest. Looking at the same
drivers, channels() also fails there (its restore gets -EOPNOTSUPP),
and so does reconfig_tx_stall() when a driver reports spare combined
channels, so v2 skips those cases too. Other errors still fail.

I don't have any of those NICs, so that part is only tested against
an emulated ethtool family.

pw-bot: cr
