Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992468;
	b=dn2OruXKAsYHzAms+jTHs0H2GbXMOv3Uvgq4CFgY808EKEuaaOKD+cWPRzkDd6vVDoFs
	 qm+YgVfdABl1jOzPpsVnOUqqy/H5XWc3MJCkiSC+1zObyFTErqBJfG7YUyi7KGIoZ4PVg
	 Gvnu5b8pnqNqU0M6Nm+5BAIIpO7lARz6ABrbNERkaUr/n8JHRSRa/jidUwfcxcEh18DdV
	 0LYbpiKrp5KXY6q7R/WrkIyF8ImzAy7e+9ihp7my+9eCs3FhjDBLuhZ/5UprVH8HfB+vU
	 dI7jvR/4+sQDb40V/MY+D7r4s84GsS6GSzvqlKlQkUIEcO5xo8WiSq+0fHHzdj2PDkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KJHbuu9YNunQc2098aJOeh/4wneftBInLaZd5ecyQ20=;
	b=P8lEiLfHOF4thQpSsdHcxkGv/aL9DCea1jWGoUtqhlKHY+sDqs02WaY0F9rmmUq2BAw3
	 exSv8xyfpcxkesOFPiSR0PnySFeNxuhQXCCHwYVhwFgIkq3pLjK/UmGhpWO5PHdNjo+eA
	 GGqp7tTonkM9fMWn4OqG0QImrjzxcaLS7B2cPwY8SHTzD2zvM8TyaCixeMvJb6/wxRDSc
	 xaZ5oava5u/MYcRv3O/oXnk6jIA794qIe+1T2/3Wj+Qh0xZzzbdkVuANB6K7E2/R9wy2X
	 cSGYzyKZZ9uJOtay/5SQV0fGU6g7t5SF+y2+mDEyFKB9ch5p4VOLBJmVx39ILvjmuTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cg0E+dri;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC43A606A31F
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 05:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC43A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cg0E+dri
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-353804b591eso4879314eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 22:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792992467; x=1793597267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KJHbuu9YNunQc2098aJOeh/4wneftBInLaZd5ecyQ20=;
        b=cg0E+dritt0P6TfxAW9Q255khPeEmu+69fU8a2+/61exzipudfLtte3lz6pHT99rWJ
         NYh0W4TJ029dbTawErQ+RMpBmQSz611482As9+CYIbrL8/dA1OIcBJkDJUQtVhq3uKft
         8Xho4cBVbfyF3g1PoekWa2iOGxAm3ryDdP3tigjYTJU89NCwQVhS7FyZ/CTgfrLFDkts
         rbNE2r1zXGpM+8Zn07zrtdJ8ntU6kprsxSvad4T7fL3WFTq4nXGqK89wr56ZdHihhPSN
         gebvQ1afjV7bvIobenNv1K8k5v76Yd6zWZXiWvWLM4QKCNB62wf5aWZ1/f3BsqpjZdOV
         NA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992467; x=1793597267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KJHbuu9YNunQc2098aJOeh/4wneftBInLaZd5ecyQ20=;
        b=Y+k18Q031gVvjLXsUL9ABOjaLEAsrlLzL+J2+EZrFIiEO+vxuQsSAJu/B0RhyZ9JUN
         jKO7oCR8uLK+TXdieamMeNoSexoTatd5ZEKI8o8E2NNoM6EyupM8WQbej1hLIuBotlk3
         /IS7Zp/37HsJF9EvCqdnwwJrzJzEE4cjr0XVlqYEGK1GYQTP6nTLQTfSOsWfPktyHaq4
         M/AaGIC0UqrXfoPJkGlg81HAgVVqvUgDp6ocSlVnE0WJYJM8kQ+EA5/aCDzmSKoSSpi5
         OjBWjWJF9hleclMWQRZQScix1hGk2RUsM23Pu1ESrDx7pZLadpAAx5zND32ng0STSlpz
         MuOg==
X-Forwarded-Encrypted: i=1; AKwUvBwiK4L+UTKHOd4yJWiLao3uYlQ+MCh/9qWKkC6jfjuXn2IVGMspYKiMmeThRmry1BbGiu473agijCDlf3cFC8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLppV7a1fiL0uRPZpVNSbrxrQB7W7aogkcghiYGS0r0XrQJqhfd
	5ZLWOzyN+CjiEF2aljhVJ9WcAQoA7IQ+p2quLuRCi1cgUQZaL1rqYfmJ
X-Gm-Gg: AYBFou2ydwNfEYUkY3s7fEscKxP8b5ot7b8SHvT1OD0/lQHWImAvnQx/kG7FhTrmd8H
	T/dVjPCwafwXyN3MldAC1w+2ol+wyJFYz6+dzScv/D9Z97TiVPFCz6CeIYIV+x8CqkPW7AGSHRS
	5Yt2smCWJoa71smDKqyOXUYY2Sor53skZHNkG18srAapnswdCuycIVDt1L/YmDxNcVJPS8XSgKa
	1jC4R+7ks04HEjVcw4obOeHENxIhJddU91yzSE93b6Ty5+2l23P7YHvinZkyWzeZP3cnRJjLJWB
	zusY5VsVIGviuHBzic6LuGCPlDCWiCiXfpFBBDe9mgb4pzt0m14swua2+MDkSrqpzy6KDlxCliE
	QHR5SshxH1iOVYY9jbILsfDT/y0iBW9xcSyzeyyTf2uizjBykt7DQKdewvS/MdkQNtNHKZKawmU
	EZ8FoV3IQg8/wZaqfMkUj7G9jaPpUEK4tfKacZ00EQAQLDtqOfvYE9tdvFdmy5M1olpsYCIqNAm
	3+usjeLsianzH48NscdV8fKvP2sCMp2hRoRVjGkPyyjzslA4MagcMKNyyRaN3B8nqaqSDz5eiV+
	8YdrUbA78qnTsxG1wN99HUJuHQ==
X-Received: by 2002:a05:7022:3a09:b0:195:76af:b810 with SMTP id a92af1059eb24-19935fc69dfmr10272975c88.25.1792992466519;
        Sun, 25 Oct 2026 22:27:46 -0700 (PDT)
Received: from localhost.localdomain ([136.25.42.214])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee69sm29188566c88.4.2026.10.25.22.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:27:46 -0700 (PDT)
From: Tim Budding <tim.budding@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	linux-sctp@vger.kernel.org,
	lucien.xin@gmail.com,
	marcelo.leitner@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net 3/4] sctp: don't treat an I-FORWARD-TSN as an association reset
Date: Sun, 25 Oct 2026 22:27:40 -0700
Message-Id: <20261026052740.187459-1-tim.budding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179293012867.3134.16497481637722705271@kernel.org>
References: <20261024120627.837568-4-tim.budding@gmail.com> <179293012867.3134.16497481637722705271@kernel.org>
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

On Sun, 25 Oct 2026 12:08:48 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> With this call gone, sctp_intl_skip() now sends
> SCTP_PARTIAL_DELIVERY_ABORTED for an I-FORWARD-TSN at the leading edge.
> Is the pdapi_seq it reports still the message that was being partially
> delivered?

[...]

> Could sctp_intl_skip() pass sin->mid_uo (unordered) or sin->mid
> (ordered) to sctp_intl_stream_abort_pd() for the notification, and
> keep using the skip MID for the flush and sctp_mid_skip()?

Thanks, this is a real bug. sctp_intl_skip() has always reported the
skip entry's MID, which is the largest MID skipped on that stream, so
for an I-FORWARD-TSN below the leading edge pdapi_seq could already be
wrong when more than one message on the stream was skipped. For
unordered streams it was wrong whenever the abort was reported at all,
as the old check only fired when the skip MID was larger than the one
being delivered. This patch removes the path that happened to report
the right MID at the leading edge, so it now shows up there too.

v2 will add a patch before this one that does that: report sin->mid_uo
/ sin->mid in the notification and keep the skip MID for the flush and
sctp_mid_skip(). The selftest will check pdapi_seq for an I-FORWARD-TSN
below the leading edge that skips two messages on the stream being
partially delivered.
