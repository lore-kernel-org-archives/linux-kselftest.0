Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A246578F4A
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 00:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780275233; cv=none; b=MTSNGm3QyjdMRc9L0XcEUBMPqm61H6i2pNAx6LzoKLviJWSLAa/1CFgnVILHGez6xgVNmX+f2eRWilyW9bJVtURWsbC2ldtn8BWjosVsnVIyF2jxKdocDCs68aB8Eqr0eFMT5osQP43fCBwE2ChHoCSStiELL3ra1CBItSpyzu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780275233; c=relaxed/simple;
	bh=0kU6F+Ep+BE2q+0PcOAxFkcVqKURdV/zzGEyeutO3P0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ODsRUAuYFuHZ0d0BikDaZPQl1ozzJWTFouoWF5sKjhtVWdIpQVfEty3eocP+YGd4Lc7wV0eZWn+vezg59nrF9zY+NOC7VPQYVT/W7sQwCYbfs06E8Z4yXWGlVSD53yzvoDmYLOjgC5YPbWhtHypp+YTg97CAR00nHI18Bm0oQ3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSKsZM05; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSKsZM05"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c8588ec1b44so1031173a12.1
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 17:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780275232; x=1780880032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kU6F+Ep+BE2q+0PcOAxFkcVqKURdV/zzGEyeutO3P0=;
        b=DSKsZM05F4ewEd6A87rQF7BfVXp/1FxE0dpwI4DTdbyC1HoAAZfjgdz+shSTnWmcLr
         zVVVpm7GyVKC4pIk/MBrXJL7xoEJKV2zOSsqIWoVfJ9Y13CbDFaH1ZU8qEacQAnXW2Yb
         84iOdrj2TC5AAzGbB3RqZG5rzN/tn/vzu62doNbxWmTk9e931Vj/ydPHOk87D+w3+fUw
         xHEC6JwxM0oykuWtR0CiOeQhTKx4/s+jecjEdSKuFGYwCxmdY+kXg6ly1IFOTtHF+HmE
         EoWL+QDq97bcnDy5eMzsxRTMw502h3ao5E2zuH7CYkv9HG/MQOCj1xf4yBehfQMhAU8c
         cxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780275232; x=1780880032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0kU6F+Ep+BE2q+0PcOAxFkcVqKURdV/zzGEyeutO3P0=;
        b=WRRfIxmwCBzM+8591lv3mkiAdz1iOurp7b4Ds720fRNwg5aKZoLYPKsX8EYZh78WPu
         TFXCI39QWaBT4ONYDYqvJ8CO7oU69r4ESQ6dD/qIYJiRFM60eLrM9DjAGG3s1nz8+cYj
         7Wp+Hi+6euyQNPo6XI8NdfReKLKqK+VwmKv8uRzAvk2Mrcx6wvuXoQHW9OtF5XT5KiS1
         HqHCGtJFvctiO85SuHuU/9HNnTGgjavlIf13pnYEEaN4+I/vch7rhanp6OSfJ0CxqBCN
         BFGEJdJMhipsBR3c+3PpP+NHrQQYT/mHYl5pMjYu3/Jd/GHel5DEHDzXPbqf3uRcZeBA
         Uyzw==
X-Forwarded-Encrypted: i=1; AFNElJ9VRZDbPrkX5OrZoXg4NFZvvgf1HvoPstjGgnDBkbnH2dMRxxhO3us6nZOGjsLA1a4XSbbj949ESxOteN8JAsY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeQzK37k3N+MbDHt/B7LEtj/XTnZsFttIwdk047XDvO/jGAMf2
	zGvMEK0Wy+UJEUZjaLZ5Rn0OMEPJ7vsXeZfm3GOm4v6im8DKIPCyfEf6
X-Gm-Gg: Acq92OHX1hceY+8jy0uJVCM0Opg6lbGh84saUIoMY6SH4hxXetDHMp6+BarqaTOBEz5
	Viez6/YCoLdpEkKweCNMkuPQ/1HVQKqm97Kc98K2XdEUuETQrniknKqxysVtTb49xH9spG9PHJ0
	HQESA+KBL4VfdZLfEq9f3fnNokQfc6HVRmefv4mL19bYIoBfdlrVMSUDCoH5H7897YY2OWaHUKZ
	1j8Zhm7AVDmQ/YlSmApKGvn4d9m9nLsTYZvp8/zjEOmRYX2/VL+2tkoH4w2T0rCaW9smhWPpD/i
	EQBjh0Lwq5RbHwQedUf6xl988DDwse1266rqJcv+X8NAM4tNFY8DMQXm8e6JgxQAQZEP+sawUXU
	GYvFFuuT4ZkAlygmKCkTd8e+e7wLRd7R+WB7211bZWz0N7R26TzDmakeLzmqCbERLHIt0aM7T08
	F4c68zu4b7yvgqiCSpDEwFQzCMuFOfMnzbKixQrfQ=
X-Received: by 2002:a05:6a21:498:b0:3a3:4604:9585 with SMTP id adf61e73a8af0-3b427fe297emr9798594637.19.1780275231820;
        Sun, 31 May 2026 17:53:51 -0700 (PDT)
Received: from laptop ([175.204.13.24])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772d5ebasm7581295a12.27.2026.05.31.17.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 17:53:51 -0700 (PDT)
From: random6 <random6.xyz@gmail.com>
To: alexei.starovoitov@gmail.com
Cc: andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	emil@etsalapatis.com,
	jolsa@kernel.org,
	linux-kselftest@vger.kernel.org,
	martin.lau@linux.dev,
	memxor@gmail.com,
	puranjay@kernel.org,
	random6.xyz@gmail.com,
	shuah@kernel.org,
	song@kernel.org,
	yonghong.song@linux.dev
Subject: Re: [PATCH bpf-next] selftests/bpf: Add arena invalid node id test
Date: Mon,  1 Jun 2026 09:53:46 +0900
Message-ID: <20260601005346.26716-1-random6.xyz@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAADnVQ+1QNO3rGJi4LbbURXw1HfxXh-Z_d6bejvKFHauQa2COw@mail.gmail.com>
References: <CAADnVQ+1QNO3rGJi4LbbURXw1HfxXh-Z_d6bejvKFHauQa2COw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Agreed, the extra coverage here is probably not worth the additional CI
cost for such a small fix.

I'll drop this patch.

Thanks for the review.
