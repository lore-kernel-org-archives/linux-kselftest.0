Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3D43CC7D3
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785255005; cv=none; b=g6bp5wh/t6J5Fcd5dqcfobVsSU8/ZU6BmP3fVbgbkUpZgsd2PqNFqGe3JgDoGJtCmM5ngMDnEGRzbPJ6tz/VtLtkXAkrylWAcQrDoF95Py5m+8q/G9YyKeKZ7C4X9Z102GfiaRCB3GH8SNRx1tsfJJ/DfeaBx6GEtA3j6arhXXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785255005; c=relaxed/simple;
	bh=N0wg7mFoykZMR+qCLMWcv1TjeWrSykKHKXS77ThXo9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmKjvKCTYvMUv3ouL4b/Cxat/tspAoqcqoxOd693r4iP4iUl7JTRj9SYcowD6q6bop27CeandgQLtizTrK7pC2W8vGfH01f4wmP9O4dArMDp9gM/QUzBl8Qaz8ZRHzBhLEe9b2zVHbIvb39bqJQD7A7LDNpPEpGo3wZ3HeL/k2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=vN4XM+wT; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="vN4XM+wT"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cace91f112so929635ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 09:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1785255003; x=1785859803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2c1LdkzfayYKy1So3RR2qY5zFyV6+EB1Mt91oezqd3g=;
        b=vN4XM+wTgiA3NatFvXAWZljos3C/CaJWKPXIw8v+yTCtwhclDTMDrANJFnlUrhVBfH
         8ZQvDDvVw0lUhBi6deySAZVvRn6gonParu+M9Gh29PHTY8wJbK5g2V+KlNXh4baHZ/7u
         vckolR9PrWGRrCY9wg5NDV9Qgn6nwgocGQNZrz9N4vAL+kEaFKbqyYFdnQLR6ZXieLQf
         aN+zeKEzaEd82oGnSZhEyh7bujG49Bezo/sDRtO5L6cbXwfQPCmYAhjfASIoKzMTs1v3
         Fep/lHR2769k0UzOjkTcPDNdK2+rSpcG8b5P7jCskL/LKahbX8CWr5sO8VpzRZsK39Kr
         YNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785255003; x=1785859803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2c1LdkzfayYKy1So3RR2qY5zFyV6+EB1Mt91oezqd3g=;
        b=AovjpZo8Zre94KXMusgaP5NQ2Zl9JQ29Pdc5nzevqe6wYYcEp6QvrInl0f368D/D7r
         PBpeVRT6eg+QxuuviBubLq3aLeV9Pviuvk729mj92cJtvQkTYQaaJUwfMg9DHhVF4Mlv
         FdeEDc4AKbnGvLpvr96r+a1hVCXfQbmDKqH7oN1Cilm6dhouXzgfoanaQl6MIoy71+GY
         EHV29ixSG3phWUijdfgKOQvqjXx51cjnYqbgvmkYRnXkylCMWYTucKX1+PCjxCXmF6Ez
         Zq23dlX9W8ng7qfwFlavomYnNp24G6MJBz1VCjQHkIj/Dmnt6LiydTSb0pyKti1YLYRf
         petA==
X-Forwarded-Encrypted: i=1; AHgh+RpHG/dnWuGrTGpbi5QWX1ShUTOAfKo/omqeA7FTIkMSJs1GTerMrO/QK1BSfE5PTSsbqJ0dgJMqpFnE0f+rNx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO2uTJTpYPmVRfevCGgJdgyocIquaonVQByRHvuA2EAFBLGkdp
	Lz37yiKTdS6wbBQfqBDymG4f/ECXVF2SK5MJQpb/qGv41uc645lgXrZLxfXxxglPLs326MdXTDq
	S18KbrnRZkQtz
X-Gm-Gg: AR+sD10u7+vcypNSx49VetnbbOSsnYTEq9sbiy0P88ls0+Abp3+tHQF2vsA/mHgWSz4
	JXd3WzMkPatQISGldgI9/ErXR2xhstKk4f8Ef7euRs9o6JrnCUxFgV+nih6avfPCiWXd3XEN33Y
	CzpMvyYfp/94fCq6OLT2D/6XR4Z0rFttde7f8/v+wdhCZqVZfehyuRvLiM6Kfxoq6IKhknGku8S
	qKkRt8rVenrvsRVkIj5mxeeSqfru6lfy7q5TlUSJ6V+d6Zq0+afuSSwbcJqrziy8wQSDsal7kK5
	iBT+KFqhzdcFiIP8Rk0i6q4XxPIsj2SBh2C1R0SjNXGOqSDMYSljeutn/t2NF4zTLk4I+EWffwb
	hsVoNiocJkpWxbHUmRcYDJN2MWzsVHQK1MAvLoMg7VR/TPMzk5UCr248MdIFIBQ8p+GR6
X-Received: by 2002:a17:903:1b2e:b0:2ca:cbfd:7311 with SMTP id d9443c01a7336-2d015ed91efmr34673335ad.46.1785255002564;
        Tue, 28 Jul 2026 09:10:02 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:8::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7f4420sm54470355ad.66.2026.07.28.09.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 09:10:01 -0700 (PDT)
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
Subject: [PATCH net-next 4/5] selftests/net: psock_snd: Verify sll_pkttype
Date: Tue, 28 Jul 2026 09:09:29 -0700
Message-ID: <20260728160935.4128982-5-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728160935.4128982-1-joe@dama.to>
References: <20260728160935.4128982-1-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend do_rx() to take an expected packet type. Existing callers pass -1
to skip the check.

Signed-off-by: Joe Damato <joe@dama.to>
---
 tools/testing/selftests/net/psock_snd.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/psock_snd.c b/tools/testing/selftests/net/psock_snd.c
index b2593daca603..f23877942ea3 100644
--- a/tools/testing/selftests/net/psock_snd.c
+++ b/tools/testing/selftests/net/psock_snd.c
@@ -310,10 +310,13 @@ static void check_aux_data(struct cmsghdr *cmsg, int expected_len)
 		error(1, 0, "cmsg tp_snaplen != %u", expected_len);
 }
 
-static void do_rx(int fd, int expected_len, char *expected, bool is_psock)
+/* expected_pkttype < 0 skips the sll_pkttype check. */
+static void do_rx(int fd, int expected_len, char *expected, bool is_psock,
+		  int expected_pkttype)
 {
 	char cmsg_buf[1024] __attribute__((aligned(8))) = {};
 	bool aux = is_psock && cfg_aux_data;
+	struct sockaddr_ll saddr = {};
 	struct iovec iov = {
 		.iov_base = rbuf,
 		.iov_len = sizeof(rbuf),
@@ -328,6 +331,10 @@ static void do_rx(int fd, int expected_len, char *expected, bool is_psock)
 		msg.msg_control = cmsg_buf;
 		msg.msg_controllen = sizeof(cmsg_buf);
 	}
+	if (is_psock) {
+		msg.msg_name = &saddr;
+		msg.msg_namelen = sizeof(saddr);
+	}
 
 	ret = recvmsg(fd, &msg, 0);
 	if (ret == -1)
@@ -341,6 +348,10 @@ static void do_rx(int fd, int expected_len, char *expected, bool is_psock)
 	if (aux)
 		check_aux_data(CMSG_FIRSTHDR(&msg), expected_len);
 
+	if (expected_pkttype >= 0 && saddr.sll_pkttype != expected_pkttype)
+		error(1, 0, "recv: sll_pkttype %d != %d",
+		      saddr.sll_pkttype, expected_pkttype);
+
 	fprintf(stderr, "rx: %u\n", ret);
 }
 
@@ -492,11 +503,11 @@ static void run_test(void)
 	/* BPF filter accepts only this length, vlan changes MAC */
 	if (cfg_payload_len == DATA_LEN && !cfg_use_vlan) {
 		do_rx(fds, total_len - sizeof(struct virtio_net_hdr),
-		      tbuf + sizeof(struct virtio_net_hdr), true);
+		      tbuf + sizeof(struct virtio_net_hdr), true, -1);
 		check_packet_stats(fds, 1);
 	}
 
-	do_rx(fdr, cfg_payload_len, tbuf + total_len - cfg_payload_len, false);
+	do_rx(fdr, cfg_payload_len, tbuf + total_len - cfg_payload_len, false, -1);
 
 out:
 	if (close(fds))
-- 
2.53.0-Meta

