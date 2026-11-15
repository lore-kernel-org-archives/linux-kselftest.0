Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780173;
	b=yFaIvAsxHUYZIPWYnvLsuvVWU3u6gfZhLtY6BaLRhAw7RlhZ2eB/N3siP5Xuh2jQw2Aj
	 XmGTLxRWg3PBvv78KRrD9LEnlj+qXWeQgMao7Xh6Lpai81P1mXfbo9+U9pLLC4CVVkOe3
	 aGKvqUNBagSco8JXssa63wBPttJ2lVvQFXJxgR1AGOYolewEQrhyGF/E6Z4KCfbaZx8k6
	 9w7DmBnEl8ByzCJW4c9+92do4n4P2FMsF/R1qJhluPPP3q0qflHasY+irr81I8wIUzr+3
	 43154CPt1qEjQz9hUXUrCrlhOn0z4AZlmjEYcUbGiHGvFAiE5oMB5yX6SWUihFuwB6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=44GH0xmAnqDy7eYWEVRDMZZHirfXjJwNhusMFmtNtQ4=;
	b=5pBNNkqILu3/wvV1q4TPafaCMvPnigr2n1n5Lj9pzfB84IXx8cQMZLpBiZLzSws6Ur/h
	 EJufyGQzvXan/ZyWUOgBXL761GwZmk9V9VDD/DoHg7eaeXDg3N98mfGeqJfkPmi/yQxLq
	 ajHRgH/vUX1jDk71nW1LUGYu7NKdG6sis04po3WE45DHpi+65aIE50IQOOlxQJw0Tt0Qy
	 cnBzcloXM2hHza2caRt32/Z5nnmJYxqf50mdHJtPfRnjrXGW9ppjXZD7Pb1jhiHKFe365
	 udwmIRv/ka7Fb5Sc91+ECMKXI/zNxH7mIIo3n1z+QwhhBgJZoSfHrJcu+jODflZEsYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hMa6qxkq;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4060B606A332
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 22:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4060B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hMa6qxkq
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49a357e48a2so342897f8f.3
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 14:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794780172; x=1795384972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=44GH0xmAnqDy7eYWEVRDMZZHirfXjJwNhusMFmtNtQ4=;
        b=hMa6qxkquxLiBeveT81zF68GYb6CJxnvwU7kp66SYWYPigJcJHz6TmqT8tw5C24616
         bubH74AOXFvkcsGJXAFfX+ArBiWMUTVrjwhG77MzAp//sMX8SaJWiVMX8xbugTLpX139
         ZD3e/ooXqnWaj4k3pqkQZ7Ft7ethobWskQqXiWlTzPS6FzQTbXTCs9YNkLUKd2FIgb6A
         i9BZFyb0uuNX+i/i8CL3owRjg6mEGQGAjW5xHEdX0acwezoshJsS98dWmUMYOXQwW5HQ
         H24EeRiAZMJWVXcOJLOP3bGlk34c+aIjKvF4zN+3LAEJCNcrZVfT3bqNH8kene/rRrWM
         7VaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780172; x=1795384972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=44GH0xmAnqDy7eYWEVRDMZZHirfXjJwNhusMFmtNtQ4=;
        b=PB1vwVHk4KRhM6weKDvfUepsXJR1aAlP02L6uO6lMbeHtRXc+Q0kb/1Q9vY6iIG1wA
         Olb1nD6WZvcZFBr8x0fr3+Zq4uJ0b8xE1TtRixlQiaac9vY6Vq8LC8+9TqICbb4G4Ndt
         5tt6EZ/aw6HZewT8uI0fLiEYZLknXTfy915DgE7CmZEnCEblj5cEz9aPEuxmMnnj+l/1
         m5ktbnzJ7OZydTjQ6Q4aKvDSaDPiizkWf/S7KOHuCoIP2i5dOtIPMR3EbZBKKSgADhZx
         yFUhcl+aQexLL4bNW2Rk3WBHdBWIpXQKhBUlvuw6sLYGShbaLrX5BXyjWEdmeZw5U7NJ
         6FtQ==
X-Forwarded-Encrypted: i=1; AL+hErFhgUyF2RftZE2pTyI/3EdwEe0P9Ee4IB85Ffr8CyDq9BzTE9KrbuQ8hlOJ8NayMuymRygYi2Hv+yj9SV+Fjcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JBrFyK6kZ8+O21LuFmmpiCdZ5vFxbwBDcjSlNFRAAOqDTCDrd
	i/AuZM9eC6gAdR0Nj0Mh+sI9tiAw3ekVr6RJt6fudAJzVcu68pRHXBbk
X-Gm-Gg: AYBFou1CSOij1vz5gtC6GzUsc8P/nih5tc0TsIeav0dATt6ugGV0rp+dV6X4rZ6MPMO
	/HQGXNQNSHa3DKfAEds7f3In+0lIn4tkWbPzl2sX3Ln8PtXecNGIrumvj/2TBJ8anG3VrajMkQv
	cv0y7GZIQvQ7iTX5CQZdsCW+i3kOeIKK642qBDT89C1/KptALw32XTM2W2nNbohNa+RJHCA6XxO
	dgPy4hTuM3A4W4dNiREyHbv16ieU5XoU7X+aNtBzZRNkvGBkam999iqs9HUkObJ63g2hQe90KHp
	thfwcxrUQNuu39NKmWOq59GDDM6FMzXBdpjdbdYFbrQOAEnzbpFSiJSYW4N+gt4lHoHX/28sxPJ
	3vY2WRXp4J/ERpEHoFwmDFY2eNxcmR9DiR0kE0SO4Rfa29oCh3kEug5lU3PN+vE4QeSbkz8+VC8
	sHgpu/xoGpOcOcrYWzGOMH/AY2njTxge/IxR2/p9OgAyf94N9o5OQHzaLF/YEhDJMFkf6p8ggbi
	nrpil0/AqXxIwIvIbalKJQtXnnpC9XwIFfk69iQPAf21SFIlsvW1TQ4CcxwuBBjQr3JP0AWMUXw
	5UuQehqIpfP8CEdCdtqrx7udTQaV7PT5OuP3vdOASiUwe0hkF2k2rRwflKIiMn+gFogVuUDP4kC
	0cMAQ8dfUghZhevYX4JA=
X-Received: by 2002:a05:600c:8b74:b0:4bb:6a02:d42e with SMTP id 5b1f17b1804b1-4bb6a02d56cmr58017955e9.1.1794780171572;
        Sun, 15 Nov 2026 14:02:51 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb734b9f44sm9320665e9.1.2026.11.15.14.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:02:51 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	kuba@kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: Re: [PATCH] selftests: net: veth: propagate channel-check failures to exit status
Date: Sun, 15 Nov 2026 23:02:40 +0100
Message-ID: <20261115220240.51713-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAG4wq-exUYFvw4i=gQZhwC8fF3tnhmOMtv+NceYTBEx_TO+F7w@mail.gmail.com>
References: <CAG4wq-exUYFvw4i=gQZhwC8fF3tnhmOMtv+NceYTBEx_TO+F7w@mail.gmail.com>
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

On Sun, 15 Nov 2026 21:34:29 +0000 Tianyi Gao wrote:
> The Fixes tag should point to the commit that added chk_channels():
>
> Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")
>
> c017800af5c7 did not change this helper. The bug is present since
> v5.15.

Thank you for confirming. v2 already carries the corrected tag:

https://lore.kernel.org/all/20261115214702.50817-1-emmaonana18@gmail.com/
