Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF4B3BF689
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 04:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785127033; cv=none; b=DwSlt/7YqUGJBOg7B31OF/Xs9o0C7Mi61Hs0aaLolIWXGJXYLbOtldlpZ6MK72ZAo7GpRP8MIfwrWKTGg6E4f+PQqTzNX9+0JqZSAs/UbuSxxS+G9PLHCdjKY9qZlVvwtxegSkqYI1dX3jxkwIb7lc0mH6vdzJ+Mn4tMVMAPiOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785127033; c=relaxed/simple;
	bh=+5AVmmvo7uo2sTU54BBomwxJEb+wbbsb5WTUeXfaWwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mug/hjoZ6bs0GaqgsO3cbVCDdwdg1K5H6kEoQrKQ/NOS2dGY9k9XefaVclfCDRLsVp9MFGBIMkPffigFUCti1brdlcDuJ0fWSzPdR3hmZk3Pewpx9w/GPcwVOXiwCvDA366L0IhYyFVI5YgPsv9TIhJ+pSRiWCHQN8bIj6NFrn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yt3LRam5; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yt3LRam5"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8485b358552so2336209b3a.2
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 21:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785127031; x=1785731831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhz6Q5/sQeYLBkBndiEW68jkml/YJroW4hh0od92oxA=;
        b=Yt3LRam5fOaTCqS2gh+S8Qt8+c1MTw8HZmlo+8eIMXsLmlvcjfKNz93BGXmkztTNrr
         MfxR20hOptA39j09M+Zc/z7jB1PVZX6eypcf0EzcFPOF9S8MQ/8K2wtIQxddlZAbYYqV
         22VnxznCqoKAoViIR7Xcj1aiCVtg9YOTt7mbx93b1FMBqYqEaGMhLqDLhzEnkJdsess9
         bkjuOJRTzQf/QzE+dWxqPqQWjs7414HgqJG0IiLbXrEk7LOuy+6suUFZEe95EfZPXY93
         6gnxGWXEeBAcekQfUXZjXlEjkZZXLk1w0X1RqL/7ceEwPJWoUkF6xQBk9DMTg0fKQ+2w
         D2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785127031; x=1785731831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jhz6Q5/sQeYLBkBndiEW68jkml/YJroW4hh0od92oxA=;
        b=kZzPghLa945N0DFp+vZxPgLXRsAHGpVkjQGFyo3OB0/ZPqRG27nYPWf1/s3j4f3toM
         0CK/ryKKmrkUa78iut/W1nGaMRBqW2vn+oI3LqMswWxWcmd7NSwTgcsUKZYE2M+VkCmn
         mov5Ou3bqPAQDaf5JFtblFqz0Qhmv5x1H1irkooyGSLnLeqyKl2h4eWt12i7n/iPt0An
         YtSEq730fG1BYDaqrWhYeGT4mfNoKMVB5ZtaYyv/Us9GpdAfXMLSJeu1KH6KvCipFPHp
         B3i/A604s7g5z184z2923zamEHmrZIsYfMdUY1gJlaj4pKl5iEV4ffFPLmkScsi+npP+
         mDCg==
X-Gm-Message-State: AOJu0YwRU4jXv9CISodYoA85QU2I7fioUZyIEaLzJkF7nb9vfRx0I6c+
	D6NN0khSnzOfpZ0cyomSBFnvHo4XnS+nRKpz9UFtwci+60tsGG9Vn2pZ
X-Gm-Gg: AR+sD11NqjR6z5G86zjMC4SuoiS9mOahrJk5I9nH9AstrYsjqltu8U8pZbh2ThXxKWi
	Z8LlJXP/vP29zMLSKHMaMOcKy8fCaHrlNqMwPVfkqrI/ylM8X1xIn7WTvoQke/cWfrcnch1aXLb
	1WCp7Ih80wEcPd42ODIqrs2l4jBtz0hXvm+F+jPcAPQLZjg2a+Rmv/TQyG23VTaZB+m4672EJ6l
	bvWkCyfq/CLJPlqY+TPvWqcsIsRSJIMbJ2NLfUpov6156z9zZMow0k7LZGQ/dzfMKhVL6PPOgHw
	/spKry515m8GIAOXmNNUf4xLXkWsz8rDCD53gSwntynIOsgqLxCCn4DLlzL2OidMAPgMR9ZRQMo
	djtRumJN1KRFBo8kBg6jymFYaoNu91UoeSjLrB43P9wN/uMctnf9LjQJ0fWvq4WkuSWsshykUeo
	b6xeI=
X-Received: by 2002:a05:6a21:6f0e:b0:3c3:7f50:fc3a with SMTP id adf61e73a8af0-3c67ddd9b0dmr7005072637.33.1785127031103;
        Sun, 26 Jul 2026 21:37:11 -0700 (PDT)
Received: from marceloPC ([2804:1b3:a8c2:99cf:6381:2414:ebe3:a179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc4164ddsm26249985eec.9.2026.07.26.21.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 21:37:10 -0700 (PDT)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
X-Google-Original-From: Marcelo Mendes Spessoto Junior <marcelospe@proton.me>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	Marcelo Mendes Spessoto Junior <marcelospe@proton.me>
Subject: [PATCH net-next 3/4] selftests: net: test IPV6_FL_F_REFLECT
Date: Mon, 27 Jul 2026 01:25:09 -0300
Message-ID: <20260727043516.93101-4-marcelospe@proton.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727043516.93101-1-marcelospe@proton.me>
References: <20260727043516.93101-1-marcelospe@proton.me>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to source code, flowlabel_consistency must be deactivated
for the IPV6_FL_F_REFLECT flag to work.

The previously defined tcp_listen and tcp_connect helpers were reused,
since the connection flow required for REFLECT validation is very
similar to REMOTE.

Signed-off-by: Marcelo Mendes Spessoto Junior <marcelospe@proton.me>
---
 .../selftests/net/ipv6_flowlabel_mgr.c        | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
index 383a84ea9385..da253dff2cfd 100644
--- a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
+++ b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
@@ -6,6 +6,7 @@
 #include <arpa/inet.h>
 #include <error.h>
 #include <errno.h>
+#include <fcntl.h>
 #include <limits.h>
 #include <linux/in6.h>
 #include <stdbool.h>
@@ -138,6 +139,19 @@ static void tcp_connect(int listener, uint32_t flowlabel, int *client, int *acce
 	*accepted = afd;
 }
 
+static void set_flowlabel_consistency(bool enable)
+{
+	int fd;
+
+	fd = open("/proc/sys/net/ipv6/flowlabel_consistency", O_WRONLY);
+	if (fd == -1)
+		error(1, errno, "open flowlabel_consistency");
+	if (write(fd, enable ? "1" : "0", 1) != 1)
+		error(1, errno, "write flowlabel_consistency");
+	if (close(fd))
+		error(1, errno, "close flowlabel_consistency");
+}
+
 static void run_tests(int fd)
 {
 	int wstatus;
@@ -254,6 +268,37 @@ static void run_tests(int fd)
 	close(remote_afd);
 	close(remote_cfd);
 	close(remote_listener);
+
+	explain("Prepare TCP SYN for REFLECT flag validation");
+	set_flowlabel_consistency(false);
+	int reflect_listener = tcp_listen();
+	struct in6_flowlabel_req reflect_on = {
+		.flr_action = IPV6_FL_A_GET,
+		.flr_flags = IPV6_FL_F_REFLECT,
+	};
+	explain("Enable REFLECT on the listener before the client connects");
+	expect_pass(setsockopt(reflect_listener, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_on, sizeof(reflect_on)));
+	int reflect_cfd, reflect_afd;
+	tcp_connect(reflect_listener, 7, &reflect_cfd, &reflect_afd);
+	struct in6_flowlabel_req reflect_query = {
+		.flr_action = IPV6_FL_A_GET,
+	};
+	socklen_t reflect_query_len = sizeof(reflect_query);
+	explain("Query the accepted socket's outgoing label, should be reflected");
+	expect_pass(getsockopt(reflect_afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_query, &reflect_query_len));
+	expect_pass(ntohl(reflect_query.flr_label) != 7);
+	struct in6_flowlabel_req reflect_off = {
+		.flr_action = IPV6_FL_A_PUT,
+		.flr_flags = IPV6_FL_F_REFLECT,
+	};
+	explain("PUT+REFLECT disables reflection on the accepted socket");
+	expect_pass(setsockopt(reflect_afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_off, sizeof(reflect_off)));
+	explain("cannot disable reflection twice");
+	expect_fail(setsockopt(reflect_afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_off, sizeof(reflect_off)));
+	set_flowlabel_consistency(true);
+	close(reflect_afd);
+	close(reflect_cfd);
+	close(reflect_listener);
 }
 
 static void parse_opts(int argc, char **argv)
-- 
2.55.0

