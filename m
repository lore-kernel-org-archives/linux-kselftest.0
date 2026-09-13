Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B584385D72
	for <linux-kselftest@vger.kernel.org>; Sun, 13 Sep 2026 03:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789270368; cv=none; b=rVqhP4GxFnyds/+daieRCPE8l941B7GD7LhvwGxBuGUexKdOxnO4vCJ0rPNkMpFDFcxul624+cucY1E3tLvUlec18OMwqf/L0w2N8EP2VIXmFpfe4bj6kIdV3OVPhA3a2ilzhZ7cig62YuUr8a88KDLVe1lLsUcPDtamv9wNnYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789270368; c=relaxed/simple;
	bh=BD9OGmpZ3+fJbRvqNTy8brT1EJQoXKQTGDFIJKhBtpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FET5hhvQi/E07/pvZTSQFXhC+aRspAIs4gMRcFspZcsuJx2dwxoc4HzoRTHePVYKeH/an9ujQq3HYWttkKGq/L062m0w/fFGGiXNiLq7bDm1NUDGdvP2baRiIhJ9vHEYFtpah7XZedYLQcy/YI/jhUVctgNen7Iai0VDtBrgL3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ie/eSgiE; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ie/eSgiE"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a1e9f55e03so21163181fa.1
        for <linux-kselftest@vger.kernel.org>; Sat, 12 Sep 2026 20:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789270365; x=1789875165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eUxnSrKVNmwG9e50AFcOowKn93UYykTt4+mQ+2qxLTU=;
        b=ie/eSgiE8BtGZ37xl0C3cQMpi3wy/3wgt3prtU3UU1CmBHfF9oiXmm91fLJWFuvC3A
         dA7rwZrineOI/k4sqPZfhgQkB7fGO1/FDCrdnPJPNzF+vIYDn9ApMCk8oN9qG9ap72cT
         Jk/44EBmE5S5IxtSgd8sJdTu9OiAqJ5hH3rFc43SrRzIhNCY2N3T7gE1WGlPaaDAZgbl
         jPJPIX+wUSBAvduaBekXn/GEE1QZnIJGY+o4H4L6YLbl05nQZspzfOSA9BMltgmN/3Gs
         7GDepsWxqVZIRjrezMdYgNPmjwUa1BOwoEnA19eL/EvSV88olRYaGWhkjoaMG9uZN1yO
         YwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789270365; x=1789875165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eUxnSrKVNmwG9e50AFcOowKn93UYykTt4+mQ+2qxLTU=;
        b=A+gkg25Vbl/zxVC1EWVj0Jo37YzqRWj7JOEu1VK3eofZM3QjapQTjtD5yS5emY5oYg
         +u5yTl/WlbFHNEKUjWTwDk9j5xx+HFBB+wJwqb692ekSvvWHv4JvgVEtShwQWUgDM1d3
         nY6C7A5syztaKKGXRFQGG4qs9iVXcLpNIbchWDQFkCTUhjBaLqMac7u1gM0+xCaAHSTd
         mTgh2H2SV3Y9AwvwHTPyQDjKHILvbFRYOvROcIWFDyJdW0A2K8rsPFLDCtXtJyZLbCZb
         Z79EZk/bm2+RKDsEyUwrPQUt+M+X3hHa2M+opDMuiQaitdMeoB/2PT2BAIjEc2VVcFbE
         pJCQ==
X-Forwarded-Encrypted: i=1; AKwUvBy993FASLj8JKH6empCoylJyP1aQsmRNtrZ70UBiBMoM2olKBgGmEprypxHr1USsQajp7ZT4NsBGljeIJWvHbk=@vger.kernel.org
X-Gm-Message-State: AFuF++nvOVmq1y7EehvEmyMWTff+jV2l+3ZWhQkqPl/6R8aZJvUYqsCb
	A6SCbU2kLMC6afZGpalDc3qNgTngfD92auQL30iVVfsSVGVuVPEfIMA3
X-Gm-Gg: AYBFou1yfheHrDvzR80B+l3Ir14SyKI9G4FTpOJ2UJ+dJ6uuJYUxqtkPh6L1wWZyCe8
	c07VGt3Yv04PZGlhs/jR+jicnmdIdiHy5giYvachHgBpT0Ik5JDC8g/T+KutAvuzRxxboayl/T6
	zWto0kPnLFH5MM9Qvb6m1Wqz/FvZGZqKS7FFf/Ymb0PdRE8j1jwCohvU/YyHw5cpMLek2bEfKdC
	HDErNUDN7FX5tPs8BMYfIJ5h39q0Yb3XPdRx2HULt57Phgx6+gIF81aMzk0vAlj84+YPb4hAs7+
	W5WZzjX8QM/65xLfwPaHkGy9ZaD1IgY4nxc43e0OjsxZqdc229X+qsRTD09e5ZF4n/3VVBkRleI
	Me17wJAE6GqfJ1p6ZJ5Stg+cVgbdbdFWjDDakQUPbAIsSTKYlXerqUEKhUCZzvOSuWN9t63ij0f
	kkOrvpqb0jnvRWDMMFY2s7AL5vXsm/o+PBGh628aClmIkbsafTSrRTG86L44Q2irfeqMP6HiphL
	GjiKsSSCkCyQhHqQ9TNRJFrkmyfbaF6W5G1PgvInQg1
X-Received: by 2002:a2e:be90:0:b0:3a3:7682:499e with SMTP id 38308e7fff4ca-3a5a525304bmr12047681fa.19.1789270364978;
        Sat, 12 Sep 2026 20:32:44 -0700 (PDT)
Received: from dau-home-pc.. ([95.139.134.117])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33a1cd1sm17024041fa.42.2026.09.12.20.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 20:32:44 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 01/11] ip_tunnel: add drop reasons to the generic RX path
Date: Sun, 13 Sep 2026 06:31:53 +0300
Message-ID: <20260913033213.873609-3-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260902184730.304d2d34@kernel.org>
References: <20260831215137.549324-1-littlesmilingcloud@gmail.com> <20260831215137.549324-2-littlesmilingcloud@gmail.com> <20260902184730.304d2d34@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026 18:47:30 -0700 Jakub Kicinski wrote:
> >  	const struct iphdr *iph = ip_hdr(skb);
> > +	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
> >  	int nh, err;  
> 
> reverse xmas tree

Fixed in v2, and not only here: the same was wrong in every block where
the series adds the declaration.  They grew when I gave them an
initialiser and I never went back over the ordering.
