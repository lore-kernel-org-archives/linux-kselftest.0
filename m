Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7597D36E478
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 04:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783398305; cv=none; b=LZIK9DS5qheeDAQbY9AHlc8ckBkOLWRw8s/f1isylxWKytrUPERPp+PaYKKRNXUlGD/sZA8wIVGFjJs97TTU6AyMYED+ZBjU3ftSy2ix9t4B+t3qTvlD+CtITIBG0kFD6w7oaF5Z8PZt4nS8OEOtBchl6uGEm7rcFjMNXkMe+dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783398305; c=relaxed/simple;
	bh=iS2xaF3MfRcDZQfxihJlRs2HNvbT2UjiWs65evAkupI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ua8/5Jw7iheEGcKW7vYcuPh4DgUhfXZ9oLNHK+ZvyNQ0M58MeA5W4YKiC5R9M7i419Q9lhxKF1IqldCr2KOwgKRD/YJUlWLYxzl0nSl8kexguSJ8tkXygve8ffF7wNkIVhZQAPAas0bRI7QikSnG3yFvXxlLyhbLzCmH/f/uMRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co; spf=pass smtp.mailfrom=rbox.co; dkim=pass (2048-bit key) header.d=rbox.co header.i=@rbox.co header.b=UA7grwvG; arc=none smtp.client-ip=185.226.149.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rbox.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rbox.co header.i=@rbox.co header.b="UA7grwvG"
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <mhal@rbox.co>)
	id 1wgxMa-00DUhW-PA; Tue, 07 Jul 2026 06:24:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rbox.co;
	s=selector2; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From;
	bh=N7suj9lGfY/+0u6hiDQfJtAVJa8d0udKprWW7Vg2L/I=; b=UA7grwvGERVJ4Wxg6WpbuIhAYx
	3H6kuKMzT5wa/tGkGrx1XUn/6rJSMr3Vsk1o6e5JVXWPBkuZ2dXS+YGaCrI9idVrE449mk33XkHYq
	wof53OsoGAJValzmt9chJSCHcGdwHVs1ml84dmOdKq38lId+j8H+uVHQYGxt4CGL/04qWOlxGVNIs
	qPZvOUJp8ZXhxX2TcdVUWsC0rvTNEbm39LJKAm8hu0/nF1RTleKtjYqxnnfZ8RYcbmxFbIzAdUZvI
	WI/O+rP3Cbe+TE7l5a93GhkcaI+CnmxfM9g8Oq7QhqVffxBOSKxwgon6cMgu194arKXU0qVu9/G3/
	zxV8zexw==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <mhal@rbox.co>)
	id 1wgxMY-0004l5-JL; Tue, 07 Jul 2026 06:24:50 +0200
Received: by submission03.runbox with esmtpsa  [Authenticated ID (604044)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1wgxMT-00Ctdi-Dm;
	Tue, 07 Jul 2026 06:24:45 +0200
From: Michal Luczaj <mhal@rbox.co>
Date: Tue, 07 Jul 2026 06:23:59 +0200
Subject: [PATCH bpf v4 4/4] selftests/bpf: Fail unbound UDP on sockmap
 update
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-sockmap-lookup-udp-leak-v4-4-f878346f27ab@rbox.co>
References: <20260707-sockmap-lookup-udp-leak-v4-0-f878346f27ab@rbox.co>
In-Reply-To: <20260707-sockmap-lookup-udp-leak-v4-0-f878346f27ab@rbox.co>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Jakub Sitnicki <jakub@cloudflare.com>, 
 Jiayuan Chen <jiayuan.chen@linux.dev>, Eric Dumazet <edumazet@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Simon Horman <horms@kernel.org>, Cong Wang <cong.wang@bytedance.com>
Cc: Michal Luczaj <mhal@rbox.co>, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org
X-Mailer: b4 0.15.2

sockmap now rejects unbound UDP sockets. Adjust test_maps. While at it,
check socket()'s return value.

This effectively reverts commit c39aa2159974 ("bpf, selftests: Fix
test_maps now that sockmap supports UDP").

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
Signed-off-by: Michal Luczaj <mhal@rbox.co>
---
 tools/testing/selftests/bpf/test_maps.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_maps.c b/tools/testing/selftests/bpf/test_maps.c
index c32da7bd8be2..6a2641ee7897 100644
--- a/tools/testing/selftests/bpf/test_maps.c
+++ b/tools/testing/selftests/bpf/test_maps.c
@@ -759,16 +759,15 @@ static void test_sockmap(unsigned int tasks, void *data)
 		goto out_sockmap;
 	}
 
-	/* Test update with unsupported UDP socket */
+	/* Test update with unsupported unbound UDP socket */
 	udp = socket(AF_INET, SOCK_DGRAM, 0);
-	i = 0;
-	err = bpf_map_update_elem(fd, &i, &udp, BPF_ANY);
-	if (err) {
-		printf("Failed socket update SOCK_DGRAM '%i:%i'\n",
-		       i, udp);
+	CHECK(udp < 0, "socket(AF_INET, SOCK_DGRAM)", "errno:%d\n", errno);
+	err = bpf_map_update_elem(fd, &(int){0}, &udp, BPF_ANY);
+	close(udp);
+	if (!err) {
+		printf("Unexpectedly succeeded unbound UDP update '0:%i'\n", udp);
 		goto out_sockmap;
 	}
-	close(udp);
 
 	/* Test update without programs */
 	for (i = 0; i < 6; i++) {

-- 
2.55.0

