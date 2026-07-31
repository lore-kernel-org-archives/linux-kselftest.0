Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CD43B0AF5
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 14:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509781; cv=none; b=Kv7wKIYkxE03ohnk/+VayPwx4EXoH1/raUTcTqgZsoNO4fSlcUN4aHiryxgAiN9P10prMC3Gi2bmPLxXjbAAxmnNWamZlkE6oXnL2e8wijuHAeLJa8Agf7fUyLjbSUCcfKHLIA/rjVmHbF49ouGcPFnRPVLRw2Pu83xG8tQCxiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509781; c=relaxed/simple;
	bh=hZ1YauAi3dGx8ucxhDwiFNmqYPLCrvErBB3RNfqn5t4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hnt7kR6Q7i996spN3UEZFnjHI76OA2R8tGUpz+Vurh9DOFE9C5p7jXMaGCWWChrQuyWhhaeUoV47O/dxXpaiCXmjmHJbOxa01eZcIA8yWGjfpFwjldsbGztHH0e1D679TtBfVDPPt+m2TzF2RVesXMzdEyMP5JihF2s++HRLekA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B7cQDdfv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B7cQDdfv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785509777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s28ds64NKsQOrjmawHAp2UwN4M9GHd+vx61+rPxcqfo=;
	b=B7cQDdfvqZQrb59UmWIn+5JxcWoQafoyLz/ECxhSj6QvqeEHObUCfx/nZ+gMoo8znPWe9S
	lMj+SZvrkiCx+1ZeUjjsHpBh7bpvzJlezexdVLQepC5kb1kd/bTBPSeXZS6I2AKOAY1Gn9
	KkSyMrfjdYUcf9mkAmwLP0Ow3ETEIZo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-484-f1bjXoioMVSDs39G3OhrcQ-1; Fri,
 31 Jul 2026 10:56:14 -0400
X-MC-Unique: f1bjXoioMVSDs39G3OhrcQ-1
X-Mimecast-MFC-AGG-ID: f1bjXoioMVSDs39G3OhrcQ_1785509773
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6F9C11956094;
	Fri, 31 Jul 2026 14:56:13 +0000 (UTC)
Received: from bgrech-thinkpadp1gen3.rmtustx.csb (unknown [10.2.16.27])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 819F21956089;
	Fri, 31 Jul 2026 14:56:12 +0000 (UTC)
From: Brian Grech <bgrech@redhat.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	Brian Grech <bgrech@redhat.com>
Subject: [PATCH] selftests/net: gro: use variable sleep to handle slow environments
Date: Fri, 31 Jul 2026 09:55:45 -0500
Message-ID: <20260731145545.4011291-1-bgrech@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

The server socket initialization sleep was hardcoded at 0.5 seconds.
On slow or heavily loaded machines this is insufficient, causing the
client to connect before the server is ready and producing spurious
test failures.

Respect KSFT_MACHINE_SLOW by extending the sleep to 2 seconds when
set, consistent with how other selftests handle slow environments.

Signed-off-by: Brian Grech <bgrech@redhat.com>
---
 tools/testing/selftests/net/gro.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/gro.sh b/tools/testing/selftests/net/gro.sh
index 4c5144c6f652..7c0e4434fa58 100755
--- a/tools/testing/selftests/net/gro.sh
+++ b/tools/testing/selftests/net/gro.sh
@@ -21,12 +21,14 @@ run_test() {
   # Each test is run 6 times to deflake, because given the receive timing,
   # not all packets that should coalesce will be considered in the same flow
   # on every try.
+  local sleep_time=0.5
+  [ "$KSFT_MACHINE_SLOW" = yes ] && sleep_time=2
   for tries in {1..6}; do
     # Actual test starts here
     ip netns exec $server_ns ./gro "${ARGS[@]}" "--rx" "--iface" "server" \
       1>>log.txt &
     server_pid=$!
-    sleep 0.5  # to allow for socket init
+    sleep $sleep_time  # to allow for socket init
     ip netns exec $client_ns ./gro "${ARGS[@]}" "--iface" "client" \
       1>>log.txt
     wait "${server_pid}"
-- 
2.55.0

