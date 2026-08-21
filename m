Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CB94908CA
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 15:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326766; cv=none; b=XHvkZdqfMD/Yw04MPeEZ+LxYEASvPSm75/Ki7siUeeNiq5a2LZt2sG/W1HPJ3x4MRne3qGND9DTtnQEoyrXSb0K5ebIycBR3gxhvhI13PZLAGnLgcQe6N/+OzzxAtTMcPF0NwBbbf12RjX4mdJ/gHM91CkTaMtZ8LDhIGQNh0uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326766; c=relaxed/simple;
	bh=8mOs0BKz29UHmKLCjpg+g7eGThyC+fJmCW2alcp7cNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HjZKgddbj1S8N3XA2f4O/x4WH8mCM0c26vEMswAihKAN7KrQ+N9J6wWZocyajeNvyDJdr0Jf4E6CgoK3wen7EPx3OziGrNbDWGV6tbyaQDN3QkpDrG0NUCeOnH4LZ5BP/Ox2vC89vvxPUMZACWl5ZPZkbWaxfiGjaVK4umkGLf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com; spf=pass smtp.mailfrom=isovalent.com; dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b=MAcFd0fa; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isovalent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b="MAcFd0fa"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso2143335a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 08:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1787326756; x=1787931556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BMZJ2+cqn7iqDrGZ+Rr84RRomxOfrfCEoQBiqMvQsZc=;
        b=MAcFd0fau8xUQmhy7wai5L2zI58Jhx1ojrCRUYIiR6xwEg6C0W5Qve59dpMLRch46j
         bb6bGE+NEBcnIEiqFWLmFL9km3LzG//GJVGcOaymiiPvsEcVt2V87F5OjAAY/cUUzo6S
         ZOLv4dnD20hEyyJ+VIZDl8Yzhanfz7ddpDEk7sqm44b4tcExfFlnb4eBxhOAIDCtWgLJ
         AEElv5kTxQ2oBWx4klCtvnUkPrXVD+SLoNGZ52TugcEGtrvUvoy/oLqAap8IFAVqEDeh
         HQXfz6Dhk5Ffjm+rc+mCnZJ+ByBzjJC41+N74EHd7lvpxf+0dUaSALOlwjWVZ1NuUEpM
         Ps5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326756; x=1787931556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BMZJ2+cqn7iqDrGZ+Rr84RRomxOfrfCEoQBiqMvQsZc=;
        b=gU0XIONo5bVplkLbQ4xlkDNALeOpXNgMuBVhlZ+eOTBam+jT5sMpXy+cLjfBPTaavK
         hMUkskoR1yF5vn32Pn+8olk9WazKRibG5VqS/yfXIE8zh0ukItBspFpsZ8id0zTaKrI1
         6jsKg8aNbAfhCdtRkOD/6wNOELBeQ5Scn9uHNTwymQFyrqLeA8UUZc18sUNajwWWjydB
         nCdSPANUXdIuHKlJ2UuGWedhSlCUsDtAwXniX6XCbDLaf5B8V2jPtFyjuLMGytBzdvC/
         bmLWUET67bZ2Al7SI3kp7e11KYTAEYBQnLcuGtY5fzrMxOG+YEdu63MuNyiXQVN19ffE
         X/tw==
X-Forwarded-Encrypted: i=1; AHgh+RrY6wS8RZyliYBCy9uNFbmDiVXFMyB4Y3HZX4fOWvD2Qre7w9QeGqpMwS9MkM3KNGRQiqBiqvZYree3w9PQjUM=@vger.kernel.org
X-Gm-Message-State: AFuF++mTNvWCCSepSWDSsmPkImzZGB9bcKiENOhW27YtkuTxIjg5BZr0
	qdVcUsMBbWybE0y0thKma4QHyMMiNvW5qxgQ4zZy+0wy7tvB4rNvHjMD7wHlCBhU5GU=
X-Gm-Gg: AR+sD12dbZJNgfLiSFWeaUG3KKn26cd7UcX//gpphkGvnorjjE0DvUJsEErpcpJnzFU
	hBCDk3BxxoNe66+gggbxa3QAaTFp21LJNq31KKVb78R4pKe+iIb4LQLuf+1ZhqYiMAgVgTcpTop
	ObrXuc+r7jynYYv7vZDmjZf7SqmHX4TV1lyxrHZdVN959gEQqYFAg3UX98/AQGdUg8yaz9Pajke
	b6JnMkZzvQAKBvh69HKQagTbASVcvyC8fNw3TrUrMQmJuEqx3DtGDD3Q2oq9pRhLSlag6/usioJ
	kxe1tQDF5AT8P5OOWSfB+3c1YpbsQJDvFntX9KFH2SEhnijd63mvFBboLRi6OeTnYtyunqw/iqS
	weVOGCx7AALiIW7+dS0zucOvXR66J5s4ylQcdOJltEr9ITNHZm0ALQi69Gn/ctDrjr0dwtl+xlt
	S8YzS21FM7uKClRmDfBhfVIEs6WLIb5jJUAFc17ITGZzEs560+k5ot6xVaex8bEIhLM07bocrYC
	XSPDuhTwFHO4UUrBQBrEC+5mlpR6L9K5+yvBm1k0LOHZ2AdX0jFl5FGPdWgfrA=
X-Received: by 2002:a05:6402:2489:b0:69f:4c65:86c2 with SMTP id 4fb4d7f45d1cf-6a42f1b974amr7989854a12.2.1787326756229;
        Fri, 21 Aug 2026 08:39:16 -0700 (PDT)
Received: from localhost.localdomain (92-180-236-231.dynamic.orange.sk. [92.180.236.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feeca188sm7395734a12.6.2026.08.21.08.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:39:16 -0700 (PDT)
From: Rastislav Szabo <rastislav.szabo@isovalent.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com,
	davem@davemloft.net,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	dima@arista.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 2/2] selftests: net: tcp_ao: test VRF-scoped key deletion
Date: Fri, 21 Aug 2026 17:38:23 +0200
Message-ID: <20260821153823.266343-2-rastislav.szabo@isovalent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821153823.266343-1-rastislav.szabo@isovalent.com>
References: <20260821153823.266343-1-rastislav.szabo@isovalent.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify that TCP_AO_DEL_KEY can remove a TCP-AO key scoped to a VRF.

Assisted-by: Codex:GPT-5
Signed-off-by: Rastislav Szabo <rastislav.szabo@isovalent.com>
---
 .../selftests/net/tcp_ao/key-management.c     | 66 ++++++++++++-------
 .../testing/selftests/net/tcp_ao/lib/aolib.h  |  6 +-
 tools/testing/selftests/net/tcp_ao/lib/sock.c |  4 +-
 3 files changed, 51 insertions(+), 25 deletions(-)

diff --git a/tools/testing/selftests/net/tcp_ao/key-management.c b/tools/testing/selftests/net/tcp_ao/key-management.c
index d86bb380b79f..1e01e805dba7 100644
--- a/tools/testing/selftests/net/tcp_ao/key-management.c
+++ b/tools/testing/selftests/net/tcp_ao/key-management.c
@@ -63,7 +63,8 @@ static int prepare_lsk(union tcp_addr *addr, uint8_t sndid, uint8_t rcvid)
 	return sk;
 }
 
-static int test_del_key(int sk, uint8_t sndid, uint8_t rcvid, bool async,
+static int test_del_key(int sk, uint8_t sndid, uint8_t rcvid, int ifindex,
+			bool async,
 			int current_key, int rnext_key)
 {
 	struct tcp_ao_info_opt ao_info = {};
@@ -76,6 +77,10 @@ static int test_del_key(int sk, uint8_t sndid, uint8_t rcvid, bool async,
 	del.prefix = DEFAULT_TEST_PREFIX;
 	del.sndid = sndid;
 	del.rcvid = rcvid;
+	if (ifindex) {
+		del.keyflags = TCP_AO_KEYF_IFINDEX;
+		del.ifindex = ifindex;
+	}
 
 	if (current_key >= 0) {
 		del.set_current = 1;
@@ -95,7 +100,8 @@ static int test_del_key(int sk, uint8_t sndid, uint8_t rcvid, bool async,
 
 	tcp_addr_to_sockaddr_in(&sockaddr, &this_ip_dest, 0);
 	err = test_get_one_ao(sk, &key, &sockaddr, sizeof(sockaddr),
-			      DEFAULT_TEST_PREFIX, sndid, rcvid);
+			      DEFAULT_TEST_PREFIX, sndid, rcvid,
+			      del.keyflags, del.ifindex);
 	if (!err)
 		return -EEXIST;
 	if (err != -E2BIG)
@@ -112,12 +118,12 @@ static int test_del_key(int sk, uint8_t sndid, uint8_t rcvid, bool async,
 }
 
 static void try_delete_key(char *tst_name, int sk, uint8_t sndid, uint8_t rcvid,
-			   bool async, int current_key, int rnext_key,
+			   int ifindex, bool async, int current_key, int rnext_key,
 			   fault_t inj)
 {
 	int err;
 
-	err = test_del_key(sk, sndid, rcvid, async, current_key, rnext_key);
+	err = test_del_key(sk, sndid, rcvid, ifindex, async, current_key, rnext_key);
 	if ((err == -EBUSY && fault(BUSY)) || (err == -EINVAL && fault(CURRNEXT))) {
 		test_ok("%s: key deletion was prevented", tst_name);
 		return;
@@ -236,15 +242,15 @@ static void check_closed_socket(void)
 	int sk;
 
 	sk = prepare_sk(&this_ip_dest, 200, 200);
-	try_delete_key("closed socket, delete a key", sk, 200, 200, 0, -1, -1, 0);
-	try_delete_key("closed socket, delete all keys", sk, 100, 100, 0, -1, -1, 0);
+	try_delete_key("closed socket, delete a key", sk, 200, 200, 0, 0, -1, -1, 0);
+	try_delete_key("closed socket, delete all keys", sk, 100, 100, 0, 0, -1, -1, 0);
 	close(sk);
 
 	sk = prepare_sk(&this_ip_dest, 200, 200);
 	if (test_set_key(sk, 100, 200))
 		test_error("failed to set current/rnext keys");
-	try_delete_key("closed socket, delete current key", sk, 100, 100, 0, -1, -1, FAULT_BUSY);
-	try_delete_key("closed socket, delete rnext key", sk, 200, 200, 0, -1, -1, FAULT_BUSY);
+	try_delete_key("closed socket, delete current key", sk, 100, 100, 0, 0, -1, -1, FAULT_BUSY);
+	try_delete_key("closed socket, delete rnext key", sk, 200, 200, 0, 0, -1, -1, FAULT_BUSY);
 	close(sk);
 
 	sk = prepare_sk(&this_ip_dest, 200, 200);
@@ -254,10 +260,12 @@ static void check_closed_socket(void)
 	if (test_add_key(sk, "Glory to Ukraine!", this_ip_dest,
 			 DEFAULT_TEST_PREFIX, 12, 13))
 		test_error("test_add_key()");
-	try_delete_key("closed socket, delete a key + set current/rnext", sk, 100, 100, 0, 10, 13, 0);
-	try_delete_key("closed socket, force-delete current key", sk, 10, 11, 0, 200, -1, 0);
-	try_delete_key("closed socket, force-delete rnext key", sk, 12, 13, 0, -1, 200, 0);
-	try_delete_key("closed socket, delete current+rnext key", sk, 200, 200, 0, -1, -1, FAULT_BUSY);
+	try_delete_key("closed socket, delete a key + set current/rnext", sk,
+		       100, 100, 0, 0, 10, 13, 0);
+	try_delete_key("closed socket, force-delete current key", sk, 10, 11, 0, 0, 200, -1, 0);
+	try_delete_key("closed socket, force-delete rnext key", sk, 12, 13, 0, 0, -1, 200, 0);
+	try_delete_key("closed socket, delete current+rnext key", sk,
+		       200, 200, 0, 0, -1, -1, FAULT_BUSY);
 	close(sk);
 
 	sk = prepare_sk(&this_ip_dest, 200, 200);
@@ -272,6 +280,18 @@ static void check_closed_socket(void)
 				  this_ip_dest, DEFAULT_TEST_PREFIX,
 				  false, true, 20, 10, 0);
 	close(sk);
+
+	if (!should_skip_test("closed socket, add + delete VRF-scoped key",
+			      KCONFIG_NET_VRF)) {
+		sk = prepare_sk(&this_ip_dest, 200, 200);
+		if (test_add_key_vrf(sk, SECOND_PASSWORD, TCP_AO_KEYF_IFINDEX,
+				     this_ip_dest, DEFAULT_TEST_PREFIX,
+				     test_vrf_ifindex, 201, 201))
+			test_error("test_add_key_vrf()");
+		try_delete_key("closed socket, add + delete VRF-scoped key", sk, 201, 201,
+			       test_vrf_ifindex, 0, -1, -1, 0);
+		close(sk);
+	}
 }
 
 static void assert_no_current_rnext(const char *tst_msg, int sk)
@@ -322,8 +342,8 @@ static void check_listen_socket(void)
 	int sk, err;
 
 	sk = prepare_lsk(&this_ip_dest, 200, 200);
-	try_delete_key("listen socket, delete a key", sk, 200, 200, 0, -1, -1, 0);
-	try_delete_key("listen socket, delete all keys", sk, 100, 100, 0, -1, -1, 0);
+	try_delete_key("listen socket, delete a key", sk, 200, 200, 0, 0, -1, -1, 0);
+	try_delete_key("listen socket, delete all keys", sk, 100, 100, 0, 0, -1, -1, 0);
 	close(sk);
 
 	sk = prepare_lsk(&this_ip_dest, 200, 200);
@@ -345,8 +365,10 @@ static void check_listen_socket(void)
 	if (listen(sk, 10))
 		test_error("listen()");
 	assert_no_current_rnext("listen() after current/rnext keys set", sk);
-	try_delete_key("listen socket, delete current key from before listen()", sk, 100, 100, 0, -1, -1, FAULT_FIXME);
-	try_delete_key("listen socket, delete rnext key from before listen()", sk, 200, 200, 0, -1, -1, FAULT_FIXME);
+	try_delete_key("listen socket, delete current key from before listen()", sk,
+		       100, 100, 0, 0, -1, -1, FAULT_FIXME);
+	try_delete_key("listen socket, delete rnext key from before listen()", sk,
+		       200, 200, 0, 0, -1, -1, FAULT_FIXME);
 	close(sk);
 
 	assert_no_tcp_repair();
@@ -359,13 +381,13 @@ static void check_listen_socket(void)
 			 DEFAULT_TEST_PREFIX, 12, 13))
 		test_error("test_add_key()");
 	try_delete_key("listen socket, delete a key + set current/rnext", sk,
-		       100, 100, 0, 10, 13, FAULT_CURRNEXT);
+		       100, 100, 0, 0, 10, 13, FAULT_CURRNEXT);
 	try_delete_key("listen socket, force-delete current key", sk,
-		       10, 11, 0, 200, -1, FAULT_CURRNEXT);
+		       10, 11, 0, 0, 200, -1, FAULT_CURRNEXT);
 	try_delete_key("listen socket, force-delete rnext key", sk,
-		       12, 13, 0, -1, 200, FAULT_CURRNEXT);
+		       12, 13, 0, 0, -1, 200, FAULT_CURRNEXT);
 	try_delete_key("listen socket, delete a key", sk,
-		       200, 200, 0, -1, -1, 0);
+		       200, 200, 0, 0, -1, -1, 0);
 	close(sk);
 
 	sk = prepare_lsk(&this_ip_dest, 200, 200);
@@ -1131,7 +1153,6 @@ static void check_established_socket(void)
 {
 	unsigned int port = test_server_port;
 
-	setup_vrfs();
 	try_client_run("client: Check current/rnext keys unset before connect()",
 		       port++, 20, -1, -1);
 	try_client_run("client: Check current/rnext keys set before connect()",
@@ -1150,6 +1171,7 @@ static void *client_fn(void *arg)
 {
 	if (inet_pton(TEST_FAMILY, TEST_WRONG_IP, &wrong_addr) != 1)
 		test_error("Can't convert ip address %s", TEST_WRONG_IP);
+	setup_vrfs();
 	check_closed_socket();
 	check_listen_socket();
 	check_established_socket();
@@ -1158,6 +1180,6 @@ static void *client_fn(void *arg)
 
 int main(int argc, char *argv[])
 {
-	test_init(121, server_fn, client_fn);
+	test_init(122, server_fn, client_fn);
 	return 0;
 }
diff --git a/tools/testing/selftests/net/tcp_ao/lib/aolib.h b/tools/testing/selftests/net/tcp_ao/lib/aolib.h
index ebb2899c12fe..53be1744237e 100644
--- a/tools/testing/selftests/net/tcp_ao/lib/aolib.h
+++ b/tools/testing/selftests/net/tcp_ao/lib/aolib.h
@@ -404,7 +404,8 @@ static inline int test_prepare_def_key(struct tcp_ao_add *ao,
 
 extern int test_get_one_ao(int sk, struct tcp_ao_getsockopt *out,
 			   void *addr, size_t addr_sz,
-			   uint8_t prefix, uint8_t sndid, uint8_t rcvid);
+			   uint8_t prefix, uint8_t sndid, uint8_t rcvid,
+			   uint8_t keyflags, int ifindex);
 extern int test_get_ao_info(int sk, struct tcp_ao_info_opt *out);
 extern int test_set_ao_info(int sk, struct tcp_ao_info_opt *in);
 extern int test_cmp_getsockopt_setsockopt(const struct tcp_ao_add *a,
@@ -418,7 +419,8 @@ static inline int test_verify_socket_key(int sk, struct tcp_ao_add *key)
 	int err;
 
 	err = test_get_one_ao(sk, &key2, &key->addr, sizeof(key->addr),
-			      key->prefix, key->sndid, key->rcvid);
+			      key->prefix, key->sndid, key->rcvid,
+			      key->keyflags, key->ifindex);
 	if (err)
 		return err;
 
diff --git a/tools/testing/selftests/net/tcp_ao/lib/sock.c b/tools/testing/selftests/net/tcp_ao/lib/sock.c
index ef8e9031d47a..2e7b06a1a156 100644
--- a/tools/testing/selftests/net/tcp_ao/lib/sock.c
+++ b/tools/testing/selftests/net/tcp_ao/lib/sock.c
@@ -252,7 +252,7 @@ static int test_get_ao_keys_nr(int sk)
 
 int test_get_one_ao(int sk, struct tcp_ao_getsockopt *out,
 		void *addr, size_t addr_sz, uint8_t prefix,
-		uint8_t sndid, uint8_t rcvid)
+		uint8_t sndid, uint8_t rcvid, uint8_t keyflags, int ifindex)
 {
 	struct tcp_ao_getsockopt tmp = {};
 	socklen_t tmp_sz = sizeof(tmp);
@@ -262,6 +262,8 @@ int test_get_one_ao(int sk, struct tcp_ao_getsockopt *out,
 	tmp.prefix = prefix;
 	tmp.sndid  = sndid;
 	tmp.rcvid  = rcvid;
+	tmp.keyflags = keyflags;
+	tmp.ifindex = ifindex;
 	tmp.nkeys  = 1;
 
 	ret = getsockopt(sk, IPPROTO_TCP, TCP_AO_GET_KEYS, &tmp, &tmp_sz);
-- 
2.43.0

