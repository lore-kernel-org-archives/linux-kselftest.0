Received: from mail-wr2-f8.google.com (mail-wr2-f8.google.com [74.125.225.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA64407597
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 21:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790976329; cv=none; b=fPFwi93yeoY1HXkcbh+5jLojCDIbpi1pf4QQEs2+ATOlfZgcIepATtrywEiAIqJBGCCEygKf2vJpbF82MdNdFJHnfxS14Mvmz0vTb7ri3JscOiTztCuyPEfqmMmI7vRnFrkPumvL0ktct8LTvW+BR1ZaTFHOHzJkY4XpbxpCoyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790976329; c=relaxed/simple;
	bh=9aWfK60Ckds4L/biCInfmc5Y+mPQ3yBYOZ7PLGxJJso=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n3u6eFoA7OmxQs9JZmJRiXFruGRyClkJXV3G7rD11Ev79iliUoubE1FL9CKiXUUR9z7DS7d0a6IId7BU4pp8Vk800JNRiViYZOau8Ru6TYG0w7ne8Px3cVpTmti4JgwH+ZzPj7IPnQkgkqiz1oWCSnaxBf1uGbfslIf5CM5lvVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=Isa/r3hK; arc=none smtp.client-ip=74.125.225.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="Isa/r3hK"
Received: by mail-wr2-f8.google.com with SMTP id ffacd0b85a97d-48b02aab050so127596f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 14:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1790976326; x=1791581126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwz5V5DznazyEKiv4IPRIgKMZcVLA06YApkEuH5pcPQ=;
        b=Isa/r3hKxdf+jbnew8xlY8wzTq4bpyJoy0lAGFL2byOsYtHoFVznWAbfpmfweCTD9O
         +MGjMpzvFevkmghNTD8mlea4Bf69No7s/HOpwpQcTkcWXQlS7EJJhhAxpPwDppsk9tHF
         gYW0jWwCZRr9BM6zcUY677hcLoDd5ytoK07SBpb/0MskHEkr8n+WB/91paiFf8hffFaW
         Wid6tofro2snMaBm1Er09oaPji/lMgDRtQNaxgDlshVee3520wwFp260qAiSvbOdqqSf
         RiFE4GxQKf0CYNLK37lXDfItF9wZQVPA0TvpVOGcE41lkg/VQK7aF5nDnHbOe6G4eYbV
         XN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790976326; x=1791581126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwz5V5DznazyEKiv4IPRIgKMZcVLA06YApkEuH5pcPQ=;
        b=q5YZt1kQmvBhy9JMykDgpJ55ebEqcQGN6KNwxFos2xynnltSNieNjejcpzDOMoIxwz
         OxxjHyF4EjjbpJEl0rjex+KtX5IzZE4i/wuH0I+fiJkHRza1iv1d1yTXBEnicRwGKwMc
         3NQFQxzBqTtz7YusPQmC5J39lMKbhCg66YILpkKr5veAj48WAOdjCQ0AwKZ7TjEINNZY
         UfaPsqhV/FNVCQO09lOi4lLEtbHLd+8eX3s6iV/g9Pfd3Ojf/7/05lYGtkwcqPsjz5q1
         U05ZAztIDUTFNRzJL7dD0oLb+SW+gm4ISc73IJFZF1DwJwBDxATJx/Jg4ZoXhgb7neJg
         IDIw==
X-Forwarded-Encrypted: i=1; AKwUvBzu4EyZVHv8MtscxWd9kvR8n6QDpScDeue91pCCh4WrzT5FvkF8Ecw2/guQ43pL7NPKQbYC0HhAbiFEPyvmUHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ncLyxSycFag872NEMOrbbsS0ryn/WyfEM0my4KQJ/jMwhFPRbX
	JATmF7ZrRGdFZ0UGdgipQuoFvLXZmGK7OIQG/yCqUwn9Ok1zfBz0quyvpSVQNH/uGFo=
X-Gm-Gg: AYBFou2oiTAiVOSMo5/EvwUUjmx3mEVQ6ggS3PCo4cBHTjXqSLvyX+IEQSLhOxB/l2e
	Q7yNBGz2z+2DsTblAyt1j9rQWasOUtW1iKmC1j6aGufQluPJl01pZXyWdMGKMdBqe2po5YTihiI
	AWHcHTN8KX1c5EqZfOsi2CjGjVbON9MT8ERhDEe+GA5gVD2Nx7QzrZnoxuYvwCkqbGVgoUEkGSx
	7giCjnMkAxMC0rFE5ui0NkCPX6WFGPdWNNOPmX3iemzmq4WGtEc60uaG0Cn7MUVEm1Fs6ONrNL2
	9vVy1TkDUnzWNRGnT8ci60v/QqRpujvoXon27BlYoJJ/7vR+f/oiI7lgwf8WL2Yc4PooWFF6VmY
	DxYq66s3miG6zDhBLET/C5IVKJQWqLdKnU85Nvhcx8kfIIsOCJ2FaOgwcI8iPp1ub/aVzHUlEe/
	nWGBzeUQSC6a4/UT9+F8KL3qartrBFyqGSEdVi8fICuGme5FYuU3h3RmomXYrecAz/LKzS35xi9
	uBqCVE+RwBuS1Q7/mbgub8JaYgSWuh7RG4hwyMYfCvwEB6whP0yh/6FeXq3JbSQx41P7Q953pv4
	2w==
X-Received: by 2002:a05:600c:4f93:b0:4a0:27eb:49b with SMTP id 5b1f17b1804b1-4a027eb058cmr61869705e9.30.1790976326117;
        Fri, 02 Oct 2026 14:25:26 -0700 (PDT)
Received: from localhost.localdomain ([197.51.72.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253ae9sm7183149f8f.2.2026.10.02.14.25.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 14:25:25 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/2] amt: mark relay data as a UDP tunnel packet, with a selftest
Date: Sat,  3 Oct 2026 00:24:56 +0300
Message-ID: <20261002212458.34247-1-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amt_send_multicast_data() never calls udp_tunnel_handle_offloads(),
unlike other UDP tunnels. With tx checksum offload on the amt device (off
by default), a UDP_SEGMENT burst through the relay is dropped before
patch 1 and delivered after it. Patch 2 adds the selftest.

This follows Eric Dumazet's suggestion on my withdrawn [PATCH net] "amt:
do not offer software GSO on the amt device":
https://lore.kernel.org/all/20260928181554.85766-1-omar@blockcast.net/

Not touched: amt advertises NETIF_F_GSO_FRAGLIST and skb_copy_expand()
refuses such skbs with a WARN_ON_ONCE(). I have not reproduced it, and
it would be a separate fix.

v2:
 - shorten the changelogs, add Suggested-by, and move the testing notes
   below the "---" (Eric); patch 1's code is unchanged, one comment is
   corrected
 - patch 2: fix the shellcheck and 80-column checkpatch findings reported
   by the netdev CI, skip when AF_PACKET is not available (v1 reported no
   result and exit 0), add CONFIG_PACKET to the config, drop dead options
   and code
v1: https://lore.kernel.org/all/20261001171016.88208-1-omar@blockcast.net/

Omar Ramadan (2):
  amt: mark relay data as a UDP tunnel packet before sending it
  selftests: net: add an amt test for UDP_SEGMENT through the relay

 drivers/net/amt.c                      |  10 +
 tools/testing/selftests/net/.gitignore |   1 +
 tools/testing/selftests/net/Makefile   |   2 +
 tools/testing/selftests/net/amt_gso.c  | 457 +++++++++++++++++++++++++
 tools/testing/selftests/net/amt_gso.sh | 269 +++++++++++++++
 tools/testing/selftests/net/config     |   1 +
 6 files changed, 740 insertions(+)
 create mode 100644 tools/testing/selftests/net/amt_gso.c
 create mode 100755 tools/testing/selftests/net/amt_gso.sh

-- 
2.50.1 (Apple Git-155)

