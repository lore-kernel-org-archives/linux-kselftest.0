Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2E22882AB;
	Sun, 13 Sep 2026 08:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289621; cv=none; b=pWkGTcq7sgOjE5n1oEgkRcGt6eUw93v7jxrIieez50La29kf+NKaZCXhjYnKEeFiOPy6aNRSgjdQfStnYR21joGqptnaw07F76zjUndINllYq1CQuJQS757gJ1szaykoRNbJT9bI7h9fJ72h+8RFwyrP3qQOJzr0oLJnyKWQqbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289621; c=relaxed/simple;
	bh=FI3oVQVgHjGpfIdpLEcDJGluMcJWPhb9Bl4J2XY1VKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fzE0G6mWPJzSM5QPIDNStn3Cdvhz5DoIj0KZ8uwRP6qKeFVIUBnNsQz78+67+b8prURRO4dksb31PBltmUSu+0OqeCkUHn89PWdgntXzt7Q/V3qK194s/OjMqo8dn+vRAT/6EDp9iDdHXeTEHRw8nM5B7DWi6pM0UEjQNTA+cDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 566F31EAB34; Sun, 13 Sep 2026 16:53:37 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 4EA6A1EA8D4;
	Sun, 13 Sep 2026 16:53:35 +0800 (AWST)
Message-ID: <8aab06f1-89ed-46f7-87a7-846c820d6d4f@davidgow.net>
Date: Sun, 13 Sep 2026 16:53:32 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kunit: configs: Enable DRM tests
To: Mark Brown <broonie@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
References: <20260911-kunit-drm-v1-1-c5c0f18fc7b0@kernel.org>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20260911-kunit-drm-v1-1-c5c0f18fc7b0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 12/09/2026 à 04:25, 'Mark Brown' via KUnit Development a écrit :
> There are a number of KUnit tests in the DRM subsystem but these are not
> run as standard since they are gated behind the main DRM config option
> and all_tests.config does not ensure that is enabled.  Add it.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

I think this is overall a worthwhile change, but the 
drm_sched_scheduler_overhead_tests do fail on UML at the moment.

I've sent a potential fix out (the test seems to fail if CONFIG_HZ is 
100) here:
https://lore.kernel.org/all/20260913084155.520015-2-david@davidgow.net/

Ideally, that'd land first so we don't end up with yet more breakage, 
but otherwise we can perhaps disable those tests on UML for now.

Regardless, this is:

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David

>   tools/testing/kunit/configs/all_tests.config | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/kunit/configs/all_tests.config b/tools/testing/kunit/configs/all_tests.config
> index bccc2c77196d5..bee893f9fbbc6 100644
> --- a/tools/testing/kunit/configs/all_tests.config
> +++ b/tools/testing/kunit/configs/all_tests.config
> @@ -59,3 +59,5 @@ CONFIG_SND=y
>   CONFIG_SND_SOC=y
>   CONFIG_SND_SOC_TOPOLOGY_BUILD=y
>   CONFIG_SND_SOC_CS35L56_I2C=y
> +
> +CONFIG_DRM=y
> 
> ---
> base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
> change-id: 20260911-kunit-drm-9cce0032e098
> 
> Best regards,
> --
> Mark Brown <broonie@kernel.org>
> 

