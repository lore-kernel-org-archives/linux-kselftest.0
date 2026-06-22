Received: from cvsmtppost02.nmdf.navercorp.com (cvsmtppost02.nmdf.navercorp.com [114.111.35.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F9E3624C9
	for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 07:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.60
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782112627; cv=none; b=ufh/5qe6OejqL/F3/AjCiLpsEHSIqBPlVIIZQWL6MVoSLNl2KyRuYhTQZ0R70o5qTkT9Lf0iykm1tJZtCrm5W/waQK3/ojNr3iK4AceqdH3cDaD1dM8I3JYOeLI1XO8feHRh5X3eB4KfClF7aLmjWUizLhJWAVPjlTBkVDLQHpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782112627; c=relaxed/simple;
	bh=h+DzAsJa7hv5asI+paF0edZJsKW8tnFqF6EqOQnPl7I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k5ZDcnQ0iN9EmX3ew0tG9GMDTjsrIpAQNLef3J9PkZPwB1kGn9HoK9Qjccv5ZPuLwBRnthwMwLZXMbK97LsN5GxK2f0645mrgRQv+XtPES0qhODBNoYC89E8jhN2sa+/8lsWVkwqsR2NPt600wLCqFPBowMjL2SAytqj5wcZLT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=navercorp.com; spf=pass smtp.mailfrom=navercorp.com; dkim=pass (2048-bit key) header.d=navercorp.com header.i=@navercorp.com header.b=o9GE1F8I; arc=none smtp.client-ip=114.111.35.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=navercorp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=navercorp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=navercorp.com header.i=@navercorp.com header.b="o9GE1F8I"
Received: from kr0m-real-1 ([10.111.46.243])
  by cvsmtppost02.nmdf.navercorp.com with ESMTP id w2vTzY+FTGiFdZq60NqKiw
  for <linux-kselftest@vger.kernel.org>;
  Mon, 22 Jun 2026 07:17:03 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=navercorp.com;
	s=s20171120; t=1782112623;
	bh=h+DzAsJa7hv5asI+paF0edZJsKW8tnFqF6EqOQnPl7I=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=o9GE1F8IGv0wBjXClWMa6cGENwDQjV0C5GjW/gF5NE7DzsxNWyUrlhshzzFHsmr7o
	 pXSiruT9jgwVdbVTkqkdsgInwUANsRrjrAUF+3FuYFMWKyTRLdtnXGojMZ8FwpwSwr
	 dG1oxFvHRHWCvLYgA2zO3HOafX1lUZirWyJxhQdpKit7Sno+W88/S6NyVwBF51XSxM
	 6iSOzJxz2ZC03HlGI6fCwvTNw+5LiTVO/jHCeUKOqKa4oE4BgHjFviQE0lQceMPLgU
	 DSxdlpy9VOZL8WD7qSX3dI8yyuhLzKrWpThNmPhJegBRWzvtKR3bPOLdwW8HxtCngE
	 HH2baEo/nj3yg==
X-Session-ID: g4nwRDNJRB6op9m5mXb8fQ
X-Works-Send-Opt: T9YwjAumKAumKAbZjAgmKqKXKoJYFHmwFBwYjHmm
X-Works-Smtp-Source: Pmn/KAU/FqJZ+HmZKoUm+6E=
Received: from localhost.localdomain ([10.25.121.184])
  by cvnsmtp02.nmdf.navercorp.com with ESMTP id g4nwRDNJRB6op9m5mXb8fQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_CHACHA20_POLY1305_SHA256);
  Mon, 22 Jun 2026 07:17:02 -0000
From: Gyutae Bae <gyutae.opensource@navercorp.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	bpf@vger.kernel.org
Cc: John Fastabend <john.fastabend@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Minsu Jeon <minsu.jeon@navercorp.com>,
	Siwan Kim <siwan.kim@navercorp.com>,
	Jonghyeon Kim <jong-hyeon.kim@navercorp.com>,
	Gyutae Bae <gyutae.bae@navercorp.com>
Subject: [RFC bpf-next 2/3] bpf: implement compare-and-delete (BPF_F_COMPARE) for BPF_MAP_TYPE_HASH
Date: Mon, 22 Jun 2026 16:16:48 +0900
Message-Id: <20260622071649.31541-3-gyutae.opensource@navercorp.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260622071649.31541-1-gyutae.opensource@navercorp.com>
References: <20260622071649.31541-1-gyutae.opensource@navercorp.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gyutae Bae <gyutae.bae@navercorp.com>

map_delete_elem() now honours BPF_F_COMPARE: it copies the expected
bytes, validates the compare window against value_size, and dispatches to a
new ->map_delete_elem_cmp().  The hash-map implementation, under the bucket
lock, memcmps the [off, off+size) window of the live value and unlinks only
on a match (mismatch -EBUSY, absent -ENOENT), making the compare and the
delete atomic w.r.t. every bucket-lock holder.  Only BPF_MAP_TYPE_HASH
wires up the op; every other map type lacks it and returns -EOPNOTSUPP.

Atomicity boundary: the compare is read under the bucket lock, so it is
atomic against every other bucket-lock holder (concurrent deletes,
element-replacing updates).  It is NOT mutual exclusion against a BPF
program that writes the value in place via the pointer from
bpf_map_lookup_elem(), which takes no bucket lock; against such a writer
the compare may observe a torn value within the locked section.  For a
meaningful result the compared region should be a synchronization variable
-- written with a single aligned store such as a monotonic revision, or
replaced via an update -- not a multi-field blob mutated in place.

It compares the raw stored value, so maps whose value carries BTF-managed
fields (bpf_spin_lock, bpf_timer, kptr, ...) are also rejected with
-EOPNOTSUPP: those bytes are sanitised on lookup, so a raw compare would
never match the caller's snapshot and could expose kernel-internal bytes.

BPF_MAP_DELETE_ELEM_LAST_FIELD now reaches compare_size, so the compare*
fields pass CHECK_ATTR even without BPF_F_COMPARE.  Reject that combination
with -EINVAL: a dropped flag must not silently turn a compare-and-delete
into an unconditional delete.

Co-developed-by: Minsu Jeon <minsu.jeon@navercorp.com>
Signed-off-by: Minsu Jeon <minsu.jeon@navercorp.com>
Co-developed-by: Siwan Kim <siwan.kim@navercorp.com>
Signed-off-by: Siwan Kim <siwan.kim@navercorp.com>
Co-developed-by: Jonghyeon Kim <jong-hyeon.kim@navercorp.com>
Signed-off-by: Jonghyeon Kim <jong-hyeon.kim@navercorp.com>
Signed-off-by: Gyutae Bae <gyutae.bae@navercorp.com>
---
 include/linux/bpf.h  |  2 ++
 kernel/bpf/hashtab.c | 39 ++++++++++++++++++++++++++++++++
 kernel/bpf/syscall.c | 54 +++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 92 insertions(+), 3 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 7719f6528445..2e858272f7a7 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -110,6 +110,8 @@ struct bpf_map_ops {
 	void *(*map_lookup_elem)(struct bpf_map *map, void *key);
 	long (*map_update_elem)(struct bpf_map *map, void *key, void *value, u64 flags);
 	long (*map_delete_elem)(struct bpf_map *map, void *key);
+	long (*map_delete_elem_cmp)(struct bpf_map *map, void *key,
+				    const void *compare, u32 off, u32 size);
 	long (*map_push_elem)(struct bpf_map *map, void *value, u64 flags);
 	long (*map_pop_elem)(struct bpf_map *map, void *value);
 	long (*map_peek_elem)(struct bpf_map *map, void *value);
diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
index 9f394e1aa2e8..8fc3ab938b9e 100644
--- a/kernel/bpf/hashtab.c
+++ b/kernel/bpf/hashtab.c
@@ -1534,6 +1534,44 @@ static long htab_map_delete_elem(struct bpf_map *map, void *key)
 	return ret;
 }
 
+static long htab_map_delete_elem_cmp(struct bpf_map *map, void *key,
+				     const void *compare, u32 off, u32 size)
+{
+	struct bpf_htab *htab = container_of(map, struct bpf_htab, map);
+	struct hlist_nulls_head *head;
+	struct bucket *b;
+	struct htab_elem *l;
+	unsigned long flags;
+	u32 hash, key_size;
+	int ret;
+
+	WARN_ON_ONCE(!bpf_rcu_lock_held());
+
+	key_size = map->key_size;
+
+	hash = htab_map_hash(key, key_size, htab->hashrnd);
+	b = __select_bucket(htab, hash);
+	head = &b->head;
+
+	ret = htab_lock_bucket(b, &flags);
+	if (ret)
+		return ret;
+
+	l = lookup_elem_raw(head, hash, key, key_size);
+	if (!l)
+		ret = -ENOENT;
+	else if (memcmp(htab_elem_value(l, key_size) + off, compare, size) != 0)
+		ret = -EBUSY;
+	else
+		hlist_nulls_del_rcu(&l->hash_node);
+
+	htab_unlock_bucket(b, flags);
+
+	if (!ret)
+		free_htab_elem(htab, l);	/* ret==0 implies we unlinked l */
+	return ret;
+}
+
 static long htab_lru_map_delete_elem(struct bpf_map *map, void *key)
 {
 	struct bpf_htab *htab = container_of(map, struct bpf_htab, map);
@@ -2366,6 +2404,7 @@ const struct bpf_map_ops htab_map_ops = {
 	.map_lookup_and_delete_elem = htab_map_lookup_and_delete_elem,
 	.map_update_elem = htab_map_update_elem,
 	.map_delete_elem = htab_map_delete_elem,
+	.map_delete_elem_cmp = htab_map_delete_elem_cmp,
 	.map_gen_lookup = htab_map_gen_lookup,
 	.map_seq_show_elem = htab_map_seq_show_elem,
 	.map_set_for_each_callback_args = map_set_for_each_callback_args,
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index b44106c8ea75..42fc432f82e1 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -1892,18 +1892,30 @@ static int map_update_elem(union bpf_attr *attr, bpfptr_t uattr)
 	return err;
 }
 
-#define BPF_MAP_DELETE_ELEM_LAST_FIELD key
+#define BPF_MAP_DELETE_ELEM_LAST_FIELD compare_size
 
 static int map_delete_elem(union bpf_attr *attr, bpfptr_t uattr)
 {
 	bpfptr_t ukey = make_bpfptr(attr->key, uattr.is_kernel);
 	struct bpf_map *map;
-	void *key;
+	void *key, *compare = NULL;
+	u32 off = 0, size = 0;
 	int err;
 
 	if (CHECK_ATTR(BPF_MAP_DELETE_ELEM))
 		return -EINVAL;
 
+	if (attr->flags & ~BPF_F_COMPARE)
+		return -EINVAL;
+
+	/* The compare* fields are meaningful only with BPF_F_COMPARE.  Reject them
+	 * when the flag is absent so a dropped BPF_F_COMPARE cannot silently turn a
+	 * compare-and-delete into an unconditional delete.
+	 */
+	if (!(attr->flags & BPF_F_COMPARE) &&
+	    (attr->compare || attr->compare_offset || attr->compare_size))
+		return -EINVAL;
+
 	CLASS(fd, f)(attr->map_fd);
 	map = __bpf_map_get(f);
 	if (IS_ERR(map))
@@ -1920,6 +1932,38 @@ static int map_delete_elem(union bpf_attr *attr, bpfptr_t uattr)
 		goto err_put;
 	}
 
+	if (attr->flags & BPF_F_COMPARE) {
+		bpfptr_t ucmp = make_bpfptr(attr->compare, uattr.is_kernel);
+
+		off = attr->compare_offset;
+		size = attr->compare_size ?: map->value_size;
+		/* off + size must fit in value_size, overflow-safe */
+		if (size > map->value_size || off > map->value_size - size) {
+			err = -EINVAL;
+			goto out;
+		}
+		if (!map->ops->map_delete_elem_cmp) {
+			err = -EOPNOTSUPP;
+			goto out;
+		}
+		/* Compare-and-delete reads the raw stored value.  Maps whose value carries
+		 * BTF-managed fields (bpf_spin_lock, bpf_timer, kptr, ...) have
+		 * those bytes sanitised on lookup, so a raw compare would never
+		 * match the caller's snapshot and could expose kernel-internal
+		 * bytes.  Reject such maps for now.
+		 */
+		if (!IS_ERR_OR_NULL(map->record)) {
+			err = -EOPNOTSUPP;
+			goto out;
+		}
+		compare = kvmemdup_bpfptr(ucmp, size);
+		if (IS_ERR(compare)) {
+			err = PTR_ERR(compare);
+			compare = NULL;
+			goto out;
+		}
+	}
+
 	if (bpf_map_is_offloaded(map)) {
 		err = bpf_map_offload_delete_elem(map, key);
 		goto out;
@@ -1932,12 +1976,16 @@ static int map_delete_elem(union bpf_attr *attr, bpfptr_t uattr)
 
 	bpf_disable_instrumentation();
 	rcu_read_lock();
-	err = map->ops->map_delete_elem(map, key);
+	if (compare)
+		err = map->ops->map_delete_elem_cmp(map, key, compare, off, size);
+	else
+		err = map->ops->map_delete_elem(map, key);
 	rcu_read_unlock();
 	bpf_enable_instrumentation();
 	if (!err)
 		maybe_wait_bpf_programs(map);
 out:
+	kvfree(compare);
 	kvfree(key);
 err_put:
 	bpf_map_write_active_dec(map);
-- 
2.39.5 (Apple Git-154)

