Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854972;
	b=s9ub6ljmrimaToyAHUYohU2S8/O5WJTK70Y9YFIdmJOCcQWvOklPFAbGGtLjUsM/JwJx
	 6fG8lv6280W+eAevKVesj+dfNtCGfEP3TzCk6ViPpY1YwgJ97tEchTL+wUNI8itVN+2M+
	 M80ODXdfhGG8TFxknWHmbijwM4qNSkhOKw9Cg2xLrhI35msgQ4n9xndZf44+QnUUCx2IW
	 9T1vmOPLKr0nxbnW1RueY2BwpI+TORbWU9/tmmMVuAXUYwxyyYkG84hmKjhbOPH65MBTK
	 MfR+1QDbzSVLy+ywyDpXv2/4j6vmtGW0D0DGQp3xIVNKMiUoda/Zi9TGdVouoJiDQFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JrA96iHSEppxQ2hp+sSJL/g5LPKU9LnKIC8wGzFqNw8=;
	b=BJB1lDTzu5jhxAk6BmaayARGp3UY2/58yIN5fN+6BYIgbbW3xRQOuwb/hqg0ihVE0lGs
	 742QSfqHRPJ1nIK6W+wb2Ewx9PEDZSYu6yDFsEldUTcDmfhFvO/DcraRFmUEHnZ65gk1V
	 mO974k2JZb6vKj7YdxnAeqUNvQptdVFj2IczyLRcMwVYcbcc/xBcC2+LSmzp9TMLP0yfS
	 us/e3bFtZjygyxnZuoIfIknayimhwqxzX89Yj+ZN+P/LzE4H6Ku+d2jOPBkWikT6BlVkA
	 gXIV/4fLAue/2j1zsXfhZtgEnUBbsBsNPZWPFeRo6UFYYhgGFSPYymcaaOMigdQ2c9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VxNtRLI3;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3951606D807
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 05:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3951606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VxNtRLI3
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1571658c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 21:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793854971; x=1794459771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JrA96iHSEppxQ2hp+sSJL/g5LPKU9LnKIC8wGzFqNw8=;
        b=VxNtRLI3j9T/8JzZeBa7Vg/9x3/kswBzW6MPGKAqaXfVyJ3lITbV4/VITEAICjFfMf
         eMk2B5AHjHt7knwLMB+T5Dshpo8fW5iugQoOKGXGvPz3mr5TGAdRRLcJWqL3TK8DyxDq
         cnBt51+U0LBmPPBvJyvPOSnvB5X6rTiDbKxi4szD6gQ51Oksxy/4Bf9/dg7xdWFE5xal
         ezJPO7Yz6vgEQ03dSP9ltynu3OCWaAeHuPGbVFyqCwv9sIQRTT5BErN8iBOywapHneTH
         3W9KbNFG6O4UgwRN8R5O6iyiVcff28vJEYPlqlQ4lLwQII/aIh2g+A8eGVJPWgXFSnUN
         Tt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854971; x=1794459771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JrA96iHSEppxQ2hp+sSJL/g5LPKU9LnKIC8wGzFqNw8=;
        b=UmX6XaGGiyndvpzyLJVFlIjzE8jfF6/9CzwJbFD5TZzrUItgYxDghodF9uLulEZSVD
         Vaz7KUxggRzsGgH7wYVL87w/mCmRI+0djGf3gV9g8WEf28mpkVhqqcxVwtEBMuJYGMkn
         rUG7RbBDbEYrqi9WuhjKdq3ycdZUabtoriGNHLMSVrl60t+T2FsV157unPg3YOEb9SHb
         hivlDOM+solIfz35qIzKMKxOnUgtSXxw3PQPcWIX63+HTTXbvXnt4Rlw8QHT3B4YOw/I
         hoIuUgbJoSMTON350RmUMj1syPX7spwWO7/UpBr8WDtd0HbOCohXTQ1OUJgJLF5AFV/R
         g17g==
X-Forwarded-Encrypted: i=1; AKwUvBwITMQ+A1Cwz/R6SklDgmdDWHEjUiCeIDbgZeh9VtfCjl8/9ODCq5YJOzCmkFJFQZDZJqugV/acFMr511FUsmQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FB2EpKUkfPh4NN0I6WffkYg60BqAM/h/uQcQ6Ct07ywG3WYGz
	vrFLZnqCVy7Q5FjD7FbPSU/wUCGSn0tfmd6j+cqkSkEYMgvrPkx6ehv6
X-Gm-Gg: AYBFou2YzWkKJ/gvRJTOmsEXlsxuYYpVOGuyF0JwYMtrdwLEpJPvMdb3lmQGN7+aV1a
	uJ0SNHaqaUvmRSug291tHx3ZjSvNH07IaLDeu1HB2SstNBndYm7uUH/OMUSxwbiYBJpJB6cKYBV
	zJfZFq/c2j6eeQTuRLOTwywKYiKku7XQWwy8HwplYIYNMfVWS8i8TD0PFA2HCUxQ64T2z2GCMAy
	6ZMG36Q+c7ZtBoCxKK1BCNvCxRixE+5pCaokQTTiUMSALLY5z7LkwvWAK+nuleErCL6AbkKCA6R
	6Xr/ZnulwwobwM8EwQX0d3ZQZFTvu+favkFeyetc90E8unlltMMWH3KDyG6pJcQtur+pqppsRFY
	X0/MOctcNkWQ7kzbGOjcc4NZL2h3Ak1EgE0ez7EpjW1DphaWQKBZHNPj1OtcG3D8Hm7bgBX1Z5z
	KENpapBx+5bUPRm8EV+ylZyCPUZuqHOkkzAD0M3vK2hK2+6qtzscDN6Gija7c8cHhxCngANLjLY
	WalfFlWVCiNoh011N4WRoqkI+1/bacp60Jofk45Jb2h7H+flL/6nHNXG+AknBNNYAm61OLgvGxE
	Mf0u9qhHJxa08HnLt4UbWeMRFJQ997WDPyHjQyjEUVGBXD9M6OCeO5KEGZwnkn+heRLqCQdjDTI
	=
X-Received: by 2002:a05:701b:2816:b0:182:94d7:f76a with SMTP id a92af1059eb24-1ac6088a34bmr25504978c88.43.1793854970493;
        Wed, 04 Nov 2026 21:02:50 -0800 (PST)
Received: from localhost.localdomain ([136.25.42.214])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c283sm13626735c88.4.2026.11.04.21.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:02:50 -0800 (PST)
From: Tim Budding <tim.budding@gmail.com>
To: netdev@vger.kernel.org,
	linux-sctp@vger.kernel.org
Cc: lucien.xin@gmail.com,
	marcelo.leitner@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Budding <tim.budding@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 2/4] sctp: report the partially delivered MID in PARTIAL_DELIVERY_ABORTED
Date: Wed,  4 Nov 2026 21:02:23 -0800
Message-Id: <20261105050225.49292-3-tim.budding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105050225.49292-1-tim.budding@gmail.com>
References: <20261105050225.49292-1-tim.budding@gmail.com>
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

When an I-FORWARD-TSN skips the message being partially delivered on a
stream, sctp_intl_skip() passes the MID from the I-FORWARD-TSN to the
PARTIAL_DELIVERY_ABORTED notification as pdapi_seq. That MID is the
highest one skipped on the stream, so when more than one message is
skipped, the notification names a later message instead of the one
whose partial delivery was aborted.

Report the MID being partially delivered, sin->mid_uo or sin->mid,
instead.

Reproduced on an unmodified kernel with the pdapi and pdapi_uo tests of
the sctp_ifwdtsn.sh selftest added later in this series, which pass
with this fix. Reproduction and fix done with AI assistance.

Fixes: de60fe910543 ("sctp: implement handle_ftsn for sctp_stream_interleave")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/179293012867.3134.16497481637722705271@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Tim Budding <tim.budding@gmail.com>
---
 net/sctp/stream_interleave.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/sctp/stream_interleave.c b/net/sctp/stream_interleave.c
index 869940001588..e239da686f68 100644
--- a/net/sctp/stream_interleave.c
+++ b/net/sctp/stream_interleave.c
@@ -1257,7 +1257,7 @@ static void sctp_intl_skip(struct sctp_ulpq *ulpq, __u16 sid, __u32 mid,
 	if (flags & SCTP_FTSN_U_BIT) {
 		if (sin->pd_mode_uo && !MID_lt(mid, sin->mid_uo)) {
 			sin->pd_mode_uo = 0;
-			sctp_intl_stream_abort_pd(ulpq, sid, mid, 0x1,
+			sctp_intl_stream_abort_pd(ulpq, sid, sin->mid_uo, 0x1,
 						  GFP_ATOMIC);
 		}
 		return;
@@ -1268,7 +1268,7 @@ static void sctp_intl_skip(struct sctp_ulpq *ulpq, __u16 sid, __u32 mid,
 
 	if (sin->pd_mode) {
 		sin->pd_mode = 0;
-		sctp_intl_stream_abort_pd(ulpq, sid, mid, 0x0, GFP_ATOMIC);
+		sctp_intl_stream_abort_pd(ulpq, sid, sin->mid, 0x0, GFP_ATOMIC);
 	}
 
 	sctp_mid_skip(stream, in, sid, mid);
-- 
2.34.1

