Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4D33563D4
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Mar 2026 13:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772546019; cv=none; b=s30jk4dUTqllGOtDYV92HBcMc0LaT+d5IMTYuBcB0mIkNEFV6aXt/reVF9r1B/dGnhBzzE8KlUIkSzbFojJm2iPz/CwjNgiWYyGUVItJjT5seGmqCk9eH0XyAa8FD2E0rtpQMRMlNckQRg+1w+hMRPzqNx/Dw4e6giCVQsUEO2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772546019; c=relaxed/simple;
	bh=3C6ttGuLl8L64Q1LnoiZLd+0O95EfQxJe16UcmlcmDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SjuaJNC58XXqM+AO520VxxUUEl6hSfXxp18eyPNl26pKCMFSKwIJB+zedYqWV+jE+jfpadPjCd+OlfCDc4EjA5sz7HJ90IP4Qk+RcSg0ahuoPpfvCIuHN896+WKX3In6rgMz/nuQSDzAhx6MrEhSaHanXegXD1q9JM7/oY1m6PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpfqORez; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpfqORez"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8273eb7798eso2516468b3a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Mar 2026 05:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772546017; x=1773150817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/c4HiRtc5xaPbrfb39uLULAmMTx7Jx7ULuDedQkQ4YU=;
        b=SpfqORezinC1+itMhON7mLIoZjh6QB2tqVtwZ7cLcxllrvfXIxfDJwPjUX7Qvvggn1
         S707OjdF541jjdVS52mUl005NJaOxX9zp1gWv2vOKF4aeKhTUF5i/Y01JKmXUfmtqsMK
         il8d0hs2RkrzL0MGDlVtKHsW3YYxBUIMO/LCirlbOKGiR2Ilayyui1iYhhxL7v0++dax
         UqYwvuECz+ZSDB9FGi7J1iwKo+z04/1rQ+g+LFxEfnEe3M9zi7Wt3mYHWpsh5nu5PF4y
         axaFxooO76NwbE4xFy7L1WldbKmkarxyINTXzqAyBEuFh5uJigrukza3jai+I1XwIJft
         tT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772546017; x=1773150817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/c4HiRtc5xaPbrfb39uLULAmMTx7Jx7ULuDedQkQ4YU=;
        b=PJ4aeKnXAvURQMgySiQS2FnaiNB4+M+OydExJP+BuBmBEBM/IrTtJOMEQEzAJ3lErY
         +zjOyTCC3D36QWDmS6LG/07tThN79fMpCCy59pcPJYJ6OewUNpohoP9SQaPrXRKYV+T6
         +PcJD50iO0u3m41mcacODbr5XXeCc9fQuS2hfDphxClCD952KW31nF3Fds6/DoSKlKnP
         Kk7T3ajG6CmZ+tDVSxlRvHolS/oB2aHwW4IRl5tCT6GV+jutDmAp+IKMWqTd837bdTeN
         5lT38xI+cLIxmCfnHH+uH3WDT1yW+upTtqQOW3ZJLd5tcovOpf1dJ+kz3BiAuqfXgUeo
         hPUw==
X-Forwarded-Encrypted: i=1; AJvYcCXi8QAd9sxcFozeo7jucMlzR3N1IclewERNAoArDUd0qxoGqJsfIv1pRco7JXlwC6UxMY6hv5tJiW9n+HPkQPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvKEdhR7Z4Y/4VWM9L+ZtYOxw3SkrPqaGrpGFmakl4j5cLgHgg
	1GsCd9ps/LrrijZmsmP7Cjh6fgsAR+rtTy/DoxAp1zSazVafI5zQCOTN
X-Gm-Gg: ATEYQzycgOirQ2ujr5BwenUD/zdjT2H19VpdNK73pLvKkQ94WWIi+VPkW0TZvPKWKhW
	vyFlGnguEuTR407CNcLpk2pZmyYhK4O/jhdjSntiCGV0KgzAw/Eedy1kSJbnTe5WWcN+4J53wRq
	kQj/vAELOFw7DnnF6fXTCJecd1Jv9Vhp5sCdl9xrG2PTPZy+hePaVs4XP96D2R9JyR7qug87GoH
	2TCOl1oaTX/3v2bMZqdhqKRR3AV572rIDfonHlABVAxNM3DrL5ebFSzzpiavRLhzYQzs8ZzQXLb
	Xu3n+qTXpQsAgGHtJI6vq/6UzyLiPSrVRTXkM/Lb6Yisc0CXyYOYQDhbRcFnkcKou5/gLMw+6yR
	owIpqniAKcy2wqLHmDJSD6ZvppjFRDjnGdlk7p3/JektxFx/YTi/YFotbxrVH1+hYJEOLjf/4ww
	2IflCaGJpzXHM4nThBVd5+XXc8kphvFgMak2yy8cKJx3rQcBX4
X-Received: by 2002:a05:6a21:1f8a:b0:394:593a:eea4 with SMTP id adf61e73a8af0-395c3b0f750mr14569718637.57.1772546017520;
        Tue, 03 Mar 2026 05:53:37 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa62147esm14689782a12.12.2026.03.03.05.53.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Mar 2026 05:53:37 -0800 (PST)
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
Subject: [PATCH v4 6/6] selftests/bpf: Add test cases for bpf_list_is_first/is_last/empty
Date: Tue,  3 Mar 2026 21:52:19 +0800
Message-ID: <20260303135219.33726-7-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260303135219.33726-1-pilgrimtao@gmail.com>
References: <20260303135219.33726-1-pilgrimtao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

Rename test_list_add_del to list_add_del_and_check and extend it to
cover the new kfuncs: assert list non-empty after insert, assert
is_first(n) and is_last(m_1) after bpf_list_add, and assert list
empty after removing both nodes.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 .../testing/selftests/bpf/bpf_experimental.h  | 15 +++++++++++
 .../selftests/bpf/progs/refcounted_kptr.c     | 27 +++++++++++++++----
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
index fdcc7a054095..056b2de19b06 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -126,6 +126,21 @@ extern int bpf_list_add_impl(struct bpf_list_head *head, struct bpf_list_node *n
 /* Convenience macro to wrap over bpf_list_add_impl */
 #define bpf_list_add(head, new, prev) bpf_list_add_impl(head, new, prev, NULL, 0)
 
+/* Description
+ *	Return true if 'node' is the first node in the list with head 'head'.
+ */
+extern bool bpf_list_is_first(struct bpf_list_head *head, struct bpf_list_node *node) __ksym;
+
+/* Description
+ *	Return true if 'node' is the last node in the list with head 'head'.
+ */
+extern bool bpf_list_is_last(struct bpf_list_head *head, struct bpf_list_node *node) __ksym;
+
+/* Description
+ *	Return true if the list with head 'head' has no entries.
+ */
+extern bool bpf_list_empty(struct bpf_list_head *head) __ksym;
+
 /* Description
  *	Remove 'node' from rbtree with root 'root'
  * Returns
diff --git a/tools/testing/selftests/bpf/progs/refcounted_kptr.c b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
index 5a83274e1d26..1b119fe16f5a 100644
--- a/tools/testing/selftests/bpf/progs/refcounted_kptr.c
+++ b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
@@ -367,14 +367,14 @@ long insert_rbtree_and_stash__del_tree_##rem_tree(void *ctx)		\
 INSERT_STASH_READ(true, "insert_stash_read: remove from tree");
 INSERT_STASH_READ(false, "insert_stash_read: don't remove from tree");
 
-/* Insert one node in tree and list, remove it from tree, add a second
- * node after it in list with bpf_list_add, then remove both nodes from
- * list via bpf_list_del.
+/* Insert one node in tree and list, remove it from tree, add a second node
+ * after it with bpf_list_add, check bpf_list_is_first/is_last/empty, then
+ * remove both nodes from list via bpf_list_del.
  */
 SEC("tc")
-__description("test_list_add_del: test bpf_list_add/del")
+__description("list_add_del_and_check: test bpf_list_add/del/is_first/is_last/empty")
 __success __retval(0)
-long test_list_add_del(void *ctx)
+long list_add_del_and_check(void *ctx)
 {
 	long err = 0;
 	struct bpf_rb_node *rb;
@@ -386,6 +386,11 @@ long test_list_add_del(void *ctx)
 		return err;
 
 	bpf_spin_lock(&lock);
+	if (bpf_list_empty(&head)) {
+		bpf_spin_unlock(&lock);
+		return -7;
+	}
+
 	rb = bpf_rbtree_first(&root);
 	if (!rb) {
 		bpf_spin_unlock(&lock);
@@ -418,6 +423,14 @@ long test_list_add_del(void *ctx)
 		return -8;
 	}
 
+	if (!bpf_list_is_first(&head, &n->l) ||
+	    !bpf_list_is_last(&head, &m_1->l)) {
+		bpf_spin_unlock(&lock);
+		bpf_obj_drop(n);
+		bpf_obj_drop(m_1);
+		return -9;
+	}
+
 	l = bpf_list_del(&head, &n->l);
 	l_1 = bpf_list_del(&head, &m_1->l);
 	bpf_spin_unlock(&lock);
@@ -434,6 +447,10 @@ long test_list_add_del(void *ctx)
 	else
 		err = -6;
 
+	bpf_spin_lock(&lock);
+	if (!bpf_list_empty(&head))
+		err = -7;
+	bpf_spin_unlock(&lock);
 	return err;
 }
 
-- 
2.50.1 (Apple Git-155)

