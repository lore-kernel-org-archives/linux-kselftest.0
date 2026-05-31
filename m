Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B3835E94F
	for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 22:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780267315; cv=none; b=tJJvqMUcYUF1K9iBK76JkV3ewcMx2NvrhVzcciUEbh+xQrXwAdH3S2yRLuz83oqwCKV3ShBSrPEm/7at7KxHNyDGkrXv7YNIXD1eEhlXtlr+E7meAet220irupPQreJghBESdzcX+9hkOu6tlZA4+ltmV1SwsSnW6VYzOWQoRtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780267315; c=relaxed/simple;
	bh=QYnP5eG1tsJaWRPfgP1WwNKfVi/7N4S9D05dPrpFu1k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jFDFX70W+Oi/v34uxr8K5B/bNRtw7t7krzsw4mxbuCpo1ebJRCwhnB0i3Uo5Y79lyJhGCGNxS24uQVKVEyUYSGktYe7uKpni2m2eXcrrCRWMpgYxHj7OK2R2bAsQ1MTdAjeEqZII8PSzBgmvmAlnp5+GxQ2ti8Z0vU0gmIPyLdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b=PW+IAv52; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b="PW+IAv52"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304e83724bfso3330616eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 15:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20251104.gappssmtp.com; s=20251104; t=1780267313; x=1780872113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/F3JV2QPDvY67PvZV1sf9gS7c+wroSrNdCqXiiKM2s=;
        b=PW+IAv521AmHcd7LhBG5XGqbac/qHz1xsfLkm/X+D0V/SyBW9pDHia9BlmMOxcWrwK
         KGUBL0kzrFVxlSk3ilrNyGB66FUrjw1PLt07qBhdd79JGJ/lNYbiGejV/fp0/erxLOTQ
         T0ywusxqmj37Ti5mdVg4dk34Dh/cbZgqP7UZl6ec4Z0SxsGuPsU4MZJyEJ3fr/m69h01
         ipUBIbJBXqrF0MKwitXBeV3BsfVT0kogdLD6joSJQyJ5I1OG0ilrRWqSQU2bTjKkby/j
         ZoW0Of/+TUnhVeabRCsznj3GgvAGZ+yIERpXVBW3g3Qr6xBV3V1uTxmMBdRhVyRNsdAC
         o/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780267313; x=1780872113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p/F3JV2QPDvY67PvZV1sf9gS7c+wroSrNdCqXiiKM2s=;
        b=M1uM2TL0gOqeFnbjOGzx3+dUDVqD2O9vGm9WUzhljCCWlBxmKOdGn+keJrAXBAmNxP
         A8/tz9jGFpNQeHB7XwVnZOTtKm3Gw7nwNcrmB8xzWYSM/PqghrINQNMxwM3LHGRtcFcJ
         DAUdRmwlGa0Qoou86aHvWr079OSb+BIMRKa1+34lGj026Op5ZGIsjHLCjO7z4m4t+YbH
         Thsvs0bNeBVnwyp8EIUNkvZCrh+jVEIlQs0HElFwkQdt8JLbDwovkAkEAn6h/sJKeBjP
         yCTxnA8QXBAkqXuUuXuM3QSh0BLdR2kJWbhDY2CAs3CDVcwdaueplMqe8qD80YUnNLIW
         wC0g==
X-Forwarded-Encrypted: i=1; AFNElJ+tVdQb0HoUl7tr4EV4flS9nNI7f1UoJIT2GfyO7Qfl5mk/P1UXKq6wZZnGFEa5hxbl9byZ/JBirSCR1RciI2U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4J2K6saMYVYAyrOZaVIYk6YtABEH5EirWfP+jurCWOYwQIs1J
	KIkubIMOIDM/jpd9zmoAkzdrN1vSJbt6lD6fLLYFW6waSRwQajB2zwCux446i9lYrLk=
X-Gm-Gg: Acq92OHv8GrQtwKeNaoqt3nLQ52rs14kS7VcX6tR/d+EFi4s2OlGKF7ULuwuo+4zC6h
	4tZphZIf+y/JML2IycEY6fQeQOt8hoeL4/G8lGgjkp4Hi2vRFL6j+YeG7KF7LRgM4WBRVQp1/+z
	XjBl5bQKwwQMOWeR0a7rFZWTfOnfdleEAMXXFuAuyp2BJyipgYfSkXx95ZOfM2NNz8amZlhrpHk
	pHhHK1GiNjf+oXypJRe73QbuIEiEMkEZSc+h1OQx44MsB8Atw5POoQ9CIaG+07dPsgg4yN4dQlp
	GtsZiu9ZE75kcpOj6wiubzCtVjRAa9J4O5YUmZR9BA0QubNPA5SXyddgyprurrI6Id+LbwWJk/a
	xWBF2BeYLwg1x/fHfHzX9xTxmhvi8BZUR2eTJ2y4mYWfa7bA/kZxoBkztjmakhhoGDujrebVn7f
	ogbCq8Of2KINlvjG2Pn2slUvIvOWtgcW4vxvBmpONb0YWlYruM27RWDQ3oRqJJK/U2SSnItZ0z0
	mbWUownu4gUzA==
X-Received: by 2002:a05:7300:cb13:b0:304:819f:5029 with SMTP id 5a478bee46e88-304fa4b7178mr3536043eec.2.1780267313031;
        Sun, 31 May 2026 15:41:53 -0700 (PDT)
Received: from phoenix.local (204-195-96-226.wavecable.com. [204.195.96.226])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2c120csm7497534eec.4.2026.05.31.15.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 15:41:52 -0700 (PDT)
Date: Sun, 31 May 2026 15:41:49 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: "Hemendra M. Naik" <hemendranaik@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us,
 jhs@mojatatu.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, vishy0777@gmail.com, tahiliani@nitk.edu.in
Subject: Re: [PATCH net-next 1/2] net/sched: sch_fq_pie: add per-flow
 statistics via class ops
Message-ID: <20260531154149.592bb35f@phoenix.local>
In-Reply-To: <20260531125314.22492-2-hemendranaik@gmail.com>
References: <20260531125314.22492-1-hemendranaik@gmail.com>
	<20260531125314.22492-2-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 31 May 2026 18:23:13 +0530
"Hemendra M. Naik" <hemendranaik@gmail.com> wrote:

> +struct tc_fq_pie_xstats {
> +	__u32	type;
> +	union {
> +		struct tc_fq_pie_qd_stats qdisc_stats;
> +		struct tc_fq_pie_cl_stats class_stats;
> +	};
> +};

Sorry, you can't change the kernel/userspace ABI like this.
How will old iproute2 hand new kernel and vice/versa.

The better safer way to do this is to either extend the
existing structure and have iproute2 know how how to handle
short (missing) class data; or use another netlink
type for class data.
