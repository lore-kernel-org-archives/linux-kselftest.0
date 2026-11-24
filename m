Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556716;
	b=UdoD+ZpJD8Nk/S16GOwKbgNmtbMlOWFjRGNIMk/560LKwkacVNL1X7IyrQItkbKLHNO+
	 v7VYWTUneKvKUxguLo347Lgd5GeqCbA5UIjhUJTGEO4y41l1bUXoIrYVHoK51ZoU5FKI4
	 n64hrAOs61v1h5Otcsn11hHsWA5AeLMxMY8MIaoMnHrYKc3B9nTllms2q4tYMsoN+IWYo
	 QUdmZewShOkf7naNLLYXfGGjh8PqvHQWWHfP3kZKZqbaA1wL0TaMNjuS96adBof5O60q4
	 yMvtVIZHfDp7YRgs9wPbwtYQ0B3naHk60bJJHF43PPgFzTML5hHz3u6m67+CLgTRxow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bTez84NgMvGMhhtSTu0NJdSFRdBYeMlDyeUBe50JSsA=;
	b=1TKaVYhl1yCPZBYe88MNlYjA7Xca03hwzeRMuGoy0bo4jo6wD3PKDxqajCNpyB+aDkQI
	 yWSsNN3FTiV6Dbo1B9+a/W+ddRf4xD9AO6TYgVAnRn9pJziBaN27TiKHlIBUYcXpBf392
	 Ab4wdr+3sapOPofSesIG4H/MkUDiPLpZOzpgE6Nn92pe7jRQ32d7VoUkOw7g+LBnT6ica
	 41dU5f7ppuK0Jzj1J/Z3OehHf6gxrijNqGGDsTqVn9IY5FWuAm00bqJAZsX5TRLJoQO3z
	 ku60DZcDMcCJX0XbiIewgrMFGx9sU5X8vxRrGOcR3DV3fIZAhriKYsJTI0AZTHtI3tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m/Pk4GYk";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2684606A682
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 21:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2684606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m/Pk4GYk
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a35df85cc8so382201f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 13:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556714; x=1796161514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bTez84NgMvGMhhtSTu0NJdSFRdBYeMlDyeUBe50JSsA=;
        b=m/Pk4GYkd4a0n+3Ofirfb5f+ITK8dBGDcfib4ub3zN7yISODpaZZ5mJ5xBGmohTMYt
         HC7ka87JswHaOTPQyJ2T/rBoIAHPU9Kte/ev8XNaH+LB9KAFn6P/J5WfJaMewXaCyVEG
         +3yJrJ2m3ARt37tDdBCJe3Ox2Njb1uwPHBdgPNxtWDoFpF+iLv0VEeCkzKO9gPk5IDyH
         q6AngNbo4UkQsLr0pz0cnQuMxwod4OQDXtRK7gTiOmWsqCUJKO97VGkdDcxNG6QVk62E
         XC1LvLd9nXySVrMogVq4z3of5DmjXxYhi61MhUGmzZ/xNFo3niBYWfIP+9FY1iLgXvmZ
         V8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556714; x=1796161514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bTez84NgMvGMhhtSTu0NJdSFRdBYeMlDyeUBe50JSsA=;
        b=F0vFr3qdD0oyVrm4ZRRqEmLMp8LlcKsFT6GVwUR5eaaES5svmPNypIXEMdI/+jLyJ7
         lcJN+fFafaYC2jkRwg4IFN64F5cgZ4AbLS6CTvQFEIzfTmM5UXwZVrkj9YpGJE4AjF0p
         mF3yFzKV1YaiLieV4Fx3yALUpSqulmL5FAuzeNOwTbSs35pceFCvPu5pvUZekBTqSEa6
         I+dESJO1y+X67G6T3FcUwfgkJ7QjH/llditjrK57m492LZAbXPtkw5Vqzpvv/7MaeHQe
         mXhRANVPfCFUZXthjyA/kM981IaSQKbGMNl8nP7rnPSOxiSey0R1YTqQFUQzomhj/GNI
         G2mA==
X-Forwarded-Encrypted: i=1; AL+hErFHIWR4Kgo3YB7W9uZQFVl6eQOE2qA1yT63Ci8RYAcvtgTSkzoovR9iL3uBdJU32fQ7j8l/KRPbt48iV1Z6Gxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XvCxxzGcKHSgFB5d5dTId1jlDsCUrAiDw1LHCgBz1Jb1/rs0e
	/FV9DIdisL7tlQTwKooIW0f6CP+5EtShpj1tie6ctH+I7rXaDajGH3U+
X-Gm-Gg: AZFdTZfdB8LDG/pcSpaUHtABX5zaDeljBso5Iisczd7dRtqG1QTVsMtaLcXgCffOlEU
	rQ+f3uw14cUjvvzw+2x8uFuY48fUjEKF60j92iEx0NzOm+oXaa4I7LNnP1hHxdzf3DtX0F5ldsY
	hY2BPhptqmVMbSLa/gfQC5YJPVy/l3ZMpLy6jX7/XPYBg+2W6JqQ3knp2qKWklWTvfw4lDW8rXv
	1AJmUdQGMe52gDRzpknU0TwkUL4yqtJmSTLRpQjPAWhmHv84vM8Re5kuqSrgPzAVSkzl1vfcn4h
	y3xm12sa74mNBwq6k9DR+uyKkPfJVDqEoaiGvs8ivB/v/2MYrLFhokuLGifPpkqPui4hkYZ3h7m
	vq+l0Wpb7cfnnN0W4CyOyKaIEiXvyZmwEnbSM5Z80MGgXJxL5W71vymLu5tae4AcAS7OZfhTv5N
	agSkgfSeXeoLYN2RUqi0RJUMedin4K96SzXcDX/AEiyw1a4TzddPB/SfL1BXsJ4nGrHpBuCjFMD
	+NhmV2Vv2eJXeK97ClP3amwTJD1Pwj2OIMIv7y5TID6E3Yx2v3dif/9OOkOWqwZrvIcpieoKo7b
	1Xasb13ohgjWBuVF2Wad1vC2ucNPKDzBbegrw+2SkzlxHIIZnR0J58LAi81CvpKRYtfjkw==
X-Received: by 2002:a05:6000:184f:b0:4ab:cb33:9b87 with SMTP id ffacd0b85a97d-4abcb33a2e9mr33409232f8f.5.1795556714219;
        Tue, 24 Nov 2026 13:45:14 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm29025201f8f.40.2026.11.24.13.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:45:13 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: hangbin.liu@linux.dev,
	tianyi@cloudflare.com
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
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
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	emmaonana18@gmail.com
Subject: Re: [PATCH net-next v5 3/3] selftests: net: veth: propagate bad-settings check failures to exit status
Date: Tue, 24 Nov 2026 22:44:58 +0100
Message-ID: <20261124214458.12800-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123052207.GG10218@Liu-laptop>
References: <20261123052207.GG10218@Liu-laptop>
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

On Mon, 23 Nov 2026 13:22:07 +0800 Hangbin Liu wrote:
> This one and patch 2 are fixing the same issue in the same test.
> Why bother with two patches?

You're correct, squashed into one propagation patch in v7
https://lore.kernel.org/all/20261124214025.11603-1-emmaonana18@gmail.com/

Thanks,
Omokefe
