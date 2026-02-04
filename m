Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8B443900B
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 20:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770238151; cv=none; b=E7YVKrbkfaiU06PLXsLM4L4k4tEU3UEe3YHNX15zK/56+JgO5kbN0eLBIBM48DyB68u7Ii2kBmUulDlz9z3hyx/yIrvoef86n/nE3aTyDWXUtLuZJBUW3OebcXic4Q8oWlph2qSnRSvyuIGlRN8bNjPdhA+9PzmfqXGCrEV1S5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770238151; c=relaxed/simple;
	bh=0ZX0GEhN5MaPV9X0VVXvM267Z/Tt6KLu0h+wGGL8Lhw=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=EVtmzlQsJz7oPjkN79S20+hOqGXMBS+8ulQIZtgFjijdGaSDvtYllWg9XMggg5vMyDm8s78RxV/zz8B779LZjfA4GxFxdgGtZTbmymvd7FTQcM9xlkObDBTEIK+W7MOTvYidZS7Re5L5sVHtPT2PgE6VuAkimJG54kiDfIbvm4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=by8izE9u; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="by8izE9u"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-794e95357cfso2172867b3.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 12:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770238150; x=1770842950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zh/nDkVXfVHqHixPII5STDSbu+qVTIIasWwzxlzmC4=;
        b=by8izE9u1ebfZK8r9oLn4HtGvw+Y8q+y8/jungs5/qc9uGUZ9PQdBNCqVxRj632sEX
         hVGZXvmbM9QXN83/WPwf0hxjPDJW2zndgBeLLKKQmdECGoFJOVyEHXBoJygs07BEmSWZ
         MpCRb+PpO3kQKJqrobRywP0rZuZG+x61PdNNVs4LOq5VVTDXRVF5pWhIOjZ+etzAP1yz
         Qp8zanGMa4UVIDDo+HtRtrK74ziWNgqdv/zy2pRs22HdlCbODlHrvopvzdedk5tBtACL
         bbLn+ks6PhhusP8zShBQwCaxv4swHYiyFj3iI+ntpehM9C2+XjwT9qPIkVjCvGvO2DP2
         buew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770238150; x=1770842950;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2zh/nDkVXfVHqHixPII5STDSbu+qVTIIasWwzxlzmC4=;
        b=bX4Tc/s5ZYmb7WaUvIx0BK1A+VZmIcDlkEOOGF6z50LsWZIesjpS4B8Kq+kYi/JxS/
         2o6xrWRsMQgydr7GbqftVAMDe8PnS4K7DfX8n1i7qGDGEqYykOkPu3rXOTEX1iodgMxJ
         9h4GfwKYoNrEUj6LNpa9J2X7AJqsxsSp90zAWrAek3GxcqqvT/yz4SkYkT/6jaImCu/b
         MED3jbVhdC7LDjViZmZBORlZEsTnsVQ2Qg1ElJt5bhy/mK2CElOMcNBYDIdNpAjUhCZi
         19NNUZ6R5n3b+P/awk6MIbFCvuwih3AEc6x8nLAp8bPKkOfKcrg+lDtpQ7hRgs014rCj
         aQ6w==
X-Forwarded-Encrypted: i=1; AJvYcCUmMoCbvetb8GfjjrKWsJFkMOp+cCES5/ELP7sRHxLYQnIuw4OB+tSekuME7Poq/A/eHQHsvw17k+UAQ2wFsEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIyadJDmK3jrg+UucwGs3yET1C6hMMcMKWDfC4NFfaCEgle/uj
	4XiVjwFuXOxKeckAR2n7iwlTjM3s3q++bQsM1oN7oujYD2wSt6PWkuQ2
X-Gm-Gg: AZuq6aJ62va1tOM2xfjD9DFMEL0DkmyH90wLz/qBAUMIKs5Yzv0pQmdkrNm/41OjFAK
	fJInZ04dpa/qiJRIlMpnQCwBtOsujgFVKuET1JZOs7sGwgidGVRFZ72XEHT2D9suVUv1iq2E6hm
	Ss19gZhBtrEDGAs0rv6W2DZTRZEYXh5d3xD4mOCT20rqMGvYc3UitQpZCUIXX8Qu/Si/+9Bzzu3
	OKI65UmxoEINxBp78RujiiK5CT8O3ofo0fIHmUpq8zmE7mMlqMpQD/NrQ2qk+VW9GWoEBiUt1k3
	uKNR0QtmzVBN6ll8pcjC7M1jtb4uEONJoXpF41u0Gjng3kUOprH4N/f4ribzAOPfPNedZzdIy1k
	E0vN+PAcmxAhTwr0eaaP/9hrHj+e/KSq8ipQPXjgNh1m/4UWFJytlzvF6icYb4TMD//OU0RGVR+
	wmx0eMzD0/JIKfe3jc1NyYbhU5guc9fGw1wwsya2acpA2+HDilRnx4O363q0b/YEsWcqmY6A==
X-Received: by 2002:a05:690c:9691:b0:794:e463:d080 with SMTP id 00721157ae682-794fe8782bfmr39196417b3.69.1770238149991;
        Wed, 04 Feb 2026 12:49:09 -0800 (PST)
Received: from gmail.com (21.33.48.34.bc.googleusercontent.com. [34.48.33.21])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-794fee82932sm31167667b3.7.2026.02.04.12.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 12:49:09 -0800 (PST)
Date: Wed, 04 Feb 2026 15:49:08 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Boris Pismenny <borisp@nvidia.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, 
 Leon Romanovsky <leon@kernel.org>, 
 Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Daniel Zahka <daniel.zahka@gmail.com>
Message-ID: <willemdebruijn.kernel.36883640361a4@gmail.com>
In-Reply-To: <20260204-psp-v1-8-5f034e2dfa36@gmail.com>
References: <20260204-psp-v1-0-5f034e2dfa36@gmail.com>
 <20260204-psp-v1-8-5f034e2dfa36@gmail.com>
Subject: Re: [PATCH net-next 8/9] selftests: drv-net: psp: lift psp connection
 setup out of _data_basic_send() testcase
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Daniel Zahka wrote:
> This is a pure refactor, so that the key exchange sequence can be used
> in other test cases that start with a key exchange, but might choose
> to perform different tx/rx patterns afterwards.
> 
> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
