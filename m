Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646882;
	b=c4gyJjnQmtulrLP7n/0Ijday7TXu+JyTsTD7GeFXhKBf0xtsczGSDNHa/CcHdNevra0V
	 aIdORjee3gM80HV/5yfFmL0XwP2H4wi2J/SCfGovVZCRer1UV34S6+K1O1irQ+Qefhz+n
	 Kz43NqVCicq4u/i/0hMV97nnWi184TqeLZeYzZMuI3fVSyhlkMYgVhZg9IHsOfTuPVC6t
	 ZNwHYj3STcuIHcxXry6pKOWdJ30zfoeKobFJv5OX7WCuSQ/xQUrdN9vyUOxaRCZdUT83V
	 wGUo0ahb4vC/IpyXeGwA8Rne3Hq2+H+ReVnBXuaJsrEL9EnIe4zGQtwnNW4VVKAxKWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=8mRY0dC3iNi2EAcGRxVrgoSrZHfhv1W7z/F4/S56g4Q=;
	b=IIkF6mCvQdepz5kXZSXRiETp6XIXzRtCmrL70gYYnVs/ADu2v+IfcTdGwqvJZwAMS+UJ
	 Php7e+YWSfTClExX40G6Y1i69wS8nwzGRRiTn0K9/UXOVO6/sG9djz2lHcKP3TYyM+nes
	 odihpzwZ3Yueyj+F70H5+FME3v17+cSilXg7VZiFcqSOvq4vyXqMddvGXEN7MpVSQS1Sx
	 mdtqvkgzwSs6TXn+uwm4lWQizduCZuqxlvHCrnT0PgSOTpCI/9sioDkQmLhOhu62MBvce
	 qnCKxuG3NMLI+22Dhl3N8DM8wgFZ70JNj/fLK+gTUBr7z/F8S2qHA8avQruATsypA2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SDDON54F;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF21606A324
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 19:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DF21606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SDDON54F
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-19305bcb6d5so901047c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 11:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646882; x=1794251682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8mRY0dC3iNi2EAcGRxVrgoSrZHfhv1W7z/F4/S56g4Q=;
        b=SDDON54Fyhv73iNsVlFcX6vkzj1Rcqv82e8IHNU2a9H2pE7/NUK+8QmuBhS/KW9bia
         Zj+q5+Bg2h+pm91gZhtPSRaKl9cb5II1TdTvAZVuFY3LNv8pk/I+TblRU/ufynzkWtk5
         VVv1ZM6i5z3mHDgCxVk9BfgaG5WEEDx/rABAA3+Dl0OMmJNNeUN8Hw4GGw8pdaC6fsWK
         GlkTIuLe0Ax9uMdRZhd6RT9tFbdU/pZdXv8HigKnphgjNsJA1+TNO7F/yfw43naSeJIz
         4idQqPyETGY+ma9czrAsaGDP9RZs2ND6WUFkk3vmHYhiOPWz3GkuVqIeOI9uA37DYnTy
         whaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646882; x=1794251682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8mRY0dC3iNi2EAcGRxVrgoSrZHfhv1W7z/F4/S56g4Q=;
        b=WC2NDUodjcJB8SzgT4Fgdc0r+dtatEMDdyPbuycbx6VO0tQc2VvpfChAt7PimRG02q
         4DzsdoYRg4PCvpQMSLVqYd5OtHoAXYOZZIt2Nr39PBoXNRo5cSgUDAuQMDj4OHCNJvHl
         LCmz+FtRZm6xcd8RXhOCuH42MKm/yY9b7rG1TpArQ38Hc/sGorLYNrQ+8Fm/KGNWhs8H
         JikXj+b6j3U7kdzkYd1MZziWSVFzQVhmzCIrCQoCBdYE9B2DC0bBa124CzRa6pvU/37U
         X/XDMjWbLMq+arwMagK4ugOn0v7JpoafLMMqzVGi6AqxqHXfQOBF3ofDgA6mzu1j4QiQ
         m3jA==
X-Forwarded-Encrypted: i=1; AKwUvBwPiU+ngikgNCnApJKPHbIff2rFLcy62dLbR0Fg7ez2BSoDke+Cayfo+OHWzpaktMXjML8cowyoo02TRp1M0+M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeIp7176oLzCnK/Z6ZEZ0S+nlwuLg6jc7CmosP8IBD7ubbTdzD
	oqeJLPbg1kCA1ZUCsBUi9qdFGQWsSvnShHhJIjgOJBvYBH+MwrLaDKbR
X-Gm-Gg: AYBFou0eR97/EN/xGyHExtIb+l/oCqkwDUZSsnWZ+dwpoHiftsQGBxtDljA47ZTHyc7
	jRmUUn1Ju82v9HOehgdJ0dRjmXE7K6t4JyDtTrHyu9cH1AOP9ApsP4tca3z0IsZVsLgk8GWYyOZ
	7M77+IHdtL6lPJWzm/ISMusA9VTKK5cUQQpzO97ei7WXVMayDdJf01IWZ8nvH0T3PF5ebhYLtk1
	3VWiWyerZvr2ryKvd9Rchi6w+cltrAnSNXQUIa1oOoAfTuzE6KDjXBSpVk0uUBKqEFO2reuS/Sr
	9AIhMg3eSO48PDUeI1BgRuS1nQUTiLFXacKrQ08kePpnbFvItd06K/ZTaIRO9qAGP8ABw6LsUr9
	SyyKq4rCH9uxK8cTlugQGV1/BkL6gkTfDA88T/CJiK/EV73LYyqnoLYm6maPYwevyprbjQlOizQ
	RIgIGJXA9+v6e95qw0Le7RUR5oD+NW5iuTHM2Rg+TLIFWolWg408M6i5DoqsuTvSleIAc/XrJP7
	f/2JlonnExFzoE/tLs0xyXt45uE08/WGeMcnmScGFQpGxdUXVre5GHZ/LZ0J6+ajKA+cP3VKvuz
	oWM7F9N8r+WNtdYk9xlf56M=
X-Received: by 2002:a05:7300:2442:b0:36a:2059:6c85 with SMTP id 5a478bee46e88-36a42454b4dmr18746729eec.34.1793646881637;
        Mon, 02 Nov 2026 11:14:41 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:60::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm40157681eec.21.2026.11.02.11.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:14:41 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	sdf@fomichev.me,
	almasrymina@google.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 2/7] net: devmem: charge the frag length to TX skb truesize
Date: Mon,  2 Nov 2026 11:14:33 -0800
Message-ID: <20261102191438.1059771-3-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102191438.1059771-1-sdf@fomichev.me>
References: <20261102191438.1059771-1-sdf@fomichev.me>
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

truesize isn't well defined for devmem TX frags: they point into a
dmabuf which stays mapped for the lifetime of the binding, and freeing
the skb releases no memory. The charge only feeds sk_sndbuf and TSQ,
which limit queued bytes.

Charge the frag length instead of PAGE_SIZE:
- TCP uncharges in bytes (tcp_trim_head(), tcp_fragment(),
  tso_fragment()), so the charge must not be smaller than the frag.
  PAGE_SIZE only guarantees that while net_iovs are PAGE_SIZE.
- Frags shorter than a page now count their length, not a page.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/core/datagram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/datagram.c b/net/core/datagram.c
index ecc30a6f8302..489d92fe6dae 100644
--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -737,7 +737,7 @@ zerocopy_fill_skb_from_devmem(struct sk_buff *skb, struct iov_iter *from,
 
 		netmem_inc_ref(net_iov_to_netmem(niov));
 		skb_add_rx_frag_netmem(skb, i, net_iov_to_netmem(niov), off,
-				       size, PAGE_SIZE);
+				       size, size);
 		iov_iter_advance(from, size);
 		length -= size;
 		i++;
-- 
2.53.0-Meta

