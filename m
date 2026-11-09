Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260403;
	b=kmzUdP3aOHqcNRl2jbsR7Q3yt8PZAJkG8jJjXwVHlMAzkGJqazTThYG6W9cUBn6GAZ08
	 Ktlod/H0r/Kn415IAP5sKis+fiLGmwoSE1R5fuxJPHshuTQZ6mby26cJJMs8sn2slfRNS
	 W7AP5va8qL7WPU9oQOoGMf8es2AbQJqFwiNjXBxT/nIgVhrlnisVPrTiFWQZ04tZUPX8a
	 P05XmRUGG0lVvTc+zh4W/ZrD/durNvibuUzSdSellMv/qOJBB0GF7wQfB9ZGh+HrNMLag
	 OiHZHEnYKsjZiC1rzDJqo7Z3YfXGMhQ5Qj04aOO9fjwpXnKAIFcSZIW6EyP575W1b5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=5Q+rFNtyMHkZBc3pYDUut4vgFs8/RjHebMEBZvgFrds=;
	b=mre3EPBwdC9qPIdvQpKcgmeM55sgOWd68EQA/hdyJd5Lji+QiGHEW3xGg7MYjn1tXlkO
	 w2yVfDN9DkF7kPcrQSdoj1IR/+2kArdnXy+KMJ16qRYFtoIBSSr5cLZK8N/2cjFIVDLUm
	 ZltcLnuVox2nXM+94kKrD/QTV1seM7NCNoCRdPnlIjmPNnKK1FgtL62C/9Nj4njQ2w5Mk
	 M3J5RMJV1/Vh8Reqb1g6e3it7Ml0p5cEnQeAJ2Fa0m8Eewi/lsfdeOvVh6q3T80PZLH9w
	 6seZoYyPEGHWnwk7w4ymTPEKp9rGmsLoOXrPVSpe7NlrbcQdbb2IuFe6keJuRqTJ/Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rm1hpY8g;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBC7606A325
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 21:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DBC7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rm1hpY8g
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so830883a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 13:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794260401; x=1794865201; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Q+rFNtyMHkZBc3pYDUut4vgFs8/RjHebMEBZvgFrds=;
        b=Rm1hpY8gfEyINhOtkOgrnAEGiQcAPiOZVGm75x9VWge/E/iDN+H2/6iGPRTgC0Wi1B
         CiSPqwv9uCF+dlnTtodztBTiayhTBF6J4Ddo7XF/TmZuZi/Ct56f6GIH7ViEqAJT6PrR
         nXJ6qs4d6SzzkeTohqRoKK9V7CgYd07edhPJ18kqyKpKbLTf23WgKkPdA1HCSiWUNATH
         LDqs1lvM4OI+lAqlr0jpvs2g35wFthNthACDgUpaBe09yW6GVjTiwMRu0sn8db5zUlLS
         jiTYl5EElbHN5jI1+P+dvLAMtOW5Tb5HQujODbHnpVEE3V1yxuo/gS1MnG2913GsLxsp
         3zAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260401; x=1794865201;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Q+rFNtyMHkZBc3pYDUut4vgFs8/RjHebMEBZvgFrds=;
        b=v2Nymg/XlD1+AVXs559f5TXtYJ0v2wuc8qpLsk0ifuuuZoYIKJucUAqYba90r8r4Vc
         Yvk+Abuu8ap3LZCqcF8Y7XYMHW7yhcR8N95lYkJ9ci5Ki0eqN9hVOL8Zftq5taFrVKcZ
         DgTdyTSajRscFMTYO1DLULhQ/kLbN2E2oppIyEcAIvrfwi7+7pRY2LMcS1KuEUnmDMRP
         I31645b2xdvoJFDGzDGaRY8r0HeRXIMqXoA4UvbZTsAVGBXEjYSsc8mI1ZhcgDAKxWLE
         Gc/b8B9Mqx51t5EiVf4RZzJ4jvatXHYpVE1a+jgWLTEUr35amFaOuz0zjRDyJvAk6rhT
         fvng==
X-Forwarded-Encrypted: i=1; AL+hErFP1o5JY7WLE5ec08grUGU51LiI6x+3gPiynY1qyY5aTaynXvpCdZCceWcj8O7/L/qcfcJH4xXQQaB5ISH9gzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Gf/DSbZUck4XFLp/tpc93o8QR4luQOPTfHglJy63V9L6U890f
	9XXXcl0fa5JX15fq3pUGiJJNwA1vEGBqe0qu/7eXUdlpF8I3z2s8Abgj
X-Gm-Gg: AYBFou2Z5mooIoKA/QBlAVQFDimFKZOgtL9FNFyICcYKLKk8C88zcPijzAR43TLcywM
	DuQz6O5HIEvjkHNr8aBkhgqagW9fWue9/Kt7wQLN7mGB5Nhz5Y8rTa1XpA7P3Q3JJ1r3DC7FUWV
	9YhBjFRbRAolXyvHjmt5qZNBEbbJG3cMavbnPC/0lJeuv61RX23rtPw+QBzq9pWLyTMuA8L50cW
	2/67r9ooVPbmym0y0s9o/v1GCiIqOEeAVDYeCyI4QWU6A+I5lxmf6I5Y6kmGLt9R1tASTf3SpMj
	PYfu9tFfBMCwdiLGudBp0O9uqI726zOpSNgiRUDr1dFgCm1b73/zsUjqFbN/eoxWblNpOiDCH+H
	NLdvpYSIA9jiOHoLyyyJi3pcKVdAVjdPrjBy9e7m1UtlTCYtqImboj5IAgUR7hS0Q76vEtfjUPN
	14HHMzVmzk33eLf7uDLW/Ys9KK02EmmEJ0ht24jKkRfNylcwuvsA6/VpL0YSDQK/snP2H1/CQsu
	5FMt2UuYbwpvylJbU0pgPZ4Xi0DjqNPQDqf79xMa/zKaIMgppBqA5BZleMUlKpJ5IctmHT6lcdj
	1IXYpMclTh3p7Uenbx2htCByPZot8345P4Oap0RUlwjgzGk+gCp4zrL1Fx6+HGzXaot8iQZpWal
	K2a1Dik2RPzysSE1dUBRKvjUDLWLXEj+0f99ZV4PFsuVtKNhtNTsItmJG
X-Received: by 2002:a17:90b:37c8:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3b166d1efc2mr878855a91.47.1794260401094;
        Mon, 09 Nov 2026 13:40:01 -0800 (PST)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16708f533sm1059428a91.2.2026.11.09.13.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 13:40:00 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 21:39:59 +0000
Message-Id: <DMR088J2OR6L.9TOD4IDBHTZ8@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, "Giuliano Procida"
 <gprocida@google.com>, "Neill Kapron" <nkapron@google.com>,
 =?utf-8?q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, "Maxime Ripard"
 <mripard@kernel.org>
Subject: Re: [PATCH RFC bpf-next 0/7] bpf: Support struct_ops in light
 skeletons
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Siddharth Nayyar"
 <sidnayyar@google.com>, "Daniel Borkmann" <daniel@iogearbox.net>, "John
 Fastabend" <john.fastabend@gmail.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Quentin Monnet" <qmo@kernel.org>,
 "Shuah Khan" <shuah@kernel.org>
In-Reply-To: <f5a22a46-0fd8-4739-bf11-a20e0b3a443b@linux.dev>
References: <20261106-lskel-struct-ops-v1-0-a4486ffc79cb@google.com> <f5a22a46-0fd8-4739-bf11-a20e0b3a443b@linux.dev>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 09, 2026 at 11:46 AM Ihor Solodrai <ihor.solodrai@linux.dev> wrote:

> Andrii, Alexei, wdyt? Any other ideas?

The loader asks the kernel for ids, sizes and offsets only to pass them
back in the next three commands:

  the loader asks                   and passes it back in
  --------------------------------  ------------------------------------
  id, size of bpf_struct_ops_<t>    BPF_MAP_CREATE
  id of <t>, index of the member    BPF_PROG_LOAD
  offset of data, of every member   BPF_MAP_UPDATE_ELEM

the kernel can match by name instead.

The kernel has both BTFs. BPF_MAP_CREATE of a struct_ops map demands
btf_fd of the object already, and bpf_struct_ops.c doesn't use it.
The kernel can find its struct_ops and the members by name,
like btf_parse_kptr() finds the type of a kptr.
Then the loader passes what bpftool knows when it generates
the skeleton:

  command              the loader passes
  -------------------  ---------------------------------------------------
  BPF_MAP_CREATE       btf_fd, btf_value_type_id and value_size of the
                       struct in the BTF of the object
  BPF_PROG_LOAD        attach_btf_obj_fd = btf_fd, attach_btf_id = that
                       struct, expected_attach_type = index of its member
  BPF_MAP_UPDATE_ELEM  that struct with the prog fds in it

The kernel rejects such BPF_MAP_CREATE and BPF_PROG_LOAD today.
Nothing changes for existing users.
The BTF of the object is in the blob, so the signature covers the names.

Then no need for a helper or a kfunc. The 4k buffer, the fds of module
BTF and the offsets at run time go away.
map->def.value_size, prog->attach_btf_id and prog->expected_attach_type
don't hold offsets into the blob.

The diff below replaces patches 1-5. Patches 6 and 7 stay.

Something like this (compile tested only):

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 520fd72e21fd..4adf8efeb990 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -2434,6 +2434,8 @@ void bpf_struct_ops_put(const void *kdata);
 int bpf_struct_ops_supported(const struct bpf_struct_ops *st_ops, u32 moff);
 int bpf_struct_ops_map_sys_lookup_elem(struct bpf_map *map, void *key,
 				       void *value);
+u32 bpf_struct_ops_map_update_size(const struct bpf_map *map);
+int bpf_struct_ops_resolve_attach(struct btf **btf, union bpf_attr *attr);
 int bpf_struct_ops_prepare_trampoline(struct bpf_tramp_nodes *tnodes,
 				      struct bpf_tramp_node *node,
 				      const struct btf_func_model *model,
@@ -2511,6 +2513,14 @@ static inline int bpf_struct_ops_map_sys_lookup_elem(struct bpf_map *map,
 {
 	return -EINVAL;
 }
+static inline u32 bpf_struct_ops_map_update_size(const struct bpf_map *map)
+{
+	return map->value_size;
+}
+static inline int bpf_struct_ops_resolve_attach(struct btf **btf, union bpf_attr *attr)
+{
+	return -ENOTSUPP;
+}
 static inline int bpf_struct_ops_link_create(union bpf_attr *attr)
 {
 	return -EOPNOTSUPP;
diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 62de0919db72..e0f7ec984c64 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -1598,6 +1598,13 @@ union bpf_attr {
 						   * struct stored as the
 						   * map value
 						   */
+		/*
+		 * BPF_MAP_TYPE_STRUCT_OPS takes one of the two ids.
+		 * btf_value_type_id is a struct in btf_fd, e.g. tcp_congestion_ops,
+		 * and value_size is its size. The kernel finds its struct_ops and
+		 * the members by name. BPF_MAP_UPDATE_ELEM takes the struct of
+		 * btf_fd. BPF_MAP_LOOKUP_ELEM returns the struct of the kernel.
+		 */
 		/* Any per-map-type extra fields
 		 *
 		 * BPF_MAP_TYPE_BLOOM_FILTER - the lowest 4 bits indicate the
@@ -1685,7 +1692,13 @@ union bpf_attr {
 		union {
 			/* valid prog_fd to attach to bpf prog */
 			__u32		attach_prog_fd;
-			/* or valid module BTF object fd or 0 to attach to vmlinux */
+			/*
+			 * or valid module BTF object fd or 0 to attach to vmlinux.
+			 * BPF_PROG_TYPE_STRUCT_OPS takes the BTF of the bpf object too.
+			 * Then attach_btf_id is a struct in that BTF and
+			 * expected_attach_type is the index of its member.
+			 * The kernel finds its struct_ops and the member by name.
+			 */
 			__u32		attach_btf_obj_fd;
 		};
 		__u32		core_relo_cnt;	/* number of bpf_core_relo */
diff --git a/kernel/bpf/bpf_struct_ops.c b/kernel/bpf/bpf_struct_ops.c
index 7c5cd6086e27..eb1144ca5c11 100644
--- a/kernel/bpf/bpf_struct_ops.c
+++ b/kernel/bpf/bpf_struct_ops.c
@@ -14,6 +14,7 @@
 #include <linux/rcupdate_wait.h>
 #include <linux/poll.h>
 #include <linux/bpf-cgroup.h>
+#include "../tools/lib/bpf/relo_core.h"
 
 struct bpf_struct_ops_value {
 	struct bpf_struct_ops_common_value common;
@@ -42,6 +43,12 @@ struct bpf_struct_ops_map {
 	void *image_pages[MAX_TRAMP_IMAGE_PAGES];
 	/* The owner moduler's btf. */
 	struct btf *btf;
+	/*
+	 * Like in CO-RE "local" is what the BTF of the bpf object has.
+	 * When local_type is set map_update_elem() takes this struct.
+	 */
+	struct btf *local_btf;
+	const struct btf_type *local_type;
 	/* uvalue->data stores the kernel struct
 	 * (e.g. tcp_congestion_ops) that is more useful
 	 * to userspace than the kvalue.  For example,
@@ -724,8 +731,136 @@ static void bpf_struct_ops_map_free_ksyms(struct bpf_struct_ops_map *st_map)
 	}
 }
 
-static long bpf_struct_ops_map_update_elem(struct bpf_map *map, void *key,
-					   void *value, u64 flags)
+static const struct btf_member *find_member(const struct btf *btf, const struct btf_type *t,
+					    const char *name)
+{
+	const struct btf_member *member;
+	u32 i;
+
+	for_each_member(i, t, member)
+		if (!strcmp(btf_name_by_offset(btf, member->name_off), name))
+			return member;
+	return NULL;
+}
+
+/*
+ * 'id' is a local struct, e.g. tcp_congestion_ops or tcp_congestion_ops___v2.
+ * Find bpf_struct_ops_tcp_congestion_ops in the BTF of vmlinux or of a module.
+ * A module can have it for a struct of vmlinux. The caller does btf_put(*kern_btf).
+ */
+static const struct bpf_struct_ops_desc *
+find_desc_by_local_type(const struct btf *btf, u32 id, struct btf **kern_btf)
+{
+	const struct btf_type *t = btf_type_by_id(btf, id);
+	const struct bpf_struct_ops_desc *st_ops_desc;
+	char name[KSYM_NAME_LEN];
+	const char *tname;
+	s32 value_id;
+
+	if (!t || !__btf_type_is_struct(t))
+		return ERR_PTR(-EINVAL);
+	tname = btf_name_by_offset(btf, t->name_off);
+	if (snprintf(name, sizeof(name), VALUE_PREFIX "%.*s",
+		     (int)bpf_core_essential_name_len(tname), tname) >= sizeof(name))
+		return ERR_PTR(-EINVAL);
+	value_id = bpf_find_btf_id(name, BTF_KIND_STRUCT, kern_btf);
+	if (value_id < 0)
+		return ERR_PTR(value_id);
+	st_ops_desc = bpf_struct_ops_find_value(*kern_btf, value_id);
+	if (!st_ops_desc) {
+		btf_put(*kern_btf);
+		return ERR_PTR(-ENOTSUPP);
+	}
+	return st_ops_desc;
+}
+
+/*
+ * attach_btf_id is a local struct and expected_attach_type is the index of its
+ * member. Replace them, and the BTF, with what the kernel has under the same names.
+ */
+int bpf_struct_ops_resolve_attach(struct btf **btf, union bpf_attr *attr)
+{
+	const struct bpf_struct_ops_desc *st_ops_desc;
+	const struct btf_member *member;
+	const struct btf_type *t;
+	struct btf *kern_btf;
+
+	st_ops_desc = find_desc_by_local_type(*btf, attr->attach_btf_id, &kern_btf);
+	if (IS_ERR(st_ops_desc))
+		return PTR_ERR(st_ops_desc);
+	t = btf_type_by_id(*btf, attr->attach_btf_id);
+	if (attr->expected_attach_type >= btf_type_vlen(t)) {
+		btf_put(kern_btf);
+		return -EINVAL;
+	}
+	member = btf_type_member(t) + attr->expected_attach_type;
+	member = find_member(kern_btf, st_ops_desc->type,
+			     btf_name_by_offset(*btf, member->name_off));
+	if (!member) {
+		btf_put(kern_btf);
+		return -ENOENT;
+	}
+	attr->attach_btf_id = st_ops_desc->type_id;
+	attr->expected_attach_type = member - btf_type_member(st_ops_desc->type);
+	btf_put(*btf);
+	*btf = kern_btf;
+	return 0;
+}
+
+u32 bpf_struct_ops_map_update_size(const struct bpf_map *map)
+{
+	const struct bpf_struct_ops_map *st_map = (const struct bpf_struct_ops_map *)map;
+
+	return st_map->local_type ? st_map->local_type->size : map->value_size;
+}
+
+/*
+ * 'data' has the layout of the local struct. Copy every member to the place
+ * of the member with the same name in the struct of the kernel.
+ */
+static void *local_to_kern_value(const struct bpf_struct_ops_map *st_map, const void *data)
+{
+	const struct btf_type *t = st_map->local_type, *kern_t = st_map->st_ops_desc->type;
+	const struct btf *btf = st_map->local_btf, *kern_btf = st_map->btf;
+	const struct btf_member *member, *kern_member;
+	struct bpf_struct_ops_value *value;
+	u32 i, size, kern_size;
+	int err = -EINVAL;
+
+	value = kvzalloc(st_map->map.value_size, GFP_USER);
+	if (!value)
+		return ERR_PTR(-ENOMEM);
+
+	for_each_member(i, t, member) {
+		const void *src = data + __btf_member_bit_offset(t, member) / 8;
+
+		if (__btf_member_bitfield_size(t, member) ||
+		    IS_ERR(btf_resolve_size(btf, btf_type_by_id(btf, member->type), &size)))
+			goto err;
+		kern_member = find_member(kern_btf, kern_t,
+					  btf_name_by_offset(btf, member->name_off));
+		if (!kern_member) {
+			/* This kernel doesn't have the member. That's fine when it's not in use. */
+			if (!memchr_inv(src, 0, size))
+				continue;
+			err = -ENOENT;
+			goto err;
+		}
+		if (__btf_member_bitfield_size(kern_t, kern_member) ||
+		    IS_ERR(btf_resolve_size(kern_btf, btf_type_by_id(kern_btf, kern_member->type),
+					    &kern_size)) ||
+		    size != kern_size)
+			goto err;
+		memcpy(value->data + __btf_member_bit_offset(kern_t, kern_member) / 8, src, size);
+	}
+	return value;
+err:
+	kvfree(value);
+	return ERR_PTR(err);
+}
+
+static long __bpf_struct_ops_map_update_elem(struct bpf_map *map, void *key,
+					     void *value, u64 flags)
 {
 	struct bpf_struct_ops_map *st_map = (struct bpf_struct_ops_map *)map;
 	const struct bpf_struct_ops_desc *st_ops_desc = st_map->st_ops_desc;
@@ -960,6 +1095,23 @@ static long bpf_struct_ops_map_update_elem(struct bpf_map *map, void *key,
 	return err;
 }
 
+static long bpf_struct_ops_map_update_elem(struct bpf_map *map, void *key,
+					   void *value, u64 flags)
+{
+	struct bpf_struct_ops_map *st_map = (struct bpf_struct_ops_map *)map;
+	long err;
+
+	if (!st_map->local_type)
+		return __bpf_struct_ops_map_update_elem(map, key, value, flags);
+
+	value = local_to_kern_value(st_map, value);
+	if (IS_ERR(value))
+		return PTR_ERR(value);
+	err = __bpf_struct_ops_map_update_elem(map, key, value, flags);
+	kvfree(value);
+	return err;
+}
+
 static long bpf_struct_ops_map_delete_elem(struct bpf_map *map, void *key)
 {
 	enum bpf_struct_ops_state prev_state;
@@ -1022,6 +1174,7 @@ static void __bpf_struct_ops_map_free(struct bpf_map *map)
 	bpf_map_area_free(st_map->ksyms);
 	bpf_struct_ops_map_free_image(st_map);
 	bpf_map_area_free(st_map->uvalue);
+	btf_put(st_map->local_btf);
 	bpf_map_area_free(st_map);
 }
 
@@ -1056,11 +1209,53 @@ static int bpf_struct_ops_map_alloc_check(union bpf_attr *attr)
 {
 	if (attr->key_size != sizeof(unsigned int) || attr->max_entries != 1 ||
 	    (attr->map_flags & ~(BPF_F_LINK | BPF_F_VTYPE_BTF_OBJ_FD)) ||
-	    !attr->btf_vmlinux_value_type_id)
+	    (!attr->btf_vmlinux_value_type_id && !attr->btf_value_type_id))
 		return -EINVAL;
 	return 0;
 }
 
+/*
+ * btf_value_type_id and value_size are of a local struct. Replace them with
+ * btf_vmlinux_value_type_id and value_size of the struct_ops with the same name,
+ * so that everything but map_update_elem() sees a regular struct_ops map.
+ * Return the local BTF. A module that has the struct_ops is pinned.
+ */
+static struct btf *local_to_kern_attr(union bpf_attr *attr, const struct btf_type **local_type,
+				      struct btf **kern_btf, struct module **mod)
+{
+	const struct bpf_struct_ops_desc *st_ops_desc;
+	struct btf *btf;
+
+	if (attr->btf_key_type_id || (attr->map_flags & BPF_F_VTYPE_BTF_OBJ_FD))
+		return ERR_PTR(-EINVAL);
+	btf = btf_get_by_fd(attr->btf_fd);
+	if (IS_ERR(btf))
+		return btf;
+	st_ops_desc = find_desc_by_local_type(btf, attr->btf_value_type_id, kern_btf);
+	if (IS_ERR(st_ops_desc)) {
+		btf_put(btf);
+		return ERR_CAST(st_ops_desc);
+	}
+	*local_type = btf_type_by_id(btf, attr->btf_value_type_id);
+	if (attr->value_size != (*local_type)->size)
+		goto err;
+	if (btf_is_module(*kern_btf)) {
+		*mod = btf_try_get_module(*kern_btf);
+		if (!*mod)
+			goto err;
+	}
+	attr->btf_value_type_id = 0;
+	attr->btf_vmlinux_value_type_id = st_ops_desc->value_id;
+	attr->value_size = st_ops_desc->value_type->size;
+	/* The module holds its BTF. The BTF of vmlinux doesn't go away. */
+	btf_put(*kern_btf);
+	return btf;
+err:
+	btf_put(*kern_btf);
+	btf_put(btf);
+	return ERR_PTR(-EINVAL);
+}
+
 static u32 count_func_ptrs(const struct btf *btf, const struct btf_type *t)
 {
 	int i;
@@ -1079,13 +1274,17 @@ static struct bpf_map *bpf_struct_ops_map_alloc(union bpf_attr *attr)
 	const struct bpf_struct_ops_desc *st_ops_desc;
 	size_t st_map_size;
 	struct bpf_struct_ops_map *st_map;
-	const struct btf_type *t, *vt;
+	const struct btf_type *t, *vt, *local_type = NULL;
+	struct btf *btf, *local_btf = NULL;
 	struct module *mod = NULL;
 	struct bpf_map *map;
-	struct btf *btf;
 	int ret;
 
-	if (attr->map_flags & BPF_F_VTYPE_BTF_OBJ_FD) {
+	if (attr->btf_value_type_id) {
+		local_btf = local_to_kern_attr(attr, &local_type, &btf, &mod);
+		if (IS_ERR(local_btf))
+			return ERR_CAST(local_btf);
+	} else if (attr->map_flags & BPF_F_VTYPE_BTF_OBJ_FD) {
 		/* The map holds btf for its whole life time. */
 		btf = btf_get_by_fd(attr->value_type_btf_obj_fd);
 		if (IS_ERR(btf))
@@ -1158,6 +1357,8 @@ static struct bpf_map *bpf_struct_ops_map_alloc(union bpf_attr *attr)
 		goto errout_free;
 	}
 	st_map->btf = btf;
+	st_map->local_btf = local_btf;
+	st_map->local_type = local_type;
 
 	mutex_init(&st_map->lock);
 	bpf_map_init_from_attr(map, attr);
@@ -1173,6 +1374,7 @@ static struct bpf_map *bpf_struct_ops_map_alloc(union bpf_attr *attr)
 	__bpf_struct_ops_map_free(map);
 errout:
 	module_put(mod);
+	btf_put(local_btf);
 
 	return ERR_PTR(ret);
 }
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 9004f2673ccf..d8d5a700c98f 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -1896,6 +1896,8 @@ static int map_update_elem(union bpf_attr *attr, bpfptr_t uattr)
 	}
 
 	value_size = bpf_map_value_size(map, attr->flags);
+	if (map->map_type == BPF_MAP_TYPE_STRUCT_OPS)
+		value_size = bpf_struct_ops_map_update_size(map);
 	value = kvmemdup_bpfptr(uvalue, value_size);
 	if (IS_ERR(value)) {
 		err = PTR_ERR(value);
@@ -3040,12 +3042,14 @@ static int bpf_prog_load(union bpf_attr *attr, bpfptr_t uattr, struct bpf_log_at
 				goto put_token;
 			}
 			if (!btf_is_kernel(attach_btf)) {
-				/* attaching through specifying bpf_prog's BTF
-				 * objects directly might be supported eventually
-				 */
-				btf_put(attach_btf);
+				/* only struct_ops can name its target in the BTF of the object */
 				err = -ENOTSUPP;
-				goto put_token;
+				if (type == BPF_PROG_TYPE_STRUCT_OPS)
+					err = bpf_struct_ops_resolve_attach(&attach_btf, attr);
+				if (err) {
+					btf_put(attach_btf);
+					goto put_token;
+				}
 			}
 		}
 	} else if (attr->attach_btf_id || multi_func) {
diff --git a/tools/include/uapi/linux/bpf.h b/tools/include/uapi/linux/bpf.h
index 62de0919db72..e0f7ec984c64 100644
--- a/tools/include/uapi/linux/bpf.h
+++ b/tools/include/uapi/linux/bpf.h
@@ -1598,6 +1598,13 @@ union bpf_attr {
 						   * struct stored as the
 						   * map value
 						   */
+		/*
+		 * BPF_MAP_TYPE_STRUCT_OPS takes one of the two ids.
+		 * btf_value_type_id is a struct in btf_fd, e.g. tcp_congestion_ops,
+		 * and value_size is its size. The kernel finds its struct_ops and
+		 * the members by name. BPF_MAP_UPDATE_ELEM takes the struct of
+		 * btf_fd. BPF_MAP_LOOKUP_ELEM returns the struct of the kernel.
+		 */
 		/* Any per-map-type extra fields
 		 *
 		 * BPF_MAP_TYPE_BLOOM_FILTER - the lowest 4 bits indicate the
@@ -1685,7 +1692,13 @@ union bpf_attr {
 		union {
 			/* valid prog_fd to attach to bpf prog */
 			__u32		attach_prog_fd;
-			/* or valid module BTF object fd or 0 to attach to vmlinux */
+			/*
+			 * or valid module BTF object fd or 0 to attach to vmlinux.
+			 * BPF_PROG_TYPE_STRUCT_OPS takes the BTF of the bpf object too.
+			 * Then attach_btf_id is a struct in that BTF and
+			 * expected_attach_type is the index of its member.
+			 * The kernel finds its struct_ops and the member by name.
+			 */
 			__u32		attach_btf_obj_fd;
 		};
 		__u32		core_relo_cnt;	/* number of bpf_core_relo */
diff --git a/tools/lib/bpf/bpf_gen_internal.h b/tools/lib/bpf/bpf_gen_internal.h
index 206adf28793d..caad131b0452 100644
--- a/tools/lib/bpf/bpf_gen_internal.h
+++ b/tools/lib/bpf/bpf_gen_internal.h
@@ -75,6 +75,9 @@ void bpf_gen__prog_load(struct bpf_gen *gen,
 			struct bpf_prog_load_opts *load_attr, int prog_idx);
 void bpf_gen__map_update_elem(struct bpf_gen *gen, int map_idx, void *value, __u32 value_size,
 			      __u64 flags);
+void bpf_gen__struct_ops_update_elem(struct bpf_gen *gen, int map_idx, void *value,
+				     __u32 value_size, const __u32 *fd_offs,
+				     const int *prog_idxs, int cnt);
 void bpf_gen__map_freeze(struct bpf_gen *gen, int map_idx);
 int bpf_gen__func_ptr_map_create(struct bpf_gen *gen, const char *map_name, int obj_map_idx,
 				 void *value, __u32 value_size, const __u32 *ptr_offs,
diff --git a/tools/lib/bpf/gen_loader.c b/tools/lib/bpf/gen_loader.c
index 555d4757a898..f496071a01f4 100644
--- a/tools/lib/bpf/gen_loader.c
+++ b/tools/lib/bpf/gen_loader.c
@@ -1113,6 +1113,10 @@ void bpf_gen__prog_load(struct bpf_gen *gen,
 	/* populate union bpf_attr with btf_fd saved in the stack earlier */
 	move_stack2blob(gen, attr_field(prog_load_attr, prog_btf_fd), 4,
 			stack_off(btf_fd));
+	if (prog_type == BPF_PROG_TYPE_STRUCT_OPS)
+		/* attach_btf_id is a struct in the BTF of the object */
+		move_stack2blob(gen, attr_field(prog_load_attr, attach_btf_obj_fd), 4,
+				stack_off(btf_fd));
 	if (gen->attach_kind) {
 		emit_find_attach_target(gen);
 		/* populate union bpf_attr with btf_id and btf_obj_fd found by helper */
@@ -1221,6 +1225,36 @@ void bpf_gen__map_update_elem(struct bpf_gen *gen, int map_idx, void *pvalue,
 	emit_map_update_elem(gen, map_idx, &attr, attr_size, key, value, value_size);
 }
 
+/*
+ * pvalue is the struct as the object has it. The kernel moves the members to
+ * where it has them. The fds of the programs prog_idxs go to fd_offs.
+ */
+void bpf_gen__struct_ops_update_elem(struct bpf_gen *gen, int map_idx, void *pvalue,
+				     __u32 value_size, const __u32 *fd_offs,
+				     const int *prog_idxs, int cnt)
+{
+	int attr_size = offsetofend(union bpf_attr, flags);
+	int value, key, zero = 0, i;
+	union bpf_attr attr;
+
+	memset(&attr, 0, attr_size);
+	value = add_data(gen, pvalue, value_size);
+	key = add_data(gen, &zero, sizeof(zero));
+
+	/* see bpf_gen__map_update_elem() */
+	if (!OPTS_GET(gen->opts, gen_hash, false))
+		emit_copy_initial_value(gen, map_idx, value, value_size, 0);
+
+	for (i = 0; i < cnt; i++) {
+		emit(gen, BPF_LDX_MEM(BPF_W, BPF_REG_0, BPF_REG_10,
+				      stack_off(prog_fd[prog_idxs[i]])));
+		emit2(gen, BPF_LD_IMM64_RAW_FULL(BPF_REG_1, BPF_PSEUDO_MAP_IDX_VALUE,
+						 0, 0, 0, value + fd_offs[i]));
+		emit(gen, BPF_STX_MEM(BPF_DW, BPF_REG_1, BPF_REG_0, 0));
+	}
+	emit_map_update_elem(gen, map_idx, &attr, attr_size, key, value, value_size);
+}
+
 void bpf_gen__populate_outer_map(struct bpf_gen *gen, int outer_map_idx, int slot,
 				 int inner_map_idx)
 {
diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 0e2a93a42908..3a0cabddb987 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -1459,6 +1459,24 @@ static int bpf_map__init_kern_struct_ops(struct bpf_map *map)
 	return 0;
 }
 
+/* The kernel finds its struct_ops and the members by the names that they have in obj->btf */
+static void bpf_map__init_gen_struct_ops(struct bpf_map *map)
+{
+	struct bpf_struct_ops *st_ops = map->st_ops;
+	__u32 i, vlen = btf_vlen(btf__type_by_id(map->obj->btf, st_ops->type_id));
+
+	map->mod_btf_fd = -1;
+	for (i = 0; i < vlen; i++) {
+		struct bpf_program *prog = st_ops->progs[i];
+
+		/* The kernel rejects a prog that two maps use for different members */
+		if (!prog || prog->attach_btf_id)
+			continue;
+		prog->attach_btf_id = st_ops->type_id;
+		prog->expected_attach_type = i;
+	}
+}
+
 static int bpf_object__init_kern_struct_ops_maps(struct bpf_object *obj)
 {
 	struct bpf_map *map;
@@ -1474,6 +1492,11 @@ static int bpf_object__init_kern_struct_ops_maps(struct bpf_object *obj)
 		if (!map->autocreate)
 			continue;
 
+		if (obj->gen_loader) {
+			bpf_map__init_gen_struct_ops(map);
+			continue;
+		}
+
 		err = bpf_map__init_kern_struct_ops(map);
 		if (err)
 			return err;
@@ -5609,7 +5632,8 @@ static int bpf_object__create_map(struct bpf_object *obj, struct bpf_map *map, b
 		map->btf_value_type_id = 0;
 		break;
 	case BPF_MAP_TYPE_STRUCT_OPS:
-		create_attr.btf_value_type_id = 0;
+		if (!obj->gen_loader)
+			create_attr.btf_value_type_id = 0;
 		break;
 	default:
 		break;
@@ -9761,6 +9785,46 @@ static int bpf_map_prepare_vdata(const struct bpf_map *map)
 	return 0;
 }
 
+/* The loader keeps the fds of the programs in the order of bpf_object__load_progs() */
+static int bpf_program_gen_idx(const struct bpf_program *prog)
+{
+	const struct bpf_program *p;
+	int idx = 0;
+
+	for (p = prog->obj->programs; p != prog; p++)
+		if (!prog_is_subprog(prog->obj, p) &&
+		    p->load_strategy == BPF_PROG_LOAD_STRATEGY_AUTO)
+			idx++;
+	return idx;
+}
+
+static int bpf_map_gen_struct_ops_update(struct bpf_map *map)
+{
+	struct bpf_struct_ops *st_ops = map->st_ops;
+	__u32 i, cnt = 0, *fd_offs = st_ops->kern_func_off;
+	struct bpf_object *obj = map->obj;
+	const struct btf_type *type;
+	int *prog_idxs;
+
+	type = btf__type_by_id(obj->btf, st_ops->type_id);
+	prog_idxs = calloc(btf_vlen(type), sizeof(*prog_idxs));
+	if (!prog_idxs)
+		return -ENOMEM;
+
+	for (i = 0; i < btf_vlen(type); i++) {
+		if (!st_ops->progs[i])
+			continue;
+		fd_offs[cnt] = btf_member_bit_offset(type, i) / 8;
+		/* struct bpf_program * doesn't go into the blob. The loader stores the fd here. */
+		memset(st_ops->data + fd_offs[cnt], 0, sizeof(__u64));
+		prog_idxs[cnt++] = bpf_program_gen_idx(st_ops->progs[i]);
+	}
+	bpf_gen__struct_ops_update_elem(obj->gen_loader, map - obj->maps, st_ops->data,
+					type->size, fd_offs, prog_idxs, cnt);
+	free(prog_idxs);
+	return 0;
+}
+
 static int bpf_object_prepare_struct_ops(struct bpf_object *obj)
 {
 	struct bpf_map *map;
@@ -9775,7 +9839,10 @@ static int bpf_object_prepare_struct_ops(struct bpf_object *obj)
 		if (!map->autocreate)
 			continue;
 
-		err = bpf_map_prepare_vdata(map);
+		if (obj->gen_loader)
+			err = bpf_map_gen_struct_ops_update(map);
+		else
+			err = bpf_map_prepare_vdata(map);
 		if (err)
 			return err;
 	}
