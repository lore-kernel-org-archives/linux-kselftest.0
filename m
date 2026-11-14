Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794672779;
	b=hUDL75f87MTIrncPb+vSlakkinS1NBvjBFw1naoUAr0Q4ImMf76cj5GPOHaYBdlCJXTv
	 QWy0yQRlMwazeubqwoUVF3HSwJbw1MLvDiTCmPMjbWr1kQwvyHvQUXhYRUi23PSE1dxSz
	 Zf7zNkLVR1H8oIoLTRThG+4cztgsty9Yto5wjOnedWNNpZApppteh6k2bWsyOos2GAN5u
	 RwM0K3d5RPlu1MQwbIO15FtjSdUexU/alLpUVHny9X1TedYdv0r7UMKGrJakW8cPOQjNb
	 hn7eFZlIjVyuAUKdNiutO4by7BIkuvpBd405j8rfE2EvNmGx4E99irUXjz57jxZw6ZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ghL9syuCHlYtFbB/1f4OgkDiaorvJ8vhyURwos+Gw5g=;
	b=3C8Kd/hcg5Tr+c5eSDSPe5AJ47Qo1xH0zP1SMlMeWZR3MyuXZHG+df8SjDP1QF6Z8S+e
	 cUHj4hx9o9upWFkLFMaUL3ZzCWARGK9eQl0FE3P9cH+fARet9Zlal6wfFuXiz/1XynJU8
	 RO7bd9/9m4loAiN3hmGazTSG25wB6pKsuGNAjxNAeb5J11+JPjR2kucnVXcBKBAm+47LB
	 ybp8qtMbqnT7OHf79Bna+BRKx4ABuLZAZe52nEUYkVWKITppTSWzMQm/Df1wsaOZmvIWi
	 SqOg0ZW20jP45lLwV2BZnPCoHwQ8bPiE++/C/tad24gXrXVMzMB5dLx3y/F+SX/PrgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PPo4LOQr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E780606A337
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 16:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E780606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PPo4LOQr
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55c7445cf85so114691cf.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 08:12:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794672778; cv=none;
        d=google.com; s=arc-20260327;
        b=CeE0a+PxK2ul/4qXBrO48TqXgNHsVfnjvpdEkLq3PoBFD3EKAgLyUZM9XMaMkv7ZK3
         XQ091ILhJwVMRa7wHY/jiIgNPoNcwTmC83LsDC6U6x7L+cSmueVf6/Nqg+A8D0GhtdGN
         8FTNdcVT8HX1WkQSO3jKgxMQWM9yleRIV8Aq5JjqmnPexuBc9plygB5EJ8+kht10+KhE
         OtMgzYH+4zuk+BpZpEgrsxdQZwVYAuvOK7SJbIJyTjLKP+/NX1VvAr7/SF/7YIsYdha8
         xO2tXh32gnZQAXq4onUqW6FQBF0vgJ8P45fXHepxxqDGhqiEGJwYmHzeum6bCk0E3Vnh
         lqBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ghL9syuCHlYtFbB/1f4OgkDiaorvJ8vhyURwos+Gw5g=;
        fh=L/BnKZenVAgl5cAnh+jgngncN6ZNQY+p1uihsp1qvrc=;
        b=Hc72JmIdd8xoqADRmcthIjkzopP0fEx6OwcJqzWUIZMQE1znNzxqqDXbYuHLO6kZVD
         o9EHy2geuarGwshSxMD4RhLWgCbtGatLQ9mt4WBtbaw3TYnt2OHjS+XD6AyLgT5KwYDf
         ZT61yzRXL7jg8NxcVaMvklCeSLM1rsl5UxhCuM2DaGgG3nCkYv83Bu7M9GcBvdl8N2nm
         fSAciHqxze2p4jcJPkCcThZA1nRtRLgqrKrUHJQuMAx8eJa34UQfOR4QYzx95PxaIjF1
         0Pf2BNlz0fAbwMqPh/ZqWm1pEu4xb+SGsIEoG0nPWUAqQBYFsScJXOnO4lPfY9vwI7E1
         6AbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794672778; x=1795277578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ghL9syuCHlYtFbB/1f4OgkDiaorvJ8vhyURwos+Gw5g=;
        b=PPo4LOQrKH2CZMhlksHE+/7Vjz1wWftJgfIKRBAkgyPYEc65jXFXnbhbOZr5uQ5noH
         EF8vSbpDd+dh1mcPE9e53ws7qqoVAOPrnorDgwuef/KMCysmvNro6xtX4L2nC9AdbKGH
         gl4mPof5lPdvKTin8aE5lXuRNkeG8b2I1PvOpEYnksaS12R07DsXkdwTPbmzW7dlXNWK
         QNXG5bcZyABAcDW7s3EGKeuDB7lFk84XGUsd8zXOg46AgmTqjSu2CIYM4uDUWupAcJpN
         1o1R4qfL0P4F5brOYSPjvO1uwRJto3HFKo+MW7WNk37UUAsTvnGielhU16WHGf4ILl9N
         lyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672778; x=1795277578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghL9syuCHlYtFbB/1f4OgkDiaorvJ8vhyURwos+Gw5g=;
        b=TvhZgOdETFqwQJGZdxs4Uxoy3P2vSW6ErbEKt4Rcg1aZQkGUu6xCE2az11v3L0Uf7x
         TKUcqGFws19yNAfHqFomtWaSVXClqVdGrL2ieJZ999PyEXtsaT82VTOqwaAUqqUuOAys
         Mld7eBR+qLQahst3gNn4w0EGtt540LkFuV+ep6bUpSGfeaPsrQMqO8IYe0JahjAE425N
         xDC5ClqYmp5+4yL2tikrUE0SgnrUKPsjvEfydE05p9veaLDbbhsDL9C1Cc/IgN29F2mD
         wl7kSBbnQ0dQGo0KXdV/FWG2JWVDUooNsjxexTcerpRdHWoTEU0JiKmlEHI72m87GgFz
         lS1A==
X-Forwarded-Encrypted: i=1; AL+hErHWaVgfV2/cJ6iY/11A54aMpcPWoYq6aBELWlH9ghug7xLJFBYxifEoAyFlb6Vn2n9QI7VQGlMRZDbm1NkB/zI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IPj5ilRQlusk+T7JYxTK0pCgS6u5/b2Et9xWbEW9B+bZcpRF0
	LC0GAGoYYprk86ixT3xx8c/ZELyaa5XREiWDlVBHknPVYfaAJHLasKcZT6VI1Uxhm13xEpUeV9L
	nrKf76dLQAmLoFiTEJRPn+AZvVSWttOpUC/bGeT76
X-Gm-Gg: AYBFou3xBfRn7NS2q4knH7sf/wqaa6jWuF/4DlJ+PxrwiYU97YkWyfiDRTIEkWaQUrK
	0a2+uE39pEb0LdutWO541+cvDJIDzcvoM61/VB/8QM8J+GkUsnJ5aK5b99S326qZ3YEk8hQ7zxC
	wrKtEHmfbheUfmKfBzM7NF3FmDaarBO0jNCuvquq9VdBvai1AYDTJBcf2ZIpLR1iIt6D5+YyUDM
	LjGPlshi4S45u0IoBp4iemoQ8z2j8zHCYFQ4JCsjm47J2xBOoowJ95lNRpSZWSkzXTbiRopbh0i
	ZFQX1zG1yngRC2RJqdIMFJbDLCnNn7tF78k+QuCOocdvNU6HloJzZOcd5lcMH1TxRgBwbvk56/v
	RwhZVOWQ+jn8272Xw0rfVqNT9SX35oDD2/4TgeuapPjT5LwyF7D2BZDqfKDcXFOsE+NfB9/yEg1
	kqxRKmJD3PNeZ4NwreAfZ6znweKG4=
X-Received: by 2002:a05:622a:5c16:b0:536:3ee4:81cd with SMTP id
 d75a77b69052e-55c45b33181mr14926231cf.4.1794672777383; Sat, 14 Nov 2026
 08:12:57 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-2-6f2e484ca8ea@gmail.com>
In-Reply-To: <20261111-mtu-probing-series-v4-2-6f2e484ca8ea@gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Sat, 14 Nov 2026 11:12:40 -0500
X-Gm-Features: AclHuK9iNgT_YlTCGTFwNYXfeFtk91ZEPupuVOoSktUih4_lAiwcpfhf4SAWccE
Message-ID: <CADVnQyn1n_BQZ_E087pwaa8fjsz1nuB6XSC4QanE5LLgaScq7Q@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/4] selftests/net: packetdrill: test
 tcp_base_mss on passive connections
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
> Check that a passive connection starts at tcp_base_mss with
> net.ipv4.tcp_mtu_probing=3D2, as an active connection does.
>
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>

Reviewed-by: Neal Cardwell <ncardwell@google.com>

Thanks!
neal
