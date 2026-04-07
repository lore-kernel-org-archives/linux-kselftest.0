Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EBF3B19D1
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 11:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775563014; cv=none; b=T64K5DggzCh9q6bN2gWNxgvfq0s4wMhlbTUbc3kZ/wtoYdt2DBPo/3koO8/2Pr67dj9WcHSBCwXfqmReD5KC54wb/zbUa+V1ZVKvqaf7H093axwgtEVA59mIKFdk0C5TTmoSaEOhRuagOGHabUBMw/hEeZK0YkxJYuuJ/yZYVOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775563014; c=relaxed/simple;
	bh=iqBKwfsQkpmtRHhzWuSvuaMtQEA1MgoMG6ussjGlWQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdIFJHSyYxwd64ZU+r0CapNP/XVm+Wn5QaHSKKBKjxl3GTYRjYS0IIa+t0feTtLLn1GqdktpCxjPu3v7q9TzDN4Ha3Um15Lc/gGBVrR1A9L3P7RBc8LeTcdbmFv8P/BtgzwmiW1X7MuPefRE7LD0R9FDg9pgqt1/6TKqgzqjLoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=YXyuaM2O; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="YXyuaM2O"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so4348765f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 04:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1775563011; x=1776167811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iqBKwfsQkpmtRHhzWuSvuaMtQEA1MgoMG6ussjGlWQE=;
        b=YXyuaM2ObTwNlKlEapXW69IAYiy8qRv2K/sBR9ckHw7HGlVaJyr+enmNU6fq1mzAwE
         DrRJNhq76LVJq6i5nUz2kiSrO7pewapICyjBZIn8uD4gdLLNts9thXMzhJSJxIO3Xhhp
         9QkqsSqCjvCFYgS6xkASyD3FqIfzWx+AuZo3l2srzaukdXQZmEViApgqyuHqptyDK3gW
         6zvqgxxlox5nTrIqY7mIO0Y6uI2j7UXo1jrzmcZdVwDzGXnj77D46EEQY7V9rB+O5Vas
         pUSfKIv2tv5RQT6ZlzP4E9flQKk4vgLroDWyBALvjA8lUG2ymaBf/k+EdGXvUjVi8iWC
         6W1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775563011; x=1776167811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqBKwfsQkpmtRHhzWuSvuaMtQEA1MgoMG6ussjGlWQE=;
        b=DhYm3cYGCIbBqwTI1nOAYua3ZT9GzinlltjlzamlXQcJvFuZ42gY9Wvct62Meiyycg
         aSciFEs6KyDvWBMBjA+yb/1oWCRYiq4hOpMPiQcrNTk6W3gtm+DXF+QA21jMUWS8+1Eq
         zdT9WPtRhs/wkaTIAX9lM02cwrC+oeypD5soA334vgUQctnOMIeB65Cr6D97TfeEGuOu
         soQI25NN1j9uorPXTDUE/XcRbckixIfTDqXJRa+hJ9LzVJPrMfUw4z4xV2u09lRNgLMu
         wWX5K2iSKZgSA1qb2kOFZzBsS+Y4aSGaoHBSYRqcxQickBfQ3Bk1UvzUyznqCI30b6gt
         9nTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZQxZVyOaw4Xr7Q8T6l+Qxnc7qstFVrhOc5JFtEC3igtukyLypUEvgKaTJHqoNVYgV5BOtuubfLU8onwWETfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRUZMADCb6PwDysaAZnnsSuwLVsAqORIu7uLu2UHCHd8eYwNp5
	DrLsxEEAiCPk/j6H+1TdtBFe0lYT5YhcRrpcXYMDptfULXiwzLPTNW6SuSzbwTB1fzI=
X-Gm-Gg: AeBDievj/ks+5eaGUccskNsPEnjrXsdnNpsehRlvVZkRhsuzhxX2Dt3OnMe/DwlsmTN
	JTFOhQZ7JYveT89KQuzxT1LNnlYWA/Gd2jYTikbxE4sUEANkyjqUlBqILyYHLKg4oskk5ZmVv6w
	rBjs0QbI/wK7Zq9t0J2FFqzIBKPHapdvPziXGdAPl4jbB0X6pXqXwMUkXIKzmCFNHIPCSYzdb9T
	V6pDkEb7Q9h4gA+V6wGafbjK7O+pRasAJ5a5oew+6okUKeFojeo4LzmtzVyNiwTdyn9wZIbam+F
	BHI/0rJdLlhSeVL2Jbz6RbV1h96AJESY2acnNRqjOHf+r8Em7EV49J07GkGjpVcTvql+orhAuYm
	xGgyk0I5IpNuQfupJmyoGSpDkz+wR6L8rsws5VWw+TU7fm6ffxCIJj5FiCmz92Vx2GCvc5nhi3w
	FNl0tU8id3cfPaCCg5KWz37FmSDj/HJ9M=
X-Received: by 2002:a05:6000:24c9:b0:43d:1bf6:30f3 with SMTP id ffacd0b85a97d-43d2927f808mr24406945f8f.14.1775563011189;
        Tue, 07 Apr 2026 04:56:51 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5253sm44188663f8f.9.2026.04.07.04.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 04:56:50 -0700 (PDT)
Date: Tue, 7 Apr 2026 13:56:49 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Marc Harvey <marcharvey@google.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 07/10] net: team: Track rx enablement
 separately from tx enablement
Message-ID: <x2plbbbe2raatqq2mthltnc4spbmrhcoge4mwpvj7kyslarr22@rpm36la4h4ds>
References: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
 <20260406-teaming-driver-internal-v5-7-e8a3f348a1c5@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406-teaming-driver-internal-v5-7-e8a3f348a1c5@google.com>

Mon, Apr 06, 2026 at 05:03:43AM +0200, marcharvey@google.com wrote:
>Separate the rx and tx enablement/disablement into different
>functions so that it is easier to interact with them independently
>later.
>
>Although this patch changes receive and transmit paths, the actual
>behavior of the teaming driver should remain unchanged, since there
>is no option introduced yet to change rx or tx enablement
>independently. Those options will be added in follow-up patches.
>
>Signed-off-by: Marc Harvey <marcharvey@google.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
