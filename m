Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EFA1C862D
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 05:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781848104; cv=none; b=KQFwe61iIJ7Ul10ZgxWQxqsFgIliF9xN5bERCPJ/wOmd26rUT6i3mLr74c/1YRn3Em4mtpCtiFVqdiZqlC7ow7eIaqzK+6bqT+p4ZtWGTj+n5DngqUrVTG5VBG7pBqTVHcPNdObPuSuqIHc+Dxoluy7T6wTOhdBQKK7fN8DrtSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781848104; c=relaxed/simple;
	bh=cooLtirQK1VfrgbFbfezM8xLN8Z6EyEh9oqq/Ro0VMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FgAGKlK+ZpMETRUBFTPQc0GZF1kThoh0TB4a0qJUI09pG2lUjReBBzFbeoxCxysVgZKVblEcEgpO11p22ktVqU3o/p8k81LWeRskAzAM+ruR3KZyKSznGy4ZWZi/eOnrhO8TXseLExYMs1eKzcEIpU0jtMZ4gS2VZbAFu1fEfZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2wbxIFm; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2wbxIFm"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c859878eb48so774389a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 22:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781848103; x=1782452903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cooLtirQK1VfrgbFbfezM8xLN8Z6EyEh9oqq/Ro0VMk=;
        b=B2wbxIFm5lLJ2uRNWe0MsLofoJS+xxQh8xlLjWSoWgIBsa9WPR4qR4zUWcmF1n4xBI
         cRmOB1kwoBK5lks7nQCSK7noquqeWENEEuLusYvSRde03X9JjGr/o5jzgEQujfBeJ4qL
         RLnxKOzUouiaVJQA+1DNyegmlat5sMiodB2lmLLug11rOxHyOJa6mgVh2Wdkf8lQBQnG
         lHo5SqFrS6B0ztOP4QPPuwwMPQl0xoScQ7XGI9kCA8s5lgVM2aDpOinNo7fobEx12lH9
         kwcPZByUw6J1NIKlFfwBV8cQ4f7ZacVEcogHKPwUGGftx4W1qstFwzRb5lXXUFLIlrKa
         sSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781848103; x=1782452903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cooLtirQK1VfrgbFbfezM8xLN8Z6EyEh9oqq/Ro0VMk=;
        b=gB3FA21TomS9FQ2h4g1tqDOfqyoTH1vS0aGcFpjsKPvUbLphnuTS5cOtRRZ06Z0fPj
         TuyZO1b12EfHVLRvfu7cl6nxd/oR2zXXOLSFgisgesALhpmt0cXTcBq0bOBaG3x4QUhU
         jt72i3ZP5YJ+1Hoo4VB1WjbplxXd9V3wx3gDhJpA+hdjiiCvUStcMIEp+SgHUCI/vHHL
         chdjZNxIyZdbKN3JMAwfxE6kxR4Y3O+ji4rrTBve9CxXniRvx/g7u7w6nwPPdinBnB59
         M8ZBBkZNRfmJ45UjYVrH8J8O6aG+M120CyO9BiTVaDMQwtmpIPoT2xIvEGvKpevtq49T
         NYCA==
X-Forwarded-Encrypted: i=1; AFNElJ8rFS7T4YMFboCWFoOuALi3wcbRu2FTg20TIzd/rINTpWGolubTgqIuQJcu4iDKq78fVoj19ujhe0G3MWfDbv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRjyxej4A3MUM/D110NiXQSTgQhnFuhTOW57CezeAJ57symkrY
	MGCn0jctfn7BPxQTtGPIipacNVD7sePs3kwxh5RG5eA0V9f5xYTJYTdh
X-Gm-Gg: AfdE7ck2Hv496ED390rccoKFdg3kuUyL9xgeCUX2Y7peVel8WxQvYBvAiw+c3NLolal
	Mq06BpMOumyIqKq39UEJpVOZBltUdBI0g37r6dgpOwsgYjQSqtWc22kq5mr64YGmWlMwZfQO/pV
	hHJ6Be0z54U02n36q+DTbSydQuVPJjnG4alV2YFIdvfIUew4FtatApD324eLq10PSD3Dctj8dii
	zYTD1y+bCc6mJtWoiAJrXWYMtmdU2h8aE6FkefW2ZEmKCEPkjnyB4GfPmNq19CLbZtLBkmRZUh7
	CYeURC+g2CETkoelljktOhVVzs7mqtlU7mkGLPWIKdT5i0Oa07lz5rb6o0s8IS03OR8nzZrgMgu
	DdOlEpAnNW+mjck2cnTn+uaOoUY45pHysjUlmq1Noh9a+tzXD6hE20cOVTkFWSzyGxFhtrQnSmM
	HNf9DusA==
X-Received: by 2002:a17:903:120c:b0:2c6:b40a:d0c7 with SMTP id d9443c01a7336-2c718f1f0ddmr26069695ad.7.1781848102997;
        Thu, 18 Jun 2026 22:48:22 -0700 (PDT)
Received: from dev ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c72089a155sm10555245ad.8.2026.06.18.22.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 22:48:22 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
To: andrea@common-net.org
Cc: Yuya Kusakabe <yuya.kusakabe@gmail.com>,
	andrea.mayer@uniroma2.it,
	davem@davemloft.net,
	edumazet@google.com,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	justin.iurman@gmail.com,
	shuah@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	stefano.salsano@uniroma2.it,
	ahabdels@cisco.com
Subject: Re: [PATCH v2 5/7] seg6: add End.M.GTP6.D.Di behavior
Date: Fri, 19 Jun 2026 14:48:11 +0900
Message-ID: <20260612032313.662-04-yuya.kusakabe@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260607160119.ed2022e8a358d700e1134318@common-net.org>
References: <20260607160119.ed2022e8a358d700e1134318@common-net.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrea,

Thank you for the review.

> The patch 4 review applies here, except for the parts where Section 6.4 is
> implemented instead of Section 6.3 (which is incorrectly implemented in
> patch 4).

Answered in the patch 4 reply: the next version of End.M.GTP6.D will
implement Section 6.3 (Args.Mob.Session stamped into SRH[0], no
preserved D), leaving the original-DA preservation exclusive to this
drop-in variant.

> input_action_end_m_gtp6_d_di() and its finish callback are largely
> identical to the patch 4 functions (input_action_end_m_gtp6_d() and its
> finish): the SRH check, GTP-U dispatch, outer strip, inner protocol
> detection, and NF_HOOK invocation are identical. The duplication should be
> reduced via shared helpers.

Will do. The plan is one decap helper (SRH check, GTP-U dispatch,
outer strip, inner protocol detection) shared between End.M.GTP6.D and
End.M.GTP6.D.Di, and one SRv6-push helper (including the GSO offload
setup) shared with H.M.GTP4.D as well, with the GTP-U parser common to
all of them. The D.Di handler then reduces to the prepended-slot
handling specific to the drop-in variant. (The NF_HOOK invocation goes
away in the initial series per the cover letter thread.)

> D.Di does not use teid or qfi, so these variables and the (void) casts are
> dead code and should be avoided. For example, seg6_mobile_parse_gtpu() could
> accept NULL for teid and qfi so callers that do not need them can pass NULL
> directly.

Will do exactly that: the GTP-U parser (and the decap helper above)
will accept NULL for teid/qfi, and the drop-in variant will pass NULL.

Thanks,
Yuya
