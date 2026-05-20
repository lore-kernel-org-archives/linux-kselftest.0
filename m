Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6195B3F54A7
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 17:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779297827; cv=none; b=QWlxujueqCB6PWV9KEFL0SrIK7Mg92s36RUCaFAkj6eUr4UI9TwC0eJv6d6DQNd2DBE1gjFS5UAvWC4s/0KbzQ6gj7+CeNlq4O7qIlX22TACZB6v3EnseuX4LiQcBVgvbtGa74KQl9Q117UM0MlAXQhBcKxIsGDwFLg61FEMkgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779297827; c=relaxed/simple;
	bh=2UYvNlSA+2GlROQWwNORHOgZveV7UHr6PN2hwqWlNuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ejut8f5Gxudx5dBkZ2v+twrKvu9gHulXumT9QMYDnZcBXgdGsXz/yd8PQi0qWgJvoyYrtY7O70zif4ZwGRCIs7XAsUIO+ZTTW+2rS7l2ePANIBijmRDuyQ112JqpJxIyjhpRrFl8+ZH9KkfWMUjzeI6cJrleFWrGM+jHiy3Spyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-452169ae568so3311963f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 10:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779297825; x=1779902625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EqFt3aKsOC7Q71BIE2C6rkJYkvil00DlAxCbqMAvtdk=;
        b=qE6GqnJSfXDSwZd8shEr0zQRVtnoieIORBbvHw2StVf4IgeGr4lvh9BrkDo9r2z6SZ
         I2rv7zUZqLcJ9xvFj6fj9G0gSEfIjMaIMjeFW2GRWkllscqPMHgEH69FZXEQZKHN0wjt
         +u5+6sESn6aOyqDbPODyaCir/+5v0MhXrgNTDE+6xrDPE1QbhNzcA16M9S6cvCSA6YhL
         r/41NsIW8prQoVU9fue3vyjfFOEiMeKAk52r7LEesmtlG+wLmpGYGuKaUqBmlPg8JxCB
         hVp055PSeu+i+gUKt1x1zAWxBxhf7FkS55o37YIs3Wp25I6dYxBVYm/C5kvs2s2CziB4
         qPdA==
X-Forwarded-Encrypted: i=1; AFNElJ+Lo7yDuLzRudeorwEpieeWP25Sqp8E+2cEcg0ualeFL17emC+ADkRibGDUYNGyIEbfetKMrONo0yz3m53Xhoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhHCxFA+Q6huQQOMu1hyJvSKcNl3jXrXf1Yn+6PhkNtczxOg3c
	PztGj/KKOgZdZjVe62zK72y6U6290XEGCfgpvMJEt4pnQDwa3GRFs8tB
X-Gm-Gg: Acq92OGKyPRkeKdrHuBLBnH6XZLSenZqX53QSrxp3C9ymgvV2q5VoKpnZziBXeEYqbT
	oEDBPuHno6nH+it5TQd4PwvH1+w5ymScW3Cw24wa8QdH0CdWIZaptHzj7aAzHW2mD9retT3Bgj1
	8tJWWao5XOzjHAMTgyqRMGRPILLE0SXzyvlrWp83U9pMzs7LLA/AnM7Zi4EDo+2HSU7U902RDbY
	y0VpgWbv9qBHogxz7csAdRJJ6Hu9h0/yjolk5NidRF6Yzfmn/dvVtoB+aDPgO8w4RW1pbQUPO/9
	AB2E5KReRm3OCifkLeE7s7Kt1IPHwultTCvbBK3po2zHdDhVnD7Iji6iDRXn1cXrWybXktLvu+v
	PVoRA7w13IMsfelXcZ9fZepLg1t1gmXKs1xcQ//emgdyWzOjmnnkW0KPdubJH7r2/FawUvTfVgZ
	g9+a1yuutnPl9W/L1kzNGqULOOWrhdA7EPh3nSPUQ+F9tK7iPjwo8MygqchNU=
X-Received: by 2002:a05:6000:46cc:b0:45e:a0ab:8bc8 with SMTP id ffacd0b85a97d-45ea0ab8cd1mr615345f8f.3.1779297824693;
        Wed, 20 May 2026 10:23:44 -0700 (PDT)
Received: from im-t490s.redhat.com (89-24-32-159.nat.epc.tmcz.cz. [89.24.32.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm51125580f8f.26.2026.05.20.10.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 10:23:44 -0700 (PDT)
From: Ilya Maximets <i.maximets@ovn.org>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Kees Cook <kees@kernel.org>,
	Adrian Moreno <amorenoz@redhat.com>,
	Jiri Benc <jbenc@redhat.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matteo Perin <matteo.perin@canonical.com>,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH net v2 3/4] tools: ynl: support listening on all nsids
Date: Wed, 20 May 2026 19:22:37 +0200
Message-ID: <20260520172317.175168-4-i.maximets@ovn.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520172317.175168-1-i.maximets@ovn.org>
References: <20260520172317.175168-1-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A new method ntf_listen_all_nsid() to enable listening on events from
all namespaces.  Useful for testing cross-namespace functionality.

recv() replaced with recvmsg() to be able to receive NSID through the
ancillary data.

Assisted-by: OpenCode:claude-opus-4.6
Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 tools/net/ynl/pyynl/lib/ynl.py | 37 +++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/tools/net/ynl/pyynl/lib/ynl.py b/tools/net/ynl/pyynl/lib/ynl.py
index f63c6f8287359..010aac0c6c67a 100644
--- a/tools/net/ynl/pyynl/lib/ynl.py
+++ b/tools/net/ynl/pyynl/lib/ynl.py
@@ -42,6 +42,7 @@ class Netlink:
     SOL_NETLINK = 270
 
     NETLINK_ADD_MEMBERSHIP = 1
+    NETLINK_LISTEN_ALL_NSID = 8
     NETLINK_CAP_ACK = 10
     NETLINK_EXT_ACK = 11
     NETLINK_GET_STRICT_CHK = 12
@@ -680,6 +681,7 @@ class YnlFamily(SpecFamily):
     Notification API:
 
       ynl.ntf_subscribe(mcast_name)      -- join a multicast group
+      ynl.ntf_listen_all_nsid()          -- listen on all netns
       ynl.check_ntf()                    -- drain pending notifications
       ynl.poll_ntf(duration=None)        -- yield notifications
 
@@ -748,6 +750,23 @@ class YnlFamily(SpecFamily):
         self.sock.setsockopt(Netlink.SOL_NETLINK, Netlink.NETLINK_ADD_MEMBERSHIP,
                              mcast_id)
 
+    def ntf_listen_all_nsid(self):
+        """Enable NETLINK_LISTEN_ALL_NSID to receive notifications from all
+        namespaces that have an nsid mapped in the current one."""
+        self.sock.setsockopt(Netlink.SOL_NETLINK,
+                             Netlink.NETLINK_LISTEN_ALL_NSID, 1)
+
+    @staticmethod
+    def _decode_nsid(ancdata):
+        for cmsg_level, cmsg_type, cmsg_data in ancdata:
+            if (cmsg_level == Netlink.SOL_NETLINK and
+                    cmsg_type == Netlink.NETLINK_LISTEN_ALL_NSID):
+                nsid = struct.unpack('i', cmsg_data)[0]
+                if nsid >= 0:
+                    return nsid
+                return None
+        return None
+
     def set_recv_dbg(self, enabled):
         self._recv_dbg = enabled
 
@@ -1235,7 +1254,7 @@ class YnlFamily(SpecFamily):
                             f" when parsing '{attr_spec['name']}'")
         return raw
 
-    def handle_ntf(self, decoded):
+    def handle_ntf(self, decoded, nsid=None):
         msg = {}
         if self.include_raw:
             msg['raw'] = decoded
@@ -1246,15 +1265,22 @@ class YnlFamily(SpecFamily):
 
         msg['name'] = op['name']
         msg['msg'] = attrs
+        if nsid is not None:
+            msg['nsid'] = nsid
         self.async_msg_queue.put(msg)
 
+    def _recvmsg(self, flags=0):
+        reply, ancdata, _, _ = self.sock.recvmsg(self._recv_size, 4096, flags)
+        return reply, ancdata
+
     def check_ntf(self):
         while True:
             try:
-                reply = self.sock.recv(self._recv_size, socket.MSG_DONTWAIT)
+                reply, ancdata = self._recvmsg(socket.MSG_DONTWAIT)
             except BlockingIOError:
                 return
 
+            nsid = self._decode_nsid(ancdata)
             nms = NlMsgs(reply)
             self._recv_dbg_print(reply, nms)
             for nl_msg in nms:
@@ -1271,7 +1297,7 @@ class YnlFamily(SpecFamily):
                     print("Unexpected msg id while checking for ntf", decoded)
                     continue
 
-                self.handle_ntf(decoded)
+                self.handle_ntf(decoded, nsid)
 
     def poll_ntf(self, duration=None):
         start_time = time.time()
@@ -1335,7 +1361,8 @@ class YnlFamily(SpecFamily):
         rsp = []
         op_rsp = []
         while not done:
-            reply = self.sock.recv(self._recv_size)
+            reply, ancdata = self._recvmsg()
+            nsid = self._decode_nsid(ancdata)
             nms = NlMsgs(reply)
             self._recv_dbg_print(reply, nms)
             for nl_msg in nms:
@@ -1374,7 +1401,7 @@ class YnlFamily(SpecFamily):
                 # Check if this is a reply to our request
                 if nl_msg.nl_seq not in reqs_by_seq or decoded.cmd() != op.rsp_value:
                     if decoded.cmd() in self.async_msg_ids:
-                        self.handle_ntf(decoded)
+                        self.handle_ntf(decoded, nsid)
                         continue
                     print('Unexpected message: ' + repr(decoded))
                     continue
-- 
2.53.0

