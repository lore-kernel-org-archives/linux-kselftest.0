Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956D237996C
	for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 14:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774793133; cv=none; b=nIGhaN5DR9FES+ACWNeksLLodI2Xw8sJrn8ggNDY3g7Pu/mJNSFXY1yYZ7wa3zYmW8XNtp9my1OrEbpqTfnYoOg/LDoCvvTX7KRCBImc3iAj3iyfigzlxI8dWBXhY1vFuCHzAiTZTWsR214xf1vm45BqpviMjXAqb7A6xKkAx84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774793133; c=relaxed/simple;
	bh=E61zFnKODeiQLWRE/+6fpJeHwp6AmheZ+meXAQg2l9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JlKYs7k6t8z3xOY4Ee/S37bErEfBTXUTzYgVcQpPI+jI0PJE4WzfsmDDSxeOvGRhAuzL9LHr/peidphUtkK33O8zQKrKLN0JgbhuUpdHpABUy1AcwAsNP06xNChRio4hdu0FXzlDikKJS7kCVSgu1WhA9ALnxIISWZ6lFEEDHlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/3RI0rO; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/3RI0rO"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35d9c7bf9a1so600379a91.3
        for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 07:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774793132; x=1775397932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQ8JJnoPn08kd5GRnT5LaskZM0x4pGuXiAVfsNtLskI=;
        b=A/3RI0rO31z5IHqB2icQoJ4QrQAthNJjKeDcGD7YYsMq3bnE3oYzNQEcuyyvwJB6Bd
         47jOn1NO70ZXo1Y0Y2WfrC0wz6ovDTv+h2PgbF2EY3d3+R4kim+UG565RDu2cBN7Whwc
         IcCz2ioMluMPi0s0BkrswV9JpyVaPNYvtynQ5fQwzmTd8xhdrFlTgEJ30GyuER41AS68
         /qZh42uZ7aOuhCjYqaW5AyKJXANqoYChcP8axw7I/npmeClHl89sgldHIgXZ/9lA9wQa
         /1f1ZsL8RR3IN6o/DzMDDE3rVe4c72xQ/HT3tDwesMRxnrkx1LZJeuWgpTPvzr/3amPW
         W04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774793132; x=1775397932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uQ8JJnoPn08kd5GRnT5LaskZM0x4pGuXiAVfsNtLskI=;
        b=ZMsr2A4OPOk4jDwACxCON6aSdmPodcqlMT4wPjI54lT78r+gTpaZalNyCTK4+qafiP
         O2qS15gPRnmiHFXsyQdILA1SYDQbeCM5iQzrkoWwRJduKizIoQmA7L1681XiOlkpJMYU
         boDioG+/k6HobtveeNi5ouXULgeIvYzOjNcpKZqQuyZGHKOyUP1Gt76fPq7ybxUcPHMR
         FmdXmkQTjDftWjQbYmleBA799LSubHh5cnmIi4AU2KT5X09ywaIELw2JAlvzgWK8xkld
         Yij4PGXPuhZFyvV20LG22sA+RjCuX/xmpCN81HCzbXHLzutgZFsDfcV5nca1SNDoYcHV
         ZzfA==
X-Forwarded-Encrypted: i=1; AJvYcCVbtPxIFXro/K8qUPvP21NuTYlyxbrCgS4g4pQ6i0OzVQvnl9dLO0P7iSQubYMYoYZVG6vQw3jSuimYnX1Q6Ug=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ONj7WQ+SmSPmCgDlihFwx5b9kNz8WunDWG0qEurPOjk6vYJq
	NprlKGQr4+WkIdS8SOMAxdP8dEQ1L0+WcIV7bU09tmu/ddgYb3MUWCD1
X-Gm-Gg: ATEYQzwSbNoFPPvFwmkVNI+Aj+MiNJ47DuZnskVEozUrDgIfyFYOUaxHerPgUgWJY+R
	BaXccuwupVC15SLJEZadOA4r5RecX8d85hF7emk2pGiNMp7SXSym92e+r/saTRLjod38HaELqwE
	D0v0ovZKhz+I6Ls0FfDa3i3s5IliQdE1VuyrGRJkjPl9OqRQrcanfXuLxu1TjVBgBBPT6DYeWFm
	VUsKwX0TGXdE/lJfCzxsO7zaoW0oGavGM1HjbHaR2Ty8QjFD6wNc713X14iBcc1/sI7EjlCtIg1
	JaricZYhMAXFDWwOtS1tDRulGWNXLTtrsZ66T9NymgvQxzv59xpTYEtlsVsWlSZZQ5Wuh7oSbR8
	7MpK0aRyz5lVEqZGTM6YuI3y5pu79B7qlzihCwbHNSgH6p6yWzYrNXhCfspSV1HS5pJ510wkL6Y
	KyKsaJ+1ESHEQG/uG7+BAsHx5v1FWljxg8g4x0NN4oMJAE/YbRu8CDog==
X-Received: by 2002:a17:90a:f16:b0:35d:943e:3c2c with SMTP id 98e67ed59e1d1-35d943e3f12mr3381608a91.5.1774793131953;
        Sun, 29 Mar 2026 07:05:31 -0700 (PDT)
Received: from localhost.localdomain ([113.218.252.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d950bd630sm4417454a91.16.2026.03.29.07.05.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 29 Mar 2026 07:05:31 -0700 (PDT)
From: Chengkaitao <pilgrimtao@gmail.com>
To: martin.lau@linux.dev,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	chengkaitao@kylinos.cn,
	linux-kselftest@vger.kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v9 2/9] bpf: refactor __bpf_list_del to take list node pointer
Date: Sun, 29 Mar 2026 22:04:59 +0800
Message-ID: <20260329140506.9595-3-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260329140506.9595-1-pilgrimtao@gmail.com>
References: <20260329140506.9595-1-pilgrimtao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

Refactor __bpf_list_del to accept (head, struct list_head *n) instead of
(head, bool tail). The caller now passes the specific node to remove:
bpf_list_pop_front passes h->next, bpf_list_pop_back passes h->prev.

Prepares for introducing bpf_list_del(head, node) kfunc to remove an
arbitrary node when the user holds ownership.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 kernel/bpf/helpers.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index cb6d242bd093..94fcd4ab39e9 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -2426,22 +2426,25 @@ __bpf_kfunc int bpf_list_push_back_impl(struct bpf_list_head *head,
 	return __bpf_list_add(n, head, true, meta ? meta->record : NULL, off);
 }
 
-static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head, bool tail)
+static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head,
+					    struct list_head *n)
 {
-	struct list_head *n, *h = (void *)head;
+	struct list_head *h = (void *)head;
 	struct bpf_list_node_kern *node;
 
 	/* If list_head was 0-initialized by map, bpf_obj_init_field wasn't
 	 * called on its fields, so init here
 	 */
-	if (unlikely(!h->next))
+	if (unlikely(!h->next)) {
 		INIT_LIST_HEAD(h);
+		return NULL;
+	}
+
 	if (list_empty(h))
 		return NULL;
 
-	n = tail ? h->prev : h->next;
 	node = container_of(n, struct bpf_list_node_kern, list_head);
-	if (WARN_ON_ONCE(READ_ONCE(node->owner) != head))
+	if (unlikely(READ_ONCE(node->owner) != head))
 		return NULL;
 
 	list_del_init(n);
@@ -2451,12 +2454,16 @@ static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head, bool tai
 
 __bpf_kfunc struct bpf_list_node *bpf_list_pop_front(struct bpf_list_head *head)
 {
-	return __bpf_list_del(head, false);
+	struct list_head *h = (void *)head;
+
+	return __bpf_list_del(head, h->next);
 }
 
 __bpf_kfunc struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head)
 {
-	return __bpf_list_del(head, true);
+	struct list_head *h = (void *)head;
+
+	return __bpf_list_del(head, h->prev);
 }
 
 __bpf_kfunc struct bpf_list_node *bpf_list_front(struct bpf_list_head *head)
-- 
2.50.1 (Apple Git-155)

