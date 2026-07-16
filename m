Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC3625A359;
	Thu, 16 Jul 2026 06:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784184037; cv=none; b=NAkx4JpB6vvwTxQeXw90/AQp9w4B3EsZxHcHP4nhQ8KR9BR2I8hJ6De7Pn8pRuAXCRuHtt2YA9zhBHagyVhknRCiHbx7FVeb96tuyeLrD7z0aO4HA+KOWkH9TlhRi9eSGSEf8yWcmOq6W4OydaDIgssAjiBpAIDEqPuUne4Jn/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784184037; c=relaxed/simple;
	bh=PV5UXU9qlx+fz5kekF4gYYcLZdLJDC7oDzU1sNqhGTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZxVjhoqix6dZvFcmefijND9RSXMNUIJ8iOTH6Qp3O1txHvNoV3Kdq6zUGjPUkNriT/zZ/xkbRlbKhDA0TtJA/HBon/eWJpSmDyNvUzo+cs2QfGGDuNCjOt+jXVIefVHVdTtkBpAF+/OEDwF/EKvu1531iiWCMbjHkj1z9XWFbW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 259FD1EA432; Thu, 16 Jul 2026 14:31:04 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::9c4] (unknown [IPv6:2001:8003:8802:7000::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 71CD51EA429;
	Thu, 16 Jul 2026 14:31:02 +0800 (AWST)
Message-ID: <a4ce393d-3d81-40ca-b0c5-28b6ea36cfe8@davidgow.net>
Date: Thu, 16 Jul 2026 14:30:59 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kunit: configs: Enable gpiolib for all_tests.config
To: Mark Brown <broonie@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
References: <20260715-kunit-gpiolib-v1-1-d2824313e1db@kernel.org>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <20260715-kunit-gpiolib-v1-1-d2824313e1db@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 16/07/2026 à 4:15 AM, Mark Brown a écrit :
> Some of the Cirrus driver tests require gpiolib, enable it in the all
> tests configuration.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Thanks, Mark.

We've already accepted Bart's equivalent patch here:
https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=kunit&id=34b5c0132952c3d176bf5a169c8f7093ecb8c4e8

Cheers,
-- David

>  tools/testing/kunit/configs/all_tests.config | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/kunit/configs/all_tests.config b/tools/testing/kunit/configs/all_tests.config
> index bccc2c77196d..350171ed655d 100644
> --- a/tools/testing/kunit/configs/all_tests.config
> +++ b/tools/testing/kunit/configs/all_tests.config
> @@ -59,3 +59,5 @@ CONFIG_SND=y
>  CONFIG_SND_SOC=y
>  CONFIG_SND_SOC_TOPOLOGY_BUILD=y
>  CONFIG_SND_SOC_CS35L56_I2C=y
> +
> +CONFIG_GPIOLIB=y
> 
> ---
> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
> change-id: 20260715-kunit-gpiolib-b0921af52589
> 
> Best regards,
> --  
> Mark Brown <broonie@kernel.org>
> 

