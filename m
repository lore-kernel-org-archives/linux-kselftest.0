Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4B64E1C7B;
	Wed,  7 Oct 2026 19:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791402597; cv=none; b=obEb5HE6ff06XSE9KjUK2wj7g9NrYk9x7O28IFUybB1yECC9UpaaZXyQJ+qqE+4gH5DYaQ/Tz5YH7wu8H1+Ia9q3EjI9jqCdkl0zxNXn6yPThAeSmrMyCdncl5QQukuX4Tg7vtn9pCP7zbZz63e3Jo8F/s5NC0JOyRGhYkZ2cvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791402597; c=relaxed/simple;
	bh=wqxT4pxVpI2WjHbBcnA9gBITBl3U0Fhzz/JQdT0Rqpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pEw5ACBixROtPTLiTWq2CNCH2gjQGSoHilzDbUGJbRrExz09uH8BXz2b4wu7eHWP3l6zBav5j/0UNe3kXzx4wtTqAhrtUy/YiNbeqA106Im+JOPoBMqj/g6xZWXUVZl6fSPxva/B8NzVAkyzcpkdOwge2Zuyb9kU3OitR+xSuUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFxymeXv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFxymeXv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296951F000FF;
	Wed,  7 Oct 2026 19:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791402596;
	bh=rFCMxCD79vEB4iyMWGtxNJDVMBMGuW8tGz3ncBlH5DE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oFxymeXvaBXHUcqJ4UWvBRA8cqI+hogmMpeaGRalIE4ePGB7ta0DEYIvOz6CcF1iv
	 O+JlL6JPGAsvEji0/A5LSDrz0PZIQdbZR2z9ZpWiLpS+tfHDta8aRhKP+LcLhB206D
	 klzRF1ytCNa0PxUmcQTOXx8QCoSXlBQ4LDqCoozDsZFh+Lly5syObuwJZrOYNgsojO
	 CRzdQUqp6ySmfqrzMUnSmsK5p+MQw8zIc8r7EBN/3anKmwjXtXsn3vwqaJoT1yQMiH
	 NstlfCNXE1ZaTn7xTZwAG0BiiT07NW4qIZbgYiQ7u7AUX3raVcjExCAoNk6s2MI7yh
	 lncz79mKiNhZg==
From: Chuck Lever <cel@kernel.org>
Date: Wed, 07 Oct 2026 15:49:36 -0400
Subject: [PATCH net-next v3 7/9] selftests: tls: Skip the zero_len tests
 when TLS is unavailable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-tls-follow-on-v3-7-6d52d98389b3@kernel.org>
References: <20261007-tls-follow-on-v3-0-6d52d98389b3@kernel.org>
In-Reply-To: <20261007-tls-follow-on-v3-0-6d52d98389b3@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=cel@kernel.org;
 h=from:subject:message-id; bh=wqxT4pxVpI2WjHbBcnA9gBITBl3U0Fhzz/JQdT0Rqpg=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqxqJZVeMSLTZBGc4iqw/ZEeIl33aMZyeDjQkf4
 y5yuZnY53GJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasaiWQAKCRAzarMzb2Z/
 l39gD/wLxP4AsC050eyJOFyQm3kw6Lv3xrqVLYwK4Mwt74JKwHJZhoHQZb4/kZav7gkwK2ZOGlS
 73T02C2wsFSWMFj2BZ9Z7abERRKkzgBIyNxka/bXWnUWLffFxp4ckdoulKGwjS7rWSTa2UX2UxS
 fYbQmbOlTizn3ssPjbhQJUOGwAavkH678gV9T7kCYJBnoYqTpHoeCyZd6xbiRlt04L2SBqKm8DJ
 46ul1aYJAVlu7zj3pi4fBq53Ig3Ty6JKpfCpg2peH5IIJKTJJgujOJ6pUcWnE/IEaTseFvUeK39
 EjRIJ5d6zkxgi0Vh7FKJ6lD3RDdEyVfbg6PYM9to8R1HzUbPHuM4b5HiAatW0QQOaZQq5lpNl0q
 DlGjcSZi4bpkh5k2pEIRu5J5jBLIJBm023oHuz0Du1XbOSAJVKyAciKRD1V4Fmf+FNrt/GCClKk
 bXPjYX89ZjQ4KZcgUnGGwH8osnVCkgGtbx8+t61oHrmBA5HzOd6gdYTpVi7woGB7JhtoP1JwlbO
 dc2svOguMTA6o59jJg4STS7PUlOXZtvjYjdQfDoO6eGVzfH+V82DdfMQKVHbWDkNdlhFV1DjS+1
 F5Nx2vKG1OOIIEvi+LFk37qCfcki3V8qviwn3ndodVtiBFTfJ9KKPTIsqFqqIG5Vn6iQGTaCMlw
 w7wk1wk3Olvpiww==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

FIXTURE_SETUP(zero_len) returns early when ulp_sock_pair() reports
that the TCP_ULP setsockopt failed, so on a kernel built without
CONFIG_TLS the TLS_RX setsockopt never runs. TEST_F(zero_len, test)
then sends its raw records over a plain TCP socket, which returns
the ciphertext verbatim. All eight variants FAIL on a machine that
lacks TLS, and those failures mask any real regression in the same
run.

Skip the test when the fixture recorded notls, as the other
fixtures in this file do.

Fixes: a61a3e961baf ("selftests: tls: add tests for zero-length records")
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 tools/testing/selftests/net/tls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index 9d3cd4fff062..0bc43728262e 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2639,6 +2639,9 @@ TEST_F(zero_len, test)
 	int rec_off;
 	int i;
 
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
 	for (i = 0; i < 4 && variant->recs[i]; i++)
 		EXPECT_EQ(send(self->fd, variant->recs[i]->cipher_data,
 			       variant->recs[i]->cipher_len, 0),

-- 
2.55.0

