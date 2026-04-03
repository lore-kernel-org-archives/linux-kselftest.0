Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1FF378839
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 23:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775259167; cv=none; b=E+fVcqyhE8727KInU1zv1HmxKUWp8VQwcqw6EZOB4GNiJTevNO/jTgG0Pt3gFhEq9tu949jKpPOIgnZTYDHTz8LAmITSigkAI5VeWSS5mLU0UhsuqXgHO92JCMReBIkPuNiA4UJxdWH+pIeIANMAeOZPOH3w2SUQxH8on1hGLUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775259167; c=relaxed/simple;
	bh=J4kk90yuxxA42SHtt+Ov+rBowYEAkbWXfw9oGJun+BU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M62gKo+4TYg3whPzp5TCvsQz2b0QK2JDDPbAAjHMPau/Bh9DlGJOidelup6dohooYG98GSP5LUkgzGNX0J6nay8UQghIX3OiSyXUWuXdGNXHWiDnEmRD7rNOHmK4bsyo2Hc7Lf6k0Sd8UYXeKwdhhIwGNPsBiwQCHnqfLtBDn/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=tsb+mveU; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="tsb+mveU"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82ce09b61beso1057019b3a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 16:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1775259166; x=1775863966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/znVnDeXjnXzaaF0D3QPKaN1Wp2D3MlfOCy7zxinTk=;
        b=tsb+mveUsa7Pmiu5IYzZiavh8HSMrGf6c2vj6hg3GZ/H2NTGLqYJumUc1n99wxA/sC
         93DY+s6zmB+dvNWOJJpJRMeV8xYVwI0LLyqhzYkj94XMaKJJbTy2FkxmUx6Jv8c6Wp61
         BFXxcMcI04H3eBnjZYhw1ywPK0f/Y5HblnXon6y0sLUfcbpLhSHQBUpUepUZPzcy0zvi
         fgAM8eleeBXccIJd55CSBP9GI2vTRTtwx5aIFn1BT1BZPBO1Lw6IVnmM20NMDE25kaE+
         13SUhC8Yr1XMle9PZYLhgkB/vu+uHviRqFABNvMxI5S1VXAFngS10BUFOuHSu4x9KSph
         vdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775259166; x=1775863966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+/znVnDeXjnXzaaF0D3QPKaN1Wp2D3MlfOCy7zxinTk=;
        b=AhEAi2C+qFcMiNn8KMWhYJ02Ofv2hKTFH5rEZY5Lc9JWjNMovsJVHvPvL7K7lUKpzF
         kdSugp+/zf0HuFye0UeiFp2rZPXjBda+766u+BkhnjbLusssevLlVh8xUVG7K75fxeSI
         8GYQfvGf0SfuQuPTMct6XsVtW+hpG4kro+Xxzu+/8EMAA2303p7uBbQlvVxknXeupyTa
         uofGd4I0SMye/9u0Is6tKQ2GSw9ImQpxwkalGYci2NNByRJWo+n6AgJHT6+ebM2sECOw
         ueWMxYGDMfPkexcE+3SoY67OxBegrtCedjmjqOAx6RQe6IDIDiC5HA+ztkhQOn5EoDJl
         qYGw==
X-Forwarded-Encrypted: i=1; AJvYcCX+Q1JVHeJFB85YJ5DCjOxJMSLC3RcCmgxPL1aEn5IMAUG7d7T0k/fj+xEen8+QLhXUUq1cO+vDv/vJbtCw6tY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1lqOgbOV8V7j4gdFSevyvX2gsnBYDd82UxhJf3/Zcy9dNUtiR
	Q9ozWvqNwHD87UbmUDlMJ4+wugjbCN5ohVBqjd5TEqGSzo5dlw7rizw2R63gyQRVNSg=
X-Gm-Gg: AeBDies5EaTaoPABPdr252qTsa+drswwmx40BZdj8UXkQOkw0iXyqYavvLjouirTSDu
	a2/mPfODJVLuC999TXmABgkJOg4aVloQNQgf8VywTBZ8Pb26hLP06uD6EO2TPfL9Gx630K01zNZ
	0c1DpJtg/fitCE4n3p5P1RazmSsc4UWHRumb/tQXcnjRU3lJPAxUHw/GKlnk80F9lEOjczMwmA7
	Lb31R7H6aIFbELZPfmVmoR5bo2MSU7wdW/L6i7aU7SmZad8NK2QK+B+uWpRRTDliWThJnTSIMRq
	0UbbCAxyl22cy5nm5Ch2PlQhGpFMOHbmjbnUQ66NnDcKPN1pcD635upSOFRSzXmOyhs/c+pdjFY
	Y7wJhyuxcZEdzW89OZJFvt+ZPOBDy7NK6g33g7mUiLdhqj16mET+1q+brx4QDAQeISoMzIpZv8m
	3IIhiZ
X-Received: by 2002:a05:6a00:4b4c:b0:81f:ac78:ed22 with SMTP id d2e1a72fcca58-82d0db53f18mr5221546b3a.37.1775259166173;
        Fri, 03 Apr 2026 16:32:46 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5e::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c3d439sm7229853b3a.35.2026.04.03.16.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 16:32:45 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org,
	willemb@google.com,
	Joe Damato <joe@dama.to>,
	linux-kselftest@vger.kernel.org
Subject: [net-next v2 1/3] selftests/net: Test PACKET_STATISTICS
Date: Fri,  3 Apr 2026 16:32:36 -0700
Message-ID: <20260403233240.178948-2-joe@dama.to>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260403233240.178948-1-joe@dama.to>
References: <20260403233240.178948-1-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the existing packet socket test to include a test for the sockopt
PACKET_STATISTICS.

Signed-off-by: Joe Damato <joe@dama.to>
---
 tools/testing/selftests/net/psock_snd.c | 32 ++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/psock_snd.c b/tools/testing/selftests/net/psock_snd.c
index edf1e6f80d41..5be481a3d2bd 100644
--- a/tools/testing/selftests/net/psock_snd.c
+++ b/tools/testing/selftests/net/psock_snd.c
@@ -359,6 +359,34 @@ static void parse_opts(int argc, char **argv)
 		error(1, 0, "option gso (-g) requires csum offload (-c)");
 }
 
+static void check_packet_stats(int fd)
+{
+	struct tpacket_stats st = {};
+	socklen_t len = sizeof(st);
+
+	if (getsockopt(fd, SOL_PACKET, PACKET_STATISTICS, &st, &len))
+		error(1, errno, "getsockopt packet statistics");
+
+	if (st.tp_packets != 1)
+		error(1, 0, "stats: tp_packets %u != 1", st.tp_packets);
+
+	if (st.tp_drops != 0)
+		error(1, 0, "stats: tp_drops %u != 0", st.tp_drops);
+
+	/* verify clear on read */
+	memset(&st, 0xff, sizeof(st));
+	len = sizeof(st);
+
+	if (getsockopt(fd, SOL_PACKET, PACKET_STATISTICS, &st, &len))
+		error(1, errno, "getsockopt packet statistics");
+
+	if (st.tp_packets != 0)
+		error(1, 0, "stats: tp_packets %u != 0 after clear", st.tp_packets);
+
+	if (st.tp_drops != 0)
+		error(1, 0, "stats: tp_drops %u != 0 after clear", st.tp_drops);
+}
+
 static void run_test(void)
 {
 	int fdr, fds, total_len;
@@ -369,9 +397,11 @@ static void run_test(void)
 	total_len = do_tx();
 
 	/* BPF filter accepts only this length, vlan changes MAC */
-	if (cfg_payload_len == DATA_LEN && !cfg_use_vlan)
+	if (cfg_payload_len == DATA_LEN && !cfg_use_vlan) {
 		do_rx(fds, total_len - sizeof(struct virtio_net_hdr),
 		      tbuf + sizeof(struct virtio_net_hdr));
+		check_packet_stats(fds);
+	}
 
 	do_rx(fdr, cfg_payload_len, tbuf + total_len - cfg_payload_len);
 
-- 
2.52.0

