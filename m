Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773589;
	b=YySLx6FiD3EKdtTLs4w0GCVKNitPMcsRzVLP1ArhTtVtBTMubS38Jy4a3UEydDAe2A4T
	 E/Od154Dc8hwiO83ka5cV591xETyt2HLbBsAnDhdKKMoyVhY85TypAQXLsEs/sYdvE0nJ
	 t2CRjiQ4iu/sCsTuGmhIORh7U7aP7ioDnu/7KXTMaz2qqlwEYXvBEdG7KC+iqKP6GoE0G
	 xidGPoX/Q/dkuyJL6TTEgJ1SJdgbpdjqVqBVH+cR1sJ9E9v7jPa87KS61tuU22IVn3VOz
	 zXqWWdzxnMAj3sAkfAZd02s9FcPcQSsXVnGo8mRK8x7mfx2qphprYmhCM2T4SZRrndg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HXRFd2cOQNGMDoVqNtgavt7+ro/SHVcuYq+oVmWUa/o=;
	b=10sKaWTjIo5ihEooaI1/z85sA3eV05jgZWwCTWDHDldAkuNSZ9aoeAUXt0P6RVqR/1E+
	 oAmZ08/jE6BacLYqgjnKfccf5FmggZHwXJpzd07NVJQahp3OFqWjL51/O6TXJ16jIratJ
	 pV68WMdlpjMxBNrCX9hJaR0n9EBBWKgCqTn0tW0HI2xfrKrKlIyixeizjRX+JtJ8GtUTQ
	 7nD77pbIoSqFZkxeTZ8VVNzbiTQsn5Oe067QU93G+onc1uMPwHZvdomnC4klzCuMcjPn5
	 bjlcIRSkFb6inVrPtXy4QkSJcUqRwYOF91g6jRrQ+mPLudqDRMnnt8m+NkZilY343PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0QhIu3W;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9CE606A32A
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 09:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F9CE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0QhIu3W
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso1441191366b.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 01:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795773588; x=1796378388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXRFd2cOQNGMDoVqNtgavt7+ro/SHVcuYq+oVmWUa/o=;
        b=R0QhIu3WgCK80EmN+8wbvDiPq89uiXgOMhnArI5XW0kgdPoxIIMMQPEv9EOAfsRKt0
         AoNSPTQvWVUMM4mR3xNEeahH9jWALBDordO6pIF33Ik/2Mo5C3IPhwcnqsq+axKxtIIJ
         WK8ZLgpXSB7hGEon68r3i6Ns60Uc+NUjZSd8GmMswWuYVjyBc+cKOWdffY4mXGalac8Y
         ewm7Yj+5U15Jl8xAW+cWs3wGF0L3cmcsQCvOa5+hEw5cc0U1FoSdxdROgJLSu6baBfMV
         y5LmOijPxYDiKIYeIXATWP0XJvuNPyByrJcvMP5u/0OZfiCaxHuvlIsD91v7PuE6uPaH
         6heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773588; x=1796378388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HXRFd2cOQNGMDoVqNtgavt7+ro/SHVcuYq+oVmWUa/o=;
        b=cLlzmnmYxiVejJGt0vQZwbXinVFqERwdulwx18buB6lL7cYIICsJf9L7rZnItNDANM
         K6+gJ/5V88oKH7B9fL+on6gPgj0SPaJ3CNmXTUxzXF5JLokUdq9oaiHuCNbNPI70YGKe
         OwSeZafsOo7wc+JDShSXsgiifhYcmm+qJd0fWBv8o+zVbR/TYQY0Nm5npbFpJMTBwlu4
         3eBe18M/4o45Z0cinf2DG+fPHk3y4PExXdkxR/lpRqKPGmFqrAEVFPYObbzZh9IUTb3S
         NHHzxfLP1Da+wZKJyylkeKSarpvYx0Ko6yLYrMCpY2Agf68/V/Quiatb+qLN3epwxD0e
         Hp5A==
X-Forwarded-Encrypted: i=1; AL+hErHyXJAIeY20J0Coh2qnx2vUDdT5B0l2rHBkfVrWgkhReyZ/TakNZxnNQxipgItWFiW8yMXha7wpb1QjhojX3+w=@vger.kernel.org
X-Gm-Message-State: APuU4Z++rr4/OhEhTHMFn362sPev0pF/gyRTmGWo65Z6C6AuT89oySKn
	t5KGF94vqjJ5XiHwikDB+hRSmdzoQcCZjVZO4jpipJ+jyA5wk7mQfb5fHpoEHanA
X-Gm-Gg: AZFdTZdYpoSzfC5I4AyKaz6+VNxUjmlyZAQ2gU7BzBt0R+5rrQ1JOJ32vS1mHgT2+Xu
	bGQBRWZETBgrCO8rFVAj4rvioCsTN29V/+WLDrAyQyNAa7dXQb+wOYYtOMthruzRr+QjOifrA9h
	0QoaCy3Ih7l/fwMSIxPoE12ftI+S47C2ltgUvYJuPSNS2KA+ImfNDBZeHo24cujBoNGUQf5Rx7s
	/mE+xZMY9or4sZryCG2BQ1ygpdgA9DVvuLaIwhbMHcFNtYpP7fvC968ZIZdLphbgM3cXVqck8vr
	R0mulu5B9Ro/Xig0aNZ7yRbs2sEBXuI+QnAD7sow5EHF0wuzPE4R7NWq4ll97L6O3Jx2wkSWgUm
	dMcnP724JwPqbJqpj+vskZCA8Y7mUYEtkrcxUk5F9yt7ZYVvnGTJvDjaEQysMc2XFyKXm/qftY6
	f+Jb1oXwi9axLtzaPdW1DHuatGDOPI1Mv8dyzaIxZuldIbYNWRAT7QPanKJtQeYTwAWgB8vvI22
	wdZXAOPeZ69ch7H6hu37Ivegj8Obe79vQSpK0hpjgQd+0RnfmbB7Xw2dPdGyyg9NKQ4uvdsbm/6
	yykMBv06VZCtM3kUrgnES+SDfQL6PQHKDyFbkBgwFITW2U7kkYPZm3DGiLN7PkLSlnxkCg==
X-Received: by 2002:a17:907:968a:b0:c42:bc58:f21 with SMTP id a640c23a62f3a-c51d5adb93emr163106666b.15.1795773587905;
        Fri, 27 Nov 2026 01:59:47 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8ce16sm841249266b.37.2026.11.27.01.59.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 01:59:47 -0800 (PST)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] wireguard: selftests: remove a peer under load
Date: Fri, 27 Nov 2026 11:59:44 +0200
Message-ID: <20261127095944.17844-2-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179577288974.3135.10854019193613008297@kernel.org>
References: <20261126094722.73025-3-apasichnik9@gmail.com> <179577288974.3135.10854019193613008297@kernel.org>
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

Sashiko AI review wrote:
> [Severity: Medium]
> Does 1 MiB leave enough headroom for what the new loop can log?

In the runs I made it stayed well below that: about 217 lines per
removal on average over 200 removals, and 340-400 KB for the busiest ten
in a row. But the worst case is what you computed, so v3 raises
CONFIG_LOG_BUF_SHIFT to 21.

> Would setting a non-zero message_cost while the loop runs avoid relying
> on such a thin margin?

No: the "Keypair N created/destroyed" lines are rate limited by the same
setting, and the object check at the end needs all of them.

> [Severity: Low]
> Could the commit message give the detection rate with the default
> NR_CPUS? Or it could say that NR_CPUS=1 is needed to reproduce the
> regression reliably.

I only have single unpatched runs there: one with 2 CPUs failed, one
with 4 CPUs passed. v3 says that NR_CPUS=1 is the configuration that
checks for this.

> [Severity: Low]
> Does anything confirm that the peer is actually under load when it is
> removed?

Not in the script. In the runs above every iteration had an accepted
iperf3 connection before the removal (10 of 10 and 200 of 200), on KVM;
I have not run it under TCG. I kept the loop minimal as Jason asked, and
can add a transfer check if that is preferred.

Thanks,
Andrii
