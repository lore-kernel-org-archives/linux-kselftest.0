Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE34C34A790
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 06:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773730314; cv=none; b=Dls2c8tFgXMADUmFDJ+5yW48WoD7Yzt4WBT/7Pl/zsEx3FeOXoFom1xzUg9IY6CK2PI52jjfaxJ26bFPrNSvhopruQYlw6YPXFuheRLX4j0VKULNWQ108QV/xXpRmvkgnWFOjuJw+Kd82QtT4gk502CJa7SNMJTF4kFZj/T7hVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773730314; c=relaxed/simple;
	bh=r4HeCz/IRpYcOhG+YpKz/qws21aUNL7YkGF4PVZ+KWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TSSMjLrByHe0yhXKNZ/WtB0G+9lYhUP44DWB68Q9WqBvzxqB7Ol80pk3+9ZgEtcGz8kfvK3MV15QSVTcPBE+YasAgDjv11mWh1Czh2Jf3yWkay6bbCtiXIRQNDifez8KxZvSUKtDxwWEN1XXZ6BuOnHi2mIqCoXEjNTBKhtRgdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDk4M7Iv; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDk4M7Iv"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d75d698ee6so2999858a34.3
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 23:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773730312; x=1774335112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyJZWPy0C8gtfPznUNGUjC3oIzSMZL+cyuAhRIUmyqg=;
        b=FDk4M7IvGbZ1eMBOfUi2JkSo/tHUAPn3aufZgz33Kvau7n1EoHmeK1mpHVazOmZERW
         LeoA9oY3CpQAovTZNpmdzct0hWKsBVbYHs9EBJ7K8sSJVn8ttOu1lTGevSUXKj+VQID7
         VDqMo8iVoMKdMU/CBcjf+8TX6ceS+hBCNhE2jxXj9zbgm9sS/d03sR1Jy+stbI3YUBhI
         v1tf98JP2QMw/YCjqxJvVj+8kPL0lJTen7MgyRSxUhqE9ui63KQcMkRnctmGMd5ZrFiM
         +Wz/M6CX1BTKOwEp2CFlSBgbKcxcZgCP4VQWydRbAh4Qn9JoyG9SKEiCtwTbcK/Cn16l
         GEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773730312; x=1774335112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iyJZWPy0C8gtfPznUNGUjC3oIzSMZL+cyuAhRIUmyqg=;
        b=aSrc5DkGxBmmss6kH+U1HnTW7lRL+fwoTMAFqLoWpHlOzqfR3MAopHPT2VRVaxqOwM
         w4BBniidR2ENMfDncCbeUscuQBJ0YGzrT5/yW1axaz/8s3Xk9aBjBK1vuTzBle8cbOAb
         k/m9Zr/duKEwc7B17zNn+YS8MeTdcDZSqnVrRmf98I4Xm525L3Rce1rRDNQO+ltUXdfj
         DtaH0Qm/+aQV8h3XIejXJHkVN2hAfSrWm7WT0Flv1ZEp8cX7OvFI4rbsbcizwiYYDG29
         T6LW4fIGomp3sj1Wwggx9sc++rUiJKo2M6Fn5PC8vP73OnaaHag4RmdklFmbAFptcUlK
         jSWg==
X-Forwarded-Encrypted: i=1; AJvYcCXgL4DY0n/m6bj0xhD+Z+J+17GmZreprbnJqL5pL1p6fCH9vafquOO1YEef3xI3ZWaHXymdNso7iya/s2BsfQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YweoTi9kaqTmVAvMnS1RpURdWqz/8Xwqj+9fsklOM+jmUPGupon
	ud4dhIa2Gh2efcVghfGjjKcpdWFc7u3WBNUK3+sOwW5ISFZ7MrDTjgTP
X-Gm-Gg: ATEYQzwabICw4/vjf3BZctcYWDqsulCkulP1Z0KvzVD0e8zVu+Sq80gfAPtx55XfmO8
	2khV+BgBypuceGsswH65v8v8hqmUaCHPEHAlCDr5rtriyhsHH3K98qTGjBAzsy7Hv6xpGGA3hRI
	owLO2IULYjhmRvkdT4cugr8InAGT9OGVu+BZ2LE0V31zBCoBNiBBi+MS8w8zgPZwwxSpIgBiRBA
	bvhZ4U1dWnPQqNpb65zk0+YqRKLFeKlpxfMkl331hXMm+P7zu97PGGEXHBAuoWyZtkb/eu5as/2
	kX2XV3nVLX6uSTqsaZF24LY4F75t1gNoqTwSownt3C7oDUAVkqL5uktz4IoPFED0pQBJvL0oZYL
	nm0dmAmTUs2rmOVS9SkpCqF78J8Q8+irR2xbWSLY0JV7uVH/LSvR/3WHIZZ/r+Qzk5gbxC6eIIs
	7DVzH07yG0MCgrAGG4L7otI5mz9HEuU+HDG6Orf6Tpx9v4gwQiYPftRH2auZeAKFJA1AXkkNMae
	7lYQt0MG86YoPjjaIW6TyqFSTL5FxeM6fnFFCFY4g==
X-Received: by 2002:a05:6830:700c:b0:7d7:5405:193d with SMTP id 46e09a7af769-7d7825696d4mr10566630a34.24.1773730311701;
        Mon, 16 Mar 2026 23:51:51 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d76ae68a4bsm14058432a34.19.2026.03.16.23.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:51:51 -0700 (PDT)
From: Wesley Atwell <atwellwea@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	davem@davemloft.net,
	dsahern@kernel.org,
	edumazet@google.com,
	horms@kernel.org,
	kuba@kernel.org,
	kuniyu@google.com,
	ncardwell@google.com,
	pabeni@redhat.com,
	shuah@kernel.org,
	Wesley Atwell <atwellwea@gmail.com>
Subject: [PATCH net-next 3/3] selftests: packetdrill: cover scaled rwnd quantization slack
Date: Tue, 17 Mar 2026 00:51:37 -0600
Message-ID: <20260317065137.1533226-4-atwellwea@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317065137.1533226-1-atwellwea@gmail.com>
References: <20260317065137.1533226-1-atwellwea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a packetdrill reproducer for the scaled no-shrink quantization case.

The sequence leaves slightly more than 84 scaled units of backed credit
after one skb is drained. The buggy ALIGN() path rounds that up and
exposes a fresh extra unit, so the wire-visible window becomes 85.

Then queue a tiny OOO skb so the next ACK re-runs the no-shrink path
after a small receive-memory change without advancing rcv_nxt. With the
fix in place, both ACKs keep the sender-visible window at 84.

This provides fail-before/pass-after coverage for both the immediate
quantization bug and the follow-on ACK transition that reuses the stored
window state.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
 .../packetdrill/tcp_rcv_quantization_credit.pkt    | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rcv_quantization_credit.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_rcv_quantization_credit.pkt b/tools/testing/selftests/net/packetdrill/tcp_rcv_quantization_credit.pkt
new file mode 100644
index 0000000000000000000000000000000000000000..8ea96281b601f2d161cfd84967cad91cedb03151
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_rcv_quantization_credit.pkt
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+
+--ip_version=ipv4
+--mss=1000
+
+`./defaults.sh
+sysctl -q net.ipv4.tcp_moderate_rcvbuf=0
+sysctl -q net.ipv4.tcp_shrink_window=0
+sysctl -q net.ipv4.tcp_rmem="4096 131072 $((32*1024*1024))"`
+
+// Exercise the scaled no-shrink path in __tcp_select_window().
+// The sequence below leaves slightly more than 84 scaled units of backed
+// credit after one skb is drained. The buggy ALIGN() path rounds that up and
+// exposes a fresh extra unit; the fixed path keeps the sender-visible window
+// at 84. Then queue a tiny OOO skb so the next ACK re-runs the no-shrink
+// path after a small receive-memory change without advancing rcv_nxt.
+   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+
+   +0 < S 0:0(0) win 32792 <mss 1000,nop,wscale 7>
+   +0 > S. 0:0(0) ack 1 <mss 1460,nop,wscale 10>
+   +0 < . 1:1(0) ack 1 win 257
+
+   +0 accept(3, ..., ...) = 4
+
+   +0 < P. 1:10001(10000) ack 1 win 257
+   * > .  1:1(0) ack 10001
+
+   +0 < P. 10001:11024(1023) ack 1 win 257
+   * > .  1:1(0) ack 11024
+
+// Free one skb, then force an outbound packet so the current advertised
+// window is observable both on the wire and via TCP_INFO.
+   +0 read(4, ..., 10000) = 10000
+   +0 write(4, ..., 1) = 1
+   * > P. 1:2(1) ack 11024 win 84
+   +0 %{ assert (tcpi_rcv_wnd >> 10) == 84, tcpi_rcv_wnd }%
+
+// Queue a tiny OOO skb. This should not create fresh sender-visible credit
+// on the next ACK after the first post-drain window update.
+   +0 < P. 12024:12025(1) ack 2 win 257
+   * > .  2:2(0) ack 11024 win 84
+   +0 %{ assert (tcpi_rcv_wnd >> 10) == 84, tcpi_rcv_wnd }%
-- 
2.43.0
