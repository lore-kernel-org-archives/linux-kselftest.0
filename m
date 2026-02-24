Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EDB37BE7A
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 11:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933166; cv=none; b=CRCasIktfTz3wRnG/sW8waqC9IgPkzFWmbL5au5AgzE2QTTNjNaIZSykpuRU4B/yBXAutV9Q+H046yrQd/0n0PuhrRUEJ1nOr8EJGOr0yzymapvfY9yEDGFRowO4xjuksj1L1J6+0azblDt5zzgg8XJ0r9ksYpXGjPl5zjwuc4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933166; c=relaxed/simple;
	bh=z9U3voXKAW1dQW4AvalaDk7/sRwNuHWW6nH2z8AUJ3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9akj6KA4+KkXELpPkddZE4Hm9heqh6mXlSrIP4eRPq1nj6J1r1KBfrKZVj4Yka1oGz9/vtaDTtx2e6vLqxKqSxHGzqZVMKZSipNFy4CucB/1QQYKXLqLfWNg9QlZQeE+Vqgj+uM1RsodmpisutgbwcNIq4xSermaNx/14z6cHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqNQhcbE; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqNQhcbE"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d4c307db9aso2884311a34.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 03:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771933164; x=1772537964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amTmzSl8ryBjjcQX/dMxltL1tsvRdkBfJuWHJ8vklYI=;
        b=HqNQhcbEHnmf2Qvf719iuNlfyxuuHtEpGKbIvvIuBkxbG/t4W4NnM041lXsw8hI+AS
         PJVg26+bLTJ4xeGmS9qv/6zqtN1OBZSMpQ0IKXcyOWxV8Dy7v/Ka1mkRRjm4aagVVuK5
         OHUkAZ5wtM1Y0mClpnXjROabaDeJ/YyLXRVhpTNxeDH5kVDQ/GxS+eJXkY6f3dNF7NV5
         us4sHOxInhXa9S/Xze9wUNjT0Ui1JEeSr1xvRySuNhEke6DOktJM1yfzJP66IiKpvl+/
         t8LSu+6CkKyAPS4Uk2vzbr8GGb/4ygg9JLPm1qxPQl2w+a2bYLsOOWewDdD83HaIIVcQ
         WYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933164; x=1772537964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=amTmzSl8ryBjjcQX/dMxltL1tsvRdkBfJuWHJ8vklYI=;
        b=Gk00e2TIsuUYjZsP99DgmFBGqXEVbByS8zJ7tHEPMrlQeh09gXAKHZ5nwTtSHc75B1
         tM7G8F1panULEGtTefu8RYEKIR2N8aiNxB9rXVdorCcEVHQKfhbHiqoi+iyS7KqwXIuD
         N9sb1NuphVoOAsy9eJ0DIsLqiLe3l7qiiQ4ProyTVVxTyDFFtEqJpHaYQ8NwAbhBBoHd
         kgb3jEUxukM/2R+KXipE1jbkOuAa7Ee0zBjIRzAauWfpVGBJBTZnQJqxFLBkZXXTnmBO
         4xmZT9//Ng7EYYjgIcx3TGnBoFAdIZQLrs4ZIJNwTTIJKDZSZpAthvdMZLWOYT4I6zQq
         Zqqg==
X-Gm-Message-State: AOJu0Yw4Srxc8Lrb3Rfh6BamI3vtLmJuCqlbLnzdr9PBfZwNRh8vUUKy
	1urpHLWvafBib5WQSgR6C5qNc+YlNXlZ78EcovlHbZ50ROzo2Gu85RfH
X-Gm-Gg: ATEYQzyk/VJcRZZ2mw01mKtYaNMFdjEKnx2hC28f8rUXMEwVsm84cdUzL2ECixbi2Zl
	cqwOkPEoyvoTK66KSbwRGRURoZtTZCn6A6MpaQAjbqMs7turQaTKgCwGXJIsfFj9CUpnWcIPYzL
	01+yDIBteNVxHn+tdKvJtMvPPkKaVxjAlP6JCrpsFvLyThnrVepUgivZSJeLr6vtq2asOjzmJny
	R15dFYUq93+dXoTQSpNQXZE4y3JpL3im9TKuS/O9/Lju071u3U48XV/VEt8EJnoeiL9WxpwXbt1
	ljPSR2MuHcAI4ARKGPcvn3spa1CyYQ511/e38Iy7lMoJVjcD6qGWICKbEyEQ42B0m52bx2OFleJ
	QvL/azd97STLB6as+9AiZcnKpS0ATJJVf+uFsk/ZZzZqG6RzpXOyl8J1iDnsTOq0Px9slnRUqpr
	XLkLsm2P2e1tnXMMVRFXmSqn5zYwdcxI+h9WyZ4R7RaklBWZqtG2+vX7Ql3nuIQmiwZf+wS1ed6
	ytmdsErIOz0BaK0zL8QSvU=
X-Received: by 2002:a05:6870:63ab:b0:35b:32d5:8fbb with SMTP id 586e51a60fabf-4157b1225c3mr6861360fac.37.1771933163741;
        Tue, 24 Feb 2026 03:39:23 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4157cf9a388sm9899241fac.6.2026.02.24.03.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 03:39:23 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	davem@davemloft.net,
	horms@kernel.org,
	shuah@kernel.org,
	kees@kernel.org,
	luto@amacapital.net,
	wad@chromium.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v2 2/2] selftests: net: tun: don't abort XFAIL cases
Date: Tue, 24 Feb 2026 19:39:00 +0800
Message-ID: <20260224113900.3331-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224113900.3331-1-sun.jian.kdev@gmail.com>
References: <20260222111847.692325-1-sun.jian.kdev@gmail.com>
 <20260224113900.3331-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tun UDP tunnel GSO fixture contains XFAIL-marked variants intended to
exercise failure paths (e.g. EMSGSIZE / "Message too long").
Using ASSERT_EQ() in these tests aborts the subtest, which prevents the
harness from classifying them as XFAIL and can make the overall net: tun
test fail.

Switch the relevant ASSERT_EQ() checks to EXPECT_EQ() so the subtests
continue running and the failures are correctly reported and accounted
as XFAIL where applicable.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 tools/testing/selftests/net/tun.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
index 8a5cd5cb5472..cf106a49b55e 100644
--- a/tools/testing/selftests/net/tun.c
+++ b/tools/testing/selftests/net/tun.c
@@ -944,8 +944,8 @@ TEST_F(tun_vnet_udptnl, send_gso_packet)
 	ASSERT_EQ(ret, off);
 
 	ret = receive_gso_packet_from_tunnel(self, variant, &r_num_mss);
-	ASSERT_EQ(ret, variant->data_size);
-	ASSERT_EQ(r_num_mss, variant->r_num_mss);
+	EXPECT_EQ(ret, variant->data_size);
+	EXPECT_EQ(r_num_mss, variant->r_num_mss);
 }
 
 TEST_F(tun_vnet_udptnl, recv_gso_packet)
@@ -955,18 +955,18 @@ TEST_F(tun_vnet_udptnl, recv_gso_packet)
 	int ret, gso_type = VIRTIO_NET_HDR_GSO_UDP_L4;
 
 	ret = send_gso_packet_into_tunnel(self, variant);
-	ASSERT_EQ(ret, variant->data_size);
+	EXPECT_EQ(ret, variant->data_size);
 
 	memset(&vnet_hdr, 0, sizeof(vnet_hdr));
 	ret = receive_gso_packet_from_tun(self, variant, &vnet_hdr);
-	ASSERT_EQ(ret, variant->data_size);
+	EXPECT_EQ(ret, variant->data_size);
 
 	if (!variant->no_gso) {
-		ASSERT_EQ(vh->gso_size, variant->gso_size);
+		EXPECT_EQ(vh->gso_size, variant->gso_size);
 		gso_type |= (variant->tunnel_type & UDP_TUNNEL_OUTER_IPV4) ?
 				    (VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4) :
 				    (VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6);
-		ASSERT_EQ(vh->gso_type, gso_type);
+		EXPECT_EQ(vh->gso_type, gso_type);
 	}
 }
 
-- 
2.43.0

