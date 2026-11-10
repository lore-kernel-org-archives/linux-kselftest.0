Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333111;
	b=GwkPjl5fVeyAU63sgUl+nqmjz5D7u4ldVF3qR2w1zjHZ0Rmw24kmAsyPTEMJ7vr5/bO2
	 VIm0Okbp0Xjw6qA0/mv0SYEf1pNAS/QmGLnVPlgIrygFzruUCGVxQuwWB6vhPo2kBNpjX
	 X+ON1qr7MKReQ6EYUOse6yHP/lK0zfLBRFlpwUsa0O0VKIaG2Dk5vai+qtJYLQGYlBNn/
	 dt3MFJR8y/zUPA9kbx4r1norlGDlMw5LvswXgSPNlfMYSuDGesjN2BSx+gL6caWVP8u2q
	 OsMJD/hl28zaKhcv6zm5BRnJqtiRtoD9hL03/NkZmA3sRp33Pil4HckZvI59b+wsOOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bhispul0ewCHbq4vsceQr04zf2nGwRb6CQZ0KQ//7CM=;
	b=seEDDrqEK6AdUaTGW2UaeCqbAf2n5qdN6kdWLcobr3Amous21v0PjzCgzjrk8F/WI4DT
	 3TMRQN3wLGKFm2cQFLuMWAcyUsmTKCW1oV7BsMTRsO0j908LczbEOeOLRr58nFqXreZbm
	 hcovLNXU8/QSQeI9xAM2CHF1ITyp7bDMyjv3G29X8KvbHGnABaxc7UEbdAZQewSwCjiBQ
	 KO1hhIcd890UlWI0wMT1xlke+yYEP+NMEWsOheOmaZNr66C5ETD3NhZ+iGwFRBty002MO
	 WuNA3MpDV+DYTJ998sH8CiE5BIyPsWIB9sEFzCXQl4HNyq6pNezEH7YJ0GkmfxY6WVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UbRj4/l1";
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DA560A2601
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 17:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4DA560A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UbRj4/l1
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4b28d9537bcso1600631b6e.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 09:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333110; x=1794937910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bhispul0ewCHbq4vsceQr04zf2nGwRb6CQZ0KQ//7CM=;
        b=UbRj4/l1Aj8sYlatj5ZhTuvffrU1a+6SW/l3AZEwT/GlvNFEOUvbDI4M5UtFPoaS7n
         A/F/PMwebScx3Wva4W2OXAwak7ow6QMUZgzyQKersUeBJp5dBDKbiHEdmcrmR0GWnbNT
         nWatWVlyydfwqnCeUBGE44vm++7n59w873D0KwfP8zqXgKF5U5LP9Z7WWe4rprGXXPOF
         ypPNuO/0H0RWlZCEXuytcu70l/moqqz5v1/Mq+FGjKQi7IWfFPmBwCYGtJOgZmCUfAS0
         XuwaL1/kgF/rj/+lOFYfigmMjOa5wEP0IzuJhLTEPjWXkII1MtpZ3JbQroRYvxBdSwwP
         D60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333110; x=1794937910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bhispul0ewCHbq4vsceQr04zf2nGwRb6CQZ0KQ//7CM=;
        b=qE6y+EWN0HL4q8aV3zarJb0cbKvZ8Pn38k9TB/0yz0pYSTGC4jWJ4FoFXjWNPYZWN+
         Jq9wE2xIJGpLSJ9BXB4iJI9lmmZiAQmCQ4+bHanvgP1yvMTk2vk9CQ8HH1keYsOewQk9
         KezcMHdA79SVmSvBFrOZ5/DJlcRR6D/4EQBf+pxqOYVYe7cNQWFtCbcIFZUfNKLXxhlL
         39IT9x05sc5JK7bCyDnJHkk0lNDUagnqnfm1qAWFsUhAqEv9/i2NG+T1m5/M4jileFy8
         TL7GNUNP+Hvu4znjNM7HfivQw5xbz8RYQ95qRdZ+mKS/65gRfc1rYCx9lCITyB0b03q0
         KhgA==
X-Forwarded-Encrypted: i=1; AL+hErG1IAmodVmkwuihybD2Nayl7Wl6pafj1cR/olNp5zf7KBjg/j9KsFxkPuiyvF/JgJ52/kQwSACgybc5CE4D22Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c6DV01DtQNffTuuONBny05WV/+iiq+f4GTTQuqdzosCMojZWR
	rX7wsLJZzXXZmNW00L5mvy5jqXtv6MyrlWfD9jQETkPR2v5yHBnPd4xq
X-Gm-Gg: AYBFou0V9oyKrjRdi0m+WhFd9qjvi5HXvrvBwxau/q1JAQyGbyR3HaWoJddq2OkCiDp
	LbhcjY+DUSZAxrwXOvh2Ufc75I9xjJq843vf0gWg2LXWVzxIoAeDagc0a3SlV+76ygEu0eDOzTV
	MiYMvaCd0qfc8yB/J/UWAr0vPwsG0HAoFLS+BWoAoRhbyktYUzUnJTVPn/DkanK6TIQfSMhDc9M
	OC9B8Hf/DySqc+5TxH45phN+zanyYvtVVOIfGztNfSSzv1CgHD4KXy4GR/yhf+Av6GcIRpl0wCB
	eUctDRoq3zYrrRJUbu4IuGUwz6hsXrEYUsyxdsGDvkVM4pKKBWTX2Ckv4oI6Ee+DAM/bHp843fg
	FWePipsqewwM4nDkebEogxLyyP+RJ7BZC21huxTV8E3ut92WT479dDxgfbYpL3tYegEWpyTEzv+
	5EXVuVihQs92AM6EhWdfTv0azaye0EJDiWjm81GnVEIoUUhHiLTmAtlgbP2u4WLneOH0vi1ieM8
	gnxHrBg8zVC3Xv0JtbbB+WZTpKoXWCG/hJVYofGbobbiQvXyGZFACkzo6/OshzGxv/U4KXQFzvc
	MMHJ5QAYF+n59x4DCyTPS8jN
X-Received: by 2002:a05:6808:c093:b0:4a4:c95a:38d1 with SMTP id 5614622812f47-56872839720mr1542650b6e.4.1794333109664;
        Tue, 10 Nov 2026 09:51:49 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905d3bab2sm2712060b6e.12.2026.11.10.09.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:51:48 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] selftests/net/openvswitch: check that a failed set keeps the features
Date: Tue, 10 Nov 2026 12:51:34 -0500
Message-ID: <20261110175134.977835-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179423058020.994134.14656142555028492016@kernel.org>
References: <179423058020.994134.14656142555028492016@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 2026-11-09 08:23, Sashiko wrote:
> [Medium] In test_dp_features, the skip path does not call ovs_exit_sig.
> [Low] CONFIG_NET_TC_SKB_EXT is not in sort order.
> [Low] Should CONFIG_NET_SCHED=y be added to the fragment too?

All three are in v3. The recirc round is a test of its own now, and it
calls ovs_exit_sig before it returns the skip code, like the other skips
in the middle of a test in that file.

The fragment has CONFIG_NET_SCHED=y, CONFIG_NET_CLS_ACT=y and
CONFIG_NET_TC_SKB_EXT=y, with the last one after CONFIG_NET_IPGRE_DEMUX
in the order that ignores underscores.

Two more changes on the way. The skip reason is printed to stdout, so a
run that skipped the recirc round no longer ends as a plain pass with no
sign that the round did not run. And the expected errno is read from
python rather than written as 95, because EOPNOTSUPP is 45 on alpha and
sparc, 122 on mips and 223 on parisc, where a hardcoded number would
turn a real failure into a skip.
