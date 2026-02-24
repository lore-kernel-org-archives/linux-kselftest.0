Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C51829B233
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 10:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771929926; cv=none; b=Fy+IP8QHtROfWkEkB99+y5ur1Rcb/J6U89H66/rdP6byZuRBKZe0lOjdVU5TSCZBWPU2iSWIND1pkmHCq4z2oJdFJtS5nrJRrU/pvvUVJkVIzxwRodVnjiqRj6mbx0S1Ohi0shieYvLydInNDR/meZ6c6sjokQSxwj9etYpQsbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771929926; c=relaxed/simple;
	bh=z9U3voXKAW1dQW4AvalaDk7/sRwNuHWW6nH2z8AUJ3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qDRe43LhZg9BAhyFTSmCajKH9x7+BQV7L7+HQxxmdnMjJTvKUJZemOGvsxQlxxXIAnVGm4wWMx6ac+HGVwK+/VL/Ta5mV0FgTATWFarUg4oniC8K9JsVyVDbMkADX/YkomdYB9f6K+mD1eBK0i8L1RyAhtnDUIOX087CglqZJx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnZ4JUTX; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnZ4JUTX"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-463b3697846so4255398b6e.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 02:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771929924; x=1772534724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amTmzSl8ryBjjcQX/dMxltL1tsvRdkBfJuWHJ8vklYI=;
        b=KnZ4JUTXg1hfGvSPEUFW3Z6BHaWQo/FtX4yruy5fBEkWTQEynqbY7+BzLPaZSIkpxO
         GnKqYP+q6r3Pq9euwXo9ssBivyt7cd2L6TYljY6HP/C7vIgQHm06jcVw70YX5virfvmv
         4EcsVSy6IV/4/Tp7zPQgCDK49BKuURPVXXdd9UonA8AkedRHPiptJOHDuQjVKFwHdZW5
         BOhaksMBR62RkKKYIzk1SDLc987cQ/KHaXb/lmrtjXmJmHGV800ZN2UJ7JVPd5FCu27M
         A5OZwPuh0NTQplxh9X++0eDT+QSu6pq5jGjF7AL1uceK8CmX5hNtaoDbymhJ2VBnypA4
         2HWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929924; x=1772534724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=amTmzSl8ryBjjcQX/dMxltL1tsvRdkBfJuWHJ8vklYI=;
        b=SQ++MywAUJ037ghr8y7/p/aAEsMQgsxeAPwiRqohRkD0lrD0VFThdAZcd5xrXgpLTu
         Hr4YvHUEbI603mgJAcHgnOb+eMnsaDSFYJyM1xIWVnZ7Aml65/Sbsa9AYLbVUwYZBZD3
         CSPKWqFJKQFhpGSPkLNQeI5fVEc34QvjhwnDdKoX2LzpUvH9JFtk+aD5aDmCR3/mFEis
         0p/DwHB0ZEOK2MZpeEcZj0gS2cJccn6HtlD7BXWOxVIFlqnB58XNzcR3Ax3vjpq7gxoP
         2c0JNyz7K44UfQL18peIDkHO42No1cYLw+b0L1HGlh3UXzkDXQKoynhVQIfJfW5SPVTl
         C4qQ==
X-Gm-Message-State: AOJu0Yx8Gn++nrWhuNj/XytNDoWfbLs4OEwwSQ/vEwos1ojGqlNDvN+/
	WfcNSWZrKKywns0JFrBrpGctJExBUBoq+tFsPsKRFxBqMBd3YbXPs5cO7OD1o8zNMgLkPA==
X-Gm-Gg: AZuq6aJ/GLaO+kp59l3u5MXGPOdu3PN8xEySjdVghAxFqF/gi4MUE7m+hcCM1LBJk74
	Xmoofu8dTcfESY4NYVN20l1ENem5wf80Vfnon9/cv1jw/KLvRAwMQOPZOLCktAxv9PFeE+ZWXke
	/xFSiWLoa1j59G5gjI2pv1jGxCeGyz/Qf8O7vhfRHbnGNULmVBoLSxHwNzfuo/mJkKg1Ma5xT1A
	9p+g/JacZoLjTFbVzjQuboaY5WagFgq3UmcfFRRh9FoJoXWZ+59YpYuuvh+ywQkGuRNr9V1a1Zy
	4DWF0iTnm4V8PHSbolI0XZzVnaApzwJUeMc3HNNreQqhI7Aayrt4vnRDPUe7pBjF8fLEejhjNGd
	X5TD5OY/91d4knXJj7CqCJI4Pzn05gbLawtAYOeO/C+jZmQ6T6qmBQ7GxFSK9QDDRwA/nC35dxe
	TnRgZqlyBDYb755Zywt4KWuG8PwNkRJk8o+9OeF3adT0or1ahDbH3NqLUDz9X+e5NHCL46+zEXH
	/z8fnHCbJE16OTtQ9ETXis=
X-Received: by 2002:a05:6808:508a:b0:45f:103c:2478 with SMTP id 5614622812f47-46427678333mr8896045b6e.30.1771929924057;
        Tue, 24 Feb 2026 02:45:24 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4157cfa6624sm11210270fac.8.2026.02.24.02.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:45:23 -0800 (PST)
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
Subject: [PATCH 2/2] selftests: net: tun: don't abort XFAIL cases
Date: Tue, 24 Feb 2026 18:44:34 +0800
Message-ID: <20260224104434.14912-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224104434.14912-1-sun.jian.kdev@gmail.com>
References: <20260222111847.692325-1-sun.jian.kdev@gmail.com>
 <20260224104434.14912-1-sun.jian.kdev@gmail.com>
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

