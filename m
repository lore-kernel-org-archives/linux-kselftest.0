Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794151463;
	b=hzjpl3UwsHAi0LyCnsLVgPu5IHD00cELancP/TE7N8qL9M4uE7wKabV3gwx/LhjXidis
	 WE9y3qrGiEiSpaGgwki+UZt52hwHBTk/cFmKaz/bLa5jlmGIv+u1oDRRae61bKRKOV2FI
	 dq3MGbN6uEsT6r1QE04ZpqeAtMrDI26EmDHHaxOxOQsns+AGyGGFewJxAMSrdvhchoBdg
	 OB/eQm241KmruP7UmrmpwfxflZBTbzp9ybl+TFWQiv/CVvV0aC3P5xDOy6YkS7Mue5Psd
	 vZoB9Xy0XKoGCY1/0UL5vmXdRxtoGykMg9laJOcxda/EAXKyc7JkjmSzHbRUC1gLp0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794151463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wks6IuPqWWMlFcHqYGHAoryyAYjkkjwfVtcF5N3uln4=;
	b=03L7hj7+UmIrZPQUBsdCmCiQ13JgwYty70ZD/3zMdhDRqor0T1eDyBPgWrHaDzRG5dar
	 tpDawZGfk811wi7uguhXito9zd7WzktiDat+6rjGNGF6bvDSkFwoJbQprnAJq/Wid/XRR
	 zIiZhYjPKXZlkGxka58Q9/07copqUW7IHD8pZR7eP1hk+8iqD02Cju4ssuQP8Rk/yGsQX
	 n1klXIwRDSQpieQE2U/FMwTk9iQaLRtRE4IGHUS54VjHj5frmfEN0+cbkcA3a2MjcVaMy
	 L/IttJ1E4Kcwxmyc4Hu/1zOUqRkzvApfTJWgJidNzTIdPa3WZKEaEHT0VmSBESgCwmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=lBw386D+;
	arc=none smtp.remote-ip=209.85.222.41
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CE2606A326
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 15:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47CE2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=lBw386D+
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-999b2b06bd7so60648241.0
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 07:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794151462; x=1794756262; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wks6IuPqWWMlFcHqYGHAoryyAYjkkjwfVtcF5N3uln4=;
        b=lBw386D+vewbW7OrViIvxr0rUJW2cI19b0gR9b2azf0K8wME1yhtAjo4TZCfSL1zAS
         eBrssG5ikBUOtqILkR3WHV1iBJAFr3+VIGDOY0tylZPtmuHTN3RR0ZsJz2sEmaNW8skW
         Iu7P26Tte6bnSPWO9JpHLcBfm+LCEfJRB7Epbc/PkflK3iU83kgXl1fjwWSp7nGQ/j7C
         lFjzDMWPh4dAZzUZQTLxOlRHPjckUD4gFDI0aJVtiohs6PeuupoKosp9yuQhpo0Qo+Wl
         jyZrWlK691C2SFSiw5tUMA11rksxwbJ8X5XTS2/v6kQCUkqP+0NuVLD8PaarI4HlxJVM
         uaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794151462; x=1794756262;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wks6IuPqWWMlFcHqYGHAoryyAYjkkjwfVtcF5N3uln4=;
        b=PTQwSQ9Og7+tzvn3caiQpUzTPpUmdQNm5QR1jDja8cm801Kbv08PhEzioBVKHE3Ebf
         pVmcbjKDO1pz4UenkLNRKH+QSGk7RcS2QFPwXcD8XydzYq0Mb4n6BWngTCgE3MT7ZZVh
         2KqdaOrhND20MMC9jwpLcJ9jcfLD9SWoPPtWn2FrP+Ytcl1EnQYVO5xhPz7gThKUmfAR
         1ZuJhKzmHrc3RijNesd7mFG5YDDOMqEQNvIfNyunY1BD/zzJUhpyKMKc1LLJBiL+EKrD
         rkJlePP6pBV1d98YcQdDUO5w120bvsYHMNegLv2SGMIdmN8/NPJJITS3XFVX3VIFeaYT
         elAA==
X-Forwarded-Encrypted: i=1; AL+hErEYs2mGoqIoIfnzjO/IV6VeTZUPBSOoLZ0bN840XpKixnpCC6tDNES1oaJ7W3f6ZAyriw1kqqN3M2TZ/JzUAa8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3gJU031vCjtf/aOXpzaU2mGQmhTgc1rdFgxQNuGKA5g/rCR78
	enZBXnyejpseHTz3sV78aiSZ9apFUBXhNrwBlbbRNMzt2UR6wFNqDaiX8r6Hwh6Fnik=
X-Gm-Gg: AYBFou1GTJPZ4NvI6VNfxE9ELhnQ1p9uSUeQnV82eNt+U4XtkTur48bTczfScqeuJXY
	WBaRh+r8NCihgFVijDKNw0SzOPYJyGTJ8Q/ZhZesmlPdSkmUR7raDSPqeXcZbZrAgMXUh/TIQuQ
	Ov/WPk2qCpjrqCrfeiYizZxMScJsnRUpVRqoeXqDy572hPdNu20s8iPWJEd5a7fi1vPnMS+Mnp2
	xF6gBfsGnfGHVowQJsj0lUR8i51FW3HXLg0lT+42nTE/x9Q4YahvRTg2B2u/bpG/aFxPwlGgt5U
	WZRlxLKreawN6Jj10WOQqgPLmzkO0qsZSB3fsllmARrcN3VqmrQFHj8wxy8ltxmDXj9yVBOyz4G
	hw4nLKugVByBlTFmaopqqpMEppk4Ja+8GwTEQ09Pf9DpUbxXZfKRqsbjBV3D/FlYYzavVpd7750
	2nM/XQOPTQbu5LozbLFpT27KLFS33hNT19rLPRwFBDVndn9yIAwIw2wTvdl9Z4kZloR38B5VsRJ
	kTvgf0MHGH2vgnaVIhe/5OBQthVT7kIUvdruMeV8FlMS5kXIhJJR8zuqPFMASYwqOtw3CcqHTRr
	hSjLg6u8YFpIcOiXa/Vo+mnzcQvJChOyGyT5nPM1e6FUKgL3pa//K7lvWgRYr6HhR6iVh8p6dmY
	hQwUjPrWSbfZxUPmDOkTij8TSioH44wCdutVMJLBqymvi5Y1f
X-Received: by 2002:a05:6102:d92:b0:7ad:3ad3:997a with SMTP id ada2fe7eead31-7d2daa685bbmr485125137.5.1794151462168;
        Sun, 08 Nov 2026 07:24:22 -0800 (PST)
Received: from soleen.c.googlers.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ece60c1adfsm2166205e0c.8.2026.11.08.07.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:24:21 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 3/4] selftests: kho: Add riscv support
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, rppt@kernel.org, 
 pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com, 
 shuah@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, kexec@lists.infradead.org
In-Reply-To: <20261106071459.2003-4-cp0613@linux.alibaba.com>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com>
 <20261106071459.2003-4-cp0613@linux.alibaba.com>
Date: Sun, 08 Nov 2026 10:24:13 -0500
Message-Id: <179415145358.358073.2579925146371313024.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=279;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=2foYgeRjtLhgriBAFewI3QB5zsYy+0XWNuIAF3mfsnE=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq8JQhKpBPG9CWddYheCPGKD+kNOAaT7Q0REO8/
 X0Xg5z+ESOJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavCUIQAKCRC7dyhM23N6
 3is6D/0UINh3QpPKiI0oOOWcH4They0T6KUWUtHH8paLMyiZTEZkaScs0phm5xLc845Ic9LxgmV
 Ob9G+SV8Wxahy4a/rO74Z83XKMVJDWYIpisVHoHivOtAWR+j/G79uLhwjA8WzmN5yO47Bk2nvkh
 ZzBpJEvC9rwTiftW3gZFajEGLRiM49GUVyVv//8qqXJ9Ikppz4DVWRb5Ym4oX6AGzPcIAbONe1A
 nh4nvYGHDQ8lBVPB66a6NO3U6WyIEfh6uZgSQ/++97wJ9wqMTtCfxkBkGLmKL0Yk1AOYpy90QwL
 CDTFSiHMVtve/xrQqdf0EWmvioVf5R+GdmTUyZYuD7pGWDiWkeuLrx8Fp9X79izbp51wQNuYxdM
 JdUKLm2Yg50CclKLaZ1Kfbx5gj3v9DkMLC70EqXxhq5F043Wk9G+Eja6C5cARA3buxzkWeBKNcT
 Ucgnb2XSQM/ctZe6Hg7U78wNzRetTB3KrvVsXeS8Bs4gsKjqptzAokRR3Ta5gTl3eFhb78CfB+0
 0xjt0yhEuEToGjrrg9yY6+cQe1olAah0ZoAIy3V59Ld0EoWxxy3a6V1KwMfNYvm1seTYH704eJi
 iPUZenreJsXOKLLBV3GO4GQh7ruky0RLLEMmdisjXOsYgfKc8xta8jxJJBAUKw1MxbYd41s0ZpX
 dEAw+5VN3pA4i9Q==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Fri, 06 Nov 2026 15:14:58 +0800, Chen Pei <cp0613@linux.alibaba.com> wrote:
> Describe the machine the KHO vmtest runner needs to boot riscv64, so the
> test stops being skipped on this architecture.

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

