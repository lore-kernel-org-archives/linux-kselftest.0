Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A607E3A7852;
	Thu, 10 Sep 2026 21:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789074414; cv=none; b=JthoSVX9XIaN4GTv7MW2gbTqf0bV/QJQiQqutTkuad+zHxLthDzmSF6PQh3dVVSM7LZTFLeCqzzBS+8E6vDMk2hLy0sEWKpLUhtr6wqx3WUCeLG7Afa32TfngNa1yqBntfXOo1fbZJf6wAtGB9M1K8YuDyWbVJmQPv1jYd7qE4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789074414; c=relaxed/simple;
	bh=OaWIyDyxLK6LPicInkgjx+LOCdhCNX3gTD1KB0eqjbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qMNjsYR+5eUwUVwy8X806PcYlbybIHoSI63rKvDDTaRZKHneeVJ0ZLsFfbXw6Ht9M/CaXq555tISjldSySM9N/Stx6vvqWYAMDRBkoDEy8oAtAtpBCCkqWKOYkqv4DNna8ZWu7y2RjkMKC1vGB4rP7BhfvJL+VNbixBIw5vD73g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jDwvsSLV; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jDwvsSLV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=OxQiVsDCn7GpQxwCIKW9oNF0wdY2DuNHoeYpqNgx42Q=; b=jDwvsSLVk+8yU1opbbOOik/yBI
	mfYfO6zwhKcu0tMAK0uR5ik7fLTgz14b0u83sMjgtPxkYFSBDXvGXQ4Mw5wiT0hjn/I8eqhDVEzh6
	azy0ETMwb/9anBZQxKjFuVjh5uM6/dLedT1W8h8heGlnqpHKp/5ogmzZ5EYVmeEzNkEDUvd+n5Kog
	TJ3pR488N7SDZTmk6F9S1cpurbK2rEjxtQK/5spc/9BuokhOC1LDa9xmFYujIXHBdsj7gU9wHykl6
	GEv6N8MvSAXOCm+hBU7XgqxAdWKuwJVOny/aw/ku3DrHrq4dfVm8b9YTdDaCLlSTEPVO+b8LiuD26
	AabpE3PQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4lyk-0000000FOWS-0gMP;
	Thu, 10 Sep 2026 21:06:42 +0000
Message-ID: <da556d54-9f53-4780-bab4-bf6fca89c82d@infradead.org>
Date: Thu, 10 Sep 2026 14:06:40 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: kunit: Fix bad debugfs path
To: Thomas Huth <thuth@redhat.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Rae Moar <raemoar63@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 workflows@vger.kernel.org
References: <20260910135919.435500-1-thuth@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260910135919.435500-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/10/26 6:59 AM, Thomas Huth wrote:
> The path of debugfs is /sys/kernel/debug/ and not /sys/kernel/debugfs/.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/dev-tools/kunit/run_manual.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/dev-tools/kunit/run_manual.rst b/Documentation/dev-tools/kunit/run_manual.rst
> index 98e8d5b288085..59c3313a6d15c 100644
> --- a/Documentation/dev-tools/kunit/run_manual.rst
> +++ b/Documentation/dev-tools/kunit/run_manual.rst
> @@ -87,7 +87,7 @@ the ``/sys/kernel/debug/kunit/<test_suite>/run`` file:
>  
>  .. code-block :: bash
>  
> -	echo "any string" > /sys/kernel/debugfs/kunit/<test_suite>/run
> +	echo "any string" > /sys/kernel/debug/kunit/<test_suite>/run
>  
>  As a result, the test suite runs and the results are printed to the kernel
>  log.

-- 
~Randy
