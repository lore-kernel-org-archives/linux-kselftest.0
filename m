Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099375;
	b=OD7ybAlrC8XG8LxUpo47xky+e3qtP/9Oy4LpNN6tEwrCz0svmj+t1c0pxfD5NqKDkfmI
	 SdtZB47kAMOI4QoGxblngiLGFlp2OF6GPXDCHYSC9sow0os5CHeyJnczj7D3SoNLzLFkg
	 alflq50WxKQPOTOgaFNEZqy8JhF3Igl0AJC90JR7bRo8fFMd+rUte4IPLdz2qLtQ76dub
	 eKCa2TRvXgISObbuDIgCthN+DLm1cJBheBxd+XR+h68fiknNAdyPWwDBlwOZwIO6h9wBw
	 fvTvNlcnn4gtKj55gTxdKhJW0BBhCi2/x3GI2n37kMmxGec+fent9RWqIyQ3w2xdzdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=52+JnzHR7Q9S8eHgTb67S23dwF/n03+ylGtQP9LSPX4=;
	b=KPCp7UJyfEsvczWXl0nCuntkSeDof4UZ1z1L5dIT5uQ6eD7jr7hbHtFhtq7ZReOPJHIv
	 TtBUagoI1o02tDhr8ZkpyjZ8bDdnMLh6LjCwhofDee31zMpRQCE53GssShk837P1ww6sw
	 TQ+2pa8CzHy/NjmkH8v32SQXYWOUo/cU37pOrAZP6Fs8n2vnkYz2IA2XueneMJkmHgO8H
	 sKLAY2U7sljXdkXchWdwuQMHL7iTOQ9s0FqILDi7YizfNfm6wIq9g5iBVFXeMid4L4ZLt
	 Ipzy6YjmLFLh/SgLApkri+nyyp/koD/H6INjHTwo1YKTXRVS//N5ZhWMylN1p+LC03g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1G4GBKn;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA3660A263E
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 14:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DA3660A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M1G4GBKn
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so6149888eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 06:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099375; x=1795704175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52+JnzHR7Q9S8eHgTb67S23dwF/n03+ylGtQP9LSPX4=;
        b=M1G4GBKnnz8x5UyDeEAaQ7PbQtG7pv+APg53+J8nIDZc9JIvywGhxFKegufqSmm4ud
         oKhn2LLj3rBsRmoTiHCc6Y8wTteldNMdmsrVi8DvLX4Q2mfe5rHrchWuqHSUeXNVf953
         gLiyYcavyQXq7NBaworc16ImcWRkVUFitUdBv2IRtB/V10HKasv7TELTdU0/0pOzdrmb
         p9Kjcf7Mk/4Ib12b2OlZI7LFbomYpCz7C79h7gkK7HUYV0+CFfCNpt0pDSCskqkh2GTz
         CTalF1BdhY3cCTRbdhWSoXea8TviMdNEKQnBeAXznKxGRO+sNem7UgeEC6WV+Mj05n++
         A6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099375; x=1795704175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=52+JnzHR7Q9S8eHgTb67S23dwF/n03+ylGtQP9LSPX4=;
        b=1Xop44knphmYsnOOVAcuQC780GnO9lbT4j852M46o3qMficp62f072ZJ1hypsZ21dl
         5meH+vPX127UpvCFYKPZaWin/HCbNVQ2sXRnxnVEB4qI8jIvq70t+fcIfAI9nk6ALdiM
         rxZi0ZweKzfSO0XoCvSKqolCVwTzsrAHLAlNQ3UtqoCtAXyVBxWn50HiFUIOBmx62rIp
         Ld+2OjBkI3qJCz0Q30iYkMse2eIcCFwWarJP6LhPuZ1be2xJWL+71azUrLZk5FGIxviM
         AahQObbL5AmucXlug89NbhYJJx1lo0S+5vNjlu+NA5wVJsNk/Pdw9tkuKY5Ya0PBIeyg
         mf7A==
X-Forwarded-Encrypted: i=1; AL+hErEuj1oNKFEaCz6geHjkdXzw4EzPRZ6TDEYnE5B6J4kRivX24M5YOLqrHOmHg45BA1ugBnlGmEXwIfVYEQnh12s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nyUODozDbU5M0vXpciyrfREUZ1pW4rJoltEhD0m9D/yTPB8ug
	HHai1sNMCpDPyoip8woYq2MHu9GVO1IMjIhsi9VRkCLVW4uLxtYV+w1Q
X-Gm-Gg: AZFdTZdsqviRZRnEIpm8zl9UX4IwSRkC75hMewo7Q5XQpjBIpYt8xmc3ivDMiz/hRCi
	ixp2CuvmFAahBaDpfkBfky0+l1snF/E9Vm1nDyshhUM4mFOvf2LMcl9fNuwMasCfg8A0Q/xQoO5
	uQhmZDyw9ExHcYpA6ccCn3R72iVhtpDRpBEYQzXJMQ69yGZQTSbNqb98SK+6TJkFnUSygYKdF5X
	2V4/BtjwdruXE6GbLOLJa/TbhsLwimLo+mfjKzJKXNbtTReg9xeiTGaxl2St74ucADE01Qzgwjh
	lt9K89f8QtjnBZ3EIwRSzWjzBVwdZCI9LNeSiWDi/cfk3mgSmbLCWBDa9ZY+7uqh5+Kglr5IrX2
	1g8M5+rP/Im/SrWioT6ZJJK+mZ1Mtc+5xErkrfHcd+B8wQnUH1lPbfSnxjz8k7zrZR6hjnLmjxA
	4zp3YB1DcMrz4y0v/AfEpddiTF1h72M9IVBSmg3aGHoEERlHzdp24j8Sejl/xsvqRvZvZEkswdD
	aBvQKU6/tprJuoUAUwJddat6ymNQreE2mrict7eXHgQ/HjifZhw8yP4KCVXAzh04dmIHcMAj1zz
	BQJO0PCUUqsYgQ95niesZh/fflGKwUlZgxCIGdoaCGg5IFo0aw==
X-Received: by 2002:a05:7300:271e:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-3827fe755c8mr6031110eec.14.1795099374635;
        Thu, 19 Nov 2026 06:42:54 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6fe733dsm16682848eec.16.2026.11.19.06.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:42:54 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
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
Subject: [PATCH net v3 1/4] net: tun_vnet: validate hdr_len after skipping header padding
Date: Thu, 19 Nov 2026 23:42:36 +0900
Message-ID: <20261119144241.360238-2-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119144241.360238-1-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
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

__tun_vnet_hdr_get() checks hdr_len against iov_iter_count(from) before
advancing past the configured virtio header padding. With a 512-byte
header and a 14-byte Ethernet frame, hdr_len=256 passes because the
iterator still includes header padding. After the advance, only
14 bytes remain. tun_get_user() and tap_get_user() can then reserve a
linear skb area larger than the frame and transmit uncopied bytes.

Advance past the padding before comparing hdr_len with the remaining
payload. Both callers return immediately on error and discard their
iterator, so the cursor position on -EINVAL is not observable by them.

The problem was identified during review of the tap zero-copy fix and
reproduced with vhost-net in an x86-64 QEMU guest: a 14-byte input
produced a 256-byte frame on both tun and tap. After the change, both
drivers reject that input with -EINVAL. The new tun and tap selftests
pass on the patched kernel.

Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Fixes: 2506251e81d1 ("tun: Decouple vnet handling")
Fixes: 6a53fc5a8770 ("tap: Use tun's vnet-related code")
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 drivers/net/tun_vnet.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/tun_vnet.h b/drivers/net/tun_vnet.h
index f4c652b1fa44..0b9622891681 100644
--- a/drivers/net/tun_vnet.h
+++ b/drivers/net/tun_vnet.h
@@ -138,11 +138,10 @@ static inline int __tun_vnet_hdr_get(int sz, unsigned int flags,
 		hdr->hdr_len = cpu_to_tun_vnet16(flags, hdr_len);
 	}
 
+	iov_iter_advance(from, sz - parsed_size);
 	if (hdr_len > iov_iter_count(from))
 		return -EINVAL;
 
-	iov_iter_advance(from, sz - parsed_size);
-
 	return hdr_len;
 }
 
-- 
2.43.0

