Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CEC30DD1A
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Jan 2026 00:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769127716; cv=none; b=rN9CIfmDWtq8mfHgsqimXTixX6PChGnEBVU9YHLm452CKl4h837etN+s7AgtzC0yI8pyQLhnytEmHkesiYiDysp/fbUtJ0Qpi9Qkyuvoc8+nG3NlHS8HGVmBBDathhVBsqzF5IjEFQru7i99JnePXQWZ2sSGYzdwUtvcPuahWHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769127716; c=relaxed/simple;
	bh=P0HYp91xVz+O7MAMXYBbLBmfIfzVuVa3v5/XSyZYwHk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TubTmV7IUjaL/lAe0g+3YvD8nUChA+C4WQHgL9lqfIbtEnTkM8Dy/LZ0OeWrJE/I8guKkLIqHZmzo4JFq1uq6w99K1jPoPSKx/tRk++FfN1Dr1PWvhZt/Gi1q0NWPcEh8RS6BzigbFhP2ZzKX9su/P7hz3V/j3sNaWJHaJWiE3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfM1A3d+; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfM1A3d+"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso1083145a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 16:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769127706; x=1769732506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P0HYp91xVz+O7MAMXYBbLBmfIfzVuVa3v5/XSyZYwHk=;
        b=WfM1A3d+036dKAqdoLKhI8Glp98zL9cp0wyLzMnCbSObGCc9ea9hsChD2Gxjv9BypX
         fRMsJ6cTpCfSdQVzkQufi1/SCRj9PWcYVgn3IeMPtfQCbNZzZEZkElySV8D962AfNg6i
         6gj6FbBo2OrViq5EZrLrAf8B7RYJ4U8GA9Y+ewFcrT0rJI1faa1tMqorqNXrhr+Q8B/V
         7YhBKUoRrIKhYl2eD0nGsIvkjfmxfysjfcmKqBo+mOtkeobAhCnpKYIf9iFFT01uqtwU
         2QZNqooJzj/AEUHrbjgC9EjJlP6amXDrAQco+04mUfaNiWMOaTkB2tInz6Z1z9LfhG1M
         lhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769127706; x=1769732506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0HYp91xVz+O7MAMXYBbLBmfIfzVuVa3v5/XSyZYwHk=;
        b=QMvhTRtJCnYnJNHMI90zf391G6hnzSaIES9VVaXatIdb6ld922RsI4a6/jlFBmtRz0
         jAjnb3CoHJRU4AN+leJysHjJPgkoH788+T/WlaxEqBVIe8dYsmM1QozlqHXTyoZWsYLs
         TpqaGW7p/mV0N9sG1dMeMbYXCeGNmLikipl8q5ofkbLYktxW07hVNiNcgoYxDtRBKhia
         HeAfrEO3iJi+XcKp/gG4YdpFf6n02TFiLlbHG7HclMTFHEGDAs9a2/2mhMcx+XCoRmR6
         M/VInLVIpxa7bpFjtjvV8EwHSkKqQSLHUIejzZMAl2KfAcDD0O1SXgJHgrxtz8c/mHaN
         FmMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/N1UTla6AMso3A+1UjU4z8AevQbZ3tww8ed50gVKJdNE+Y1vIolBdm/j4OcrfSYYztUG3EkSTIwAAvOC/0IU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/fMAJhfLBjuktdJEnYJnWHusA3ekxZAzeFKrx0MBTaIfNdln9
	1M0TQrX4zKn+yA0ylGGhIUkRMnGVK5ddSEWwIwtPHpC+3E7pRkpL/zrn
X-Gm-Gg: AZuq6aJySVCBxUVtmMzfE3YxiFaQCiu+0rKG5pTViC4ot6jnT7aBziwH4R9sDGzvF/t
	Ltco0zHgwr6JygC5grvAS54YJbQsIHvVCvzWwQ9XGckaFigCqq9F+ynma+nyoGV2MJaW4wiwgbG
	7+78Mxm8cChjQgeFrDUPexnFcyVUT0y13lsDYrtx1yqju/4NP+pGXYPFjW/x/BTVKfEwRTIICdh
	VMewiT4RlNA9Ck7/EcD8pZWD2YxhsJZS+RMSLWARGuXubWzNdgt0wPD0t98BO2t03vqVoh1oqXi
	gNg3ptGypZa9f6kuyOfVnEXC5GKHUi0ZGkgMvWSX+411lp90nvvqn3dbHUDJ0u2NboRAKNluHDC
	xJkW/zjSt/dLmBjJJNzw8Eor6L5y/7Huq526RNJo/R+oXKIm0neunS2W2EOM=
X-Received: by 2002:a05:6a21:6494:b0:358:dc7d:a2be with SMTP id adf61e73a8af0-38e6f6f8e74mr1216895637.17.1769127705892;
        Thu, 22 Jan 2026 16:21:45 -0800 (PST)
Received: from localhost ([2407:cdc0:b010::101])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536d8ad7d5sm410354a91.5.2026.01.22.16.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 16:21:45 -0800 (PST)
From: zishun yi <320016a@gmail.com>
X-Google-Original-From: zishun yi <zishun.yi.dev@gmail.com>
Date: Fri, 23 Jan 2026 08:21:42 +0800
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"shuah@kernel.org" <shuah@kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"richard.weiyang@gmail.com" <richard.weiyang@gmail.com>, 
	"reddybalavignesh9979@gmail.com" <reddybalavignesh9979@gmail.com>
Subject: Re: [PATCH v1] selftests: udmabuf: fix hugepage size calculation
Message-ID: <6o26diaubgcxqzmdldrpkfstmzjiz7ffpr3lhznk2mcx6eonk7@77y3gwxw5n3y>
References: <20260118135126.102472-1-zishun.yi.dev@gmail.com>
 <20260118123825.c124bd2e01fabc1d78620d87@linux-foundation.org>
 <IA0PR11MB7185798382D21B45FAC56044F897A@IA0PR11MB7185.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB7185798382D21B45FAC56044F897A@IA0PR11MB7185.namprd11.prod.outlook.com>

On Thu, Jan 22, 2026 at 06:47:54AM +0000, Kasireddy, Vivek wrote:
> This behavior is intentional given that a udmabuf is often created for memfd
> ranges that do not coincide with huge page (size) boundaries. In other words,
> udmabuf is not always populated with full huge pages. Instead, the ranges
> mostly align with regular 4K sized page boundaries (which means subpages of
> huge page), which is exactly what the tests verify.
Thanks for the clarification.
I agree with dropping this patch. Thanks for your review.

Best regards, Zishun
