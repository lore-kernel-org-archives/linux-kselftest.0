Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33123E8C70
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 02:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789095089; cv=none; b=PaMrJsHp04vBSMXktUhspA2cmIwEHbtaOhoLju+SMJ2LZw1zusXxAYGj5kBll4bEM3lNDwYMRgw3jgfdmaXf4lNYM7s9pWmHqvuHQamQPvkqoiTTyFUC44FggrdAMx+Ku5XzMnrlUJOEI9h5ofOsI2qeo/HMav591cacU9lmIyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789095089; c=relaxed/simple;
	bh=I+xjaNQIGpA52O4lGfUvgCc2hDog1MRkZXm86PwYM88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SiBUO8+XGn8mf9B5qcsSpXBa9uHm1FFKckgnTh8fu1Lgn06YFiIcnXnFkemsgTFOCenPtKZf6GNcaMjr8mJXjvXqh+I/1M5pyqQaREp1c/qNt+KepmyerwPEX+En/C5C1F5C4zx4090mg+q2yNmx2k3RNC8H9xamfWbIiNdYUg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvQeP+mQ; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvQeP+mQ"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-396a51b2605so187765a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 19:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789095086; x=1789699886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1qZKhLv/Pc4noJta6NtrrqBWyhSdm9xzXOyIqtBQG0=;
        b=QvQeP+mQxclKzBix9rV43fzxr22K3dyB6ECXqXIjk0oyz+Y46jG4PfhiYJomt1i+/D
         TpMJbJZSu4aUd7cLJbaaA6V0w3VNkt6XnyZOrKa6GAqv3K50fZ5gr+tLBSqD4k+lWxWs
         Mv+cyjjJnmAZm6Y6IoHuyI99w1URs67QUd1MfnNouPf1qbP8nWjQLx7iAHwMFzc/3wYQ
         HDy0o6QLiSp3smHfClKw0yygqiklJiViNifo7lcGgtImZSIFbfDEE3Ur8aihSvjMZj29
         4blgeEHjuBi9Jqm3qiARnfLZei8Efpam7tqdni9OHZlXX0yPC1ckCLJtWlanV3oGCcq7
         qhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789095086; x=1789699886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n1qZKhLv/Pc4noJta6NtrrqBWyhSdm9xzXOyIqtBQG0=;
        b=lf47W/lQfPZxQQLYNiPUS2QM25VwmoUv338AnRYfDDvffDk8LPTzQAEyI+KEbje2v7
         dxI64P18TiGogeIWG2pYjcuVFAGkI1xgopzkgTx/2fHUmPX/h9t5I8+UD41de5E3lNrF
         qfQcIAFcqboTSxs2fFAX//MDEXl5/5uKo4kAZ+bKHj85IUntuRprF50LkgUVGHc7k6Xi
         4MXrbzs80ayyFKosqaUWLPanFciwa7z8MTDjTqPMKqtl0W5Nj53zmvHLvaZ71k9pGd70
         7yQYNELvzhxwGjRMZWrJHmW3IfeexkwTIR5YK8aS6TCaU+/S2fmSuIH2+uwzIj3+qvi4
         /AqA==
X-Forwarded-Encrypted: i=1; AKwUvByPbdHS6EYOMPLtI+tVG+d4M6nrCaK3bKxFviw4WkjbeGl8zlNCq7IsF7lNpEJDPdkHLOhazyZ3SMkP35GrpPo=@vger.kernel.org
X-Gm-Message-State: AFuF++nr9s6rb+/KmDzpIdrDBDE6mdRH3qQ/Qkg6C/Fh1jIP2qGM77f2
	QcIsPeNpbEIC1PYT66RMZ77BsJuKJZP1J8qoSgokyjUH/uwhChhwUmIPRYSuJxww
X-Gm-Gg: AYBFou1wX7e9JiJvo01VOL0wkaiqrznJgAw9jbb+vtTZrKZVHYQogs5mWdSPcqu7Vui
	Vqg3wvCECwfTVuiHYTWOzVXo1ZtGAqOLU+AIZ6/5OIEnnxffDmGII+HNu6osx/Hgyx91tDt0/Il
	xvuil9wv61qhEG1iFWdp6ZKNuM8vXVXKHoSgVb9yN+/lI70Nsh2pe/n/GGcdk4ORHkMMKfOpC7n
	J2tgSKJ8NwLEyWXZ5lWQn3ZUdM7Vp+t9kYv7yeJ3FE1fYsZvjHCE68tgVfOMUrMRN791J2nvBGT
	XYKo7+ZaIhWxcKacfU/dqY0dz9T5gr0KwtbnEeUeatkTvjLH/aVOyMc546G/r/pUqtexoQcTFoN
	xVNEcmtid/Y9+9qFg+0OoS7Iui+vl9F8AT1TQARzrXPcQEIpn7XujKNyM+FzhlESdRySSjpDUWn
	0fhNn2+NxNb4gRs94CRV7CatUuH//zhYlqHkgQbm90z3+k7sog/bRByODael56apKW
X-Received: by 2002:a17:90b:4cce:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39d9bec4d91mr3232114a91.10.1789095086232;
        Thu, 10 Sep 2026 19:51:26 -0700 (PDT)
Received: from 192.168.5.7 ([69.5.53.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95092c06sm2396002a91.4.2026.09.10.19.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 19:51:25 -0700 (PDT)
From: Tianyi Chen <diannaaav@gmail.com>
To: qmo@kernel.org,
	bpf@vger.kernel.org
Cc: andrii@kernel.org,
	eddyz87@gmail.com,
	ihor.solodrai@linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v3 1/2] bpftool: Read ring buffer maps with event_pipe
Date: Fri, 11 Sep 2026 10:51:13 +0800
Message-ID: <20260911025114.190899-2-diannaaav@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911025114.190899-1-diannaaav@gmail.com>
References: <20260911025114.190899-1-diannaaav@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tianyi Chen <hi@tychen.cc>

map event_pipe only accepts perf event arrays, leaving no built-in way
to inspect records produced through the BPF ring buffer API. Extend it
to consume queued and live BPF_MAP_TYPE_RINGBUF records in plain or
JSON output, retaining the existing perf event array path.

Ring buffers have a shared consumer position and no implicit CPU or
timestamp. Document that this command consumes records rather than
observing them passively, and reject perf-only CPU/index selectors.

A producer can keep ring_buffer__poll() busy after a stop signal, so
return -EINTR from the record callback when stopping. Keep stdio out of
the shared signal handler and preserve callback output errors.

Link: https://github.com/libbpf/bpftool/issues/54

Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 .../bpf/bpftool/Documentation/bpftool-map.rst | 14 ++-
 tools/bpf/bpftool/bash-completion/bpftool     |  4 +-
 tools/bpf/bpftool/map_perf_ring.c             | 87 ++++++++++++++-----
 3 files changed, 81 insertions(+), 24 deletions(-)

diff --git a/tools/bpf/bpftool/Documentation/bpftool-map.rst b/tools/bpf/bpftool/Documentation/bpftool-map.rst
index 5daf3de5c744..e4ed7e701c9e 100644
--- a/tools/bpf/bpftool/Documentation/bpftool-map.rst
+++ b/tools/bpf/bpftool/Documentation/bpftool-map.rst
@@ -120,7 +120,8 @@ bpftool map pin     *MAP*  *FILE*
     character ('.'), which is reserved for future extensions of *bpffs*.
 
 bpftool map event_pipe *MAP* [cpu *N* index *M*]
-    Read events from a **BPF_MAP_TYPE_PERF_EVENT_ARRAY** map.
+    Read events from a **BPF_MAP_TYPE_PERF_EVENT_ARRAY** or
+    **BPF_MAP_TYPE_RINGBUF** map.
 
     Install perf rings into a perf event array map and dump output of any
     **bpf_perf_event_output**\ () call in the kernel. By default read the
@@ -134,6 +135,17 @@ bpftool map event_pipe *MAP* [cpu *N* index *M*]
     existing ring.  Any other application will stop receiving events if it
     installed its rings earlier.
 
+    For a ring buffer map, consume records submitted by BPF programs, including
+    records already queued before the command starts. **cpu** and **index**
+    are not supported. Each record is printed in full, including embedded zero
+    bytes. Plain output reports the record size followed by hexadecimal
+    bytes; JSON output contains **size** and **data** fields, with **data** an
+    array of byte values. Ring buffer records have no implicit CPU or timestamp.
+
+    Consuming a ring buffer advances its shared consumer position, so this
+    command must not run alongside another consumer of the same map.
+    **BPF_MAP_TYPE_USER_RINGBUF** maps are not supported.
+
 bpftool map peek  *MAP*
     Peek next value in the queue or stack.
 
diff --git a/tools/bpf/bpftool/bash-completion/bpftool b/tools/bpf/bpftool/bash-completion/bpftool
index 75cbcb512eba..1750b488c9e3 100644
--- a/tools/bpf/bpftool/bash-completion/bpftool
+++ b/tools/bpf/bpftool/bash-completion/bpftool
@@ -878,11 +878,11 @@ _bpftool()
                             return 0
                             ;;
                         id)
-                            _bpftool_get_map_ids_for_type perf_event_array
+                            _bpftool_get_map_ids_for_type '"type": "\(perf_event_array\|ringbuf\)"'
                             return 0
                             ;;
                         name)
-                            _bpftool_get_map_names_for_type perf_event_array
+                            _bpftool_get_map_names_for_type '"type": "\(perf_event_array\|ringbuf\)"'
                             return 0
                             ;;
                         cpu)
diff --git a/tools/bpf/bpftool/map_perf_ring.c b/tools/bpf/bpftool/map_perf_ring.c
index bcb767e2d673..7d555331f443 100644
--- a/tools/bpf/bpftool/map_perf_ring.c
+++ b/tools/bpf/bpftool/map_perf_ring.c
@@ -27,7 +27,7 @@
 
 #define MMAP_PAGE_CNT	16
 
-static volatile bool stop;
+static volatile sig_atomic_t stop;
 
 struct perf_event_sample {
 	struct perf_event_header header;
@@ -44,7 +44,6 @@ struct perf_event_lost {
 
 static void int_exit(int signo)
 {
-	fprintf(stderr, "Stopping...\n");
 	stop = true;
 }
 
@@ -107,6 +106,27 @@ print_bpf_output(void *private_data, int cpu, struct perf_event_header *event)
 	return LIBBPF_PERF_EVENT_CONT;
 }
 
+static int print_ringbuf_output(void *ctx, void *data, size_t size)
+{
+	if (json_output) {
+		jsonw_start_object(json_wtr);
+		jsonw_uint_field(json_wtr, "size", size);
+		jsonw_name(json_wtr, "data");
+		print_data_json(data, size);
+		jsonw_end_object(json_wtr);
+	} else {
+		printf("== size: %zu =====\n", size);
+		fprint_hex(stdout, data, size, " ");
+		printf("\n");
+	}
+
+	if (fflush(stdout))
+		return errno ? -errno : -EIO;
+
+	/* A producer can keep poll() busy even after a signal arrives. */
+	return stop ? -EINTR : 0;
+}
+
 int do_event_pipe(int argc, char **argv)
 {
 	struct perf_event_attr perf_attr = {
@@ -123,18 +143,26 @@ int do_event_pipe(int argc, char **argv)
 		.cpu = -1,
 		.idx = -1,
 	};
-	struct perf_buffer *pb;
+	struct perf_buffer *pb = NULL;
+	struct ring_buffer *rb = NULL;
 	__u32 map_info_len;
 	int err, map_fd;
 
+	stop = false;
 	map_info_len = sizeof(map_info);
 	map_fd = map_parse_fd_and_info(&argc, &argv, &map_info, &map_info_len,
 				       0);
 	if (map_fd < 0)
 		return -1;
 
-	if (map_info.type != BPF_MAP_TYPE_PERF_EVENT_ARRAY) {
-		p_err("map is not a perf event array");
+	if (map_info.type != BPF_MAP_TYPE_PERF_EVENT_ARRAY &&
+	    map_info.type != BPF_MAP_TYPE_RINGBUF) {
+		p_err("map is not a perf event array or ring buffer");
+		goto err_close_map;
+	}
+
+	if (map_info.type == BPF_MAP_TYPE_RINGBUF && argc) {
+		p_err("ring buffer maps do not support cpu or index arguments");
 		goto err_close_map;
 	}
 
@@ -184,15 +212,24 @@ int do_event_pipe(int argc, char **argv)
 		ctx.idx = 0;
 	}
 
-	opts.cpu_cnt = ctx.all_cpus ? 0 : 1;
-	opts.cpus = &ctx.cpu;
-	opts.map_keys = &ctx.idx;
-	pb = perf_buffer__new_raw(map_fd, MMAP_PAGE_CNT, &perf_attr,
-				  print_bpf_output, &ctx, &opts);
-	if (!pb) {
-		p_err("failed to create perf buffer: %s (%d)",
-		      strerror(errno), errno);
-		goto err_close_map;
+	if (map_info.type == BPF_MAP_TYPE_RINGBUF) {
+		rb = ring_buffer__new(map_fd, print_ringbuf_output, NULL, NULL);
+		if (!rb) {
+			p_err("failed to create ring buffer: %s (%d)",
+			      strerror(errno), errno);
+			goto err_close_map;
+		}
+	} else {
+		opts.cpu_cnt = ctx.all_cpus ? 0 : 1;
+		opts.cpus = &ctx.cpu;
+		opts.map_keys = &ctx.idx;
+		pb = perf_buffer__new_raw(map_fd, MMAP_PAGE_CNT, &perf_attr,
+					  print_bpf_output, &ctx, &opts);
+		if (!pb) {
+			p_err("failed to create perf buffer: %s (%d)",
+			      strerror(errno), errno);
+			goto err_close_map;
+		}
 	}
 
 	signal(SIGINT, int_exit);
@@ -202,25 +239,33 @@ int do_event_pipe(int argc, char **argv)
 	if (json_output)
 		jsonw_start_array(json_wtr);
 
+	err = 0;
 	while (!stop) {
-		err = perf_buffer__poll(pb, 200);
+		err = rb ? ring_buffer__poll(rb, 200) : perf_buffer__poll(pb, 200);
 		if (err < 0 && err != -EINTR) {
-			p_err("perf buffer polling failed: %s (%d)",
-			      strerror(errno), errno);
-			goto err_close_pb;
+			fprintf(stderr, "Error: %s buffer polling failed: %s (%d)\n",
+				rb ? "ring" : "perf", strerror(-err), -err);
+			break;
 		}
+		err = 0;
 	}
 
+	if (stop)
+		fprintf(stderr, "Stopping...\n");
 	if (json_output)
 		jsonw_end_array(json_wtr);
+	if (fflush(stdout)) {
+		fprintf(stderr, "Error: failed to write events: %s\n", strerror(errno));
+		err = -1;
+	}
 
+	ring_buffer__free(rb);
 	perf_buffer__free(pb);
+	/* Both buffer managers borrow map_fd. */
 	close(map_fd);
 
-	return 0;
+	return err < 0 ? -1 : 0;
 
-err_close_pb:
-	perf_buffer__free(pb);
 err_close_map:
 	close(map_fd);
 	return -1;
-- 
2.55.0

