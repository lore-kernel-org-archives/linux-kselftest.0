Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40262C2346;
	Tue, 17 Feb 2026 07:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771313396; cv=none; b=HGx9oe+1C7u/mRve2u2haNBRCItO1kNYGW2OHPqHTg/XVX4Han2GH6QE0iU2hty/Xh/3YXFzZtEI/aWo8/o9IjBO/Gs2DOPJWoqpVj6IAYqlQD64/1JWSiUKZlhIRPaws45tOsLMAZ5eqQRDkE51wjqvj53MD4WzDlZZAxsajcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771313396; c=relaxed/simple;
	bh=HbB+SmqgmVUe4WGKjSzEZ3BHd4cEtoT8uqWY3j/lP6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eR2bXFThdEyxjSouu5oJjNSOOccwBFmDsG0zQKbpH7zo9weIvI5qYp35LtOdebctka9J0gRvdDC2Js80bQbx9eO7n7CPjX20mNRy1qG129D/ecKflTcfbFrTObt9BUxO6ltg4NSI2OOcNgS0lrZDdosVPTuARJEIoJ8PUa08nQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=IQEixDzz; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=Tz7wUOPZ; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="IQEixDzz";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="Tz7wUOPZ"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1771312913;
	bh=HbB+SmqgmVUe4WGKjSzEZ3BHd4cEtoT8uqWY3j/lP6k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IQEixDzzzgcqeWgyI1vHz0PPWue2u4X/tJSBexVfpE2un1nnpgTA3IaL/9XgGfIw1
	 HziX8iSN0VNKHUhJ0eTZNcuFUhX6z3pFlYxm7xNVLriXj/OIsRcTHDVOp2PUySHNIu
	 tILWdTOCSetkhbY/002rUbn7avJ0xo2DUvS2FYryp52y2ZYIb+U5LA2di2pgdL4rAy
	 ehcbtJO2MLv7tjzY+4oglS5TFEGHRRn/44m0wSnOKQMIq7O+HsDGQ/TwHRND8p437O
	 Hwgsg7ULPHmGaRKXtWTzxpmRNldUE5O4ThkUUT6qusq9WRaQkwLInk9wE1BVcFPjrP
	 8ctStz/2HvyV+LZRBHB/t+f9wJKWCfXuf3B3nJK7VG72iblYDE/SPfc1QPca5SzsYJ
	 gtTs2mt2XWbusVDwt5abIkCQtW9TMGo9cW3G2DBq9DTmDS19cTmyBR3Tb4IyyJD9S/
	 vlYyPvzXtU4OoArG1T8hbSW2ZRuh1hAXWq+l9XNlOXh10nvUuiQkdMbwk9yERSkzsX
	 Tax9Eq1uzl3qMBbe+Zc6DZlS3Rv1O0+H5CQE86oWBq85YywUrD2aL7kp+H4Fm090bw
	 7BoUiinUITEjsEYZM3cWpZhUa2Bp/0cK0ZsjwxyfD+B80Aa/pqOcc68rd/Q7qsxjFw
	 hWVWz1iS7n6C6AjnumaLXirE=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 6E8DC1E76B3; Tue, 17 Feb 2026 15:21:53 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1771312912;
	bh=HbB+SmqgmVUe4WGKjSzEZ3BHd4cEtoT8uqWY3j/lP6k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tz7wUOPZgVERI3Hit40goOByFa89hF7DPczTxsViyHwOEO1ceJUqw1dtVKkbGZmZ0
	 /ms0/ed4XedyK9D2ps2eE77wY7Cg5LCEbuMByiPZD61/k4qicBRApbw2s0s5EKnzqf
	 Gbv+lkxHeFOKZOJMkyIf9V1PNOqNIv+6oplSW0X+8qXHbLfai8ln/Eg0lnXHSWh78j
	 0CU7XLiW1yaHAJl1Q7hctZdbyH7pNDRJ36Xs+fn0XjuMjMAcQkc4uj2WwuQcVfJ30v
	 s+EDEs2quwtY8vOJq7lsDu5qk6KvuLGdPWMON6WmHNtHZ65fAGb2bC/PvF6N7AOLH7
	 e2cVosxpyUx5s6eGmmqkmdq7Pkhm2aJEJK9KNo1VI5cpjLzJ5V9YRCl974e6p/pFRj
	 fDVzvFPxSD8SfYWqy3T4nh/zzshyllzQiAFfZNdOOcEz+dvXLWpm6jsyT93lTDNb8a
	 WKj8m2LDGsgG29hUJUI3NXNiBsvcFZnu49sbTYPVrzj8iUKb745IHTl0bztpdd3fjl
	 vbNErMjQJm3lAF6h8weFy+I/3yO+qNeDPScdYQeWKGuLKPEnEXQxK6UcZfnavPJEFn
	 +h2TCQevIgySeiqQ2fouf8UgDvYBt6Q5ZLw5SrhSQ9QahcqEkZMOiTdFL2gmBc2T7v
	 3ACA0HOjydt63VyonG8J3eBE=
Received: from [IPV6:2001:8003:8824:9e00::bec] (unknown [IPv6:2001:8003:8824:9e00::bec])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 5F59F1E76AF;
	Tue, 17 Feb 2026 15:21:52 +0800 (AWST)
Message-ID: <1cd01bda-f82e-4e81-91fa-8ccbe4b007db@davidgow.net>
Date: Tue, 17 Feb 2026 15:21:48 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kunit: Add --list_suites to show suites
To: Ryota Sakamoto <sakamo.ryota@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
References: <20260213-kunit-list_suites-v1-1-6e6394faf4c7@gmail.com>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <20260213-kunit-list_suites-v1-1-6e6394faf4c7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 13/02/2026 à 12:37 AM, Ryota Sakamoto a écrit :
> Currently, kunit.py allows listing all individual tests via --list_tests.
> However, users often need to see only the available test suites.
> 
> Add --list_suites to show suites. This option parses the test list output
> from the kernel and prints only the suite names.
> 
> Example of the output of --list_suites:
>    example_init
>    miscdev_init
>    printk-ringbuffer
> 
> Signed-off-by: Ryota Sakamoto <sakamo.ryota@gmail.com>
> ---

Nice: this is very useful.

Reviewed-by: David Gow <david@davidgow.net>

Thanks,
-- David
