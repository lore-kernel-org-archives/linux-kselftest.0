Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D507334A3B1
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 13:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770123633; cv=none; b=RZOFEzFMQ8nxnI72ovcxk6gN7jAASljwUq59GukCMANKrp7/eMCNUX0rhnsMVFKiX0SfOCRDDPI/Dk72EhfeLH8JLFeq97U2Bm2mDdY/N6pLEmEFD+evRdNNaeuMSj7E6KD3U7eeExubN94T1rkxJDPAjPj/kepgPdIECk5N+pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770123633; c=relaxed/simple;
	bh=QfrRwcFVbs7HXzfXIJF1G4CMBzqUTb6IXs918LJA2kU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cYmBXS+8/1UmgncTefaYEMk24lpRgg00yGDYgA4ozbnj3NdGYEnDhq26mWlSSXq8U67Ff18zUrftbi7DiDFU4nfCpaVd9ikewoPgJRvTF2yLnnkVc6mtgTiG73DDAYzdzSebFgh9694KROP2xcv5MZD9sfoib3CQFFtRxwTiETs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jq1nVgbE; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jq1nVgbE"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6582e8831aeso8595636a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Feb 2026 05:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770123630; x=1770728430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfrRwcFVbs7HXzfXIJF1G4CMBzqUTb6IXs918LJA2kU=;
        b=Jq1nVgbEc+QRabvwNxsoLVixZKeiz+URccT9hmLyh3PN3UI10sq5mJ22vC4Frf/nCa
         Kxh5bdG/hqXZ3KUTYO+ZMqio6iYJSy5VMhevnvhLpYQJ22ChR++nZ0zmoZXZXRbtRcVY
         6WajfEKdp+z5NbuFfZcHPM8I2JGFPFddBnh0qN7Lb0Oa0X9V23GlteZla79cY2xLMbxN
         3GQpxwqRduDa4n+ftM4gkrMkm0+zG8Agie6+D1ECW6CESzw9dstQPvN7jeYOrGqp4xjA
         YMtm/b0j2DEgJzZtYxrEdpx2ODT8lTkvkQbKjLV83l43AIh5UQma089ZXLJLMgjbWQfM
         Secg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770123630; x=1770728430;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QfrRwcFVbs7HXzfXIJF1G4CMBzqUTb6IXs918LJA2kU=;
        b=bvwGPrYE5bb6JIjnuhs+vG/EQGH3uv8DL9+dXaZf5OcQiHaAUR7xQ/o0h7KoWxZS5n
         ubgqSkY3y5Ttft2iuMwDWlAy99sQvsT1wI8ZiW3GYUn01klbmoPyR/a1jPEE/i7Ngfis
         VQovNTvTt7E3IkWSe66uKwloR+/ZyvTQ5AqDUS94cY9e7M+DA1OUbtLhZpQR1rSuOM4M
         cStYNyZbrrmueho22fRoz6SyeyV5Z2xDRg1v8qTZMQzjnlOuAIygY9GMU4fs0+7NvoiH
         2KaOirHcH3VkNpKwn5eaV7cC/OVAMhbk1ui1JsO1DehzjBouQklL/oQlwX6GG1g/ITfO
         oHrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcR4+XjKslELXDrRDdlT1ZHHaN4Q2ZsjEb2wMizEzywegBa8iqqzCb2JlEfIA2ZSzsZsdR5b9qhRrqLDx2u6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE046qKF8ZA1gfq4g3YSEECPthIkZN/KRTWRDdsBjOP6LUmgfM
	JZc6TowCVZzYLXSU64kijFeU7MSALIEKDB5cecY7rhf0eBkahjK0tA4TC7IJKUpSgTk=
X-Gm-Gg: AZuq6aILjqqibU/XaJdiTchMQ1NGKLle821WDhHNx8gZ4B2668frHOUUYhP/iGic4U0
	+NBY1fm+e+sF8tNXcRsjE77z2wt7uBQ/PdTjU6fj/1rF+dEUg4RWL2xm8shlS+ItkTtmrL/EbMS
	IJGcqo7wNxiBs8+LvqGKccqfie16Cur5/4/3GDxNHxLKQ/uw8bbEJP+F7iA4mBDEM29YgPhUf0M
	nW97O0LM+R20c8+Sw3W+DxPv/LvnjhsCABMTNFTPbL96YNAXdxEv9gIUo4eit50e/nUMjTVGfs6
	3uB8UwU6kSc/RcVbAZ+HozuH8/BGDFu75Kp6NuZyYiCD72Yxl96DVR4xVSW4g2zlTrds5JqiL1n
	+6xtlNgTsfF7UIOJRfTs/5UBrgnJO1cj40x9ugq7CTpBBIhjzpSlvMNYQmpY2OCmrM0UINaHVu7
	yOiisUiAlNiY4=
X-Received: by 2002:a17:907:1b20:b0:b86:f558:ecad with SMTP id a640c23a62f3a-b8dff5260f2mr877455366b.7.1770123628657;
        Tue, 03 Feb 2026 05:00:28 -0800 (PST)
Received: from draig.lan ([185.124.0.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c5b38sm1024503866b.53.2026.02.03.05.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 05:00:28 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1C5C05F841;
	Tue, 03 Feb 2026 13:00:27 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,  Joey Gouly <joey.gouly@arm.com>,
  Catalin Marinas <catalin.marinas@arm.com>,  Suzuki K Poulose
 <suzuki.poulose@arm.com>,  Will Deacon <will@kernel.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <shuah@kernel.org>,  Oliver Upton <oupton@kernel.org>,  Dave Martin
 <Dave.Martin@arm.com>,  Fuad Tabba <tabba@google.com>,  Mark Rutland
 <mark.rutland@arm.com>,  Ben Horgan <ben.horgan@arm.com>,
  linux-arm-kernel@lists.infradead.org,  kvmarm@lists.linux.dev,
  linux-kernel@vger.kernel.org,  kvm@vger.kernel.org,
  linux-doc@vger.kernel.org,  linux-kselftest@vger.kernel.org,  Peter
 Maydell <peter.maydell@linaro.org>,  Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v9 01/30] arm64/sysreg: Update SMIDR_EL1 to DDI0601 2025-06
In-Reply-To: <20251223-kvm-arm64-sme-v9-1-8be3867cb883@kernel.org> (Mark
	Brown's message of "Tue, 23 Dec 2025 01:20:55 +0000")
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
	<20251223-kvm-arm64-sme-v9-1-8be3867cb883@kernel.org>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Tue, 03 Feb 2026 13:00:27 +0000
Message-ID: <87o6m6nfro.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mark Brown <broonie@kernel.org> writes:

> Update the definiton of SMIDR_EL1 in the sysreg definition to reflect the
> information in DD0601 2025-06. This includes somewhat more generic ways of
> describing the sharing of SMCUs, more information on supported priorities
> and provides additional resolution for describing affinity groups.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
