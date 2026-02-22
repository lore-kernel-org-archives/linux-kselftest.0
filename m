Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0928D22370A
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 11:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771759159; cv=none; b=p7Vo9pmM/7QW/OC8ENiv2GVnY3Azq99hFUfK5+KkNw8t76yplLbhVqVA5yw7ctH4uZ6zUOrbWa37mxiVfv6xA+NSrCj9JBVDOScSuJufNPzuBVz05g/M8XvagGWYuwT0ciabDvfrq7afv/FjednXyMZZ6p7YbhKm6Oowtoy5RXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771759159; c=relaxed/simple;
	bh=z9U3voXKAW1dQW4AvalaDk7/sRwNuHWW6nH2z8AUJ3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NyY0/Q2ZYdkDY9ezFsG3zMMPWRsMTqT/styrgHV6hUsjh3IjNO3U7DydVAhU9Gl2zX6Kw6izJjYOs17fiSOppJ9OjYwDdlpG2JKwGkYPeM/7id6w9FeKfGR157JTQ8ouz3W5+LhhU8MugqBvcdTRBtJzKZJXHmvgT4ldu1UcQ68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTM9j4+/; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTM9j4+/"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ba68df3687so5133592eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 03:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771759156; x=1772363956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amTmzSl8ryBjjcQX/dMxltL1tsvRdkBfJuWHJ8vklYI=;
        b=JTM9j4+/uceArCOKGlwraCSSjj6FMBe3ErNHERVQmrMUQ/MJSlhfpr1TDisQ4VBHfn
         zm77Y66Ydv1v02qtxXHsCvmkdb6b4N8Yn+6793AkBLdlEeZTiUZt3CGA/7dTT54UpGWc
         Qrgc7mBSPZZ20l3v8/eVDJiD73Ytx75AtOQlXbBuV++ot2Vm79xoCWG5vjB53+R/ESzu
         J2ZmTeJNVayGkDMZV6Mgs6nabFpEDgYikCtU0ssSYxuDfNxhq7ociKtxZLW4fLAsx7f0
         XuPohsCvLg6zfm8JKXZOW1lZNzL+1YF4+VbmlI2kOdu7f2WZg0NT3gJhV/AmHSrhTx4U
         qOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771759156; x=1772363956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=amTmzSl8ryBjjcQX/dMxltL1tsvRdkBfJuWHJ8vklYI=;
        b=NF1tNPN8pJNvD5eQwQ7v1DLDoEV91IeSgOprzJ6wI60MYouFoybiPJDqsZKonM7REx
         p8eFAzaiRdV3ovtq1ujjowpBE5Btj/kQGyU5haYPKwA1X/kdyjmINrRCBfYEZ2NHHEpE
         t6pnW64hkar7d4J+aeLlOI2Dxv9OL1na2itK35CBHsl73KTxpFow/mt6LywKzV/UlTAK
         8UQyWNxfJEbSeCr/GHWdyBqeFdQd0BzrXcWLasVDbZZ5bRtEKsQp1wi4KXET8ZTlPz3V
         yUy6JOP/NayimscIqOu85jKOEac67R3kGe9x5FfL0vLOhmSMRM+OmZvNG0UoXI1VZIu2
         0RbA==
X-Forwarded-Encrypted: i=1; AJvYcCXN2/KNlOVAbsQ0wQSGiMWaxQE5Ljhz6YGf0bLZ+JsZGXJgYkwH0jw4FoufMVaIKyM20KYeXxdTn2uslLEUugQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6PVp4rdk01RGnKSx7TY+zeQQJbK44LdDKs/D4rF+dIYkxBnEb
	moBtUmXh+kRSqQOvSoXk91D7OWgZGndf6exAlcVR8pye1bq2opBqkpm1
X-Gm-Gg: AZuq6aJ8gomyTGftHfsMQWpY50V31bjbmdXdnzHCnN55qeR9j+lS/C/nTKgg3lJwfm3
	5CfUDTs1/zXh/KxDCowCuB8VDYU3Z4xVXzPII7hWLDsW8kczbhNVFNGDXQ+FxS4q28UTGJfd+fC
	mQxPikytNgdayuZjMJPgoIVpXceTGDhrdJFg1AXOebxRbFFqcPyF2D4VqLdM/9okVR68lhqal14
	vjdKZhn16ykqDiYXwI3X65+hYx1lB5lZHPfDP25SWegrN63OufvNRxb5XxZAuvQkVcoLHUEbSqI
	5V5GIpPRfT/ZPKnIf2V9XdEgogzSnRIiBZMl2gkH/szgtyGbA3ETl86Ze7tsWItlRdVPw0XJhA1
	zn36bDn9bw1c4ZTDBhXADzltGLIuVS84AxOvLio1okNKD07bTuUWTgWOD8S2E8ynKFNWcuvggYe
	8FWv6+DBa+5cflS2782lrRexmPxdLHFHcqTXZ9YvkntMjH1z1i0Kw6R+pUBQEkSTQ6NRJk1Z3va
	NyGP9mGVkmi61dAZtInHDw=
X-Received: by 2002:a05:7300:2308:b0:2ba:8543:c91a with SMTP id 5a478bee46e88-2bd7bb51d87mr2389557eec.2.1771759156106;
        Sun, 22 Feb 2026 03:19:16 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af9f74bsm4437200c88.15.2026.02.22.03.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 03:19:15 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	horms@kernel.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH 2/2] selftests: net: tun: don't abort XFAIL cases
Date: Sun, 22 Feb 2026 19:18:47 +0800
Message-ID: <20260222111847.692325-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260222111847.692325-1-sun.jian.kdev@gmail.com>
References: <20260222111847.692325-1-sun.jian.kdev@gmail.com>
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

