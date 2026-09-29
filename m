Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25DF39E178
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 06:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664505; cv=none; b=teQc//znwEJtQyJPXXENIDcAkhMbQR++gAXtsD6k6bhrF2kD+iFxr7jEdjMs1kT4axD6ZrMdxa+VAUkVj2FszT/aG1FZGRgKo5M7/gOLNokQUxaoWK46IvRLZP4zN1WDSdMMD8jouR7S4J2Q9GPIj1c5jw9h3LMboBzDUcCeRUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664505; c=relaxed/simple;
	bh=QgYGfw9qtYxIATb2R9Qf8RKNT0lX4Vk7yPi4tVHTf6o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jhQB7CaLR3L6ROYPEEoXm6l2wUjAIwpLXY8z0SEwijXjHnp3CzRAggMdVjrcUG0u75pPNhvXX2tjLvWzxCmfNCXbFgaYtm2aor1tJe1a2RfT2SlEy/UAK+m+Xg+9HZCw0NJY7f9+2rJtejRCDBPZ7Lw2fkUU7WnpDEaWZgRY62A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSTl2h4r; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSTl2h4r"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8805988a200so2431657b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 23:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790664502; x=1791269302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wogCL0h2odrZAabbPoq1t1l8xjk8Y4qkfLjp9xjFaeM=;
        b=OSTl2h4rE8Z1wDxujiki6CfGml0tCePQ0PoGCeFvGP6jY0EWnLmfj0KLENwHvTxvmS
         nTkVM6tMtgzSyH1bcZxzrq2uMXB9saaCM1Pl4qgGTQDlhXV4frF5n1Brd9S6d7j/TvW3
         XN80397DzKnzqrWoEgd6VwwqoiUiyd4fMDTGYTK4R5rC+LHoinxlpxOHNAkMjbUVw2KI
         v3XErDf8l6pKgpej0k2QXJ+aKfeeeTBBDADuERrO+/N6+FBIdm/svy9Wz7TiPSlE1Dx3
         AZ51VSIDG7gDv1H8KCXIuCC3Lt5rGNiQDyf/VtT7LXAhpMtCt9apP1FEXUeEjW5IaPcH
         fjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790664502; x=1791269302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wogCL0h2odrZAabbPoq1t1l8xjk8Y4qkfLjp9xjFaeM=;
        b=OCUtze+VnSTc7ELEaZc9/k/jkVrRB5lSda3pYBF/4MdOfAHg2grlKuK3J5RfmRWZmu
         vmwA9iasVxeS56hqbJBXfznwtRNSiY2Z9Md4l+g1bzerEUECtcWAz17lS6Tu2GxFS1Nh
         /50q93BLVqCbYVllDnzhs9LdrajqGTR8NIGiAcWBcLuDs/6WPZl+xk4Vp0BUtqH5cLpe
         0F+++VD3l7nGY2JVj+RBm3XN1tVNTZd+62hmrSuJrm2phtivM44W+KOb50Vrr/P/+QHj
         pkd/5aEg8Fze2cSF52ODn9CGpthmQpMcep4SZ8gMrENZuUZSmyoC9hf5AMthEmVFQAo4
         Q3TA==
X-Forwarded-Encrypted: i=1; AKwUvBy9dYHGDkUbx7bfpRpxEHdEO/YD67rtdnC1KRDztsSXnGJ/F6Goog/rIe/j2tO7uyo2jH7YNMVcewWR/XD5v7I=@vger.kernel.org
X-Gm-Message-State: AFuF++mMrElFDuPTuecGsESBBZhyUm3ZkWXTdjZEDQpZBPny3n/mrDJk
	d61QIU8tQjci7DdYJO3H6p7wol4HrJoTDsL0XhItza7a839op9cNuGQt
X-Gm-Gg: AYBFou1x5kLr5Us9h2tbMwqaXm8BxxnPTE6HXU09CQKsgdJquVJHUg/iFhlakR08RbK
	0dj777tuUUqvvBIiP1FqeeqfzuIwt2I06yFMVENFdLHOvCAqFbhoWNNMlwhcqI3+C7oYbGkTE4v
	2cSgbQUKNoG0nFsGvTuWG8ltKkAQtYB0Rg73S05LVvFdnXIXcWiEVp4d2wI4CMNWR3O0ugZkqbc
	rnZXroyZ4O9on6ow3GSuZhFTDSdDacmYaZMSxF0Soi2C78UTlM64JnbzZemetvn7Gz9GgO73Cd4
	Ch3AZLXerbFrNgs4xi+OP+f11EubU+ikEhSX9pPBUPUojh8qGI3eFI6/lwDG3y9LFKaEWwtagdz
	0NYiJ2tFOe4TOk7G2KegfcdQifJA5ClaIWWrtGausTQh6+9fmeFO0qVVE1Mo54y6yLmFItInb29
	QjCXTn7DADoiY0UgnUnbEbPO7mFxkj5nn14qon7srDpMDH952lFdW7pDSkbbc9OcKDBggYCxbYc
	R63Gpjhmd+8qa93UYE=
X-Received: by 2002:a05:6a00:f8c:b0:885:1c17:c5fd with SMTP id d2e1a72fcca58-8851c17e17cmr2380380b3a.14.1790664502306;
        Mon, 28 Sep 2026 23:48:22 -0700 (PDT)
Received: from lsk.tail206e42.ts.net (vps-787f8425.vps.ovh.us. [2604:2dc0:202:300::17a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e1066470sm266922b3a.18.2026.09.28.23.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:48:21 -0700 (PDT)
From: liushike <liushike123@gmail.com>
To: netdev@vger.kernel.org
Cc: jmaloy@redhat.com,
	tung.quang.nguyen@est.tech,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC net-next 2/2] selftests: net: cover pending TIPC connects on peer node loss
Date: Tue, 29 Sep 2026 06:47:42 +0000
Message-Id: <20260929064742.576651-3-liushike123@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929064742.576651-1-liushike123@gmail.com>
References: <20260929064742.576651-1-liushike123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: liushike <liushike@ruijie.com.cn>

Exercise a client waiting for a listening server to accept a connection
using two network namespaces and one or two Ethernet veth bearers.

Cover normal acceptance, last-link loss, survival with one remaining
link, loss of both links, rejection, connection-wait timeout followed by
node loss, nonblocking connects, and service-name addressing. Run each
case with SOCK_STREAM and SOCK_SEQPACKET.

Wait for actual unicast links at both peers; the always-UP broadcast
link does not establish peer reachability. Require node-loss completion
within two seconds and check EHOSTUNREACH. For asynchronous failure,
check POLLHUP with poll(), matching TIPC_DISCONNECTING semantics rather
than assuming the socket becomes writable. Save topology diagnostics
when a test raises an exception.

Signed-off-by: liushike <liushike@ruijie.com.cn>
---
 MAINTAINERS                                 |   1 +
 tools/testing/selftests/net/Makefile        |   1 +
 tools/testing/selftests/net/config          |   1 +
 tools/testing/selftests/net/tipc_connect.py | 278 ++++++++++++++++++++
 4 files changed, 281 insertions(+)
 create mode 100755 tools/testing/selftests/net/tipc_connect.py

diff --git a/MAINTAINERS b/MAINTAINERS
index df8ab9b82402..4d595e60a22d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27561,6 +27561,7 @@ S:	Maintained
 W:	http://tipc.sourceforge.net/
 F:	include/uapi/linux/tipc*.h
 F:	net/tipc/
+F:	tools/testing/selftests/net/tipc_connect.py
 
 TLAN NETWORK DRIVER
 M:	Samuel Chessman <chessman@tux.org>
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 3ee3378f8b26..c453ff976386 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -118,6 +118,7 @@ TEST_PROGS := \
 	test_vxlan_vnifilter_notify.sh \
 	test_vxlan_vnifiltering.sh \
 	tfo_passive.sh \
+	tipc_connect.py \
 	traceroute.sh \
 	txtimestamp.sh \
 	udpgro.sh \
diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index 30d5fcb09a83..725c8fbc5f03 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -128,6 +128,7 @@ CONFIG_TCP_CONG_DCTCP=y
 CONFIG_TCP_MD5SIG=y
 CONFIG_TEST_BLACKHOLE_DEV=m
 CONFIG_TEST_BPF=m
+CONFIG_TIPC=m
 CONFIG_TLS=m
 CONFIG_TRACEPOINTS=y
 CONFIG_TUN=y
diff --git a/tools/testing/selftests/net/tipc_connect.py b/tools/testing/selftests/net/tipc_connect.py
new file mode 100755
index 000000000000..02685b3ce8dd
--- /dev/null
+++ b/tools/testing/selftests/net/tipc_connect.py
@@ -0,0 +1,278 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Exercise pending TIPC connects across bearer loss, before accept()."""
+
+import errno
+import os
+import select
+import shutil
+import socket
+import threading
+import time
+from contextlib import ExitStack, contextmanager
+
+from lib.py import (KsftNamedVariant, KsftSkipEx, NetNS, NetNSEnter,
+                    cmd, ip, ksft_eq, ksft_exit, ksft_run, ksft_true,
+                    ksft_variants)
+
+
+SOCKET_TYPES = [KsftNamedVariant("stream", socket.SOCK_STREAM),
+                KsftNamedVariant("seqpacket", socket.SOCK_SEQPACKET)]
+CONNECT_TIMEOUT = 10000
+RETURN_TIMEOUT = 2
+
+
+def tipc(ns, args):
+    return cmd("tipc " + args, ns=ns).stdout
+
+
+def unicast_links_up(output):
+    """Return distinct UP links, excluding the always-UP broadcast link."""
+    links = set()
+    for line in output.splitlines():
+        name, separator, state = line.strip().rpartition(": ")
+        if (separator and state.lower() == "up" and
+                not name.startswith("broadcast-link")):
+            links.add(name)
+    return links
+
+
+def wait_for_links(client_ns, server_ns, links):
+    deadline = time.monotonic() + 10
+    while True:
+        # These isolated namespaces contain only the two test peers. Count
+        # their unicast links, not the namespace's always-UP broadcast link.
+        outputs = [tipc(ns, "link list") for ns in (client_ns, server_ns)]
+        if all(len(unicast_links_up(output)) == links for output in outputs):
+            return
+        if time.monotonic() >= deadline:
+            raise TimeoutError(
+                f"Expected {links} UP unicast links at each peer; "
+                f"client link list: {outputs[0]!r}; "
+                f"server link list: {outputs[1]!r}")
+        time.sleep(0.05)
+
+
+@contextmanager
+def topology(sock_type, links=1):
+    if not hasattr(socket, "AF_TIPC"):
+        raise KsftSkipEx("Python lacks AF_TIPC support")
+    if os.geteuid() != 0:
+        raise KsftSkipEx("root privileges required for network namespaces")
+    for tool in ("ip", "tipc"):
+        if not shutil.which(tool):
+            raise KsftSkipEx(f"{tool} is required")
+    try:
+        with socket.socket(socket.AF_TIPC, sock_type):
+            pass
+    except OSError as error:
+        if error.errno in (errno.EAFNOSUPPORT, errno.EPROTONOSUPPORT):
+            raise KsftSkipEx("TIPC support is unavailable; load tipc") from error
+        raise
+
+    with ExitStack() as stack:
+        client_ns = stack.enter_context(NetNS())
+        server_ns = stack.enter_context(NetNS())
+        for ns, address in ((client_ns, "1.1.1"), (server_ns, "1.1.2")):
+            tipc(ns, "node set netid 4711")
+            tipc(ns, f"node set address {address}")
+        for index in range(links):
+            ip(f"link add c{index} type veth peer name s{index} "
+               f"netns {server_ns}", ns=client_ns)
+            for ns, dev in ((client_ns, f"c{index}"),
+                            (server_ns, f"s{index}")):
+                ip(f"link set {dev} up", ns=ns)
+                tipc(ns, f"bearer enable media eth device {dev}")
+
+        wait_for_links(client_ns, server_ns, links)
+
+        with NetNSEnter(server_ns):
+            listener = stack.enter_context(socket.socket(socket.AF_TIPC,
+                                                        sock_type))
+            listener.listen(8)
+        with NetNSEnter(client_ns):
+            client = stack.enter_context(socket.socket(socket.AF_TIPC,
+                                                      sock_type))
+            client.setsockopt(socket.SOL_TIPC, socket.TIPC_CONN_TIMEOUT,
+                              CONNECT_TIMEOUT)
+        try:
+            yield client_ns, client, listener
+        except Exception:
+            # Collect diagnostics before ExitStack destroys the topology.
+            for label, ns in (("client", client_ns), ("server", server_ns)):
+                for args in ("link list", "node list"):
+                    try:
+                        output = tipc(ns, args)
+                        print(f"# {label} {args}: {output!r}")
+                    except Exception as error:
+                        print(f"# {label} {args} failed: {error}")
+            raise
+
+
+@contextmanager
+def pending_connect(client, listener, address=None):
+    result = []
+    if address is None:
+        address = listener.getsockname()
+
+    def connect():
+        result.append(client.connect_ex(address))
+
+    worker = threading.Thread(target=connect)
+    worker.start()
+    try:
+        # Readability proves SYN is queued on the listener, without accepting it.
+        if not select.select([listener], [], [], 5)[0]:
+            raise TimeoutError(f"SYN did not reach {address!r}: {result}")
+        ksft_eq(result, [], "connect must wait for accept")
+        yield worker, result
+    finally:
+        # Bound cleanup even on the unfixed kernel or a failed assertion.
+        if worker.is_alive():
+            try:
+                client.shutdown(socket.SHUT_RDWR)
+            except OSError:
+                pass
+        worker.join(CONNECT_TIMEOUT / 1000 + 1)
+
+
+def drop_link(ns, index):
+    tipc(ns, f"bearer disable media eth device c{index}")
+
+
+def check_node_loss(client):
+    # TIPC_DISCONNECTING reports POLLHUP, not POLLOUT. Unlike select()'s
+    # write set, poll() reports hangup even when only POLLOUT is requested.
+    poller = select.poll()
+    poller.register(client, select.POLLOUT)
+    events = poller.poll(int(RETURN_TIMEOUT * 1000))
+    ksft_true(events, "node loss must notify pending connect within 2s")
+    if events:
+        ksft_eq(events[0][0], client.fileno())
+        ksft_true(events[0][1] & select.POLLHUP,
+                  f"node loss must report hangup, got {events!r}")
+    ksft_eq(client.getsockopt(socket.SOL_SOCKET, socket.SO_ERROR),
+            errno.EHOSTUNREACH)
+
+
+@ksft_variants(SOCKET_TYPES)
+def normal_accept(sock_type):
+    with topology(sock_type) as (_, client, listener):
+        with pending_connect(client, listener) as (worker, result):
+            with listener.accept()[0] as accepted:
+                worker.join(RETURN_TIMEOUT)
+                ksft_eq(result, [0])
+                if result == [0]:
+                    accepted.settimeout(RETURN_TIMEOUT)
+                    client.sendall(b"connected")
+                    ksft_eq(accepted.recv(32), b"connected")
+
+
+@ksft_variants(SOCKET_TYPES)
+def last_link_down(sock_type):
+    with topology(sock_type) as (ns, client, listener):
+        with pending_connect(client, listener) as (worker, result):
+            drop_link(ns, 0)
+            worker.join(RETURN_TIMEOUT)
+            ksft_eq(result, [errno.EHOSTUNREACH],
+                    "node loss must abort connect before its 10s timeout")
+
+
+@ksft_variants(SOCKET_TYPES)
+def surviving_link(sock_type):
+    with topology(sock_type, links=2) as (ns, client, listener):
+        with pending_connect(client, listener) as (worker, result):
+            drop_link(ns, 0)
+            worker.join(0.2)
+            ksft_eq(result, [], "one remaining link must preserve connect")
+            with listener.accept()[0]:
+                worker.join(RETURN_TIMEOUT)
+                ksft_eq(result, [0])
+
+
+@ksft_variants(SOCKET_TYPES)
+def both_links_down(sock_type):
+    with topology(sock_type, links=2) as (ns, client, listener):
+        with pending_connect(client, listener) as (worker, result):
+            drop_link(ns, 0)
+            worker.join(0.2)
+            ksft_eq(result, [])
+            drop_link(ns, 1)
+            worker.join(RETURN_TIMEOUT)
+            ksft_eq(result, [errno.EHOSTUNREACH])
+
+
+@ksft_variants(SOCKET_TYPES)
+def rejected_connect(sock_type):
+    with topology(sock_type) as (ns, client, listener):
+        with pending_connect(client, listener) as (worker, result):
+            listener.close()
+            worker.join(RETURN_TIMEOUT)
+            ksft_eq(result, [errno.ECONNREFUSED])
+            drop_link(ns, 0)
+            ksft_eq(client.getsockopt(socket.SOL_SOCKET, socket.SO_ERROR), 0,
+                    "node loss must not change a completed rejection")
+
+
+@ksft_variants(SOCKET_TYPES)
+def connect_timeout_then_node_loss(sock_type):
+    with topology(sock_type) as (ns, client, listener):
+        client.setsockopt(socket.SOL_TIPC, socket.TIPC_CONN_TIMEOUT, 500)
+        with pending_connect(client, listener) as (worker, result):
+            worker.join(RETURN_TIMEOUT)
+            ksft_eq(result, [errno.ETIMEDOUT])
+            # A wait timeout leaves the handshake pending, just as EINPROGRESS.
+            drop_link(ns, 0)
+            check_node_loss(client)
+
+
+@ksft_variants(SOCKET_TYPES)
+def nonblocking_connect(sock_type):
+    with topology(sock_type) as (ns, client, listener):
+        client.setblocking(False)
+        ksft_eq(client.connect_ex(listener.getsockname()), errno.EINPROGRESS)
+        if not select.select([listener], [], [], 5)[0]:
+            raise TimeoutError("SYN did not reach listener")
+        drop_link(ns, 0)
+        check_node_loss(client)
+
+
+def publish_service(ns, listener):
+    service = 18888
+    listener.bind((socket.TIPC_ADDR_NAMESEQ, service, 1, 1,
+                   socket.TIPC_CLUSTER_SCOPE))
+    deadline = time.monotonic() + 10
+    while str(service) not in tipc(ns, "nametable show").split():
+        if time.monotonic() >= deadline:
+            raise TimeoutError("TIPC service publication did not arrive")
+        time.sleep(0.05)
+    return socket.TIPC_ADDR_NAME, service, 1, 0
+
+
+@ksft_variants(SOCKET_TYPES)
+def named_accept(sock_type):
+    with topology(sock_type) as (ns, client, listener):
+        address = publish_service(ns, listener)
+        with pending_connect(client, listener, address) as (worker, result):
+            with listener.accept()[0]:
+                worker.join(RETURN_TIMEOUT)
+                ksft_eq(result, [0])
+
+
+@ksft_variants(SOCKET_TYPES)
+def named_node_loss(sock_type):
+    with topology(sock_type) as (ns, client, listener):
+        address = publish_service(ns, listener)
+        with pending_connect(client, listener, address) as (worker, result):
+            drop_link(ns, 0)
+            worker.join(RETURN_TIMEOUT)
+            ksft_eq(result, [errno.EHOSTUNREACH])
+
+
+if __name__ == "__main__":
+    ksft_run(cases=[normal_accept, last_link_down, surviving_link,
+                    both_links_down, rejected_connect,
+                    connect_timeout_then_node_loss, nonblocking_connect,
+                    named_accept, named_node_loss])
+    ksft_exit()
-- 
2.34.1

