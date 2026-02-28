Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A723ED13D;
	Sat, 28 Feb 2026 10:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772273472; cv=none; b=cz2zu5uaKvtxZr5KHKxF+Q+mmfjlowWHGJCbsiZRbejaLk2e1bFr7OVVfMaWKU69MJmZA4JYtH2LA+nPxEMq7D5xECtSZfv2TA8M6BydR9S8FgqUOJ3t2fHQrGTKwbZbZocixh/+qg903NoMsmVG4S4MfAJx1pdZeicFPfHKEd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772273472; c=relaxed/simple;
	bh=IecPjBOcvnuSTdGdSzbAou0btV/HJAPJfrav+btyvvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ex0QU754X7hqBaBNeZ05Hiz8ymEqOtJcuOyKk0/JrBzA5LMYy6yzb1PTnYjMTECGeTagP6xlL3FgxpRcvJ73shw4CG+oNU9d2VGY+B7jz3wHnoGQsOBpRtBTRDUF/c2Hcgo3t47SBc2T/thhc4bxTr3idLXTWun/eV8N/OkuXLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=UOpIGs6X; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=Wy8e0c47; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="UOpIGs6X";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="Wy8e0c47"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772273469;
	bh=IecPjBOcvnuSTdGdSzbAou0btV/HJAPJfrav+btyvvU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UOpIGs6XXHDBdGY/ccVGuhgaDuFHr7QIgn8WwEzjh1QWkGRFzvfZ5tbU/Eg1JCX6O
	 T2Ea72WKo75FVvcT0MSNu5Bw1Qrs0L1ZFmdc9QPo16fr9kjFIInoBzxfJOSgme77zZ
	 cEFY0Dg5lUX2izqPMg6q81Z/+BvUiUczZP1FvyeZPTi4Jkk3B/3LbifLVDIwJ5umCu
	 JyjJl/UL5kNR64er/FD39jh7hvrItTGM8KvmUa4Y3bMqq5nVs4FF8n2+Sy9JrWxK+f
	 brssHYrE7QkwWZupdKCKw0XbLh2cqNhtDfcET1inQWdZimvXmapOLQDe1Ql8J30Aty
	 LUj1hS5tovVvR6FL35v13bKJRnASaoQhmAlpH5TPfgy6iGsqfGiAGuVYevig7Rtnd2
	 oST2PlwB5R6714/DxRYJ/muQIJTzH+nozqp6fycPBK6HQ0T5NPoOqj6gykLCV6AuhZ
	 y2pMBZBMfx+HSfwXGXmyA9L9PKtrFt6K57eobunL3kPhe/+YIadurdUed7o/wEU264
	 7o+3LTyY9QNVUS8KHXiT6H+SuJGkVCqLkpnBdFBoRLYPciEFlKTKxuRTndwaSE2WBO
	 xYokCR4P76oi/4pRlfL0FGWkuemJPrF61de+Uy2Gptme0MUCR/V03x5zksAkLmH+ON
	 cX8nJ+HwYFMLu0Z2wdB9d/4o=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 120D91E7A88; Sat, 28 Feb 2026 18:11:09 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772273467;
	bh=IecPjBOcvnuSTdGdSzbAou0btV/HJAPJfrav+btyvvU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wy8e0c47MDmUbP0bhGKM30mx2mo5M16tGoj3Hhbbq7ltxyat2ZVr2nZpSup18fpzG
	 Kc8y2w352fRArio3qnZbNaIV47ShIFQJdPWI2C24ZB13bkwK7jjxTwkUTGyQ4sVJph
	 Hh7/3xQD8JiStMovz0p8ZVmUfMErop0EoRaLyzU2XzenjGgOLJ9ozrqoyB0UEymEwM
	 iRwcYfQiBJqi+aB7p9MyCUVdIp34x+jD0LaBFgo44Zg5pJSBnuMlhma0QWi573+2B7
	 6U8qXKksw4Ianz9yzJXJONXDkmUInnrM1BHGHEg1C13euEefadRsWg7JtcqHw0g3CD
	 j+3r9SrHW7QLeOwH9Bml9UZx4/9T7SqTTCn+zr3sDyAwOxaMilA9XIbY+1tovZyFMC
	 zYU7DK3H/mE4vXxp8X9acO7rgAsoRf8XKxH2GSMBkTX+1R5qA2/MiwBEQkDLTDrp1/
	 uOfyldn7VBFTbzgWScasfs029Nq/h0/IaXj3s3+bX5heocKIL5bTSkaGHDT9O+awop
	 39g/X/HLwkhvE1LyNVQbQ4mctMbiBsor9Za6l2dPlkOiVJVWoPrrf2u9HdbCrjl24/
	 971OoOJ56PS8fUGxxwu+Kw3STkDRx9381a01xn1MnS0/sw653UyqURTqbP08d7FUJW
	 Nqyff0vGAQRg4TgVz1yDaOiQ=
Received: from [IPV6:2001:8003:8824:9e00:6d16:7ef9:c827:387c] (unknown [IPv6:2001:8003:8824:9e00:6d16:7ef9:c827:387c])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id BA5421E7A8F;
	Sat, 28 Feb 2026 18:11:07 +0800 (AWST)
Message-ID: <49a87105-4503-4cf9-a967-e64ffe7fbad4@davidgow.net>
Date: Sat, 28 Feb 2026 18:11:04 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kunit: tool: Recommend --raw_output=all if no KTAP found
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
 Rae Moar <raemoar63@gmail.com>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
References: <20260227105650.307845-1-david@davidgow.net>
 <aaGuVA4q5BXSxBWX@ashevche-desk.local>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <aaGuVA4q5BXSxBWX@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 27/02/2026 à 10:46 PM, Andy Shevchenko a écrit :
> On Fri, Feb 27, 2026 at 06:56:49PM +0800, David Gow wrote:
>> If no KTAP header is found in the kernel output (e.g., because the kernel
>> crashed before the KUnit executor was run), it's very useful to re-run the
>> test with --raw_output=all, as that will show any error output (such as a
>> stacktrace, log message, BUG, etc). This is not particularly intuitive,
>> however, as --raw_output=all is not well known.
>>
>> Add an extra log line to advertise --raw_output=all in this case, as it's
>> a terrible user experience to just get "Did any KUnit tests run?"
> 
> What's the difference to "full"?
> 
> Thanks for adding this, btw!
> 

Normally, the --raw_output option will just pass through the actual test 
results (or, rather, any kernel output from when the tests are running), 
by skipping everything prior to the "KTAP version 1" line.

--raw_output=full is a synonym for --raw_output=all, which just passes 
through all of the kernel output, so is useful if we never get as far as 
printing that KTAP version line.

(I kept forgetting whether it was "full" or "all", which is why both are 
supported.)

Cheers,
-- David
