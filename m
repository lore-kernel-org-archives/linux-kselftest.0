Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795263133;
	b=GQhKLPn8x0QnsxqP5lfHr18JLXPS4FvUG+B9eHMyLNAtRy6ltG7Vt4u78JrN0Omw43rg
	 exQHCEeEPvVO9eJoCq0kz+5GjJUt76pGnj5rlsRnqYqqTmS7gcuHUW29qjuEwLgcwZwwn
	 M5azUdC03JZGb+OknfVaE9ByxA44f1iwqdtIoeNP1spQquoulGZnOf0p5dCm+eP7mQeQa
	 UpQOyodXNuTUEA6/bS27YeBZtfTePsGN0x1iExM8Uek6DuJ/xvH9zD7efB3Mq5ur9EmxA
	 UQNADHqmAtFFoMd7BMirNR7WLI1Tfa8k/VomNDm4ESX/8WJwUfMaaxkjXbXLTgiXNjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795263133;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=lGYwpKC1fByS7GG5SknYRcbt4FjMkQjX/lb3OlO0LP4=;
	b=Zq7hBO2xkxGtIaDCrpKHO1h7cSsIbOOBXnd3/tTE7bL1vfh13myoSMdH2WmuGvOdqO2R
	 izCRVgRH41704Q/LnnDPIwklcsLe1klkH4Q8WQY74NrUzS/aeVoTSKeS/ZIfV+axJTmaR
	 nXB6sTLgmX9RBAUFKJFC+s/xBrGDviNCJm0RD8C5Jqr7bwhY/t8U0Cj9b22RUF+gVB3YY
	 8k7fXIqtoJjeJTW21ibu9CZTdVyOgC4YTfj+pGwrI7ihCQh3aKe/YUx5rA6P7C2z1Efds
	 VqRreiuJCSoPMfHdHOZfIlIctnMV/RpnLS2sr7xkUIdfPjT6NZoWziptJ8NCoFiDoqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA48606A32C
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 12:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAA48606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-55bd96affd2so37959671cf.1
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 04:12:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795263132; x=1795867932;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lGYwpKC1fByS7GG5SknYRcbt4FjMkQjX/lb3OlO0LP4=;
        b=jZ0h6T6PBb4udBHqxNPnebnjBWrHcgovE+Za4MxqT+dj5yc0bzsU5hHtRnfI5BytX0
         Fj6dOSiLYKZHGBS3wcL+Iy9Lh8y5mv0tTqInndQvRLrVYqXuJRL0ykLNq4aoZGYNu5s+
         xsreXAk9qRkpAhyIdxzwCFYZYMWNi4PwbQmwBGEl+OEO49BFrkTeeHvc6hZDAMpUjgpE
         OpEw6/+a54EnRzxp/E8NXW1cWEQwp2eHylbS+xocqq3T23613wzFOXg3zoVkWR0fMh1c
         5D6Wdi7X5tWWycY+qu7QFdKg8SUDJn/SebIvNs/moLeO+FKqp/3Slc4HHLMAWaBbyjwp
         T3Ew==
X-Forwarded-Encrypted: i=1; AL+hErFBCGobQ2m2V5t1+SFXK7BB8Uq3zr2XhasAwxqpotSfLe7ktlrACvAhvNWK+8iDP6xfam+6t/TbVWQDcJrEfAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5B4LUuiK2Sd7idVdJi3NyLY/cR02NB95K0uZ9uhVm5CxXtKXu
	j3+M4Z655AQd27ph47COSzjoZPWqgE93+blGwHdCbS2g15ZHU2prle8hcAJuy0ry
X-Gm-Gg: AZFdTZfgK0aVs1tgfZRv8e0t3FXvLzyy4TkZwB1Xm8ybGb1FP6xqTGKBNA0/0c5lPF5
	/IZt6qOz/iH3Xy38fpgK58MJCaOqXcXzbqV9Vt2rFGRtYwY72nZ+znyfi5cLmFDbyOykD4xjg6o
	+fDoCImpKsalFCmZ/euZt+nuF4mCqmTggHmuKSVdVNDeHb/xvybDoAx8zibuksbe78qHxgDoxAu
	o5GG8+MQxB52PockH2+cOJgc5v837Aa3pJeg0+q2krSOOkgiqzHnuHy83HpOJ0Upn+NDV0Ma0oB
	Hc6ZYSoxhw/XlZB3EBuvDFjTuTM9EQMXIw1crnSjCoNOEeP/YKDk5AjlDyXC4wK4AOFKkkStVSg
	r4fBfNXneEgpumn73tSSiGw1Kh+yPzfgY7ccBTLetrcCLJzu5nw6GHNxbkKviIRFII+vjWruFRA
	nE5amsCrzvBfxYjD+LPjEvwFPdV51K6Twtj00dBoCZI2rTjpApJoCH2+ysh7w2JgFp6EXXIVG8J
	Kh2wIYYGzkQzQZoGSVLkN30z2vt2lFEd9bQshL2Ndc4B6hAbrTGaIOahxObUysTOTUIqRZkzpvU
	sIb14BswxKuhErEGpWeb5hzKzvf6oqr6+oAXlbCXqdwVdFjh218cHei8I9oO6wZDT/cX9sP78T+
	y9NRHe9+CbJUAPLYpegY+qiGaR/fi3T/ja9EQTobdmbzxV6MmIl2r
X-Received: by 2002:a05:622a:2283:b0:55b:9d8d:f29e with SMTP id d75a77b69052e-55d769c6d1bmr89159451cf.9.1795263131897;
        Sat, 21 Nov 2026 04:12:11 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78812968sm48042081cf.9.2026.11.21.04.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:12:10 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, shuah@kernel.org, xukuohai@huawei.com, billy@starlabs.sg, void@manifault.com, ihor.solodrai@linux.dev, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, awerner32@gmail.com, andriin@fb.com
Subject: Re: [PATCH bpf-next v3 4/8] libbpf: ringbuf: Add a caller-owned iterator
Date: Sat, 21 Nov 2026 06:58:00 -0500
Message-ID: <179526228002.45024.2428180539629576513@kernel.org>
In-Reply-To: <awFr3R3DPS_so3Pp@gpd4>
References: <20261120-bpf-ringbuf-fixes-v3-0-ff7ca15d6c37@kernel.org> <20261120-bpf-ringbuf-fixes-v3-4-ff7ca15d6c37@kernel.org> <awFr3R3DPS_so3Pp@gpd4>
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

> Can we make this internal helper __always_inline?

Done for v4, together with a private __always_inline destructor.
Callback consumption uses the private destructor; the exported API
wraps it.
