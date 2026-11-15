Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760308;
	b=aiXvgIPrUwKSR7ykPgDCyMF29/J5bURNPWFlorpuIsJddxIEDAJL5jT529VJsp5VDmFF
	 QT/lUxbXzVG4eIOxp4mXonoDZURufL2qF8nQ71+NfcwUWr0Fw4unewbyOkiOOQL8vtBNg
	 iMoGtcjggCU6ei/qpzXZO/zD6Rm6vEpO96Mdom0X47naqKoWEKRWbXyGGEO7ZxaWPY2aw
	 CvrieQ6j8VVDQalROJScGokMzqWyktdaX5BybpeG5kJQYLvh2EQSGBc4bIlYMq2aBXHqx
	 tiagUXzO31Ixlb44LWYf80spWrCT+SKTGTRV0K296plm07PxnbxjxaFc59FyzcHoFiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7kw8OygI7yMxTRvDSeetgQqnwdpUHdMrP7zqyaWKQ8s=;
	b=DUIqLA8DsXDqk/4KvCBHfifVby7vSngugj8+aovt4u50vHMkh6QbKIPaBf9sZYbmitiC
	 jzpvV7hxnXs5jBw9rT/FPANzNb9zM241Y/6z5M3vQo4occELuqTG0EDyauyDNgc97jFlj
	 m7wl7oelWp5d5yK06GOkOd9/i5IV4rz3eQEdfxbWvRHWghJaOQevmOcnk6Z3Y89xaQ55Y
	 LYflM679wkLrBEDV55kXIQBd+bTzMuX+B06GceH47/AMac7c6rwnJwSakgLdFtO+Hg37i
	 ih4aq4tyukllF4g+HM/AlPdKcPjlqcQqi/Q6Myx78nxM+oueN8mqIHI7TFDfUy3bMzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ga1zOAMM;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAAB606A31E
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 16:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DAAB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ga1zOAMM
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so7519683eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 08:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760308; x=1795365108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7kw8OygI7yMxTRvDSeetgQqnwdpUHdMrP7zqyaWKQ8s=;
        b=Ga1zOAMMdUTmf0/e02gbatFJedn9Tn99lSwN35reaqR3Wv/so/P7ZbnKbuZX4EYc+F
         MpSNn/53eoLG0pNp6dNz+/P0E3wZazfzA1BeRAAHG23oPjKTTZ3PJESXXwUfyz5qsgz9
         lychR2he8YJjK81weoGfeXaN9FRmQzH/2g7A23rS63lIDSo10MX+j3m7P/1K1cWRZLoO
         plnitRqyMp43QRIlEjIL39Ibh0rApU3s4txg506JcHWkP4qSm0bQ86q8VoLqJWQAF111
         WqWViLqPWaui5sBNt/bqbiR1lURBA9kQ31ZQJ81MwVPRjcJ2CmghA53yFgMMfUwcdLqE
         6PDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760308; x=1795365108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7kw8OygI7yMxTRvDSeetgQqnwdpUHdMrP7zqyaWKQ8s=;
        b=EmCApohtG9t54DkQIOFMai1TFLX5cASEmIgzEHfKoO4wBs8O7/jJoi6JXgAxjOnUf/
         FIrbjYjZ3XreiDqBKy2XOxQQhkHWMAYH+FAllTbuTkcdPu+D50+bs/Hlp4rFvF8RbIDk
         5XEOqDsO5cHv/HfEHI1j9N8LxSjsDtbczhaW96X23OGwLyWQvKQXfIi9+gxeZlqBljz2
         raiMS+3H9EqurJ8+y6gGLGWrJ3Si5FuJNChPeTqwp9gPNs3XzQoZguBzZXYYf9nwAX5d
         9iebAUR1XjnfkBT9QMy2R5g/TLKoziZg1OawJHMv2W6jzaCgjXGqGXsqeIJuV63i0q0d
         lBUA==
X-Forwarded-Encrypted: i=1; AL+hErGW6zEH/zShUZ4X5kwkRlQCKOcU9Fvu/keZgfvOXSo6aMPaTQOTjOu7KUFTE4oBGucOYY9hjpXW2/UQ+AAAW9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tOmUiKbg2uXarKaOTN4Ewy5PTsvVHFZDKJhfwVKr+N2oVRBpS
	XLcbrYk0yZYgKNZro6Dss4SCzce8t6zqtjdRNdFkt9a5UJlcata7lHs/
X-Gm-Gg: AYBFou1Rw0b/mzF9SpuLSrU2RpCz7snz2e3i9GjyKeGs+WKZUzKAZOTKBtBAfeRufjb
	moYwTbif7AoSYHOHnoqnTWRL43NTSq4uOQOLnYNRBScZFgIU0ZAXpJBaDik4c2oEFMgI7Rg/nZC
	kaTMXHBRAbhETJOwTddVWxNn10X59lIcAnAQ3hIEhjAYRfmdgioQPtuBsmY45bhS8OdPOtHEDGj
	L5m5KrSlMOrdPP9RL1STZcUMtVgP1PWkwNIRHtiGty4qxiCDFWxaYJi0lv7FwOGusHn55JNIsmn
	6D7Si+4lFR5f5UxkvC+g3lZoHCCCm/9Ww9J9y/qpIeXh/p0sFh8jqyrC81v9I8/ZUs7mZddDVoB
	+GTPENY9Kyt7uE8YW4jaZnVgvacvdjvM7RxOZq8qo+gsx+YzKdtvQYw7HDdT0M2io2cwY6UGhlB
	EAmMRy48omA9SCKwm1fDMuQN1WCTQwEMiW5tbdU0sqjsf4ex4e6wrkrMpndHdlkBjtWoFC6HIb7
	zM6c+2vx3FszJVMK041uZuJU4AS71RgPiLelX/2eqpn0uUeTyXRUOnQ0NMPGzp5R+w7uLBUS5DP
	jKx7/8d3/KQoUWA3Dg0SpBDr
X-Received: by 2002:a05:693c:620c:b0:374:e25e:a533 with SMTP id 5a478bee46e88-37967cdd715mr10119668eec.35.1794760307511;
        Sun, 15 Nov 2026 08:31:47 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm27775320eec.28.2026.11.15.08.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:31:46 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net v4 0/2] net: openvswitch: fix a feature leak on a failed change
Date: Sun, 15 Nov 2026 11:31:32 -0500
Message-ID: <20261115163134.3202677-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The datapath records the user features before it applies the change, so
a request that fails leaves it claiming a bit whose reference count was
never taken. The first patch records the features last. The second adds a
selftest that drives the failing request and reads back what the datapath
reports.

v4:
 - Rebased onto current main.
 - The skip message is one printf again. Splitting it made shellcheck
   report SC2182 and dropped a word and the newline from the output.
 - The new tests say why they failed on stdout. info() writes debug.log
   and a failing run deletes that file, so CI showed a FAIL with no reason.
 - A datapath that cannot be read is reported as that instead of as a
   feature mismatch.
 - The outdated add-dp request is checked instead of discarded.
 - The errno numbers come from python rather than from a literal, and a
   lookup that cannot answer says so rather than comparing against an
   empty string.

v3: https://lore.kernel.org/netdev/20261110174651.972936-1-houminxi@gmail.com/
 - Cover the recirc bit as well as the dispatch bit.

v2: https://lore.kernel.org/netdev/20261108123424.2825403-1-houminxi@gmail.com/
 - Name the two paths that leaked a reference and fix both.

v1: https://lore.kernel.org/netdev/20261107113403.797779-1-houminxi@gmail.com/

Neither leak has a test of its own. The reference count behind the bit is
not visible from user space, so the tests read back the features a
datapath reports: the reset drops them to zero where a test can see it,
and a datapath freed after a failed creation leaves no state to check.

One thing this series leaves alone: ovs_add_dp() returns the status of the
last command in its body rather than of the add, so the `|| return 1` that
follows its calls cannot fail. That predates this series and every OVS
test shares it. The two tests here do not depend on it.

Signed-off-by: Minxi Hou <houminxi@gmail.com>

Minxi Hou (2):
  net: openvswitch: do not record user features when the change fails
  selftests/net/openvswitch: check that a failed set keeps the features

 net/openvswitch/datapath.c                    |  34 ++--
 net/openvswitch/datapath.h                    |   5 +-
 .../testing/selftests/net/openvswitch/config  |   3 +
 .../selftests/net/openvswitch/openvswitch.sh  | 173 ++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    |  61 ++++++
 5 files changed, 262 insertions(+), 14 deletions(-)


base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
-- 
2.56.1

