Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217027;
	b=msRIhC+ycER+obxIekqmeEQTtAJAC3tqTRlHD66/HG2q5e46JHE34ZHG6HpqEBGsbVYO
	 q+Mdppi1YUaJun+Iq7uCGUerUEPHt6CpegZuBafyGw/Cobq3JgGv+LDbTV6PaVX6FlQ/W
	 hAJ/xJSfjEwHUSFocX+kMEcw7e7GCCkOEkRgMJREz15NsRdTsitfQV5Uv55aON1N9oxQq
	 rHRdmftJPs7AYy3FzJtwcjkNRHVcOgLJYDPrJHNFcOfJ24iFyWKAZYXMq7NMS9sdKF1Tk
	 1Kx4hYUCxf9/2uXpcFShL+cvgrBhIxC5LCpDCvU2GZhfoDJ4A1nziejnnDATu6xJoxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217027;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=TGWLnIfO8Lat7Y9NAAZx//6gPQdAxKgN9VEcDXQpR2g=;
	b=Qq422ZPWVNMloWDyRwJgAfvkDRVxVV8QCrq9VK2zO6C4isHjDmPXAke+AO4G7v0CgVTi
	 oyxoERpZL+TtI8vpRcO3xHHYyonD7dhEhzlrPzYm9tTaivlzAZ67pe0LibAtMtIRjXpdF
	 Js9cFydhHgkXkx5bIrc7qaOfVE2ws/1k4yf1uOWpNMINzczNJ0oIgYVwtSFDIDecHPxPz
	 m5pbbUvOTowtrVwns4Qzj4bGHVa9rvxFi7V90uaX9iRCml8s5zsOJa0RN8Hrf3LoCFg7K
	 i+h4Isg1Mpj0EjuiCEBmvr3/K9Fj2RKjc9MGQ6wWtxq8KNzSU0sxSXbsjPHb1iMgmRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5660D606A6A7
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 23:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5660D606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5361e313e63so18622961cf.3
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 15:23:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217026; x=1795821826;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TGWLnIfO8Lat7Y9NAAZx//6gPQdAxKgN9VEcDXQpR2g=;
        b=EC4yOnodYmgRvq31A2qIMFoa5QpSr5tK3FpCl2GuORW5DxE+KiYZKTuqcBec5kiA9q
         5M+0w84KSrc5ytj95rDaSy3KYsa3RcD6jlrsWrJ+3pIUlIDJz72rDRz/X+UybpL4WD+l
         dm/VViL/KgNII/vwP5zuCKvR0VJPE2BYpHEl8qExOz/jUmOExC2BIR1KRG0e0ZS+R+fp
         E9DWLD9C1zA5GRiBu9T+kPtAdn+KuCq+cdkqE07Pu7VczktkZelFdV6+EieeYwc6erXo
         7J4Rc86jObbLnbWxx7vHO7wew0jXELGYmVyb3Szr6T1p3TPuXSBgM4JaLUxPOfhzOQye
         F+Rw==
X-Forwarded-Encrypted: i=1; AL+hErHgq42/nBXuLgOUEOh0rdFsIxxSshUoi8Ls3XGyiorY+kThYc0U8HeJxRV5TtiPdjqvxdiaBdvzU8yfvLgiZJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z91IwWTvjsrLthnQBDMzZ+wcRZpoMqrgf0NMEKqaoP+T0jMCQbX
	VHqT17YDP+K4TnPbF/4hH/m7tu1FFZfcpDED0fHyO6q0S70A2tnkRaNO
X-Gm-Gg: AYBFou15mW0Rzog8JSCkYIe4BSEvwPlGxB9myASikkthlZ2nvzyE5b6Qe4Uac0djIt6
	Zs5Ktqw4aC0xIpK5HhrpoxxhOy+7W1a3pVw+hXFj8NvRYGc0xxqb6K+Zhgvcqz2dE/Xu/iVQ3XL
	YjJHP+c322aNApsGDAYCbJT6fMsRfEfaQjaPmD5vbfHT99Acf0lJwvEPzZPxqOol21TIuizDJy0
	swvWcvDPlSSnSWsrRh2v4Dl58R4A4d/2Ku22cH5Ei5gtBXb56J3lYk2rNkSZi+CwrRrbiA0YKHl
	gX7jPD4x3xP50i8Uqn0EsG+cGEooLcNdzCPNgBI5zK4ax6I3BlVT/EbUCQ5JnxXpUwKwnrbwYe8
	rb+p5uuNdHo2TdYaMHOCI6rEYdGY/BsT3UA+6LnJdAxGeSicN+LTm9FqXcu3w24anI08jbq5vJK
	loyGVXgZBlVwBHKAwjIfwScKajYe9VfX4L9fgLv2wqpCRqDa3U3DVTMkMF3OAawzTwuPQueBzoy
	NR4cl324La1QURh4YNBdasqNFS3rctg05yRwyGIulJlP9l1bKFtgA9JXmp0hMdpijC+/7gWUs9e
	VDYbSZhk9Zk4tSYv+Ua2flkjTAqoxyHJTcokw9opNGLFhZ4/3W8uCtBJbvJeJ0iraapu6q6J1A3
	uY665ESFfvpxW5nlW0slCaTaICCDgLXKzwgetagnuBvn3xwCmHiiz
X-Received: by 2002:a05:620a:458d:b0:949:73bc:c763 with SMTP id af79cd13be357-949baa13d87mr880796285a.58.1795217026434;
        Fri, 20 Nov 2026 15:23:46 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41a341sm303706185a.37.2026.11.20.15.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:23:45 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, shuah@kernel.org, arighi@nvidia.com, xukuohai@huawei.com, billy@starlabs.sg, void@manifault.com, ihor.solodrai@linux.dev, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, awerner32@gmail.com, andriin@fb.com, martin.lau@kernel.org, mason@kernel.org
Subject: Re: [PATCH bpf-next v3 2/8] libbpf: ringbuf: Use compiler atomics
Date: Fri, 20 Nov 2026 17:38:22 -0500
Message-ID: <179521430208.33161.11588030194941155653@kernel.org>
In-Reply-To: <8676fc63d1b69002f39adee94811f9384c19bb8f6e89d08576e5aaab283c6aa2@mail.kernel.org>
References: <20261120-bpf-ringbuf-fixes-v3-2-ff7ca15d6c37@kernel.org> <8676fc63d1b69002f39adee94811f9384c19bb8f6e89d08576e5aaab283c6aa2@mail.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

> Could the fence patch come first, or could this patch carry the fence?

Combined in v4, with the arm64 RCpc ordering dependency
explained in the commit message.
