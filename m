Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFCD3B4EA1
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 20:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778876393; cv=none; b=caJHlkNlhCyDXZhWAk9jFlM/1i9sQ+4beWuwhROmZSX4OPj4e5bUYBHhhr3uAnupgYjTgBfn/PHgMGemR0HhSeTYP7Y+hB7xadCIxVN4h19aY4cYelZ61MLm14O5RUkMppZkBxX2M4qSv7CdJVg8s+Qludul8Cpo+lvQgCczB90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778876393; c=relaxed/simple;
	bh=7IM3ALLv1AgX0seWLzIVOzbdOeXPtSRRe0lozcL/OEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tY/IrTEUbKzd60UiVFADiJYaD3WZR1iCbA844cMFbdNdHWygv1HK9d2XoaTRU1cBruwRNw3zx2yd/9UqR9Q1zltTzH01GVl48EnPOYE7PSuWYiVdZDZ1ZSESVF5hrxd9aMFbV9CD7i8neE1zYRbiDBbfshZNbcQlVjj6CIejoZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so1790475e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 13:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778876390; x=1779481190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ahZgkQzq/Ce3e/XVp5af27PA0zXGWrRU0/owFyh8aqA=;
        b=NPK9inuoJBaiRcf3v9lhxeymOXQRBAoUNu/HJySvBGsb1URtf0vV1OqQR8tmyX8sa8
         tYxuMIz6foI377KxvMlPO4JXL/H7BEPIvqI8lL7K80kJEIfRsmje+b+iVGuPZk8D2vlz
         ebC8c/D6XnEIBZb3NG36BgNlW9Kwiof5X/aeoKUTWUmlkZfF1Ox++oE9Fnc7OGmcRAZf
         o96lds6BUyLNz+XbBTbB3ZxQrBOjHcRWiYi3a3p2QItrCMS3aa1D+GO11X7UqGLhlis7
         JPO1e3fwD5nB+VzYBvqvTAua5R842O9Z99s1RnxabPJhZUANQ06q5SWGxy+fBozwstXR
         mfwg==
X-Forwarded-Encrypted: i=1; AFNElJ/cRA2XwegwkCOYuWHp/NQGIQbKUSLKbOIYyLmes97MZv+7cNbWZ6nTAWd7/x2hlOvYPSWnpw+Pu6yIOhHrIVk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR3uL5GbM1NiAhS88GjEsZNthe6tyduVBpni9V3VGqn2vTbz2+
	jMOppth3Vyi46LLsImTu4JkBmocni5kIg2+pvoPXDwTdWSjKTfXY2nWz
X-Gm-Gg: Acq92OGtLYnBKhLeupSDpQG/IMx9KMSUtusjBtqcUMK5AKBHcD5ssU+b7URB9exdam6
	C4IweHHg8ca6GQB8AsSoeHZBoZdw7TxnWDY01fIk61tuIHAXcpjX+pBWiasxaQg+VXlP3LMThv8
	fu4sfzBFhczJ7rkgS7wqNPs7dqhBbERWwp2zFe7ZWbFY8ar4CzK3ppbqsRa4lO5ba5xIBpsnC3S
	tT9mmGhuQUN5qs0TvLy+VI3/Qstw6OTS3A2T9pZ9wyocyeFlTdbxkp2ElKWLujyQaCf0YbAVT1X
	YxSOt9+1mEV7eML3VLyeyR//Q7C1kkw1tqBaFQpzlO41RLG/1HgFOClE9Cw8M2lvLsS/blag+UV
	m0pKwYBdGrfozat33o1QEgBEySI8KRW+N+WEOgTOZ+RZ4b/yb1i9WyC7Vkm2B2zZCVJH+ULjG5/
	v/k/AzgT8W8homAFedxbnysE8RfYqB8fteW40vSgB6Z2XY4D85H/koGxWmq7G4G2TfpwVjEg==
X-Received: by 2002:a05:600d:8:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-48fe61f291cmr71924875e9.14.1778876390168;
        Fri, 15 May 2026 13:19:50 -0700 (PDT)
Received: from im-t490s.redhat.com (89-24-32-159.nat.epc.tmcz.cz. [89.24.32.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feab2896bsm22924605e9.4.2026.05.15.13.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 13:19:49 -0700 (PDT)
From: Ilya Maximets <i.maximets@ovn.org>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Adrian Moreno <amorenoz@redhat.com>,
	Jiri Benc <jbenc@redhat.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matteo Perin <matteo.perin@canonical.com>,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH net 4/5] tools: ynl: support listening on all nsids
Date: Fri, 15 May 2026 22:19:23 +0200
Message-ID: <20260515201937.2813983-5-i.maximets@ovn.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515201937.2813983-1-i.maximets@ovn.org>
References: <20260515201937.2813983-1-i.maximets@ovn.org>
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
 tools/net/ynl/pyynl/lib/ynl.py | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/tools/net/ynl/pyynl/lib/ynl.py b/tools/net/ynl/pyynl/lib/ynl.py
index f63c6f8287359..6d96c2b06507e 100644
--- a/tools/net/ynl/pyynl/lib/ynl.py
+++ b/tools/net/ynl/pyynl/lib/ynl.py
@@ -42,6 +42,7 @@ class Netlink:
     SOL_NETLINK = 270
 
     NETLINK_ADD_MEMBERSHIP = 1
+    NETLINK_LISTEN_ALL_NSID = 8
     NETLINK_CAP_ACK = 10
     NETLINK_EXT_ACK = 11
     NETLINK_GET_STRICT_CHK = 12
@@ -748,6 +749,21 @@ class YnlFamily(SpecFamily):
         self.sock.setsockopt(Netlink.SOL_NETLINK, Netlink.NETLINK_ADD_MEMBERSHIP,
                              mcast_id)
 
+    def ntf_listen_all_nsid(self):
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
 
@@ -1235,7 +1251,7 @@ class YnlFamily(SpecFamily):
                             f" when parsing '{attr_spec['name']}'")
         return raw
 
-    def handle_ntf(self, decoded):
+    def handle_ntf(self, decoded, nsid=None):
         msg = {}
         if self.include_raw:
             msg['raw'] = decoded
@@ -1246,15 +1262,20 @@ class YnlFamily(SpecFamily):
 
         msg['name'] = op['name']
         msg['msg'] = attrs
+        if nsid is not None:
+            msg['nsid'] = nsid
         self.async_msg_queue.put(msg)
 
     def check_ntf(self):
         while True:
             try:
-                reply = self.sock.recv(self._recv_size, socket.MSG_DONTWAIT)
+                reply, ancdata, _, _ = self.sock.recvmsg(self._recv_size,
+                                                         4096,
+                                                         socket.MSG_DONTWAIT)
             except BlockingIOError:
                 return
 
+            nsid = self._decode_nsid(ancdata)
             nms = NlMsgs(reply)
             self._recv_dbg_print(reply, nms)
             for nl_msg in nms:
@@ -1271,7 +1292,7 @@ class YnlFamily(SpecFamily):
                     print("Unexpected msg id while checking for ntf", decoded)
                     continue
 
-                self.handle_ntf(decoded)
+                self.handle_ntf(decoded, nsid)
 
     def poll_ntf(self, duration=None):
         start_time = time.time()
@@ -1335,7 +1356,8 @@ class YnlFamily(SpecFamily):
         rsp = []
         op_rsp = []
         while not done:
-            reply = self.sock.recv(self._recv_size)
+            reply, ancdata, _, _ = self.sock.recvmsg(self._recv_size, 4096)
+            nsid = self._decode_nsid(ancdata)
             nms = NlMsgs(reply)
             self._recv_dbg_print(reply, nms)
             for nl_msg in nms:
@@ -1374,7 +1396,7 @@ class YnlFamily(SpecFamily):
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

