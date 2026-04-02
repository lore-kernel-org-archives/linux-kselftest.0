Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39243386C27
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 23:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775172163; cv=none; b=QS4ad3yc2e1G+BDhv9gJE7VuccnYkmSGjdbzhUE14W/w2TMhagqRtZ3vy152Ugz7Yfm9Fmt5XGU/WNDsH8CcjmYwS3pdhd1y/d2XJMY9+/nfRCry/x3WfVh1kzLsuxRpF+sn57tHxSormnene5xVVCOGIRZqIcblH1uDShGivWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775172163; c=relaxed/simple;
	bh=J4kk90yuxxA42SHtt+Ov+rBowYEAkbWXfw9oGJun+BU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=snrWt+5z9WC3jdDUd6EUbl/sG9dirwWTE7btY4EyqQdk0hy4TkIbLp5/Bq1v13IwpjXMobXW6Zh6pTU4Kw0NAArZaOunkI+DNpyCdey7gh3nSTb15ae6XGKoBhqcz8lDzYjSdbMjKe+dlPzXSMbjUPWZfPjmCZXMfalogAtDeqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=L5mvlOXp; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="L5mvlOXp"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82d0b68837aso247804b3a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 16:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1775172161; x=1775776961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/znVnDeXjnXzaaF0D3QPKaN1Wp2D3MlfOCy7zxinTk=;
        b=L5mvlOXpo9GuRB05+CefSLJG3fY4naXPL3ScsMnISrrTzV5IQMMMHvlhhVWX3mGemi
         nJ4jis/WGryHwy968WFzyeeKdfHO4W5aZpmrev7AErr3CPuTBECIUA8sR352izBCJrXT
         VbGvS3iw6RfqkcpxORbYnUcitgR4OwNpP3BT70th6YB+3AZ0MeEg/shCpGj7+douarjs
         tFTJKZ+fvb+WstHQ++LeMFS/xGOOLxx+/BrHG9PdiK9F/e9dBQkGgtZsDjwAg53MnH08
         tkeuwK08ztU1Pnw6BwTPwq9SMojKnGtHbxREPdUB/iNOYQStaD1GZdMecGR0183ZI0eQ
         orFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775172161; x=1775776961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+/znVnDeXjnXzaaF0D3QPKaN1Wp2D3MlfOCy7zxinTk=;
        b=CmE4ngKk5MzUKlcce8zpLCq15xgsJE9DrK9OwYuqP2SFiRHm1+DUG/YVn7phA5Izox
         dCwWMoJjNLXsI0Q7bZqt0B62jen2/YKrXp+OW118klnnVlg63eH+Jy/3kv1rGNRMKqG6
         XSBE+oTAMiHtgLTcML2mtQ0cL7wkODBKEAAWO7Krfj6nETHCl8bUpmVCahnCKHDs8pa3
         4eBQnPOMVcgxnYMe1+ei3Pr2NkpodnSCpRp+CDX/QOgVIjfp03u+sQtDvnrMJ+D12pRG
         509SmIgLjSH8m2XbKsYVRzaYLZPY7P6RK1HlHk6Ots0CsPh2dmMTckb90b3Q8Nn04y38
         YjuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDfj1glgpZNofCvMrsBP2Eg4qPMkLrYK+ZrKBfl4lRwsxZf51Ui5SAFF6XAAYeWtnHAU8Ulg5qXarFHlGoe+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQO/FqLTbj9TICoO+mKy0jdjE5dto6T93/n5XeXGyu99IUsWXx
	FNR4WzeAeROil8wjYBkqq+ejyhO1FI1k7VeUuGT7F2S9YLQmSDR/z/W2bWtG4QVtFvc=
X-Gm-Gg: ATEYQzyA8gh6HsCYXkYxiHJ7TGUrBxhy12ZvhmGk24eGa8HOG/O/Is/xbJfNkYwR5Ns
	sYlK1DCUfeEhJsJY7JBf+FVTeU8CIlyMTo0tM1BHL8ZHynvZIu2bFL0q2AxHDH8EtvQ5tcSXA/c
	SjovsNqX0TZGDhXD5alrPTg2Zxj+8mKwyzEq5n4IvyjO4delu0TqMTNICJK32ci9vulJLqiX0re
	aS/OP9irznvTSuE8+9eBOQcDwlSQUXm4DL1/1Kso+Q3GqEh9al7Nea/SHSoaKC+VYjmhMOOb6UY
	aO8rYJxCy1lAWCGudJtsHrHlK0AQMNES8TRL1QoQC3AiF542mRwntOzHcXZRMRsRr5K8WpT4S5U
	9oNdYStHRxQ4Y9gPuuIhaEE2fN1rjoKWejywuGHedkOZ/j7WOnM8RYkUZnhILC7qTjHKFX54nYY
	GQ5UJa
X-Received: by 2002:a05:6a00:2d18:b0:829:7b0f:c9de with SMTP id d2e1a72fcca58-82d0db4f7efmr788927b3a.35.1775172161583;
        Thu, 02 Apr 2026 16:22:41 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:49::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b27313sm4052568b3a.5.2026.04.02.16.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 16:22:40 -0700 (PDT)
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
Subject: [net-next 1/3] selftests/net: Test PACKET_STATISTICS
Date: Thu,  2 Apr 2026 16:21:57 -0700
Message-ID: <20260402232203.2004496-2-joe@dama.to>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260402232203.2004496-1-joe@dama.to>
References: <20260402232203.2004496-1-joe@dama.to>
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

