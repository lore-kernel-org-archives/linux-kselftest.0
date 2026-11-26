Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697554;
	b=1FHtH9cAVslf0WzE8f6fT3THZzIiDb1Wq5vHYAf1ONdW+7xb2zXtcqJ+R2mNyV+IdhIZ
	 +TTFkQQS27JOaNq9OEEPwnYKpKtdKiAqwxMgEyv+tu3NZglhEneP3YTXzVJm+QdVpxfnK
	 3MXushSAb4bqwcraefbZ3lzwwRiv965NqPa03+BwEwuujzbU3dOfWCICkmf+z01BRH5ek
	 h0WzGoApL2LIY40UjNy9d4YiOiEb6LJf2JnQrp99FbHFaQDJNuWL/5uybfQlCoOwY1BFO
	 h0BGRcmrv1NlypeUXEYRgxvMP3I1eaDVsz6/mvboCPoL1NEXlr6EkZJp46G1CH0lkrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697554;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=YvNLhTKqDDpXUAR6Q89oTk1FRF4ua+oIU405Ro86IUA=;
	b=4fZA997btCiqVHalm5A7VlX3FnLxOuf99c9/UfoqFbEJcMaH1hcSCUszCue7b/ZAqJJB
	 i+vn6YjuwuDA/rdzTrhuRZiTQ2olj2Tx5W4g7KighKlC/u9bJxWk51b5xb2b4EebrRFbC
	 4+0JECRnZO6/hK7gj4mCm2R1BlhvkD8d2nSOdWTqrFCmosqVDmLu1Ry3xPgiUCyb9ft/0
	 gLiLngKgk1BzgRJGEe53dK0mul87pfhSjvxSF6OhuqpgAWzWsOGMQkZ86oPZiHHjV1E+6
	 TUtD4RB/BxPqumxDMD/CRQaSJ5eRNn2ahV2w+4AgoWcZ/bt4os2e9jizkrnDMAym9WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	dkim=pass header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=Dhp3pEwS;
	dkim=pass header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b="A/jA6NM1";
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338A4606A327;
	Thu, 26 Nov 2026 12:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 338A4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=Dhp3pEwS;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=A/jA6NM1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1795697545;
	bh=9jGZoSF0cWjL4INvWpLcqT+H+ZPZuz4SfzmxRed+XvY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Dhp3pEwSTcDSlPhU/4gAIxRTb64D4+BCxtaDS9mwCkVRdkx8tFPHW+cdIENeA8mdC
	 TLwrtMuHgN9G9pQCu/K30ITl90NKx4F8GLL/wdmwS6qYTTyPySuTNgDTjilnurIqbO
	 PhxB4/tEHSkGtpjpibqfjWn3/UIgspHdvljg8XImrvIxiBdPsimeYnYjXYKK67BtMb
	 61dF+d1oqpuI2RSxlVL/xSRtZZ3giHHp16DwX4ZHmDUh/M2yhsZh5InTMDD1kOLV/v
	 o16um36lnd8sWd1IvZm1MiWYJri+iBxMHlicYbPOQJFBZr6TjjB0eEgNNBoIefGv98
	 +96vVprNHrEedrMXacX4JBh4ktyXbOl1VnIKzeLiDQozRBTEgB49rAgkzmzG38Dqi8
	 r2YmZCbN7fMc1CLSleoyS+q63krI/3n3I2MraU/ZjDQoy7L1wbo/BXXVIdGPesfYJD
	 PnLbVkashhyVzagYQjFe2DRQ6D+EcyqutR3OM41blYoOoFUj+mM70qUI25kTCSNyby
	 yFmYNu4NDtVjnxmgpS2D8iGNx+78QUxXNroH8IUCMb54/I25OsHx0O2rHePu4qG4J9
	 B5LJ5Gc2G5ILUPQ6iO1ITVxLXqSEqmK1feOCE5LW2I73eWtnjKsbau3EuKQKn097MM
	 b/sHhvSwucwxx1HWVlNdBRSs=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id B6B161EADB5; Thu, 26 Nov 2026 20:52:25 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1795697544;
	bh=9jGZoSF0cWjL4INvWpLcqT+H+ZPZuz4SfzmxRed+XvY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=A/jA6NM1Llnkw+zrcQAWLMU8Kd0nTsO1TCqTH2+O84RI9hpC33T5WRcs8sHlv0BaC
	 a3UGZWGo8fG2Mp/BhKLk3GL2O0gb7XtsB6iU4WWhJfxmcqSF2gnmSscuNYWGh1fh8k
	 QeSh7Qx3/x86obD74fSUNGkt6Iib0DBRJtx9/qgKfIn07eZguPT0hIEI2cXIBlKkZK
	 BlfegMKEfGDJsTsNMq0WI4lN/ciqD6pS50/bMKo1l3FqOhOz7sknp7h9EYOe1W/PkC
	 O3VjgmTjYUoUHErWLQBgMnG8jQBDplxtzNiChYyo2Js55DyZRZ7ArNyGYRVed/mGvV
	 OT1gnJ7QBT80L6J8rjUYA347Tuve6YBTwoo3zzDRJZY5y68+BLIECrjNMhOwRYaH+M
	 OB5/a9fsMEs1dVcOdqv6Boh50scvTtCEd5Tl6citM1f6vc+eky393drF/Lvges9JXW
	 Jzixt258fngbxKtSzF8kmxM/6Z8KFWJhqB1AQq98yYYBUaTVaJg3QgovwQ8cSKnoQK
	 VplHr/LxPfjMYdlrc8AhxLHyRDSxenllk9osYBwN0uqXKXoBcQ+4ypqtyrAH+N/b2G
	 JetUVZNifmZ7cLwRPsrTO5+T/zEhvKBYzfEoY5v/IBEWeQrAYLB16tD4siyWcrD6Sm
	 qNqmP69aQ8xTaWUgcXK2ObGA=
Received: from shelley.lan (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id ECA7B1EADAF;
	Thu, 26 Nov 2026 20:52:23 +0800 (AWST)
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
Subject: Re: [PATCH] kunit: tool: remove unused JUnit imports
From: David Gow <david@davidgow.net>
To: jahanzaibmir <jahanzaibashraf1318@gmail.com>
Cc: brendan.higgins@linux.dev, david@davidgow.net, raemoar63@gmail.com, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260930203707.38766-1-jahanzaibashraf1318@gmail.com>
References: <20260930203707.38766-1-jahanzaibashraf1318@gmail.com>
Date: Thu, 26 Nov 2026 20:51:27 +0800
Message-Id: <179569748782.1202103.13250628048743028138.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=972; i=david@davidgow.net;
 h=from:subject:message-id; bh=9jGZoSF0cWjL4INvWpLcqT+H+ZPZuz4SfzmxRed+XvY=;
 b=owEBiQJ2/ZANAwAIAcYipzoZDNtCAcsmYgBrCCtalLq5jPD9nrJX7NIZUTHjFKUEmxBzUV6Nq
 24REV4XvdSJAk8EAAEIADkWIQSmmTCaqhqZOsxDGC7GIqc6GQzbQgUCawgrWhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQxiKnOhkM20LnKhAAtYILaMc24mKEeWlMElVuRdJ4zHgvyg8
 YxY9OU7m88UCWAOJlXkswXyIOxwc+rimNtTaiKjPJvTjdwvXa/E6D9wSmXzVWrE/d+yQzGBpKot
 527ykPc8xlSaW7Pexjg6X6bS/aJ3hEcV1Se/wtFtXqG2vFl4U0mhd/SUOzkR11vREVkyZkD7LgN
 R4w3l4/aRUtey1gmrMDUHwoJSLAUBUTyto98fFSRj6UsJ0X4Ln+QsVVJiKOF9V1tOyV7HWF0ixq
 juoRrquUbvEdDi82cdvPFYgd5GWw8mfYDATCvMlQXWf8fOUxDKZ6Mfi7sRCeEfY/Zfpqo97mvMY
 dj/UQdCdY4ndS35mljlZwU4Pt8ZHSiKpmhUJ2s1Y8x6SJfO/pbAK/3BmTZMusvqmuoh/JoAG7b8
 MaiwtN1YCtrZDwnFkvj0ULPTDCh1I3/McHZbZtoj1vcv3NdplX8zw5/+ClGJtyW6EUMV7pzzQ/i
 ieYxYQGeW1/7xw4r/JMTnjw26T/wpP1rKIfLQ12CtFxFVzuua5NA1RbnuhfJwpeGh9ac0Dc/fxM
 axMYzuXHdjteLpTRhoHtE5h45nn5oZWUq7fDjwwjVE7i+Fhd5GPjxMLJRQ3HlC1sRAOnJwsSp23
 GQBoCHwx5sKmaa9or5TJmyDp7NK9z+MrO4ibC8JVYrZ85AsCxgJQ=
X-Developer-Key: i=david@davidgow.net; a=openpgp;
 fpr=3B0A53B1D9DF6AAC59C230322A821C5AD66AB03F

> The JUnit output implementation uses ElementTree directly, so the
> xml.sax.saxutils imports are unused. Remove them.
> 
> Signed-off-by: jahanzaibmir <jahanzaibashraf1318@gmail.com>
>

Thanks for catching this.

A small note: please make sure your name is in the form you're normally known
by (usually, but not necessarily your real name). If you need to adjust it,
just send out a new version.

> diff --git a/tools/testing/kunit/kunit_junit.py b/tools/testing/kunit/kunit_junit.py
> index 3622070358e7..b76748947d65 100644
> --- a/tools/testing/kunit/kunit_junit.py
> +++ b/tools/testing/kunit/kunit_junit.py
> @@ -4,7 +4,6 @@
>  #
>  # Copyright (C) 2026, Google LLC and David Gow.
>  
> -from xml.sax.saxutils import quoteattr, XMLGenerator
>  import xml.etree.ElementTree as ET
>  from kunit_parser import Test, TestStatus
>  from typing import Optional

Reviewed-by: David Gow <david@davidgow.net>

-- 
David Gow <david@davidgow.net>
