Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422982;
	b=dgb7kg5aa6j/qcnviD/N4Q20gXPVotCsskqtXP3HMon57xtCkVPQDQ2shR/3s9CojGE6
	 xRWPuLLjjehGM+xQayjQBjZ8dlsyCuxffn/6dEvqEGiECtdZXXwV8n9it2QPpar4zYOOs
	 jWopkHTkQI2hVlkKXqjnNu6wo20Nmb7cLI6jGLeDNi1kUmwk/+8iK7LF8rDMjYqcmSCGh
	 NcRaIwf654/Ca7SraMib4ZdKdY7XuBMCiRN5ssBaaqAHXKDZNTwCxPhIC4p74oSHx9H7p
	 fsSduPlslPWhV7jiz0TRSMEwJmtiO73MNzZV546sgxdYB/2SaKAVEPjWLPOgEBC36Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422982;
	h=DMARC-Filter:Received:X-Spam-Checker-Version:X-Spam-Level:
	 X-Spam-Status:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=YQq5R+2ayVIIHKhYloe/MGgwdbjtPC3ORQbDZEoOQqU=;
	b=xN3MsuPYxZe9WGSPNqVFdKqK8iY7SqtAMJ7LUG+dBkyy32c5JN1/LYITFZmCLA/31VQ7
	 TtspoNpZMAqwO0QsOlfsQQskK9Bj226vf4oEDufndIXExx4pg3UtfP7ndVLX1+O4iCkdl
	 f7Yu1uc2o833p+J8BCNpjTCCy0MBQWHIeoMzxVDVjTp3TN1XAlHbvMUDxBXacr6OuXk0J
	 Vq7yjfn4kOYx34hpPanNRacyvO84a9xyvucJG6oddjqFPdbvDdobExud9KKS3uVM2Wld5
	 GBeQ2inAtHXzF1F84mtT08SoYUgou06oHmDtAvscAizj1Od672DaVl56K21WepWVe2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876E4606A31E;
	Mon, 23 Nov 2026 08:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 876E4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 5DFEF200DE7; Mon, 23 Nov 2026 16:36:13 +0800 (AWST)
X-Spam-Level: 
Received: from shelley.lan (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id B745E200749;
	Mon, 23 Nov 2026 16:36:11 +0800 (AWST)
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
Subject: Re: [PATCH] kunit: configs: enable power sequencing kunit test
 cases in all_tests.config
From: David Gow <david@davidgow.net>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261023-pwrseq-kunit-all-tests-v1-1-a60f8637527c@oss.qualcomm.com>
References: <20261023-pwrseq-kunit-all-tests-v1-1-a60f8637527c@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:35:58 +0800
Message-Id: <179542295841.535454.11266216634040814856.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=334; i=david@davidgow.net;
 h=from:subject:message-id; bh=9MR1xPUMfveOhrhPbpSQmFvgrJfEW/DAQdeMmmiYImc=;
 b=owEBiQJ2/ZANAwAIAcYipzoZDNtCAcsmYgBrA/r4RcSggMqdwtKsSO7cGab7z7z0GA7cpK/y9
 iGKaFUrTXuJAk8EAAEIADkWIQSmmTCaqhqZOsxDGC7GIqc6GQzbQgUCawP6+BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQxiKnOhkM20KkYRAAiHD218XlVwIlgAKXj1GZOnD0zZzRDhl
 OMtPcGBM8nNoiqkyCoIiU9kMy9zm16kJJHBy+X9/NGzbZ866TUx4kkI0/h5R/DpQjb4bkALBVuM
 y7lTpS+eS/2NFejMA7J9y8OX5P4XwYZhHVt0LzBytlbc1y86XywqGhLhaA+g799nz0pZhMaXFmx
 nwUmG+jTKn3Yt0e36YiP5VzRkpYpCnt3Gb3oohJTzvUL/GVhQW5caJSts5gmhtScd4+0YQtT0zn
 RdilTFkfaN/BmEU1fEyrROpGDbaIi2PUI0u8AfmnWrIHSnGmu7CvPq5ahgbClpmYc2EwhmqSh8w
 B9GiBW0QQS2E0aUVeh8dSzVNdybDKI1ICwx86/kh/flB6ccNQ1vnVeAeKbgXumO2Y4pT+Theffo
 vOaXTgUoLYIKEqrgx62xZBlj04o/7Yw2moUxvK+pSDp26954uj/CUvu5lvSgMkJwJ5QfVw/w226
 HlJ3qVZvyt3EQ3owkrQaR1KLkgP7pYwd/OuFRn+xMJszxJHbyN2PB4RzUPkSXRA+a2swFzeAN7L
 cn869iJExOVUrHieIQf76yWVmb5pkuBMD7dywLsYdXjo0zSBXJ68fyZihMEnUuabQpqD+WGif2a
 Oc4svaJQy2hqJecuEsm7e35OY4/4Nkr4z/MmL9LVSmXGgQyA5KzU=
X-Developer-Key: i=david@davidgow.net; a=openpgp;
 fpr=3B0A53B1D9DF6AAC59C230322A821C5AD66AB03F

On Fri, 23 Oct 2026 12:07:49 +0200, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> wrote:
> Enable CONFIG_POWER_SEQUENCING in all_tests.config to ensure the kunit
> test cases for power sequencing core can be built with this config.

Reviewed-by: David Gow <david@davidgow.net>

-- 
David Gow <david@davidgow.net>
