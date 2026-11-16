Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801350;
	b=lJpJ5hgjbEN4NLYTlCfVT1jvZFsqBdDoVioxo6Y50N2W9wGlEzAFGmXPQlqW4W1aZO2+
	 2yramG9XTO5eyYD8mtoLc4w2aTUa76EDUgWsAgw/A9YzgUJBHZmrvMosB/eh1ZL/ExVR3
	 gLJlql+i3/5asLnenIqKKdgKoXXLcGcG5eAHMx4aG/vhkDrBSp8T4qHJEoeWFoojgneka
	 0sGAACtn1D3DrjTLe38XOPeLaKD4H/0AXeouGQSBhvFHzV/Wu0st/rcXs5+hGia5E4oBu
	 M7kntGVI3LMoyz+KrEb+TLExlrcYT3MrZVx4H3HIJwCeK9UBvZ3eUIrStODxpAhtSXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vbQLcwmCCF7XaeF5c4vrB/idKigmQJEX9lEqs5PlpN4=;
	b=zBG0OZ/v5erTPc41Vq+rWP+bd4WTvKQOzrvlDi9I2xRNkR7dPtBomwTJTjBFMkU+k8Pr
	 Jm70orBpNLDLzX5B61GdAanayz+jT9TKJwIC/cAIHLoc2fkyBPDfgzYMCYL+QYqIXQY8Q
	 1mk4HH5bOzi1krCcxwPiRheKlfHvZSM4e+m9O25LhF9BjF4pivE8447SkGnQr1UKtLdJU
	 /oCjqRyx062grZwnOnTWQIRUJAC6vQ5qYtOttjTlxpUxscthM+AMGHuHwEZBDD1yg2h1U
	 8b84R6Y/M9nbYQOVli1l7XvjnO9WyAhy2sYmsWrekF9MQNn8vCDvsSZojKCmos7XvAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=hIoOL97Q;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAA2606A31C
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 03:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFAA2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=hIoOL97Q
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b600fae14dso1305820b3a.2
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 19:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1794801349; x=1795406149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbQLcwmCCF7XaeF5c4vrB/idKigmQJEX9lEqs5PlpN4=;
        b=hIoOL97QNyHYQkdAhQ+YC7y2JFMzE1n3pDZ/e0E/OvdAGlPrz3i6rhNFIGUdi7RczE
         GMTOsyWqHvdjs2GcZibBEWpQKDxNyNJia5J0I0FryZsP8qNNg7RLDp5YQvjXxX2MbJNb
         S10DYh9TLGCet858AOJBh6I6qRTYjuZGjpPZmErI+BqP3KnGcMyf2EDJ3f0Sau4uqGAR
         WYCMl4TGUAc23vuIT1YC3YMHmOTvp5nFVb7ZMkWlX/ZPfWcaSN20fHenHL1wqT3piPdU
         fWkQ2znHAf9K+QaR3Hn9v0MXyduvTDLyS+PJ3hu4NxHejSwMI91Cvxmzct1XzgQ7PL0Y
         2nZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794801349; x=1795406149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vbQLcwmCCF7XaeF5c4vrB/idKigmQJEX9lEqs5PlpN4=;
        b=pYXuWYT6NsqZ8BWxDbfvO/tONn8afylEQpb5FbZQ7CNVIHCRXhG4dcPimdVR2j+U3p
         fkWSDD4aDwYwonKWjuMft4WYlGjCg3ISWu59yjeXg3oDC5cAS88i98timOdD9KWkJ4mG
         Lq741gN2vd7WV/DZPwC/0PrM3Ssf7VKtB2cwrcXy/TfTXfTiCeWyrlu83dWBOagqawtC
         Q2k1OiZVVsU3PqcyQIAhdafBJ/5gpGzkVemHm9Lx6yz/zi0ayzm2jnTbdVGuseGpn7w4
         ttcymEI9eewd15Ru6phXfNxWrRtXXcVJbO2d7PXJxLy3CvV0r6oPaVokG9u586UkLIWt
         pZxw==
X-Forwarded-Encrypted: i=1; AL+hErF4v8Jwy0QkjMAn34LK8S9AAPmt9eDPKfT+pytTooQCJws2NJsZ1oa4nNSvB8UXyXHtP7FXa6VI/mVsWVS53pw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lKWsq8ge2uBz2O0FhG9o6xVX4yhx5MJDoJ6SXSKNtqyxTEzAD
	FBmllA9/i8Hnmc/UpuGW/m2evYAiE1mv+qTxde6Zn3JDKEmi+/VTI56Wlp6TxM/aOfi9
X-Gm-Gg: AYBFou39SqW/HrGt0kWOm5cQbB4OMpW1NbMYiDVVLa3m96Cf5tNHVR7q113GL7Of+PB
	QGou9X8Cal3SmFnDJPhv2xoIY+VoraoBxcsd6Fvd1egEXUrLw+aQZ9OzFJwu8TCVtH5Fwg0vRjS
	QBlCg9oJhTiK73GO8r8g/ZELTmLQCXoqLOrmQiqk+ZTLt1xtcWgRCiAl0ARnOS2hSsvfHh5WZlg
	bQCxKwMjGeT7b9R7z9NIPlouLYDo3jDG3HrRtrHyaSd52hf0kDSHzzSGPhd30gUoBLR7qE7Iu6v
	wZ91IsbLyvdeu2kFRPsGXQCenotejtzcz65XapDTwyzXh4W1ezFvo0pqVQ5fwRdEsuGDV4pxN99
	CxGqyfxRhd5Smu3tX5qN0kAaCrLzyiZyNbPC896f05kdcXHMl4Or0ZG9bKFiQf02iQ2d8nSsu2R
	ISvQbkSZo1bqmFBWfXQEaEEYxogivf3RQrIU7EzuA6MEXUaW3WF0QSHouqd9bgsw6M2CzhOJ619
	0p+xn3WTN/hfmCALnDqZBtbJZZYT85TNtuLg83fwhSEp0S0m4svtZnbEwiFYADnGFSmyUE8sZSx
	7OSUvIBc9Z+I9kx/hC1f1JHyMxo98YfOXrcbXqE5bbQ5dIXt1lJ58YsOvTQD3FNsLyJDiB+oPHe
	28iR5LgglStUkcnqyQ3is
X-Received: by 2002:a05:6a21:a382:b0:3f9:9114:8029 with SMTP id adf61e73a8af0-3f99114b750mr4751940637.90.1794801349237;
        Sun, 15 Nov 2026 19:55:49 -0800 (PST)
Received: from 24c857d0c3be.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1886b12sm3463176a12.11.2026.11.15.19.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:55:48 -0800 (PST)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org
Cc: willemdebruijn.kernel@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	benh@amazon.com,
	kuniyu@google.com,
	shuah@kernel.org,
	vega@nebusec.ai,
	zihanx@nebusec.ai
Subject: [PATCH net 2/2] selftests: net: cover connected UDP reuseport rescore
Date: Mon, 16 Nov 2026 03:55:33 +0000
Message-ID: <4302d941304941ea6059b3d1fa167236635686c6.1794759652.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794759652.git.zihanx@nebusec.ai>
References: <cover.1794759652.git.zihanx@nebusec.ai>
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

Test UDP SO_REUSEPORT lookup when a classic BPF program selects a
connected socket.  A packet from a different peer must fall back to the
matching unconnected socket, while a packet from the connected peer must
still select the connected socket.

Exercise both IPv4 and IPv6.

Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
 tools/testing/selftests/net/reuseport_bpf.c | 150 ++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/tools/testing/selftests/net/reuseport_bpf.c b/tools/testing/selftests/net/reuseport_bpf.c
index 12e48b97b862..fbfe73dce211 100644
--- a/tools/testing/selftests/net/reuseport_bpf.c
+++ b/tools/testing/selftests/net/reuseport_bpf.c
@@ -303,6 +303,154 @@ static void test_reuseport_cbpf(struct test_params p)
 		close(fd[i]);
 }
 
+static uint16_t get_sockaddr_port(const struct sockaddr *addr)
+{
+	if (addr->sa_family == AF_INET)
+		return ntohs(((const struct sockaddr_in *)addr)->sin_port);
+	return ntohs(((const struct sockaddr_in6 *)addr)->sin6_port);
+}
+
+static void attach_cbpf_index(int fd, uint32_t index)
+{
+	struct sock_filter code[] = {
+		{ BPF_RET | BPF_K, 0, 0, index },
+	};
+	struct sock_fprog p = {
+		.len = ARRAY_SIZE(code),
+		.filter = code,
+	};
+
+	if (setsockopt(fd, SOL_SOCKET, SO_ATTACH_REUSEPORT_CBPF, &p, sizeof(p)))
+		error(1, errno, "failed to set constant SO_REUSEPORT_CBPF");
+}
+
+static void send_udp_packet(int fd, struct sockaddr *dst, const char *payload)
+{
+	if (sendto(fd, payload, strlen(payload), 0, dst, sockaddr_size()) < 0)
+		error(1, errno, "failed to send UDP packet");
+}
+
+static void expect_udp_socket(int epfd, int good_fd, int connected_fd,
+			     int expected_fd, const char *payload)
+{
+	struct epoll_event ev;
+	char buf[32];
+	int n;
+
+	n = epoll_wait(epfd, &ev, 1, 1000);
+	if (n < 0)
+		error(1, errno, "epoll wait failed");
+	if (!n)
+		error(1, 0, "timed out waiting for UDP packet");
+	if (ev.data.fd != expected_fd)
+		error(1, 0, "UDP packet delivered to unexpected reuseport socket");
+
+	n = recv(ev.data.fd, buf, sizeof(buf), 0);
+	if (n < 0)
+		error(1, errno, "failed to receive UDP packet");
+	if ((size_t)n != strlen(payload) || memcmp(buf, payload, n))
+		error(1, 0, "received unexpected UDP payload");
+
+	/* No copy of the packet should be queued on the other socket. */
+	ev.events = EPOLLIN;
+	ev.data.fd = expected_fd == good_fd ? connected_fd : good_fd;
+	if (epoll_ctl(epfd, EPOLL_CTL_MOD, ev.data.fd, &ev))
+		error(1, errno, "failed to update epoll registration");
+	n = epoll_wait(epfd, &ev, 1, 0);
+	if (n < 0)
+		error(1, errno, "epoll wait failed");
+	if (n)
+		error(1, 0, "UDP packet was also queued on the other socket");
+}
+
+static void test_connected_reuseport_rescore(int family)
+{
+	static const char mismatch_payload[] = "mismatch";
+	static const char match_payload[] = "match";
+	struct sockaddr *good_addr, *peer_addr;
+	struct sockaddr *match_src, *other_src, *dst;
+	struct epoll_event ev;
+	int good_fd, connected_fd, match_send_fd, other_send_fd, epfd, one = 1;
+	uint16_t recv_port, peer_port;
+
+	fprintf(stderr, "Testing connected reuseport rescore, family %d...\n",
+		family);
+	good_fd = socket(family, SOCK_DGRAM, 0);
+	connected_fd = socket(family, SOCK_DGRAM, 0);
+	match_send_fd = socket(family, SOCK_DGRAM, 0);
+	other_send_fd = socket(family, SOCK_DGRAM, 0);
+	if (good_fd < 0 || connected_fd < 0 || match_send_fd < 0 ||
+	    other_send_fd < 0)
+		error(1, errno, "failed to create connected reuseport test sockets");
+	if (setsockopt(good_fd, SOL_SOCKET, SO_REUSEPORT, &one, sizeof(one)) ||
+	    setsockopt(connected_fd, SOL_SOCKET, SO_REUSEPORT, &one, sizeof(one)))
+		error(1, errno, "failed to set SO_REUSEPORT");
+
+	good_addr = new_loopback_sockaddr(family, 0);
+	if (bind(good_fd, good_addr, sockaddr_size()))
+		error(1, errno, "failed to bind good reuseport socket");
+	if (getsockname(good_fd, good_addr, (socklen_t []){ sockaddr_size() }))
+		error(1, errno, "failed to get reuseport port");
+	recv_port = get_sockaddr_port(good_addr);
+	if (bind(connected_fd, good_addr, sockaddr_size()))
+		error(1, errno, "failed to bind connected reuseport socket");
+
+	match_src = new_loopback_sockaddr(family, 0);
+	if (bind(match_send_fd, match_src, sockaddr_size()))
+		error(1, errno, "failed to bind matching source socket");
+	if (getsockname(match_send_fd, match_src,
+			(socklen_t []){ sockaddr_size() }))
+		error(1, errno, "failed to get matching source port");
+	peer_port = get_sockaddr_port(match_src);
+	peer_addr = new_loopback_sockaddr(family, peer_port);
+	if (connect(connected_fd, peer_addr, sockaddr_size()))
+		error(1, errno, "failed to connect reuseport socket");
+
+	/* Bind order makes good_fd index 0 and connected_fd index 1. */
+	attach_cbpf_index(good_fd, 1);
+	other_src = new_loopback_sockaddr(family, 0);
+	if (bind(other_send_fd, other_src, sockaddr_size()))
+		error(1, errno, "failed to bind non-matching source socket");
+	dst = new_loopback_sockaddr(family, recv_port);
+	if (getsockname(other_send_fd, other_src,
+			(socklen_t []){ sockaddr_size() }))
+		error(1, errno, "failed to get non-matching source port");
+	if (get_sockaddr_port(other_src) == peer_port)
+		error(1, 0, "source ports unexpectedly match");
+
+	epfd = epoll_create1(0);
+	if (epfd < 0)
+		error(1, errno, "failed to create epoll");
+	ev.events = EPOLLIN;
+	ev.data.fd = good_fd;
+	if (epoll_ctl(epfd, EPOLL_CTL_ADD, good_fd, &ev))
+		error(1, errno, "failed to register good socket");
+	ev.data.fd = connected_fd;
+	if (epoll_ctl(epfd, EPOLL_CTL_ADD, connected_fd, &ev))
+		error(1, errno, "failed to register connected socket");
+
+	/* An unmatched BPF-selected socket must not replace the valid candidate. */
+	send_udp_packet(other_send_fd, dst, mismatch_payload);
+	expect_udp_socket(epfd, good_fd, connected_fd, good_fd,
+			  mismatch_payload);
+
+	/* A matching selected socket must still win the positive rescore path. */
+	send_udp_packet(match_send_fd, dst, match_payload);
+	expect_udp_socket(epfd, good_fd, connected_fd, connected_fd,
+			  match_payload);
+
+	close(epfd);
+	close(good_fd);
+	close(connected_fd);
+	close(match_send_fd);
+	close(other_send_fd);
+	free(good_addr);
+	free(match_src);
+	free(other_src);
+	free(peer_addr);
+	free(dst);
+}
+
 static void test_extra_filter(const struct test_params p)
 {
 	struct sockaddr * const addr =
@@ -469,6 +617,7 @@ int main(void)
 	setup_netns();
 
 	fprintf(stderr, "---- IPv4 UDP ----\n");
+	test_connected_reuseport_rescore(AF_INET);
 	/* NOTE: UDP socket lookups traverse a different code path when there
 	 * are > 10 sockets in a group.  Run the bpf test through both paths.
 	 */
@@ -510,6 +659,7 @@ int main(void)
 		.recv_port = 8008});
 
 	fprintf(stderr, "---- IPv6 UDP ----\n");
+	test_connected_reuseport_rescore(AF_INET6);
 	test_reuseport_ebpf((struct test_params) {
 		.recv_family = AF_INET6,
 		.send_family = AF_INET6,
-- 
2.43.0

