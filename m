Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007608;
	b=r5xTErfSGzq3FiMq3RkVMmOQkZXffKKgirUOs+N/mp47Kzhju9Hg+PRm/Y2mKlXki2UC
	 akDQd4tdU0cMRUtnMH09CFzuSdA/jbAi2JqyHGtJgXRxBlX8Do1zr6tlJJ1jKJk9j5b1b
	 0OR73xM5RPt/HJGkpc6izPrly0Bi9ZzArOtH5uT6icoSoKjr19FPL2m5fNsV67QKkecvM
	 A+vRzFg9mAUGTz+oKasSPw7Y0zYuk50OF7ljT4rcyRbX6mv3AzKwfF64XsYIisL8oKAP6
	 RZ30Fwj71Qng85o8Rm3DE0dDQrYekJVoIhQbvSYoB/cd6MayDLJmSvoxq9tPb1iQoUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007608;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=v7CzwBI9qtFWKPM2/kfPZOOMtSQs3ZKi6kkd05xq81E=;
	b=QqFwnaNS8Pky4q9mHj/x9ltCVmtdevGFVyaoJsNQzYhPakWEDwLgMD3JTDCaEv8znb6I
	 6bTeKoZZnwPnqPzghvIvbxXUiDd4aP3Vo80Zs8MwEPqR2B7imUhtoJgi/lt3FSHPIkP7x
	 i4LLODNHPXcEe8hTb0UxgptKw2OK5lVWU4UJPQwhPh/0Uc+4WrlHWyLIsQg4KiAZZOgU6
	 5m76w/vzRay469VstxBovXvFudHT7Dj+TbFyGBTaT4gBJHsPFA0Si0eqmd53mUnzlF9yB
	 4cTkvHHNVXOETtkuYlH0Mp778ioe2jgaIeASyTT0zIhir4WiR67hgst1buuZYAsl+2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qg5hzfLR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79DD606A31C;
	Wed, 18 Nov 2026 13:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qg5hzfLR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3AC1F000C4;
	Wed, 18 Nov 2026 13:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795007608;
	bh=v7CzwBI9qtFWKPM2/kfPZOOMtSQs3ZKi6kkd05xq81E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Qg5hzfLRc5Iuuqvgn1lTY3BR2wPtlPnG2nCx5N3SQEGVkhIKXm4Fo1NNwfC/iGbFT
	 oyS8cw4ljFBnUQOuv8PBkE1+kDx1aayOIC3iRl1KN411rExAZqGlDnuVa6ekPEzzFh
	 TF8IXkF88E+0UaPFXGg7ABTLhotCD6hb6WMAVTZiYbrPs1btdO+kCwRt7gekRZuQNH
	 VNsx0G8wTGF8mMsSfzdGR9ai3kU8eJ0mkVRuETNY5sVJbDo0KE2g9hZjutYdiGq3Mm
	 lXAOpO/f9mqoUm0gYCJnsvKsxdLz5w+Wgsgm4sxNqeciD+Xtlpd2lmjgfb991V++Hc
	 tKHXRBHZ4ZIpQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, "David S. Miller"
 <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>, Jakub Kicinski
 <kuba@kernel.org>, kernel-team@meta.com, Andrew Lunn
 <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Mohsin Bashir
 <hmohsin@meta.com>, "Mike Marciniszyn (Meta)"
 <mike.marciniszyn@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Bobby
 Eshleman <bobbyeshleman@meta.com>, Breno Leitao <leitao@debian.org>, Simon
 Horman <horms@kernel.org>, Mina Almasry <almasrymina@google.com>, Vadim
 Fedorenko <vadim.fedorenko@linux.dev>, Dimitri Daskalakis
 <daskald@meta.com>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Dimitri Daskalakis
 <dimitri.daskalakis1@gmail.com>
Subject: Re: [PATCH net v2 1/5] eth: fbnic: wait on the correct queues in
 fbnic_queue_stop()
In-Reply-To: <20261117215416.1901246-2-dimitri.daskalakis1@gmail.com>
References: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
 <20261117215416.1901246-2-dimitri.daskalakis1@gmail.com>
Date: Wed, 18 Nov 2026 14:13:24 +0100
Message-ID: <874ide8eq3.fsf@all.your.base.are.belong.to.us>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dimitri Daskalakis <dimitri.daskalakis1@gmail.com> writes:

> From: Dimitri Daskalakis <daskald@meta.com>
>
> fbnic_queue_stop() waits for every queue of the NAPI vector to go idle
> before tearing it down, using sub0.q_idx as the queue index. We set
> q_idx on submission queues for Tx, and completion queues on Rx, so
> this waits on queue 0 for every Rx queue.
>
> For non-combined channels, stopping an Rx queue always stops/wakes
> Tx queue 0.
>
> Set the queue id on Tx completion rings so we don't have to distinguish
> between ring types to get the correct queue id, and don't stop/wake
> disabled rings.
>
> This bug was found by AI and verified on HW.

The LLMs I run complained about this as well -- nice to see it verified
on HW. Also, this fix is much cleaner than what my clanker suggested!

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
