Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=63.250.43.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818508;
	b=tynJ2vEhogeeV5hZnsiVrin9JY6R9RLDBm3mcEDKDFmeqUD5cgwsWKdiN+EpTEBw1dRA
	 l2ssmTy2bMe8t9OZZQDR1cu72InB4ptUWCoLBOtMAc34umNeVBPJGefFNMtKcpNPWvSu8
	 dCrK3R8PbEqD/252cv0TI+OWZgaBOmsupWkrU0r4B1H22QajuiUHlkPHLwdeKvswYDL7S
	 33soJyC5nTDAj/ZG2hCYC3lZ2KUZoTG+jVSY+iPgcLCV4n8TiqGM7E5QiIrT+xRo55aj5
	 UvTsr90dNGze22KwAxX4lkB1w7BduD+e9aYkX+qBZSw4n4kePGAuJeRGrVewz/SJcaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818508;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=yPUP8DQT3iEU3BHJVt8YLSwUvlBNHcwPbG53FJAUAZ0=;
	b=NxuZRwMaw0pqI6dvS/fspmeMSZ4mb/IZg7dKzVlksujx/68/p31noUS5UI4A31UURmd8
	 rKEnppmX+H3gGEHh9uDkjaH3oj8b7IzQabjn5b+HNlx+O8UC5ZpuHRmhTp0tWZK9AHAgb
	 1w7rMQpy0mCJqNHJ/pAomctQVEkQ2oMw/7BsTlRX5QEK6CLU11JPp8Xius1EbBou6xbbz
	 LbixHlaSP2+kBG+MAWfT2nt1u2wzduJXszeMK7ElMswYZKXtTPLhPagCcFEtFoEkECcLG
	 Lttq3A9u9r4BBnzmT31BWm7uuOI45ACYTHYUUS+ru/N10Z3E+ruvDmae6etxxHVmJFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tychen.cc;
	spf=pass smtp.mailfrom=tychen.cc;
	dkim=pass header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=aag+E7Re;
	arc=none smtp.remote-ip=63.250.43.118
Received: from out-2uec-a118.jellyfish.systems (out-2uec-a118.jellyfish.systems [63.250.43.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA377606A33D
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 18:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA377606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=aag+E7Re
Received: from fedora (ec2-52-197-241-54.ap-northeast-1.compute.amazonaws.com [52.197.241.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4jKZPW59m2z8sWV;
	Wed, 04 Nov 2026 18:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1793818499;
	bh=yPUP8DQT3iEU3BHJVt8YLSwUvlBNHcwPbG53FJAUAZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aag+E7RejPGGwAMD/w+Rjl3k/o2n0YFQeFxpAKoBJluOm6WUgG19XTXWMHwue1QP9
	 Pivxx1ISmbsHoxrBz3eK3QL+zHme0LfPUI0NjcH2+KHFnCBc2G8op3F0s+KkMNtlyU
	 xiLcQel2hDwLn57emn89uYHXA3rqXJjyqnWBa4oTNoFG6+tMrk+lgW5l7BYlw7eDKL
	 7AmrIC8g/BuX+HiUhrrHpG6Bd/qdIjuBpqEIX2F9k5aNMod/M03rhvORPPk88XaVKm
	 KyvjK1aBnytl5PlUw37KfdtbVtsg3P6yD0uLD+0T2ThdGFeFaZiwUDb4zvNZiudRWs
	 WtKhELfk5PT5A==
From: Tianyi Chen <hi@tychen.cc>
To: bpf@vger.kernel.org
Cc: Tianyi Chen <hi@tychen.cc>,
	qmo@kernel.org,
	andrii@kernel.org,
	eddyz87@gmail.com,
	ihor.solodrai@linux.dev,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	daniel@iogearbox.net,
	ast@kernel.org,
	alexei.starovoitov@gmail.com,
	skokovmaksimevg@gmail.com
Subject: [PATCH bpf-next v11 2/3] bpftool: Add recursive map dumping
Date: Thu,  5 Nov 2026 03:54:38 +0900
Message-ID: <9d939026aea3c4a2d4d26702de1080c6733ad566.1793818386.git.hi@tychen.cc>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793818386.git.hi@tychen.cc>
References: <cover.1793818386.git.hi@tychen.cc>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

Dumping an array_of_maps or a hash_of_maps shows the IDs of the inner
maps but not their contents. Add a recursive keyword to map dump that
also dumps the inner map referenced by each entry, in that entry. JSON
entries gain an "inner_map" object next to "inner_map_id", and plain
output prints the inner map after the entry line. The output without
the keyword is unchanged.

The kernel supports a single level of map-in-map, so inner maps have
no inner maps of their own. Each inner map is opened by ID when its
entry is printed, dumped and closed, which needs one more map FD. An
inner map shared by several entries is dumped in each of them. If an
inner map cannot be opened, for example because it was replaced after
the outer lookup, the error is reported in that entry and the dump
continues.

Link: https://github.com/libbpf/bpftool/issues/58
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 .../bpf/bpftool/Documentation/bpftool-map.rst |  9 ++-
 tools/bpf/bpftool/bash-completion/bpftool     |  3 +
 tools/bpf/bpftool/map.c                       | 59 +++++++++++++++++--
 3 files changed, 65 insertions(+), 6 deletions(-)

diff --git a/tools/bpf/bpftool/Documentation/bpftool-map.rst b/tools/bpf/bpftool/Documentation/bpftool-map.rst
index e4ed7e701c9e4..729baab2b7922 100644
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
@@ -87,10 +87,15 @@ bpftool map create *FILE* type *TYPE* key *KEY_SIZE* value *VALUE_SIZE*  entries
     Keyword **offload_dev** expects a network interface name, and is used to
     request hardware offload for the map.
 
-bpftool map dump    *MAP*
+bpftool map dump    *MAP* [recursive]
     Dump all entries in a given *MAP*.  In case of **name**, *MAP* may match
     several maps which will all be dumped.
 
+    With **recursive**, each entry of an **array_of_maps** or **hash_of_maps**
+    also has the dump of the inner map that it refers to. An inner map that
+    cannot be opened, for example because it was replaced, is reported as an
+    error in that entry.
+
 bpftool map update  *MAP* [key *DATA*] [value *VALUE*] [*UPDATE_FLAGS*]
     Update map entry for a given *KEY*.
 
diff --git a/tools/bpf/bpftool/bash-completion/bpftool b/tools/bpf/bpftool/bash-completion/bpftool
index a28af31937ad4..78fdb9396e96f 100644
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
index b150a06a25085..fc820c07e9f4f 100644
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
@@ -935,6 +945,36 @@ map_dump(int fd, struct bpf_map_info *info, json_writer_t *wtr,
 	return err;
 }
 
+/* The kernel has one level of map-in-map: inner maps have no inner maps. */
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
+	if (!json_output && info.btf_value_type_id)
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
@@ -944,8 +984,8 @@ static int do_dump(int argc, char **argv)
 	int *fds = NULL;
 	int err = -1;
 
-	if (argc != 2)
-		usage();
+	if (!REQ_ARGS(2))
+		return -1;
 
 	fds = malloc(sizeof(int));
 	if (!fds) {
@@ -956,6 +996,16 @@ static int do_dump(int argc, char **argv)
 	if (nb_fds < 1)
 		goto exit_free;
 
+	while (argc) {
+		if (**argv && is_prefix(*argv, "recursive")) {
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
@@ -1002,6 +1052,7 @@ static int do_dump(int argc, char **argv)
 exit_free:
 	free(fds);
 	free_btf_vmlinux();
+	recursive_dump = false;
 	return err;
 }
 
@@ -1510,7 +1561,7 @@ static int do_help(int argc, char **argv)
 		"       %1$s %2$s create     FILE type TYPE key KEY_SIZE value VALUE_SIZE \\\n"
 		"                                  entries MAX_ENTRIES name NAME [flags FLAGS] \\\n"
 		"                                  [inner_map MAP] [offload_dev NAME]\n"
-		"       %1$s %2$s dump       MAP\n"
+		"       %1$s %2$s dump       MAP [recursive]\n"
 		"       %1$s %2$s update     MAP [key DATA] [value VALUE] [UPDATE_FLAGS]\n"
 		"       %1$s %2$s lookup     MAP [key DATA]\n"
 		"       %1$s %2$s getnext    MAP [key DATA]\n"
-- 
2.56.0

