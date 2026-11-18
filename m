Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991576;
	b=16ZFXwiZBAKx/A4voOdVwQqUE/prS91UKQ/FtFjyhJsssINomI/k4YdO3Six/epEJ+x2
	 r9dSFn1h0pV4zCEnUBFQvBhxiHudz0IGcMfeRKVTVkPiZGRwJFgay+AGdKr2gV6lEiyuz
	 iRMOjXSB6Fqjpd92W8RTOne3Zw/Rh4IdOzRCeuDjuaHK8wKGFWNTwSts8oOcYUth3cIVZ
	 V53kU0WTnxpZS37j+aBRJefcz4kRWMmUb/RTnjBY1BsvX2Yk7aBFGQjiGyLZZvZcnl6BG
	 /iqnGRSJDtvS/RsmHDAoDDrLWorG3WNl055jUjSciLUcwWJpwKeTWBHu1t1uWZPFZBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pxkuXdERaykwMOPQlF5CucoOr0fRF5ezQY9VTtl8AFo=;
	b=Wx+zPudD/NtopZAVhmc/lVbyoE0xZt68xwuzxPvwBGNaheUr0htxikIhxnzaxCqNSc9m
	 0XI6mtwmd2rpua1SEvKqeSQiDf4YtWUP1kR+GI+bSFTSJXFZLnOc7BfrntAcGnTVc/OIX
	 v1/JYb++LAT9FZ4HrMaKVyrIQGDAy0y1dGsMIa8FOtVbciTeWzEY5b+mNk/Btda7Z1fjN
	 2ZWOMQSdB3Wa5/aGm3R6Wq6f1De93VrtdsNO7PrivnT7OtUUvCIncqoKIQ2m4216DQyZy
	 vjKx7qjG0vlMJu/LTohGdAzsTXc1ZgSLR5rUxLh4AtvjwcNhTJpI36nq7gzHtlMpcTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZpVGaUt0;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8371E606A333
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 08:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8371E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZpVGaUt0
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so1339091c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 00:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991576; x=1795596376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxkuXdERaykwMOPQlF5CucoOr0fRF5ezQY9VTtl8AFo=;
        b=ZpVGaUt0qFX+fY8g64e6lfSZ6qDUG93vsf8J1YDKaJ//YYszq+CA7ztgrzDEG9cOt1
         WvUtFbMadc7JV+Vfz7dMqS3VNrppTwPCAfMUqjXCRMf+Xmzn/cA3k1VV6wDRtIFUoHHe
         5C8eDEEk4jKPUr5tDtaRFkBWw320hZjP2fePVtOA3YI1cmnu+KUOcpvS33oV+ermFd+W
         ZopHhKSa8ddS5XUHTfsLuTMs5bAhUqttDM1zqstvA9RmVI5BHbvs/O8JWrwxbOIcN7CD
         JiBGRmgNg7lblyYyO4QFX6Ozuq4O8JFPXGKHT6HM+hy0rII/NvC0J0NskiVWESPU9VgR
         BQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991576; x=1795596376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxkuXdERaykwMOPQlF5CucoOr0fRF5ezQY9VTtl8AFo=;
        b=PGlXRyHXpf+B92MVI4yzV8XnwNdzUZTqSIg6xVK/23W2w12E0TMRGuWVxvmJYS68yD
         8u47yXtgFwY7CN4pG/L6BoDjO0LslUeoB7cE7FhhSFUysqkukHCb0TRCG9TkK3ZsUhEc
         Htw6Lcdo5mGr7ydRTEPuGYzAxd9zsJOl8v19nWWRyTUMmQy6OJZQzzEpTw57IzVMRN3R
         AC6O2BlFkkCLRWsLP7B0WiW+FHyBJgfr2C+1gJtPcY6mkP7aViiyfCppcGXu5WJ62auO
         HWmvz23kfiIXMcHafdqFNy8fupL5pVCkOtyoUEJs1GzHr+J1qTEBhvhnjxT8F0h9JKi1
         RjxA==
X-Forwarded-Encrypted: i=1; AL+hErEirmr0uYpTnK95rDp6e0Xqiyoh28PwvFr3r73pbD4HJa/LRHrQnKslyZCHNZI6smKZCWIzPzE/4/y4tgRKeEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EJWixNJIC5OHhN67JtSKrbllLaDnqn5lHDM1xiiWGs4uE3ubO
	L1/bnmcNTIzsSfmtHhk5ZRXnC/Yl3l/2Hci3rK6OkQ55hJUIwMgm6O2+
X-Gm-Gg: AYBFou2J2Ys6aHiR0F6mLLv6LzHNNJ5w7w+iQX1m98rJkE65Lc2ITrpI5mHTT6OYUlF
	E7Z+iCjBX9cIICIzrzPqE1eke5mcfNNQEutbLXEL0kFzQP9vVLORxayY8aJTlgE/irny7eY0VpP
	em2GM8PWJEAbR/NADamFVtQFqy2Mgi+89QZMCK+VRX/4J3URBQvBVAp8CvIV8NExEPbRIzRcRnI
	M7Kb4CjVWvRFElhUVpJdh1OgCGm3lnorqWnAlm1nX4VLyInTcio+Qr2TucEDU5H2YidVpELoPCD
	x/OyyHBI8ZqqPT/02ZMn43DAQQQ5AMLyjsGBRebJiT7R/VY1sJ+vtM4ju8EbtC3yNz8skgjiOxk
	xvFMH9usUxV7ojOEyAPMoFy51BhsMPjHqdUbCWfRxBZPQdiw6trJHRVTQBhd4NBrr0dxOpxsdQK
	WusDd8T6/k0APMXhCIBlL6NZdaUJkr/J0iTyHq1To/Un72PdezJ8FAi1kpmO49mHg5m//plvtMb
	PCIfj81b6jJ7OkR65MIlM2BPDmhpUHuRxFDsjY2xiad9hm1BvXsHUUD6fNaTLPpNxr20NkJ2kWc
	Weep+r0BmZdV85f5oD4js7so8eS3wnFy0EcCSEKBklatlz+Pep6JYnis
X-Received: by 2002:a05:701b:4649:b0:144:fa57:c617 with SMTP id a92af1059eb24-1b543d32afemr1728596c88.34.1794991575630;
        Wed, 18 Nov 2026 00:46:15 -0800 (PST)
Received: from zypulse-in-radeon-MS-7E24.lan ([2406:da18:1601:7200:e02b:e41c:8db0:668d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm7220671c88.11.2026.11.18.00.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:46:15 -0800 (PST)
From: Yuen Su <zypulsecore@gmail.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [PATCH net 2/2] selftests: net: test flushing IPv4 nexthop routes in compat mode
Date: Wed, 18 Nov 2026 16:45:10 +0800
Message-ID: <20261118084510.332821-3-zypulsecore@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261118084510.332821-1-zypulsecore@gmail.com>
References: <20261118084510.332821-1-zypulsecore@gmail.com>
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

Exercise ip route flush on a route with a nexthop group while the dump
includes both the group's ID and the expanded paths. Check that the
flush succeeds and that the route is gone.

Both checks fail before the IPv4 delete fix and pass after it in a
QEMU/KVM guest with unmodified iproute2. Codex assisted with adding
the case to the existing compatibility selftest and running it.

Signed-off-by: Yuen Su <zypulsecore@gmail.com>
---
 tools/testing/selftests/net/fib_nexthops.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/net/fib_nexthops.sh b/tools/testing/selftests/net/fib_nexthops.sh
index adbec51..d3c8cf8 100755
--- a/tools/testing/selftests/net/fib_nexthops.sh
+++ b/tools/testing/selftests/net/fib_nexthops.sh
@@ -2183,6 +2183,13 @@ ipv4_compat_mode()
 	stop_ip_monitor $ipmout 3
 	log_test $? 0 "IPv4 compat mode on - nexthop change"
 
+	run_cmd "$IP route add 192.0.2.1/32 nhid 122"
+	log_test $? 0 "IPv4 compat mode on - add route for flush"
+	run_cmd "$IP route flush to exact 192.0.2.1/32"
+	log_test $? 0 "IPv4 compat mode on - route flush"
+	check_route "192.0.2.1" ""
+	log_test $? 0 "IPv4 compat mode on - route removed by flush"
+
 	sysctl_nexthop_compat_mode_set 0 "IPv4"
 
 	# cleanup
