Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24A73515FB
	for <linux-kselftest@vger.kernel.org>; Sat, 22 Aug 2026 20:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787429508; cv=none; b=VtXHmZKID+OOPIogtl1Vyy93TzVNdJ9Mcix2/LrlGBpCq6pyouHaFe6VQjCHFNwQ4t2ssPpc6QQw5iV4BklniknZTEAT+EK0RdMvG+UKd6Zgi9uM7n8XdYuJtitbfufFCqAnj96j7Y6ZD3iFHis/J4NrQimokPWoTZXmeP4BUpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787429508; c=relaxed/simple;
	bh=/PnBKtgvrHRV4JL6qZBj+ZWGP1Az2ZXAav1JQfVyl6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZjSTlblzYoFE32oQ7+qn5H81me8u02R4duxsh5XFo/xMn5sjKBQtySeezZINe0ujt4n1liM+Y9rRqqRtKGSX1rcuZ/ftQLMsOTt0uG5lswwu+pKGHus8gfm8sOtBvoDA6lIV+r+UamACuKnw/Nz+toTR12ehP2rp5jLWF4jL9+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com; spf=pass smtp.mailfrom=isovalent.com; dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b=esAhGC/3; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isovalent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b="esAhGC/3"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a3e145e1bfso2873883a12.1
        for <linux-kselftest@vger.kernel.org>; Sat, 22 Aug 2026 13:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1787429505; x=1788034305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KzUPKMiG4VxZWjlyXNq686M66Aoo7Y803vMgcHVtz3g=;
        b=esAhGC/3IQgjSSSNkwCJQLXGAef3bd89ZY6jTmuwcqBQeW1T7BZ3IRA4TE45/Nrngb
         rDTwx3U5crni8PoOnm7NX/EZISsop5hKVaIHv5PTAJYKikCHeqUqirLXCciINIBodJmV
         eESKLlF3MLHw6FfLUuIHhilIFP5EgsmEdoj2BYt6y5O5/oFGwXtV0BkvIDVopK3seHgC
         iJJn4sRtg78hR1cl0ORDsW8EW3dCZPXVw1WbOXQHQQ3gP7eaagHGV+g9k6tCF5/N3roD
         vv5gjrAQJYT9p5PStmlc/HTIH7REocOkrSl1iySurBLxpar4wlZxI0MTkXtO7QLW/lhA
         2KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787429505; x=1788034305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KzUPKMiG4VxZWjlyXNq686M66Aoo7Y803vMgcHVtz3g=;
        b=A9eQbg4WD55KEkn54Cik1yDCl+u0gCzYllGpIq15Nn3zxyiCOEdEena9JMOrPg+JzX
         mBe8qedixxMfz1U1j+cxzUpxYhvda3LX90SkFt0q1Qe6UsZJU+HvtN88Yk63beftH4sK
         ReyiAmXTEkjoNApdjB/3GR85SsBKula4db85sQVMGB5kMVUklHL7XFVJSbMVAOVLjcGm
         06tSDoeFxF+HBn2zONVjVfI8+t9VjhFKVDSJRSevMm30hH2E4tDJWiRBzXQciKfTultn
         qIWldB457X303fAqsHSvA23u24pNNcg8P9tK+BtnleE/gO15/peJuOyAg+ItVBfdh2OF
         UoXg==
X-Forwarded-Encrypted: i=1; AHgh+Rrnwo6lzvTPrqHtrVVBxbBvkxBQc0kyFnoa0vE2rVrKn5kgg/roaX+gGiWLSGBJnQXqVSbk4p0fgH9ZOdQ+Oic=@vger.kernel.org
X-Gm-Message-State: AFuF++l95yTsJM3sP3ABmJQU0ZlwpAPtWrzhNuPXdjfjc+sL/Ti5Nt/o
	74bdtN7HnvENxK/gt3huT7rRWgn1SqTubqr02h3C36KRB8yAhdSuAqRtTu40Os5/ImI=
X-Gm-Gg: AR+sD128LxldHUwQmRxJotCzU+Awuehz7Z4+9Mjpp8rbQR0/n25r4uPMfO1RTY19z75
	ln3Ks+udGHs/eOxd2wY4s5qn8My5190hm9ZYKpitshmEjgtfZck7Vs/eP7NQeDmuCkf571D6ym8
	OGxDTdBOkCIAXmG8jsm0XDJMhpUBf0HJp0IN4RhaYwSBgrzmIS6pctkl7kN27lsnZqwIPtGt9eO
	TMa2LnfGESOBBandz5j7GiRrcHXj1Ru8lSsfEUI2VzzObaeFL0sYKYZB5iZ98qqUAOI2BzQQVpa
	kQ+2+b+M6N66wm4Mzw3rApczDLKnKHEyMLrBSRP5F+Nb+HQvtQEt9TEexnCcqeOnAR3Vh7ZQ5gh
	iErYqEPmMV+xPF0/GCoIFwljE8Z0cEEdfyOmSwKN1ciaeOb3nYZqE3jWxuWR4SQUtJzjDJXRWVY
	pR8ijbaNJb+RfGkMlyOuIaxItSpT9bGZPf6L+NWHh2Icv8E+KD4i3jNedqy7Td2ub8s9pbXpo22
	ey/tvAUHDQYSVIsuhSyyxixIrwoZ2ZT1u0pIng7QqqEHVegBcwWAGOr
X-Received: by 2002:a05:6938:a090:20b0:c21:2c32:e2e6 with SMTP id a640c23a62f3a-c246a60cfe4mr1222072766b.10.1787429504815;
        Sat, 22 Aug 2026 13:11:44 -0700 (PDT)
Received: from localhost.localdomain (chello089173060039.chello.sk. [89.173.60.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f99basm444347766b.37.2026.08.22.13.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 13:11:44 -0700 (PDT)
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
Subject: [PATCH net v2 2/2] selftests: net: tcp_ao: test VRF-scoped key deletion
Date: Sat, 22 Aug 2026 22:11:19 +0200
Message-ID: <20260822201119.272269-2-rastislav.szabo@isovalent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260822201119.272269-1-rastislav.szabo@isovalent.com>
References: <20260822201119.272269-1-rastislav.szabo@isovalent.com>
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
Reviewed-by: David Ahern <dsahern@kernel.org>
Acked-by: Dmitry Safonov <dima@arista.com>
---
Changes in v2:
- Put async on the same line as current_key in test_del_key().
- Add review tags.

 .../selftests/net/tcp_ao/key-management.c     | 67 ++++++++++++-------
 .../testing/selftests/net/tcp_ao/lib/aolib.h  |  6 +-
 tools/testing/selftests/net/tcp_ao/lib/sock.c |  4 +-
 3 files changed, 51 insertions(+), 26 deletions(-)

diff --git a/tools/testing/selftests/net/tcp_ao/key-management.c b/tools/testing/selftests/net/tcp_ao/key-management.c
index d86bb380b79f..0451f92f4645 100644
--- a/tools/testing/selftests/net/tcp_ao/key-management.c
+++ b/tools/testing/selftests/net/tcp_ao/key-management.c
@@ -63,8 +63,8 @@ static int prepare_lsk(union tcp_addr *addr, uint8_t sndid, uint8_t rcvid)
 	return sk;
 }
 
-static int test_del_key(int sk, uint8_t sndid, uint8_t rcvid, bool async,
-			int current_key, int rnext_key)
+static int test_del_key(int sk, uint8_t sndid, uint8_t rcvid, int ifindex,
+			bool async, int current_key, int rnext_key)
 {
 	struct tcp_ao_info_opt ao_info = {};
 	struct tcp_ao_getsockopt key = {};
@@ -76,6 +76,10 @@ static int test_del_key(int sk, uint8_t sndid, uint8_t rcvid, bool async,
 	del.prefix = DEFAULT_TEST_PREFIX;
 	del.sndid = sndid;
 	del.rcvid = rcvid;
+	if (ifindex) {
+		del.keyflags = TCP_AO_KEYF_IFINDEX;
+		del.ifindex = ifindex;
+	}
 
 	if (current_key >= 0) {
 		del.set_current = 1;
@@ -95,7 +99,8 @@ static int test_del_key(int sk, uint8_t sndid, uint8_t rcvid, bool async,
 
 	tcp_addr_to_sockaddr_in(&sockaddr, &this_ip_dest, 0);
 	err = test_get_one_ao(sk, &key, &sockaddr, sizeof(sockaddr),
-			      DEFAULT_TEST_PREFIX, sndid, rcvid);
+			      DEFAULT_TEST_PREFIX, sndid, rcvid,
+			      del.keyflags, del.ifindex);
 	if (!err)
 		return -EEXIST;
 	if (err != -E2BIG)
@@ -112,12 +117,12 @@ static int test_del_key(int sk, uint8_t sndid, uint8_t rcvid, bool async,
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
@@ -236,15 +241,15 @@ static void check_closed_socket(void)
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
@@ -254,10 +259,12 @@ static void check_closed_socket(void)
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
@@ -272,6 +279,18 @@ static void check_closed_socket(void)
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
@@ -322,8 +341,8 @@ static void check_listen_socket(void)
 	int sk, err;
 
 	sk = prepare_lsk(&this_ip_dest, 200, 200);
-	try_delete_key("listen socket, delete a key", sk, 200, 200, 0, -1, -1, 0);
-	try_delete_key("listen socket, delete all keys", sk, 100, 100, 0, -1, -1, 0);
+	try_delete_key("listen socket, delete a key", sk, 200, 200, 0, 0, -1, -1, 0);
+	try_delete_key("listen socket, delete all keys", sk, 100, 100, 0, 0, -1, -1, 0);
 	close(sk);
 
 	sk = prepare_lsk(&this_ip_dest, 200, 200);
@@ -345,8 +364,10 @@ static void check_listen_socket(void)
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
@@ -359,13 +380,13 @@ static void check_listen_socket(void)
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
@@ -1131,7 +1152,6 @@ static void check_established_socket(void)
 {
 	unsigned int port = test_server_port;
 
-	setup_vrfs();
 	try_client_run("client: Check current/rnext keys unset before connect()",
 		       port++, 20, -1, -1);
 	try_client_run("client: Check current/rnext keys set before connect()",
@@ -1150,6 +1170,7 @@ static void *client_fn(void *arg)
 {
 	if (inet_pton(TEST_FAMILY, TEST_WRONG_IP, &wrong_addr) != 1)
 		test_error("Can't convert ip address %s", TEST_WRONG_IP);
+	setup_vrfs();
 	check_closed_socket();
 	check_listen_socket();
 	check_established_socket();
@@ -1158,6 +1179,6 @@ static void *client_fn(void *arg)
 
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
