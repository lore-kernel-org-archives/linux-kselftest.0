Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C482248B3;
	Sun,  8 Mar 2026 09:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772962691; cv=none; b=aBaZyt5FKTNAz3e5UK5i5FPeIgQRQ3JPP7iUfzhGJK87Vx8BhUy3ATRylzffRnHJPyTDCkHsimG84xNNkg/LzNn+YfDhT9IlHmp/2sqotLK+uzu7LUHYrg4L1lt3aK0p+1WWSoAWwGO8BPVPBNAZuVVmaOYwjsutXld3xcxl7Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772962691; c=relaxed/simple;
	bh=CzZtWlO1JrYIaIMc9bSnpiNdUo2iM/rFUSrLOWaJw0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iyjF9gpvtpEgISIm0TFwqz6Xzh2S/ltp6KcZlnnsvG+xv5RfRWwKYY+z+kDcNAp52+2kIwd/afamgijDWBf4m+FSDcPF6xRkQIr6OkONPHdKnVJd9N5XkKlzK1DvJj8arfDxRbgB5+BBAJHhqW5AFSowRM0bHBTiKoJWQAfggeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=co0CCNNU; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=aPLg8MiX; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="co0CCNNU";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="aPLg8MiX"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772962684;
	bh=CzZtWlO1JrYIaIMc9bSnpiNdUo2iM/rFUSrLOWaJw0s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=co0CCNNUl0EOlHJ8BePovdvBcChhWha878F/XcgPkO0htI5TgDddHJUZlBu0qQLTH
	 cglXXIpgt57bmVQzyMphoBfAGpQ/07M0oFjdsTvDqoQcaCKKK2rOOSiZgzgbEOh+qO
	 hCb3uPohFF0F2S1KrA4A3EQkswf6ablJlWY3+NW/BUi2sei+2ojABYWBh/sNWi7VPY
	 7257Qtbdpf7yLYYgvNPUiFdv3t4vaF86zvFzSfZFyvrdJr/PEVc9DD3N/UWKSgZyjE
	 NDnTlIjG1M1Tu1tiAhzreQNmbe7MuLxVejP9dPV4cABdXslwkZtGOU5sR41zCRmd/d
	 RMygOIRZyd4kd85bnea1G8wUfJq6R/OySnxT5PaWVTTwJMhsODlSNUf6h1EWrd+i9a
	 HqcEpzB45Z7mVdR1waQWIfGeb3o/s5wB4v/xgnY2qHxyrz7GCJU70ieTCOKiFJwlCF
	 R1PUNeKC19CMnPWsuKWONsGXCy6gkCTlOXiPeUuDCmiIsOh/i/csig9mhNgWaOqYWH
	 5wcqdgT3wyrCfY+8/UPi777GI4/p7epS1pXIPCz09lfX18hZ1Wg47/VE+jgo5sdNhG
	 Pq9nxbLG+Jx+AFI+JApBqVW6buaDfQhAvvN9Q1xOaJpQR0QilN4QlVlw7hDPEqfHDf
	 j1UBLehUdjaSB42EmP9UtpKc=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 7E6C71E7D06; Sun,  8 Mar 2026 17:38:04 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772962683;
	bh=CzZtWlO1JrYIaIMc9bSnpiNdUo2iM/rFUSrLOWaJw0s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aPLg8MiXLEKjrRrm7yiIGyQAf8Tn0jDktYhxAgyqpnNwLJzLw1tKYViY+aRYZQ9M0
	 Wqj57dTPsPKe0tc4nFXw34v1fwg53UwbvHnv/sZl25S5gql9nkObwZjDVuGiGMxlyQ
	 /k/eVtI3IcG9YUw9dEWvmovTriodR78933SOFE5/ve9m+aAk+IIwm3Cd/2q7UjWqGn
	 UnTDsijg/5lFcqMYY6sbHDGE8JIHU/pVRdDYSyCEBx1QnguW2Yno/MwWexzUtQwstU
	 Q2PL9kEnZOkwoctD9lyG+plEOVQkOm13dmEiNDVbg6r/FxRAjqvSxbPsk8M6IsyB6j
	 Su2KqLDywsZO0JCAzxVHmcP06eavobezMqE1TvXMAoaplS7gtIaoR3v8dltZcRNC6h
	 Yb7Nrj+PGSn8x7BjWqU31jTAEToRojzR9u5I+c6hes5hNH/FhO4sYXLltfzQBUiWQc
	 8Pw3IyPOJ2gaKOgRgNYt122eFU5/rCITionp3Qq/YlazOUqYFcKzzKk7NGXgX5bajU
	 cQwulWM5jb8Som3XbWiJt97BeF+cqEmrrZkv5BIumeMIUp6pip4kG/vS963bPRQMa8
	 zt44klpmrm9/gUDRTnQ3RGlbD+1kABnjYSNW3VZ6QdqExhFT9OFhxFNaybPZN14jOk
	 5VjfA9j12beSgHvvx1NbhH14=
Received: from [IPV6:2001:8003:8824:9e00:6d16:7ef9:c827:387c] (unknown [IPv6:2001:8003:8824:9e00:6d16:7ef9:c827:387c])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 3AB9D1E7CFE;
	Sun,  8 Mar 2026 17:38:03 +0800 (AWST)
Message-ID: <7c71d5d6-b702-44a2-bd7a-fa611ad6b9e2@davidgow.net>
Date: Sun, 8 Mar 2026 17:38:01 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kunit: Add documentation of --list_suites
To: Ryota Sakamoto <sakamo.ryota@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260308-kunit-list_suites-doc-v1-1-4ccd7641a484@gmail.com>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <20260308-kunit-list_suites-doc-v1-1-4ccd7641a484@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 08/03/2026 à 5:06 PM, Ryota Sakamoto a écrit :
> Commit 60f3ada4174f ("kunit: Add --list_suites to show suites") introduced
> the --list_suites option to kunit.py, but the update to the corresponding
> run_wrapper documentation was omitted.
> 
> Add the missing description for --list_suites to keep the documentation in
> sync with the tool's supported arguments.
> 
> Fixes: 60f3ada4174f ("kunit: Add --list_suites to show suites")
> Signed-off-by: Ryota Sakamoto <sakamo.ryota@gmail.com>
> ---

Thanks very much!

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David
