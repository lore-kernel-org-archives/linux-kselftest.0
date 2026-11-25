Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585744;
	b=fukImSSf8YDXfMBOdhBrMO7WYiXgAIOhTo5nKOA8V0Tg3ZnVDxX2WvVeKOp2ZGqvIC7v
	 1roW0ps4uw4xuOQxmTFRbr1oXsGUfR/cnWmXpIarhJvcih/rll8lr8GgCGwpW8xhJdXIa
	 qXD5cs686PNnBjQXq1xIdxlitGD/Dm0wHDlkHenVZB9Nh52nJBSb1uC2XEuGsWLuVa3yQ
	 eXHMcBBP2uQHMyoZU1PR12UJXyEFZN9QUKH69wfVX45BxBQ8R6VCAUxBWNPwIJRJeRnyT
	 hicAXlIb7lbTVvldZUc1UslEs+GioiVcg07V9fcjXfDsdCBSyll7jv6F5Utyj4O8sOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585744;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aSttlPnF0/b13rbdWQylAr4StfgbTDNSDTbAVJ4IUc4=;
	b=LOQpJFS6OSVF8kjT+hfxhWqK/JuOeZcapliLF/Ov3/1Z4T3+Dsrf4kmjRXiF21bc674u
	 ybk7n6MlPbxf71IbvqygLHe5uzWJBpZfY2l9nJT7LOAZaS/JRHBfzFIkpJdrDGv0j4nQq
	 lf+mm7fAQocvj9XbnWl4JKnPlQNsgCVIWuUYyaGcW3jqqVKaIXYbes97w5NDHrsMVLu6v
	 gywbrCLBX0+znUwLewDdSpDZXTXAyuCZPMzQ0wh73mpLbuIYlnNtCtOVO8kMsxn/fJqqB
	 W8ZaROHEBuLKxSn+4qXGxUfX92983pztk+y7XUTBRnON87X9h59/4P0Ja6zPXGnio9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	dkim=pass header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=BfnTV9Nh;
	dkim=pass header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b="Zh8hM/oh";
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA65606A31E;
	Wed, 25 Nov 2026 05:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACA65606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=BfnTV9Nh;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=Zh8hM/oh
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1795585741;
	bh=CK2Au0152pO0DOdg2R5mFxp1ZRHpuJjzkMLcC4hHrGA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BfnTV9NhddvI4/dGy5iYQ99pA7tMBhwD6+6uKueWZPZf71hltH+bLcs2tzyIxBwJA
	 hFuU2YSnYbDeNst70WpLh4VucRxN5Ev4m/qtfOdgozQAXU4GvtQCcT+ETU6URhFkdP
	 VYjUD5j68NeLL1PNW4NWJZ8NYE9pxDZm86v3Kx+7scQunelfHvHLVNaDz2taTZoPUz
	 J0fP9Y5cKHXnPJ6zC/+cDo+RhHsIrUvI0QfKGRgQ8GcinfCM+IlvOz0qdmjiEkzrkq
	 yNz66KxcsQ9ycFuhfs5uZA0mOpqal+RfYMDVQpzX+092m+ctOd/1TmFV6E8mrH6WLE
	 SOioG40Br2FNyHfcKabFAvqhCZKZNVGvyoJkZCjOeoUMcLIxQPPl9UHEFxGDEccB3+
	 hvwD1qkYQNNeg6iO9uGizZMslXAYHkaYst/lL3nr2aVEAWzxxGp4bzMUokklbDzygd
	 vr4MFIQAwakO62a/3X0W8LxZiWFTk6xdyYEySnVVfbrp+Q+IdTNGMEEDgCoXorjg2y
	 aMnA4oe1cSjrMDi5lhvpQjpAOoNcbmeonFlXRo8WbjzGnXSZgkIBFaAwSBgLNCSIjT
	 +9kyb3FK4ey8BMv9XimWoLLSbNNMUwM/EdO6EVLdaXnfSkgI2QoBe9IEiHK9hQftd1
	 Iu8hwemETjfjVu74kt/fLthw=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 2B95E1EAD7C; Wed, 25 Nov 2026 13:49:01 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1795585737;
	bh=CK2Au0152pO0DOdg2R5mFxp1ZRHpuJjzkMLcC4hHrGA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zh8hM/ohkp62lkeP9n4SrULES2E+csUMuOjXG9NPSwJIAZuX4DhXYsn5Lwu50UT1o
	 Bv0CLLGuCoARErh3hP3L1kaVxZR8dXibF7TG7gNS+LaEZxsrD+CJS4kdtHWQyRd2YD
	 X/MjfBlem9HXdTp7Q5eK7kALzkSssmmeYqDVefGeq2jmthaYFSTJwIi9C7aVtEvprA
	 wMHOMcRcCvK2Q53spyZtzspSDT7qwKdmLwTBQL7hlzOIc2tqPjl2hWRR7SzeoPkd7Q
	 UlUmM4ai9xRgneSj7Ghs3LUmGKoNa3JIThADCZPvb3iPzbZhwYiXhHhXg3iaWFi1V9
	 giG3JX8K12vPrkSsOrkh3zsqnP2a6acpdVZWpHZB9llhch1pauyDIwgz1xnOTmkuLl
	 clMHa1wkquNMFcO9EcGUxFUMH1ES4cWWQeC5dTalc1YLV6hUcl9QyQUP7LgzBsC35k
	 SI4spX5mqsP0qmWehq/4jveOoKKP8Lxa4hJ4Bl4veV1UdAkYtaQ4Cb5CwkFTQu26x3
	 8LPssaaVoVwxR5gbNi9MdaNndNowyfLGOMYkmbyF6Ih7ZrqlGNIpEyP8mS7RpxQdN0
	 QsHebbAdqRw5gGS5lbTTcE25hV6giABV047G1+VOBpc84Lnitm9qV7EQR4HJrAy4c4
	 vZp+zK+u4PJGXkAbC/asDb4I=
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id A0C401EAD73;
	Wed, 25 Nov 2026 13:48:57 +0800 (AWST)
Message-ID: <112dffb6-4d6a-41c2-9503-0fe54983e2ce@davidgow.net>
Date: Wed, 25 Nov 2026 13:48:54 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] Documentation: kunit: document --summary and
 --failed options
To: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>,
 brendan.higgins@linux.dev, corbet@lwn.net
Cc: danielmaraboo@gmail.com, raemoar63@gmail.com, skhan@linuxfoundation.org,
 rdunlap@infradead.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <179558107134.36587.13120861622026385297@gmail.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <179558107134.36587.13120861622026385297@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 25/11/2026 à 12:31, Eugenio Zuccarelli a écrit :
> Commit 062a9dd9bad7 ("kunit: tool: Only print the summary") and commit
> 3c67a2c09b3c ("kunit: tool: print failed tests only") added the --summary
> and --failed options to kunit.py, but the matching entries in the
> run_wrapper documentation were never added.
> 
> Add descriptions for both options next to the other output options, so
> the documentation lists the arguments the tool actually accepts.
> 
> An LLM-based coding assistant helped draft these entries; I checked them
> against kunit.py and kunit_parser.py.
> 
> Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
> Signed-off-by: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
> ---
> Resending: no changes since v2 (26 Oct), only Daniel's Reviewed-by added.
> 
> Changes in v2:
> - Moved the tool disclosure into the changelog text; the Assisted-by
>    trailer is no longer described in Documentation/process.
>

This looks okay to me, though it'd be nice to include a bit more of the 
rationale for using these. I've made a couple of suggestions below, 
which I think would be more useful.

If you'd rather keep it as-is, though, let me know -- this certainly is 
an improvement either way.

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David

>   Documentation/dev-tools/kunit/run_wrapper.rst | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
> index cecc110a..641ab50a 100644
> --- a/Documentation/dev-tools/kunit/run_wrapper.rst
> +++ b/Documentation/dev-tools/kunit/run_wrapper.rst
> @@ -327,6 +327,14 @@ command line arguments:
>   - ``--junit``: If set, stores the test results in JUnit XML format and prints to `stdout` or
>     saves to a file if a filename is specified.
>   
> +- ``--summary``: If set, prints only the summary line for parsed test
> +  results, rather than the result of every individual test. Does nothing
> +  if ``--raw_output`` is set.

Nit: should we describe the summary line further? Such as "prints only 
the summary of test results, including the number of tests run, and failed.

> +
> +- ``--failed``: If set, prints only the tests that failed or crashed, along
> +  with the summary line, once all tests have run. Does nothing if
> +  ``--raw_output`` is set.

I think we could note here that this explicitly does not print passed or 
skipped tests, making it easier to see failed tests where there is a 
problem.

> +
>   - ``--filter``: Specifies filters on test attributes, for example, ``speed!=slow``.
>     Multiple filters can be used by wrapping input in quotes and separating filters
>     by commas. Example: ``--filter "speed>slow, module=example"``.
> 
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222

