Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4893E383315
	for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 10:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779532720; cv=none; b=LYQuKZ1EbgDbNFlAxFBTeKWdXodi2/OPQsVegQTUf2KayWyrJDoHR4tqFOKITmXTaVmPnRkhVQfxcMb8P7igIeU1ojh6QWjhZ3uDB1QU4ey0OOLAiXeRqr6RoIV8lgqYfOMMToRh0nUYB7dP0V6dSMzsyZgVf/tmBs3Tiu+GWhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779532720; c=relaxed/simple;
	bh=S24APvAaiK9KwLovBodtVkifY85ozxogixUUakGfHrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=isaDXsDmPPDD5MsluQKgUH9urtB+1rY5swqLB+nT0+A22QDA0nSJbzYN1H7e25lIORK8Hx56yzwa50X+deCsyawHlXnUjO9iQ7sabDxKVYVnWsP+VPl+fDd6YQMZmvd7cH4uS6o81yARMjRaQCKmemz6N31Rpu+dvR9GsV7RkX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XfVKria5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lYz9djUj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nrpArJtT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZDVXrhVV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XfVKria5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lYz9djUj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nrpArJtT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZDVXrhVV"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EF15B673F3;
	Sat, 23 May 2026 10:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779532712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J7cGHvlALmM2L1ca+3qIEpJFY5IabXzr9jvvRmCKDJ4=;
	b=XfVKria5jhdPwFKlcyG1adBHSKAEhTmbDSvazESm+CL5K1u5L7aVRDXJVhrkCWzJutLKk8
	aOh4mdKi4E/gB1FjjvG5jSjMa16xu61cpahT1NrsovPQrGjMeZ+44w3eM9/Fgd2jWatswV
	ERrjTSFBlafoQwEn834NjYpaOeyHgEo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779532712;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J7cGHvlALmM2L1ca+3qIEpJFY5IabXzr9jvvRmCKDJ4=;
	b=lYz9djUjWVoTbOKAS+/6Nb3iBLOuBRBEwH+BkitWU1y1WKNB5CGGXZ2baYECXXJ933pmAQ
	U8Dp+7uVm/48sHAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779532711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J7cGHvlALmM2L1ca+3qIEpJFY5IabXzr9jvvRmCKDJ4=;
	b=nrpArJtT2gP17EDHaJwNlx21u9ZT7hKa2o8yWy1fS/yDWjkymW1sCAXKdON2H5/TO/apny
	UxyN6eBJfsRgCZmTnfI6D00/1vq7oImDXf/1SL3vqL+2CTZ19DxHcsKyfnZrhzibGQJRXW
	cVdO+mpieRc9o5KCgx73wmFFjWs3ue8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779532711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J7cGHvlALmM2L1ca+3qIEpJFY5IabXzr9jvvRmCKDJ4=;
	b=ZDVXrhVVAPHF1yJpnkTmd+hgWHKz4UC2Zi2E7jFYnMiAMWmYC89qFPZGAIeJw60n+2uhVb
	ldWRdaBF8WNhpaDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 65A37593A8;
	Sat, 23 May 2026 10:38:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uPXSFaeDEWpGXAAAD6G6ig
	(envelope-from <fmancera@suse.de>); Sat, 23 May 2026 10:38:31 +0000
From: Fernando Fernandez Mancera <fmancera@suse.de>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	horms@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	davem@davemloft.net,
	idosch@nvidia.com,
	dsahern@kernel.org,
	Fernando Fernandez Mancera <fmancera@suse.de>
Subject: [PATCH 2/2 net-next v5] selftests: fib_tests: add temporary IPv6 address renewal test
Date: Sat, 23 May 2026 12:38:11 +0200
Message-ID: <20260523103811.3790-2-fmancera@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260523103811.3790-1-fmancera@suse.de>
References: <20260523103811.3790-1-fmancera@suse.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	internal_greylist_whitelist(0.00)[10.150.64.97];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Add a test to check that temporary IPv6 address is regenerated properly
after the base prefix is deprecated and restored.

Fib6 temporary address renewal test
    TEST: IPv6 temporary address cleanly deprecated and regenerated     [ OK ]

Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
---
v2: adjusted the sleep so there is enough time for the issue to trigger,
added cleanup at the end
v3: no changes
v4: no changes
v5: no changes
---
 tools/testing/selftests/net/fib_tests.sh | 59 +++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
index af64f93bb2e1..8f10de0eb985 100755
--- a/tools/testing/selftests/net/fib_tests.sh
+++ b/tools/testing/selftests/net/fib_tests.sh
@@ -12,7 +12,7 @@ TESTS="unregister down carrier nexthop suppress ipv6_notify ipv4_notify \
        ipv4_route_metrics ipv4_route_v6_gw rp_filter ipv4_del_addr \
        ipv6_del_addr ipv4_mangle ipv6_mangle ipv4_bcast_neigh fib6_gc_test \
        ipv4_mpath_list ipv6_mpath_list ipv4_mpath_balance ipv6_mpath_balance \
-       ipv4_mpath_balance_preferred fib6_ra_to_static"
+       ipv4_mpath_balance_preferred fib6_ra_to_static fib6_temp_addr_renewal"
 
 VERBOSE=0
 PAUSE_ON_FAIL=no
@@ -1611,6 +1611,62 @@ fib6_ra_to_static()
 	cleanup &> /dev/null
 }
 
+fib6_temp_addr_renewal() {
+	setup
+
+	echo
+	echo "Fib6 temporary address renewal test"
+	set -e
+
+	# ra6 is required for the test. (ipv6toolkit)
+	if [ ! -x "$(command -v ra6)" ]; then
+	    echo "SKIP: ra6 not found."
+	    set +e
+	    cleanup &> /dev/null
+	    return
+	fi
+
+	# Create a pair of veth devices to send a RA message from one
+	# device to another.
+	$IP link add veth1 type veth peer name veth2
+	$IP link set dev veth1 up
+	$IP link set dev veth2 up
+
+	# Make veth1 ready to receive RA messages.
+	$NS_EXEC sysctl -wq net.ipv6.conf.veth1.accept_ra=2
+	$NS_EXEC sysctl -wq net.ipv6.conf.veth1.use_tempaddr=2
+	$NS_EXEC sysctl -wq net.ipv6.conf.veth1.temp_prefered_lft=15
+	$NS_EXEC sysctl -wq net.ipv6.conf.veth1.max_desync_factor=0
+
+	# Send a RA message with a prefix from veth2.
+	$NS_EXEC ra6 -i veth2 -s fe80::1 -d ff02::1 -P 2001:12::/64\#LA\#3600\#3600 -e
+	sleep 3
+
+	# Deprecate it
+	$NS_EXEC ra6 -i veth2 -s fe80::1 -d ff02::1 -P 2001:12::/64\#LA\#3600\#0 -e
+	sleep 3
+
+	# Restore it
+	$NS_EXEC ra6 -i veth2 -s fe80::1 -d ff02::1 -P 2001:12::/64\#LA\#3600\#3600 -e
+
+	ret=1
+	for i in $(seq 1 25); do
+		sleep 1
+		num_dep="$($IP -6 addr | grep -c "temporary deprecated" || true)"
+		num_tot="$($IP -6 addr | grep -c "temporary" || true)"
+
+		if [ "$num_dep" -eq 1 ] && [ "$num_tot" -ge 2 ]; then
+			ret=0
+			break
+		fi
+	done
+	log_test "$ret" 0 "IPv6 temporary address cleanly deprecated and regenerated"
+
+	set +e
+
+	cleanup &> /dev/null
+}
+
 # add route for a prefix, flushing any existing routes first
 # expected to be the first step of a test
 add_route()
@@ -3002,6 +3058,7 @@ do
 	ipv6_mpath_balance)		ipv6_mpath_balance_test;;
 	ipv4_mpath_balance_preferred)	ipv4_mpath_balance_preferred_test;;
 	fib6_ra_to_static)		fib6_ra_to_static;;
+	fib6_temp_addr_renewal)		fib6_temp_addr_renewal;;
 
 	help) echo "Test names: $TESTS"; exit 0;;
 	esac
-- 
2.53.0

