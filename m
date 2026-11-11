Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794427186;
	b=S515617joQ9g0bgXpYih19+yM3iqtiMk68yhwsG+VfssfX6z2yf+HdvfX9NuhQhfF/du
	 5VSjoGYrFDpoFQTZ5LWjtg1V7cv6nw132/4GmbmiuG4HrJt7Q4JM5XKr510+qXmGILp6v
	 g7fM3BY8UAeKF24UlqHV8XyTM5tGLSt2QiR5GgrOnZV+c2FdFMD4aH82G6ODRnH8ohl7r
	 lnxR8+T5ZhdvjsFoULN5Synz9wyWCo4qCiJKsivTTbaBLpRLJVPPGyJZKbJ1arKqTwLzv
	 7J/dnjaZXXNNzaPejyFCdjWdnb3fB9LlmFQMhdDxTxeFuCrzzzeJfzLbj+xab0NPirg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794427186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EZv892Hp/w8YN/pcYxItocv35LQiqipWkaKIWNQFLHU=;
	b=NtNWEb13nzbQ6qgicRtNk/tyGcj3zwHsS0VIVP/1IMZsZ65ZQ8eyOxVMNNiYcKc59WJS
	 yBNRL/fNzDbpbJfjReWS3P48L9URMt00+dbF+xwi7paguj/OT9KbNOvxT9aOSuWCES8Qk
	 SCQz2oPi9HwRbwlIOP7ooo9Q5xwzGfAaba2FFfARNu84RroVzSbXhB1z/wKQwwAfBjSnS
	 WTEMZ3wYBVSu0jN2CvnvGgSzHz7XwxtMozlksfFIZRBowN2Trll/0SmcfwrX2aX3CyDx0
	 uTp8h2EV4qiJmsE500phuH5KQiTXotbPM/+u8vKJ4yblTdCeov2tYgzROcjFToOmlqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DvA5NGbS;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC2F606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 19:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DC2F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DvA5NGbS
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-847e2926d94so7138763a34.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 11:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794427185; x=1795031985; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZv892Hp/w8YN/pcYxItocv35LQiqipWkaKIWNQFLHU=;
        b=DvA5NGbS4keLHXdDRcrF7eUh1hbwSglEr3/uOLAcWxofxfxXp+XfkzcdCOYorAzARe
         B6g94luwL0Ffh6liz0Ud0TMNolfZcUwtBuzHjdBGgfZCOiVM/Kl6EnyqFZY2iWZr4wb6
         G6Rzgzj+i7SA7HuJMZ8jf7eK9Sd/Jh3aa27gd1BVSay7wUy8xGcqrFS89D28hkkexPI5
         6rcFzmNLPEpWztfCLI2X6m6o9V7L4laQd+6nW7p4YwDuQNkjdrKMqnYJ3VXwikxY/VA8
         atsV6zFsssF0LALTvFHVVE2rmig5jx3NNnMivkHT/M6x3X//wvtWb+DWi0IgLSyyBGDW
         3nkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794427185; x=1795031985;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZv892Hp/w8YN/pcYxItocv35LQiqipWkaKIWNQFLHU=;
        b=CNALdvZVnXI3UK+J138uA7eFNncxDAcMGPphrVZ/JxK9fL++fiphbXtJeADQwI0yPu
         ZIZq4Qp9Tz1rIyQavNWUKcrHDU3nzDmGq/ZtaBaCEXJf+Krb39miJrSM/WPpLRuIprj5
         gmEJPjJUhL/uswGtB7Xnd/5tkN/8gAsM1Ktoec6JB8A4qmvP+gsHQkdL08hWpkRu79T4
         XJlfPc/OWh2FS87eoLg0YJ/SD6tingvgQ9nRnTNe5jkDFThlSr3JeiVaUrSPOAssCG6D
         USq0iEtB2yM9P5b8mMBwVFVUukqsqQ7V0UUGeKmcpJfmUOf0pju2m0F71YdWiJgSev6N
         Zghw==
X-Forwarded-Encrypted: i=1; AL+hErFEUM7Qrbd8ROAGPCUqS2oHZ+J8Ejwpl0VgoKXGhXvpGmTbiyoAIi+GhXdK6LJDOJwxBIbvJMbjIUmO1Einxhk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cJk1H0BJ8mahDMIWzZf/OYwZJQb5664oZdg/rxM3xTA+6lF77
	5IcnYbSw7IMRCZU5X0haZBWG5wPgKd92Y9+idOxw7xclM12dA4MUUZRV+grtf8wcrVVRsiU1b4P
	uZaGU97EdGr8pHKF7LQ==
X-Received: from iohf22-n2.prod.google.com ([2002:a05:6602:a5d6:20b0:9e3:4b87:936d])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:c1b2:b0:4d6:90f4:48ab with SMTP id 5614622812f47-56b97c18413mr3271887b6e.45.1794427184911;
 Wed, 11 Nov 2026 11:59:44 -0800 (PST)
Date: Wed, 11 Nov 2026 11:59:42 -0800
In-Reply-To: <20261110125106.2935677-1-k.chen@smail.nju.edu.cn>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110125106.2935677-1-k.chen@smail.nju.edu.cn>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111195942.1283060-1-tjmercier@google.com>
Subject: [PATCH bpf] selftests/bpf: Test that a drained dmabuf iterator keeps
 returning NULL
From: "T.J. Mercier" <tjmercier@google.com>
To: k.chen@smail.nju.edu.cn, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, shuah@kernel.org
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	christian.koenig@amd.com, sumit.semwal@linaro.org, phasta@kernel.org, 
	tj@kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The BPF iterator docs in bpf_iterators.rst specify that the next
function of an open-coded iterator should keep returning NULL after it
has been returned once.

Add a subtest that checks this for the dmabuf iterator. It drains an
iterator, calls bpf_iter_dmabuf_next() once more and checks that the
result is NULL. The dma-bufs the test creates keep the list from being
empty, so an iterator that starts over would return one of them.

The existing open_coded subtest uses bpf_for_each(), which stops at the
first NULL and never calls next() on a drained iterator.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
This depends on Kang Chen's fix and fails without it:
https://lore.kernel.org/bpf/20261110125106.2935677-1-k.chen@smail.nju.edu.cn/
Kang, feel free to carry it as 2/2 in your v2.

 .../selftests/bpf/prog_tests/dmabuf_iter.c    | 19 +++++++++++++++++++
 .../testing/selftests/bpf/progs/dmabuf_iter.c | 19 +++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
index 1a5dc1adae73..c1f81b5dccdc 100644
--- a/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
+++ b/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
@@ -265,6 +265,23 @@ static void subtest_dmabuf_iter_check_open_coded(struct dmabuf_iter *skel, int m
 	} while (bpf_map_get_next_key(map_fd, key, key));
 }
 
+static void subtest_dmabuf_iter_check_next_after_drain(struct dmabuf_iter *skel)
+{
+	LIBBPF_OPTS(bpf_test_run_opts, topts);
+	int err, fd;
+
+	fd = bpf_program__fd(skel->progs.iter_dmabuf_next_after_drain);
+
+	err = bpf_prog_test_run_opts(fd, &topts);
+	if (!ASSERT_OK(err, "test_run_opts err"))
+		return;
+	if (!ASSERT_OK(topts.retval, "test_run_opts retval"))
+		return;
+
+	/* The test buffers exist, so a restarted iteration would find one */
+	ASSERT_EQ(skel->data->next_after_drain, 0, "next_after_drain");
+}
+
 void test_dmabuf_iter(void)
 {
 	struct dmabuf_iter *skel = NULL;
@@ -315,6 +332,8 @@ void test_dmabuf_iter(void)
 	}
 	if (test__start_subtest("open_coded"))
 		subtest_dmabuf_iter_check_open_coded(skel, map_fd);
+	if (test__start_subtest("next_after_drain"))
+		subtest_dmabuf_iter_check_next_after_drain(skel);
 
 destroy:
 	destroy_test_buffers();
diff --git a/tools/testing/selftests/bpf/progs/dmabuf_iter.c b/tools/testing/selftests/bpf/progs/dmabuf_iter.c
index 9cbb7442646e..d5421b75c39c 100644
--- a/tools/testing/selftests/bpf/progs/dmabuf_iter.c
+++ b/tools/testing/selftests/bpf/progs/dmabuf_iter.c
@@ -99,3 +99,22 @@ int iter_dmabuf_for_each(const void *ctx)
 
 	return 0;
 }
+
+/* Result of a bpf_iter_dmabuf_next() call after the iterator was drained */
+__u64 next_after_drain = -1;
+
+SEC("syscall")
+int iter_dmabuf_next_after_drain(const void *ctx)
+{
+	struct bpf_iter_dmabuf it;
+
+	bpf_iter_dmabuf_new(&it);
+	while (bpf_iter_dmabuf_next(&it))
+		;
+
+	/* Store the raw value; the verifier would remove a branch on it */
+	next_after_drain = (__u64)bpf_iter_dmabuf_next(&it);
+	bpf_iter_dmabuf_destroy(&it);
+
+	return 0;
+}
-- 
2.56.0.567.gdb80ae8cd5-goog

