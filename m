Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794672832;
	b=JmDjF+SIHzqWM2uE+E3G9lYoWDSaDBvIYy5wOo4aE8WO55zOOihxW32EbBs5HMC2uamE
	 6c5FpFRN4ai/6MjjtsL6sZ/sXlllkyvl7ud+5B2l08x/qnhU004Mo4GojAnforgN5gfai
	 YDfFtD8HgKSVWwbdRQAx96H+O3b8+nXTujAlcnnwHYL9hWHgyyN+lif1hhK1LZLl4rUhF
	 l8r6uFp4gmOvkvFzPs0jDWI1Hcutzn008rFUFIXDWwOBiWfHUkZJJotue2omBJrRRjSli
	 Vs0ar5aLeXsfNTJCKDg5YxsuxvlaKRqJN/+y+gw+2dTBwAtUYE2JQCKDV1QQzwnSPwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8Tl9o8/ajPwx7BAy1yOh5VYBJUvFApl5E8YYkNIIX5Q=;
	b=HeIT170iSnFzOMP97XcEBdSwLFKeuEhJw6G9fcilzlzl1+iTIJedv76X48zY0QP8eD94
	 zFSuULZCTwZ6/CvwlHI7Lv/bfqdvjczn5mYCNYQ9S7oXEagcTlhqzOt/yYOPhzcTF0ieP
	 IqONsnRiOGfwpnLaggbFOxcadJjmQPm2CqQh7D+IbmJj/KDSuQ86GQ/gh0ed3ATf4ptmG
	 B5lP2mAhf59MIYz7hEIGL2R8k2GZQp6GOdmO4dOl+eCSt2r6X8hgudqrAOdYOILMvliKl
	 qBFxWvdYnz2vY8DkbZp3fg08ZuLz3FL3/k0Y/iCs5Iax6b9f3eMTdVTWwvyBjfdNZcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fWYykvaf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E65606A323
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 16:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03E65606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fWYykvaf
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-55c7445cf85so114731cf.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 08:13:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794672831; cv=none;
        d=google.com; s=arc-20260327;
        b=CyN7QmQpO1bGX1TSR+O9FStTZq8LFvu+g/ji008bX8R8MFl6CjNcOr9MwnNUxy8s5s
         U1vwynd92cNqa+zZSVBUZpM2EeRHweZpXn1qcv1PO97zq134gbtx0g6wxC/lM9Wh8eHn
         iplzMoli2NJSOFzLvrPXGzhef8iEeP3WCqYSrvFjcvUvDm1Wm9XAyuS/QxHIMWm9UfxO
         Hz7aFx15Ds4NIhwEaoxXJjrMTD10f2bjfP+UDRc3p5IkJhgHK1PnqDsZjJ4/TDfz31jB
         HnRqKH+sc/lqArV9IF+jk/MLwilY/ZzBndZr8aDFjU11/b8s5VBkuq844IPVkywk99ud
         viUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8Tl9o8/ajPwx7BAy1yOh5VYBJUvFApl5E8YYkNIIX5Q=;
        fh=iBN7+CGrMIAgkPuHSJL73VYXYjC2hMuR4YZu2xh4tQ8=;
        b=RxM2DH63uUhPKJFo9OYLNMc+pZSi/ByZ3jLfUK2rQ1hjtabSEwTLnXbP1/pgljCStP
         PaHqz7OmHKeYILKnIhVimLb7CGlDhebnI2IDjHIctW6Z0EO3aqfur/HVOpht5PVUVKSE
         GWxvm12C9QrbuqZRtmyqFeNklVhooTLWbirAEqXKUoxWYu7UwQVhG71yv6510/6N4rim
         LDAQvjVjTlyZK0DL7OotNwmUp3QKBANrEU30r6EHFb1Lkxa/EatPyAaJLsfGCneSk6UH
         fWaK0NoYRZijWYSZVA8wd61NYeO1WCODJ/iTC7LEe9WsOAKeFWP6I7wD9/tfanexswPk
         oHTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794672831; x=1795277631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Tl9o8/ajPwx7BAy1yOh5VYBJUvFApl5E8YYkNIIX5Q=;
        b=fWYykvafZEoWUCoWkp7dZs1CDSFqWz95hiQCzldSRaPDAmnUc0YgkC/SZtmGv2c30P
         1nDiyPcFjnWek1jFrBaj9qVb8aLW1fzi4iNqW+MTldpKCfvjsv+HGc6ddi9lHpOkz5F/
         UFE1AbyPMHE3tiY8F7wdlXNnOrAzbUcMOYkiGKDtR/qKYz2+fXhSkFdsXCjLntFYfx9Z
         d2EDrsDG7UGMeJvyXA2LEh7hLf0POdeXeWGPUXff3tXibHM1m2KAJo0r8vd10EP5sdb0
         GXc7WopONhL1DFJ9Vm7Pfb6y8jfg93Nmnr4C7x/Cqy0nKyguWvbp7eBJzqROWn1htufV
         pgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672831; x=1795277631;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Tl9o8/ajPwx7BAy1yOh5VYBJUvFApl5E8YYkNIIX5Q=;
        b=X50SsLNFdbVt0M9EMnWfA8+G6A/aR1wZYDWgUCTxYxWFssZeOTB+bHisWPH8GibEtT
         DJf8pHUOz4BW0dZ6TCkz6VEwrsEqXfs4DMQVfAFzNxuuc7LvyF0hYbKX4eDa9Sw6o6Gf
         gTCBkPPMenlnNqAe3bNWy8hZemObEh8VqrbYZRTJjL2FDfReINB/p9j5G/wQSq/HCX0N
         GCS20cQrsO/HtPTfqPO5KdotHvkeqRJKziie+c7c9nNY1HkWQ/Z6O5HXwHNHSNFL0GZU
         qJwzHf8uK1k2lgQXqelZTBJytuyaXqDrbsI2Nswm1CqP1TTpWtn1Rpdjsg7kVJsqE8cg
         7k4A==
X-Forwarded-Encrypted: i=1; AL+hErGe86NbvaED2BgONc1hu5B+8eULzrj+qsKQI8gOX9W6W/a/ocJShTcayA1fTYZhB3ZoI0Swot4rxKzxqbpKpqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sQoriqvcg5TyVCEPxCTncy+9Ng9XnWCeh5Tx0/4t1vkmYW6w+
	Gtz3MOqZlsPi5VR3xgAINpxEmZ46qyisuXGPUAWcNA8mzXlhW1td3UydVh7BGPEEnuFwX8WT6QJ
	BsQnAbr7l1jriD15zU6PmFpPhfXS62K/J2MDcSHFJ
X-Gm-Gg: AYBFou3vULNs5TL5YIuT8q4Jv55kXWEt8Xo5nfZ56J0HHRp0LF48Id7ggN9O6InM/j1
	wzLOFytkjnvwt42qnasxc7FAEQI3dS3+PuPBZcmgDrhRCS7NmcmIKxDmoP0Vl6a05YJNJAfR2zI
	N4As/N8FJCFBTVDtZX6Qx7HZ/a1YivL4gp9TKUsshmDabL9ooDrlepFwbdK9dqAJCFURwhJl1iq
	MYHkHd9EMdBr0kT2J7mXT2qCy9m6yhLvY6IxSivDjd9uk1zgZ5EcpxI4neKminSMJpxpq5j0hI8
	sR/910mJ2RL3c1h2ceH184eQKP5dDER+fkvCRmGp92WKaXL1fBL3vS9BzRtfD5Fl32zLZ2LaNbJ
	F2DHGUotMLW+8+pg2W0C9cJKfD1KG9Prdu0bAdrCuM1VbXGuC5utD3e6+CC7kUc2ayUPFoDGxet
	yhsTK306wU44YbAO6W3izKLHnAiPI=
X-Received: by 2002:a05:622a:1f13:b0:536:353e:8d2a with SMTP id
 d75a77b69052e-55c420acbb5mr16418791cf.1.1794672830375; Sat, 14 Nov 2026
 08:13:50 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-3-6f2e484ca8ea@gmail.com>
In-Reply-To: <20261111-mtu-probing-series-v4-3-6f2e484ca8ea@gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Sat, 14 Nov 2026 11:13:32 -0500
X-Gm-Features: AclHuK-5_dHag13CLSttPyHmBa-mJPoWFf4s1lkgb_n0rEIb8AR91foWfJLHYLk
Message-ID: <CADVnQymoQEy_Qg8NciVFBO857-ks7vsBXYeaBGuLQepBkMD=OA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 3/4] selftests/net: packetdrill: add TCP black
 hole detection tests
To: echoowall@gmail.com
Cc: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, edumazet@kernel.org, 
	horms@kernel.org, kuniyu@google.com, davem@davemloft.net, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:46=E2=80=AFAM Yongjian Wang via B4 Relay
<devnull+echoowall.gmail.com@kernel.org> wrote:
>
> From: Yongjian Wang <echoowall@gmail.com>
>
> Black hole detection (net.ipv4.tcp_mtu_probing=3D1) has no selftest
> coverage.
>
> Add a test that only sets tcp_mtu_probing=3D1 on top of the default
> settings. A full-sized segment keeps timing out without any ICMP
> feedback. Check that the MSS drops to tcp_base_mss once tcp_retries1
> is exceeded, and that the smaller MSS is also used for new data after
> the retransmission is acknowledged.
>
> Add a shorter variant with tcp_retries1=3D1 and TLP disabled, so that
> every retransmission comes from the RTO timer, which is what
> tcp_write_timeout() counts.
>
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> ---

Reviewed-by: Neal Cardwell <ncardwell@google.com>

Thanks!
neal
