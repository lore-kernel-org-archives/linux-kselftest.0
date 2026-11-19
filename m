Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122693;
	b=GxOvW1ri/YPrJmFyRtXpZc4kWMv4acf0rFEyPpB//H6mLZ9qb2TI+Za6EOTy+UBnnxDZ
	 JzUkVJQZRfpw+vik5dTXBz3Co337n5xvRvmwgZTC65JedbWL0F9g/DNWICL3yuC+feMq6
	 e7se2NAOaxweGfzw3hapbsCBXeEJ9O4rpsyM5o+XyJiskW0M4+UxtPQQ1RnqvILjoLWW6
	 txArRWnFCrBVbx9inJLyY69AuuOR87brk+RLfr6cAUTNcM5qNgyspeExIbFBumHf8En2g
	 qb0gU1gWRFAODhyToP2E2f9+c53ULt8Y4jiMMQjhDX5ZXfotJjcR/lykyUWBQkHtvrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=c/FxpSNP1KOyGBvVMF7iGpNqA3mgfV1zD60Qg+NCmX4=;
	b=oWcb7JQ1KiBlwL/IFWDFJ9AoVo3o4fg9mdfbJLEeAlk6DESHmpA2kyrcezCri8vmIQQp
	 VigvMQcvMhSCyne/biGlsszu55+x+R7/n0hrAoJLthhu0UtayWMBET2pshrC8zvkGAB+h
	 KsLLmHjNXOPch2COkBzSc0Py/0Yuh7Ef2+S+9i1LHaqbfgg3Wtw3eD5uIv+vtR9njOY/b
	 cpmrLquvGCWdF424sWGmtzKXRuwNWH9rnVW7P/1NOg4Q5brJWIsvkWQn7ZNB+eV3HLRdW
	 CfBGD8vYgDBaS2gz15DxF3UG7iEEUVedN5msDf0pBMusFDr+bWdJ0dRZwxpNZtl+zag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nQj/AXSB";
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61606606A331
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 21:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61606606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nQj/AXSB
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91eb46044c4so3406526d6.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 13:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795122691; x=1795727491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c/FxpSNP1KOyGBvVMF7iGpNqA3mgfV1zD60Qg+NCmX4=;
        b=nQj/AXSBMlx3clfcBQYldrA8gxX7muuq67ouf7ZjWPp6biVchiONrwmhAPyu788R5+
         3983SrhAoAPloXSo0/meDJambBmtNzapvYoJzcGEMahLu7e8SlBSxoqxTQASYl+QCMdY
         EIaeQmMefl5CHGg7wRPaUKFnUdL1J6BuKySvlGRwdt3zQQl9nWrJFm/bl5UEZRXeWkq5
         AjsZ3stbPf7pNmaPsT57km434hskkTs5ni9q5nsQ+LQJDPFcKRcC5Rw+nBQNudu3Wtmh
         /fdzwUEaGLLspP8oUeGqCey8uGyYLNDvW3wYlrI9YLxNC/dbkPgKyOWrlnvALjKm/Qcg
         m7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122691; x=1795727491;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/FxpSNP1KOyGBvVMF7iGpNqA3mgfV1zD60Qg+NCmX4=;
        b=qH3SfahPB2Wxk2aJTWqca3YR9OVUQkV0uFJkxZqKCkiDQeuoesvQyTc8iSqtjpACQh
         B42TQH6JW9laz50S3xWxWYCFZkOfuq3j0alNvmlZqxy8vHvbF63BS0jQuPAA96NgfcKd
         yQhec2LqLQPS/HcTrBsTb3P7XWYtdtMVgwDm9ZVPVjktZN5IT0FB/w5MELAlYBPJq82q
         cXgVuMsObYqtZfZFGsHQjuspPRgM/qMn3ZsYBzqs7SFv/EloTQsm3mfdwSNb+MQkXNsD
         y7XYWuuY5i/MB6fXGEu4VuN3hqW68ktAZOv0bewGUwGz3xnQoh57VX1dHP1e4EMsYjjw
         hJZw==
X-Forwarded-Encrypted: i=1; AL+hErH5PPob6FoLrO8V0nH0ltuz5zJrktd0u58pISl6/l7/zXmB8ipdQB3EXbHfrIzHx83pmG3JYNbKwu0PPiR+1GU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fiwdaZdTRdlLnJiY0Hn87x5LFuLTy4jQhxgdckkFIfigZYrXG
	bC+MOmE4j9BY9MOQ1AchqxNhwBc30a+KcnEGPmq9VSAaIE7iLzBjNXInnJ4maA==
X-Gm-Gg: AZFdTZf9rdbliXbWcDYukBms+GLzSYWhJaoUZ7/GW75s5w4cfjbZpN7IrAyv2HjAsyJ
	fqMT3qxkKe/QLoxGbG+HCnVZxbKjZF3kp768oiAs6C6EViHI/MSxwsZo73MDNOVlQ52+NbtP54U
	qfaz3jfQHLB9WXgKHPWzpFdZ5OAC6ZYoWv9SNyWXZwx2HZ64PB5JaYAsPDG3FXzXL8x84umo+pc
	uXDVEv0VbAXHI/xyw6KbI769N5UelmotLgy+aswp6Gt/WhhEIJSGBmYDnIA9cPA6QFcVjwjzYbR
	BWCIYFAGkbZp3yltYiLPp9yCySzNm/BMIkqU7QtjM2RUls6Uka1WNdNOyw06AVUSR26hW35iXGk
	pakvX0hVdOPmb+2pNBLXhC0WU0A6PQVKeModSAYjtCb7cWSr6MLIkJ45aeft7eKdvd9WT9VqPOt
	TrvAFAlf17Xv4dCAGp9x58pfHlsitxjodnh+fXj/JR5NFB8HdS8jnhmyafbZcxgUTd0hrb2avVI
	58Ja+hMTOE86Y5Nt06t5oUir4jSCCBQusfqexsBPvO48yKnQ3Ei+UGz1kyim+hx+xm2D67kKbRe
	TJ3DXevoJSWyaj83gR4jMqr3WTg15G/SQY/o0jd0NhMEzSG63hO2KyzV7RVvlq8YtCcTvB7LjAJ
	K6B5aXSx2DI7CECCtin3cD8LzOTZrOyAel5v/fv364mQzTfvGW0paytLhg8MwrIo=
X-Received: by 2002:a05:6214:5294:b0:921:b6f:e3ca with SMTP id 6a1803df08f44-9213498a6f9mr17532256d6.3.1795122691261;
        Thu, 19 Nov 2026 13:11:31 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bf848dsm7227906d6.44.2026.11.19.13.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:11:30 -0800 (PST)
Date: Thu, 19 Nov 2026 16:11:29 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Gwanhyun Lee <gwanhyunlee@gmail.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.373ae703fcfde@gmail.com>
In-Reply-To: <20261119144241.360238-3-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
 <20261119144241.360238-3-graypanda.inzag@gmail.com>
Subject: Re: [PATCH net v3 2/4] tap: clamp zero-copy copylen to remaining
 payload length
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Junyoung Jang wrote:
> tap_get_user() chooses GOODCOPY_LEN when the virtio hdr_len is zero,
> without limiting it to the payload remaining after the virtio header.
> A 246-byte padded header and a 14-byte Ethernet frame give vhost-net a
> 260-byte TX descriptor, above its 256-byte zero-copy threshold. The
> 128-byte skb head then contains only 14 copied bytes; the rest can be
> transmitted as stale kernel heap contents.
> 
> The original macvtap zero-copy support introduced the copylen choice.
> Commit bab632d69ee4 ("vhost: vhost TX zero-copy support") connected
> the in-tree vhost-net caller, so this case predates the v6.15 header
> validation regression.
> 
> Clamp copylen to the remaining payload before allocating the skb. This
> also covers cases where the entire frame fits in the skb's linear area.
> 
> An AI-assisted code review found this issue. An x86-64 QEMU/vhost-net
> reproducer observed a 128-byte frame from 14 input bytes, including a
> 114-byte uncopied tail. The patched kernel delivered 14 bytes in the
> same test and in 400 repeated short-frame sends.

If respinning:

tun/tap's vnet_hdr_sz must be at least ~129. That is far larger than any
header vhost would negotiate, so it only happens when the VMM sets
vnet_hdr_sz inconsistently with the vhost features. The guest controls the
packet contents but not vnet_hdr_sz, so a guest can't trigger this on its
own against a sane VMM.
 
> Fixes: 97bc3633bec7 ("macvtap: macvtapTX zero-copy support")
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
