Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952468;
	b=NrKFr5fpFbv5fx998fH2hz/9XqoGWRFv6aadjEibfiBvU+jPPXXC9CU3mMeMi1ZIB5Ud
	 ZpJOuJhvtphnTeQydvL1lLDgdU5S7LQEZotUaw+KtbdZtiSchAdgGUZ7a41Nug+amlr98
	 Ghp8bIuGAULKXcknGOe9OZ8xgQ/Ge89U4x/1jJXVgf/Y2rSC8nOOoOf7V7p7jNJNuBlnf
	 /Ai7Aut/S7lMrj5hT5F2aDc4XqAaispIGZMGe/SdesW87hetm76p+6SJyVWVQeFAF+Rv6
	 sw6GnasTYqQv0d6D4O0u0DRtRSByZsJMiDlj2Qm/8MBquBKSn8wCKJUYgaEcH4eNfUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RDV1bx3ja+YvNrLezba1SlDO8efyEXdMeRFf74ipHOo=;
	b=p49NGyJyXRfL8xpxEQtrZLzH+b6O5n2xe+IMrg7Zzisa0A+h6HVMt9nujgf29vFEYn5w
	 MUBX6yjBXUIGJ2vXeKpBnSI0eg2xalM7vEjHPY9/TsFlV7FQ6UVPOYuynPGQb9jgPjnsj
	 fWLQ2aiZX85iA/a/XqORGbPfRzU8yFQJoUkaa5RVInIyxnfwt3kPZ2nDr2jrAnDt9i5JG
	 mC9xWFOh8sFVNziAUf+cXxh21S1b5gUsqC65VWQnBiV8rNXPUO+nFCH4mLiHJWMJWDtN7
	 2HlhYa/7be0iMi6xqXaSsXDqE8jekNF7x3tQlyELydinwan7Wo3elB37yeQzWcrRibw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axpocuFl;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23965606A332
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 21:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23965606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axpocuFl
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cddac941ed1so139138a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 13:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952467; x=1795557267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RDV1bx3ja+YvNrLezba1SlDO8efyEXdMeRFf74ipHOo=;
        b=axpocuFl80FvAB6K0rZxxboDLtcNggcPKNN2UKlsVtFpwW/YpEM8wRJS7iMsxv0ACR
         Yi0bS/ixM2TrOygocp/SAafyE0mM4l+8EY3rVIQyYo6Nro1zs8+2Vy0/7XK6kWI7PtFy
         r5yXn1ugRgzHH40jFnzDVPt4puK3Ywa2mZR78n9m8q2SxXbN0XFAK6Z6sdX9WUSb4i5x
         JqXDA4qc62SY+flHQtqb95ZbhWe5R00nawnX6JgDwa8Bx9IfO3FhHT0VNsBwcqgnGZAm
         zo3MV0RBsD45xyWQZMMW57Hnphg7zudRqxg550FBQKIksQZNaHx98S+PodV/xuAa4yhm
         Yq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952467; x=1795557267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RDV1bx3ja+YvNrLezba1SlDO8efyEXdMeRFf74ipHOo=;
        b=08Ink0krKRv82ex7bP27eS6FTouSrBWPPAB6QveDBwAhUSG5gPfLH/AeGfF/Y//5zX
         mQlJy0xYXDtR8SosO5T802bn+bFLAvG+M+9mGFagVHjCHEG05TgfHtV9be6RDaZp95vM
         wZ2OFs/18Y1cFJUb8oGSEm0Hddyac+6zaTq4wQrgn3MyVni5KAB8nyk1jZON+Ul1WZgO
         Qq9LeuY70cSUNaKo4vgS+umQTlgVaPndUyBYdy3DtzmjEbudTOLGlei2eIUZKZQ+ZF95
         KsWmyaZMj+nsqxTAZp0waC3dbyez4vxXrqseswXSHZz2QDw27HsoFHHwNobEykU57+vG
         ucrw==
X-Forwarded-Encrypted: i=1; AL+hErEkb/EgQRhM5Qg9NmO6QuthZGTfZIfO/sfQvJCuCtbxFBFzU9gBADJsC2NVPz0SAF5+qjprzOt4AQF6he1p9Dk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VGx6h9JVcdy5BhPABaO71azkr2DrrTDLZWjFWgShkaSk28+xq
	b3cRUQOazdjKDXeq8TZ7lJNugerZpIDYCITgzYatAjCbnaWVVmIYbshd
X-Gm-Gg: AZFdTZdfdSpj+zy2pkr1gZgAjLYBo79ZD0QV33AQiB2goI+X329tIBTnstrd9NghcOE
	pMDP+OuttQv349ynVfoioSwvOFCG55A6DT/9zcHS8/6zOy5F6x/SBiIABgK6879J4PtOXZtwR9d
	iWkTd8lSV3a/SiRvEzD4qjfVZNWodp4Amgrpo4KpqcfJiaXGy/reR6p++4wA0ySqI6h+rFk03+e
	Z3zsMOgQkLpeKad+NS6lYklVMp+gwGj4i6vHj2cm0PEufWNfJfaZu12sTtzPVY1HZ+qc4cMgzSM
	H6zHHWgcOJI/+ppNIiIzTorzDUFxM7jsLN29a9V2KJ+EecXQYpM6ym26k+WMQvIMJGehI4mcY3P
	iZ9RZvzD9fAVpw5S4WoAn+pMWPy1ZCgswtu84SWcys9rN9nGkhpD00CoOT5BX+Pf5p0OV8Aabrz
	juWkZYVhT02TUW/LuhM24ne896zgLx8Kb23Th4R5iaMiTIwCKKdYwYxJkNvK7kQwZDr14sOYKnx
	XjYEZmYpXh6q/dbOZqa1Uhl8cBwx2ZM6X26l/ZKFGmdowgosVlalnEJuwmlmmFvrHv3Yfo/0W+9
	kYz73t7aSxN1mNpoEYZKOdxuyzCUaEKrjEA=
X-Received: by 2002:a17:90a:d445:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3b3d0686792mr575601a91.6.1794952467348;
        Tue, 17 Nov 2026 13:54:27 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:55::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acd118sm727075a91.12.2026.11.17.13.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:54:26 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mohsin Bashir <hmohsin@meta.com>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net v2 5/5] selftests: drv-net: stats: query timestamping stats while down
Date: Tue, 17 Nov 2026 13:54:16 -0800
Message-ID: <20261117215416.1901246-6-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.1
In-Reply-To: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
References: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
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

From: Dimitri Daskalakis <daskald@meta.com>

Read timestamping statistics before and after ifdown, to catch drivers
that crash while the interface is down. Counters must not go backwards
across ifdown; the test does not send timestamped traffic, so a reset
is only caught if the counters were already nonzero.

Signed-off-by: Dimitri Daskalakis <daskald@meta.com>
---
 tools/testing/selftests/drivers/net/stats.py | 25 +++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/stats.py b/tools/testing/selftests/drivers/net/stats.py
index b08e4d48b15c..e61db30b5181 100755
--- a/tools/testing/selftests/drivers/net/stats.py
+++ b/tools/testing/selftests/drivers/net/stats.py
@@ -220,6 +220,28 @@ def check_down(cfg) -> None:
     netfam.qstats_get({"ifindex": cfg.ifindex, "scope": "queue"}, dump=True)
 
 
+@ksft_disruptive
+def check_down_ts_stats(cfg) -> None:
+    """Test timestamping stats are not impacted by ifdown"""
+
+    req = {"header": {"dev-index": cfg.ifindex, "flags": {"stats"}}}
+    try:
+        stats = ethnl.tsinfo_get(req).get("stats")
+    except NlError as e:
+        if e.error == errno.EOPNOTSUPP:
+            raise KsftSkipEx("timestamping not supported by the device") from e
+        raise
+    if not stats:
+        raise KsftSkipEx("timestamping stats not supported by the device")
+
+    ip(f"link set dev {cfg.dev['ifname']} down")
+    defer(ip, f"link set dev {cfg.dev['ifname']} up")
+
+    stats2 = ethnl.tsinfo_get(req).get("stats", {})
+    for k in stats:
+        ksft_ge(stats2[k], stats[k], comment=f"{k} went backwards on device down")
+
+
 def __run_inf_loop(body):
     body = body.strip()
     if body[-1] != ';':
@@ -311,7 +333,8 @@ def main() -> None:
 
     with NetDrvEnv(__file__, queue_count=100) as cfg:
         ksft_run([check_pause, check_fec, check_fec_hist, pkt_byte_sum,
-		  qstat_by_ifindex, check_down, procfs_hammer,
+		  qstat_by_ifindex, check_down, check_down_ts_stats,
+		  procfs_hammer,
 		  procfs_downup_hammer],
                  args=(cfg, ))
     ksft_exit()
-- 
2.52.1

