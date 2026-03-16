Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5B8378D8D
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 11:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773660551; cv=none; b=tVvngdTtGT8yEX+mrW4SWipKM1baPo6wc+3SDQFESb8Gzj1QOIgpAp5n8XaMTmBESxHejpH4nwaRg9TR0B6wluKznRx4O9NyQHHbrmBBY8QCdgzAw3alJzKTOKKym9Oynb/O4Y1xgIDL8xwbo1mLQJjw0THGcON2ccikqMZzRWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773660551; c=relaxed/simple;
	bh=UjK10OBfDG4cifl9Mz4i7HLK/ZoPL07F/KNEv3xPjSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OUoBwE4S+jCoLRFzydNZMQUNcjdDq3cPUvc4oFEeHi62adbjHafNjBTrmyD9H3HYh1NNDATowidQ9un2b0FBjdp0IoTlVQ6CW3lqHBjRFP0sFOgQxD6DnClA9xwMqbREsKmfchmIDMp7NwupFk7VNOkenhLcdojPV+iGHpRRv/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTIRw/ct; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTIRw/ct"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82984c077b2so2210245b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 04:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773660550; x=1774265350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpPRbYYnTe0Bs7rJxn1jlZ275hZTs9fjUlBButpAMuA=;
        b=YTIRw/ctKVt+YLqTE4cSt64k3AZn3q9DpzeRgQ4uzBbtOm05XInj7EAuJorrxbWpo1
         /iyU0ob19rJfbHve6oJcNrN5GpQj2GyrEhCXS9nV9OoIaDeTjYIzT4M7Bl6Hx9NMMKWb
         +vTiUEH2kGaQUfk1sWHR/FTy/VaxTqR9uuHCO8NqVF35gjuFWVhwn7B149eq6+9n/ash
         883Fhwzb5EA3lYb0MMdw0lra1Bxk8MSADXHvsepaYHSWtRm0jEvgoldKB+Ba5PP+DsaN
         ASl56O377Wa1ZgGRjxWXSUxzFjdTPHHWz8QJwYniZCvuJWEYOtq0gQurzFqOse+SiroQ
         cMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773660550; x=1774265350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HpPRbYYnTe0Bs7rJxn1jlZ275hZTs9fjUlBButpAMuA=;
        b=ZPSwksaex9kL2m3i7o96M5Sa0y0t8DJnMJ6zpIRof322KX2y5GM3pQvBJau/CXvYBP
         FGg7tXl6jhvNTcLou0+s/KWx+hYTgP0aYXn1U1GeufsT/QxQoDHtoEl3m08TODB8Ptuo
         uz7RinEM/+/Bgx0vK/MD6VwstV6tkfVbTIoofQC9lunayNJv/h+Hj1knkQIG9aStojTo
         6SrCPIVdDCfW9geWuiFz2n5XQ+VRYIbIrXp67IvM5sPEJEusI4BwTogqZj6CgaxVDq4k
         yPllXC1XzY4T7YYx3jV0PLOFprNMJzYNCBHIVaxyqkOA/+1p45UXPToMvFaPu2qxVOBR
         Ozew==
X-Forwarded-Encrypted: i=1; AJvYcCV1ROn5SEK1ztNPmT74o8itN5tKVXSIBGras/NZa8Ye6yKT3h8jH2TQMDaRcshCf4Mz2J22ZhL05MUMHj3GPGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWfYjYsyffAUyMxr4hL4vWdMLAAeQ513pswkhiiDKW8bV9chBO
	D5C1v/0SCw8vH7+UVjoey3NpuifZN4Njs08Q2G1qxXGqwQAyaaMSoG3A
X-Gm-Gg: ATEYQzxI5WCeYaOT+Kq4uq7n3ufmGptGkdinzmvVbYZQJstc1uDMm/rKbSFDxjVX2t6
	0sXdwCERjNDY0N/5u4ZUkFA0lIwn2c2t7MpqAeKzqrw6CyltP1kvplrZLFVHXJJmwJLaLuTo0Xu
	vsZARKmxA45laHnQayw9NYqqqrmmVESfgVBDqQp7LAxlwhRAEXGdCJw9GHej2Me+tZEEuXQ8RQe
	/Be2xGHV+QOQYTYOqNZeJyXWaDv1C/mazf5BdOFzyWkyk4PPSNYRXuPtCCId5bAizNJMA46qunB
	9TKRj2dhRz1HSvJmFVGlCBgwh2/q9lDcJCgDPGO2Votc6TDbxNnv7AeVkAUujDcBDoKgX4xNve5
	u81V52Ljw3duzC7GyQyjEqtxq2N348B3A4OIjocimWfS/+FIiQq84UB2qJDRURNIdj+rpbj0j6M
	OAp3X76ALjJEFG01x13rKtzi3iDnrO+y/ILwILqTn2nji+WqHaPF70xqfyCi/0n4gBdg==
X-Received: by 2002:a05:6a21:4d8c:b0:38e:54b8:60a1 with SMTP id adf61e73a8af0-398eca2fc4amr11781405637.4.1773660549984;
        Mon, 16 Mar 2026 04:29:09 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7401588ecesm4684940a12.32.2026.03.16.04.29.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Mar 2026 04:29:09 -0700 (PDT)
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
Subject: [PATCH bpf-next v8 2/8] bpf: refactor __bpf_list_del to take list node pointer
Date: Mon, 16 Mar 2026 19:28:37 +0800
Message-ID: <20260316112843.78657-3-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260316112843.78657-1-pilgrimtao@gmail.com>
References: <20260316112843.78657-1-pilgrimtao@gmail.com>
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
 kernel/bpf/helpers.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index cb6d242bd093..e87b263c5fe6 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -2426,9 +2426,10 @@ __bpf_kfunc int bpf_list_push_back_impl(struct bpf_list_head *head,
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
@@ -2439,7 +2440,6 @@ static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head, bool tai
 	if (list_empty(h))
 		return NULL;
 
-	n = tail ? h->prev : h->next;
 	node = container_of(n, struct bpf_list_node_kern, list_head);
 	if (WARN_ON_ONCE(READ_ONCE(node->owner) != head))
 		return NULL;
@@ -2451,12 +2451,16 @@ static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head, bool tai
 
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

