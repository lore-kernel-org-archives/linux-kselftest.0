Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382887;
	b=vAtFNmTuMu5T6QVLlbkhRU8DS9lRn0uBsb0s815biUvpMTMY+wXtE9gnm13uLlBA36u0
	 OhpY7KdKIh4MLJB2+NCD7GozRbLk0V4Z+No7cu+76kHwtTGDn4S9TCBRL8SaRzxQpy2UG
	 R2o6gYr29a/qa23hrSCz+leIvqVigVNzVGUq9IyYNXOZ74Aw/dBVnITBDQvfUlE2aitUN
	 Ggp43DzT+N2T0OgGZVXKZkXg16ROKNsNuc3MYIQKqf1Fb/mDtQvvmunlX3aPNf9CDvYsm
	 74LzYuicsPDByFuReDknIcnSJ+8PVnNYybcbIhr0e1l2NzEgV8hywh2Dw3+Hsxp1kdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382887;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=3UfZG3+pcxBGzlDM7p3wxd7lWx3StudQV3isrWC7GYo=;
	b=Hq/m/Ql7UTI8LY/51qfqbtKq5UU/+Xw6DJbCVeJiIW2SpE2folflXQxta6oV8WNdGaOk
	 kEpxYv0iLyuL6m76uLnGyQDLjScIHha95vBgT/0SrKruAHVgoP+dyls/F8rGtjHFBHDfN
	 l2RiCnrQqNSSiHnYMJdMSkLDyhgZaz1FyyymU2BnfOGn2LqiE1ewPlnW1/ca0GO5xaVqp
	 u6xh9ZNqYVJKbyBGr//etBAEW6IaCxEwBSgS4NCAFcLMWBRyGgmS+mThagSjzgOK/m4m7
	 jR3WzVf/yvrngFR9IWXEs7soFNzf8BgXcQZFcNtFPgbZyTU7yNONkE2L20HiVrxCqbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="Ed/AU9Ef";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4AA606A32F;
	Fri, 30 Oct 2026 17:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B4AA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ed/AU9Ef
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AC81D4E413A1;
	Fri, 30 Oct 2026 17:54:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CDC0603C2;
	Fri, 30 Oct 2026 17:54:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DF2610328D09;
	Fri, 30 Oct 2026 18:54:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382878; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3UfZG3+pcxBGzlDM7p3wxd7lWx3StudQV3isrWC7GYo=;
	b=Ed/AU9EffaVtc40WEgAfXmqRJd0jQnDRTVE2wED7Hwrq55Rwh+eQG6ovoxUQLGR63U8fC6
	mNRoZWfjywsPPSY81bOYrdXfKxGAA9raI1qMIBNFVwMrEcUK9vzBGfp1DzysTvSECPwCz4
	Uyzksz2eyOXr6Y58PdOzc80JDSedjpZRhdT5lW9zWyJkACFylYsQdz8nusoPcqhL0H18tP
	W7PDks3GpMiEzH8VoxZAnOzpeQUWfu2Rr8PdTRXGNNfXY8AZ5UKkXGbU9Ok933rdtsbQcH
	DauqcFr9/QVIepsN9CTkMlA8Ks/hsLI98uQl8KpqOpD5omSg/BmlA7GazG2uGA==
Message-ID: <701c6f7e-e715-4647-bddf-48a1485afbe2@bootlin.com>
Date: Fri, 30 Oct 2026 18:54:32 +0100
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
Subject: Re: [PATCH net] selftests: drv-net: pause: Skip support tests without
 link autonegotiation
To: Mohsin Bashir <mohsin.bashr@gmail.com>, netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org
References: <20261030173516.1002250-1-mohsin.bashr@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261030173516.1002250-1-mohsin.bashr@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 10/30/26 18:35, Mohsin Bashir wrote:
> From: Mohsin Bashir <hmohsin@meta.com>
> 
> Devices without link autonegotiation support may reject both link-setting
> requests in pause_test_support(). On fbnic, all four variants then fail
> in cleanup when the deferred restore of unchanged link settings returns
> EOPNOTSUPP. Removing the restore alone would report PASS without running
> any pause checks.
> 
> Fix this by calling require_link_autoneg() before pause_setup() to skip
> the test when either interface lacks link autonegotiation support. This
> also skips devices that support only forced link configuration.
> 
> The issue was observed in the fbnic CI/CD pipeline. It was reproduced and
> the fix was tested on a local fbnic device.
> 
> Fixes: cbd8a536cd6d ("selftests: drv-net: Introduce a selftest for ethtool flow control")
> Signed-off-by: Mohsin Bashir <hmohsin@meta.com>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  tools/testing/selftests/drivers/net/hw/pause.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/drivers/net/hw/pause.py b/tools/testing/selftests/drivers/net/hw/pause.py
> index ca4a55e59c30..1537f88e0e77 100755
> --- a/tools/testing/selftests/drivers/net/hw/pause.py
> +++ b/tools/testing/selftests/drivers/net/hw/pause.py
> @@ -466,6 +466,7 @@ def pause_test_support(cfg, pauseparams):
>      supported fields.
>      """
>  
> +    require_link_autoneg(cfg)

This helper checks if the remote supports aneg too, so it's too restrictive.

The goal of this test is to check the local device's behaviour, without too
much dependencies on the remote, so that we can at least have it test some of
the local driver behaviour even when it's connected to a dumb remote or a switch.

Maybe the sane thing to do is to allows the defer() calls in pause_setup() to
fail silently with "fail=False" ?

Or maybe a bit more clever, have a quick check to see if the device accepts
an ethtool -s XXX command ? looks like fbnic will refuse all of'em as it
doesn't have a .set_link_ksettings.

Maxime

