Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759311;
	b=aDxy7jB/fOTwudnnz//kUG2m8RD/7n4C4b8mAIht1KzkK0FLM/ln5BRi8DCOVzUceaKV
	 pzxiZ7+Ch0Ji3m5rRZDK0BnhZZ12J5YenpV7KrEVgANInnEfGRq2BFXK5+vaRClYBpLGw
	 Nqw571EymsmAFhNF10WZfRJXWTmcmbqP1ZNgmeAVnbztU2xBFFD/UUf48e4apM/wd9UDb
	 HF0Oldv7HUBVkHc0SMghm+03rmqCPS8tbzTn0SKXTSMGb7RspARVSrbVljg5gSiHqYnQD
	 x75/+Acd8O0Fyw7KlfQ2272UX09zUt1v1Z6BKkJom1Ixv26nL0O/OFI5rhevQLkAVUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=pllLqFu+4Zv9EXcFMsURZ0heoaKm7NbP0cOiSWm0lgI=;
	b=eoZ0yj5tvR+SyVk7ucC3Z7EtG4FIzS5LOTLHIQZZghVZaWkvQ8nRmAiHu0QBR6BTG5DE
	 w5D0YfQ6eKcaCweVvLE7kHU4Ag0RNqt3aBIBQi7riC+zlmiyj2ZHfR82s1MQojJu/NleN
	 w7UMHuBsjlp3Vas4bc7MWsIt1krSntTpeqshdC6Qy3auUzdAk+Gqf4EDyEZFkb+VLnCWQ
	 4erJPZOaCDOb2Jm1/mbzHvwLd4Mxaa/6jcvLljqaOZsY2oLclVpz4HnVTUBrfxubpmG42
	 Go8Fe06A37vwlmxG+KZqDIBjB/bn/k4DvS+qQbQg8ROWchd/ep7L9f2M7SzkXuOpgng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTMmHOX7;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB87A606A329
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 02:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB87A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTMmHOX7
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso98981a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 18:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793759309; x=1794364109; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pllLqFu+4Zv9EXcFMsURZ0heoaKm7NbP0cOiSWm0lgI=;
        b=jTMmHOX7ft2XTe8GK8vwACY1tXp8EJI5KE+WW3x4XlyGAe3Dp9LXJ5hhCmY18wfRHW
         ThaMyY1DM9uY1WCIDnqpwj0XiENItgSnkLGEpZDqH7sVW9Rk/4vxgpPhqVo8FFZoWMqq
         BAMb6ubQ4R4P86LFCOuW1dV5KHfOp9yRVmpVJuDM9WRVpxLINhylfgx5hzvt25UG2GdB
         t6bzF2/jFonAiXnp5JZ7P8ikEF0JfKKfRM55jw7QkOj2ek+7HpVc9YimTZieFAsJs7p5
         pNje15tc4n1ZKiWAk6pQr+r3VxHV2obAK0uAA7LLpp/pxTi5kWYFRLGpQjQ3AAJwi8/r
         erBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793759309; x=1794364109;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pllLqFu+4Zv9EXcFMsURZ0heoaKm7NbP0cOiSWm0lgI=;
        b=VaPsjzGdDdAOMgG5pNodjz+1R9Z+c9BKF5WrQWI9e6JTdUhJX8PjMyl1k6zG46yfm8
         AcvzCmkl4MDiejU4/m1lJWqjoXtp3jyRc4itV6rAxPIK5daVIqxa8NtWNxk52JSS7pzE
         PrHt+7r8gfX7lKpNuqOTa4gGZ/1pdw6KhEnbe27OEzySBExYVg0SOBOYdkwjllqkzCEJ
         FbaFu89aZlDuhiKaJQHfWpIVmb93zmSqf1IhhOC9pWaH+7M3q6oZyCWzwLieRn6eGpau
         8TxaSDzn8OojPaiLtOFY6fQY08fVHuggJMJ+byNm+zBksJ/fy0tf5mKS+DLPm9KaSqQE
         ZDwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpMbnUT6zo0Eozehk5SRyFfL8TBpCO5X6VMZPckN64HgnxNCqOminGEB7rlz0zOLDMrW+eHIcuDK5XduK/3IE=@vger.kernel.org
X-Gm-Message-State: APuU4Z85JTHZAHB7jDrX2/KY7jUe+xBwv3dmCJo249owKrOutO8lJvVh
	nhoE3jj6FbWZuibdM5bu5+x4o3XE6S75tVBYx3P14UsGxneR6dHP+Y7L
X-Gm-Gg: AYBFou3mDyr9OXCOKgnPl/g0mTme6wmKLt4H9SRhIVq859My/ILkYSol2aBNZx3s4wU
	dpV56ZysSuwDt13LUV25gwz69df/KlNcz5eZatB63uzEAp8BzY4EdnelUR/A+o9QJedF7ZtMAZ1
	KByiElN4tC0exZY0UQelNAohRyd/D/6xdiH8AgvAzS8lBCxlb2vi7rbPS4YqIlEFtNmAUwG5/RP
	IBksbJ0S3kTAGgfoTsq6QJZK6zZuyXykLjtn6KgveIrGC17ezpDqO7EqDnf88/WA46dIP63um/v
	Mw2VQuZYu6zH9q2NhqSyphGx4eFx+CUg9yUXIW+PYt/g2MV+2uh0GIQrnmF6k7lE8RmS2O2hEAi
	hBGcxmqRVQoY3bR6fhgs/aSWG6lhSp5zLvL0S4JWACUdeMdmTxCyo5eBbkp2kZz6EYw7FdQHxMg
	RLPbeWz/GvWOFZsyuPggso3jlZA6TmXd/L4HZCEo7a0QRx1k3XiYPpLbPyBul3A7jtkEvgwDDIx
	rD2fAqWMkDx/KjrBsDnFuy/cgXk4/U3NYyJcxwyqqDBFdvwlDrR04u/3OvAm05apvQh48dpNRh/
	3zw/+2b92gsZj67+RWULs+Rk4zYxhmiFpmpnDaz86KZpBhrvO8z/NnrAGypBn8/2xdAO4egNh6U
	zBkSG28OiiPBwmj+m/aEXtsuUGhUNftTEzQ==
X-Received: by 2002:a17:90b:44:b0:3ab:ab5a:ef06 with SMTP id 98e67ed59e1d1-3ae896f832bmr13011731a91.12.1793759308868;
        Tue, 03 Nov 2026 18:28:28 -0800 (PST)
Received: from localhost ([153.61.198.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b096b6116bsm565015a91.4.2026.11.03.18.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 18:28:28 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 02:28:28 +0000
Message-Id: <DMM2LU4OE14Q.15KT5S3KNYPHX@gmail.com>
Cc: <qmo@kernel.org>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <ihor.solodrai@linux.dev>, <linux-kselftest@vger.kernel.org>,
 <skokovmaksimevg@gmail.com>, <daniel@iogearbox.net>
Subject: Re: [PATCH bpf-next v10 3/4] bpftool: Add recursive map dumping
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Tianyi Chen" <hi@tychen.cc>, <bpf@vger.kernel.org>
In-Reply-To: <8f2668ed4cd086f5fe3abb7ad0ca35066999ec49.1793732336.git.hi@tychen.cc>
References: <cover.1793732336.git.hi@tychen.cc> <8f2668ed4cd086f5fe3abb7ad0ca35066999ec49.1793732336.git.hi@tychen.cc>
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

On Tue, Nov 03, 2026 at 11:01 AM Tianyi Chen <hi@tychen.cc> wrote:
> Holding every discovered inner-map FD open would make descriptor use
> grow with the number of maps and could exhaust RLIMIT_NOFILE. Keep the
> selected map FDs open, queue distinct inner map IDs, and open, dump and
> close each queued map in turn. This needs only one additional map FD.
> The tradeoff is deferred ID resolution: concurrently removed inner
> maps can disappear before they are opened, so the dump is not atomic.

This is overkill.
The kernel has one level of map-in-map. bpf_map_meta_alloc() rejects
an inner map that has inner maps. Nothing recurses here.

Lets dump the inner map at the place that prints its id:
open it by id, dump it, close it. That's one more fd too.
These go away: struct map_dump_ctx, the hashmap, pending_ids,
plain_btf_wtr, the pass that records the selected maps,
the second loop in do_dump().
The selected fds don't have to stay open.

                      this patch               inner map in its entry
  ------------------  -----------------------  ------------------------
  json output         array of map objects,    same entries as without
                      the reader joins by id   'recursive', plus
                                               "inner_map"
  from id to open     all maps in front of it  nothing
                      in the queue are dumped
  inner map is gone   the whole dump fails     error in this entry,
                                               like a failed lookup
  shared inner map    printed once             printed in every entry

Inner maps get replaced on a live system. That's what map-in-map is for.
The longer the queue the more likely the dump fails.
The last row is the price. I think it's fine.

Something like this (not even compile tested):

diff --git a/tools/bpf/bpftool/Documentation/bpftool-map.rst b/tools/bpf/bpftool/Documentation/bpftool-map.rst
index e4ed7e7..0f0b1d9 100644
--- a/tools/bpf/bpftool/Documentation/bpftool-map.rst
+++ b/tools/bpf/bpftool/Documentation/bpftool-map.rst
@@ -29,7 +29,7 @@ MAP COMMANDS
 | **bpftool** **map create**     *FILE* **type** *TYPE* **key** *KEY_SIZE* **value** *VALUE_SIZE* \
 |     **entries** *MAX_ENTRIES* **name** *NAME* [**flags** *FLAGS*] [**inner_map** *MAP*] \
 |     [**offload_dev** *NAME*]
-| **bpftool** **map dump**       *MAP*
+| **bpftool** **map dump**       *MAP* [**recursive**]
 | **bpftool** **map update**     *MAP* [**key** *DATA*] [**value** *VALUE*] [*UPDATE_FLAGS*]
 | **bpftool** **map lookup**     *MAP* [**key** *DATA*]
 | **bpftool** **map getnext**    *MAP* [**key** *DATA*]
@@ -87,10 +87,13 @@ bpftool map create *FILE* type *TYPE* key *KEY_SIZE* value *VALUE_SIZE*  entries
     Keyword **offload_dev** expects a network interface name, and is used to
     request hardware offload for the map.

-bpftool map dump    *MAP*
+bpftool map dump    *MAP* [recursive]
     Dump all entries in a given *MAP*.  In case of **name**, *MAP* may match
     several maps which will all be dumped.

+    With **recursive**, an entry of an **array_of_maps** or a **hash_of_maps**
+    also has the dump of the inner map that it refers to.
+
 bpftool map update  *MAP* [key *DATA*] [value *VALUE*] [*UPDATE_FLAGS*]
     Update map entry for a given *KEY*.

diff --git a/tools/bpf/bpftool/bash-completion/bpftool b/tools/bpf/bpftool/bash-completion/bpftool
index a28af31..78fdb93 100644
--- a/tools/bpf/bpftool/bash-completion/bpftool
+++ b/tools/bpf/bpftool/bash-completion/bpftool
@@ -718,6 +718,9 @@ _bpftool()
                             return 0
                             ;;
                         *)
+                            if [[ $command == dump && $cword -eq 5 ]]; then
+                                COMPREPLY=( $( compgen -W 'recursive' -- "$cur" ) )
+                            fi
                             return 0
                             ;;
                     esac
diff --git a/tools/bpf/bpftool/map.c b/tools/bpf/bpftool/map.c
index 4b65edf..0b3968b 100644
--- a/tools/bpf/bpftool/map.c
+++ b/tools/bpf/bpftool/map.c
@@ -22,6 +22,9 @@
 #include "main.h"

 static struct hashmap *map_table;
+static bool recursive_dump;
+
+static void dump_inner_map(__u32 id);

 static bool map_is_per_cpu(__u32 type)
 {
@@ -140,9 +143,14 @@ static void print_entry_json(struct bpf_map_info *info, unsigned char *key,
 		print_hex_data_json(key, info->key_size);
 		jsonw_name(json_wtr, "value");
 		print_hex_data_json(value, info->value_size);
-		if (map_is_map_of_maps(info->type))
+		if (map_is_map_of_maps(info->type)) {
 			jsonw_uint_field(json_wtr, "inner_map_id",
 					 *(unsigned int *)value);
+			if (recursive_dump) {
+				jsonw_name(json_wtr, "inner_map");
+				dump_inner_map(*(unsigned int *)value);
+			}
+		}
 		if (btf) {
 			struct btf_dumper d = {
 				.btf = btf,
@@ -273,6 +281,8 @@ static void print_entry_plain(struct bpf_map_info *info, unsigned char *key,
 		}

 		printf("\n");
+		if (recursive_dump && map_is_map_of_maps(info->type))
+			dump_inner_map(*(unsigned int *)value);
 	} else {
 		unsigned int step;
 		int i;
@@ -929,6 +939,36 @@ exit_free:
 	return err;
 }

+/* The kernel has one level of map-in-map. An inner map has no inner maps. */
+static void dump_inner_map(__u32 id)
+{
+	LIBBPF_OPTS(bpf_get_fd_by_id_opts, opts, .open_flags = BPF_F_RDONLY);
+	struct bpf_map_info info = {};
+	json_writer_t *btf_wtr = NULL;
+	__u32 len = sizeof(info);
+	int fd;
+
+	fd = bpf_map_get_fd_by_id_opts(id, &opts);
+	if (fd < 0) {
+		p_err("can't get map by id (%u): %s", id, strerror(errno));
+		return;
+	}
+	if (bpf_map_get_info_by_fd(fd, &info, &len)) {
+		p_err("can't get map info: %s", strerror(errno));
+		goto out;
+	}
+
+	if (!json_output && info.btf_id)
+		btf_wtr = get_btf_writer();
+
+	map_dump(fd, &info, json_output ? json_wtr : btf_wtr, true);
+
+	if (btf_wtr)
+		jsonw_destroy(&btf_wtr);
+out:
+	close(fd);
+}
+
 static int do_dump(int argc, char **argv)
 {
 	json_writer_t *wtr = NULL, *btf_wtr = NULL;
@@ -938,8 +978,8 @@ static int do_dump(int argc, char **argv)
 	int *fds = NULL;
 	int err = -1;

-	if (argc != 2)
-		usage();
+	if (!REQ_ARGS(2))
+		return -1;

 	fds = malloc(sizeof(int));
 	if (!fds) {
@@ -950,6 +990,16 @@ static int do_dump(int argc, char **argv)
 	if (nb_fds < 1)
 		goto exit_free;

+	while (argc > 0) {
+		if (is_prefix(*argv, "recursive")) {
+			NEXT_ARG();
+			recursive_dump = true;
+		} else {
+			p_err("expected 'recursive', got: '%s'", *argv);
+			goto exit_close;
+		}
+	}
+
 	if (json_output) {
 		wtr = json_wtr;
 	} else {
@@ -994,6 +1044,7 @@ exit_close:
 exit_free:
 	free(fds);
 	free_btf_vmlinux();
+	recursive_dump = false;
 	return err;
 }

@@ -1502,7 +1553,7 @@ static int do_help(int argc, char **argv)
 		"       %1$s %2$s create     FILE type TYPE key KEY_SIZE value VALUE_SIZE \\\n"
 		"                                  entries MAX_ENTRIES name NAME [flags FLAGS] \\\n"
 		"                                  [inner_map MAP] [offload_dev NAME]\n"
-		"       %1$s %2$s dump       MAP\n"
+		"       %1$s %2$s dump       MAP [recursive]\n"
 		"       %1$s %2$s update     MAP [key DATA] [value VALUE] [UPDATE_FLAGS]\n"
 		"       %1$s %2$s lookup     MAP [key DATA]\n"
 		"       %1$s %2$s getnext    MAP [key DATA]\n"

