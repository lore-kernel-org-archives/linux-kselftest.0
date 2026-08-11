Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEE840BCAD
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 21:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786485283; cv=none; b=hE9ST7wb56Ur4ae/h3mNY9Sum3aHmpzBSk3I1XO7Jd0ZKCHOlLqn/0jCJVFTqneEISUbndRTaevvfvUcTvd9wxvMjV9J/eKbIgM5zgbANk2Wtq+acnB3MbHGkIxgJcqsQToMc4YjRCSBwPUjDBSQQePd3ptIcATSjot26Fz6zCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786485283; c=relaxed/simple;
	bh=Eo5ZdLgjrqeDo2gVZoFLUwCXUebOx8SuLJqladOV2lw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EYH5vryqIm2OGt7c3o8Tq6vj292jL/nsJpWPwRQ0LU4TayjOcwZWGwWg6tiKCB1M8cX6QC4S98HcdWfGMwvPuCqNh3za9RbXiqy0xr22T2HnGrO8whNMJ53J5neWIuS7czWazNhWbTCXlY2ImevhNlSfnKLSXNlQBgOTwTyecew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Px7/RVtS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Px7/RVtS"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cab973140bso7543745ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 14:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786485281; x=1787090081; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Eo5ZdLgjrqeDo2gVZoFLUwCXUebOx8SuLJqladOV2lw=;
        b=Px7/RVtSRqOGYIF0Q3u4br2bul4Sjhy7rB/QPGwi8mAj+qk5eM3OjGwN4cmcM17Ntx
         G9gr+01CPLptAFPL1nUrD+09G2BMmVOnSWKAKI+mTrXrHlLsI74X8MmkaDdHrBMAUwiF
         P6A/RWHrhFdm7expOLmRJFIt6pkLFR6k2htlmiTxtZPNfBG1l5opGU7iZtgridhxgWpR
         sPkAemUviKp+o2+no4Nm7aGAQOVv+03b2C9v+zKbAjsVkEX4mtqfhyu/l28abMu3CPQ7
         JdnelbFVx+Ziqx8Cj4gtzFX9/l5Q4WwI/8b+lwWRxEbOGkZnlxwmOwEi/oET24dpUOdF
         K9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786485281; x=1787090081;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eo5ZdLgjrqeDo2gVZoFLUwCXUebOx8SuLJqladOV2lw=;
        b=LdEqxvFS30Ij3NAJr3cDwPpsNZYgjN6tP9Khgz2HrwGkAuK5iu4v+bzAE+k/L/iWAI
         nIuHu/W/YZiO1BfpHRaRapws+ysaawxZxFjwL3uHElcBxm0Y/BFzyP13kphYYxJAUkFl
         niwH9hXimi39RcmiNu9yKbsT+8br23UuwPPAcFjZ45QtOjlGaBllMEl1h9RTqFPQ6jAa
         pk+Cz6baT9s9yVxw4zf0rIIFctQq1EPn9gsfBqFslvdWnlPlS94BsUecavUQyZ2RcsgZ
         QSGT2E2nByf2lOnEAsh9ZcadtrBO9GhF6xzk5VkQTVTat5R54C1OK5447JCwgS4rfqOE
         tYTg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9IYqpqgDynsJtnFSeT32w28sOprwFi1YuyGX3I242EBp+SaPiUbK5G/oNCMcplqpO8QY7+AmPp9cdF/pVStM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8it7adzJSEuXmhtZ7L+1vshS37SFgxwUC/lk7SdXcajL+NEwX
	/9qvRovYti7JerzP15l4BWYINORVsv4xlk58bjy37GsrmZl1g40IoEUt
X-Gm-Gg: AR+sD120riYaDRwlYO++kHR8LcmXGcbGt4tDEXZ+ZnEAVwiu9gWjMTupGJUDZrtVoC5
	DEbzQ4OdltFMH/9v606IYOyWHpXSQcm/g4oGA+KX/zDHJCObsj47oSojAvgt7wUpFlOARHJ/96+
	9MEsuMDrtpiEV/Kyk3bkyFUus2+8VU/dei1xyldjBJ/EfubGc7jkUtacpmOnmOD8Nzb8ePHYTOO
	88G6FHKxQcYq3ZJ1USopGNqoZqtZkm8DlWxUAldy9s8OPnNg919vFXkkb7noNcnwlOwu0+Olt82
	bWsf/oiZKfykVMsc/VWbUmQmpIdU9T+TFOc1LufrKa9IX2m5vgpSLkz/Dm/mPFIRnMmEZ2APIoD
	IX4Wiu42J5HXSKWkVGHSZA9Uad4/NmnTGiRAkhZYuM53HvDUZKY4alYydQKs7olHP7PS4qF+CFD
	NIDF58y/nlqUSqPQdYrN8xd+zJvHkblYitv8kgvqm6PItydca6119AGXvZiiSABQFDDmdWWsDZk
	5TCPMW5Rw7af3CJrh2wsOtGX8XaAfyFZJby2PNzjmkWbB3u2a4=
X-Received: by 2002:a05:6a20:4309:b0:3b4:75c0:3ec0 with SMTP id adf61e73a8af0-3cc2bac4ddamr7631836637.30.1786485281298;
        Tue, 11 Aug 2026 14:54:41 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:cd18:dfe8:e39c:4123? ([2620:10d:c090:500::4:f345])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141244734f3sm2964718c88.5.2026.08.11.14.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:54:40 -0700 (PDT)
Message-ID: <4e74beb4682c478982fd4a00f5d805bf63bba0c1.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] selftests/bpf: Test RCU iterator state
 pruning
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ning Ding <dingning04@gmail.com>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Kumar
 Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau	
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis	
 <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan
	 <shuah@kernel.org>, Chuyi Zhou <zhouchuyi@bytedance.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 11 Aug 2026 14:54:38 -0700
In-Reply-To: <20260811035955.132989-3-dingning04@gmail.com>
References: <20260811035955.132989-1-dingning04@gmail.com>
	 <20260811035955.132989-3-dingning04@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-08-10 at 20:59 -0700, Ning Ding wrote:
> Add a path where RCU protection reaches zero and then starts again.
> The iterator is untrusted after this gap and must be rejected.
>=20
> Signed-off-by: Ning Ding <dingning04@gmail.com>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

...
