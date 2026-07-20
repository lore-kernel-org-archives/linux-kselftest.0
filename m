Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1DF416D00
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 12:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784550446; cv=none; b=FcuerGkNsyDZBtXsHOtGGS0D4nRye9yvHdtqI9ZPfnHqTobE5kqR060i0XmXTix7cS1vEQPBd1CUfbxkR+9ABWIB9fZk5KGQLLU78znQNVIDJYo3w4aGZITWpv4fatAyPYYNr/Baa7uaXRJRb0mhqiV3FS8bI2fBR7F4Ndqzerg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784550446; c=relaxed/simple;
	bh=cc1siyX8k7fZfWcVovsf/Z5WhR/7MEZNbf8tANrRVdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mnXMym30F+3Efrfb2hMDAHUMBReiFJ4sT+4TQEhUhmilFZFW1X9lJMtHshSMIdKA+glrc6sFZqlkRtBNJCxc4hl8HkhMpLiLwYDHK17MDE6D1MTrMhTSf3BOJUCRK2tEefJUJ/nPDPsxCKj23MhZiO319m6NGSd00sCLylv6/jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=eOIHMmWA; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="eOIHMmWA"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84830c774a0so4887954b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 05:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1784550443; x=1785155243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ra9Nxq6jMS2h3bjjMXgmORxdOVCRbNrcCvu/et+3t0E=;
        b=eOIHMmWA8vJXy2vrGLScKuby8uOP9linyahKoSA9WBwQg/rrAgGxb+svj+Rjtlk5+J
         qv7q2Zb7mZIEMCMvTeF3BAamooIiaCI517eRkQfO21Gty8keKS7cIHBVDyDz32tMgwMk
         8iWdob3aAaO66fekMAuMWmX5RTxNO9gpWfr9jW/vcNYbcUtrsTWWMrkBuIFQqdUAsTNX
         zPktUNSPQ1GFdkrEfBiKCM1fTCOchLdxbgCE9iLWdeYGxIH3wCFRouRR/gobBOv4fj6n
         0Zm1Jvz1jgbzq8TpCH0vd8WhBPunVD0dwzy14a5GNW7LdxV6TVPdRt1VgMNiS10sVIsH
         S7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784550443; x=1785155243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ra9Nxq6jMS2h3bjjMXgmORxdOVCRbNrcCvu/et+3t0E=;
        b=RRbs2ar9K/lsxI1zYL7P1J9cHdAv8zryg5iI37HsFAQsthcFMzNoTKw0wgohJcVo2o
         TruI6GvwilXD8Xw1+zx7tkadfzBvkAXYZUqCGCUTOI6cFGIah7pZVZSYHF4Ymewf5Sbe
         GVER/6EYCjpZFvdxrxms3IAVh5uUtsdmrhKV9Qxy3i6aw0sTMIlkZgeNZx9FHXSDlT+U
         ATuUysKDzdvriHb2M7Mun1JdxZ2L4r36Z8Mo3mjw0Qn7InvZ80KfupO4XhXBu3o5qEKD
         ZoEC/9mpQbmsOSGSet1zM4+sZ1S1egkTFIcQoRx/WhXo4euWKcJNR66MJjcm5zjqE0lG
         Rs7w==
X-Forwarded-Encrypted: i=1; AHgh+RoJMaULRL0JJhl087NPAGUkrSH9yjbJNjNuPEpEWnd/pI4Dm7aZ93rP2d3cVESMizS5+fIA9GdECdLFeBM4Mqg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+FPQBAfp2ZcxjTuMyciFFqPQfbtfQEDK5HBwVmCW3K4KlKjTT
	z6FSu8MUNH4sR2sEq/BNeLK68R5IWj/Ul9K9S89KnbHPSJglidf62gJh7t7PtBuk/P0=
X-Gm-Gg: AfdE7ckw6lxLdMdbPDWHsl565JiwY8u/E4175Gtmi/9ov9gP2PxCJmh66nuhXrLW+/G
	VoU53+UhzsWOcwkfpBsUdg88VwkltQfp5Heqc/ta7PU0q62ikj7eEDjsn53RTk7Q0az0Gk5AGUv
	Mz7eNsp4tb4UE9h8zLDsw6t01ve0yalUyQ0h/wu1SRqBsFUcn3CSyMp7ZTmHZKl8mPcg1Mas/Xd
	zRpS/FTEKMRl9b5yaC6aG7DSgyPEoAkBXoaOTVSlWz3YqZnmKfjry1cItzeu5CwjS2F+4WnXUPx
	StWdcwtdZMvD3V9RSaulQoBCdee/ZZ/gQfo3VazyKSbeP8w1Sp+Vu3eKEfmZCMppn05t9LDq+pi
	51hfbD9g4AKSTR3q2OYhvxHeTk6sJwFBXfMm4BGPfRSHvDOSmH6HnJTWU7kY=
X-Received: by 2002:a05:6a00:1748:b0:848:6a95:a9d3 with SMTP id d2e1a72fcca58-84c2945a8aemr12310834b3a.40.1784550442721;
        Mon, 20 Jul 2026 05:27:22 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:51::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb5159b11a5sm4516766a12.0.2026.07.20.05.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 05:27:22 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: andrew+netdev@lunn.ch,
	willemb@google.com,
	linux-kselftest@vger.kernel.org,
	Joe Damato <joe@dama.to>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 1/3] selftests/net: Test PACKET_STATISTICS
Date: Mon, 20 Jul 2026 05:27:10 -0700
Message-ID: <20260720122714.759175-2-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260720122714.759175-1-joe@dama.to>
References: <20260720122714.759175-1-joe@dama.to>
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
2.53.0-Meta

