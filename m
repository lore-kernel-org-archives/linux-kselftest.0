Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427821;
	b=SnNgiNr3oH7yl4F+sSL4gu+Bta+fC5BOcTMv2ctLheQlRKq0utkOcmCfLg5ATN/d6++d
	 iEH510KIBBbPyD3FSfGryUPm+sDNs1juau+X1intOjntSnQ26d4BhojQvj3g0ricxFHlG
	 vP5Asy+RvkUQD1e0GzGdKeKPs4jT8xGQQ8j7ZjsXC2lTswZ4WVDv7hFs0Un4rOp0d78Jm
	 g+8F6hU6QJPGgefsrIkOExByo23V0nPZmKrKcF3L6bmkhq1a/z9eI8HqtEFjvRAl8VQF9
	 AB7qy5blnEMZ09tCrp9veCC9wnedptlNGXmHfDXbYNDOAOwUZHwsjhXwI4W8iqixMxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427821;
	h=DMARC-Filter:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=fPbkWeXbAqPoRmdZ3Gc9CWFR/Ls9YsfyQBt6WRvnVyA=;
	b=FuXzTMWv7Pd4MClj7Al5+OgYDzdIg1bO63i0GpN4rGq9gMiQ5L4uiG5MyvTy6Ot0v8e2
	 AiDFc5fBhTl5Z0MPxwUjIokbmHzxxK9u8Mip5EcX9GPB/OTBkuVULOo/JBNBPrNPrM4s8
	 D7iobESCmo+d8prIq4Lor0yvPZ7HXUxDyzKCPCxBGveu4yELqtNXhm8bRbZQ2oHzssC/K
	 TsLSGceWq7i7k85EeVTauPo1gNgEp9yhc/ae2hfHtDRX6KZ9kzF1Vu80RjiHdQTaOaxZD
	 3GDOf/UuPT65nJrHMeHLa9BeO65p5OFe56r6sZsi0A37XXqNJ5eoQ9xdJaptyzrXOkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45461606A31A;
	Mon, 23 Nov 2026 09:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45461606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 01811200DEF; Mon, 23 Nov 2026 17:56:59 +0800 (AWST)
X-Spam-Level: 
Received: from shelley.lan (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 2FFEA200DE5;
	Mon, 23 Nov 2026 17:56:57 +0800 (AWST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] Documentation: kunit: Fix bad debugfs path
From: David Gow <david@davidgow.net>
To: Thomas Huth <thuth@redhat.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rae Moar <raemoar63@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, workflows@vger.kernel.org
In-Reply-To: <20260910135919.435500-1-thuth@redhat.com>
References: <20260910135919.435500-1-thuth@redhat.com>
Date: Mon, 23 Nov 2026 17:56:44 +0800
Message-Id: <179542780466.788346.14827358705405054713.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=236; i=david@davidgow.net;
 h=from:subject:message-id; bh=414RaZPPpQS4CuslG/2WJ8GbVu0CscSm1OgrngOQMNs=;
 b=owEBiQJ2/ZANAwAIAcYipzoZDNtCAcsmYgBrBA3nHsQ2n63HI5nl/reqDbMn9eS3ylxiVWzlG
 btK2UUUAtmJAk8EAAEIADkWIQSmmTCaqhqZOsxDGC7GIqc6GQzbQgUCawQN5xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQxiKnOhkM20KBTw/+IONb/abXsbB9VphZ4CfDT+CC2FYYRME
 vK1O7CxCbHCCdcasx3DZ8sbBMazC9LM1huzQXZUqW1vvkB+1Z20Asc854qNnkV+VKUTgTGqwXcj
 pfzUhsrgZg9WgJnxtJMraMzdBHKM9dknz8sc68Th23Bfosfi4C2iNm3Cg9YcjyLmM200Jztreic
 dela787Ef9kaUoJHih25Y9eYDEzTAxkmXDTzT61ms5Mkvuc4yrpIL8IzBlQ6iC5PbsBkYAnNzav
 euRZ/b9ZHPspVeklex+NT+Z4BOtOzMe2HsQMV5CmnFAkwQU7iKv5GCaereRH5domOnKl5G3mozk
 Rh2jvnFN4oMPZ+R59a10XnY+zuezaR8+4L78mPG3CUI+Jj03SQZ1yr6KmTbFI5PUcE3hUTLNwzY
 VUWq2dJhP0+R7ojYHuiY4333PEOss3YckwUHxQ5K34Sl952GWDjaq5tH1PGVEgTDN/6knyRFo8Y
 QYWFizWQ8InDo2irEErou76qNgyhXKjjuVctKUQG5hpffUKM4g3M0FCUE7sBUO2bdYeY8HPe+U8
 6EWq9PnEWySBy0JYstlzCg3egBwswI6dN0mq8hOVVsx4t+SVM1w2/ogMz9m7L8SZkrsREr7M04v
 EzluaX//w8lCqohlIBAO/EKW5U5gCOs37CNiilgz8q9fD0fDxFl4=
X-Developer-Key: i=david@davidgow.net; a=openpgp;
 fpr=3B0A53B1D9DF6AAC59C230322A821C5AD66AB03F

On Thu, 10 Sep 2026 15:59:19 +0200, Thomas Huth <thuth@redhat.com> wrote:
> The path of debugfs is /sys/kernel/debug/ and not /sys/kernel/debugfs/.

Reviewed-by: David Gow <david@davidgow.net>

-- 
David Gow <david@davidgow.net>
