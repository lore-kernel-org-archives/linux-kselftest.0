Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1469F3F23AA
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 11:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768909152; cv=none; b=EK6/5R2dtgk+53qMpKn6ZbYbkoG6KYhrjvTS1kTVY5qp8KYfKpNDWsfs6TZI6dR7siUeWEEwUSpODWd0igkl1gl9g5tZ9NP4/EnqrLDiru/T78ct35Uyo+H4+7II67EKamSjnvEEQwCejSHkdUB9wykS4xC9MMp9NnYigE1uJm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768909152; c=relaxed/simple;
	bh=NXQQ0WkSmgtYQRflH9tioiw7U5+rUuPB44dqz2UDnCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0Vf/m6VXZn7n/X2cHaI31LA6Zz/DWOnvTw3VSAM0ZSeZ6CkLvnkeVZ4KyIwob0brRGJJ9XiLsmaC9cGlfu28i+J7ZfvakBAJHrqlwA/fjpj4UeOtBvIIPzu+vb5PZfCcMBokoElj2ae4rbnQpaBGTgYs01r2RdMj1hv93VBRk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-45c798c92edso3276243b6e.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 03:39:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768909150; x=1769513950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhcjOLbEZG4bgQTQWPq2S3Utcl+3a4AuxvSi1hMPyUE=;
        b=EIr7+rdfsccBh43ayOuu4tY4xjPiP/1kISOh4K1Jb3T9nTZj5i2UXfFUG1DafWm2Ad
         vVO4jrB3C0TfWLq/t9lupQC+Nn/SzXGqmTWmh+d1AGW5SWNBYmpVj9Y747fwihAqvNkM
         Jsbmrxj39qBpaqQwP/ATJUh9mNS+iLvvwk6DiraolAYriJNcep4xIoQWXTlCZrzQr+CT
         dQkz5d9T7FDYo/+nIOjrab/E1EOoYpFCPYxz4OzlrwyNoW2HxVCZF6wpUdbzo1S+b9D0
         klpynIGj7mDUbRnJ9PoDA41Wdtvu0RSxdHDgeujUBpCxfg+3rJkIo7+oJeKfj6zm2RUS
         TZpA==
X-Forwarded-Encrypted: i=1; AJvYcCUnxmDmasYMFNsr7NRRWVb62NV+vJQPtKRWhx8Y53lTW9qISTW8dYD7N4LKZDEOhIYQLSSWgSgNi96nUg5LMbE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHkltu0SA2/PPRam+AM2OSM6KYQKgqDSMreU83jFm4Enl4uPbA
	9C/HCbTJA/Of+IzO/jSJsJEvlW4u/vTv2XaIdIJfO6i+VbUQRa5dEyZV
X-Gm-Gg: AY/fxX7vE9gXm8vtBccgWi0hNHp35r9VeMebQUDzy2bcFKqKG+p6K7vx6JMQ2FS4qoe
	0yFXmtu3Da7U9KftDxonnreTsF9jlJfMuKjNmAlR2FU4zix1fjo1PSKvWRiI9RGzbe83wKoJEq1
	ol6uL504HNFSkw8OIKkFSDwuwOAFoymPwG+Nq7JzxM43bNJtt3BQ7SdwjlxEV0tUxMny9wUxZd/
	7yDjdYLmWOrmx2Qr4wqcbVa98la4JvFYRjnHpS7d15RMU2qWkv5qslDqyVHWxmcmvVuv5tlLnOw
	70Qcy2li7PiSq0pQ8cQP61fR8iuRhc+zUVADX8DucHuItD88Z09NgfRWQtM92M+wKhM5abYW5J8
	dHPK9oxHnUapFli+m1ClkmS0lU0FGPvY5DFhikIWwu8Jo0bWNWGR7Jmn35Oo6dYgbHHFW8l4nPw
	PHyQ==
X-Received: by 2002:a05:6820:81ce:b0:657:5f31:31b1 with SMTP id 006d021491bc7-661177c31c7mr4988879eaf.0.1768909149768;
        Tue, 20 Jan 2026 03:39:09 -0800 (PST)
Received: from gmail.com ([2a03:2880:10ff:4e::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6611890c9aesm5874107eaf.4.2026.01.20.03.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:39:09 -0800 (PST)
Date: Tue, 20 Jan 2026 03:39:07 -0800
From: Breno Leitao <leitao@debian.org>
To: Andre Carvalho <asantostc@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v11 0/7] netconsole: support automatic target
 recovery
Message-ID: <aW9pLtSpTwp4pwn9@gmail.com>
References: <20260118-netcons-retrigger-v11-0-4de36aebcf48@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118-netcons-retrigger-v11-0-4de36aebcf48@gmail.com>

On Sun, Jan 18, 2026 at 11:00:20AM +0000, Andre Carvalho wrote:
> This patchset introduces target resume capability to netconsole allowing
> it to recover targets when underlying low-level interface comes back
> online.
> 
> The patchset starts by refactoring netconsole state representation in
> order to allow representing deactivated targets (targets that are
> disabled due to interfaces unregister).
> 
> It then modifies netconsole to handle NETDEV_REGISTER events for such
> targets, setups netpoll and forces the device UP. Targets are matched with
> incoming interfaces depending on how they were bound in netconsole
> (by mac or interface name). For these reasons, we also attempt resuming
> on NETDEV_CHANGENAME.
> 
> The patchset includes a selftest that validates netconsole target state
> transitions and that target is functional after resumed.
> 
> Signed-off-by: Andre Carvalho <asantostc@gmail.com>

Tested-by: Breno Leitao <leitao@debian.org>

Thanks for your work here, and sorry for so many revisions!
--breno
