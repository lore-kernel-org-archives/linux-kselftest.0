Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C53EEC0;
	Sat,  5 Sep 2026 02:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788576512; cv=none; b=AUC7AZgAMc3SASNn0LhVzpVpzNxsWcLYTml1DZeD0ROa21W8uH/xmtU7796Urw+Pr2jMk2YSP3XwuhESOSjbTsz5QD6MmR4YZoZphblLo+kl1Le5CS7p07tM+7/VW1HdbwNiGmpHBCZI7CrjmQmGyr8ottdeXtud7fDjxldhOPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788576512; c=relaxed/simple;
	bh=e/YXyx8KyxLCzBjLU8vgVttmKHSWe/7oJ4mzQmbb3iQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a5f0pOJfXsGmCmk926fCSjCS5o1txsgweKlrhhgcqgWQSWyHblaI0YTaZ5HPwYSC8njGkA51ubRyhxDiY6T0yPMFFE5q7+M8JL3Pi8l5qC+LmRgpIeC/aVYkUPO+prZl0g0ORNAkUc0fylBQMX8bZNz4D/X9u4LqpnhMQyINaVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=w/LW6chj; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="w/LW6chj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=vMpZI+pJagT1cx1negrKlYxH4dLDONTkOeJo5RZ4BQk=; b=w/LW6chjJ9lcLpJ+XnebboKDbd
	oXYguIFBQ1dMRbNDkfhJzl15pUH9IDWEFtG3atqKoB1D4p40tWYOCRgUZ7OCwwiFqaAPfx1XjkXvr
	88EYQxX1CaiOxiSKlL3ihgQAJTG4tDx28V+wYsCAX5cjXdUfkRnG7BGUsPy1RFvFA1qRy1JiGa1Mx
	3VJpdbP9VN1QzuVfmsOQ0bBIhalZ9m6Lt/9IOssdnK4E6ljKfhF1LPV1xn+lUPoIe/s86wKxjMfSe
	Y6/z/mX8LiGr457/nv0CRRdYe3bkvFLGzfDvpZ/7x0ODW4GOdfxoYVkP0N6vRTTOpjXqyFRPV0eU2
	zv9dNGww==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2gSD-00000003c8i-0gwl;
	Sat, 05 Sep 2026 02:48:29 +0000
Message-ID: <35795a92-fb24-4458-b558-9881bad8266b@infradead.org>
Date: Fri, 4 Sep 2026 19:48:24 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: KUnit: Fix qemu_configs path
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>
Cc: David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Sadiya Kazi <sadiyakazi@google.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905024455.83413-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260905024455.83413-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/4/26 7:44 PM, Karl Mehltretter wrote:
> The example path is written "qemu configs"; the directory is
> tools/testing/kunit/qemu_configs. While at it, make the verb on the
> same line agree with its plural subject.
> 
> Fixes: f13ecba04bab ("Documentation: Kunit: Update architecture.rst for minor fixes")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/dev-tools/kunit/architecture.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/dev-tools/kunit/architecture.rst b/Documentation/dev-tools/kunit/architecture.rst
> index f335f883f8f6..dc291c6187a7 100644
> --- a/Documentation/dev-tools/kunit/architecture.rst
> +++ b/Documentation/dev-tools/kunit/architecture.rst
> @@ -167,7 +167,7 @@ Documentation/dev-tools/kunit/run_manual.rst) or use ``kunit_tool``
>  - ``configure`` command generates the kernel ``.config`` from a
>    ``.kunitconfig`` file (and any architecture-specific options).
>    The Python scripts available in ``qemu_configs`` folder
> -  (for example, ``tools/testing/kunit/qemu configs/powerpc.py``) contains
> +  (for example, ``tools/testing/kunit/qemu_configs/powerpc.py``) contain
>    additional configuration options for specific architectures.
>    It parses both the existing ``.config`` and the ``.kunitconfig`` files
>    to ensure that ``.config`` is a superset of ``.kunitconfig``.

-- 
~Randy
